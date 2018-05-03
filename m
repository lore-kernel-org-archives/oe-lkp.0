Content-Type: multipart/mixed; boundary="===============2086024010231500955=="
MIME-Version: 1.0
From: Nikolay Borisov <nborisov@suse.com>
To: lkp@lists.01.org
Subject: Re: [btrfs_put_block_group] WARNING: CPU: 1 PID: 14674 at fs/btrfs/disk-io.c:3675 free_fs_root+0xc2/0xd0 [btrfs]
Date: Thu, 03 May 2018 11:11:32 +0300
Message-ID: <d09571ee-5238-dce9-63dc-d4fa08d75d2a@suse.com>
In-Reply-To: <9e22521e-6fed-f42b-68f1-998ee6b06b94@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2086024010231500955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On  3.05.2018 11:07, Anand Jain wrote:
> =

> =

> On 04/19/2018 03:25 PM, Nikolay Borisov wrote:
>>
>>
>> On 19.04.2018 08:32, Fengguang Wu wrote:
>>> Hello,
>>>
>>> FYI this happens in mainline kernel and at least dates back to v4.16 .
>>>
>>> It's rather rare error and happens when running xfstests.
>>
>> Yeah, so this is something which only recently was characterised as
>> leaking delalloc inodes. I can easily reproduce this when running
>> generic/019 test. A fix is in the works.
> =

> Hi Nikolay
> =C2=A0Is the fix available? generic/475 also notice the same thing.

Yes, the series is [PATCH 0/5] Fix delalloc inodes leaking on btrfs unmount

> =

> -Anand
> =

> =

>>>
>>> [=C2=A0 438.327552] BTRFS: error (device dm-0) in
>>> __btrfs_free_extent:6962: errno=3D-5 IO failure
>>> [=C2=A0 438.336415] BTRFS: error (device dm-0) in
>>> btrfs_run_delayed_refs:3070: errno=3D-5 IO failure
>>> [=C2=A0 438.345590] BTRFS error (device dm-0): pending csums is 1028096
>>> [=C2=A0 438.369254] BTRFS error (device dm-0): cleaner transaction atta=
ch
>>> returned -30
>>> [=C2=A0 438.377674] BTRFS info (device dm-0): at unmount delalloc count=
 98304
>>> [=C2=A0 438.385166] WARNING: CPU: 1 PID: 14674 at fs/btrfs/disk-io.c:36=
75
>>> free_fs_root+0xc2/0xd0 [btrfs]
>>> [=C2=A0 438.396562] Modules linked in: dm_snapshot dm_thin_pool
>>> dm_persistent_data dm_bio_prison dm_bufio dm_flakey dm_mod netconsole
>>> btrfs xor zstd_decompress zstd_compress xxhash raid6_pq sd_mod sg
>>> snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic
>>> ata_generic pata_acpi intel_rapl x86_pkg_temp_thermal
>>> intel_powerclamp coretemp snd_hda_intel kvm_intel snd_hda_codec kvm
>>> irqbypass crct10dif_pclmul eeepc_wmi crc32_pclmul crc32c_intel
>>> ghash_clmulni_intel pata_via asus_wmi sparse_keymap snd_hda_core
>>> ata_piix snd_hwdep ppdev rfkill wmi_bmof i915 pcbc snd_pcm snd_timer
>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops snd
>>> aesni_intel parport_pc crypto_simd pcspkr libata soundcore cryptd
>>> glue_helper drm wmi parport video shpchp ip_tables
>>> [=C2=A0 438.467607] CPU: 1 PID: 14674 Comm: umount Not tainted 4.17.0-r=
c1 #1
>>> [=C2=A0 438.474798] Hardware name: System manufacturer System Product
>>> Name/P8H67-M PRO, BIOS 1002 04/01/2011
>>> [=C2=A0 438.484804] RIP: 0010:free_fs_root+0xc2/0xd0 [btrfs]
>>> [=C2=A0 438.490590] RSP: 0018:ffffc90008b0fda8 EFLAGS: 00010282
>>> [=C2=A0 438.496641] RAX: ffff88017c5954b0 RBX: ffff880137f6d800 RCX:
>>> 0000000180100003
>>> [=C2=A0 438.504652] RDX: 0000000000000001 RSI: ffffea0006e93600 RDI:
>>> 0000000000000000
>>> [=C2=A0 438.512679] RBP: ffff88017b360000 R08: ffff8801ba4dd000 R09:
>>> 0000000180100003
>>> [=C2=A0 438.520644] R10: ffffc90008b0fc70 R11: 0000000000000000 R12:
>>> ffffc90008b0fdd0
>>> [=C2=A0 438.528657] R13: ffff88017b360080 R14: ffffc90008b0fdc8 R15:
>>> 0000000000000000
>>> [=C2=A0 438.536662] FS:=C2=A0 00007f06c1a80fc0(0000) GS:ffff8801bfa8000=
0(0000)
>>> knlGS:0000000000000000
>>> [=C2=A0 438.545582] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
>>> [=C2=A0 438.552157] CR2: 00007f06c12b0260 CR3: 000000017d3de004 CR4:
>>> 00000000000606e0
>>> [=C2=A0 438.642653] RAX: 0000000000000000 RBX: 000000000234a2d0 RCX:
>>> 00007f06c1359cf7
>>> [=C2=A0 438.793559] CPU: 1 PID: 14674 Comm: umount Tainted: G=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>>> W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.17.0-rc1 #1
>>> [=C2=A0 438.802152] Hardware name: System manufacturer System Product
>>> Name/P8H67-M PRO, BIOS 1002 04/01/2011
>>> [=C2=A0 438.812108] RIP: 0010:btrfs_put_block_group+0x41/0x60 [btrfs]
>>> [=C2=A0 438.819364] RSP: 0018:ffffc90008b0fde0 EFLAGS: 00010206
>>> [=C2=A0 438.825378] RAX: 0000000000000000 RBX: ffff8801abf63000 RCX:
>>> e38e38e38e38e38f
>>> [=C2=A0 438.833307] RDX: 0000000000000001 RSI: 00000000000009f6 RDI:
>>> ffff8801abf63000
>>> [=C2=A0 438.841230] RBP: ffff88017b360000 R08: ffff88017d3b7750 R09:
>>> 0000000180380010
>>> [=C2=A0 438.849133] R10: ffffc90008b0fca0 R11: 0000000000000000 R12:
>>> ffff8801abf63000
>>> [=C2=A0 438.857047] R13: ffff88017b3600a0 R14: ffff8801abf630e0 R15:
>>> dead000000000100
>>> [=C2=A0 438.864943] FS:=C2=A0 00007f06c1a80fc0(0000) GS:ffff8801bfa8000=
0(0000)
>>> knlGS:0000000000000000
>>> [=C2=A0 438.873793] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
>>> [=C2=A0 438.880320] CR2: 00007f06c12b0260 CR3: 000000017d3de004 CR4:
>>> 00000000000606e0
>>> [=C2=A0 438.888226] Call Trace:
>>> [=C2=A0 438.891454]=C2=A0 btrfs_free_block_groups+0x138/0x3d0 [btrfs]
>>> [=C2=A0 438.897569]=C2=A0 close_ctree+0x13b/0x2f0 [btrfs]
>>> [=C2=A0 438.902618]=C2=A0 generic_shutdown_super+0x6c/0x120:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __rea=
d_once_size at include/linux/compiler.h:188
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (inlined by) list_empty at
>>> include/linux/list.h:203
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (inlined by) generic_shutdown_super at
>>> fs/super.c:442
>>> [=C2=A0 438.907801]=C2=A0 kill_anon_super+0xe/0x20:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kill_=
anon_super at fs/super.c:1038
>>> [=C2=A0 438.912223]=C2=A0 btrfs_kill_super+0x13/0x100 [btrfs]
>>> [=C2=A0 438.917598]=C2=A0 deactivate_locked_super+0x3f/0x70:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deact=
ivate_locked_super at fs/super.c:320
>>> [=C2=A0 438.922757]=C2=A0 cleanup_mnt+0x3b/0x70:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clean=
up_mnt at fs/namespace.c:1174
>>> [=C2=A0 438.926879]=C2=A0 task_work_run+0xa3/0xe0:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 task_=
work_run at kernel/task_work.c:115
>>> (discriminator 1)
>>> [=C2=A0 438.931205]=C2=A0 exit_to_usermode_loop+0x9e/0xa0:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace=
hook_notify_resume at
>>> include/linux/tracehook.h:191
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (inlined by) exit_to_usermode_loop at
>>> arch/x86/entry/common.c:166
>>> [=C2=A0 438.936226]=C2=A0 do_syscall_64+0x16c/0x180:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prepa=
re_exit_to_usermode at
>>> arch/x86/entry/common.c:196
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (inlined by) syscall_return_slowpath at
>>> arch/x86/entry/common.c:265
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (inlined by) do_syscall_64 at
>>> arch/x86/entry/common.c:290
>>> [=C2=A0 438.940717]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entry=
_SYSCALL_64_after_hwframe at
>>> arch/x86/entry/entry_64.S:247
>>> [=C2=A0 438.946507] RIP: 0033:0x7f06c1359cf7
>>> [=C2=A0 438.950798] RSP: 002b:00007ffc6a59c608 EFLAGS: 00000246 ORIG_RA=
X:
>>> 00000000000000a6
>>> [=C2=A0 438.959137] RAX: 0000000000000000 RBX: 000000000234a2d0 RCX:
>>> 00007f06c1359cf7
>>> [=C2=A0 438.967056] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
>>> 000000000234a4b0
>>> [=C2=A0 438.974937] RBP: 000000000234a4b0 R08: 0000000000000005 R09:
>>> 000000000234b510
>>> [=C2=A0 438.982801] R10: 00000000000006f4 R11: 0000000000000246 R12:
>>> 00007f06c1865e44
>>> [=C2=A0 438.990695] R13: 0000000000000000 R14: 0000000000000000 R15:
>>> 00007ffc6a59c890
>>> [=C2=A0 438.998600] Code: 2a 48 8b 83 e8 01 00 00 48 85 c0 75 2c 48 8b =
bb
>>> d8 00 00 00 e8 c1 1e b8 e0 48 89 df 5b e9 b8 1e b8 e0 0f 0b 48 83 7b
>>> 50 00 74 d6 <0f> 0b 48 8b 83 e8 01 00 00 48 85 c0 74 d4 0f 0b eb d0
>>> 0f 1f 00
>>> [=C2=A0 439.019082] ---[ end trace 9263ab2c46fd437a ]---
>>> [=C2=A0 439.030057] WARNING: CPU: 2 PID: 14674 at
>>> fs/btrfs/extent-tree.c:9898 btrfs_free_block_groups+0x2a2/0x3d0 [btrfs]
>>>
>>> Attached the full dmesg, kconfig and reproduce scripts.
>>>
>>> Thanks,
>>> Fengguang
>>>
>> -- =

>> To unsubscribe from this list: send the line "unsubscribe linux-btrfs" in
>> the body of a message to majordomo(a)vger.kernel.org
>> More majordomo info at=C2=A0 http://vger.kernel.org/majordomo-info.html
>>
> -- =

> To unsubscribe from this list: send the line "unsubscribe linux-btrfs" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at=C2=A0 http://vger.kernel.org/majordomo-info.html
>=20

--===============2086024010231500955==--

