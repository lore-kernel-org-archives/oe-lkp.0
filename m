Content-Type: multipart/mixed; boundary="===============1661356624892298838=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: 7457c0da02 [ 0.733186] BUG: KASAN: unknown-crash in unwind_next_frame
Date: Mon, 08 Jul 2019 19:43:18 +0300
Message-ID: <18ae1fd5-a4fb-7f3f-6ae6-cfa2b15c312b@virtuozzo.com>
In-Reply-To: <20190708105533.GH3402@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1661356624892298838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 7/8/19 1:55 PM, Peter Zijlstra wrote:
> On Mon, Jul 08, 2019 at 08:47:29AM +0800, kernel test robot wrote:



>>
>> [    0.726834] CPU: GenuineIntel Intel Core Processor (Haswell) (family:=
 0x6, model: 0x3c, stepping: 0x1)
>> [    0.728007] Spectre V2 : Spectre mitigation: kernel not compiled with=
 retpoline; no mitigation available!
>> [    0.728009] Speculative Store Bypass: Vulnerable
>> [    0.729969] MDS: Vulnerable: Clear CPU buffers attempted, no microcode
>> [    0.732269] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [    0.733186] BUG: KASAN: unknown-crash in unwind_next_frame+0x3f6/0x490
> =

> This is a bit of a puzzle; I'm not sure what KASAN is trying to tell us
> here, also isn't the unwinder expected to go off into the weeds at times
> and 'expected' to cope with that? I'm also very much unsure how the
> fingered commit would lead to this, the below splat is in a lockdep
> unwind from completely unrealted code (pageattr).
> =

> Josh, Andrey, any clues?
> =

>> [    0.734146] Read of size 8 at addr ffffffff84007db0 by task swapper/0

....
>> [    0.739959] =

>> [    0.739959] Memory state around the buggy address:
>> [    0.739959]  ffffffff84007c80: 00 00 00 00 00 00 00 00 00 00 00 00 00=
 f1 f1 f1
>> [    0.739959]  ffffffff84007d00: f1 00 00 00 00 00 00 00 00 00 f2 f2 f2=
 f3 f3 f3
>> [    0.739959] >ffffffff84007d80: f3 79 be 52 49 79 be 00 00 00 00 00 00=
 00 00 f1


This looks like KASAN's shadow memory corruption, someone somehow corrupted=
 [((0xffffffff84007d88 >> 3) + 0xdffffc0000000000), ((0xffffffff84007db0 >>=
 3) + 0xdffffc0000000000)]
which contains "79 be 52 49 79 be" now, instead of zeroes (most likely it s=
hould be zeroes).

--===============1661356624892298838==--

