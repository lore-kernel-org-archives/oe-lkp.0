Content-Type: multipart/mixed; boundary="===============7939786786850809456=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [hrtimer_active ^W ata_port_wait_eh] INFO: trying to register non-static key.
Date: Fri, 24 Nov 2017 21:41:39 +0800
Message-ID: <20171124134139.dzfbzuj7qwba4hec@wfg-t540p.sh.intel.com>
In-Reply-To: <20171124124942.GE983427@devbig577.frc2.facebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7939786786850809456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Fri, Nov 24, 2017 at 04:49:52AM -0800, Tejun Heo wrote:
>Hello,
>
>On Wed, Nov 22, 2017 at 03:37:45PM +0100, Thomas Gleixner wrote:
>> [   33.027134] ata3: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc040 ir=
q 14
>> [   33.027138] ata4: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc048 ir=
q 15
>> [   33.028426] Error: Driver 'pata_platform' is already registered, abor=
ting...
>...
>
>This looks like another fallout from CONFIG_DEBUG_TEST_DRIVER_REMOVE.
>Fengguang, that debug option is broken and triggering various spurious
>failures.  Can you please blacklist that from test configs until it's
>fixed?

Sure. I'll disable CONFIG_DEBUG_TEST_DRIVER_REMOVE for 2 months.

Thanks,
Fengguang

--===============7939786786850809456==--

