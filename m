Content-Type: multipart/mixed; boundary="===============0967957642968730419=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [hrtimer_active ^W ata_port_wait_eh] INFO: trying to register non-static key.
Date: Fri, 24 Nov 2017 04:49:52 -0800
Message-ID: <20171124124942.GE983427@devbig577.frc2.facebook.com>
In-Reply-To: <alpine.DEB.2.20.1711221522260.1751@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============0967957642968730419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Nov 22, 2017 at 03:37:45PM +0100, Thomas Gleixner wrote:
> [   33.027134] ata3: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc040 irq=
 14
> [   33.027138] ata4: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc048 irq=
 15
> [   33.028426] Error: Driver 'pata_platform' is already registered, abort=
ing...
...

This looks like another fallout from CONFIG_DEBUG_TEST_DRIVER_REMOVE.
Fengguang, that debug option is broken and triggering various spurious
failures.  Can you please blacklist that from test configs until it's
fixed?

Thanks.

-- =

tejun

--===============0967957642968730419==--

