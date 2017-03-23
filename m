Content-Type: multipart/mixed; boundary="===============0782672934399914335=="
MIME-Version: 1.0
From: Gabriel Krisman Bertazi <krisman@collabora.co.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [drm] f04f7e3e04: general_protection_fault:#[##]
Date: Thu, 23 Mar 2017 03:13:19 -0300
Message-ID: <87h92k1pxc.fsf@dilma.collabora.co.uk>
In-Reply-To: <20170323045323.GA8665@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0782672934399914335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <xiaolong.ye@intel.com> writes:

> FYI, we noticed the following commit:
>
> commit: f04f7e3e041aab12abbf3ed7b854446af5a624a9 ("drm: bochs: Don't
> remove uninitialized fbdev framebuffer")
> url:
> https://github.com/0day-ci/linux/commits/Gabriel-Krisman-Bertazi/drm-boch=
s-Don-t-remove-uninitialized-fbdev-framebuffer/20170318-164722
> base: git://git.kraxel.org/linux drm-qemu
>
> in testcase: trinity
> with following parameters:
>
> 	runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -m 512M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Problem is: register_framebuffer() fails with this config because
of reasons, as show by this line:

[    9.937917] bochsdrmfb: enable CONFIG_FB_LITTLE_ENDIAN to support this f=
ramebuffer

which causes drm_fb_helper_initial_config() to error out and call
drm_fb_helper_fini(0 in the bochs_fbdev_init() error path.  Also, since
the kernel has CONFIG_DEBUG_TEST_DRIVER_REMOVE, it tries to remove the
device in sequence, making a second call to drm_fb_helper_fini, because
we didn't unset the initialized flag.  I'll get a patch for this first
thing tomorrow morning.

-- =

Gabriel Krisman Bertazi

--===============0782672934399914335==--

