Content-Type: multipart/mixed; boundary="===============7629806579933003312=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [y2038] 412c53a680: will-it-scale.per_process_ops 11.7% improvement
Date: Mon, 20 Apr 2020 18:36:43 +0800
Message-ID: <20200420103643.GC46370@shbuild999.sh.intel.com>
In-Reply-To: <20200305195317.771bd8fd1f308172d26a51fe@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7629806579933003312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, Mar 05, 2020 at 07:53:17PM -0800, Andrew Morton wrote:
> On Thu, 5 Mar 2020 14:21:38 +0800 kernel test robot <rong.a.chen@intel.=
com> wrote:
> =

> > FYI, we noticed a 11.7% improvement of will-it-scale.per_process_ops du=
e to commit:
> > =

> > =

> > commit: 412c53a680a97cb1ae2c0ab60230e193bee86387 ("y2038: remove unused=
 time32 interfaces")
> =

> That patch merely removed unused code!

Sorry for the late response.

Yes, we've seen similar cases for this exact micro benchmark before,
that commit is about cpu idle driver which has no direct relation
with mmap at all. https://lkml.org/lkml/2019/9/17/966

The reason could be the changed address and cache alignment of
kernel data and code, which has been discussed for other
micro-benchmarsk, like https://lkml.org/lkml/2020/2/5/238

But for this test for mmap, we found very high lock contention for
the spinlock of per-cpu counter "vm_committed_as", the perf data is: =


    94.14%     0.35%  [kernel.kallsyms]         [k] _raw_spin_lock_irqsave =
                     -      -            =

48.21% _raw_spin_lock_irqsave;percpu_counter_add_batch;__vm_enough_memory;m=
map_region;do_mmap;vm_mmap_pgoff;ksys_mmap_pgoff;do_syscall_64;entry_SYSCAL=
L_64_after_hwframe;mmap64
45.91% _raw_spin_lock_irqsave;percpu_counter_add_batch;__do_munmap;__vm_mun=
map;__x64_sys_munmap;do_syscall_64;entry_SYSCALL_64_after_hwframe;munmap

I think the lock contention is only necessary for accuracy of
"vm_committed_as" when overcommit policy is OVERCOMMIT_NEVER.

And with the following debug patch, the benchmark score could be
bumped to 8X~20X, and the delta caused by this "year 2038" commit
is reduced to 2%, delta for the cpuidle commit is reduced to 0.
Which means the micro benchmark is much stabler.
(the debug patch sitll has some problems)

Thanks,
Feng

--------------------------------------------
mm: util: Reduce spinlock usage for vm !OVERCOMMIT_NEVER policy

When debugging a will-it-scale performance regression we found
about 94% cpu cycles are used on
	_raw_spin_lock_irqsave <-- percpu_counter_add_batch
which is for "vm_committed_as" inside vm_acct_memory().

Actually this heavy lock contention is not always necessary. The
spinlock is only used when percpu_counter_add_batch() needs to be
very precise(needs a small batch number), while only when the vm
overcommit policy is OVERCOMMIT_NEVER, the "vm_committed_as" is
really used with high precision for sanity checking.

So adjust the batch number according to vm commit policy, to
reduce the lock contention for non OVERCOMMIT_NEVER cases.

Benchmark with the same mmap case [1] on Cascade Lake sever (48C/96T)
and Knights Mill (72C/288T) shows 1400%~2400%(10X-20X) performance
gain.

Todo: adjust the other 2 possible places which use "vm_committed_as",
one is /proc/meminfo, the other is HyperV ballon driver.

Signed-off-by: Feng Tang <feng.tang@intel.com>
---
 include/linux/mman.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/mman.h b/include/linux/mman.h
index 4b08e9c..04d20d9 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -65,7 +65,15 @@ unsigned long vm_memory_committed(void);
 =

 static inline void vm_acct_memory(long pages)
 {
-	percpu_counter_add_batch(&vm_committed_as, pages, vm_committed_as_batch);
+	s32 batch =3D vm_committed_as_batch;
+
+	/* choose the batch number according to vm overcommit policy */
+	if (sysctl_overcommit_memory =3D=3D OVERCOMMIT_ALWAYS)
+		batch =3D totalram_pages() >> 6;
+	else if (sysctl_overcommit_memory =3D=3D OVERCOMMIT_GUESS)
+		batch =3D totalram_pages() >> 8;
+
+	percpu_counter_add_batch(&vm_committed_as, pages, batch);
 }
 =

 static inline void vm_unacct_memory(long pages)
-- =

2.7.4

--===============7629806579933003312==--

