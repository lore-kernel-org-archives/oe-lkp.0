Content-Type: multipart/mixed; boundary="===============6963050068800579728=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4 BUG: kernel reboot-without-warning in test stage
Date: Mon, 03 Apr 2017 11:14:06 +0900
Message-ID: <20170403021406.GA483@jagdpanzerIV.localdomain>
In-Reply-To: <20170402041351.yk4e4efdgb2rvart@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6963050068800579728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Fengguang,

On (04/02/17 12:13), Fengguang Wu wrote:
[..]
> FYI here is another bisect result. The attached reproduce-* script may
> help reproduce the bug.
> =

> https://github.com/0day-ci/linux/commits/Sergey-Senozhatsky/printk-introd=
uce-printing-kernel-thread/20170330-185752
> =

> commit fbc14616f483788afabe77d05bfb99883dc66c73
> Author:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> AuthorDate: Wed Mar 29 18:25:11 2017 +0900
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Thu Mar 30 18:58:09 2017 +0800
> =

>      printk: enable printk offloading
>      =

>      Initialize the kernel printing thread and enable printk()
>      offloading.
>      =

>      Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>


thanks! I guess it's the same "sysrq emergency restart does not flush logbu=
f"
test case failure. if so, then the change below can probably fix it:

	lkml.kernel.org/r/20170331040438.GA366(a)jagdpanzerIV.localdomain

	-ss

--===============6963050068800579728==--

