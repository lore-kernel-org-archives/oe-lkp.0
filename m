Content-Type: multipart/mixed; boundary="===============4919284375541178560=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [EXP rcutorture] cd7bd64af5: BUG:workqueue_lockup-pool
Date: Thu, 10 Feb 2022 06:33:24 -0800
Message-ID: <20220210143324.GJ4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220210072508.GC4074@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4919284375541178560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2022 at 03:25:08PM +0800, Oliver Sang wrote:
> hi Paul,
> =

> On Fri, Feb 04, 2022 at 07:20:45AM -0800, Paul E. McKenney wrote:
> > On Fri, Feb 04, 2022 at 09:40:23PM +0800, kernel test robot wrote:
> > > =

> > > +--------------------------------------------------+------------+----=
--------+
> > > |                                                  | dd896a86ae | cd7=
bd64af5 |
> > > +--------------------------------------------------+------------+----=
--------+
> > > | boot_failures                                    | 0          | 12 =
        |
> > > | BUG:workqueue_lockup-pool                        | 0          | 12 =
        |
> > > | INFO:task_blocked_for_more_than#seconds          | 0          | 12 =
        |
> > > | Kernel_panic-not_syncing:hung_task:blocked_tasks | 0          | 12 =
        |
> > > +--------------------------------------------------+------------+----=
--------+
> > > =

> > > =

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > A number of bugs were fixed in the new version at 25c0b105b7ba ("EXP rc=
u:
> > Add polled expedited grace-period primitives"), perhaps even including
> > this one.  Could you please check this newer commit?
> =

> yes, by this commit, the issue gone:

Very good, and thank you for trying this out!  May I add your
Tested-by?

							Thanx, Paul

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/kconfig/rootfs/runtime/tbox_group/test/testcase/torture_type:
>   gcc-9/i386-randconfig-a004-20211220/debian-i386-20191205.cgz/300s/vm-sn=
b-i386/default/rcutorture/rcu
> =

> commit:
>   cd7bd64af59f ("EXP rcutorture: Test polled expedited grace-period primi=
tives")
>   25c0b105b7ba ("EXP rcu: Add polled expedited grace-period primitives")
> =

> cd7bd64af59fd15e 25c0b105b7bad6a057569d19744
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>           6:6         -100%            :20    last_state.is_incomplete_run
>           6:6         -100%            :20    last_state.running
>           6:6         -100%            :20    dmesg.BUG:workqueue_lockup-=
pool
>           6:6         -100%            :20    dmesg.INFO:task_blocked_for=
_more_than#seconds
>           6:6         -100%            :20    dmesg.Kernel_panic-not_sync=
ing:hung_task:blocked_tasks
>           6:6         -100%            :20    dmesg.boot_failures
>            :6          333%          20:20    rcutorture.rcu.pass
> =

> > =

> > 							Thanx, Paul
> >=20
--===============4919284375541178560==--

