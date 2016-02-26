Content-Type: multipart/mixed; boundary="===============5396003975001187805=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: lkp@lists.01.org
Subject: Re: [ALSA: mts64] 94a573500d: BUG: unable to handle kernel NULL pointer dereference at 0000000000000010
Date: Fri, 26 Feb 2016 10:44:33 +0100
Message-ID: <s5hfuwf956m.wl-tiwai@suse.de>
In-Reply-To: <56cf3c7c.NzVqHtXY/wbM6VT3%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5396003975001187805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Feb 2016 18:40:12 +0100,
kernel test robot wrote:
> =

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 94a573500d48e780e5b23d307d6e6b05e6af7d2a
> Author:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> AuthorDate: Mon Feb 22 18:52:08 2016 +0530
> Commit:     Takashi Iwai <tiwai@suse.de>
> CommitDate: Mon Feb 22 15:01:43 2016 +0100
> =

>     ALSA: mts64: use new parport device model

Good that this could be caught with kvm.  This wasn't a problem
because parport_claim() was called later in the previous code.  Now
parport_claim() is called at the early stage, so it gets an irq before
actually registering.

We may defer the parport_claim() call after creating the private
object and setting up rawmidi, or add some check in the interrupt
handler.

The same problem must be present in portman2x4, too.

Sudip, care to fix these?


thanks,

Takashi

--===============5396003975001187805==--

