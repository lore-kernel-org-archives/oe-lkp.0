Content-Type: multipart/mixed; boundary="===============0810959570016146829=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [serial8250_interrupt] RIP: 0010:arch_local_irq_restore+0x2/0x8
Date: Thu, 23 Nov 2017 07:36:23 +0800
Message-ID: <20171122233623.7ud3wvtuemfvl3t3@wfg-t540p.sh.intel.com>
In-Reply-To: <1511275154.25007.349.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0810959570016146829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 04:39:14PM +0200, Andy Shevchenko wrote:
>On Tue, 2017-11-21 at 21:31 +0800, Fengguang Wu wrote:
>> On Tue, Nov 21, 2017 at 08:33:57PM +0800, Fengguang Wu wrote:
>> > Hello,
>> >
>> > FYI this happens in mainline kernel 4.14.0-02748-gabc36be.
>> > It shows up since v4.13 .
>>
>> Sorry it actually also shows up in 4.10:
>
>This one means that interrupt storm is occurred. Last time I saw that
>was by the fact of some specific IOAPIC configuration when DMA for UART
>was enabled.
>
>I'm pretty sure that is not the case here. Though, it would be nice to
>see link to the following files:

It's basically a KVM machine. This is adapted from the reproduce
script attached in the first email: =


kvm=3D(
        qemu-system-x86_64
        -enable-kvm
        -cpu IvyBridge
        -kernel $kernel
        -initrd initrd.img
        -m 1536
        -smp 2
        -device e1000,netdev=3Dnet0
        -netdev user,id=3Dnet0,hostfwd=3Dtcp::23406-:22
        -boot order=3Dnc
        -no-reboot
        -watchdog i6300esb
        -watchdog-action debug
        -rtc base=3Dlocaltime
        -drive file=3Ddisk-vm-ivb41-1G-7-0,media=3Ddisk,if=3Dvirtio
        -drive file=3Ddisk-vm-ivb41-1G-7-1,media=3Ddisk,if=3Dvirtio
        -drive file=3Ddisk-vm-ivb41-1G-7-2,media=3Ddisk,if=3Dvirtio
        -drive file=3Ddisk-vm-ivb41-1G-7-3,media=3Ddisk,if=3Dvirtio
        -drive file=3Ddisk-vm-ivb41-1G-7-4,media=3Ddisk,if=3Dvirtio
        -drive file=3Ddisk-vm-ivb41-1G-7-5,media=3Ddisk,if=3Dvirtio
        -serial stdio
        -display none
        -monitor null
)

append=3D(
        ip=3D::::vm-ivb41-1G-7::dhcp
        root=3D/dev/ram0
        user=3Dlkp
        job=3D/job-script
        ARCH=3Dx86_64
        kconfig=3Dx86_64-allyesdebian
        branch=3Dlinus/master
        commit=3Dabc36be236358162202e86ad88616ff95a755101
        BOOT_IMAGE=3D/pkg/linux/x86_64-allyesdebian/gcc-6/abc36be2363581622=
02e86ad88616ff95a755101/vmlinuz-4.14.0-02748-gabc36be
        max_uptime=3D600
        RESULT_ROOT=3D/result/boot/1/vm-ivb41-1G/debian-x86_64-2016-08-31.c=
gz/x86_64-allyesdebian/gcc-6/abc36be236358162202e86ad88616ff95a755101/0
        result_service=3Dtmpfs
        debug
        apic=3Ddebug
        sysrq_always_enabled
        rcupdate.rcu_cpu_stall_timeout=3D100
        net.ifnames=3D0
        printk.devkmsg=3Don
        panic=3D-1
        softlockup_panic=3D1
        nmi_watchdog=3Dpanic
        oops=3Dpanic
        load_ramdisk=3D2
        prompt_ramdisk=3D0
        drbd.minor_count=3D8
        systemd.log_level=3Derr
        ignore_loglevel
        console=3Dtty0
        earlyprintk=3DttyS0,115200
        console=3DttyS0,115200
        vga=3Dnormal
        rw
)

Thanks,
Fengguang

--===============0810959570016146829==--

