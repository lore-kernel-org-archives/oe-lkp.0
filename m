Content-Type: multipart/mixed; boundary="===============7226108772303714935=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86] a75a3f6fc9 Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Sat, 18 Feb 2017 14:34:11 +0800
Message-ID: <20170218063411.exttwkwmjmtayqwm@wfg-t540p.sh.intel.com>
In-Reply-To: <CALCETrUXw4BEMksCm1meENW_2kAhRaOqCNTfrORCR38UXVij0w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7226108772303714935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, Feb 17, 2017 at 10:12:36PM -0800, Andy Lutomirski wrote:
>On Fri, Feb 17, 2017 at 9:42 PM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
>> Greetings,
>>
>> FYI here is an old bug, however is still active in mainline kernel.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>
>
>> [    3.185986] init[1] vsyscall attempted with vsyscall=3Dnone ip:ffffff=
ffff600400 cs:33 sp:7ffe878ff8b8 ax:ffffffffff600400 si:7f2c3de62a4c di:7ff=
e878ff978
>
>I don't know what's up with the bisection, but I think this is a
>configuration problem in your test setup.  You've configured with:
>
>CONFIG_LEGACY_VSYSCALL_NONE=3Dy
>
>which is not valid when you're running binaries that are compiled with
>as old a glibc as you're using.  *Dynamic* glibc binaries have been
>fine for a long time, but static glibc binaried (e.g. your init, I
>presume) need a glibc that's only a couple years old.
>
>You could fix it by either disallowing that particular configuration
>or by updating your distro.

OK, I'll disable that configuration since I'm running various
tiny/large modern/legacy OS images (yocto, openwrt, ubuntu, debian,
RHEL) for doing kernel tests.

Regards,
Fengguang

--===============7226108772303714935==--

