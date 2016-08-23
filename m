Content-Type: multipart/mixed; boundary="===============5040737996347839756=="
MIME-Version: 1.0
From: Wang Xiaoguang <wangxg.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 994cdc1331: WARNING: CPU: 0 PID: 14378 at fs/btrfs/extent-tree.c:10030 btrfs_free_block_groups+0x29b/0x420 [btrfs]
Date: Tue, 23 Aug 2016 17:31:10 +0800
Message-ID: <57BC17DE.9070405@cn.fujitsu.com>
In-Reply-To: <20160823074531.GB11135@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5040737996347839756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 08/23/2016 03:45 PM, kernel test robot wrote:
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 994cdc133173fd9d69eae45cd228eec21dbed080 ("btrfs: update btrfs_spa=
ce_info's bytes_may_use timely")
>
> in testcase: xfstests
> with following parameters:
>
> 	disk: 4HDD
> 	fs: btrfs
> 	test: generic-quick1
>
>
> on test machine: 4 threads Sandy Bridge with 6G memory
>
> caused below changes:
>
>
>
> [  110.547115] BTRFS info (device dm-0): has skinny extents
> [  110.617734] BTRFS info (device dm-0): checking UUID tree
> [  110.698954] ------------[ cut here ]------------
> [  110.704891] WARNING: CPU: 0 PID: 14378 at fs/btrfs/extent-tree.c:10030=
 btrfs_free_block_groups+0x29b/0x420 [btrfs]
> [  110.719052] Modules linked in: dm_flakey dm_mod rpcsec_gss_krb5 auth_r=
pcgss nfsv4 dns_resolver netconsole btrfs xor raid6_pq sg sd_mod ata_generi=
c pata_acpi x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm sn=
d_hda_codec_hdmi irqbypass eeepc_wmi crct10dif_pclmul crc32_pclmul i915 crc=
32c_intel asus_wmi sparse_keymap ghash_clmulni_intel rfkill ppdev snd_hda_c=
odec_realtek drm_kms_helper syscopyarea sysfillrect sysimgblt snd_hda_codec=
_generic aesni_intel fb_sys_fops lrw gf128mul glue_helper ablk_helper crypt=
d pcspkr drm serio_raw ata_piix pata_via snd_hda_intel snd_hda_codec snd_hd=
a_core snd_hwdep snd_pcm snd_timer libata snd soundcore shpchp wmi parport_=
pc parport tpm_infineon video
> [  110.788309] CPU: 0 PID: 14378 Comm: umount Not tainted 4.7.0-rc6-00079=
-g994cdc1 #1
> [  110.796881] Hardware name: System manufacturer System Product Name/P8H=
67-M PRO, BIOS 1002 04/01/2011
> [  110.807039]  0000000000000000 ffff88019966fcf0 ffffffff8143669b 000000=
0000000000
> [  110.815555]  0000000000000000 ffff88019966fd30 ffffffff8107d3fb 000027=
2e00000000
> [  110.824058]  ffff880199742088 ffff88007e978000 ffff880199742000 ffff88=
0199742400
> [  110.832559] Call Trace:
> [  110.836013]  [<ffffffff8143669b>] dump_stack+0x63/0x88
> [  110.842146]  [<ffffffff8107d3fb>] __warn+0xcb/0xf0
> [  110.847934]  [<ffffffff8107d4ed>] warn_slowpath_null+0x1d/0x20
> [  110.854774]  [<ffffffffa06091ab>] btrfs_free_block_groups+0x29b/0x420 =
[btrfs]
> [  110.862920]  [<ffffffffa061b160>] close_ctree+0x190/0x370 [btrfs]
> [  110.870015]  [<ffffffff8121f1e9>] ? evict_inodes+0x189/0x1a0
> [  110.876687]  [<ffffffffa05eb9c9>] btrfs_put_super+0x19/0x20 [btrfs]
> [  110.883959]  [<ffffffff81203acf>] generic_shutdown_super+0x6f/0x100
> [  110.891228]  [<ffffffff81203df2>] kill_anon_super+0x12/0x20
> [  110.897807]  [<ffffffffa05ec7a8>] btrfs_kill_super+0x18/0x110 [btrfs]
> [  110.905250]  [<ffffffff81203fa3>] deactivate_locked_super+0x43/0x70
> [  110.912504]  [<ffffffff8120448a>] deactivate_super+0x5a/0x60
> [  110.919134]  [<ffffffff8122288f>] cleanup_mnt+0x3f/0x90
> [  110.925330]  [<ffffffff81222922>] __cleanup_mnt+0x12/0x20
> [  110.931700]  [<ffffffff8109b138>] task_work_run+0x88/0xc0
> [  110.938068]  [<ffffffff81003312>] exit_to_usermode_loop+0xc2/0xd0
> [  110.945123]  [<ffffffff81003c31>] syscall_return_slowpath+0xa1/0xb0
> [  110.952350]  [<ffffffff819105fa>] entry_SYSCALL_64_fastpath+0xa2/0xa4
> [  110.959746] ---[ end trace 58ee3d80a0e5b015 ]---
> [  110.960290] systemd-journald[142]: Compressed data object 695 -> 516
OK, thanks for the report.
I forgot to run dm-flakey related xfstests test cases when testing this =

patch, really sorry.
I'll look into this problem.

Regards,
Xiaoguang Wang

>
>
> To reproduce:
>
>          git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
>
>
>
> Thanks,
> Xiaolong
>
>




--===============5040737996347839756==--

