Content-Type: multipart/mixed; boundary="===============7546854163201196479=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8e614d5b58: WARNING:at_kernel/time/clocksource-wdtest.c:#wdtest_func.cold
Date: Tue, 25 May 2021 14:03:00 -0700
Message-ID: <20210525210300.GU4441@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210525073655.GE7744@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7546854163201196479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 03:36:55PM +0800, Oliver Sang wrote:
> hi Paul,
> =

> On Fri, May 07, 2021 at 10:12:59AM -0700, Paul E. McKenney wrote:
> > On Wed, May 05, 2021 at 11:03:12AM -0700, Paul E. McKenney wrote:
> > > On Wed, May 05, 2021 at 10:36:16PM +0800, kernel test robot wrote:
> > > > =

> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed the following commit (built with gcc-9):
> > > > =

> > > > commit: 8e614d5b58992e722f07de7c2426f2c44668092b ("clocksource: Pro=
vide kernel module to test clocksource watchdog")
> > > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git ma=
ster
> > > > =

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
-------+------------+------------+
> > > > |                                                                  =
       | bdbd9c673e | 8e614d5b58 |
> > > > +------------------------------------------------------------------=
-------+------------+------------+
> > > > | WARNING:at_kernel/time/clocksource-wdtest.c:#wdtest_func.cold    =
       | 0          | 11         |
> > > > | RIP:wdtest_func.cold                                             =
       | 0          | 11         |
> > > > +------------------------------------------------------------------=
-------+------------+------------+
> > > =

> > > Might it be useful to address the lockdep issues that preceded this s=
plat?
> > > =

> > > Leaving that aside, the system appears to still be booting.  There are
> > > RCU CPU stall warning messages later on, and then the system hangs mo=
re
> > > than six minutes while still booting, presumably due to the large num=
ber
> > > of self-tests and debug options enabled.
> > > =

> > > The intent is that the clocksource-wdtest tests run after boot has
> > > completed.  One approach would be to test it using modprobe after boot
> > > has completed.  In addition, the clocksource-wdtest module is not des=
igned
> > > to handle CPU overload conditions, and making it do so would reduce t=
he
> > > effectiveness of the test.
> > > =

> > > I suggest setting clocksource-wdtest.holdoff=3DN, where "N" is in sec=
onds
> > > and is large enough that boot has completed.  Alternatively, use modp=
robe
> > > to activate this module from userspace after boot has completed.
> > > =

> > > What I do is just set CONFIG_TEST_CLOCKSOURCE_WATCHDOG=3Dy in an ordi=
nary
> > > rcutorture run, if that helps.
> > =

> > All that aside, does the patch below help in your environment?
> =

> sorry for late.
> I applied below patch to f4c6b34ee1 ("clocksource: Provide kernel module =
to test clocksource watchdog")
> still found the issue on both f4c6b34ee1 and patched kernel.
> =

> attached dmesg.xz FYI

Hey, I had to ask, and thank you for testing this.

If I am reading dmesg.xz correctly, the system is still in the process
of booting on a single CPU, and thus the watchdog might be being delayed
for a very long time.  I was hoping that waiting a minute would suffice,
but apparently not.

My next suggestion is to wait until the system boots, then use "modprobe
clocksource-wdtest" to run the test from a shell.  Or to test it via
rcutorture, as discussed earlier.

Other thoughts?

							Thanx, Paul

> [  157.028293] ------------[ cut here ]------------
> [  157.031055] WARNING: CPU: 0 PID: 207 at kernel/time/clocksource-wdtest=
.c:154 wdtest_func.cold+0x6a/0x117
> [  157.034366] Modules linked in:
> [  157.036812] CPU: 0 PID: 207 Comm: wdtest Tainted: G S      W         5=
.13.0-rc1-00006-g2aaf396b0698 #1
> [  157.040112] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  157.043283] EIP: wdtest_func.cold+0x6a/0x117
> [  157.045833] Code: 00 69 55 00 a1 24 eb ea da 83 c4 10 85 c0 74 02 0f 0=
b a1 04 32 9a d9 39 1d b0 0f 9a d9 0f 93 c1 83 e0 40 0f 94 c2 38 d1 74 02 <=
0f> 0
> b 85 c0 74 32 b8 c0 31 9a d9 e8 ca d7 3a fb b8 19 00 00 00 c7
> [  157.052700] EAX: 00000040 EBX: 00000000 ECX: 00000001 EDX: 00000000
> [  157.055738] ESI: d8abf847 EDI: d8abf836 EBP: c680ff84 ESP: c680ff78
> [  157.058770] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010=
202
> [  157.061854] CR0: 80050033 CR2: 00000000 CR3: 1a780000 CR4: 000406d0
> [  157.064864] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [  157.067797] DR6: fffe0ff0 DR7: 00000400
> [  157.070414] Call Trace:
> [  157.072676]  kthread+0xf6/0x140
> [  157.074915]  ? wdtest_ktime_read+0x80/0x80
> [  157.077140]  ? kthread_insert_work_sanity_check+0x60/0x60
> [  157.079472]  ret_from_fork+0x1c/0x28
> [  157.081558] irq event stamp: 533
> [  157.083404] hardirqs last  enabled at (541): [<d19c60e5>] console_unlo=
ck+0x4c5/0x600
> [  157.085717] hardirqs last disabled at (550): [<d19c6055>] console_unlo=
ck+0x435/0x600
> [  157.087921] softirqs last  enabled at (368): [<d6bb1ff0>] __do_softirq=
+0x2f0/0x44b
> [  157.090071] softirqs last disabled at (567): [<d18ce2a5>] call_on_stac=
k+0x45/0x60
> [  157.092111] ---[ end trace 0b325ef1942d2bda ]---
> =

> =

> > =

> > If so, I can adjust so that my testing gets done quickly and yours
> > avoids false-positive failures.
> > =

> > 							Thanx, Paul
> > =

> > ------------------------------------------------------------------------
> > =

> > diff --git a/kernel/time/clocksource-wdtest.c b/kernel/time/clocksource=
-wdtest.c
> > index 01df12395c0e..0d8542f8b1d2 100644
> > --- a/kernel/time/clocksource-wdtest.c
> > +++ b/kernel/time/clocksource-wdtest.c
> > @@ -149,7 +149,7 @@ static int wdtest_func(void *arg)
> >  			s =3D ", expect clock skew";
> >  		pr_info("--- Watchdog with %dx error injection, %lu retries%s.\n", i=
, max_cswd_read_retries, s);
> >  		WRITE_ONCE(wdtest_ktime_read_ndelays, i);
> > -		schedule_timeout_uninterruptible(2 * HZ);
> > +		schedule_timeout_uninterruptible(60 * HZ);
> >  		WARN_ON_ONCE(READ_ONCE(wdtest_ktime_read_ndelays));
> >  		WARN_ON_ONCE((i <=3D max_cswd_read_retries) !=3D
> >  			     !(clocksource_wdtest_ktime.flags & CLOCK_SOURCE_UNSTABLE));


--===============7546854163201196479==--

