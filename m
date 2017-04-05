Content-Type: multipart/mixed; boundary="===============7342388018834693314=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Wed, 05 Apr 2017 17:40:17 +0900
Message-ID: <20170405084017.GD11669@jagdpanzerIV.localdomain>
In-Reply-To: <20170405072919.GE20286@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7342388018834693314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/05/17 15:29), Ye Xiaolong wrote:
[..]
> >>does this patch make it any better?
> >
> >I am trying it and will post the result once I get it.
> =

> Sorry for the late. I applied the patch of on top of the fbc14616f4 ("pri=
ntk: enable printk offloading") =

> and the "reboot-without-waring" issue is gone for 6 times of tests.
> =

> testcase/path_params/tbox_group/run: trinity/300s/vm-kbuild-yocto-ia32
> =

> fbc14616f483788a  a75384abd8885080d6923d7036  =

> ----------------  --------------------------  =

>           4:4         -100%            0:6     dmesg.BUG:kernel_reboot-wi=
thout-warning_in_test_stage

thanks!

	-ss

--===============7342388018834693314==--

