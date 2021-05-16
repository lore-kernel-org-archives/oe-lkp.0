Content-Type: multipart/mixed; boundary="===============3132881581469998216=="
MIME-Version: 1.0
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: lkp@lists.01.org
Subject: Re: [video] dc13cac486: BUG:KASAN:stack-out-of-bounds_in_hgafb_open
Date: Mon, 17 May 2021 00:33:26 +0530
Message-ID: <YKFsfoaofqs1MQDw@anirudhrb.com>
In-Reply-To: <20210516150019.GB25903@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3132881581469998216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 16, 2021 at 11:00:19PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: dc13cac4862cc68ec74348a80b6942532b7735fa ("video: hgafb: fix pote=
ntial NULL pointer dereference")
> https://git.kernel.org/cgit/linux/kernel/git/gregkh/char-misc.git char-mi=
sc-linus
> =

> =

> in testcase: trinity
> version: trinity-static-x86_64-x86_64-f93256fb_2019-08-28
> with following parameters:
> =

> 	number: 99999
> 	group: group-02
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------+------------+------------+
> |                                             | 58c0cc2d90 | dc13cac486 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 42         | 14         |
> | boot_failures                               | 0          | 34         |
> | BUG:KASAN:stack-out-of-bounds_in_hgafb_open | 0          | 34         |
> +---------------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [  419.568887] BUG: KASAN: stack-out-of-bounds in hgafb_open (kbuild/src/=
consumer/drivers/video/fbdev/hgafb.c:375) =


Looks like the return value of hga_card_detect() is not properly
handled causing the probe function to succeed even though
hga_card_detect() has failed. Since probe has succeeded, hgafb_open()
can be called which will end up operating on an unmapped hga_vram.

Patch on the way.

Thanks!

	- Anirudh.
--===============3132881581469998216==--

