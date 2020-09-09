Content-Type: multipart/mixed; boundary="===============0148214941158674658=="
MIME-Version: 1.0
From: Qu Wenruo <wqu@suse.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 3b54a0a703: WARNING:at_fs/btrfs/inode.c:#btrfs_finish_ordered_io[btrfs]
Date: Wed, 09 Sep 2020 15:49:30 +0800
Message-ID: <29350c54-fb8e-433e-404c-d72c83f3989a@suse.com>
In-Reply-To: <20200909070857.GA25950@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0148214941158674658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2020/9/9 =E4=B8=8B=E5=8D=883:08, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 3b54a0a703f17d2b1317d24beefcdcca587a7667 ("[PATCH v3 3/5] btrfs: =
Detect unbalanced tree with empty leaf before crashing btree operations")
> url: https://github.com/0day-ci/linux/commits/Qu-Wenruo/btrfs-Enhanced-ru=
ntime-defence-against-fuzzed-images/20200809-201720
> base: https://git.kernel.org/cgit/linux/kernel/git/kdave/linux.git for-ne=
xt
> =

> in testcase: fio-basic
> with following parameters:
> =

> 	runtime: 300s
> 	disk: 1SSD
> 	fs: btrfs
> 	nr_task: 100%
> 	test_size: 128G
> 	rw: write
> 	bs: 4k
> 	ioengine: sync
> 	cpufreq_governor: performance
> 	ucode: 0x400002c
> 	fs2: nfsv4
> =

> test-description: Fio is a tool that will spawn a number of threads or pr=
ocesses doing a particular type of I/O action as specified by the user.
> test-url: https://github.com/axboe/fio
> =

> =

> on test machine: 96 threads Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz=
 with 128G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
----+------------+------------+
> |                                                                        =
    | 2703206ff5 | 3b54a0a703 |
> +------------------------------------------------------------------------=
----+------------+------------+
> | boot_successes                                                         =
    | 9          | 0          |
> | boot_failures                                                          =
    | 4          |            |
> | Kernel_panic-not_syncing:VFS:Unable_to_mount_root_fs_on_unknown-block(#=
,#) | 4          |            |
> +------------------------------------------------------------------------=
----+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =


According to the full dmesg, it's invalid nritems causing transaction abort.

I'm not sure if it's caused by corrupts fs or something else.

If intel guys can reproduce it reliably, would you please add such debug
diff to output extra info?

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index b1a148058773..b050d6fcb90a 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -406,8 +406,9 @@ int btrfs_verify_level_key(struct extent_buffer *eb,
int level,
        /* We have @first_key, so this @eb must have at least one item */
        if (btrfs_header_nritems(eb) =3D=3D 0) {
                btrfs_err(fs_info,
-               "invalid tree nritems, bytenr=3D%llu nritems=3D0 expect >0",
-                         eb->start);
+               "invalid tree nritems, bytenr=3D%llu owner=3D%llu level=3D%d
first_key=3D(%llu %u %llu) nritems=3D0 expect >0",
+                         eb->start, btrfs_header_owner(eb),
btrfs_header_level(eb),
+                         first_key->objectid, first_key->type,
first_key->offset);
                WARN_ON(IS_ENABLED(CONFIG_BTRFS_DEBUG));
                return -EUCLEAN;
        }

Thanks,
Qu

> [   50.226906] WARNING: CPU: 71 PID: 500 at fs/btrfs/inode.c:2687 btrfs_f=
inish_ordered_io+0x70a/0x820 [btrfs]
> [   50.236913] Modules linked in: rpcsec_gss_krb5 nfsv4 dns_resolver nfsd=
 auth_rpcgss dm_mod dax_pmem_compat nd_pmem device_dax nd_btt dax_pmem_core=
 btrfs sr_mod blake2b_generic xor cdrom sd_mod zstd_decompress sg zstd_comp=
ress raid6_pq libcrc32c intel_rapl_msr intel_rapl_common skx_edac x86_pkg_t=
emp_thermal ipmi_ssif intel_powerclamp coretemp kvm_intel kvm irqbypass ast=
 crct10dif_pclmul drm_vram_helper crc32_pclmul crc32c_intel acpi_ipmi drm_t=
tm_helper ghash_clmulni_intel ttm rapl drm_kms_helper intel_cstate syscopya=
rea sysfillrect nvme sysimgblt intel_uncore fb_sys_fops nvme_core ahci liba=
hci t10_pi drm mei_me ioatdma libata mei ipmi_si joydev dca wmi ipmi_devint=
f ipmi_msghandler nfit libnvdimm ip_tables
> [   50.301669] CPU: 71 PID: 500 Comm: kworker/u193:5 Not tainted 5.8.0-rc=
7-00165-g3b54a0a703f17 #1
> [   50.310904] Workqueue: btrfs-endio-write btrfs_work_helper [btrfs]
> [   50.317626] RIP: 0010:btrfs_finish_ordered_io+0x70a/0x820 [btrfs]
> [   50.324255] Code: 48 0a 00 00 02 72 25 41 83 ff fb 0f 84 f2 00 00 00 4=
1 83 ff e2 0f 84 e8 00 00 00 44 89 fe 48 c7 c7 70 1c 2b c1 e8 58 ae ed bf <=
0f> 0b 44 89 f9 ba 7f 0a 00 00 48 c7 c6 50 47 2a c1 48 89 df e8 15
> [   50.344116] RSP: 0018:ffffc90007a83d58 EFLAGS: 00010282
> [   50.349923] RAX: 0000000000000000 RBX: ffff888a93ca5ea0 RCX: 000000000=
0000000
> [   50.357656] RDX: ffff8890401e82a0 RSI: ffff8890401d7f60 RDI: ffff88904=
01d7f60
> [   50.365385] RBP: ffff8890300ab8a8 R08: 0000000000000bd4 R09: 000000000=
0000000
> [   50.373133] R10: 0000000000000001 R11: ffffffffc0714060 R12: 000000000=
f83e000
> [   50.381060] R13: 000000000f83ffff R14: ffff888fb6c39968 R15: 00000000f=
fffff8b
> [   50.388824] FS:  0000000000000000(0000) GS:ffff8890401c0000(0000) knlG=
S:0000000000000000
> [   50.397545] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   50.404300] CR2: 00007feacc500f98 CR3: 0000000f74422006 CR4: 000000000=
07606e0
> [   50.412477] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   50.420281] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   50.428082] PKRU: 55555554
> [   50.431451] Call Trace:
> [   50.434570]  ? update_curr+0xc0/0x200
> [   50.438919]  ? newidle_balance+0x232/0x3e0
> [   50.443700]  ? __wake_up_common+0x80/0x180
> [   50.448491]  btrfs_work_helper+0xc9/0x400 [btrfs]
> [   50.453880]  ? __schedule+0x378/0x860
> [   50.458218]  process_one_work+0x1b5/0x3a0
> [   50.462917]  worker_thread+0x50/0x3c0
> [   50.467262]  ? process_one_work+0x3a0/0x3a0
> [   50.472148]  kthread+0x114/0x160
> [   50.476084]  ? kthread_park+0xa0/0xa0
> [   50.480445]  ret_from_fork+0x1f/0x30
> [   50.484731] ---[ end trace cc096c1a2068030e ]---
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Oliver Sang
>=20

--===============0148214941158674658==--

