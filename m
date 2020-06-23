Content-Type: multipart/mixed; boundary="===============7684004800134006313=="
MIME-Version: 1.0
From: Quentin Perret <qperret@google.com>
To: lkp@lists.01.org
Subject: Re: [cpufreq] d83f959b5e: kmsg.cpufreq:cpufreq_online:Failed_to_initialize_policy_for_cpu:#(-#)
Date: Tue, 23 Jun 2020 10:25:36 +0100
Message-ID: <20200623092536.GA52234@google.com>
In-Reply-To: <20200622005457.GI5535@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7684004800134006313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the report.

On Monday 22 Jun 2020 at 08:54:57 (+0800), kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: d83f959b5e7a6378a4afbff23de2a2d064d95749 ("[PATCH 2/2] cpufreq: S=
pecify default governor on command line")
> url: https://github.com/0day-ci/linux/commits/Quentin-Perret/cpufreq-Spec=
ify-the-default-governor-on-command-line/20200616-005920
> base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git li=
nux-next
> =

> in testcase: kernel-selftests
> with following parameters:
> =

> 	group: kselftests-x86
> 	ucode: 0xdc
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with 1=
6G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> =

> [    8.715369] intel_pstate: Intel P-state driver initializing
> [    8.721146] cpufreq: cpufreq_online: Failed to initialize policy for c=
pu: 0 (-61)
> [    8.728900] cpufreq: cpufreq_online: Failed to initialize policy for c=
pu: 1 (-61)
> [    8.736615] cpufreq: cpufreq_online: Failed to initialize policy for c=
pu: 2 (-61)
> [    8.744400] cpufreq: cpufreq_online: Failed to initialize policy for c=
pu: 3 (-61)
> [    8.752222] cpufreq: cpufreq_online: Failed to initialize policy for c=
pu: 4 (-61)
> [    8.760010] cpufreq: cpufreq_online: Failed to initialize policy for c=
pu: 5 (-61)
> [    8.768077] cpufreq: cpufreq_online: Failed to initialize policy for c=
pu: 6 (-61)
> [    8.775891] cpufreq: cpufreq_online: Failed to initialize policy for c=
pu: 7 (-61)

That, I think, is because of the issue I reported here:

    https://lore.kernel.org/lkml/20200615174141.GA235811(a)google.com/

The v2 (to be posted shortly) will address this.

Thanks,
Quentin
--===============7684004800134006313==--

