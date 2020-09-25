Content-Type: multipart/mixed; boundary="===============9221373746936836187=="
MIME-Version: 1.0
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: lkp@lists.01.org
Subject: Re: [perf tools] 77b66fd551: perf-sanity-tests.'import_perf'_in_python.fail
Date: Fri, 25 Sep 2020 08:55:11 -0300
Message-ID: <20200925115511.GA2868146@kernel.org>
In-Reply-To: <CAM9d7cjp-R1WzEn-OOB=p=ir6=3enSKy=kxUu-MfOUwAeXVRcg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9221373746936836187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Em Thu, Sep 24, 2020 at 12:04:51PM +0900, Namhyung Kim escreveu:
> On Wed, Sep 23, 2020 at 6:15 PM kernel test robot <rong.a.chen@intel.co=
m> wrote:
> > FYI, we noticed the following commit (built with gcc-9):

> > commit: 77b66fd55195289f5361af4f8a0978a3a90b9363 ("[PATCH 3/4] perf too=
ls: Copy metric events properly when multiply cgroups")
> > url: https://github.com/0day-ci/linux/commits/Namhyung-Kim/perf-stat-Ad=
d-multiply-cgroup-option/20200908-124454
> > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 2cb5383b=
30d47c446ec7d884cd80f93ffcc31817

> > in testcase: perf-sanity-tests
> > version: perf-x86_64-34d4ddd359db-1_20200909
> > with following parameters:

> >         perf_compiler: gcc
> >         ucode: 0xdc

> > on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with=
 16G memory

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> Thanks for the report.  I'll fix it and send it in the next version.

I'm so glad this is in place, thanks to all involved!

- Arnaldo
 =

> Thanks
> Namhyung
> >
> >
> > 2020-09-23 04:43:45 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 1
> >  1: vmlinux symtab matches kallsyms                       : Ok
> > 2020-09-23 04:43:45 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 2
> >  2: Detect openat syscall event                           : Ok
> > 2020-09-23 04:43:45 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 3
> >  3: Detect openat syscall event on all cpus               : Ok
> > 2020-09-23 04:43:45 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 4
> >  4: Read samples using the mmap interface                 : Ok
> > 2020-09-23 04:43:45 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 5
> >  5: Test data source output                               : Ok
> > 2020-09-23 04:43:45 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 6
> >  6: Parse event definition strings                        : Ok
> > 2020-09-23 04:43:46 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 7
> >  7: Simple expression parser                              : Ok
> > 2020-09-23 04:43:46 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 8
> >  8: PERF_RECORD_* events & perf_sample fields             : Ok
> > 2020-09-23 04:43:48 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 9
> >  9: Parse perf pmu format                                 : Ok
> > 2020-09-23 04:43:48 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 10
> > 10: PMU events                                            :
> > 10.1: PMU event table sanity                              : Ok
> > 10.2: PMU event map aliases                               : Ok
> > 10.3: Parsing of PMU event table metrics                  : Skip (some =
metrics failed)
> > 10.4: Parsing of PMU event table metrics with fake PMUs   : Ok
> > 2020-09-23 04:43:48 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 11
> > 11: DSO data read                                         : Ok
> > 2020-09-23 04:43:48 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 12
> > 12: DSO data cache                                        : Ok
> > 2020-09-23 04:43:48 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 13
> > 13: DSO data reopen                                       : Ok
> > 2020-09-23 04:43:48 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 14
> > 14: Roundtrip evsel->name                                 : Ok
> > 2020-09-23 04:43:48 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 15
> > 15: Parse sched tracepoints fields                        : Ok
> > 2020-09-23 04:43:48 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 16
> > 16: syscalls:sys_enter_openat event fields                : Ok
> > 2020-09-23 04:43:48 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 17
> > 17: Setup struct perf_event_attr                          : Ok
> > 2020-09-23 04:43:54 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 18
> > 18: Match and link multiple hists                         : Ok
> > 2020-09-23 04:43:54 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-77b66f=
d55195289f5361af4f8a0978a3a90b9363/tools/perf/perf test 19
> > 19: 'import perf' in python                               : FAILED!
> >
> >
> >
> > To reproduce:
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp install job.yaml  # job file is attached in this email
> >         bin/lkp run     job.yaml
> >
> >
> >
> > Thanks,
> > Rong Chen
> >

-- =


- Arnaldo
--===============9221373746936836187==--

