Content-Type: multipart/mixed; boundary="===============6216979887175952707=="
MIME-Version: 1.0
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] [confidence: ] b3eab9f80b: kernel_BUG_at_fs/btrfs/raid56.c
Date: Wed, 15 Jun 2022 15:12:08 +0800
Message-ID: <11a59839-de31-a088-cf04-70a1a2cd07ee@gmx.com>
In-Reply-To: <20220615062938.GA36441@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6216979887175952707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2022/6/15 14:29, kernel test robot wrote:
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: b3eab9f80b60e3333e3ce3a7b7fbd323c71b00b1 ("btrfs: raid56: avoid d=
ouble for loop inside raid56_rmw_stripe()")
> https://github.com/kdave/btrfs-devel.git dev/sb-own-page

That's already an older commit.

That patch changed the behavior, from only iterating the data sectors,
to iterating all sectors.

And it's already fixed in latest version:
https://patchwork.kernel.org/project/linux-btrfs/patch/3dc86c8c745b6dce7e0d=
d32dc8d1d5007c284374.1654648358.git.wqu(a)suse.com/

Thanks,
Qu

>
> in testcase: xfstests
> version: xfstests-x86_64-c1144bf-1_20220609
> with following parameters:
>
> 	disk: 6HDD
> 	fs: btrfs
> 	test: btrfs-group-12
> 	ucode: 0x28
>
> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>
>
> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40=
GHz with 8G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [  112.856602][   T58] kernel BUG at fs/btrfs/raid56.c:1094!
> [  112.856609][   T58] invalid opcode: 0000 [#1] SMP KASAN PTI
> [  112.872903][   T58] CPU: 3 PID: 58 Comm: kworker/u16:3 Tainted: G S   =
             5.19.0-rc1-00068-gb3eab9f80b60 #1
> [  112.883430][   T58] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIO=
S A05 12/05/2013
> [  112.891349][   T58] Workqueue: btrfs-endio-raid56 raid56_rmw_end_io_wo=
rk [btrfs]
> [ 112.898810][ T58] RIP: 0010:raid56_rmw_end_io_work (fs/btrfs/raid56.c:1=
094 fs/btrfs/raid56.c:1542) btrfs
> [ 112.905561][ T58] Code: c0 75 54 80 7b e9 00 79 8f 5b 4c 89 e7 5d 41 5c=
 41 5d e9 67 98 ff ff 5b 4c 89 e7 5d be 0a 00 00 00 41 5c 41 5d e9 54 95 ff=
 ff <0f> 0b e8 0d ee 1d c0 e9 2c ff ff ff 48 89 ef e8 00 ee 1d c0 e9 cb
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>     0:	c0 75 54 80          	shlb   $0x80,0x54(%rbp)
>     4:	7b e9                	jnp    0xffffffffffffffef
>     6:	00 79 8f             	add    %bh,-0x71(%rcx)
>     9:	5b                   	pop    %rbx
>     a:	4c 89 e7             	mov    %r12,%rdi
>     d:	5d                   	pop    %rbp
>     e:	41 5c                	pop    %r12
>    10:	41 5d                	pop    %r13
>    12:	e9 67 98 ff ff       	jmpq   0xffffffffffff987e
>    17:	5b                   	pop    %rbx
>    18:	4c 89 e7             	mov    %r12,%rdi
>    1b:	5d                   	pop    %rbp
>    1c:	be 0a 00 00 00       	mov    $0xa,%esi
>    21:	41 5c                	pop    %r12
>    23:	41 5d                	pop    %r13
>    25:	e9 54 95 ff ff       	jmpq   0xffffffffffff957e
>    2a:*	0f 0b                	ud2    		<-- trapping instruction
>    2c:	e8 0d ee 1d c0       	callq  0xffffffffc01dee3e
>    31:	e9 2c ff ff ff       	jmpq   0xffffffffffffff62
>    36:	48 89 ef             	mov    %rbp,%rdi
>    39:	e8 00 ee 1d c0       	callq  0xffffffffc01dee3e
>    3e:	e9                   	.byte 0xe9
>    3f:	cb                   	lret
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0:	0f 0b                	ud2
>     2:	e8 0d ee 1d c0       	callq  0xffffffffc01dee14
>     7:	e9 2c ff ff ff       	jmpq   0xffffffffffffff38
>     c:	48 89 ef             	mov    %rbp,%rdi
>     f:	e8 00 ee 1d c0       	callq  0xffffffffc01dee14
>    14:	e9                   	.byte 0xe9
>    15:	cb                   	lret
> [  112.925035][   T58] RSP: 0018:ffffc9000046fdb0 EFLAGS: 00010246
> [  112.930960][   T58] RAX: 0000000000000002 RBX: ffff88821950a0a0 RCX: f=
fffffffc171faa6
> [  112.938795][   T58] RDX: 0000000000000005 RSI: 0000000000000004 RDI: f=
fff88821950a085
> [  112.946627][   T58] RBP: 0000000000000002 R08: 0000000000000000 R09: f=
fff88821950a09f
> [  112.954463][   T58] R10: ffffed10432a1413 R11: 0000000000000001 R12: f=
fff88821950a000
> [  112.962297][   T58] R13: 0000000000000001 R14: ffff888100df9518 R15: f=
fff888101f1b205
> [  112.970132][   T58] FS:  0000000000000000(0000) GS:ffff8881a4380000(00=
00) knlGS:0000000000000000
> [  112.978921][   T58] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  112.985365][   T58] CR2: 00007fb9dc7c6514 CR3: 000000021ce0e002 CR4: 0=
0000000001706e0
> [  112.993201][   T58] Call Trace:
> [  112.996346][   T58]  <TASK>
> [ 112.999140][ T58] process_one_work (arch/x86/include/asm/jump_label.h:2=
7 include/linux/jump_label.h:207 include/trace/events/workqueue.h:108 kerne=
l/workqueue.c:2294)
> [ 113.003937][ T58] worker_thread (include/linux/list.h:292 kernel/workqu=
eue.c:2437)
> [ 113.008383][ T58] ? process_one_work (kernel/workqueue.c:2379)
> [ 113.013435][ T58] kthread (kernel/kthread.c:376)
> [ 113.017360][ T58] ? kthread_complete_and_exit (kernel/kthread.c:331)
> [ 113.022850][ T58] ret_from_fork (arch/x86/entry/entry_64.S:308)
> [  113.027125][   T58]  </TASK>
> [  113.030006][   T58] Modules linked in: dm_flakey dm_mod btrfs blake2b_=
generic xor raid6_pq zstd_compress ipmi_devintf libcrc32c intel_rapl_msr in=
tel_rapl_common ipmi_msghandler i915 sd_mod t10_pi crc64_rocksoft_generic c=
rc64_rocksoft crc64 sg intel_gtt x86_pkg_temp_thermal intel_powerclamp core=
temp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul drm_buddy crc32c=
_intel ghash_clmulni_intel ahci drm_display_helper mei_wdt rapl libahci ttm=
 intel_cstate drm_kms_helper mei_me libata syscopyarea mei intel_uncore sys=
fillrect sysimgblt fb_sys_fops video drm fuse ip_tables
> [  113.080511][   T58] ---[ end trace 0000000000000000 ]---
> [ 113.080515][ T58] RIP: 0010:raid56_rmw_end_io_work (fs/btrfs/raid56.c:1=
094 fs/btrfs/raid56.c:1542) btrfs
> [ 113.080595][ T58] Code: c0 75 54 80 7b e9 00 79 8f 5b 4c 89 e7 5d 41 5c=
 41 5d e9 67 98 ff ff 5b 4c 89 e7 5d be 0a 00 00 00 41 5c 41 5d e9 54 95 ff=
 ff <0f> 0b e8 0d ee 1d c0 e9 2c ff ff ff 48 89 ef e8 00 ee 1d c0 e9 cb
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>     0:	c0 75 54 80          	shlb   $0x80,0x54(%rbp)
>     4:	7b e9                	jnp    0xffffffffffffffef
>     6:	00 79 8f             	add    %bh,-0x71(%rcx)
>     9:	5b                   	pop    %rbx
>     a:	4c 89 e7             	mov    %r12,%rdi
>     d:	5d                   	pop    %rbp
>     e:	41 5c                	pop    %r12
>    10:	41 5d                	pop    %r13
>    12:	e9 67 98 ff ff       	jmpq   0xffffffffffff987e
>    17:	5b                   	pop    %rbx
>    18:	4c 89 e7             	mov    %r12,%rdi
>    1b:	5d                   	pop    %rbp
>    1c:	be 0a 00 00 00       	mov    $0xa,%esi
>    21:	41 5c                	pop    %r12
>    23:	41 5d                	pop    %r13
>    25:	e9 54 95 ff ff       	jmpq   0xffffffffffff957e
>    2a:*	0f 0b                	ud2    		<-- trapping instruction
>    2c:	e8 0d ee 1d c0       	callq  0xffffffffc01dee3e
>    31:	e9 2c ff ff ff       	jmpq   0xffffffffffffff62
>    36:	48 89 ef             	mov    %rbp,%rdi
>    39:	e8 00 ee 1d c0       	callq  0xffffffffc01dee3e
>    3e:	e9                   	.byte 0xe9
>    3f:	cb                   	lret
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0:	0f 0b                	ud2
>     2:	e8 0d ee 1d c0       	callq  0xffffffffc01dee14
>     7:	e9 2c ff ff ff       	jmpq   0xffffffffffffff38
>     c:	48 89 ef             	mov    %rbp,%rdi
>     f:	e8 00 ee 1d c0       	callq  0xffffffffc01dee14
>    14:	e9                   	.byte 0xe9
>    15:	cb                   	lret
>
>
> To reproduce:
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          sudo bin/lkp install job.yaml           # job file is attached i=
n this email
>          bin/lkp split-job --compatible job.yaml # generate the yaml file=
 for lkp run
>          sudo bin/lkp run generated-yaml-file
>
>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
--===============6216979887175952707==--

