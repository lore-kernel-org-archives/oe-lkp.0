Content-Type: multipart/mixed; boundary="===============8103310189782363786=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [sched.h] 317419b91e: perf-sanity-tests.Parse_sched_tracepoints_fields.fail
Date: Thu, 14 Oct 2021 09:14:21 -0700
Message-ID: <202110140910.295E856@keescook>
In-Reply-To: <CALOAHbAhT1bTAThrmA1zYE5q8shR4dxZf5fqcq_9wVrV+XwVEQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8103310189782363786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 10:40:04PM +0800, Yafang Shao wrote:
> On Thu, Oct 14, 2021 at 9:50 PM Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
> >
> > ----- On Oct 14, 2021, at 9:11 AM, Yafang Shao laoar.shao(a)gmail.com w=
rote:
> >
> > > On Thu, Oct 14, 2021 at 9:09 PM Mathieu Desnoyers
> > > <mathieu.desnoyers@efficios.com> wrote:
> > >>
> > >> ----- On Oct 14, 2021, at 9:05 AM, Yafang Shao laoar.shao(a)gmail.co=
m wrote:
> > >> [...]
> > >> >> If it happens that this ABI break is noticed by more than an in-t=
ree test
> > >> >> program, then
> > >> >> the kernel's ABI rules will require that this trace field size st=
ays unchanged.
> > >> >> This brings
> > >> >> up once more the whole topic of "Tracepoints ABI" which has been =
discussed
> > >> >> repeatedly in
> > >> >> the past.
> > >> >>
> > >> >
> > >> > I will check if any other in-tree tools depends on TASK_COMM_LEN.
> > >>
> > >> That's a start, but given this is a userspace ABI, out-of-tree userl=
and
> > >> tools which depend of this to be fixed-size are also relevant.
> > >>
> > >
> > > TASK_COMM_LEN isn't defined in include/uapi/ directory, so it seems
> > > that it isn't the uerspace ABI?
> >
> > One case where this 16 bytes size is expected by userspace is prctl(2) =
PR_GET_NAME
> > and PR_SET_NAME.
> >
> =

> the prctl(2) man page says that:
> : PR_SET_NAME
> :        If the length of the string, including the terminating
> :        null byte, exceeds 16 bytes, the string is silently truncated.
> : PR_GET_NAME
> :         The buffer should allow space for up to 16 bytes
> :          the returned string will be null-terminated.
> =

> As the string returned to user space is null-terminated, extending
> task comm won't break the prctl(2) user code.

If userspace was:

	char comm[16];
	int important_values;

	...

	prctl(PR_GET_NAME, pid, comm);

the kernel will clobber "important_values", so prctl() must enforce the
old size (and terminate it correctly). It's not okay for us to expect
that userspace get recompiled -- old binaries must continue to work
correctly on kernel kernels.

        case PR_GET_NAME:
                get_task_comm(comm, me);
                if (copy_to_user((char __user *)arg2, comm, sizeof(comm)))
                        return -EFAULT;
                break;

This looks like it needs to be explicitly NUL terminated at 16 as well.

I'd say we need a TASK_COMM_LEN_V1 to use in all the old hard-coded
places.

-Kees

> =

> > The other case I am referring to is with ftrace and perf:
> >
> > mount -t tracefs nodev /sys/kernel/tracing
> > cat /sys/kernel/tracing/events/sched/sched_switch/format
> >
> > name: sched_switch
> > ID: 314
> > format:
> > [...]
> >         field:char prev_comm[16];       offset:8;       size:16;       =
 signed:1;
> > [...]
> >         field:char next_comm[16];       offset:40;      size:16;       =
 signed:1;
> >
> > Both of those fields expose a fixed-size of 16 bytes.
> >
> > AFAIK Steven's intent was that by parsing this file, trace viewers coul=
d adapt to
> > changes in the event field layout. Unfortunately, there have been cases=
 where
> > trace viewers had a hard expectation on the field layout. Hopefully tho=
se have
> > all been fixed a while ago.
> >
> =

> I don't have a clear idea what will happen to trace viewers if we
> extend task comm.
> =

> Steven, do you have any suggestions ?
> =

> -- =

> Thanks
> Yafang

-- =

Kees Cook
--===============8103310189782363786==--

