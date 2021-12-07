Content-Type: multipart/mixed; boundary="===============6442452370769897825=="
MIME-Version: 1.0
From: Bae, Chang Seok <chang.seok.bae@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/signal] 3aac3ebea0: will-it-scale.per_thread_ops -11.9% regression
Date: Tue, 07 Dec 2021 22:17:25 +0000
Message-ID: <9F5B9EA8-B876-487E-AD1C-87A791154F17@intel.com>
In-Reply-To: <875ys02lv4.ffs@tglx>
List-Id: <oe-lkp.lists.linux.dev>

--===============6442452370769897825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Dec 7, 2021, at 12:36, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Tue, Dec 07 2021 at 18:49, Chang Seok Bae wrote:
>> On Dec 7, 2021, at 05:38, Thomas Gleixner <tglx@linutronix.de> wrote:
>>> =

>>> Does that use sigaltstack() ?
>> =

>> FWIW, I was also wondering about this with:
>> =

>> $ git clone https://github.com/antonblanchard/will-it-scale.git
>> $ cd will-it-scale/
>> $ git grep sigaltstack
>> $
>> =

>> But, the test seems to use python via runtest.py. And the python code has
>> sigaltstack():
>>    https://github.com/python/cpython/blob/main/Modules/faulthandler.c#L4=
54
> =

> But how does that affect the test written in C? Mysterious!

Indeed, I can only see the sigaltstack() trace via the python script. =


$ strace -f python3.7 ./runtest.py signal1 1>out 2>err
$ grep -r sigaltstack err
sigaltstack({ss_sp=3D0xe13f50, ss_flags=3D0, ss_size=3D16384}, {ss_sp=3DNUL=
L,
ss_flags=3DSS_DISABLE, ss_size=3D0}) =3D 0
=E2=80=A6

$ strace -f ./signal1_processes 1>out 2>err
$ grep -r sigaltstack err
$ strace -f ./signal1_threads 1>out 2>err
$ grep -r sigaltstack err
$

I don=E2=80=99t get how this syscall could contribute 11% degradation in th=
is test.

BTW, the current code rejects the reported instruction here:

$ python3.7 ./runtest.py signal1 295 thread 16
Usage: runtest.py <testcase>

Thanks,
Chang


--===============6442452370769897825==--

