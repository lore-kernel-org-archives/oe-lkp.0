Content-Type: multipart/mixed; boundary="===============3860916672982426583=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/hotplug] e1056a25da: WARNING:at_arch/x86/kernel/apic/apic.c:#setup_local_APIC
Date: Fri, 21 Jun 2019 21:08:53 +0200
Message-ID: <alpine.DEB.2.21.1906212108150.5503@nanos.tec.linutronix.de>
In-Reply-To: <20190620021856.GP7221@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3860916672982426583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Jun 2019, kernel test robot wrote:

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: e1056a25daa6460c95e92d7d6853d05ad62458f7 ("x86/hotplug: Silence A=
PIC and NMI when CPU is dead")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git WIP.x86/ipi
> =

> in testcase: locktorture
> with following parameters:
> =

> 	runtime: 300s
> 	test: cpuhotplug
> =

> test-description: This torture test consists of creating a number of kern=
el threads which acquire the lock and hold it for specific amount of time, =
thus simulating different critical region behaviors.
> test-url: https://www.kernel.org/doc/Documentation/locking/locktorture.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 2G

I cannot reproduce that issue. What's the underlying hardware machine?

Thanks,

	tglx

--===============3860916672982426583==--

