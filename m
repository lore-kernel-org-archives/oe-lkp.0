Content-Type: multipart/mixed; boundary="===============3332458938393261234=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [spi] 2baed30cb3: BUG: scheduling while atomic: systemd-udevd/134/0x00000002
Date: Wed, 20 Jan 2016 13:00:40 +0800
Message-ID: <87a8o0yhdz.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160120044247.GA3238@sudip-pc>
List-Id: <oe-lkp.lists.linux.dev>

--===============3332458938393261234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sudip Mukherjee <sudipm.mukherjee@gmail.com> writes:

> On Wed, Jan 20, 2016 at 08:44:37AM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> commit 2baed30cb30727b2637d26eac5a8887875a13420 ("spi: lm70llp: use new =
parport device model")
>> =

>> =

>> +----------------+------------+------------+
>> |                | 74bdced4b4 | 2baed30cb3 |
>> +----------------+------------+------------+
>> | boot_successes | 0          | 0          |
>> +----------------+------------+------------+
>> =

>> =

>> =

>> [    6.358390] i6300esb: Intel 6300ESB WatchDog Timer Driver v0.05
>> [    6.358540] i6300esb: cannot register miscdev on minor=3D130 (err=3D-=
16)
>> [    6.358555] i6300ESB timer: probe of 0000:00:06.0 failed with error -=
16
>> [    6.363357] BUG: scheduling while atomic: systemd-udevd/134/0x00000002
>> [ 6.363366] Modules linked in: crc32c_intel pcspkr evdev i6300esb
>> ide_cd_mod cdrom intel_agp intel_gtt i2c_piix4 i2c_core virtio_pci
>> virtio virtio_ring agpgart rtc_cmos(+) parport_pc(+) autofs4
>> [    6.363369] CPU: 1 PID: 134 Comm: systemd-udevd Not tainted 4.4.0-rc1=
-00006-g2baed30 #1
>> [    6.363370] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS Debian-1.8.2-1 04/01/2014
>
> Can you please let me know how do i reproduce this on qemu? what command
> line you used?

The command line can be found in the last line of dmesg file, as below.

qemu-system-x86_64 -enable-kvm -cpu host -kernel /pkg/linux/x86_64-randconf=
ig-a0-01191454/gcc-5/2baed30cb30727b2637d26eac5a8887875a13420/vmlinuz-4.4.0=
-rc1-00006-g2baed30 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/schedul=
ed/vm-lkp-wsx03-2G-2/bisect_boot-1-debian-x86_64-2015-02-07.cgz-x86_64-rand=
config-a0-01191454-2baed30cb30727b2637d26eac5a8887875a13420-20160119-71002-=
198dtgm-0.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-a0-01191454 branch=
=3Dlinux-devel/devel-spot-201601191442 commit=3D2baed30cb30727b2637d26eac5a=
8887875a13420 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a0-01191454/gcc-5/2=
baed30cb30727b2637d26eac5a8887875a13420/vmlinuz-4.4.0-rc1-00006-g2baed30 ma=
x_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-lkp-wsx03-2G/debian-x86_64-2=
015-02-07.cgz/x86_64-randconfig-a0-01191454/gcc-5/2baed30cb30727b2637d26eac=
5a8887875a13420/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_l=
evel=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_t=
imeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpa=
nic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtt=
y0 vga=3Dnormal rw ip=3D::::vm-lkp-wsx03-2G-2::dhcp'  -initrd /fs/sda1/init=
rd-vm-lkp-wsx03-2G-2 -m 2048 -smp 2 -device e1000,netdev=3Dnet0 -netdev use=
r,id=3Dnet0,hostfwd=3Dtcp::23621-:22 -boot order=3Dnc -no-reboot -watchdog =
i6300esb -rtc base=3Dlocaltime -drive file=3D/fs/sda1/disk0-vm-lkp-wsx03-2G=
-2,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sda1/disk1-vm-lkp-wsx03-2G-2,=
media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-vm-lkp-wsx03-2G-2 -ser=
ial file:/dev/shm/kboot/serial-vm-lkp-wsx03-2G-2 -daemonize -display none -=
monitor null

Best Regards,
Huang, Ying

>> [    6.363372]  0000000000012880 ffff88007f8bb880 ffffffff878a5e4d ffff8=
80078712880
>> [    6.363374]  ffff88007f8bb890 ffffffff876a64d6 ffff88007f8bb8d0 fffff=
fff87b05f69
>> [    6.363375]  ffff88005d04e340 ffff88007f8bc000 000000000000007f fffff=
fff879a6260
>> [    6.363375] Call Trace:
>> [    6.363385]  [<ffffffff878a5e4d>] dump_stack+0x4b/0x6e
>> [    6.363391]  [<ffffffff876a64d6>] __schedule_bug+0x46/0x60
>> [    6.363394]  [<ffffffff87b05f69>] __schedule+0x549/0x780
>> [    6.363398]  [<ffffffff879a6260>] ? dead_read+0x10/0x10
>
> dead_read() is used only when a port has been removed and the driver has
> not registered with parport_register_driver(). But in the case of
> spi/spi-lm70llp.c it has detach callback, so whenever a port is removed
> detach should be executed.
>
> regards
> sudip
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============3332458938393261234==--

