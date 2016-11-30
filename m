Content-Type: multipart/mixed; boundary="===============1598603906128591368=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] e7c1db75fe: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Wed, 30 Nov 2016 08:16:02 +0100
Message-ID: <20161130071602.GA18432@dhcp22.suse.cz>
In-Reply-To: <20161129191448.GD3924@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1598603906128591368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 29-11-16 11:14:48, Paul E. McKenney wrote:
> On Tue, Nov 29, 2016 at 05:21:19PM +0000, Sudeep Holla wrote:
> > On Sun, Nov 27, 2016 at 6:16 PM, kernel test robot
> > <xiaolong.ye@intel.com> wrote:
> > >
> > > FYI, we noticed the following commit:
> > >
> > > commit e7c1db75fed821a961ce1ca2b602b08e75de0cd8 ("mm: Prevent __alloc=
_pages_nodemask() RCU CPU stall warnings")
> > > https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git=
 rcu/next
> > >
> > > in testcase: boot
> > >
> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu Nehalem -smp 2 -=
m 1G
> > >
> > > caused below changes:
> > >
> > [...]
> > =

> > > [    8.953192] BUG: sleeping function called from invalid context at =
mm/page_alloc.c:3746
> > > [    8.956353] in_atomic(): 1, irqs_disabled(): 1, pid: 0, name: swap=
per/0
> > =

> > I am observing similar BUG/backtrace even on ARM64 platform.
> =

> Does the (untested) patch below help?
> =

> 							Thanx, Paul
> =

> ------------------------------------------------------------------------
> =

> commit ccc0666e2049e5818c236e647cf20c552a7b053b
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Tue Nov 29 11:06:05 2016 -0800
> =

>     rcu: Allow boot-time use of cond_resched_rcu_qs()
>     =

>     The cond_resched_rcu_qs() macro is used to force RCU quiescent states=
 into
>     long-running in-kernel loops.  However, some of these loops can execu=
te
>     during early boot when interrupts are disabled, and during which time
>     it is therefore illegal to enter the scheduler.  This commit therefore
>     makes cond_resched_rcu_qs() be a no-op during early boot.
>     =

>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

This is not the problem with your "mm: Prevent __alloc_pages_nodemask()
RCU CPU stall warnings", though. The main problem imho is that the
allocator might be called from the atomic contexts (aka
gfp_mask & ~__GFP_DIRECT_RECLAIM). Besides that I do not think that any
variant of cond_resched inside the allocator hot path
__alloc_pages_nodemask is just wrong. If anything such a scheduling/RCU
point should be added to the slow path. But as I've said earlier we
already have these points in that path so new ones shouldn't be really
necessary.

Could you drop this patch Paul, please?

-- =

Michal Hocko
SUSE Labs

--===============1598603906128591368==--

