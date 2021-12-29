Content-Type: multipart/mixed; boundary="===============6376430399321034670=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [rcutorture] 82e310033d: WARNING:possible_recursive_locking_detected
Date: Wed, 29 Dec 2021 22:01:21 +0800
Message-ID: <20211229140121.GA10390@xsang-OptiPlex-9020>
In-Reply-To: <20211229000609.GY4109570@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============6376430399321034670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Paul,

On Tue, Dec 28, 2021 at 04:06:09PM -0800, Paul E. McKenney wrote:
> On Tue, Dec 28, 2021 at 11:11:35PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: 82e310033d7c21a7a88427f14e0dad78d731a5cd ("rcutorture: Enable m=
ultiple concurrent callback-flood kthreads")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > =

> > in testcase: rcutorture
> > version: =

> > with following parameters:
> > =

> > 	runtime: 300s
> > 	test: default
> > 	torture_type: rcu
> > =

> > test-description: rcutorture is rcutorture kernel module load/unload te=
st.
> > test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> > =

> > =

> > on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > +----------------------------------------------------------------------=
---------+------------+------------+
> > |                                                                      =
         | 12e885433d | 82e310033d |
> > +----------------------------------------------------------------------=
---------+------------+------------+
> > | boot_successes                                                       =
         | 95         | 47         |
> > | boot_failures                                                        =
         | 31         | 25         |
> > | invoked_oom-killer:gfp_mask=3D0x                                     =
           | 5          | 4          |
> > | Mem-Info                                                             =
         | 10         | 16         |
> > | WARNING:at_kernel/rcu/rcutorture.c:#rcutorture_oom_notify[rcutorture]=
         | 24         | 15         |
> > | EIP:rcutorture_oom_notify                                            =
         | 24         | 15         |
> > | page_allocation_failure:order:#,mode:#(GFP_NOWAIT|__GFP_COMP),nodemas=
k=3D(null) | 5          | 12         |
> > | WARNING:possible_recursive_locking_detected                          =
         | 0          | 15         |
> > | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_fwd_prog.cold[rcutort=
ure]     | 0          | 6          |
> > | EIP:rcu_torture_fwd_prog.cold                                        =
         | 0          | 6          |
> > +----------------------------------------------------------------------=
---------+------------+------------+
> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> Good catch!  Does this following patch address it?

we applied below patch upon next-20211224,
confirmed no "WARNING:possible_recursive_locking_detected" after patch.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase/torture_type:
  gcc-9/i386-randconfig-a002-20211003/debian-i386-20191205.cgz/300s/vm-snb-=
i386/default/rcutorture/rcu

commit:
  next-20211224
  917801238dcca ("rcutorture: Fix rcu_fwd_mutex deadlock")

   next-20211224 917801238dccaf61a63ffe77890
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          3:100         -1%           2:100   dmesg.BUG:sleeping_function_c=
alled_from_invalid_context_at_kernel/locking/mutex.c
          2:100         -2%            :100   dmesg.BUG:workqueue_lockup-po=
ol
          1:100         -1%            :100   dmesg.EIP:clear_user
          2:100          2%           4:100   dmesg.EIP:rcu_torture_fwd_pro=
g_cr
         15:100         -3%          12:100   dmesg.EIP:rcutorture_oom_noti=
fy
          2:100         -2%            :100   dmesg.Kernel_panic-not_syncin=
g:System_is_deadlocked_on_memory
          9:100         -5%           4:100   dmesg.Mem-Info
          2:100         -2%            :100   dmesg.Out_of_memory_and_no_ki=
llable_processes
          2:100          2%           4:100   dmesg.WARNING:at_kernel/rcu/r=
cutorture.c:#rcu_torture_fwd_prog_cr[rcutorture]
         15:100         -3%          12:100   dmesg.WARNING:at_kernel/rcu/r=
cutorture.c:#rcutorture_oom_notify[rcutorture]
         15:100        -15%            :100   dmesg.WARNING:possible_recurs=
ive_locking_detected    <--------
          3:100         -1%           2:100   dmesg.invoked_oom-killer:gfp_=
mask=3D0x
          6:100         -4%           2:100   dmesg.page_allocation_failure=
:order:#,mode:#(GFP_NOWAIT|__GFP_COMP),nodemask=3D(null)
        100:100          0%         100:100   dmesg.sysctl_table_check_fail=
ed


> =

> 							Thanx, Paul
> =

> ------------------------------------------------------------------------
> =

> commit dd47cbdcc2f72ba3df1248fb7fe210acca18d09c
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Tue Dec 28 15:59:38 2021 -0800
> =

>     rcutorture: Fix rcu_fwd_mutex deadlock
>     =

>     The rcu_torture_fwd_cb_hist() function acquires rcu_fwd_mutex, but is
>     invoked from rcutorture_oom_notify() function, which hold this same
>     mutex across this call.  This commit fixes the resulting deadlock.
>     =

>     Reported-by: kernel test robot <oliver.sang@intel.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> =

> diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> index 918a2ea34ba13..9190dce686208 100644
> --- a/kernel/rcu/rcutorture.c
> +++ b/kernel/rcu/rcutorture.c
> @@ -2184,7 +2184,6 @@ static void rcu_torture_fwd_cb_hist(struct rcu_fwd =
*rfp)
>  	for (i =3D ARRAY_SIZE(rfp->n_launders_hist) - 1; i > 0; i--)
>  		if (rfp->n_launders_hist[i].n_launders > 0)
>  			break;
> -	mutex_lock(&rcu_fwd_mutex); // Serialize histograms.
>  	pr_alert("%s: Callback-invocation histogram %d (duration %lu jiffies):",
>  		 __func__, rfp->rcu_fwd_id, jiffies - rfp->rcu_fwd_startat);
>  	gps_old =3D rfp->rcu_launder_gp_seq_start;
> @@ -2197,7 +2196,6 @@ static void rcu_torture_fwd_cb_hist(struct rcu_fwd =
*rfp)
>  		gps_old =3D gps;
>  	}
>  	pr_cont("\n");
> -	mutex_unlock(&rcu_fwd_mutex);
>  }
>  =

>  /* Callback function for continuous-flood RCU callbacks. */
> @@ -2435,7 +2433,9 @@ static void rcu_torture_fwd_prog_cr(struct rcu_fwd =
*rfp)
>  			 n_launders, n_launders_sa,
>  			 n_max_gps, n_max_cbs, cver, gps);
>  		atomic_long_add(n_max_cbs, &rcu_fwd_max_cbs);
> +		mutex_lock(&rcu_fwd_mutex); // Serialize histograms.
>  		rcu_torture_fwd_cb_hist(rfp);
> +		mutex_unlock(&rcu_fwd_mutex);
>  	}
>  	schedule_timeout_uninterruptible(HZ); /* Let CBs drain. */
>  	tick_dep_clear_task(current, TICK_DEP_BIT_RCU);
--===============6376430399321034670==--

