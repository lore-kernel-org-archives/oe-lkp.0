Content-Type: multipart/mixed; boundary="===============9199437822237824303=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: a0d14b8909 ("x86/mm, tracing: Fix CR2 corruption"): Kernel panic - not syncing: No working init found. Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.
Date: Wed, 24 Jul 2019 14:47:16 +0200
Message-ID: <alpine.DEB.2.21.1907241446150.1791@nanos.tec.linutronix.de>
In-Reply-To: <5d384f96.dD36t9B/8FDRT5y1%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9199437822237824303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Jul 2019, kernel test robot wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
> =

> commit a0d14b8909de55139b8702fe0c7e80b69763dcfb
> Author:     Peter Zijlstra <peterz@infradead.org>

Fixed by:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dx86=
/urgent&id=3Db8f70953c1251d8b16276995816a95639f598e70

Thanks,

	tglx

--===============9199437822237824303==--

