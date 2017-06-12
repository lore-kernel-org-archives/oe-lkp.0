Content-Type: multipart/mixed; boundary="===============0263777519313420920=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [posix] 91d57bae08: WARNING:at_kernel/time/hrtimer.c:#hrtimer_forward
Date: Mon, 12 Jun 2017 10:42:25 +0200
Message-ID: <alpine.DEB.2.20.1706121041110.1911@nanos>
In-Reply-To: <20170609104457.GA39907@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0263777519313420920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Jun 2017, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 91d57bae08689199c8acc77a8b3b41150cafab1c ("posix-timers: Make use=
 of forward/remaining callbacks")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: syzkaller
> with following parameters:
> =

> 	cpufreq_governor: performance
> 	repro_program: repro-d1aff78d.exe

Sigh. I have no clue what repro-d1aff78d.exe is. Could you please provide
the source for this?

Thanks,

	tglx


--===============0263777519313420920==--

