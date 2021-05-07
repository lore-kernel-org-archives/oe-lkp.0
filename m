Content-Type: multipart/mixed; boundary="===============4626875940488366754=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8e614d5b58: WARNING:at_kernel/time/clocksource-wdtest.c:#wdtest_func.cold
Date: Fri, 07 May 2021 10:12:59 -0700
Message-ID: <20210507171259.GA236800@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210505180312.GM975577@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============4626875940488366754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 11:03:12AM -0700, Paul E. McKenney wrote:
> On Wed, May 05, 2021 at 10:36:16PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: 8e614d5b58992e722f07de7c2426f2c44668092b ("clocksource: Provide=
 kernel module to test clocksource watchdog")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > =

> > =

> > in testcase: boot
> > =

> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 16G
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > +----------------------------------------------------------------------=
---+------------+------------+
> > |                                                                      =
   | bdbd9c673e | 8e614d5b58 |
> > +----------------------------------------------------------------------=
---+------------+------------+
> > | WARNING:at_kernel/time/clocksource-wdtest.c:#wdtest_func.cold        =
   | 0          | 11         |
> > | RIP:wdtest_func.cold                                                 =
   | 0          | 11         |
> > +----------------------------------------------------------------------=
---+------------+------------+
> =

> Might it be useful to address the lockdep issues that preceded this splat?
> =

> Leaving that aside, the system appears to still be booting.  There are
> RCU CPU stall warning messages later on, and then the system hangs more
> than six minutes while still booting, presumably due to the large number
> of self-tests and debug options enabled.
> =

> The intent is that the clocksource-wdtest tests run after boot has
> completed.  One approach would be to test it using modprobe after boot
> has completed.  In addition, the clocksource-wdtest module is not designed
> to handle CPU overload conditions, and making it do so would reduce the
> effectiveness of the test.
> =

> I suggest setting clocksource-wdtest.holdoff=3DN, where "N" is in seconds
> and is large enough that boot has completed.  Alternatively, use modprobe
> to activate this module from userspace after boot has completed.
> =

> What I do is just set CONFIG_TEST_CLOCKSOURCE_WATCHDOG=3Dy in an ordinary
> rcutorture run, if that helps.

All that aside, does the patch below help in your environment?

If so, I can adjust so that my testing gets done quickly and yours
avoids false-positive failures.

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/time/clocksource-wdtest.c b/kernel/time/clocksource-wdt=
est.c
index 01df12395c0e..0d8542f8b1d2 100644
--- a/kernel/time/clocksource-wdtest.c
+++ b/kernel/time/clocksource-wdtest.c
@@ -149,7 +149,7 @@ static int wdtest_func(void *arg)
 			s =3D ", expect clock skew";
 		pr_info("--- Watchdog with %dx error injection, %lu retries%s.\n", i, ma=
x_cswd_read_retries, s);
 		WRITE_ONCE(wdtest_ktime_read_ndelays, i);
-		schedule_timeout_uninterruptible(2 * HZ);
+		schedule_timeout_uninterruptible(60 * HZ);
 		WARN_ON_ONCE(READ_ONCE(wdtest_ktime_read_ndelays));
 		WARN_ON_ONCE((i <=3D max_cswd_read_retries) !=3D
 			     !(clocksource_wdtest_ktime.flags & CLOCK_SOURCE_UNSTABLE));
--===============4626875940488366754==--

