Content-Type: multipart/mixed; boundary="===============5597904798789158231=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: 8604322546 ("x86/cpu_entry_area: Move it out of the fixmap"): BUG: unable to handle kernel paging request at fffffbfff0380000
Date: Fri, 22 Dec 2017 19:07:19 +0100
Message-ID: <alpine.DEB.2.20.1712221906460.1853@nanos>
In-Reply-To: <5a3d48d7.cZDZS7rtvR4NGVD7%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5597904798789158231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 23 Dec 2017, kernel test robot wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 8604322546c0dd30dac1baa8661dbec069184184

That's a known and fixed issue. You're lagging behind today :)

--===============5597904798789158231==--

