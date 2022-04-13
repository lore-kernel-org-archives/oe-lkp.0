Content-Type: multipart/mixed; boundary="===============5622461502597922804=="
MIME-Version: 1.0
From: Ian Rogers <irogers@google.com>
To: lkp@lists.01.org
Subject: Re: [perf vendor events] 3f5f0df7bf: perf-sanity-tests.perf_all_metrics_test.fail
Date: Wed, 13 Apr 2022 09:03:05 -0700
Message-ID: <CAP-5=fXGqODZYGu781qjEEVtGFpCQJ=dCXi5shYOAbBSt5wQkw@mail.gmail.com>
In-Reply-To: <20220413070529.GA1320@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5622461502597922804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2022 at 12:06 AM Carel Si <beibei.si@intel.com> wrote:
>
> Hi,
>
> On Fri, Mar 04, 2022 at 10:10:53AM -0800, Ian Rogers wrote:
> > On Fri, Mar 4, 2022 at 12:33 AM kernel test robot <oliver.sang@intel.=
com> wrote:
> > >
> > >
> > >
> > > Greeting,
> > >
> > > FYI, we noticed the following commit (built with gcc-9):
> > >
> > > commit: 3f5f0df7bf0f8c48d33d43454fc0b7d0f3ab9537 ("perf vendor events=
: Update metrics for Skylake")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > >
> > > in testcase: perf-sanity-tests
> > > version: perf-x86_64-fb184c4af9b9-1_20220302
> > > with following parameters:
> > >
> > >         perf_compiler: clang
> > >         ucode: 0xec
> > >
> > >
> > >
> > > on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ =
3.60GHz with 32G memory
> > >
> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> >
> > Hi,
> >
> > Thanks for the report! There is no information in the test output that
> > I can diagnose the issue with, could you add the -v option to perf
> > test so that I can see what the cause is, rather than just pass/fail.
>
> We Added '-v' option, found out that 3f5f0df7bf failed at testing
> 'Branching_Overhead' [1] and 'IpArith_Scalar_SP' [2], details attached
> in perf-sanity-tests.xz
>
> [1]
>
> Testing Branching_Overhead
> Metric 'Branching_Overhead' not printed in:
> # Running 'internals/synthesize' benchmark:
> Computing performance of single threaded perf event synthesis by
> synthesizing events on the perf process itself:
>   Average synthesis took: 459.468 usec (+- 0.265 usec)
>   Average num. events: 44.000 (+- 0.000)
>   Average time per event 10.442 usec
>   Average data synthesis took: 486.181 usec (+- 0.272 usec)
>   Average num. events: 296.000 (+- 0.000)
>   Average time per event 1.643 usec
>
>  Performance counter stats for 'perf bench internals synthesize':
>
>      <not counted>      BR_INST_RETIRED.NEAR_CALL                        =
             (0.00%)
>      <not counted>      BR_INST_RETIRED.NEAR_TAKEN                       =
              (0.00%)
>      <not counted>      BR_INST_RETIRED.NOT_TAKEN                        =
             (0.00%)
>      <not counted>      BR_INST_RETIRED.CONDITIONAL                      =
               (0.00%)
>      <not counted>      CPU_CLK_UNHALTED.THREAD                          =
             (0.00%)
>         9772951660 ns   duration_time
>
>        9.772951660 seconds time elapsed
>
>        4.343887000 seconds user
>        5.248839000 seconds sys
>
>
> Some events weren't counted. Try disabling the NMI watchdog:
>         echo 0 > /proc/sys/kernel/nmi_watchdog
>         perf stat ...
>         echo 1 > /proc/sys/kernel/nmi_watchdog

So the failure here is that the nmi_watchdog on your machine uses a
performance counter which means the group of events doesn't have
sufficient counters to compute the metric. There are a couple of known
issues here:

1) We create metric groups as weak groups, the perf_event_open should
fail for the group of events above so that then we don't group the
events. Something is wrong in the kernel PMU code meaning this isn't
happening. Perhaps Kan can take a look? I'll provide more details
below.
2) Ideally we wouldn't use a performance counter for the NMI watchdog:
https://lore.kernel.org/lkml/1558660583-28561-1-git-send-email-ricardo.neri=
-calderon(a)linux.intel.com/

We could expand the test here:
https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/tree/tools/p=
erf/tests/shell/stat_all_metrics.sh?h=3Dperf/core#n18
so that NMI watchdog failures are skip rather than fail.


Skylake group failures not breaking weak group (tested on a SkylakeX):
1) No group works:
$ perf stat -e 'BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_INS=
T_RETIRED.NOT_TAKEN,BR_INST_RETIRED.CONDITIONAL,CPU_CLK_UNHALTED.THREAD'
-a sleep 1

 Performance counter stats for 'system wide':

         7,979,997      BR_INST_RETIRED.NEAR_CALL
               (79.98%)
        45,462,860      BR_INST_RETIRED.NEAR_TAKEN
                (80.04%)
        54,698,502      BR_INST_RETIRED.NOT_TAKEN
               (80.05%)
        78,865,520      BR_INST_RETIRED.CONDITIONAL
                 (80.04%)
     1,104,280,963      CPU_CLK_UNHALTED.THREAD
               (79.89%)

       1.001761717 seconds time elapsed

2) Hard group fails:
$ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_IN=
ST_RETIRED.NOT_TAKEN,BR_INST_RETIRED.CONDITIONAL,CPU_CLK_UNHALTED.THREAD}'
-a sleep 1

 Performance counter stats for 'system wide':

     <not counted>      BR_INST_RETIRED.NEAR_CALL
               (0.00%)
     <not counted>      BR_INST_RETIRED.NEAR_TAKEN
                (0.00%)
     <not counted>      BR_INST_RETIRED.NOT_TAKEN
               (0.00%)
     <not counted>      BR_INST_RETIRED.CONDITIONAL
                 (0.00%)
     <not counted>      CPU_CLK_UNHALTED.THREAD
               (0.00%)

       1.001565418 seconds time elapsed

Some events weren't counted. Try disabling the NMI watchdog:
echo 0 > /proc/sys/kernel/nmi_watchdog
perf stat ...
echo 1 > /proc/sys/kernel/nmi_watchdog

3) Weak group doesn't fall back to no group:
$ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_IN=
ST_RETIRED.NOT_TAKEN,BR_INST_RETIRED.CONDITIONAL,CPU_CLK_UNHALTED.THREAD}:W'
-a sleep 1

 Performance counter stats for 'system wide':

     <not counted>      BR_INST_RETIRED.NEAR_CALL
               (0.00%)
     <not counted>      BR_INST_RETIRED.NEAR_TAKEN
                (0.00%)
     <not counted>      BR_INST_RETIRED.NOT_TAKEN
               (0.00%)
     <not counted>      BR_INST_RETIRED.CONDITIONAL
                 (0.00%)
     <not counted>      CPU_CLK_UNHALTED.THREAD
               (0.00%)

       1.001690318 seconds time elapsed

Some events weren't counted. Try disabling the NMI watchdog:
echo 0 > /proc/sys/kernel/nmi_watchdog
perf stat ...
echo 1 > /proc/sys/kernel/nmi_watchdog


> [2]
>
> Testing IpArith_Scalar_SP
> Metric 'IpArith_Scalar_SP' not printed in:
> # Running 'internals/synthesize' benchmark:
> Computing performance of single threaded perf event synthesis by
> synthesizing events on the perf process itself:
>   Average synthesis took: 458.601 usec (+- 0.257 usec)
>   Average num. events: 44.000 (+- 0.000)
>   Average time per event 10.423 usec
>   Average data synthesis took: 486.297 usec (+- 0.306 usec)
>   Average num. events: 296.000 (+- 0.000)
>   Average time per event 1.643 usec
>
>  Performance counter stats for 'perf bench internals synthesize':
>
>       108854260048      INST_RETIRED.ANY
>                  0      FP_ARITH_INST_RETIRED.SCALAR_SINGLE
>         9750270760 ns   duration_time
>
>        9.750270760 seconds time elapsed
>
>        4.288438000 seconds user
>        5.323337000 seconds sys

I believe this fail case is now a skip. The relevant fix was:
https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/tools=
/perf/tests/shell/stat_all_metrics.sh?h=3Dperf/core&id=3D00236a2dc8a3768fdc=
689380d2e93b96cc971bd7

Thanks,
Ian

> Thanks
>
> > At the time of filing the update I didn't have access to a Skylake
> > machine (just SkylakeX) but this test was ran as detailed in the
> > commit message:
> > https://lore.kernel.org/lkml/20220201015858.1226914-21-irogers(a)google=
.com/
> > Knowing the test, I suspect there may be a bad event on Skylake, but
> > can't confirm this because I lack the hardware and/or the test output.
> > The issue may also be how the test was run, such as not as root, not
> > in a container. There is a further issue with this test that metrics
> > (e.g. number of vector ops) that measure things that a simple
> > benchmark doesn't cause counts for can fail the test, as the test is
> > checking if the metric is reported - for example, there may be no
> > vector ops within the simple benchmark.
> >
> > Thanks,
> > Ian
> >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > >
> > >
> > >
> > > 2022-03-02 19:01:56 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func=
-3f5f0df7bf0f8c48d33d43454fc0b7d0f3ab9537/tools/perf/perf test 89
> > >  89: perf all metricgroups test                                      =
: Ok
> > > 2022-03-02 19:02:05 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func=
-3f5f0df7bf0f8c48d33d43454fc0b7d0f3ab9537/tools/perf/perf test 90
> > >  90: perf all metrics test                                           =
: FAILED!
> > > 2022-03-02 19:07:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func=
-3f5f0df7bf0f8c48d33d43454fc0b7d0f3ab9537/tools/perf/perf test 91
> > >  91: perf all PMU test                                               =
: Ok
> > >
> > >
> > >
> > > To reproduce:
> > >
> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         sudo bin/lkp install job.yaml           # job file is attache=
d in this email
> > >         bin/lkp split-job --compatible job.yaml # generate the yaml f=
ile for lkp run
> > >         sudo bin/lkp run generated-yaml-file
> > >
> > >         # if come across any failure that blocks the test,
> > >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> > >
> > >
> > >
> > > ---
> > > 0DAY/LKP+ Test Infrastructure                   Open Source Technolog=
y Center
> > > https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel C=
orporation
> > >
> > > Thanks,
> > > Oliver Sang
> > >
> > _______________________________________________
> > LKP mailing list -- lkp(a)lists.01.org
> > To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============5622461502597922804==--

