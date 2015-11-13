Content-Type: multipart/mixed; boundary="===============1890920274058932403=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/numachip] db1003a719: BUG: kernel early-boot hang
Date: Fri, 13 Nov 2015 16:06:19 +0800
Message-ID: <87k2pm7284.fsf@yhuang-dev.intel.com>
In-Reply-To: <1447266511.14441.1@outlook-emeawest.office365.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1890920274058932403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Daniel J Blueman <daniel@numascale.com> writes:

> Hi Ying Huang,
>
> On Tue, Nov 10, 2015 at 6:12 AM, kernel test robot
> <ying.huang@linux.intel.com> wrote:
>> FYI, we noticed the below changes on
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> master
>> commit db1003a719d75cebe5843a7906c02c29bec9922c ("x86/numachip:
>> Cleanup Numachip support")
>>
>>
>> Elapsed time: 210
>> BUG: kernel early-boot hang
>> Linux version 4.3.0-rc2-00001-gdb1003a #1
>> Command line: root=3D/dev/ram0 user=3Dlkp
>> job=3D/lkp/scheduled/vm-intel12-yocto-x86_64-14/bisect_boot-1-yocto-mini=
mal-x86_64.cgz-x86_64-allyesdebian-db1003a719d75cebe5843a7906c02c29bec9922c=
-20151107-100037-1jb4qfh-1.yaml
>> ARCH=3Dx86_64 kconfig=3Dx86_64-allyesdebian
>> branch=3Dsergeh-security/2015-11-05/cgroupns
>> commit=3Ddb1003a719d75cebe5843a7906c02c29bec9922c
>> BOOT_IMAGE=3D/pkg/linux/x86_64-allyesdebian/gcc-5/db1003a719d75cebe5843a=
7906c02c29bec9922c/vmlinuz-4.3.0-rc2-00001-gdb1003a
>> max_uptime=3D600
>> RESULT_ROOT=3D/result/boot/1/vm-intel12-yocto-x86_64/yocto-minimal-x86_6=
4.cgz/x86_64-allyesdebian/gcc-5/db1003a719d75cebe5843a7906c02c29bec9922c/0
>> LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug
>> apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100
>> panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic
>> load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0
>> vga=3Dnormal rw ip=3D::::vm-intel12-yocto-x86_64-14::dhcp
>> drbd.minor_count=3D8
>> qemu-system-x86_64 -enable-kvm -cpu Nehalem -kernel
>> /pkg/linux/x86_64-allyesdebian/gcc-5/db1003a719d75cebe5843a7906c02c29bec=
9922c/vmlinuz-4.3.0-rc2-00001-gdb1003a
>> -append 'root=3D/dev/ram0 user=3Dlkp
>> job=3D/lkp/scheduled/vm-intel12-yocto-x86_64-14/bisect_boot-1-yocto-mini=
mal-x86_64.cgz-x86_64-allyesdebian-db1003a719d75cebe5843a7906c02c29bec9922c=
-20151107-100037-1jb4qfh-1.yaml
>> ARCH=3Dx86_64 kconfig=3Dx86_64-allyesdebian
>> branch=3Dsergeh-security/2015-11-05/cgroupns
>> commit=3Ddb1003a719d75cebe5843a7906c02c29bec9922c
>> BOOT_IMAGE=3D/pkg/linux/x86_64-allyesdebian/gcc-5/db1003a719d75cebe5843a=
7906c02c29bec9922c/vmlinuz-4.3.0-rc2-00001-gdb1003a
>> max_uptime=3D600
>> RESULT_ROOT=3D/result/boot/1/vm-intel12-yocto-x86_64/yocto-minimal-x86_6=
4.cgz/x86_64-allyesdebian/gcc-5/db1003a719d75cebe5843a7906c02c29bec9922c/0
>> LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug
>> apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100
>> panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic
>> load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0
>> vga=3Dnormal rw ip=3D::::vm-intel12-yocto-x86_64-14::dhcp
>> drbd.minor_count=3D8'  -initrd
>> /fs/KVM/initrd-vm-intel12-yocto-x86_64-14 -m 832 -smp 2 -device
>> e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot
>> -watchdog i6300esb -rtc base=3Dlocaltime -drive
>> file=3D/fs/KVM/disk0-vm-intel12-yocto-x86_64-14,media=3Ddisk,if=3Dvirtio
>> -drive
>> file=3D/fs/KVM/disk1-vm-intel12-yocto-x86_64-14,media=3Ddisk,if=3Dvirtio
>> -pidfile /dev/shm/kboot/pid-vm-intel12-yocto-x86_64-14 -serial
>> file:/dev/shm/kboot/serial-vm-intel12-yocto-x86_64-14 -daemonize
>> -display none -monitor null
>
> Neat, however checking out the same kernel tree at "db1003a
> x86/numachip: Cleanup Numachip support", building with the same config
> (though with GCC 5.2.1), it boots just peachy with the same args.
>
> The patch itself is conservative, so I can't see how it could cause
> early boot hangs. Have you seen this kind of issue before, or is this
> the first time?

Sorry, the origin report is a false positive.  The early boot hang
caused by testing system instead of your commit.  Sorry again for that.
Will be more carefully in the future.

Best Regards,
Huang, Ying

--===============1890920274058932403==--

