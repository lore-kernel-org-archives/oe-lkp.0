Content-Type: multipart/mixed; boundary="===============7981732695061157658=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86 tsc] 19fa5e7364: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe+0x72/0x80
Date: Tue, 21 Jun 2016 12:10:11 +0200
Message-ID: <1e840272-9a0c-1e95-0356-12c031df7458@redhat.com>
In-Reply-To: <CANRm+Cyu8Vd_BudEPFBnvq4MuA0XY4RTNudfpwbEiM5yCzJpZw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7981732695061157658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 21/06/2016 08:08, Wanpeng Li wrote:
> Cc KVM ML, Paolo, Radim,
>>> FYI, raw QEMU command line is:
>>>
>>>         qemu-system-x86_64 -enable-kvm -cpu SandyBridge -kernel /pkg/li=
nux/x86_64-randconfig-w0-06180628/gcc-6/19fa5e73647fde1e6a7038a8f05cddf4c43=
f08d3/vmlinuz-4.7.0-rc3-00009-g19fa5e7 -append 'root=3D/dev/ram0 user=3Dlkp=
 job=3D/lkp/scheduled/vm-kbuild-yocto-x86_64-32/bisect_boot-1-yocto-minimal=
-x86_64.cgz-x86_64-randconfig-w0-06180628-19fa5e73647fde1e6a7038a8f05cddf4c=
43f08d3-20160618-25535-h82bax-0.yaml~ ARCH=3Dx86_64 kconfig=3Dx86_64-randco=
nfig-w0-06180628 branch=3Dinternal-eywa/master commit=3D19fa5e73647fde1e6a7=
038a8f05cddf4c43f08d3 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-w0-06180628=
/gcc-6/19fa5e73647fde1e6a7038a8f05cddf4c43f08d3/vmlinuz-4.7.0-rc3-00009-g19=
fa5e7 max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-kbuild-yocto-x86_64/=
yocto-minimal-x86_64.cgz/x86_64-randconfig-w0-06180628/gcc-6/19fa5e73647fde=
1e6a7038a8f05cddf4c43f08d3/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 sy=
stemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_=
cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpani=
c oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 c=
onsole=3Dtty0 vga=3Dnormal rw ip=3D::::vm-kbuild-yocto-x86_64-32::dhcp drbd=
.minor_count=3D8'  -initrd /fs/sdh1/initrd-vm-kbuild-yocto-x86_64-32 -m 320=
 -smp 1 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc=
 -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -drive file=3D/fs/sdh1=
/disk0-vm-kbuild-yocto-x86_64-32,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm=
/kboot/pid-vm-kbuild-yocto-x86_64-32 -serial file:/dev/shm/kboot/serial-vm-=
kbuild-yocto-x86_64-32 -daemonize -display none -monitor null
>>>
>> This  problem was caused due to kvm does not support MSR_PLATFORM_INFO(0=
xce),
>> according to Wanpeng's feedback.
>>
>> Hi Wanpeng, is it possible for kvm to simulate this MSR, otherwise we
>> might have to use
>> rdmsr_safe instead.
> =

> There is a thread discussed this before
> https://patchwork.kernel.org/patch/8833021/, MSR_PLATFORM_INFO can't
> be simple emulation.
> =

> Ping Paolo, Radim. :)

rdmsr_safe must be used instead.  I'll prepare a patch.

Paolo

--===============7981732695061157658==--

