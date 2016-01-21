Content-Type: multipart/mixed; boundary="===============0935302318604484584=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [spi] 2baed30cb3: BUG: scheduling while atomic: systemd-udevd/134/0x00000002
Date: Thu, 21 Jan 2016 13:47:10 +0800
Message-ID: <87oacfqyap.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160121053310.GA4782@sudip-pc>
List-Id: <oe-lkp.lists.linux.dev>

--===============0935302318604484584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sudip Mukherjee <sudipm.mukherjee@gmail.com> writes:

> On Wed, Jan 20, 2016 at 01:00:40PM +0800, Huang, Ying wrote:
>> Sudip Mukherjee <sudipm.mukherjee@gmail.com> writes:
>> =

>> > On Wed, Jan 20, 2016 at 08:44:37AM +0800, kernel test robot wrote:
>> >> FYI, we noticed the below changes on
>> >> =

>> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ma=
ster
>> >> commit 2baed30cb30727b2637d26eac5a8887875a13420 ("spi: lm70llp: use n=
ew parport device model")
>> >> =

>> >> =

>> >> +----------------+------------+------------+
>> >> |                | 74bdced4b4 | 2baed30cb3 |
>> >> +----------------+------------+------------+
>> >> | boot_successes | 0          | 0          |
>> >> +----------------+------------+------------+
>> >> =

>> >> =

>> >> =

>> >> [    6.358390] i6300esb: Intel 6300ESB WatchDog Timer Driver v0.05
>> >> [    6.358540] i6300esb: cannot register miscdev on minor=3D130 (err=
=3D-16)
>> >> [    6.358555] i6300ESB timer: probe of 0000:00:06.0 failed with erro=
r -16
>> >> [    6.363357] BUG: scheduling while atomic: systemd-udevd/134/0x0000=
0002
>> >> [ 6.363366] Modules linked in: crc32c_intel pcspkr evdev i6300esb
>> >> ide_cd_mod cdrom intel_agp intel_gtt i2c_piix4 i2c_core virtio_pci
>> >> virtio virtio_ring agpgart rtc_cmos(+) parport_pc(+) autofs4
>> >> [    6.363369] CPU: 1 PID: 134 Comm: systemd-udevd Not tainted 4.4.0-=
rc1-00006-g2baed30 #1
>> >> [    6.363370] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),=
 BIOS Debian-1.8.2-1 04/01/2014
>> >
>> > Can you please let me know how do i reproduce this on qemu? what comma=
nd
>> > line you used?
>> =

>> The command line can be found in the last line of dmesg file, as below.
>> =

>> qemu-system-x86_64 -enable-kvm -cpu host -kernel
>> /pkg/linux/x86_64-randconfig-a0-01191454/gcc-5/2baed30cb30727b2637d26eac=
5a8887875a13420/vmlinuz-4.4.0-rc1-00006-g2baed30
>> -append 'root=3D/dev/ram0 user=3Dlkp
>> job=3D/lkp/scheduled/vm-lkp-wsx03-2G-2/bisect_boot-1-debian-x86_64-2015-=
02-07.cgz-x86_64-randconfig-a0-01191454-2baed30cb30727b2637d26eac5a8887875a=
13420-20160119-71002-198dtgm-0.yaml
>> ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-a0-01191454
>> branch=3Dlinux-devel/devel-spot-201601191442
>> commit=3D2baed30cb30727b2637d26eac5a8887875a13420
>> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a0-01191454/gcc-5/2baed30cb307=
27b2637d26eac5a8887875a13420/vmlinuz-4.4.0-rc1-00006-g2baed30
>> max_uptime=3D600
>> RESULT_ROOT=3D/result/boot/1/vm-lkp-wsx03-2G/debian-x86_64-2015-02-07.cg=
z/x86_64-randconfig-a0-01191454/gcc-5/2baed30cb30727b2637d26eac5a8887875a13=
420/0
>> LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug
>> apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100
>> panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic
>> load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0
>> vga=3Dnormal rw ip=3D::::vm-lkp-wsx03-2G-2::dhcp' -initrd
>> /fs/sda1/initrd-vm-lkp-wsx03-2G-2 -m 2048 -smp 2 -device
>> e1000,netdev=3Dnet0 -netdev user,id=3Dnet0,hostfwd=3Dtcp::23621-:22 -boot
>> order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -drive
>> file=3D/fs/sda1/disk0-vm-lkp-wsx03-2G-2,media=3Ddisk,if=3Dvirtio -drive
>> file=3D/fs/sda1/disk1-vm-lkp-wsx03-2G-2,media=3Ddisk,if=3Dvirtio -pidfile
>> /dev/shm/kboot/pid-vm-lkp-wsx03-2G-2 -serial
>> file:/dev/shm/kboot/serial-vm-lkp-wsx03-2G-2 -daemonize -display
>> none -monitor null
>
> I am not able to reproduce this. Tested just with the kernel and
> yocto-minimal-i386.cgz filesystem and it booted properly.
>
> I guess I need atleast your job file to reproduce this.

This is a boot test so I did not attached the job file.  But the test
result may depends on specific root file system.  For example, the
process when BUG report is always systemd-udevd.  Maybe you need a
systemd based root file system.

Best Regards,
Huang, Ying


--===============0935302318604484584==--

