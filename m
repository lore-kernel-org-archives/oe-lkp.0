Content-Type: multipart/mixed; boundary="===============7399885609955292416=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/rmap] cd62734ca6: BUG:sleeping_function_called_from_invalid_context_at_include/linux/pagemap.h
Date: Sun, 11 Jul 2021 09:29:49 -0700
Message-ID: <c37fa42d-de83-42f6-1940-aa587e7b537c@google.com>
In-Reply-To: <20210711151446.GB4070@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7399885609955292416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 11 Jul 2021, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with clang-13):
> =

> commit: cd62734ca60dbb2ab5bb19c8d837dd9990955310 ("mm/rmap: split try_to_=
munlock from try_to_unmap")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: trinity
> version: trinity-static-x86_64-x86_64-1c734c75-1_2020-01-06
> with following parameters:
> =

> 	number: 99999
> 	group: group-01
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
------+------------+------------+
> |                                                                        =
      | 4dd845b5a3 | cd62734ca6 |
> +------------------------------------------------------------------------=
------+------------+------------+
> | BUG:sleeping_function_called_from_invalid_context_at_include/linux/page=
map.h | 0          | 18         |
> +------------------------------------------------------------------------=
------+------------+------------+

Thanks, yes, syzbot found the same on linux-next yesterday.
It is already fixed by =

mm-rmap-fix-new-bug-premature-return-from-page_mlock_one.patch
in mmotm:
https://lore.kernel.org/mm-commits/20210709231537.9l6O6%25akpm(a)linux-foun=
dation.org/T/#u

Hugh

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [  110.877703] BUG: sleeping function called from invalid context at incl=
ude/linux/pagemap.h:624
> [  110.879142] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 258=
8, name: trinity-c0
> [  110.880103] 2 locks held by trinity-c0/2588:
> [  110.880624]  #0: ffff88810bc2b178 (&mm->mmap_lock#2){++++}-{3:3}, at: =
__x64_sys_munlockall+0x90/0x1d3
> [  110.881793]  #1: ffff88811dd82f08 (ptlock_ptr(page)#2){+.+.}-{2:2}, at=
: page_vma_mapped_walk+0x1066/0x1394
> [  110.882974] CPU: 0 PID: 2588 Comm: trinity-c0 Not tainted 5.13.0+ #1
> [  110.883721] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  110.884699] Call Trace:
> [  110.885017]  dump_stack_lvl+0xff/0x18c
> [  110.885485]  dump_stack+0x10/0x12
> [  110.885907]  ___might_sleep+0x39c/0x47d
> [  110.886353]  __might_sleep+0x95/0xe0
> [  110.886774]  munlock_vma_pages_range+0xf24/0x165b
> [  110.887328]  ? vma_merge+0x2a1/0x738
> [  110.887763]  ? __schedule+0x120a/0x17e8
> [  110.888236]  mlock_fixup+0x286/0x35e
> [  110.888659]  apply_mlockall_flags+0x1ed/0x266
> [  110.889185]  __x64_sys_munlockall+0xf5/0x1d3
> [  110.889695]  do_syscall_64+0x46/0xa6
> [  110.890147]  ? asm_exc_page_fault+0x8/0x30
> [  110.890646]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  110.891242] RIP: 0033:0x463657
> [  110.891626] Code: 00 66 90 b8 1c 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 8=
3 bd 58 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 98 00 00 00 0f 05 <=
48> 3d 01 f0 ff ff 0f 83 9d 58 00 00 c3 66 2e 0f 1f 84 00 00 00 00
> [  110.893729] RSP: 002b:00007ffdb2ff07e8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000098
> [  110.894639] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000000000=
0463657
> [  110.895462] RDX: 0000000000000000 RSI: 0000000000002000 RDI: 000000000=
0000000
> [  110.896304] RBP: 0000000000001000 R08: ffffffffffffffff R09: 000000000=
0000000
> [  110.897118] R10: 0000000000000022 R11: 0000000000000246 R12: 000000000=
04bc5a0
> [  110.897955] R13: 00000000012ac1d0 R14: 000000000000067d R15: 000000000=
0000008
> [  110.898870] =

> [  110.899074] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  110.899542] [ BUG: Invalid wait context ]
> [  110.900011] 5.13.0+ #1 Tainted: G        W        =

> [  110.900554] -----------------------------
> [  110.900976] trinity-c0/2588 is trying to lock:
> [  110.901484] ffff888109665498 (&mapping->i_mmap_rwsem){++++}-{3:3}, at:=
 rmap_walk_file+0x147/0x5d3
> [  110.902545] other info that might help us debug this:
> [  110.903129] context-{4:4}
> [  110.903456] 2 locks held by trinity-c0/2588:
> [  110.903964]  #0: ffff88810bc2b178 (&mm->mmap_lock#2){++++}-{3:3}, at: =
__x64_sys_munlockall+0x90/0x1d3
> [  110.905044]  #1: ffff88811dd82f08 (ptlock_ptr(page)#2){+.+.}-{2:2}, at=
: page_vma_mapped_walk+0x1066/0x1394
> [  110.906195] stack backtrace:
> [  110.906544] CPU: 0 PID: 2588 Comm: trinity-c0 Tainted: G        W     =
    5.13.0+ #1
> [  110.907426] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  110.908390] Call Trace:
> [  110.908698]  dump_stack_lvl+0xff/0x18c
> [  110.909163]  dump_stack+0x10/0x12
> [  110.909569]  __lock_acquire+0x14f8/0x1fa1
> [  110.910082]  lock_acquire+0x213/0x3f9
> [  110.910530]  ? rmap_walk_file+0x147/0x5d3
> [  110.911022]  ? rmap_walk_file+0x147/0x5d3
> [  110.911482]  down_read+0x48/0x82
> [  110.911866]  ? rmap_walk_file+0x147/0x5d3
> [  110.912327]  rmap_walk_file+0x147/0x5d3
> [  110.912789]  ? mark_lock+0x9f/0x36f
> [  110.913202]  rmap_walk+0x73/0x8b
> [  110.913593]  page_mlock+0x171/0x1b6
> [  110.914021]  ? page_mlock+0x1b6/0x1b6
> [  110.914451]  ? try_to_unmap_one+0x154a/0x154a
> [  110.914960]  ? page_get_anon_vma+0x1e7/0x1e7
> [  110.915459]  __munlock_isolated_page+0xac/0x16a
> [  110.918000]  munlock_vma_pages_range+0x13d5/0x165b
> [  110.918571]  ? vma_merge+0x2a1/0x738
> [  110.918990]  ? __schedule+0x120a/0x17e8
> [  110.919456]  mlock_fixup+0x286/0x35e
> [  110.919887]  apply_mlockall_flags+0x1ed/0x266
> [  110.920404]  __x64_sys_munlockall+0xf5/0x1d3
> [  110.920917]  do_syscall_64+0x46/0xa6
> [  110.921351]  ? asm_exc_page_fault+0x8/0x30
> [  110.921857]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  110.922443] RIP: 0033:0x463657
> [  110.922813] Code: 00 66 90 b8 1c 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 8=
3 bd 58 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 98 00 00 00 0f 05 <=
48> 3d 01 f0 ff ff 0f 83 9d 58 00 00 c3 66 2e 0f 1f 84 00 00 00 00
> [  110.924903] RSP: 002b:00007ffdb2ff07e8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000098
> [  110.925791] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000000000=
0463657
> [  110.926589] RDX: 0000000000000000 RSI: 0000000000002000 RDI: 000000000=
0000000
> [  110.927406] RBP: 0000000000001000 R08: ffffffffffffffff R09: 000000000=
0000000
> [  110.928217] R10: 0000000000000022 R11: 0000000000000246 R12: 000000000=
04bc5a0
> [  110.928993] R13: 00000000012ac1d0 R14: 000000000000067d R15: 000000000=
0000008
> [  110.956834] BUG: scheduling while atomic: trinity-c0/2588/0x00000002
> [  110.957618] INFO: lockdep is turned off.
> [  110.958101] Modules linked in:
> [  110.958477] CPU: 0 PID: 2588 Comm: trinity-c0 Tainted: G        W     =
    5.13.0+ #1
> [  110.959369] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  110.960324] Call Trace:
> [  110.960630]  dump_stack_lvl+0xff/0x18c
> [  110.961088]  dump_stack+0x10/0x12
> [  110.961492]  __schedule_bug+0x111/0x1a0
> [  110.961966]  __schedule+0x1293/0x17e8
> [  110.962400]  ? __kasan_check_read+0x11/0x13
> [  110.962884]  ? lock_release+0xf5/0xb70
> [  110.963337]  ? exit_to_user_mode_loop+0x24/0xff
> [  110.963860]  ? exit_to_user_mode_prepare+0x9a/0xc8
> [  110.964416]  schedule+0x99/0x134
> [  110.964804]  exit_to_user_mode_loop+0x2f/0xff
> [  110.965329]  exit_to_user_mode_prepare+0x9a/0xc8
> [  110.965908]  syscall_exit_to_user_mode+0x52/0x200
> [  110.966453]  do_syscall_64+0x52/0xa6
> [  110.966895]  ? asm_exc_page_fault+0x8/0x30
> [  110.967378]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  110.967960] RIP: 0033:0x463657
> [  110.968327] Code: 00 66 90 b8 1c 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 8=
3 bd 58 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 98 00 00 00 0f 05 <=
48> 3d 01 f0 ff ff 0f 83 9d 58 00 00 c3 66 2e 0f 1f 84 00 00 00 00
> [  110.970409] RSP: 002b:00007ffdb2ff07e8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000098
> [  110.971267] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000=
0463657
> [  110.972075] RDX: 0000000000000000 RSI: 0000000000002000 RDI: 000000000=
0000000
> [  110.972925] RBP: 0000000000001000 R08: ffffffffffffffff R09: 000000000=
0000000
> [  110.973759] R10: 0000000000000022 R11: 0000000000000246 R12: 000000000=
04bc5a0
> [  110.974546] R13: 00000000012ac1d0 R14: 000000000000067d R15: 000000000=
0000008
> =

> Kboot worker: lkp-worker40
> Elapsed time: 120
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu SandyBridge
> 	-kernel $kernel
> 	-initrd initrd-vm-snb-104.cgz
> 	-m 16384
> 	-smp 2
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0,hostfwd=3Dtcp::32032-:22
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-watchdog-action debug
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
> =

> append=3D(
> 	ip=3D::::vm-snb-104::dhcp
> 	root=3D/dev/ram0
> 	user=3Dlkp
> 	job=3D/job-script
> 	ARCH=3Dx86_64
> 	kconfig=3Dx86_64-randconfig-a005-20210706
> 	branch=3Dlinus/master
> 	commit=3Dcd62734ca60dbb2ab5bb19c8d837dd9990955310
> 	BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a005-20210706/clang-13/cd62734=
ca60dbb2ab5bb19c8d837dd9990955310/vmlinuz-5.13.0+
> 	vmalloc=3D512M
> 	initramfs_async=3D0
> 	max_uptime=3D2100
> 	RESULT_ROOT=3D/result/trinity/group-01-99999/vm-snb/yocto-x86_64-minimal=
-20190520.cgz/x86_64-randconfig-a005-20210706/clang-13/cd62734ca60dbb2ab5bb=
19c8d837dd9990955310/21
> 	result_service=3Dtmpfs
> 	selinux=3D0
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	net.ifnames=3D0
> 	printk.devkmsg=3Don
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	drbd.minor_count=3D8
> 	systemd.log_level=3Derr
> 	ignore_loglevel
> 	console=3Dtty0
> 	earlyprintk=3DttyS0,115200
> 	console=3DttyS0,115200
> 	vga=3Dnormal
> 	rw
> 	rcuperf.shutdown=3D0
> 	watchdog_thresh=3D240
> )
> =

> "${kvm[@]}" -append "${append[*]}"
> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.13.0+ .config
> 	make HOSTCC=3Dclang-13 CC=3Dclang-13 ARCH=3Dx86_64 olddefconfig prepare =
modules_prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
> =

> Thanks,
> Oliver Sang
--===============7399885609955292416==--

