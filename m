Content-Type: multipart/mixed; boundary="===============7231601876235217179=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [rcutorture] 82e310033d: WARNING:possible_recursive_locking_detected
Date: Tue, 28 Dec 2021 16:06:09 -0800
Message-ID: <20211229000609.GY4109570@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211228151135.GB31268@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7231601876235217179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 28, 2021 at 11:11:35PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 82e310033d7c21a7a88427f14e0dad78d731a5cd ("rcutorture: Enable mul=
tiple concurrent callback-flood kthreads")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: rcutorture
> version: =

> with following parameters:
> =

> 	runtime: 300s
> 	test: default
> 	torture_type: rcu
> =

> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
-------+------------+------------+
> |                                                                        =
       | 12e885433d | 82e310033d |
> +------------------------------------------------------------------------=
-------+------------+------------+
> | boot_successes                                                         =
       | 95         | 47         |
> | boot_failures                                                          =
       | 31         | 25         |
> | invoked_oom-killer:gfp_mask=3D0x                                       =
         | 5          | 4          |
> | Mem-Info                                                               =
       | 10         | 16         |
> | WARNING:at_kernel/rcu/rcutorture.c:#rcutorture_oom_notify[rcutorture]  =
       | 24         | 15         |
> | EIP:rcutorture_oom_notify                                              =
       | 24         | 15         |
> | page_allocation_failure:order:#,mode:#(GFP_NOWAIT|__GFP_COMP),nodemask=
=3D(null) | 5          | 12         |
> | WARNING:possible_recursive_locking_detected                            =
       | 0          | 15         |
> | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_fwd_prog.cold[rcutortur=
e]     | 0          | 6          |
> | EIP:rcu_torture_fwd_prog.cold                                          =
       | 0          | 6          |
> +------------------------------------------------------------------------=
-------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>

Good catch!  Does this following patch address it?

							Thanx, Paul

------------------------------------------------------------------------

commit dd47cbdcc2f72ba3df1248fb7fe210acca18d09c
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Dec 28 15:59:38 2021 -0800

    rcutorture: Fix rcu_fwd_mutex deadlock
    =

    The rcu_torture_fwd_cb_hist() function acquires rcu_fwd_mutex, but is
    invoked from rcutorture_oom_notify() function, which hold this same
    mutex across this call.  This commit fixes the resulting deadlock.
    =

    Reported-by: kernel test robot <oliver.sang@intel.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 918a2ea34ba13..9190dce686208 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -2184,7 +2184,6 @@ static void rcu_torture_fwd_cb_hist(struct rcu_fwd *r=
fp)
 	for (i =3D ARRAY_SIZE(rfp->n_launders_hist) - 1; i > 0; i--)
 		if (rfp->n_launders_hist[i].n_launders > 0)
 			break;
-	mutex_lock(&rcu_fwd_mutex); // Serialize histograms.
 	pr_alert("%s: Callback-invocation histogram %d (duration %lu jiffies):",
 		 __func__, rfp->rcu_fwd_id, jiffies - rfp->rcu_fwd_startat);
 	gps_old =3D rfp->rcu_launder_gp_seq_start;
@@ -2197,7 +2196,6 @@ static void rcu_torture_fwd_cb_hist(struct rcu_fwd *r=
fp)
 		gps_old =3D gps;
 	}
 	pr_cont("\n");
-	mutex_unlock(&rcu_fwd_mutex);
 }
 =

 /* Callback function for continuous-flood RCU callbacks. */
@@ -2435,7 +2433,9 @@ static void rcu_torture_fwd_prog_cr(struct rcu_fwd *r=
fp)
 			 n_launders, n_launders_sa,
 			 n_max_gps, n_max_cbs, cver, gps);
 		atomic_long_add(n_max_cbs, &rcu_fwd_max_cbs);
+		mutex_lock(&rcu_fwd_mutex); // Serialize histograms.
 		rcu_torture_fwd_cb_hist(rfp);
+		mutex_unlock(&rcu_fwd_mutex);
 	}
 	schedule_timeout_uninterruptible(HZ); /* Let CBs drain. */
 	tick_dep_clear_task(current, TICK_DEP_BIT_RCU);
--===============7231601876235217179==--

