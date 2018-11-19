Content-Type: multipart/mixed; boundary="===============3933420640643438986=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: dad4f140ed [ 7.709376] WARNING:suspicious_RCU_usage
Date: Sun, 18 Nov 2018 17:19:04 -0800
Message-ID: <20181119011904.GE7861@bombadil.infradead.org>
In-Reply-To: <20181119010820.GM18977@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3933420640643438986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 19, 2018 at 09:08:20AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is

Umm.  I don't see a 'suspicious RCU usage' message in here.  I see a
lot of vmalloc warnings ... ?

> [    7.699777] swapper: vmalloc: allocation failure: 18446744073709551615=
 bytes, mode:0x6000c0(GFP_KERNEL), nodemask=3D(null)
> [    7.724561] swapper: vmalloc: allocation failure: 18446744073709551615=
 bytes, mode:0x6000c0(GFP_KERNEL), nodemask=3D(null)
> [    7.737925] swapper: vmalloc: allocation failure: 18446744073709551615=
 bytes, mode:0x6080c0(GFP_KERNEL|__GFP_ZERO), nodemask=3D(null)
> [    7.750283] swapper: vmalloc: allocation failure: 18446744073709551615=
 bytes, mode:0x6080c0(GFP_KERNEL|__GFP_ZERO), nodemask=3D(null)
> [    7.777903] swapper: vmalloc: allocation failure: 18446744073709551615=
 bytes, mode:0x6000c0(GFP_KERNEL), nodemask=3D(null)
> [    7.787175] swapper: vmalloc: allocation failure: 18446744073709551615=
 bytes, mode:0x6000c0(GFP_KERNEL), nodemask=3D(null)
> [    7.796181] swapper: vmalloc: allocation failure: 18446744073709551615=
 bytes, mode:0x6080c0(GFP_KERNEL|__GFP_ZERO), nodemask=3D(null)
> [    7.804841] swapper: vmalloc: allocation failure: 18446744073709551615=
 bytes, mode:0x6080c0(GFP_KERNEL|__GFP_ZERO), nodemask=3D(null)

--===============3933420640643438986==--

