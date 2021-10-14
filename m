Content-Type: multipart/mixed; boundary="===============6474625133709989120=="
MIME-Version: 1.0
From: Yafang Shao <laoar.shao@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched.h] 317419b91e: perf-sanity-tests.Parse_sched_tracepoints_fields.fail
Date: Thu, 14 Oct 2021 21:05:23 +0800
Message-ID: <CALOAHbDGH1vp7a9BYLDKCCrh-W2205O707LXNM+Yvt5tQ7Swag@mail.gmail.com>
In-Reply-To: <1529739526.13983.1634215325995.JavaMail.zimbra@efficios.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6474625133709989120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 8:42 PM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> ----- On Oct 14, 2021, at 5:24 AM, Yafang Shao laoar.shao(a)gmail.com wro=
te:
>
> > On Thu, Oct 14, 2021 at 3:08 PM kernel test robot <oliver.sang@intel.=
com> wrote:
> >>
> >>
> >>
> >> Greeting,
> >>
> >> FYI, we noticed the following commit (built with gcc-9):
> >>
> >> commit: 317419b91ef4eff4e2f046088201e4dc4065caa0 ("[PATCH v3 3/4] sche=
d.h:
> >> extend task comm from 16 to 24 for CONFIG_BASE_FULL")
> >> url:
> >> https://github.com/0day-ci/linux/commits/Yafang-Shao/task_struct-exten=
d-task-comm-from-16-to-24-for-CONFIG_BASE_FULL/20211010-182548
> >> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
> >> 7fd2bf83d59a2d32e0d596c5d3e623b9a0e7e2d5
> >>
> >> in testcase: perf-sanity-tests
> >> version: perf-x86_64-7fd2bf83d59a-1_20211010
> >> with following parameters:
> >>
> >>         perf_compiler: clang
> >>         ucode: 0xde
> >>
> >>
> >>
> >> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3=
.60GHz
> >> with 32G memory
> >>
> >> caused below changes (please refer to attached dmesg/kmsg for entire
> >> log/backtrace):
> >>
> >>
> >>
> >>
> >> If you fix the issue, kindly add following tag
> >> Reported-by: kernel test robot <oliver.sang@intel.com>
> >>
> >> 2021-10-13 18:00:46 sudo
> >> /usr/src/perf_selftests-x86_64-rhel-8.3-317419b91ef4eff4e2f046088201e4=
dc4065caa0/tools/perf/perf
> >> test 13
> >> 13: DSO data reopen                                                 : =
Ok
> >> 2021-10-13 18:00:46 sudo
> >> /usr/src/perf_selftests-x86_64-rhel-8.3-317419b91ef4eff4e2f046088201e4=
dc4065caa0/tools/perf/perf
> >> test 14
> >> 14: Roundtrip evsel->name                                           : =
Ok
> >> 2021-10-13 18:00:46 sudo
> >> /usr/src/perf_selftests-x86_64-rhel-8.3-317419b91ef4eff4e2f046088201e4=
dc4065caa0/tools/perf/perf
> >> test 15
> >> 15: Parse sched tracepoints fields                                  : =
FAILED!
> >
> >
> > That issue is caused by another hardcode 16 ...
> >
> > Seems we should make some change as below,
> >
> > diff --git a/tools/perf/tests/evsel-tp-sched.c
> > b/tools/perf/tests/evsel-tp-sched.c
> > index f9e34bd26cf3..401a737b1d85 100644
> > --- a/tools/perf/tests/evsel-tp-sched.c
> > +++ b/tools/perf/tests/evsel-tp-sched.c
> > @@ -42,7 +42,7 @@ int test__perf_evsel__tp_sched_test(struct test
> > *test __maybe_unused, int subtes
> >                return -1;
> >        }
> >
> > -       if (evsel__test_field(evsel, "prev_comm", 16, false))
> > +       if (evsel__test_field(evsel, "prev_comm", TASK_COMM_LEN, false))
>
> tools/perf/tests/* contains userspace test programs. This means it gets t=
he
> TASK_COMM_LEN from the uapi. The fix you propose won't do any good here.
>
> ftrace and perf access a description of the sched_switch tracepoint prev_=
comm field
> from tracefs and store it into their respective traces. The size of this =
field is
> derived from the kernel's TASK_COMM_LEN, which is changed by the patch tr=
iggering this
> failure. Therefore, if we strictly consider the field layout as ABI, this=
 is an ABI break.
> However, if we consider that trace viewers should adapt to the changes in=
 described event
> field layout, then we should tweak this test program to accept larger val=
ues of prev_comm
> field size.
>

I have verfied that perf works well after this change.
It seems that perf can adapt to this change.
So we can tweak this test program.

> A simple solution would be to tweak this test program so it can adapt to =
the size
> change, and then figure out if any other relevant program out there notic=
e the break.

The other in-tree tools bpf uses the TASK_COMM_LEN as well, but it
doesn't require the fixed-size of task comm,
if task comm is larger than 16, it will be truncated, see also
bpf_get_current_comm().
IOW, this change doesn't break the bpf tools.

> If it happens that this ABI break is noticed by more than an in-tree test=
 program, then
> the kernel's ABI rules will require that this trace field size stays unch=
anged. This brings
> up once more the whole topic of "Tracepoints ABI" which has been discusse=
d repeatedly in
> the past.
>

I will check if any other in-tree tools depends on TASK_COMM_LEN.

> In short, because TRACE_EVENT exposes the tracepoint layout as ABI, if an=
y trace viewer out
> there expects a fixed-size prev_comm field for the sched_switch event, it=
s size cannot be
> changed.
>

Thanks for the explanation.

>
> >                ret =3D -1;
> >
> >        if (evsel__test_field(evsel, "prev_pid", 4, true))
> > @@ -54,7 +54,7 @@ int test__perf_evsel__tp_sched_test(struct test
> > *test __maybe_unused, int subtes
> >        if (evsel__test_field(evsel, "prev_state", sizeof(long), true))
> >                ret =3D -1;
> >
> > -       if (evsel__test_field(evsel, "next_comm", 16, false))
> > +       if (evsel__test_field(evsel, "next_comm", TASK_COMM_LEN, false))
> >                ret =3D -1;
> >
> >        if (evsel__test_field(evsel, "next_pid", 4, true))
> > @@ -72,7 +72,7 @@ int test__perf_evsel__tp_sched_test(struct test
> > *test __maybe_unused, int subtes
> >                return -1;
> >        }
> >
> > -       if (evsel__test_field(evsel, "comm", 16, false))
> > +       if (evsel__test_field(evsel, "comm", TASK_COMM_LEN, false))
> >                ret =3D -1;
> >
> >        if (evsel__test_field(evsel, "pid", 4, true))
> >
> >
> >> 2021-10-13 18:00:46 sudo
> >> /usr/src/perf_selftests-x86_64-rhel-8.3-317419b91ef4eff4e2f046088201e4=
dc4065caa0/tools/perf/perf
> >> test 16
> >> 16: syscalls:sys_enter_openat event fields                          : =
Ok
> >>
> >>
> >>
> >> To reproduce:
> >>
> >>         git clone https://github.com/intel/lkp-tests.git
> >>         cd lkp-tests
> >>         sudo bin/lkp install job.yaml           # job file is attached=
 in this email
> >>         bin/lkp split-job --compatible job.yaml # generate the yaml fi=
le for lkp run
> >>         sudo bin/lkp run generated-yaml-file
> >>
> >>         # if come across any failure that blocks the test,
> >>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> >>
> >>
> >>
> >> ---
> >> 0DAY/LKP+ Test Infrastructure                   Open Source Technology=
 Center
> >> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Co=
rporation
> >>
> >> Thanks,
> >> Oliver Sang
> >>
> >
> >
> > --
> > Thanks
> > Yafang
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com



-- =

Thanks
Yafang
--===============6474625133709989120==--

