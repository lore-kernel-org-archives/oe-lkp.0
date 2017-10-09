Content-Type: multipart/mixed; boundary="===============3465289082416912177=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [locking] 892ad5acca [ 12.849409] WARNING: bad unlock balance detected!
Date: Mon, 09 Oct 2017 16:58:43 -0700
Message-ID: <20171009235843.GR3521@linux.vnet.ibm.com>
In-Reply-To: <CA+55aFyNXitPT9vriRPyrNsVbFFpgVkkCxFSxjKBgfPm=t01dQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3465289082416912177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 04:24:25PM -0700, Linus Torvalds wrote:
> On Mon, Oct 9, 2017 at 8:55 AM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> =

> This makes no sense.
> =

> > [   12.849409] WARNING: bad unlock balance detected!
> > [   12.850157] 4.12.0-00420-g892ad5a #1 Not tainted
> > [   12.850870] -------------------------------------
> > [   12.851574] rhashtable_thra/109 is trying to release lock (rcu_preem=
pt_state) at:
> > [   12.852701] [<ffffffff811087c8>] rcu_read_unlock_special+0x3de/0x4a7
> > [   12.853707] but there are no more locks to release!

This does look like the problem where lockdep and RCU decided to stop
playing nice.  I have attached the fix below, which is that RCU replaces
its use of rt_mutex_unlock() with rt_mutex_futex_unlock(), which avoids
confusing lockdep.  I am currently set up to push this into the next
merge window, but please let me know if you would like it sooner.

> The only RCU release is in the inlined rhashtable_lookup_fast(), but
> that one looks trivially and obviously correct. It literally just does
> =

>         rcu_read_lock();
>         obj =3D rhashtable_lookup(ht, key, params);
>         rcu_read_unlock();
> =

> > [   12.864927]  rcu_read_unlock_special+0x3de/0x4a7
> > [   12.865660]  __rcu_read_unlock+0x62/0x9f
> > [   12.866262]  thread_lookup_test+0x400/0x50b
> > [   12.866911]  threadfunc+0x84f/0x8e0
> =

> .. so I'm wondering if there's something wrong in the test harness, or
> some *serious* issue that causes RCU state to do the wrong thing over
> preemption or with unlucky interrupt timing.
> =

> Because that thread_lookup_test() thing really is so trivial as to say
> the problem is not in the caller.
> =

> Adding Paul to the cc list. Was there some known problem during the
> 4.13 merge window that could have caused this?

Yes, and that change was the addition of lockdep annotations to
rt_mutex_unlock() during the v4.13 merge window.  Unfortunately, these
annotations do not understand rt_mutex_init_proxy_locked(), which is used
by RCU priority boosting.  Again, the solution is to change the release
of this lock to the non-lockdep-annotated rt_mutex_futex_unlock().
Because this lock is only ever acquired in a single kthread that is
not holding any other lock, deadlock cycles involving this mutex are
impossible (famous last words), and so we lose nothing by leaving off
the lockdep annotations (more famous last words).

> The fact that it came in with the locking merge might also just mean
> that it's a bug in the locking balance detection, presumably
> interacting badly with something else.
> =

> There *is* another email (from Sebastian Andrzej Siewior) that shows
> that same "WARNING: bad unlock balance detected", with the subject
> line "RCU boosting and lockdep are not playing nice", and that one
> blames commit cde50a67397c ("locking/rtmutex: Don't initialize lockdep
> when not required").

I believe that it was f5694788ad8d ("rt_mutex: Add lockdep annotations"),
which there is nothing wrong with other than not having updated RCU.

> Maybe this was already fixed elsewhere, but I'm not seeing any replies
> to that other email either (it was send back in mid-August).
> =

> Oh, and I see that the 0day robot also fingered that commit
> cde50a67397c in _another_ report, so it's just this one that seems to
> have oddly bisected to the locking merge. Presumably it's all the same
> thing, just in two different guises.

Anyway, the fix that informs RCU of f5694788ad8d ("rt_mutex: Add lockdep
annotations") is below.

							Thanx, Paul

------------------------------------------------------------------------

commit bcda31a2659497df39d6bedfbdf17498b4f4ac89
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Tue Sep 19 15:36:42 2017 -0700

    rcu: Suppress lockdep false-positive ->boost_mtx complaints
    =

    RCU priority boosting uses rt_mutex_init_proxy_locked() to initialize an
    rt_mutex structure in locked state held by some other task.  When that
    other task releases it, lockdep complains (quite accurately, but a bit
    uselessly) that the other task never acquired it.  This complaint can
    suppress other, more helpful, lockdep complaints, and in any case it is
    a false positive.
    =

    This commit therefore switches from rt_mutex_unlock() to
    rt_mutex_futex_unlock(), thereby avoiding the lockdep annotations.
    Of course, if lockdep ever learns about rt_mutex_init_proxy_locked(),
    addtional adjustments will be required.
    =

    Suggested-by: Peter Zijlstra <peterz@infradead.org>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
index fed95fa941e6..4428c8edb074 100644
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@ -31,11 +31,10 @@
 #include <linux/smpboot.h>
 #include <uapi/linux/sched/types.h>
 #include "../time/tick-internal.h"
+#include "../locking/rtmutex_common.h"
 =

 #ifdef CONFIG_RCU_BOOST
 =

-#include "../locking/rtmutex_common.h"
-
 /*
  * Control variables for per-CPU and per-rcu_node kthreads.  These
  * handle all flavors of RCU.
@@ -530,7 +529,7 @@ void rcu_read_unlock_special(struct task_struct *t)
 =

 		/* Unboost if we were boosted. */
 		if (IS_ENABLED(CONFIG_RCU_BOOST) && drop_boost_mutex)
-			rt_mutex_unlock(&rnp->boost_mtx);
+			rt_mutex_futex_unlock(&rnp->boost_mtx);
 =

 		/*
 		 * If this was the last task on the expedited lists,


--===============3465289082416912177==--

