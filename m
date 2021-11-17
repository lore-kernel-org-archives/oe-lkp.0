Content-Type: multipart/mixed; boundary="===============8062137176718963733=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 7a7becb4d0: BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
Date: Wed, 17 Nov 2021 13:07:35 +0800
Message-ID: <20211117050734.GA25417@linux.intel.com>
In-Reply-To: <20211116102841.GQ641268@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============8062137176718963733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, Nov 16, 2021 at 02:28:41AM -0800, Paul E. McKenney wrote:
> On Tue, Nov 16, 2021 at 02:59:30PM +0800, Carel Si wrote:
> > Hi Paul,
> > =

> > On Fri, Nov 12, 2021 at 03:31:09AM -0800, Paul E. McKenney wrote:
> > > On Fri, Nov 12, 2021 at 04:06:20PM +0800, kernel test robot wrote:
> > > > =

> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed the following commit (built with gcc-9):
> > > > =

> > > > commit: 7a7becb4d01e99471523ac38adf3ed64f8be092e ("rcu-tasks:  Crea=
te per-CPU callback lists")
> > > > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git =
dev.2021.11.01a
> > > > =

> > > > in testcase: boot
> > > > =

> > > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -s=
mp 2 -m 16G
> > > > =

> > > > caused below changes (please refer to attached dmesg/kmsg for entir=
e log/backtrace):
> > > > =

> > > > =

> > > > +------------------------------------------------------------------=
-------------+------------+------------+
> > > > |                                                                  =
             | f62a1317c8 | 7a7becb4d0 |
> > > > +------------------------------------------------------------------=
-------------+------------+------------+
> > > > | boot_successes                                                   =
             | 19         | 0          |
> > > > | boot_failures                                                    =
             | 0          | 19         |
> > > > | BUG:sleeping_function_called_from_invalid_context_at_include/linu=
x/sched/mm.h | 0          | 19         |
> > > > +------------------------------------------------------------------=
-------------+------------+------------+
> > > =

> > > I have the following fixup patch in -rcu that addresses this problem
> > > for me:  cafffee599ad ("fixup! rcu-tasks:  Create per-CPU callback li=
sts").
> > > Does it fix things for you?
> > =

> > We have tested your fixup patch cafffee599 ("fixup! rcu-tasks:  Create =
per-CPU =

> > callback lists"), it can fix the issue, thanks!
> =

> Very good, and thank you for testing it!  May I apply your Tested-by
> to the resulting combined commit?
> =

> 04855da2a8a1 ("rcu-tasks:  Create per-CPU callback lists")
> =


Sure, pls use "kernel test robot" name shown as below. Thanks!

Tested-by: kernel test robot <beibei.si@intel.com>

> 							Thanx, Paul
> =

> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > compiler/kconfig/rootfs/sleep/tbox_group/testcase:
> >   gcc-9/x86_64-rhel-8.3-func/debian-i386-20191205.cgz/1/vm-snb/boot
> > =

> > commit: =

> >   f62a1317c8 ("EXP i915/gem/dmabuf: add <asm/smp.h> to fix build error"=
) >parent
> >   7a7becb4d0 ("rcu-tasks:  Create per-CPU callback lists")             =
  >fbc
> >   cafffee599 ("fixup! rcu-tasks:  Create per-CPU callback lists")      =
  >fix
> > =

> > f62a1317c8c77960 7a7becb4d01e99471523ac38adf cafffee599ad1f69cc4c242948=
4 =

> > ---------------- --------------------------- --------------------------=
- =

> >        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
> >            |             |             |             |             |    =

> >            :6          100%           6:6            0%            :6  =
   dmesg.BUG:sleeping_function_called_from_invalid_context_at_include/linux=
/sched/mm.h
> > =

> >=20
--===============8062137176718963733==--

