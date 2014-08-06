Content-Type: multipart/mixed; boundary="===============6191868310369929786=="
MIME-Version: 1.0
From: Nick Krause <xerofoify@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sbc_gxx] kernel BUG at include/linux/mtd/map.h:148!
Date: Tue, 05 Aug 2014 20:08:57 -0400
Message-ID: <CAPDOMVgN=tc_o7E19ss4j5FAG4vpgUSzuUXYLSNGfpWCvPsAwA@mail.gmail.com>
In-Reply-To: <20140805135947.GA5593@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============6191868310369929786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2014 at 9:59 AM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
> Hello,
>
> This is an old BUG that still lives in linux-next.
>
> [    4.284620] device id =3D 2670
> [    4.286157] SBC-GXx flash: IO:0x258-0x259 MEM:0xdc000-0xdffff
> [    4.287060] ------------[ cut here ]------------
> [    4.287722] kernel BUG at include/linux/mtd/map.h:148!
> [    4.288048] invalid opcode: 0000 [#1] PREEMPT SMP
> [    4.288048] CPU 1
> [    4.288048] Pid: 1, comm: swapper/0 Not tainted 3.5.0-rc4-00162-g49099=
c4 #17 Bochs Bochs
> [    4.288048] RIP: 0010:[<ffffffff8177e8de>]  [<ffffffff8177e8de>] mtd_d=
o_chip_probe+0x1d/0x1f
> [    4.288048] RSP: 0018:ffff880011049e20  EFLAGS: 00010246
> [    4.288048] RAX: 0000000000000000 RBX: ffffffff82a23550 RCX: 000000000=
0000000
> [    4.288048] RDX: ffff880011049e20 RSI: ffffffff82a23580 RDI: ffff88001=
1049e80
> [    4.288048] RBP: ffff880011049e80 R08: 0000000000000003 R09: ffffffff8=
10d6c93
> [    4.288048] R10: 0000000000000000 R11: 0000000000000001 R12: ffffffff8=
2a23eb0
> [    4.288048] R13: ffffffff828790ce R14: 0000000000000000 R15: 000000000=
0000000
> [    4.288048] FS:  0000000000000000(0000) GS:ffff880012600000(0000) knlG=
S:0000000000000000
> [    4.288048] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [    4.288048] CR2: 0000000000000000 CR3: 000000000298c000 CR4: 000000000=
00406e0
> [    4.288048] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [    4.288048] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 000000000=
0000400
> [    4.288048] Process swapper/0 (pid: 1, threadinfo ffff880011048000, ta=
sk ffff880011040000)
> [    4.288048] Stack:
> [    4.288048]  0000000000000000 0000000000000000 0000000000000000 000000=
0000000000
> [    4.288048]  0000000000000000 0000000000000000 0000000000000000 000000=
0000000000
> [    4.288048]  0000000000000000 0000000000000000 0000000000000000 000000=
0000000000
> [    4.288048] Call Trace:
> [    4.288048]  [<ffffffff81779e05>] cfi_probe+0x15/0x17
> [    4.288048]  [<ffffffff81779d9b>] do_map_probe+0xa0/0xac
> [    4.288048]  [<ffffffff834d1aac>] ? physmap_init+0x12/0x12
> [    4.288048]  [<ffffffff834d1bb0>] init_sbc_gxx+0x104/0x15b
> [    4.288048]  [<ffffffff8348d1b3>] do_one_initcall+0x86/0x208
> [    4.288048]  [<ffffffff8348d442>] kernel_init+0x10d/0x1c2
> [    4.288048]  [<ffffffff8348c739>] ? do_early_param+0xc3/0xc3
> [    4.288048]  [<ffffffff8207b2f4>] kernel_thread_helper+0x4/0x10
> [    4.288048]  [<ffffffff820797b4>] ? retint_restore_args+0x13/0x13
> [    4.288048]  [<ffffffff8348d335>] ? do_one_initcall+0x208/0x208
> [    4.288048]  [<ffffffff8207b2f0>] ? gs_change+0x13/0x13
> [    4.288048] Code: 83 c4 58 5b 41 5c 41 5d 41 5e 41 5f 5d c3 55 48 89 e=
5 48 83 ec 60 66 66 66 66 90 31 c0 b9 18 00 00 00 48 8d 55 a0 48 89 d7 f3 a=
b <0f> 0b 55 48 89 e5 66 66 66 66 90 48 c7 c6 a0 39 a2 82 e8 cc ff
> [    4.288048] RIP  [<ffffffff8177e8de>] mtd_do_chip_probe+0x1d/0x1f
> [    4.288048]  RSP <ffff880011049e20>
> [    4.321423] ---[ end trace 169195d5d1f9be6e ]---
> [    4.322118] swapper/0 (1) used greatest stack depth: 3768 bytes left
>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
> initrd=3Dquantal-core-x86_64.cgz
>
> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
>
> kvm=3D(
>         qemu-system-x86_64
>         -enable-kvm
>         -cpu Haswell,+smep,+smap
>         -kernel $kernel
>         -initrd $initrd
>         -m 320
>         -smp 2
>         -net nic,vlan=3D1,model=3De1000
>         -net user,vlan=3D1
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -rtc base=3Dlocaltime
>         -serial stdio
>         -display none
>         -monitor null
> )
>
> append=3D(
>         hung_task_panic=3D1
>         earlyprintk=3DttyS0,115200
>         debug
>         apic=3Ddebug
>         sysrq_always_enabled
>         rcupdate.rcu_cpu_stall_timeout=3D100
>         panic=3D10
>         softlockup_panic=3D1
>         nmi_watchdog=3Dpanic
>         prompt_ramdisk=3D0
>         console=3DttyS0,115200
>         console=3Dtty0
>         vga=3Dnormal
>         root=3D/dev/ram0
>         rw
>         drbd.minor_count=3D8
> )
>
> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
>
> Thanks,
> Fengguang
>
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
>
I am new , here and will try to trace your issue on linus's tree
unless there is a major difference between Linus's tree and
linux-next.
If there is please let me known before I start tracing this.
Best Regards ,
Nick

--===============6191868310369929786==--

