Content-Type: multipart/mixed; boundary="===============5341802213301957993=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 758cf1496b: BUG:spinlock_bad_magic_on_CPU
Date: Thu, 17 Mar 2022 08:45:56 +0800
Message-ID: <20220317004556.GA32394@xsang-OptiPlex-9020>
In-Reply-To: <20220316170437.GJ4285@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============5341802213301957993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Paul,

On Wed, Mar 16, 2022 at 10:04:37AM -0700, Paul E. McKenney wrote:
> On Wed, Mar 16, 2022 at 02:16:28PM +0800, Oliver Sang wrote:
> > hi, Paul,
> > =

> > On Mon, Mar 14, 2022 at 07:06:53AM -0700, Paul E. McKenney wrote:
> > > On Mon, Mar 14, 2022 at 01:50:57PM +0800, kernel test robot wrote:
> > > > =

> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed the following commit (built with gcc-9):
> > > > =

> > > > commit: 758cf1496b94442c47c339b10d80cbaadf613425 ("rcu: Make UP-vac=
uous normal grace period advance sequence")
> > > > https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.20=
22.03.09a
> > > > =

> > > > in testcase: boot
> > > > =

> > > > on test machine: qemu-system-x86_64 -enable-kvm -cpu Icelake-Server=
 -smp 4 -m 16G
> > > > =

> > > > caused below changes (please refer to attached dmesg/kmsg for entir=
e log/backtrace):
> > > > =

> > > > =

> > > > +--------------------------------------+------------+------------+
> > > > |                                      | 6129c2b2dc | 758cf1496b |
> > > > +--------------------------------------+------------+------------+
> > > > | BUG:spinlock_bad_magic_on_CPU        | 0          | 16         |
> > > > | WARNING:at_init/main.c:#start_kernel | 0          | 16         |
> > > > | RIP:start_kernel                     | 0          | 16         |
> > > > +--------------------------------------+------------+------------+
> > > > =

> > > > =

> > > > If you fix the issue, kindly add following tag
> > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > =

> > > Does this fix it for you?
> > > =

> > > 67792d475181 ("fixup! rcu: Make UP-vacuous normal grace period advanc=
e sequence")
> > =

> > yes, this fixed:
> > =

> > 6129c2b2dc65abde 758cf1496b94442c47c339b10d8 67792d4751810a675c5690ce2e9
> > ---------------- --------------------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
> >            |             |             |             |             |
> >            :6          100%           6:6            0%            :20 =
   dmesg.BUG:spinlock_bad_magic_on_CPU
> >            :6          100%           6:6            0%            :20 =
   dmesg.RIP:start_kernel
> >            :6          100%           6:6            0%            :20 =
   dmesg.WARNING:at_init/main.c:#start_kernel
> =

> Very good, thank you!
> =

> May I add your Tested-by?

sure! our great pleasure :)

Tested-by: kernel test robot <oliver.sang@intel.com>

> =

> 							Thanx, Paul
>=20
--===============5341802213301957993==--

