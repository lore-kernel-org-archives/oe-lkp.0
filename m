Content-Type: multipart/mixed; boundary="===============0444078871719914763=="
MIME-Version: 1.0
From: Ian Rogers <irogers@google.com>
To: lkp@lists.01.org
Subject: Re: [perf vendor events] 3f5f0df7bf: perf-sanity-tests.perf_all_metrics_test.fail
Date: Fri, 04 Mar 2022 10:10:53 -0800
Message-ID: <CAP-5=fVz=arWo19PQR_4UKY_PyywyXoyp+MUnfAJxCFZy5rhWg@mail.gmail.com>
In-Reply-To: <20220304083329.GC20556@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0444078871719914763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 4, 2022 at 12:33 AM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 3f5f0df7bf0f8c48d33d43454fc0b7d0f3ab9537 ("perf vendor events: Up=
date metrics for Skylake")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: perf-sanity-tests
> version: perf-x86_64-fb184c4af9b9-1_20220302
> with following parameters:
>
>         perf_compiler: clang
>         ucode: 0xec
>
>
>
> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60=
GHz with 32G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Hi,

Thanks for the report! There is no information in the test output that
I can diagnose the issue with, could you add the -v option to perf
test so that I can see what the cause is, rather than just pass/fail.
At the time of filing the update I didn't have access to a Skylake
machine (just SkylakeX) but this test was ran as detailed in the
commit message:
https://lore.kernel.org/lkml/20220201015858.1226914-21-irogers(a)google.com/
Knowing the test, I suspect there may be a bad event on Skylake, but
can't confirm this because I lack the hardware and/or the test output.
The issue may also be how the test was run, such as not as root, not
in a container. There is a further issue with this test that metrics
(e.g. number of vector ops) that measure things that a simple
benchmark doesn't cause counts for can fail the test, as the test is
checking if the metric is reported - for example, there may be no
vector ops within the simple benchmark.

Thanks,
Ian

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
>
> 2022-03-02 19:01:56 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-3f5=
f0df7bf0f8c48d33d43454fc0b7d0f3ab9537/tools/perf/perf test 89
>  89: perf all metricgroups test                                      : Ok
> 2022-03-02 19:02:05 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-3f5=
f0df7bf0f8c48d33d43454fc0b7d0f3ab9537/tools/perf/perf test 90
>  90: perf all metrics test                                           : FA=
ILED!
> 2022-03-02 19:07:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-3f5=
f0df7bf0f8c48d33d43454fc0b7d0f3ab9537/tools/perf/perf test 91
>  91: perf all PMU test                                               : Ok
>
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
>
> Thanks,
> Oliver Sang
>
--===============0444078871719914763==--

