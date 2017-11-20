Content-Type: multipart/mixed; boundary="===============3868769185220399611=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] 9e52fc2b50: will-it-scale.per_thread_ops -16% regression
Date: Mon, 20 Nov 2017 17:58:17 +0100
Message-ID: <87a7zgc2fq.fsf@vitty.brq.redhat.com>
In-Reply-To: <874lrlzjpo.fsf@vitty.brq.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3868769185220399611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Vitaly Kuznetsov <vkuznets@redhat.com> writes:

> But adding such complexity to the code would require a good
> justification, of course.

Sorry for necroposting, I got distracted :-(

I think I was able to reproduce the reported regression. The reproducer
is dead simple, just several threads doing malloc(128Mb)/free().

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define nthreads 16
#define nrounds 10000
#define alloc_size 128*1024*1024 /*128Mb*/

void *threadf(void *ptr)
{
	void *addr;
	int i;

	for (i =3D 0; i < nrounds; i++) {
		addr =3D malloc(alloc_size);
		if (!addr) {
			fprintf(stderr, "malloc failed\n");
			exit(1);
		}
		free(addr);
	}
}

int main(int argc, char *argv[]) {
	pthread_t thr[nthreads];
	int i;

	for (i =3D 0; i < nthreads; i++) {
		if (pthread_create(&thr[i], NULL, threadf, NULL)) {
			fprintf(stderr, "pthread_create failed\n");
			exit(1);
		}
	}

	for (i =3D 0; i < nthreads; i++) {
		if (pthread_join(thr[i], NULL)) {
			fprintf(stderr, "pthread_join failed\n");
			exit(1);
		}
	}

	return 0;
}

The average result on a 16 core host for me is:

With HAVE_RCU_TABLE_FREE (what we have now):
real	0m10.571s
user	0m0.678s
sys	0m12.813s

Without HAVE_RCU_TABLE_FREE (what we had pre-patch):
real	0m9.976s
user	0m0.824s
sys	0m10.960s

I did some investigation and I *think* this is what's going on. We have
the following call chain:

do_munmap()
  unmap_region()
    free_pgtables()
    tlb_finish_mmu()
      arch_tlb_finish_mmu()
        tlb_flush_mmu()
          tlb_flush_mmu_tlbonly()
            tlb_flush() <- IPIs on bare metal
            tlb_table_flush() <- this is added when CONFIG_HAVE_RCU_TABLE_F=
REE

tlb_table_flush() does call_rcu_sched() to free the batch but the
problem is that the batch is almost empty -- usually it has just one
entry in it (for the above example).

The following dirty hack:

--- a/mm/memory.c
+++ b/mm/memory.c
@@ -367,7 +367,10 @@ void tlb_table_flush(struct mmu_gather *tlb)
        struct mmu_table_batch **batch =3D &tlb->batch;
 =

        if (*batch) {
-               call_rcu_sched(&(*batch)->rcu, tlb_remove_table_rcu);
+               if (pv_mmu_ops.flush_tlb_others !=3D native_flush_tlb_other=
s)
+                   call_rcu_sched(&(*batch)->rcu, tlb_remove_table_rcu);
+               else
+                   tlb_remove_table_rcu(&(*batch)->rcu);
                *batch =3D NULL;
        }
 }

seems to solve the issue. However, I'm having troubles trying to
understand what would be the best move here. In case we think this
use-case needs addressing I can suggest we employ static_keys and switch
between rcu/non-rcu table free mechanisms for x86 on boot.

I'd be grateful for any thoughts/suggestions on this. Thanks!

-- =

  Vitaly

--===============3868769185220399611==--

