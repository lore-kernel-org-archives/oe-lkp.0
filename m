Content-Type: multipart/mixed; boundary="===============5915039617917851459=="
MIME-Version: 1.0
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: lkp@lists.01.org
Subject: Re: [sched.h] 317419b91e: perf-sanity-tests.Parse_sched_tracepoints_fields.fail
Date: Thu, 14 Oct 2021 09:09:09 -0400
Message-ID: <173454728.14036.1634216949862.JavaMail.zimbra@efficios.com>
In-Reply-To: <CALOAHbDGH1vp7a9BYLDKCCrh-W2205O707LXNM+Yvt5tQ7Swag@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5915039617917851459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

----- On Oct 14, 2021, at 9:05 AM, Yafang Shao laoar.shao(a)gmail.com wrote:
[...]
>> If it happens that this ABI break is noticed by more than an in-tree test
>> program, then
>> the kernel's ABI rules will require that this trace field size stays unc=
hanged.
>> This brings
>> up once more the whole topic of "Tracepoints ABI" which has been discuss=
ed
>> repeatedly in
>> the past.
>>
> =

> I will check if any other in-tree tools depends on TASK_COMM_LEN.

That's a start, but given this is a userspace ABI, out-of-tree userland
tools which depend of this to be fixed-size are also relevant.

Thanks,

Mathieu

-- =

Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
--===============5915039617917851459==--

