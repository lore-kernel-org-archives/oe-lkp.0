Content-Type: multipart/mixed; boundary="===============1648582296870613483=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/platform/UV] 71854cb812: will-it-scale.per_thread_ops -2.3% regression
Date: Tue, 25 Oct 2016 12:57:00 +0200
Message-ID: <alpine.DEB.2.20.1610251251400.4990@nanos>
In-Reply-To: <20161025064647.GB3341@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1648582296870613483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Oct 2016, kernel test robot wrote:
> FYI, we noticed a -2.3% regression of will-it-scale.per_thread_ops due to=
 commit:
> =

> commit 71854cb812ec23bfe5f63d52217e6b9e6cb901f5 ("x86/platform/UV: Fix su=
pport for EFI_OLD_MEMMAP after BIOS callback updates")
> https://github.com/0day-ci/linux Alex-Thorlton/x86-platform-UV-Fix-suppor=
t-for-EFI_OLD_MEMMAP-after-BIOS-callback-updates/20161020-095215
> =

> in testcase: will-it-scale
> on test machine: 12 threads Intel(R) Core(TM) i7 CPU X 980 @ 3.33GHz with=
 6G memory

This is completely bogus. That patch does not even affect anything outside
of the SGI UV platform. And on your i7 system uv_bios_call() is definitely
not invoked.

I appreciate your effort, but posting such obviously bogus results does not
make people more confident in your testing efforts.

Thanks,

	tglx

--===============1648582296870613483==--

