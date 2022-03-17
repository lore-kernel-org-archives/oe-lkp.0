Content-Type: multipart/mixed; boundary="===============9058250751210085305=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fixup! EXP srcu] 7bf8d644f8: WARNING:at_kernel/rcu/srcutree.c:#process_srcu
Date: Thu, 17 Mar 2022 11:01:29 -0700
Message-ID: <20220317180129.GR4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220317071608.GB735@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============9058250751210085305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022 at 03:16:08PM +0800, Oliver Sang wrote:
> hi, Paul,
> =

> On Wed, Mar 16, 2022 at 09:53:42AM -0700, Paul E. McKenney wrote:
> > On Mon, Mar 14, 2022 at 01:38:14PM -0700, Paul E. McKenney wrote:
> > > On Sat, Mar 12, 2022 at 11:59:19PM +0800, kernel test robot wrote:
> > > > =

> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed the following commit (built with gcc-9):
> > > > =

> > > > commit: 7bf8d644f869260f63eaaedebabdd2054f59ecc4 ("fixup! EXP srcu:=
 Check for too many zero-delay srcu_reschedule() calls")
> > > > https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.20=
22.03.01a
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

> > > > =

> > > > If you fix the issue, kindly add following tag
> > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > =

> > > > =

> > > > [ 27.088275][ T42] WARNING: CPU: 1 PID: 42 at kernel/rcu/srcutree.c=
:1555 process_srcu (kernel/rcu/srcutree.c:1555 (discriminator 3)) =

> > > > [   27.089252][   T42] Modules linked in: libata(+) serio_raw i2c_p=
iix4 parport_pc(+) parport ip_tables
> > > > [   27.090253][   T42] CPU: 1 PID: 42 Comm: kworker/1:1 Not tainted=
 5.17.0-rc1-00191-g7bf8d644f869 #1
> > > > [   27.091212][   T42] Hardware name: QEMU Standard PC (i440FX + PI=
IX, 1996), BIOS 1.12.0-1 04/01/2014
> > > > [   27.092176][   T42] Workqueue: rcu_gp process_srcu
> > > > [ 27.092718][ T42] RIP: 0010:process_srcu (kernel/rcu/srcutree.c:15=
55 (discriminator 3)) =

> > > > [ 27.093653][ T42] Code: 6b f8 48 b8 00 00 00 00 00 fc ff df 48 c1 =
ea 03 80 3c 02 00 0f 85 91 02 00 00 48 8b 43 f8 31 f6 48 83 f8 32 0f 86 02 =
fe ff ff <0f> 0b e9 fb fd ff ff 4c 8d b3 58 ff ff ff 48 b8 00 00 00 00 00 fc
> > > =

> > > I had a feeling that the simple fix wasn't going to cut it, so thank =
you
> > > for finding a scenario that proves that to be the case.  Fix in progr=
ess,
> > > to be folded into the original with attribution.
> > =

> > OK, the attribution isn't quite there yet, but the squished-together
> > commit is here:
> > =

> > ea0098f19115 ("srcu: Prevent expedited GPs and blocking readers from co=
nsuming CPU")
> > =

> > Does this version behave better for you?
> =

> we tested this commit, found the issue gone.
> please be noted the issue on 7bf8d644f8 is random and ~25% rate.
> so I queued to run 100 times for this new commit, which is finally clean
> according to tests.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/kconfig/rootfs/sleep/tbox_group/testcase:
>   gcc-9/x86_64-rhel-8.3-func/debian-10.4-x86_64-20200603.cgz/1/vm-snb/boot
> =

> commit:
>   feebd043ec6b ("Revert "srcu: Avoid expedited GPs and blocking readers f=
rom consuming CPU"")
>   7bf8d644f869 ("fixup! EXP srcu: Check for too many zero-delay srcu_resc=
hedule() calls")
>   ea0098f19115 ("srcu: Prevent expedited GPs and blocking readers from co=
nsuming CPU")
> =

> feebd043ec6b9eab 7bf8d644f869260f63eaaedebab ea0098f191152c7fe3db5181a2e
> ---------------- --------------------------- ---------------------------
>        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
>            |             |             |             |             |
>            :16          25%           4:16           0%            :100  =
 dmesg.RIP:process_srcu
>            :16          25%           4:16           0%            :100  =
 dmesg.WARNING:at_kernel/rcu/srcutree.c:#process_srcu

Thank you for testing this!  Tested-by?

							Thanx, Paul
--===============9058250751210085305==--

