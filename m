Content-Type: multipart/mixed; boundary="===============6215034193835997836=="
MIME-Version: 1.0
From: Yafang Shao <laoar.shao@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched.h] 317419b91e: perf-sanity-tests.Parse_sched_tracepoints_fields.fail
Date: Thu, 14 Oct 2021 22:40:04 +0800
Message-ID: <CALOAHbAhT1bTAThrmA1zYE5q8shR4dxZf5fqcq_9wVrV+XwVEQ@mail.gmail.com>
In-Reply-To: <1171592945.14099.1634219447199.JavaMail.zimbra@efficios.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6215034193835997836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 9:50 PM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> ----- On Oct 14, 2021, at 9:11 AM, Yafang Shao laoar.shao(a)gmail.com wro=
te:
>
> > On Thu, Oct 14, 2021 at 9:09 PM Mathieu Desnoyers
> > <mathieu.desnoyers@efficios.com> wrote:
> >>
> >> ----- On Oct 14, 2021, at 9:05 AM, Yafang Shao laoar.shao(a)gmail.com =
wrote:
> >> [...]
> >> >> If it happens that this ABI break is noticed by more than an in-tre=
e test
> >> >> program, then
> >> >> the kernel's ABI rules will require that this trace field size stay=
s unchanged.
> >> >> This brings
> >> >> up once more the whole topic of "Tracepoints ABI" which has been di=
scussed
> >> >> repeatedly in
> >> >> the past.
> >> >>
> >> >
> >> > I will check if any other in-tree tools depends on TASK_COMM_LEN.
> >>
> >> That's a start, but given this is a userspace ABI, out-of-tree userland
> >> tools which depend of this to be fixed-size are also relevant.
> >>
> >
> > TASK_COMM_LEN isn't defined in include/uapi/ directory, so it seems
> > that it isn't the uerspace ABI?
>
> One case where this 16 bytes size is expected by userspace is prctl(2) PR=
_GET_NAME
> and PR_SET_NAME.
>

the prctl(2) man page says that:
: PR_SET_NAME
:        If the length of the string, including the terminating
:        null byte, exceeds 16 bytes, the string is silently truncated.
: PR_GET_NAME
:         The buffer should allow space for up to 16 bytes
:          the returned string will be null-terminated.

As the string returned to user space is null-terminated, extending
task comm won't break the prctl(2) user code.

> The other case I am referring to is with ftrace and perf:
>
> mount -t tracefs nodev /sys/kernel/tracing
> cat /sys/kernel/tracing/events/sched/sched_switch/format
>
> name: sched_switch
> ID: 314
> format:
> [...]
>         field:char prev_comm[16];       offset:8;       size:16;        s=
igned:1;
> [...]
>         field:char next_comm[16];       offset:40;      size:16;        s=
igned:1;
>
> Both of those fields expose a fixed-size of 16 bytes.
>
> AFAIK Steven's intent was that by parsing this file, trace viewers could =
adapt to
> changes in the event field layout. Unfortunately, there have been cases w=
here
> trace viewers had a hard expectation on the field layout. Hopefully those=
 have
> all been fixed a while ago.
>

I don't have a clear idea what will happen to trace viewers if we
extend task comm.

Steven, do you have any suggestions ?

-- =

Thanks
Yafang
--===============6215034193835997836==--

