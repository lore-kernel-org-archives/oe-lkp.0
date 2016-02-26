Content-Type: multipart/mixed; boundary="===============8112696841979942855=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [vfs] 0e00f1a079: INFO: trying to register non-static key.
Date: Fri, 26 Feb 2016 09:58:35 +0800
Message-ID: <20160226015835.GB2170@wfg-t540p.sh.intel.com>
In-Reply-To: <CS1PR84MB03123DB68B2736307DB2A875F1A70@CS1PR84MB0312.NAMPRD84.PROD.OUTLOOK.COM>
List-Id: <oe-lkp.lists.linux.dev>

--===============8112696841979942855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Got it, thanks!

On Fri, Feb 26, 2016 at 09:02:15AM +0800, Long, Wai Man wrote:
> Hi,
> =

> The new v4 patch should eliminate the INFO and backtrace that you saw in =
the boot test.
> =

> Thanks,
> Longman
> =

> -----Original Message-----
> From: kernel test robot [mailto:fengguang.wu(a)intel.com]
> Sent: Tuesday, February 23, 2016 9:05 PM
> To: Long, Wai Man
> Cc: LKP; 0day robot; wfg(a)linux.intel.com
> Subject: [vfs] 0e00f1a079: INFO: trying to register non-static key.
> =

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux Waiman-Long/vfs-Use-per-cpu-list-for-SB-=
s-s_inodes-list/20160224-030850
> =

> commit 0e00f1a079552d9c4e397d9d5cef9e7f16110493
> Author:     Waiman Long <Waiman.Long@hpe.com>
> AuthorDate: Tue Feb 23 14:04:32 2016 -0500
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Wed Feb 24 03:08:57 2016 +0800
> =

>     vfs: Use per-cpu list for superblock's inode list
> =

>     When many threads are trying to add or delete inode to or from
>     a superblock's s_inodes list, spinlock contention on the list can
>     become a performance bottleneck.
> =

>     This patch changes the s_inodes field to become a per-cpu list with
>     per-cpu spinlocks. As a result, the following superblock inode list
>     (sb->s_inodes) iteration functions in vfs are also being modified:
> =

>      1. iterate_bdevs()
>      2. drop_pagecache_sb()
>      3. wait_sb_inodes()
>      4. evict_inodes()
>      5. invalidate_inodes()
>      6. fsnotify_unmount_inodes()
>      7. add_dquot_ref()
>      8. remove_dquot_ref()
> =

>     With an exit microbenchmark that creates a large number of threads,
>     attachs many inodes to them and then exits. The runtimes of that
>     microbenchmark with 1000 threads before and after the patch on a
>     4-socket Intel E7-4820 v3 system (40 cores, 80 threads) were as
>     follows:
> =

>       Kernel            Elapsed Time    System Time
>       ------            ------------    -----------
>       Vanilla 4.5-rc4      65.29s         82m14s
>       Patched 4.5-rc4      22.81s         23m03s
> =

>     Before the patch, spinlock contention at the inode_sb_list_add()
>     function at the startup phase and the inode_sb_list_del() function at
>     the exit phase were about 79% and 93% of total CPU time respectively
>     (as measured by perf). After the patch, the percpu_list_add()
>     function consumed only about 0.04% of CPU time at startup phase. The
>     percpu_list_del() function consumed about 0.4% of CPU time at exit
>     phase. There were still some spinlock contention, but they happened
>     elsewhere.
> =

>     Signed-off-by: Waiman Long <Waiman.Long@hpe.com>
> =

> +----------------------------------------+------------+------------+-----=
-------+
> |                                        | a85f89ba33 | 0e00f1a079 | 2220=
d6e058 |
> +----------------------------------------+------------+------------+-----=
-------+
> | boot_successes                         | 63         | 0          | 0   =
       |
> | boot_failures                          | 0          | 26         | 13  =
       |
> | INFO:trying_to_register_non-static_key | 0          | 26         | 13  =
       |
> | backtrace:vfs_kern_mount               | 0          | 26         | 13  =
       |
> | backtrace:mnt_init                     | 0          | 26         | 13  =
       |
> | backtrace:vfs_caches_init              | 0          | 26         | 13  =
       |
> +----------------------------------------+------------+------------+-----=
-------+
> =

> [    0.726094] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.728053] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 =
bytes)
> [    0.728053] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 =
bytes)
> [    0.730572] INFO: trying to register non-static key.
> [    0.730572] INFO: trying to register non-static key.
> [    0.732040] the code is fine but needs lockdep annotation.
> [    0.732040] the code is fine but needs lockdep annotation.
> [    0.733653] turning off the locking correctness validator.
> =

> git bisect start 2220d6e058736159c7d557d4491c25b71c510709 81f70ba233d5f66=
0e1ea5fe23260ee323af5d53a --
> git bisect  bad 2ca1641b3b1ae6ae0303dab3ce3ca0b9f261a4b7  # 08:09      0-=
     24  Merge 'linux-review/PC-Liao/ASoC-mediatek-remove-soft-reset-and-ad=
d-second-I2S-clock/20160223-162321' into devel-spot-201602240728
> git bisect good d37dbb47aaaa323808a0fccd99a2c77708176db1  # 08:20     22+=
      0  Merge 'kees/kspp/lkdtm-atomics' into devel-spot-201602240728
> git bisect  bad b5566f3331202e10f593e2789f9ae218ff9a88b1  # 08:35      0-=
     17  Merge 'linux-review/Mauro-Carvalho-Chehab/ivtv-mailbox-avoid-confu=
sing-smatch/20160223-181216' into devel-spot-201602240728
> git bisect  bad 0d0183e5ed25c883f21c23a77ad170eb2dadf33d  # 08:47      0-=
     24  Merge 'linux-review/Hans-Verkuil/soc_camera-omap1-move-to-staging-=
in-preparation-for-removal/20160223-201714' into devel-spot-201602240728
> git bisect  bad 1238373f95745817f3585ceba8a7803404e78076  # 09:02      0-=
     22  Merge 'linux-review/Waiman-Long/vfs-Use-per-cpu-list-for-SB-s-s_in=
odes-list/20160224-030850' into devel-spot-201602240728
> git bisect good 31156742329f456bd2f8561d1559ae12529463e9  # 09:07     20+=
      0  Merge 'kees/dm/do_mounts' into devel-spot-201602240728
> git bisect good 583c2e5225d522b65d389e6bed00dc79d923731d  # 09:13     20+=
      0  Merge 'kvmarm/master' into devel-spot-201602240728
> git bisect good 540792edaf897fb34550cfce660da1e7e3a2eb76  # 09:20     22+=
      0  Merge 'linux-review/Sergei-Ianovich/mtd-support-BB-SRAM-on-ICP-DAS=
-LP-8x4x/20160224-030049' into devel-spot-201602240728
> git bisect good a85f89ba3365a313432caf59f43e8de6aa78fb45  # 09:26     22+=
      0  fsnotify: Simplify inode iteration on umount
> git bisect  bad 0e00f1a079552d9c4e397d9d5cef9e7f16110493  # 09:31      0-=
     22  vfs: Use per-cpu list for superblock's inode list
> # first bad commit: [0e00f1a079552d9c4e397d9d5cef9e7f16110493] vfs: Use p=
er-cpu list for superblock's inode list
> git bisect good a85f89ba3365a313432caf59f43e8de6aa78fb45  # 09:35     63+=
      0  fsnotify: Simplify inode iteration on umount
> # extra tests with DEBUG_INFO
> git bisect  bad 0e00f1a079552d9c4e397d9d5cef9e7f16110493  # 09:41      0-=
     12  vfs: Use per-cpu list for superblock's inode list
> # extra tests on HEAD of linux-devel/devel-spot-201602240728
> git bisect  bad 2220d6e058736159c7d557d4491c25b71c510709  # 09:41      0-=
     13  0day head guard for 'devel-spot-201602240728'
> # extra tests on tree/branch linux-review/Waiman-Long/vfs-Use-per-cpu-lis=
t-for-SB-s-s_inodes-list/20160224-030850
> git bisect  bad 0e00f1a079552d9c4e397d9d5cef9e7f16110493  # 09:46      0-=
     26  vfs: Use per-cpu list for superblock's inode list
> # extra tests with first bad commit reverted
> git bisect good fad09e3ade895c6867555817cb19c7d3bb0bcd53  # 09:57     66+=
      0  Revert "vfs: Use per-cpu list for superblock's inode list"
> # extra tests on tree/branch linus/master
> git bisect good 4de8ebeff8ddefaceeb7fc6a9b1a514fc9624509  # 10:01     65+=
      0  Merge tag 'trace-fixes-v4.5-rc5' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rostedt/linux-trace
> # extra tests on tree/branch linux-next/master
> git bisect good 538fe56e2a6658270b2094c3f9f2439cf1887425  # 10:04     65+=
      0  Add linux-next specific files for 20160223
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dyocto-minimal-i386.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> qemu-system-x86_64
> -enable-kvm
> -cpu Haswell,+smep,+smap
> -kernel $kernel
> -initrd $initrd
> -m 256
> -smp 1
> -device e1000,netdev=3Dnet0
> -netdev user,id=3Dnet0
> -boot order=3Dnc
> -no-reboot
> -watchdog i6300esb
> -rtc base=3Dlocaltime
> -serial stdio
> -display none
> -monitor null
> )
> =

> append=3D(
> hung_task_panic=3D1
> earlyprintk=3DttyS0,115200
> systemd.log_level=3Derr
> debug
> apic=3Ddebug
> sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100
> panic=3D-1
> softlockup_panic=3D1
> nmi_watchdog=3Dpanic
> oops=3Dpanic
> load_ramdisk=3D2
> prompt_ramdisk=3D0
> console=3DttyS0,115200
> console=3Dtty0
> vga=3Dnormal
> root=3D/dev/ram0
> rw
> drbd.minor_count=3D8
> )
> =

> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

--===============8112696841979942855==--

