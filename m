Content-Type: multipart/mixed; boundary="===============8956327405387563345=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [writeback] 8bc4ad9498: INFO: suspicious RCU usage. ]
Date: Thu, 08 Sep 2016 09:43:13 +0800
Message-ID: <20160908014313.fdebw6ig2m6edy46@wfg-t540p.sh.intel.com>
In-Reply-To: <6046dded-a2a6-b6e2-8c2c-0cf13accf1e9@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8956327405387563345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jens and Tejun,

>The command line was in the original email:
>
>$ qemu-system-x86_64 -enable-kvm -cpu Westmere -m 512M
>
>And agree, in general it'd be nice if there was a link to the image as
>well, so that folks can reproduce.

Yes we have a reproduce script internally, however need to polish it
up and make it general usable by kernel developers.

CC Philip. It'd be helpful to give more priority to the "lkp qemu"
reproduce command.

For the warning here, it does not depend on any initrd, I just
confirmed this simple script can reproduce the problem.

---------------------------------------------------------------------------=
--
#!/bin/bash

kernel=3D$1

kvm=3D(
        qemu-system-x86_64
        -enable-kvm
        -cpu Westmere
        -kernel $kernel
        -m 1024
        -smp 1
        -device e1000,netdev=3Dnet0
        -netdev user,id=3Dnet0
        -boot order=3Dnc
        -no-reboot
        -watchdog i6300esb
        -watchdog-action debug
        -rtc base=3Dlocaltime
        -nographic
)


append=3D(
        ip=3D::::vm-kbuild-yocto-ia32-17::dhcp
        root=3D/dev/ram0
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
        systemd.log_level=3Derr
        ignore_loglevel
        earlyprintk=3DttyS0,115200
        console=3DttyS0,115200
        console=3Dtty0
        vga=3Dnormal
        rw
)

"${kvm[@]}" -append "${append[*]}"
---------------------------------------------------------------------------=
--

Thanks,
Fengguang

--===============8956327405387563345==--

