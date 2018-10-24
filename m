Content-Type: multipart/mixed; boundary="===============3171779940444896658=="
MIME-Version: 1.0
From: Patrick Bellasi <patrick.bellasi@arm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] d519329f72: unixbench.score -9.9% regression
Date: Wed, 24 Oct 2018 18:01:37 +0100
Message-ID: <20181024170137.GA13236@e110439-lin>
In-Reply-To: <20181024064100.GA27054@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3171779940444896658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 24-Oct 14:41, Aaron Lu wrote:
> On Mon, Apr 02, 2018 at 11:20:00AM +0800, Ye, Xiaolong wrote:
> > =

> > Greeting,
> > =

> > FYI, we noticed a -9.9% regression of unixbench.score due to commit:
> > =

> > =

> > commit: d519329f72a6f36bc4f2b85452640cfe583b4f81 ("sched/fair: Update u=
til_est only on util_avg updates")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > =

> > in testcase: unixbench
> > on test machine: 8 threads Intel(R) Core(TM) i7 CPU 870 @ 2.93GHz with =
6G memory
> > with following parameters:
> > =

> >         runtime: 300s
> >         nr_task: 100%
> >         test: execl
> > =

> > test-description: UnixBench is the original BYTE UNIX benchmark suite a=
ims to test performance of Unix-like system.
> > test-url: https://github.com/kdlucas/byte-unixbench

Hi Aaron,
 =

> I tested this workload on different machines with this commit
> d519329f72a6f36bc4f2b85452 and its parent a07630b8b2c16f82, I also
> tested with v4.19-rc8 to see if the regression is gone -
> the performance drop is there with v4.19-rc8 and with different
> machines so I assume this regression is not solved yet.
>
> Here are detailed data:
> =

> cmdline used to run this workload:
> ./Run execl -c $nr_cpu -i 30

I had a better look into this issue and found that something like this
could be the cure for the execl throughput regression:

---8<---
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 908c9cdae2f0..c34d41b542fc 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6258,8 +6258,17 @@ static unsigned long cpu_util_wake(int cpu, struct t=
ask_struct *p)
 	 * covered by the following code when estimated utilization is
 	 * enabled.
 	 */
-	if (sched_feat(UTIL_EST))
-		util =3D max(util, READ_ONCE(cfs_rq->avg.util_est.enqueued));
+	if (sched_feat(UTIL_EST)) {
+		unsigned int estimated =3D
+			READ_ONCE(cfs_rq->avg.util_est.enqueued);
+
+		if (unlikely(current =3D=3D p)) {
+			estimated -=3D min_t(unsigned int, estimated,
+				(_task_util_est(p) | UTIL_AVG_UNCHANGED));
+		}
+
+		util =3D max(util, estimated);
+	}

 	/*
 	 * Utilization (estimated) can exceed the CPU capacity, thus let's
---8<---

I'll test this better on a machine on my side and send out a proper
patch by tomorrow.

> Please let me know if you need other information, thanks.

Would be nice if you can test the above on your side too.

Cheers Patrick

-- =

#include <best/regards.h>

Patrick Bellasi

--===============3171779940444896658==--

