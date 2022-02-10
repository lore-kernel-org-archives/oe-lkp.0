Content-Type: multipart/mixed; boundary="===============8410816839104081363=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [EXP rcutorture] cd7bd64af5: BUG:workqueue_lockup-pool
Date: Thu, 10 Feb 2022 15:25:08 +0800
Message-ID: <20220210072508.GC4074@xsang-OptiPlex-9020>
In-Reply-To: <20220204152045.GV4285@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============8410816839104081363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Paul,

On Fri, Feb 04, 2022 at 07:20:45AM -0800, Paul E. McKenney wrote:
> On Fri, Feb 04, 2022 at 09:40:23PM +0800, kernel test robot wrote:
> > =

> > +--------------------------------------------------+------------+------=
------+
> > |                                                  | dd896a86ae | cd7bd=
64af5 |
> > +--------------------------------------------------+------------+------=
------+
> > | boot_failures                                    | 0          | 12   =
      |
> > | BUG:workqueue_lockup-pool                        | 0          | 12   =
      |
> > | INFO:task_blocked_for_more_than#seconds          | 0          | 12   =
      |
> > | Kernel_panic-not_syncing:hung_task:blocked_tasks | 0          | 12   =
      |
> > +--------------------------------------------------+------------+------=
------+
> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> A number of bugs were fixed in the new version at 25c0b105b7ba ("EXP rcu:
> Add polled expedited grace-period primitives"), perhaps even including
> this one.  Could you please check this newer commit?

yes, by this commit, the issue gone:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/runtime/tbox_group/test/testcase/torture_type:
  gcc-9/i386-randconfig-a004-20211220/debian-i386-20191205.cgz/300s/vm-snb-=
i386/default/rcutorture/rcu

commit:
  cd7bd64af59f ("EXP rcutorture: Test polled expedited grace-period primiti=
ves")
  25c0b105b7ba ("EXP rcu: Add polled expedited grace-period primitives")

cd7bd64af59fd15e 25c0b105b7bad6a057569d19744
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          6:6         -100%            :20    last_state.is_incomplete_run
          6:6         -100%            :20    last_state.running
          6:6         -100%            :20    dmesg.BUG:workqueue_lockup-po=
ol
          6:6         -100%            :20    dmesg.INFO:task_blocked_for_m=
ore_than#seconds
          6:6         -100%            :20    dmesg.Kernel_panic-not_syncin=
g:hung_task:blocked_tasks
          6:6         -100%            :20    dmesg.boot_failures
           :6          333%          20:20    rcutorture.rcu.pass

> =

> 							Thanx, Paul
>=20
--===============8410816839104081363==--

