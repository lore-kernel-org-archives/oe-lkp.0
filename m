Content-Type: multipart/mixed; boundary="===============8922195084582929429=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [sched.h] 317419b91e: perf-sanity-tests.Parse_sched_tracepoints_fields.fail
Date: Thu, 14 Oct 2021 10:48:11 -0400
Message-ID: <20211014104811.356e11ae@gandalf.local.home>
In-Reply-To: <CALOAHbAhT1bTAThrmA1zYE5q8shR4dxZf5fqcq_9wVrV+XwVEQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8922195084582929429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Oct 2021 22:40:04 +0800
Yafang Shao <laoar.shao@gmail.com> wrote:

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
> >  =

> =

> I don't have a clear idea what will happen to trace viewers if we
> extend task comm.

There shouldn't be any doing a hard coded read of the events. That happened
once with powertop, but they broke when they ran 32 bit userspace on a 64
bit kernel, and they switched to libtraceevent to fix it. Which handles
these updates.

> =

> Steven, do you have any suggestions ?

The "Don't break user space" is a "tree in the forest" argument. We break
user space all the time. But if no user space tool is around to hear it,
did it really break? The answer is "no".

-- Steve
--===============8922195084582929429==--

