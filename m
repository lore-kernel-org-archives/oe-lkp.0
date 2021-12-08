Content-Type: multipart/mixed; boundary="===============5478522703224546604=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/signal] 3aac3ebea0: will-it-scale.per_thread_ops -11.9% regression
Date: Wed, 08 Dec 2021 08:59:13 +0800
Message-ID: <5bcb714f-371f-2f8d-cdf6-1736e3ae0aea@intel.com>
In-Reply-To: <9F5B9EA8-B876-487E-AD1C-87A791154F17@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5478522703224546604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/8/2021 6:17 AM, Bae, Chang Seok wrote:
> On Dec 7, 2021, at 12:36, Thomas Gleixner <tglx@linutronix.de> wrote:
>> On Tue, Dec 07 2021 at 18:49, Chang Seok Bae wrote:
>>> On Dec 7, 2021, at 05:38, Thomas Gleixner <tglx@linutronix.de> wrote:
>>>>
>>>> Does that use sigaltstack() ?
>>>
>>> FWIW, I was also wondering about this with:
>>>
>>> $ git clone https://github.com/antonblanchard/will-it-scale.git
>>> $ cd will-it-scale/
>>> $ git grep sigaltstack
>>> $
>>>
>>> But, the test seems to use python via runtest.py. And the python code h=
as
>>> sigaltstack():
>>>    https://github.com/python/cpython/blob/main/Modules/faulthandler.c#L=
454
>>
>> But how does that affect the test written in C? Mysterious!
> =

> Indeed, I can only see the sigaltstack() trace via the python script. =

> =

> $ strace -f python3.7 ./runtest.py signal1 1>out 2>err
> $ grep -r sigaltstack err
> sigaltstack({ss_sp=3D0xe13f50, ss_flags=3D0, ss_size=3D16384}, {ss_sp=3DN=
ULL,
> ss_flags=3DSS_DISABLE, ss_size=3D0}) =3D 0
> =E2=80=A6
> =

> $ strace -f ./signal1_processes 1>out 2>err
> $ grep -r sigaltstack err
> $ strace -f ./signal1_threads 1>out 2>err
> $ grep -r sigaltstack err
> $

Here is what I got:

>From the strace output, we could see:
[pid 3171703] rt_sigreturn({mask=3D[]})   =3D 0


Code in kernel:
SYSCALL_DEFINE0(rt_sigreturn)
  restore_altstack
    do_sigaltstack
      sigaltstack_lock


And this matches the perf callstack in the report:

      0.00            +6.3        6.33 =C2=B1  8%  perf-profile.calltrace.c=
ycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.do_sigaltstack=
.restore_altstack.__x64_sys_rt_sigreturn

The rt_sigreturn was set as signal action restorer by libc during sigaction=
 call. Thanks.

Regards
Yin, Fengwei      =


> =

> I don=E2=80=99t get how this syscall could contribute 11% degradation in =
this test.
> =

> BTW, the current code rejects the reported instruction here:
> =

> $ python3.7 ./runtest.py signal1 295 thread 16
> Usage: runtest.py <testcase>
> =

> Thanks,
> Chang
>=20
--===============5478522703224546604==--

