Content-Type: multipart/mixed; boundary="===============2400593707675041419=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] c566586818: BUG:kernel_hang_in_early-boot_stage, last_printk:Probing_EDD(edd=off_to_disable)...ok
Date: Mon, 24 Aug 2020 10:47:20 +0800
Message-ID: <5e286a22-921c-8e2b-14dc-7ef96e320010@intel.com>
In-Reply-To: <20200821010132.GC4622@lca.pw>
List-Id: <oe-lkp.lists.linux.dev>

--===============2400593707675041419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 8/21/20 9:01 AM, Qian Cai wrote:
> On Tue, Aug 18, 2020 at 08:23:51AM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: c5665868183fec689dbab9fb8505188b2c4f0757 ("mm: kmemleak: use the=
 memory pool for early allocations")
> I might see one of those early boot failure before. In my case, the bare-=
metal
> system was reset. Can you try to narrow down to a smaller
> CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE (assume 0 works if your bisecting was
> correct) that works?

Hi Qian,

Adding CONFIG_EARLY_PRINTK=3Dy to the kconfig file, and the boot hangs in =

the below position:

[=C2=A0=C2=A0=C2=A0 0.715834] Kernel command line: root=3D/dev/ram0 hung_ta=
sk_panic=3D1 =

debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D10=
0 =

net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 =

nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 =

drbd.minor_count=3D8
systemd.log_level=3Derr ignore_loglevel console=3Dtty0 =

earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw =

rcuperf.shutdown=3D0 watchdog_thresh=3D60
[=C2=A0=C2=A0=C2=A0 0.719688] sysrq: sysrq always enabled.
[=C2=A0=C2=A0=C2=A0 0.801005] Dentry cache hash table entries: 2097152 (ord=
er: 12, =

16777216 bytes, linear)
[=C2=A0=C2=A0=C2=A0 0.805588] Inode-cache hash table entries: 1048576 (orde=
r: 11, =

8388608 bytes, linear)
[=C2=A0=C2=A0=C2=A0 0.806464] mem auto-init: stack:off, heap alloc:on, heap=
 free:off
[=C2=A0=C2=A0=C2=A0 1.080978] Memory: 12319196K/12680692K available (10243K=
 kernel =

code, 2414K rwdata, 8184K rodata, 856K init, 20772K bss, 361496K =

reserved, 0K cma-reserved)
qemu-system-x86_64: terminating on signal 2

The problem disappeared if CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=3D400:

[=C2=A0=C2=A0=C2=A0 1.064575] Kernel command line: root=3D/dev/ram0 hung_ta=
sk_panic=3D1 =

debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D10=
0 =

net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 =

nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 =

drbd.minor_count=3D8
systemd.log_level=3Derr ignore_loglevel console=3Dtty0 =

earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw =

rcuperf.shutdown=3D0 watchdog_thresh=3D60
[=C2=A0=C2=A0=C2=A0 1.068883] sysrq: sysrq always enabled.
[=C2=A0=C2=A0=C2=A0 1.108720] Dentry cache hash table entries: 2097152 (ord=
er: 12, =

16777216 bytes, linear)
[=C2=A0=C2=A0=C2=A0 1.148852] Inode-cache hash table entries: 1048576 (orde=
r: 11, =

8388608 bytes, linear)
[=C2=A0=C2=A0=C2=A0 1.150271] mem auto-init: stack:off, heap alloc:on, heap=
 free:off
[=C2=A0=C2=A0=C2=A0 1.835309] Memory: 12325340K/12680692K available (10243K=
 kernel =

code, 2414K rwdata, 8192K rodata, 856K init, 14628K bss, 355352K =

reserved, 0K cma-reserved)
[=C2=A0=C2=A0=C2=A0 3.487078] general protection fault: 0000 [#1] DEBUG_PAG=
EALLOC PTI
[=C2=A0=C2=A0=C2=A0 3.488185] CPU: 0 PID: 0 Comm: swapper Not tainted =

5.3.0-11792-gc5665868183fe #1
[=C2=A0=C2=A0=C2=A0 3.489581] RIP: 0010:lookup_address_in_pgd+0xd1/0x158
[=C2=A0=C2=A0=C2=A0 3.490566] Code: 80 e0 01 0f 84 a7 00 00 00 49 89 f0 b8 =
11 ff ff 01 =

48 21 f9 49 c1 e8 12 48 c1 e0 27 41 81 e0 f8 0f 00 00 49 01 c0 49 8d 04 =

08 <48> f7 00 9f ff ff ff 0f 84 34 ff ff ff c7 02 02 00 00 00 48 8b 38
[=C2=A0=C2=A0=C2=A0 3.494020] RSP: 0000:ffffffff8239e700 EFLAGS: 00010086
[=C2=A0=C2=A0=C2=A0 3.494959] RAX: ffff110302110d90 RBX: 0000000000000001 R=
CX: =

ffff888302110000
[=C2=A0=C2=A0=C2=A0 3.496222] RDX: ffffffff8239e72c RSI: ffff88833653b000 R=
DI: =

ffff88833653a000
[=C2=A0=C2=A0=C2=A0 3.497363] RBP: ffffffff8239e808 R08: ffff888000000d90 R=
09: =

0000000000346000
[=C2=A0=C2=A0=C2=A0 3.498467] R10: 0000000000000001 R11: 0000000000000000 R=
12: =

0000000000000001
[=C2=A0=C2=A0=C2=A0 3.499554] R13: 0000000000000000 R14: ffff88833653b000 R=
15: =

0000000000000000
[=C2=A0=C2=A0=C2=A0 3.500638] FS:=C2=A0 0000000000000000(0000) GS:ffffffff8=
243d000(0000) =

knlGS:0000000000000000
[=C2=A0=C2=A0=C2=A0 3.501863] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
[=C2=A0=C2=A0=C2=A0 3.503036] CR2: ffff8883447ff000 CR3: 0000000002420000 C=
R4: =

00000000000006b0
[=C2=A0=C2=A0=C2=A0 3.504116] DR0: 0000000000000000 DR1: 0000000000000000 D=
R2: =

0000000000000000
[=C2=A0=C2=A0=C2=A0 3.505156] DR3: 0000000000000000 DR6: 00000000fffe0ff0 D=
R7: =

0000000000000400
[=C2=A0=C2=A0=C2=A0 3.506225] Call Trace:
[=C2=A0=C2=A0=C2=A0 3.506597] Modules linked in:
[=C2=A0=C2=A0=C2=A0 3.507255] random: get_random_bytes called from =

init_oops_id+0x1d/0x2c with crng_init=3D0
[=C2=A0=C2=A0=C2=A0 3.508734] ---[ end trace 0000000000000000 ]---


Best Regards,
Rong Chen
--===============2400593707675041419==--

