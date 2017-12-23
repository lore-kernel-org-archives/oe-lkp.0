Content-Type: multipart/mixed; boundary="===============0087799723736132702=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: 92a0f81d89 ("x86/cpu_entry_area: Move it out of the fixmap"): BUG: kernel hang in boot stage
Date: Sat, 23 Dec 2017 19:40:34 +0100
Message-ID: <alpine.DEB.2.20.1712231939070.1853@nanos>
In-Reply-To: <5a3e8fc0.twXCoyu5pJQz+3SI%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0087799723736132702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 24 Dec 2017, kernel test robot wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/pti
> =

> commit 92a0f81d89571e3e8759366e050ee05cc545ef99
> Author:     Thomas Gleixner <tglx@linutronix.de>
> AuthorDate: Wed Dec 20 18:51:31 2017 +0100
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Fri Dec 22 20:13:05 2017 +0100
> =

>     x86/cpu_entry_area: Move it out of the fixmap

Yes, I'm an idiot.

     for (; start < end; start +=3D PMD_SIZE)

which works fine when start + PMD_SIZE does not wrap around to 0 ....

Fix is on the way to git.

Thanks,

	tglx

--===============0087799723736132702==--

