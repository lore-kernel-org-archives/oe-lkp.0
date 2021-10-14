Content-Type: multipart/mixed; boundary="===============0760255159845995242=="
MIME-Version: 1.0
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: lkp@lists.01.org
Subject: Re: [sched.h] 317419b91e: perf-sanity-tests.Parse_sched_tracepoints_fields.fail
Date: Thu, 14 Oct 2021 08:42:05 -0400
Message-ID: <1529739526.13983.1634215325995.JavaMail.zimbra@efficios.com>
In-Reply-To: <CALOAHbD540exB5DDfB8DDh8WXvsag9JsdMmC0yxriWMaoAVfOg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0760255159845995242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

----- On Oct 14, 2021, at 5:24 AM, Yafang Shao laoar.shao(a)gmail.com wrote:

> On Thu, Oct 14, 2021 at 3:08 PM kernel test robot <oliver.sang@intel.co=
m> wrote:
>>
>>
>>
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: 317419b91ef4eff4e2f046088201e4dc4065caa0 ("[PATCH v3 3/4] sched.=
h:
>> extend task comm from 16 to 24 for CONFIG_BASE_FULL")
>> url:
>> https://github.com/0day-ci/linux/commits/Yafang-Shao/task_struct-extend-=
task-comm-from-16-to-24-for-CONFIG_BASE_FULL/20211010-182548
>> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
>> 7fd2bf83d59a2d32e0d596c5d3e623b9a0e7e2d5
>>
>> in testcase: perf-sanity-tests
>> version: perf-x86_64-7fd2bf83d59a-1_20211010
>> with following parameters:
>>
>>         perf_compiler: clang
>>         ucode: 0xde
>>
>>
>>
>> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.6=
0GHz
>> with 32G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire
>> log/backtrace):
>>
>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>
>> 2021-10-13 18:00:46 sudo
>> /usr/src/perf_selftests-x86_64-rhel-8.3-317419b91ef4eff4e2f046088201e4dc=
4065caa0/tools/perf/perf
>> test 13
>> 13: DSO data reopen                                                 : Ok
>> 2021-10-13 18:00:46 sudo
>> /usr/src/perf_selftests-x86_64-rhel-8.3-317419b91ef4eff4e2f046088201e4dc=
4065caa0/tools/perf/perf
>> test 14
>> 14: Roundtrip evsel->name                                           : Ok
>> 2021-10-13 18:00:46 sudo
>> /usr/src/perf_selftests-x86_64-rhel-8.3-317419b91ef4eff4e2f046088201e4dc=
4065caa0/tools/perf/perf
>> test 15
>> 15: Parse sched tracepoints fields                                  : FA=
ILED!
> =

> =

> That issue is caused by another hardcode 16 ...
> =

> Seems we should make some change as below,
> =

> diff --git a/tools/perf/tests/evsel-tp-sched.c
> b/tools/perf/tests/evsel-tp-sched.c
> index f9e34bd26cf3..401a737b1d85 100644
> --- a/tools/perf/tests/evsel-tp-sched.c
> +++ b/tools/perf/tests/evsel-tp-sched.c
> @@ -42,7 +42,7 @@ int test__perf_evsel__tp_sched_test(struct test
> *test __maybe_unused, int subtes
>                return -1;
>        }
> =

> -       if (evsel__test_field(evsel, "prev_comm", 16, false))
> +       if (evsel__test_field(evsel, "prev_comm", TASK_COMM_LEN, false))

tools/perf/tests/* contains userspace test programs. This means it gets the
TASK_COMM_LEN from the uapi. The fix you propose won't do any good here.

ftrace and perf access a description of the sched_switch tracepoint prev_co=
mm field
from tracefs and store it into their respective traces. The size of this fi=
eld is
derived from the kernel's TASK_COMM_LEN, which is changed by the patch trig=
gering this
failure. Therefore, if we strictly consider the field layout as ABI, this i=
s an ABI break.
However, if we consider that trace viewers should adapt to the changes in d=
escribed event
field layout, then we should tweak this test program to accept larger value=
s of prev_comm
field size.

A simple solution would be to tweak this test program so it can adapt to th=
e size
change, and then figure out if any other relevant program out there notice =
the break.
If it happens that this ABI break is noticed by more than an in-tree test p=
rogram, then
the kernel's ABI rules will require that this trace field size stays unchan=
ged. This brings
up once more the whole topic of "Tracepoints ABI" which has been discussed =
repeatedly in
the past.

In short, because TRACE_EVENT exposes the tracepoint layout as ABI, if any =
trace viewer out
there expects a fixed-size prev_comm field for the sched_switch event, its =
size cannot be
changed.

Thanks,

Mathieu

>                ret =3D -1;
> =

>        if (evsel__test_field(evsel, "prev_pid", 4, true))
> @@ -54,7 +54,7 @@ int test__perf_evsel__tp_sched_test(struct test
> *test __maybe_unused, int subtes
>        if (evsel__test_field(evsel, "prev_state", sizeof(long), true))
>                ret =3D -1;
> =

> -       if (evsel__test_field(evsel, "next_comm", 16, false))
> +       if (evsel__test_field(evsel, "next_comm", TASK_COMM_LEN, false))
>                ret =3D -1;
> =

>        if (evsel__test_field(evsel, "next_pid", 4, true))
> @@ -72,7 +72,7 @@ int test__perf_evsel__tp_sched_test(struct test
> *test __maybe_unused, int subtes
>                return -1;
>        }
> =

> -       if (evsel__test_field(evsel, "comm", 16, false))
> +       if (evsel__test_field(evsel, "comm", TASK_COMM_LEN, false))
>                ret =3D -1;
> =

>        if (evsel__test_field(evsel, "pid", 4, true))
> =

> =

>> 2021-10-13 18:00:46 sudo
>> /usr/src/perf_selftests-x86_64-rhel-8.3-317419b91ef4eff4e2f046088201e4dc=
4065caa0/tools/perf/perf
>> test 16
>> 16: syscalls:sys_enter_openat event fields                          : Ok
>>
>>
>>
>> To reproduce:
>>
>>         git clone https://github.com/intel/lkp-tests.git
>>         cd lkp-tests
>>         sudo bin/lkp install job.yaml           # job file is attached i=
n this email
>>         bin/lkp split-job --compatible job.yaml # generate the yaml file=
 for lkp run
>>         sudo bin/lkp run generated-yaml-file
>>
>>         # if come across any failure that blocks the test,
>>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>>
>>
>>
>> ---
>> 0DAY/LKP+ Test Infrastructure                   Open Source Technology C=
enter
>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corp=
oration
>>
>> Thanks,
>> Oliver Sang
>>
> =

> =

> --
> Thanks
> Yafang

-- =

Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
--===============0760255159845995242==--

