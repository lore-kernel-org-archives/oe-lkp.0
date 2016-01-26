Content-Type: multipart/mixed; boundary="===============6165801675423087966=="
MIME-Version: 1.0
From: Lawrynowicz, Jacek <jacek.lawrynowicz@intel.com>
To: lkp@lists.01.org
Subject: Re: [pci] 2910b5bdc5: pci 0000:06:00.0: Unable to allocate DMA alias mask.
Date: Tue, 26 Jan 2016 07:55:59 +0000
Message-ID: <36D38C1F74839847A52A484C31F3E51A62139F2B@irsmsx105.ger.corp.intel.com>
In-Reply-To: <878u3d6tqx.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6165801675423087966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Wow. It's very cool that you do automated tests for upcoming changes :)
This particular bug was already caught in review by Bjorn.

Regards,
Jacek

-----Original Message-----
From: kernel test robot [mailto:ying.huang(a)linux.intel.com] =

Sent: Tuesday, January 26, 2016 1:59 AM
To: Lawrynowicz, Jacek <jacek.lawrynowicz@intel.com>
Cc: lkp(a)01.org; LKML <linux-kernel@vger.kernel.org>; Joerg Roedel <jroe=
del@suse.de>; Woodhouse, David <david.woodhouse@intel.com>; Wu, Fenggua=
ng <fengguang.wu@intel.com>
Subject: [lkp] [pci] 2910b5bdc5: pci 0000:06:00.0: Unable to allocate DMA a=
lias mask.

FYI, we noticed the below changes on

https://github.com/0day-ci/linux Jacek-Lawrynowicz/pci-Add-support-for-mult=
iple-DMA-aliases/20160119-001005
commit 2910b5bdc5788de99e9c533be97b0e8f57be0386 ("pci: Add support for mult=
iple DMA aliases")

We found the following new message in kernel log after your commit.

[    0.217837] pci 0000:06:00.0: Unable to allocate DMA alias mask.

Thanks,
Ying Huang

--===============6165801675423087966==--

