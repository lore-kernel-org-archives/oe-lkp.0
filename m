Content-Type: multipart/mixed; boundary="===============2712828410565626184=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [Btrfs] 8e7f04c76d: xfstests.btrfs.061.fail
Date: Mon, 30 Mar 2020 16:41:54 +0800
Message-ID: <c31a186a-b124-55e6-658c-3d3e976becb8@intel.com>
In-Reply-To: <4b182262-a81c-cdc9-e906-b90433a14a87@suse.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2712828410565626184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 3/28/20 10:09 PM, Filipe Manana wrote:
>
> On 28/03/20 13:29, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 8e7f04c76ddb99524994d2d8cd45cb7f6464726d ("Btrfs: simplify inlin=
e extent handling when doing reflinks")
>> https://github.com/kdave/btrfs-devel.git misc-next
>>
>> in testcase: xfstests
>> with following parameters:
>>
>> 	disk: 6HDD
>> 	fs: btrfs
>> 	test: btrfs-group00
>>
>> test-description: xfstests is a regression test suite for xfs and other =
files ystems.
>> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>>
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 8G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>
>> 2020-03-28 03:51:45 export TEST_DIR=3D/fs/vda
>> 2020-03-28 03:51:45 export TEST_DEV=3D/dev/vda
>> 2020-03-28 03:51:45 export FSTYP=3Dbtrfs
>> 2020-03-28 03:51:45 export SCRATCH_MNT=3D/fs/scratch
>> 2020-03-28 03:51:45 mkdir /fs/scratch -p
>> 2020-03-28 03:51:45 export SCRATCH_DEV_POOL=3D"/dev/vdb /dev/vdc /dev/vd=
d /dev/vde /dev/vdf"
>> 2020-03-28 03:51:45 sed "s:^:btrfs/:" //lkp/benchmarks/xfstests/tests/bt=
rfs-group00
>> 2020-03-28 03:51:45 ./check btrfs/001 btrfs/004 btrfs/007 btrfs/010 btrf=
s/013 btrfs/016 btrfs/019 btrfs/022 btrfs/025 btrfs/028 btrfs/031 btrfs/034=
 btrfs/037 btrfs/040 btrfs/043 btrfs/046 btrfs/049 btrfs/052 btrfs/055 btrf=
s/058 btrfs/061 btrfs/064 btrfs/067 btrfs/071 btrfs/074 btrfs/077 btrfs/080=
 btrfs/083 btrfs/086 btrfs/089 btrfs/092 btrfs/095 btrfs/098 btrfs/101 btrf=
s/104 btrfs/107 btrfs/110 btrfs/113 btrfs/116 btrfs/119 btrfs/122 btrfs/125=
 btrfs/128 btrfs/131 btrfs/134 btrfs/137 btrfs/140 btrfs/143 btrfs/146 btrf=
s/149 btrfs/152 btrfs/155 btrfs/158 btrfs/161 btrfs/164 btrfs/167 btrfs/170=
 btrfs/173 btrfs/176 btrfs/179 btrfs/182 btrfs/185 btrfs/188 btrfs/191 btrf=
s/194 btrfs/197 btrfs/200 btrfs/203 btrfs/206
>> btrfs/206 - unknown test, ignored
>> FSTYP         -- btrfs
>> PLATFORM      -- Linux/x86_64 vm-snb-45 5.6.0-rc5-00168-g8e7f04c76ddb9 #=
1 SMP Fri Mar 27 16:10:31 CST 2020
>> MKFS_OPTIONS  -- /dev/vdb
>> MOUNT_OPTIONS -- /dev/vdb /fs/scratch
>>
>> btrfs/001	 69s
>> btrfs/004	 170s
>> btrfs/007	 2s
>> btrfs/010	 151s
>> btrfs/013	 11s
>> btrfs/016	 2s
>> btrfs/019	 0s
>> btrfs/022	 5s
>> btrfs/025	 1s
>> btrfs/028	 31s
>> btrfs/031	 1s
>> btrfs/034	 8s
>> btrfs/037	 1s
>> btrfs/040	 1s
>> btrfs/043	 1s
>> btrfs/046	 18s
>> btrfs/049	 6s
>> btrfs/052	 17s
>> btrfs/055	 2s
>> btrfs/058	 3s
>> btrfs/061	_check_dmesg: something found in dmesg (see /lkp/benchmarks/xf=
stests/results//btrfs/061.dmesg)
> False alarm...

Sorry for the inconvenience, indeed, it's our fault.

Best Regards,
Rong Chen

> See the dmesg:
>
> [ 1161.496493] nfs: server inn not responding, still trying
> [ 1203.479795] ------------[ cut here ]------------
> [ 1203.481138] NETDEV WATCHDOG: eth0 (e1000): transmit queue 0 timed out
> [ 1203.487166] WARNING: CPU: 0 PID: 0 at
> /kbuild/src/consumer/net/sched/sch_generic.c:443 dev_watchdog+0x278/0x280
> [ 1203.489163] Modules linked in: dm_flakey btrfs blake2b_generic xor
> zstd_decompress zstd_compress raid6_pq libcrc32c dm_mod intel_rapl_msr
> intel_rapl_common crct10dif_pclmul crc32_pclmul crc32c_intel
> ghash_clmulni_intel sr_mod cdrom sg ppdev aesni_intel snd_pcm
> crypto_simd cryptd snd_timer ata_generic pata_acpi glue_helper snd
> joydev soundcore bochs_drm drm_vram_helper drm_ttm_helper ttm
> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm
> serio_raw ata_piix pcspkr libata i2c_piix4 parport_pc parport floppy
> ip_tables
> [ 1203.499420] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
> 5.6.0-rc5-00168-g8e7f04c76ddb9 #1
> [ 1203.501320] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [ 1203.503424] RIP: 0010:dev_watchdog+0x278/0x280
> [ 1203.504859] Code: 0d 45 b5 0e 7a eb 8d 4c 89 ef c6 05 e0 68 ee 00 01
> e8 0c 27 fb ff 89 d9 48 89 c2 4c 89 ee 48 c7 c7 e0 b6 9f 86 e8 78 30 77
> ff <0f> 0b e9 6c ff ff ff 90 66 66 66 66 90 41 57 41 56 49 89 d6 41 55
> [ 1203.508961] RSP: 0018:ffffb525c0003e70 EFLAGS: 00010286
> [ 1203.510597] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
> 000000000000083f
> [ 1203.512440] RDX: 0000000000000001 RSI: 00000000000000f6 RDI:
> 000000000000083f
> [ 1203.514321] RBP: ffff977697f3439c R08: 0000000000000821 R09:
> 0000000000aaaaaa
> [ 1203.516172] R10: ffffb525c0003ef8 R11: ffff97769741e360 R12:
> ffff977664320080
> [ 1203.518305] R13: ffff977697f34000 R14: ffff977697f34440 R15:
> 0000000000000001
> [ 1203.519447] FS:  0000000000000000(0000) GS:ffff9776bfc00000(0000)
> knlGS:0000000000000000
> [ 1203.520637] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1203.521677] CR2: 0000000001be4000 CR3: 00000001d78b2000 CR4:
> 00000000000406f0
> [ 1203.522819] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [ 1203.523958] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [ 1203.525101] Call Trace:
> [ 1203.526434]  <IRQ>
> [ 1203.527747]  ? pfifo_fast_enqueue+0x150/0x150
> [ 1203.529398]  call_timer_fn+0x2d/0x140
> [ 1203.530703]  run_timer_softirq+0x46f/0x4b0
> [ 1203.532007]  ? tick_sched_timer+0x37/0x70
> [ 1203.533642]  __do_softirq+0xe3/0x2f8
> [ 1203.535075]  irq_exit+0xd5/0xe0
> [ 1203.536346]  smp_apic_timer_interrupt+0x74/0x140
> [ 1203.537484]  apic_timer_interrupt+0xf/0x20
> [ 1203.538441]  </IRQ>
> [ 1203.539241] RIP: 0010:native_safe_halt+0xe/0x10
> [ 1203.540217] Code: eb bd cc cc cc cc cc cc cc cc cc cc e9 07 00 00 00
> 0f 00 2d c6 70 55 00 f4 c3 66 90 e9 07 00 00 00 0f 00 2d b6 70 55 00 fb
> f4 <c3> cc 66 66 66 66 90 41 55 41 54 55 53 e8 f0 16 67 ff 65 8b 2d b9
> [ 1203.542919] RSP: 0018:ffffffff86c03e88 EFLAGS: 00000246 ORIG_RAX:
> ffffffffffffff13
> [ 1203.544154] RAX: ffffffff860b3770 RBX: 0000000000000000 RCX:
> 0000000000000001
> [ 1203.545376] RDX: 0000000000000000 RSI: 0000000000000083 RDI:
> 0000000000000000
> [ 1203.546584] RBP: 0000000000000000 R08: 00000135342b2839 R09:
> 0000000000000000
> [ 1203.547785] R10: 000000000000000f R11: 000000000025bf59 R12:
> ffffffffffffffff
> [ 1203.548984] R13: 0000000000000000 R14: 0000000000000000 R15:
> 0000000000000000
> [ 1203.550201]  ? __cpuidle_text_start+0x8/0x8
> [ 1203.551591]  default_idle+0x1c/0x160
> [ 1203.552662]  do_idle+0x1c6/0x280
> [ 1203.553969]  cpu_startup_entry+0x19/0x20
> [ 1203.555825]  start_kernel+0x4e3/0x505
> [ 1203.558004]  secondary_startup_64+0xb6/0xc0
> [ 1203.559269] ---[ end trace 747474b4f525ae2e ]---
>
> This fails due to some unrelated nfs timeout.
> Thanks.
>
>> btrfs/064	 644s
>> btrfs/067	 122s
>> btrfs/071	 19s
>> btrfs/074	 43s
>> btrfs/077	 1s
>> btrfs/080	 54s
>> btrfs/083	 1s
>> btrfs/086	 36s
>> btrfs/089	 15s
>> btrfs/092	 36s
>> btrfs/095	 19s
>> btrfs/098	 17s
>> btrfs/101	 209s
>> btrfs/104	 2s
>> btrfs/107	 1s
>> btrfs/110	 1s
>> btrfs/113	 0s
>> btrfs/116	[not run] FITRIM not supported on /fs/scratch
>> btrfs/119	 1s
>> btrfs/122	 15s
>> btrfs/125	 17s
>> btrfs/128	 1s
>> btrfs/131	 2s
>> btrfs/134	 1s
>> btrfs/137	 1s
>> btrfs/140	 2s
>> btrfs/143	 1s
>> btrfs/146	 3s
>> btrfs/149	 1s
>> btrfs/152	 3s
>> btrfs/155	 1s
>> btrfs/158	 1s
>> btrfs/161	 1s
>> btrfs/164	 2s
>> btrfs/167	 1s
>> btrfs/170	 1s
>> btrfs/173	 1s
>> btrfs/176	 2s
>> btrfs/179	 133s
>> btrfs/182	 3s
>> btrfs/185	 1s
>> btrfs/188	 1s
>> btrfs/191	 1s
>> btrfs/194	 22s
>> btrfs/197	- output mismatch (see /lkp/benchmarks/xfstests/results//btrfs=
/197.out.bad)
>>      --- tests/btrfs/197.out	2020-03-05 16:38:54.000000000 +0800
>>      +++ /lkp/benchmarks/xfstests/results//btrfs/197.out.bad	2020-03-28 =
04:34:05.170608651 +0800
>>      @@ -3,23 +3,19 @@
>>       Label: none  uuid: <UUID>
>>       	Total devices <NUM> FS bytes used <SIZE>
>>       	devid <DEVID> size <SIZE> used <SIZE> path SCRATCH_DEV
>>      -	*** Some devices missing
>>       =

>>       raid5
>>       Label: none  uuid: <UUID>
>>      ...
>>      (Run 'diff -u /lkp/benchmarks/xfstests/tests/btrfs/197.out /lkp/ben=
chmarks/xfstests/results//btrfs/197.out.bad'  to see the entire diff)
>> btrfs/200	 1s
>> btrfs/203	 1s
>> Ran: btrfs/001 btrfs/004 btrfs/007 btrfs/010 btrfs/013 btrfs/016 btrfs/0=
19 btrfs/022 btrfs/025 btrfs/028 btrfs/031 btrfs/034 btrfs/037 btrfs/040 bt=
rfs/043 btrfs/046 btrfs/049 btrfs/052 btrfs/055 btrfs/058 btrfs/061 btrfs/0=
64 btrfs/067 btrfs/071 btrfs/074 btrfs/077 btrfs/080 btrfs/083 btrfs/086 bt=
rfs/089 btrfs/092 btrfs/095 btrfs/098 btrfs/101 btrfs/104 btrfs/107 btrfs/1=
10 btrfs/113 btrfs/116 btrfs/119 btrfs/122 btrfs/125 btrfs/128 btrfs/131 bt=
rfs/134 btrfs/137 btrfs/140 btrfs/143 btrfs/146 btrfs/149 btrfs/152 btrfs/1=
55 btrfs/158 btrfs/161 btrfs/164 btrfs/167 btrfs/170 btrfs/173 btrfs/176 bt=
rfs/179 btrfs/182 btrfs/185 btrfs/188 btrfs/191 btrfs/194 btrfs/197 btrfs/2=
00 btrfs/203
>> Not run: btrfs/116
>> Failures: btrfs/061 btrfs/197
>> Failed 2 of 68 tests
>>
>>
>>
>>
>> To reproduce:
>>
>>          # build kernel
>> 	cd linux
>> 	cp config-5.6.0-rc5-00168-g8e7f04c76ddb9 .config
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare modul=
es_prepare bzImage modules
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<mod-in=
stall-dir> modules_install
>> 	cd <mod-install-dir>
>> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>>
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-scrip=
t is attached in this email
>>
>>
>>
>> Thanks,
>> Rong Chen
>>
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============2712828410565626184==--

