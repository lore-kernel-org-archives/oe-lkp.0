Content-Type: multipart/mixed; boundary="===============1845347947147450714=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: 915f3e3f76 ("mac80211_hwsim: Replace bogus hrtimer clockid"): BUG: kernel reboot-without-warning in test stage
Date: Tue, 05 Sep 2017 09:12:40 +0200
Message-ID: <alpine.DEB.2.20.1709050910150.1900@nanos>
In-Reply-To: <59ade247.WzhbxWeytBOa6Xu4%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1845347947147450714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Sep 2017, kernel test robot wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 915f3e3f76c05b2da93c4cc278eebc2d9219d9f4
> Author:     Thomas Gleixner <tglx@linutronix.de>
> AuthorDate: Sat Feb 25 11:27:37 2017 +0100
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Sat Feb 25 09:48:16 2017 -0800
> =

>     mac80211_hwsim: Replace bogus hrtimer clockid
>     =

>     mac80211_hwsim initializes a hrtimer with clockid CLOCK_MONOTONIC_RAW.
>     That's not supported.
>     =

>     Use CLOCK_MONOTNIC instead.

Sorry, no. That bisect is completely bogus. The commit in question merily
replaces the unsupported clockid with a valid one.

Thanks,

	tglx


--===============1845347947147450714==--

