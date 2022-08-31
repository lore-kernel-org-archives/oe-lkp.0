Content-Type: multipart/mixed; boundary="===============9119612282160478587=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [rcutorture] 613b00fbe6: WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_fwd_prog_cr[rcutorture]
Date: Wed, 31 Aug 2022 03:57:07 -0700
Message-ID: <20220831105707.GJ6159@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <YuqOqJnNzmEDKRIB@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============9119612282160478587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 03, 2022 at 11:05:12PM +0800, kernel test robot wrote:
> =

> (please be noted we reported this since clean on parent, ~10% on this com=
mit,
> and found similar issue on latest maineline, e.g. v5.19)
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 613b00fbe64461f1c73e035e07c22cf3de65740b ("rcutorture: Add abilit=
y to limit callback-flood intensity")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: rcutorture
> version: =

> with following parameters:
> =

> 	runtime: 300s
> 	test: default
> 	torture_type: tasks-tracing
> =

> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G

I believe that this commit in -rcu fixes this problem.  Could you please
check it?

							Thanx, Paul

------------------------------------------------------------------------

commit dba268ff32101559cd3e3800b24993ae5c59844c
Author: Zqiang <qiang1.zhang@intel.com>
Date:   Sun Jul 31 18:53:56 2022 +0800

    rcutorture: Use the barrier operation specified by cur_ops
    =

    The rcutorture_oom_notify() function unconditionally invokes
    rcu_barrier(), which is OK when the rcutorture.torture_type value is
    "rcu", but unhelpful otherwise.  The purpose of these barrier calls is =
to
    wait for all outstanding callback-flooding callbacks to be invoked befo=
re
    cleaning up their data.  Using the wrong barrier function therefore
    risks arbitrary memory corruption.  Thus, this commit changes these
    rcu_barrier() calls into cur_ops->cb_barrier() to make things work when
    torturing non-vanilla flavors of RCU.
    =

    Signed-off-by: Zqiang <qiang1.zhang@intel.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 7168dc8d61e98..bdd630f7a970c 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -2603,12 +2603,12 @@ static int rcutorture_oom_notify(struct notifier_bl=
ock *self,
 	for (i =3D 0; i < fwd_progress; i++)
 		ncbs +=3D rcu_torture_fwd_prog_cbfree(&rfp[i]);
 	pr_info("%s: Freed %lu RCU callbacks.\n", __func__, ncbs);
-	rcu_barrier();
+	cur_ops->cb_barrier();
 	ncbs =3D 0;
 	for (i =3D 0; i < fwd_progress; i++)
 		ncbs +=3D rcu_torture_fwd_prog_cbfree(&rfp[i]);
 	pr_info("%s: Freed %lu RCU callbacks.\n", __func__, ncbs);
-	rcu_barrier();
+	cur_ops->cb_barrier();
 	ncbs =3D 0;
 	for (i =3D 0; i < fwd_progress; i++)
 		ncbs +=3D rcu_torture_fwd_prog_cbfree(&rfp[i]);
--===============9119612282160478587==--

