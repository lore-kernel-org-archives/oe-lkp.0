Content-Type: multipart/mixed; boundary="===============3227655846089733095=="
MIME-Version: 1.0
From: Yinghai Lu <yinghai@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PCI] c0d1a185278: EDAC sbridge: Couldn't enable 8086:6fa0
Date: Tue, 14 Jul 2015 12:00:47 -0700
Message-ID: <CAE9FiQUa_gK=NsUehCjKs=r7FfAqAj2J3aE_JXBRkPtBXkRSKg@mail.gmail.com>
In-Reply-To: <1436879588.1264.11.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3227655846089733095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2015 at 6:13 AM, Huang Ying <ying.huang@intel.com> wrote:
> FYI, we noticed the below changes on
>
> git://internal_merge_and_test_tree revert-c0d1a18527806a3938e76a0e648cae6=
90510b6a3-c0d1a18527806a3938e76a0e648cae690510b6a3
> commit c0d1a18527806a3938e76a0e648cae690510b6a3 ("PCI: Don't set flags to=
 0 when assign resource fail")
>
>
> [   30.350859] EDAC sbridge: Seeking for: PCI ID 8086:6fa0
> [   30.350867] sbridge_edac 0000:ff:12.0: can't enable device: BAR 1 [mem=
 size 0x00000010 disabled] not assigned
> [   30.350867] EDAC sbridge: Couldn't enable 8086:6fa0
> [   30.350901] EDAC sbridge: Some needed devices are missing
> [   30.350904] EDAC sbridge: Couldn't find mci handler
>

Hi Ying,

I updated the branch, it should fix the problem.

Can you test that again ?

BTW, there should be BIOS problem with it.

[    4.144987] pci 0000:ff:12.0: [8086:6fa0] type 00 class 0x088000
[    4.151702] pci 0000:ff:12.0: reg 0x14: [mem 0x00000000-0x0000000f]
[    4.158703] pci 0000:ff:12.0: reg 0x18: [mem 0x00000000-0x0000003f]
[    4.165705] pci 0000:ff:12.0: reg 0x1c: [mem 0x00000000-0x0000000f]
[    4.172706] pci 0000:ff:12.0: reg 0x20: [mem 0x00000000-0x0000003f]
[    4.179708] pci 0000:ff:12.0: reg 0x24: [mem 0x00000000-0x0000000f]
[    4.186739] pci 0000:ff:12.1: [8086:6f30] type 00 class 0x110100
[    4.193493] pci 0000:ff:12.4: [8086:6f60] type 00 class 0x088000
[    4.200208] pci 0000:ff:12.4: reg 0x14: [mem 0x00000000-0x0000000f]
[    4.207210] pci 0000:ff:12.4: reg 0x18: [mem 0x00000000-0x0000003f]
[    4.214212] pci 0000:ff:12.4: reg 0x1c: [mem 0x00000000-0x0000000f]
[    4.221214] pci 0000:ff:12.4: reg 0x20: [mem 0x00000000-0x0000003f]
[    4.228215] pci 0000:ff:12.4: reg 0x24: [mem 0x00000000-0x0000000f]

but for bios 0xff, there is no _CRS mmio.


also
[    4.876484] pci 0000:7f:1e.3: [Firmware Bug]: reg 0x10: invalid BAR
(can't size)
so it has silicon problem ?

Thanks

Yinghai

--===============3227655846089733095==--

