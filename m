Content-Type: multipart/mixed; boundary="===============6514198178124482310=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86] a75a3f6fc9 Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Fri, 17 Feb 2017 22:12:36 -0800
Message-ID: <CALCETrUXw4BEMksCm1meENW_2kAhRaOqCNTfrORCR38UXVij0w@mail.gmail.com>
In-Reply-To: <20170218054253.umjj5ckbw4cscvrd@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6514198178124482310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2017 at 9:42 PM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Greetings,
>
> FYI here is an old bug, however is still active in mainline kernel.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>

> [    3.185986] init[1] vsyscall attempted with vsyscall=3Dnone ip:fffffff=
fff600400 cs:33 sp:7ffe878ff8b8 ax:ffffffffff600400 si:7f2c3de62a4c di:7ffe=
878ff978

I don't know what's up with the bisection, but I think this is a
configuration problem in your test setup.  You've configured with:

CONFIG_LEGACY_VSYSCALL_NONE=3Dy

which is not valid when you're running binaries that are compiled with
as old a glibc as you're using.  *Dynamic* glibc binaries have been
fine for a long time, but static glibc binaried (e.g. your init, I
presume) need a glibc that's only a couple years old.

You could fix it by either disallowing that particular configuration
or by updating your distro.

--Andy

--===============6514198178124482310==--

