Content-Type: multipart/mixed; boundary="===============5353155456156181711=="
MIME-Version: 1.0
From: Barret Rhoden <brho@google.com>
To: lkp@lists.01.org
Subject: Re: [iommu/vt] c9ac3b69cf: WARNING:at_drivers/iommu/intel-iommu.c:#dmar_parse_one_rmrr
Date: Mon, 03 Feb 2020 11:02:12 -0500
Message-ID: <abfc90f3-1b2a-9784-e688-209913c1d9a4@google.com>
In-Reply-To: <20200203091023.GH12867@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5353155456156181711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi -

On 2/3/20 4:10 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: c9ac3b69cfdbc46a0504fa353b5126827e4b0bdb ("iommu/vt-d: skip RMRR =
entries that fail the sanity check")
> https://github.com/0day-ci/linux/commits/Barret-Rhoden/iommu-vt-d-bad-RMR=
R-workarounds/20200109-051817

This looks like your system's firmware might be buggy, which is what the =

warning is all about.

 From the kmesg:

> kern  :info  : [    2.912758] DMAR: RMRR base: 0x0000009f271000 end: 0x00=
00009f290fff
> kern  :info  : [    2.919226] DMAR: RMRR base: 0x000000a1800000 end: 0x00=
0000a3ffffff
> kern  :err   : [    2.925692] DMAR: [Firmware Bug]: No firmware reserved =
region can cover this RMRR [0x00000000a1800000-0x00000000a3ffffff], contact=
 BIOS vendor for fixes
> kern  :warn  : [    2.939636] ------------[ cut here ]------------
> kern  :warn  : [    2.944436] Your BIOS is broken; bad RMRR [0x00000000a1=
800000-0x00000000a3ffffff]
>                               BIOS vendor: Dell Inc.; Ver: 1.2.8; Product=
 Version: =



The e820 map has this:

> kern  :info  : [    0.000000] BIOS-e820: [mem 0x00000000a0000000-0x000000=
00a00fffff] reserved
> kern  :info  : [    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x000000=
00fbffffff] reserved
> kern  :info  : [    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x000000=
00fe010fff] reserved

The region 0xa1800000-0xa3ffffff isn't explicitly reserved (it's not =

listed at all), which the IOMMU-folk say is the fault of the firmware.

My commit made it so that it merely spits out a warning, instead of =

failing to use the IOMMU at all.

Thanks,

Barret

--===============5353155456156181711==--

