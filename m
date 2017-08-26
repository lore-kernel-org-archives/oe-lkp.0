Content-Type: multipart/mixed; boundary="===============5588929475739585792=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: a25339d553 ("x86/idt: Hide set_intr_gate()"): WARNING: CPU: 0 PID: 0 at arch/x86/kernel/idt.c:355 update_intr_gate
Date: Sat, 26 Aug 2017 16:18:08 +0200
Message-ID: <alpine.DEB.2.20.1708261617350.2093@nanos>
In-Reply-To: <59a15c3f.gHTozaAGk61PeQNz%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5588929475739585792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 26 Aug 2017, kernel test robot wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/apic
> =

> commit a25339d55320c73fd253fbf188c27abd4550d13a
> Author:     Thomas Gleixner <tglx@linutronix.de>
> AuthorDate: Thu Aug 24 16:38:36 2017 +0200
> Commit:     Thomas Gleixner <tglx@linutronix.de>
> CommitDate: Fri Aug 25 12:27:50 2017 +0200
> =

>     x86/idt: Hide set_intr_gate()

Stupid me. I inverted the logic of the test ....


--===============5588929475739585792==--

