Content-Type: multipart/mixed; boundary="===============6490944774856652902=="
MIME-Version: 1.0
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: lkp@lists.01.org
Subject: Re: [x86/intel/quark] 8bbc2a135b6: WARNING: CPU: 0 PID: 1 at arch/x86/platform/intel-quark/imr.c:358 imr_add_range+0x2b4/0x370()
Date: Tue, 31 Mar 2015 10:57:42 +0100
Message-ID: <551A6F96.7050102@nexus-software.ie>
In-Reply-To: <CAC=cRTOxu7mYzVzg0vQhmWp=AXLJfOkgY_1S=hCtbj=YXrgLHA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6490944774856652902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 31/03/15 03:02, huang ying wrote:
> The qemu command line we used is as follow:
>
> qemu-system-i386 -enable-kvm -kernel
> /kernel/i386-randconfig-ib0-03292200/bc465aa9d045feb0e13b4a8f32cc33c1943f=
62d6/vmlinuz-4.0.0-rc5
> -append 'user=3Dlkp
> job=3D/lkp/scheduled/vm-kbuild-yocto-i386-4/rand_boot-1-yocto-minimal-i38=
6.cgz-i386-randconfig-ib0-03292200-bc465aa9d045feb0e13b4a8f32cc33c1943f62d6=
-0-20150329-102587-1i8stfj.yaml
> ARCH=3Di386
> BOOT_IMAGE=3D/kernel/i386-randconfig-ib0-03292200/bc465aa9d045feb0e13b4a8=
f32cc33c1943f62d6/vmlinuz-4.0.0-rc5
> kconfig=3Di386-randconfig-ib0-03292200
> commit=3Dbc465aa9d045feb0e13b4a8f32cc33c1943f62d6 branch=3Dlinus/master
> root=3D/dev/ram0 max_uptime=3D3600
> RESULT_ROOT=3D/result/vm-kbuild-yocto-i386/boot/1/yocto-minimal-i386.cgz/=
i386-randconfig-ib0-03292200/bc465aa9d045feb0e13b4a8f32cc33c1943f62d6/0
> ip=3D::::vm-kbuild-yocto-i386-4::dhcp earlyprintk=3DttyS0,115200
> rd.udev.log-priority=3Derr systemd.log_target=3Djournal
> systemd.log_level=3Dwarning debug apic=3Ddebug sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1
> nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0
> console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal rw drbd.minor_count=3D=
8'
> -initrd /fs/sda1/initrd-vm-kbuild-yocto-i386-4 -m 320 -smp 2 -net
> nic,vlan=3D1,model=3De1000 -net user,vlan=3D1 -boot order=3Dnc -no-reboot
> -watchdog i6300esb -rtc base=3Dlocaltime -drive
> file=3D/fs/sda1/disk0-vm-kbuild-yocto-i386-4,media=3Ddisk,if=3Dvirtio -pi=
dfile
> /dev/shm/kboot/pid-vm-kbuild-yocto-i386-4 -serial
> file:/dev/shm/kboot/serial-vm-kbuild-yocto-i386-4 -daemonize -display
> none -monitor null

Thanks.

Replicated - have a patch ready :)

--===============6490944774856652902==--

