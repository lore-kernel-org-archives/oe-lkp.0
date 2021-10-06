Content-Type: multipart/mixed; boundary="===============1436009342515047537=="
MIME-Version: 1.0
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/platform] d7109fe3a0: kernel-selftests.gpio.gpio-mockup.sh.fail
Date: Wed, 06 Oct 2021 18:54:41 +0300
Message-ID: <YV3GwQ68KssgPUHW@smile.fi.intel.com>
In-Reply-To: <YT4YaHTiaDibkzfK@smile.fi.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1436009342515047537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change Bart's address accordingly to last MAINTAINER update.

On Sun, Sep 12, 2021 at 06:10:32PM +0300, Andy Shevchenko wrote:
> +Cc: Bart
> =

> On Sun, Sep 12, 2021 at 11:01:58PM +0800, kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> =

> Thanks for the report.
> =

> First of all, please teach your bot to cut up things a bit. ~13k lines
> is something not expected here, really!
> =

> > commit: d7109fe3a0991a0f7b4ac099b78c908e3b619787 ("x86/platform: Increa=
se maximum GPIO number for X86_64")
> > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git x86/urgent
> > =

> > =

> > in testcase: kernel-selftests
> > version: kernel-selftests-x86_64-d0cba0d1-1_20210907
> > with following parameters:
> > =

> > 	group: group-01
> > 	ucode: 0xe2
> > =

> > test-description: The kernel contains a set of "self tests" under the t=
ools/testing/selftests/ directory. These are intended to be small unit test=
s to exercise individual code paths in the kernel.
> > test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> > =

> > =

> > on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with=
 32G memory
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> > 2021-09-10 00:58:57 make run_tests -C gpio
> > make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kself=
tests-d7109fe3a0991a0f7b4ac099b78c908e3b619787/tools/testing/selftests/gpio'
> > TAP version 13
> > 1..1
> > # selftests: gpio: gpio-mockup.sh
> > # 1.  Module load tests
> > # 1.1.  dynamic allocation of gpio
> > # 2.  Module load error tests
> > # 2.1 gpio overflow
> > # test failed: unexpected chip - gpiochip0
> > # GPIO gpio-mockup test FAIL
> > not ok 1 selftests: gpio: gpio-mockup.sh # exit=3D1
> =

> Test does the overflow check with 1024 as a parameter and comments delibe=
rately
> tells about limitation. What it should do instead is to use the actual GP=
IO
> number from the kernel configuration.

-- =

With Best Regards,
Andy Shevchenko


--===============1436009342515047537==--

