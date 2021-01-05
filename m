Content-Type: multipart/mixed; boundary="===============1515042549321625040=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: 3cc3ef45b2: RIP:version_proc_show
Date: Tue, 05 Jan 2021 10:37:52 +0100
Message-ID: <X/QzcCw5/3xD4lgC@alley>
In-Reply-To: <20210103150323.GE30643@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1515042549321625040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun 2021-01-03 23:03:23, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 3cc3ef45b202a39814f9ce979495d4cc130c2998 ("[PATCH v2 7/7] Test so=
ftlockup")
> url: https://github.com/0day-ci/linux/commits/Petr-Mladek/watchdog-softlo=
ckup-Report-overall-time-and-some-cleanup/20201211-004447
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git a2f=
5ea9e314ba6778f885c805c921e9362ec0420
> =

> in testcase: will-it-scale
> version: will-it-scale-x86_64-b695a1b-1_20201217
> with following parameters:
> =

> 	nr_task: 16
> 	mode: thread
> 	test: dup1
> 	cpufreq_governor: performance
> 	ucode: 0x2006a08
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> =

> on test machine: 104 threads Skylake with 192G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +----------------+------------+------------+
> |                | 36cc821a5c | 3cc3ef45b2 |
> +----------------+------------+------------+
> | boot_successes | 7          | 0          |
> +----------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [   71.563905] watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [perf:25=
56]
> [   71.567713] watchdog: BUG: soft lockup - CPU#89 stuck for 26s! [perf:2=
463]
> [   71.812209] CPU: 1 PID: 2556 Comm: perf Not tainted 5.10.0-rc7-g3cc3ef=
45b202 #1
> [   71.814904]  acpi_power_meter ip_tables
> [   71.817550] Hardware name: Intel Corporation S2600BT/S2600BT, BIOS SE5=
C620.86B.1D.01.0147.121320181755 12/13/2018
> [   71.817559] RIP: 0010:version_proc_show+0x2f/0x6a

JFYI, it works as expected.

This patch is not intended for upstream. It allows to test the
rest of the patchset easily. And it causes exactly the above mentioned
softlockup.

Best Regards,
Petr
--===============1515042549321625040==--

