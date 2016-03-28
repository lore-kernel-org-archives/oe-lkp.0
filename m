Content-Type: multipart/mixed; boundary="===============5894720669724595827=="
MIME-Version: 1.0
From: Zheng, Lv <lv.zheng@intel.com>
To: lkp@lists.01.org
Subject: Re: [ACPICA] d985a6cc1f: kmsg.ACPI_Warning:Could_not_enable_fixed_event-RealTimeClock(#)(#/evxface-#)
Date: Mon, 28 Mar 2016 08:02:46 +0000
Message-ID: <1AE640813FDE7649BE1B193DEA596E883BB656F5@SHSMSX101.ccr.corp.intel.com>
In-Reply-To: <87egavku7o.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5894720669724595827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Can I have the acpidump output of the tested platform?

Thanks
-Lv

> -----Original Message-----
> From: kernel test robot [mailto:ying.huang(a)linux.intel.com]
> Sent: Monday, March 28, 2016 2:11 PM
> To: Zheng, Lv <lv.zheng@intel.com>
> Cc: lkp(a)01.org
> Subject: [lkp] [ACPICA] d985a6cc1f:
> kmsg.ACPI_Warning:Could_not_enable_fixed_event-
> RealTimeClock(#)(#/evxface-#)
> =

> FYI, we noticed the below changes on
> =

> git://bee.sh.intel.com/git/zetalog/linux-acpica.git acpica-access
> commit d985a6cc1f86d0b4e719be846f24b1eac2f33395 ("ACPICA: Hardware:
> Add access_width/bit_offset support in acpi_hw_read()")
> =

> [    1.381329] ACPI Error: Could not enable PowerButton event
> (20160108/evxfevnt-212)
> [    1.383284] ACPI Warning: Could not enable fixed event - PowerButton (=
2)
> (20160108/evxface-654)
> =

> =

> FYI, raw QEMU command line is:
> =

> 	qemu-system-x86_64 -enable-kvm -cpu Westmere -kernel
> /pkg/linux/x86_64-rhel/gcc-
> 4.9/d985a6cc1f86d0b4e719be846f24b1eac2f33395/vmlinuz-4.5.0-rc7-00190-
> gd985a6c -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-kbu=
ild-
> yocto-ia32-6/bisect_boot-1-yocto-minimal-i386.cgz-x86_64-rhel-
> d985a6cc1f86d0b4e719be846f24b1eac2f33395-20160325-57289-ryboi2-
> 0.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-rhel branch=3Dinternal-devel/devel-=
hourly-
> 2016032223-internal commit=3Dd985a6cc1f86d0b4e719be846f24b1eac2f33395
> BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-
> 4.9/d985a6cc1f86d0b4e719be846f24b1eac2f33395/vmlinuz-4.5.0-rc7-00190-
> gd985a6c max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-kbuild-yocto-
> ia32/yocto-minimal-i386.cgz/x86_64-rhel/gcc-
> 4.9/d985a6cc1f86d0b4e719be846f24b1eac2f33395/0 LKP_SERVER=3Dinn
> earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug apic=3Ddebug
> sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1
> softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2
> prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal rw
> ip=3D::::vm-kbuild-yocto-ia32-6::dhcp drbd.minor_count=3D8'  -initrd
> /fs/sde1/initrd-vm-kbuild-yocto-ia32-6 -m 320 -smp 1 -device
> e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot -w=
atchdog
> i6300esb -rtc base=3Dlocaltime -drive file=3D/fs/sde1/disk0-vm-kbuild-yoc=
to-ia32-
> 6,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-vm-kbuild-yocto-ia=
32-6 -
> serial file:/dev/shm/kboot/serial-vm-kbuild-yocto-ia32-6 -daemonize -disp=
lay
> none -monitor null
> =

> =

> =

> =

> Thanks,
> Huang Ying

--===============5894720669724595827==--

