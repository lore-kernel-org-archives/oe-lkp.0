Content-Type: multipart/mixed; boundary="===============2699101765568210060=="
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: lkp@lists.01.org
Subject: Re: [spi] 2baed30cb3: BUG: scheduling while atomic: systemd-udevd/134/0x00000002
Date: Wed, 20 Jan 2016 10:12:47 +0530
Message-ID: <20160120044247.GA3238@sudip-pc>
In-Reply-To: <87bn8h5bbe.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2699101765568210060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2016 at 08:44:37AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 2baed30cb30727b2637d26eac5a8887875a13420 ("spi: lm70llp: use new p=
arport device model")
> =

> =

> +----------------+------------+------------+
> |                | 74bdced4b4 | 2baed30cb3 |
> +----------------+------------+------------+
> | boot_successes | 0          | 0          |
> +----------------+------------+------------+
> =

> =

> =

> [    6.358390] i6300esb: Intel 6300ESB WatchDog Timer Driver v0.05
> [    6.358540] i6300esb: cannot register miscdev on minor=3D130 (err=3D-1=
6)
> [    6.358555] i6300ESB timer: probe of 0000:00:06.0 failed with error -16
> [    6.363357] BUG: scheduling while atomic: systemd-udevd/134/0x00000002
> [    6.363366] Modules linked in: crc32c_intel pcspkr evdev i6300esb ide_=
cd_mod cdrom intel_agp intel_gtt i2c_piix4 i2c_core virtio_pci virtio virti=
o_ring agpgart rtc_cmos(+) parport_pc(+) autofs4
> [    6.363369] CPU: 1 PID: 134 Comm: systemd-udevd Not tainted 4.4.0-rc1-=
00006-g2baed30 #1
> [    6.363370] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014

Can you please let me know how do i reproduce this on qemu? what command
line you used?

> [    6.363372]  0000000000012880 ffff88007f8bb880 ffffffff878a5e4d ffff88=
0078712880
> [    6.363374]  ffff88007f8bb890 ffffffff876a64d6 ffff88007f8bb8d0 ffffff=
ff87b05f69
> [    6.363375]  ffff88005d04e340 ffff88007f8bc000 000000000000007f ffffff=
ff879a6260
> [    6.363375] Call Trace:
> [    6.363385]  [<ffffffff878a5e4d>] dump_stack+0x4b/0x6e
> [    6.363391]  [<ffffffff876a64d6>] __schedule_bug+0x46/0x60
> [    6.363394]  [<ffffffff87b05f69>] __schedule+0x549/0x780
> [    6.363398]  [<ffffffff879a6260>] ? dead_read+0x10/0x10

dead_read() is used only when a port has been removed and the driver has
not registered with parport_register_driver(). But in the case of
spi/spi-lm70llp.c it has detach callback, so whenever a port is removed
detach should be executed.

regards
sudip

--===============2699101765568210060==--

