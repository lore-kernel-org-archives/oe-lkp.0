Content-Type: multipart/mixed; boundary="===============8158390321912668184=="
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: lkp@lists.01.org
Subject: Re: [spi] 2baed30cb3: BUG: scheduling while atomic: systemd-udevd/134/0x00000002
Date: Thu, 21 Jan 2016 11:03:10 +0530
Message-ID: <20160121053310.GA4782@sudip-pc>
In-Reply-To: <87a8o0yhdz.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8158390321912668184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2016 at 01:00:40PM +0800, Huang, Ying wrote:
> Sudip Mukherjee <sudipm.mukherjee@gmail.com> writes:
> =

> > On Wed, Jan 20, 2016 at 08:44:37AM +0800, kernel test robot wrote:
> >> FYI, we noticed the below changes on
> >> =

> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mas=
ter
> >> commit 2baed30cb30727b2637d26eac5a8887875a13420 ("spi: lm70llp: use ne=
w parport device model")
> >> =

> >> =

> >> +----------------+------------+------------+
> >> |                | 74bdced4b4 | 2baed30cb3 |
> >> +----------------+------------+------------+
> >> | boot_successes | 0          | 0          |
> >> +----------------+------------+------------+
> >> =

> >> =

> >> =

> >> [    6.358390] i6300esb: Intel 6300ESB WatchDog Timer Driver v0.05
> >> [    6.358540] i6300esb: cannot register miscdev on minor=3D130 (err=
=3D-16)
> >> [    6.358555] i6300ESB timer: probe of 0000:00:06.0 failed with error=
 -16
> >> [    6.363357] BUG: scheduling while atomic: systemd-udevd/134/0x00000=
002
> >> [ 6.363366] Modules linked in: crc32c_intel pcspkr evdev i6300esb
> >> ide_cd_mod cdrom intel_agp intel_gtt i2c_piix4 i2c_core virtio_pci
> >> virtio virtio_ring agpgart rtc_cmos(+) parport_pc(+) autofs4
> >> [    6.363369] CPU: 1 PID: 134 Comm: systemd-udevd Not tainted 4.4.0-r=
c1-00006-g2baed30 #1
> >> [    6.363370] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =
BIOS Debian-1.8.2-1 04/01/2014
> >
> > Can you please let me know how do i reproduce this on qemu? what command
> > line you used?
> =

> The command line can be found in the last line of dmesg file, as below.
> =

> qemu-system-x86_64 -enable-kvm -cpu host -kernel /pkg/linux/x86_64-randco=
nfig-a0-01191454/gcc-5/2baed30cb30727b2637d26eac5a8887875a13420/vmlinuz-4.4=
.0-rc1-00006-g2baed30 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/sched=
uled/vm-lkp-wsx03-2G-2/bisect_boot-1-debian-x86_64-2015-02-07.cgz-x86_64-ra=
ndconfig-a0-01191454-2baed30cb30727b2637d26eac5a8887875a13420-20160119-7100=
2-198dtgm-0.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-a0-01191454 bran=
ch=3Dlinux-devel/devel-spot-201601191442 commit=3D2baed30cb30727b2637d26eac=
5a8887875a13420 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a0-01191454/gcc-5=
/2baed30cb30727b2637d26eac5a8887875a13420/vmlinuz-4.4.0-rc1-00006-g2baed30 =
max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-lkp-wsx03-2G/debian-x86_64=
-2015-02-07.cgz/x86_64-randconfig-a0-01191454/gcc-5/2baed30cb30727b2637d26e=
ac5a8887875a13420/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log=
_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall=
_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3D=
panic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3D=
tty0 vga=3Dnormal rw ip=3D::::vm-lkp-wsx03-2G-2::dhcp'  -initrd /fs/sda1/in=
itrd-vm-lkp-wsx03-2G-2 -m 2048 -smp 2 -device e1000,netdev=3Dnet0 -netdev u=
ser,id=3Dnet0,hostfwd=3Dtcp::23621-:22 -boot order=3Dnc -no-reboot -watchdo=
g i6300esb -rtc base=3Dlocaltime -drive file=3D/fs/sda1/disk0-vm-lkp-wsx03-=
2G-2,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sda1/disk1-vm-lkp-wsx03-2G-=
2,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-vm-lkp-wsx03-2G-2 -s=
erial file:/dev/shm/kboot/serial-vm-lkp-wsx03-2G-2 -daemonize -display none=
 -monitor null

I am not able to reproduce this. Tested just with the kernel and
yocto-minimal-i386.cgz filesystem and it booted properly.

I guess I need atleast your job file to reproduce this.

regards
sudip

--===============8158390321912668184==--

