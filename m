Content-Type: multipart/mixed; boundary="===============6639150824160632687=="
MIME-Version: 1.0
From: Alexander Potapenko <glider@google.com>
To: lkp@lists.01.org
Subject: Re: [mm, kasan] 7392becb25: BUG: KASAN: slab-out-of-bounds in bucket_table_alloc+0x79/0x1a0 at addr ffff88003e400000
Date: Wed, 13 Jul 2016 10:57:32 +0200
Message-ID: <CAG_fn=WY7QmQJEr52Vvuake4e6M6NTbxD1-3K4zYZp_y2g3fNw@mail.gmail.com>
In-Reply-To: <20160713012919.GC25851@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6639150824160632687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello there,

I've built my kernel with the supplied config, but haven't managed to
reproduce the failure.
The test prints the following log:

[    2.554919] Testing concurrent rhashtable access from 10 threads
[    3.295575]   thread[4]: rhashtable_insert_fast failed
[    3.296065]   thread[9]: rhashtable_insert_fast failed
[    3.296491]   thread[0]: rhashtable_insert_fast failed
[    3.296948] Test failed: thread 0 returned: -12
[    3.297375]   thread[5]: rhashtable_insert_fast failed
[    7.843544] Test failed: thread 4 returned: -12
[    7.844341] Test failed: thread 5 returned: -12
[    7.859334] Test failed: thread 9 returned: -12
[    7.859772] Started 10 threads, 4 failed

Soon after that the kernel panics for an unrelated reason:

[   75.812970] Kernel panic - not syncing: No working init found.  Try
passing init=3D option to kernel. See Linux Documentation/init.txt for
guidance.
[   75.814048] CPU: 0 PID: 1 Comm: swapper Not tainted
4.7.0-rc7-00020-g4543d2b #1091
[   75.814749] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS Bochs 01/01/2011
[   75.815465]  0000000000000000 ffff88000010fe60 ffffffff812cd2d4
ffff88000010ff28
[   75.816140]  ffffffff811741f5 0000000041b58ab3 ffffffff8292ea1d
ffffffff811740ba
[   75.816787]  ffff8800170e615c ffffffff00000008 ffff88000010ff38
ffff88000010fed0
[   75.817426] Call Trace:
[   75.817659]  [<ffffffff812cd2d4>] dump_stack+0x19/0x1b
[   75.818126]  [<ffffffff811741f5>] panic+0x13b/0x27a
[   75.818517]  [<ffffffff811740ba>] ? phys_to_pfn_t+0x1d/0x1d
[   75.818960]  [<ffffffff81f8ae4a>] kernel_init+0xf4/0xfb
[   75.819376]  [<ffffffff81f9abef>] ret_from_fork+0x1f/0x40
[   75.819804]  [<ffffffff81f8ad56>] ? rest_init+0x13d/0x13d
[   75.820008] Kernel Offset: disabled
[   75.820008] ---[ end Kernel panic - not syncing: No working init
found.  Try passing init=3D option to kernel. See Linux
Documentation/init.txt for guidance.

I'm using the following commandline to run QEMU:

  $ sudo qemu-system-x86_64 -hda ${THISDIR}/wheezy.img -m 500M -smp 2
-net user,hostfwd=3Dtcp:127.0.0.1:10025-:22 -net nic \
                   -kernel $KASAN_SRC_DIR/arch/x86/boot/bzImage \
                   -append "console=3DttyS0 root=3D/dev/sda debug
earlyprintk=3Dserial slub_debug=3DFPZU" \
                   -nographic    -pidfile vm_pid  -enable-kvm  -s # -S
 -gdb unix:gdb,server,nowait

I have also built test_rhashtable.c as module and tried to load/unload
it many times in a row, but the report didn't reproduce for me either.

If it's still reproducible, may I ask you to run the output through
https://github.com/google/sanitizers/blob/master/address-sanitizer/tools/ka=
san_symbolize.py
?

TIA,
Alex

On Wed, Jul 13, 2016 at 3:29 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> https://github.com/0day-ci/linux Alexander-Potapenko/mm-kasan-switch-SLUB=
-to-stackdepot-enable-memory-quarantine-for-SLUB/20160708-183858
> commit 7392becb255cd6c0e7bedaabd58f638b732772f2 ("mm, kasan: switch SLUB =
to stackdepot, enable memory quarantine for SLUB")
>
> in testcase: boot
>
> on test machine: 2 threads qemu-system-x86_64 -enable-kvm -cpu Haswell,+s=
mep,+smap with 1G memory
>
> caused below changes:
>
>
> +------------------------------------------------------------------------=
-----------------+----------+------------+
> |                                                                        =
                 | v4.7-rc6 | 7392becb25 |
> +------------------------------------------------------------------------=
-----------------+----------+------------+
> | boot_successes                                                         =
                 | 0        | 0          |
> | boot_failures                                                          =
                 | 61       | 36         |
> | BUG:workqueue_lockup-pool                                              =
                 | 58       | 14         |
> | BUG:workqueue_lockup-pool_cpus=3D#cpus=3D#node=3D#node=3D#flags=3D#nice=
=3D#flags=3D#nice=3D#stuck_for#s | 58       | 14         |
> | BUG:workqueue_lockup-pool_cpus=3D#cpus=3D#flags=3D#nice=3D#flags=3D#nic=
e=3D#stuck_for#s             | 12       | 1          |
> | Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D            =
                   | 9        |            |
> | BUG:KASAN:slab-out-of-bounds_in_bucket_table_alloc_at_addr             =
                 | 0        | 22         |
> | backtrace:threadfunc                                                   =
                 | 0        | 22         |
> | BUG:KASAN:slab-out-of-bounds_in                                        =
                 | 0        | 1          |
> +------------------------------------------------------------------------=
-----------------+----------+------------+
>
>
>
> [   22.095742] Testing concurrent rhashtable access from 10 threads
> [   22.756188] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   22.756188] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   22.759097] BUG: KASAN: slab-out-of-bounds in bucket_table_alloc+0x79/=
0x1a0 at addr ffff88003e400000
> [   22.759097] BUG: KASAN: slab-out-of-bounds in bucket_table_alloc+0x79/=
0x1a0 at addr ffff88003e400000
> [   22.762225] Write of size 4 by task rhashtable_thra/165
> [   22.762225] Write of size 4 by task rhashtable_thra/165
> [   22.764303] CPU: 0 PID: 165 Comm: rhashtable_thra Not tainted 4.7.0-rc=
6-00001-g7392bec #1
> [   22.764303] CPU: 0 PID: 165 Comm: rhashtable_thra Not tainted 4.7.0-rc=
6-00001-g7392bec #1
> [   22.766875] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   22.766875] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   22.769722]  0000000000000000
> [   22.769722]  0000000000000000 ffff8800165f7be8 ffff8800165f7be8 ffffff=
ff812cd64c ffffffff812cd64c ffff8800165f7c58 ffff8800165f7c58
>
> [   22.772033]  ffffffff811c4b96
> [   22.772033]  ffffffff811c4b96 ffffffff812ec3c8 ffffffff812ec3c8 000000=
0000000246 0000000000000246 ffff880000082300 ffff880000082300
>
> [   22.774265]  0000000002089220
> [   22.774265]  0000000002089220 0000000002089220 0000000002089220 ffff88=
00165f7c68 ffff8800165f7c68 ffffffff811c2379 ffffffff811c2379
>
> [   22.776571] Call Trace:
> [   22.776571] Call Trace:
> [   22.777355]  [<ffffffff812cd64c>] dump_stack+0x19/0x1b
> [   22.777355]  [<ffffffff812cd64c>] dump_stack+0x19/0x1b
> [   22.779220]  [<ffffffff811c4b96>] kasan_report+0x2d7/0x4ed
> [   22.779220]  [<ffffffff811c4b96>] kasan_report+0x2d7/0x4ed
> [   22.780862]  [<ffffffff812ec3c8>] ? bucket_table_alloc+0x79/0x1a0
> [   22.780862]  [<ffffffff812ec3c8>] ? bucket_table_alloc+0x79/0x1a0
> [   22.782668]  [<ffffffff811c2379>] ? __kmalloc+0x177/0x1b0
> [   22.782668]  [<ffffffff811c2379>] ? __kmalloc+0x177/0x1b0
> [   22.784273]  [<ffffffff811c46b0>] __asan_store4+0x6e/0x70
> [   22.784273]  [<ffffffff811c46b0>] __asan_store4+0x6e/0x70
> [   22.785885]  [<ffffffff812ec3c8>] bucket_table_alloc+0x79/0x1a0
> [   22.785885]  [<ffffffff812ec3c8>] bucket_table_alloc+0x79/0x1a0
> [   22.787660]  [<ffffffff812ecfb7>] rhashtable_insert_rehash+0xc0/0x13f
> [   22.787660]  [<ffffffff812ecfb7>] rhashtable_insert_rehash+0xc0/0x13f
> [   22.789577]  [<ffffffff812f15d5>] insert_retry+0x2fa/0x5bc
> [   22.789577]  [<ffffffff812f15d5>] insert_retry+0x2fa/0x5bc
> [   22.791705]  [<ffffffff81101f19>] ? trace_hardirqs_on+0xd/0xf
> [   22.791705]  [<ffffffff81101f19>] ? trace_hardirqs_on+0xd/0xf
> [   22.793425]  [<ffffffff812f195f>] threadfunc+0xc8/0x68c
> [   22.793425]  [<ffffffff812f195f>] threadfunc+0xc8/0x68c
> [   22.794987]  [<ffffffff81f92dbe>] ? __schedule+0x5fe/0x73f
> [   22.794987]  [<ffffffff81f92dbe>] ? __schedule+0x5fe/0x73f
> [   22.796629]  [<ffffffff812f1897>] ? insert_retry+0x5bc/0x5bc
> [   22.796629]  [<ffffffff812f1897>] ? insert_retry+0x5bc/0x5bc
> [   22.798810]  [<ffffffff810e5c55>] kthread+0x18d/0x19c
> [   22.798810]  [<ffffffff810e5c55>] kthread+0x18d/0x19c
> [   22.800319]  [<ffffffff810e5ac8>] ? __kthread_parkme+0xb0/0xb0
> [   22.800319]  [<ffffffff810e5ac8>] ? __kthread_parkme+0xb0/0xb0
> [   22.802048]  [<ffffffff810ea54c>] ? finish_task_switch+0x1ac/0x224
> [   22.802048]  [<ffffffff810ea54c>] ? finish_task_switch+0x1ac/0x224
> [   22.804976]  [<ffffffff81f9986f>] ret_from_fork+0x1f/0x40
> [   22.804976]  [<ffffffff81f9986f>] ret_from_fork+0x1f/0x40
> [   22.807662]  [<ffffffff810e5ac8>] ? __kthread_parkme+0xb0/0xb0
> [   22.807662]  [<ffffffff810e5ac8>] ? __kthread_parkme+0xb0/0xb0
> [   22.810556] Object at ffff88003e400000, in cache kmalloc-4194304
> [   22.810556] Object at ffff88003e400000, in cache kmalloc-4194304
> [   22.813231] Memory state around the buggy address:
>
>
> FYI, raw QEMU command line is:
>
>         qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap -kernel /=
pkg/linux/x86_64-randconfig-s2-07120443/gcc-6/7392becb255cd6c0e7bedaabd58f6=
38b732772f2/vmlinuz-4.7.0-rc6-00001-g7392bec -append 'root=3D/dev/ram0 user=
=3Dlkp job=3D/lkp/scheduled/vm-kbuild-1G-5/bisect_boot-1-debian-x86_64-2015=
-02-07.cgz-x86_64-randconfig-s2-07120443-7392becb255cd6c0e7bedaabd58f638b73=
2772f2-20160712-21427-xipcnl-0.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-randconf=
ig-s2-07120443 branch=3Dlinux-devel/devel-spot-201607120350 commit=3D7392be=
cb255cd6c0e7bedaabd58f638b732772f2 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfi=
g-s2-07120443/gcc-6/7392becb255cd6c0e7bedaabd58f638b732772f2/vmlinuz-4.7.0-=
rc6-00001-g7392bec max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-kbuild-=
1G/debian-x86_64-2015-02-07.cgz/x86_64-randconfig-s2-07120443/gcc-6/7392bec=
b255cd6c0e7bedaabd58f638b732772f2/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,11=
5200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupda=
te.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=
=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,1=
15200 console=3Dtty0 vga=3Dnormal rw ip=3D::::vm-kbuild-1G-5::dhcp'  -initr=
d /fs/sdg1/initrd-vm-kbuild-1G-5 -m 1024 -smp 2 -device e1000,netdev=3Dnet0=
 -netdev user,id=3Dnet0,hostfwd=3Dtcp::23004-:22 -boot order=3Dnc -no-reboo=
t -watchdog i6300esb -rtc base=3Dlocaltime -device virtio-scsi-pci,id=3Dscs=
i0 -drive file=3D/fs/sdg1/disk0-vm-kbuild-1G-5,if=3Dnone,id=3Dhd0,media=3Dd=
isk,aio=3Dnative,cache=3Dnone -device scsi-hd,bus=3Dscsi0.0,drive=3Dhd0,scs=
i-id=3D1,lun=3D0 -drive file=3D/fs/sdg1/disk1-vm-kbuild-1G-5,if=3Dnone,id=
=3Dhd1,media=3Ddisk,aio=3Dnative,cache=3Dnone -device scsi-hd,bus=3Dscsi0.0=
,drive=3Dhd1,scsi-id=3D1,lun=3D1 -drive file=3D/fs/sdg1/disk2-vm-kbuild-1G-=
5,if=3Dnone,id=3Dhd2,media=3Ddisk,aio=3Dnative,cache=3Dnone -device scsi-hd=
,bus=3Dscsi0.0,drive=3Dhd2,scsi-id=3D1,lun=3D2 -drive file=3D/fs/sdg1/disk3=
-vm-kbuild-1G-5,if=3Dnone,id=3Dhd3,media=3Ddisk,aio=3Dnative,cache=3Dnone -=
device scsi-hd,bus=3Dscsi0.0,drive=3Dhd3,scsi-id=3D1,lun=3D3 -drive file=3D=
/fs/sdg1/disk4-vm-kbuild-1G-5,if=3Dnone,id=3Dhd4,media=3Ddisk,aio=3Dnative,=
cache=3Dnone -device scsi-hd,bus=3Dscsi0.0,drive=3Dhd4,scsi-id=3D1,lun=3D4 =
-pidfile /dev/shm/kboot/pid-vm-kbuild-1G-5 -serial file:/dev/shm/kboot/seri=
al-vm-kbuild-1G-5 -daemonize -display none -monitor null
>
>
>
>
>
> Thanks,
> Xiaolong



-- =

Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Matthew Scott Sucherman, Paul Terence Manicle
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg

--===============6639150824160632687==--

