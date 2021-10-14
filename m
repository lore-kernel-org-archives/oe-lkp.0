Content-Type: multipart/mixed; boundary="===============7252769500247388224=="
MIME-Version: 1.0
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: lkp@lists.01.org
Subject: Re: [sched.h] 317419b91e: perf-sanity-tests.Parse_sched_tracepoints_fields.fail
Date: Thu, 14 Oct 2021 09:50:47 -0400
Message-ID: <1171592945.14099.1634219447199.JavaMail.zimbra@efficios.com>
In-Reply-To: <CALOAHbBTxLvuiuT4tT2_7C+jaXBoh0uTjzLRm+njO4tKxCtPwg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7252769500247388224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

----- On Oct 14, 2021, at 9:11 AM, Yafang Shao laoar.shao(a)gmail.com wrote:

> On Thu, Oct 14, 2021 at 9:09 PM Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
>>
>> ----- On Oct 14, 2021, at 9:05 AM, Yafang Shao laoar.shao(a)gmail.com wr=
ote:
>> [...]
>> >> If it happens that this ABI break is noticed by more than an in-tree =
test
>> >> program, then
>> >> the kernel's ABI rules will require that this trace field size stays =
unchanged.
>> >> This brings
>> >> up once more the whole topic of "Tracepoints ABI" which has been disc=
ussed
>> >> repeatedly in
>> >> the past.
>> >>
>> >
>> > I will check if any other in-tree tools depends on TASK_COMM_LEN.
>>
>> That's a start, but given this is a userspace ABI, out-of-tree userland
>> tools which depend of this to be fixed-size are also relevant.
>>
> =

> TASK_COMM_LEN isn't defined in include/uapi/ directory, so it seems
> that it isn't the uerspace ABI?

One case where this 16 bytes size is expected by userspace is prctl(2) PR_G=
ET_NAME
and PR_SET_NAME.

The other case I am referring to is with ftrace and perf:

mount -t tracefs nodev /sys/kernel/tracing
cat /sys/kernel/tracing/events/sched/sched_switch/format

name: sched_switch
ID: 314
format:
[...]
	field:char prev_comm[16];	offset:8;	size:16;	signed:1;
[...]
	field:char next_comm[16];	offset:40;	size:16;	signed:1;

Both of those fields expose a fixed-size of 16 bytes.

AFAIK Steven's intent was that by parsing this file, trace viewers could ad=
apt to
changes in the event field layout. Unfortunately, there have been cases whe=
re
trace viewers had a hard expectation on the field layout. Hopefully those h=
ave
all been fixed a while ago.

Thanks,

Mathieu


> =

> =

> --
> Thanks
> Yafang

-- =

Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
--===============7252769500247388224==--

