Content-Type: multipart/mixed; boundary="===============7958903957939720721=="
MIME-Version: 1.0
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [serial] 4a218b277f: BUG:kernel_NULL_pointer_dereference, address
Date: Thu, 05 May 2022 13:12:07 +0300
Message-ID: <YnOi9zD44PwSODeX@smile.fi.intel.com>
In-Reply-To: <20220505091843.GD10410@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7958903957939720721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 05, 2022 at 05:18:43PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 4a218b277fdba357d8e9022ae675c94e59d64b4e ("serial: 8250: dw: Crea=
te a generic platform data structure")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: reaim
> version: reaim-x86_64-7.0.1.13-1_20220411
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 100%
> 	test: shared
> 	cpufreq_governor: performance
> 	ucode: 0xec
> =

> test-description: REAIM is an updated and improved version of AIM 7 bench=
mark.
> test-url: https://sourceforge.net/projects/re-aim-7/
> =

> =

> on test machine: 16 threads 1 sockets Intel(R) Xeon(R) E-2278G CPU @ 3.40=
GHz with 32G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +----------------+------------+------------+
> |                | d9666dfb31 | 4a218b277f |
> +----------------+------------+------------+
> | boot_successes | 6          | 6          |
> +----------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>

Isn't it what Heikki's patch should fix?

-- =

With Best Regards,
Andy Shevchenko


--===============7958903957939720721==--

