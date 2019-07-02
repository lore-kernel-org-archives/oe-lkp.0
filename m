Content-Type: multipart/mixed; boundary="===============3920806204473576469=="
MIME-Version: 1.0
From: Liu Yiding <liuyd.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: 07173c3ec2: stderr.fio:pid=#, err=#/file:filesetup.c:#, func=fsync, error=Input/output_error
Date: Tue, 02 Jul 2019 12:46:40 +0800
Message-ID: <074b507f-21a2-73d7-e5a1-2f2473b91ad4@cn.fujitsu.com>
In-Reply-To: <20190701072951.GE16809@ming.t460p>
List-Id: <oe-lkp.lists.linux.dev>

--===============3920806204473576469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Ming. I have tested your v2 fix patch on fio test 5 times, error has =

gone. Thanks.


=E5=9C=A8 2019/7/1 =E4=B8=8B=E5=8D=883:29, Ming Lei =E5=86=99=E9=81=93:
> On Mon, Jul 01, 2019 at 03:18:01PM +0800, Liu Yiding wrote:
>> =E5=9C=A8 2019/7/1 =E4=B8=8B=E5=8D=883:14, Ming Lei =E5=86=99=E9=81=93:
>>> On Mon, Jul 01, 2019 at 02:54:31PM +0800, Liu Yiding wrote:
>>>> =E5=9C=A8 2019/7/1 =E4=B8=8B=E5=8D=882:44, Ming Lei =E5=86=99=E9=81=93:
>>>>> On Mon, Jul 01, 2019 at 12:49:51PM +0800, Liu Yiding wrote:
>>>>>> =E5=9C=A8 2019/7/1 =E4=B8=8A=E5=8D=8810:47, Ming Lei =E5=86=99=E9=81=
=93:
>>>>>>> [snip]
>>>>>>>>>> ------
>>>>>>>>>>
>>>>>>>>>> 2412 [=C2=A0 112.558155] XFS (sdb1): Ending clean mount
>>>>>>>>>> 2413 [ 1317.330820] WARNING: CPU: 63 PID: 1495 at
>>>>>>>>>> drivers/scsi/scsi_lib.c:1034 scsi_init_io+0x11a/0x2e0
>>>>>>>>>> 2414 [ 1317.344000] Modules linked in: xfs dm_mod btrfs xor zstd=
_decompress
>>>>>>>>>> zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
>>>>>>>>>> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_i=C2=A0=C2=A0=
=C2=A0=C2=A0 ntel kvm irqbypass
>>>>>>>>>> crct10dif_pclmul crc32_pclmul crc32c_intel mgag200 snd_pcm
>>>>>>>>>> ghash_clmulni_intel ttm snd_timer drm_kms_helper ipmi_si ahci snd
>>>>>>>>>> aesni_intel syscopyarea libahci ipmi_devi=C2=A0=C2=A0=C2=A0=C2=
=A0 ntf sysfillrect sysimgblt
>>>>>>>>>> crypto_simd mei_me fb_sys_fops soundcore ioatdma cryptd ipmi_msg=
handler
>>>>>>>>>> glue_helper pcspkr drm libata mei joydev lpc_ich i2c_i801 dca wmi
>>>>>>>>>> acpi_power_meter acpi=C2=A0=C2=A0=C2=A0=C2=A0 _pad pcc_cpufreq i=
p_tables
>>>>>>>>>> 2415 [ 1317.408135] CPU: 63 PID: 1495 Comm: kworker/63:1H Tainte=
d:
>>>>>>>>>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.2.0-rc5-00001-gc2d55e2 #1
>>>>>>>>>> 2416 [ 1317.420350] Hardware name: Intel Corporation S2600WTT/S2=
600WTT, BIOS
>>>>>>>>>> SE5C610.86B.01.01.0008.021120151325 02/11/2015
>>>>>>>>>> 2417 [ 1317.433545] Workqueue: kblockd blk_mq_run_work_fn
>>>>>>>>>> 2418 [ 1317.440295] RIP: 0010:scsi_init_io+0x11a/0x2e0
>>>>>>>>>> 2419 [ 1317.446746] Code: be 01 00 00 00 e9 44 ff ff ff 8b 45 70=
 89 83 08 01
>>>>>>>>>> 00 00 f6 45 1a 01 75 8a 31 c0 48 83 c4 08 5b 5d 41 5c 41 5d 41 5=
e 41 5f c3
>>>>>>>>>> <0f> 0b 8b 4d 18 8b 55 28 45 31 c9 48=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 c7 c6 98 da 69 82 48 c7 c7 f0
>>>>>>>>>> 2420 [ 1317.470863] RSP: 0018:ffffa5fa4f7e7c68 EFLAGS: 00010246
>>>>>>>>>> 2421 [ 1317.478294] RAX: 000000003d17d1b8 RBX: ffff8ae6cb742690 =
RCX:
>>>>>>>>>> 0000000000000000
>>>>>>>>>> 2422 [ 1317.487878] RDX: 0000000000000000 RSI: 0000000000000000 =
RDI:
>>>>>>>>>> ffff8ae6cb742690
>>>>>>>>>> 2423 [ 1317.497469] RBP: ffff8ae6cb742580 R08: 0000000000023003 =
R09:
>>>>>>>>>> ffff8ae6cb7426c8
>>>>>>>>>> 2424 [ 1317.507057] R10: ffffa5fa4c7d7da0 R11: fefefefefefefeff =
R12:
>>>>>>>>>> 0000000000000801
>>>>>>>>>> 2425 [ 1317.516650] R13: 0000000000000000 R14: 0000000000000000 =
R15:
>>>>>>>>>> ffff8ac800bd1800
>>>>>>>>>> 2426 [ 1317.526253] FS:=C2=A0 0000000000000000(0000) GS:ffff8b07=
7fac0000(0000)
>>>>>>>>>> knlGS:0000000000000000
>>>>>>>>>> 2427 [ 1317.536918] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000000=
0080050033
>>>>>>>>>> 2428 [ 1317.544952] CR2: 00007f39a5818004 CR3: 000000343440a006 =
CR4:
>>>>>>>>>> 00000000001606e0
>>>>>>>>>> 2429 [ 1317.554554] Call Trace:
>>>>>>>>>> 2430 [ 1317.558921]=C2=A0 sd_init_command+0x2ee/0xaf0 [sd_mod]
>>>>>>>>>> 2431 [ 1317.565800]=C2=A0 scsi_queue_rq+0x559/0xa80
>>>>>>>>>> 2432 [ 1317.571607]=C2=A0 blk_mq_dispatch_rq_list+0x3da/0x5b0
>>>>>>>>>> 2433 [ 1317.578375]=C2=A0 ? syscall_return_via_sysret+0x10/0x7f
>>>>>>>>>> 2434 [ 1317.585339]=C2=A0 ? __switch_to_asm+0x40/0x70
>>>>>>>>>> 2435 [ 1317.591321]=C2=A0 ? elv_rb_del+0x1f/0x30
>>>>>>>>>> 2436 [ 1317.596807]=C2=A0 ? deadline_remove_request+0x55/0xc0
>>>>>>>>>> 2437 [ 1317.603560]=C2=A0 blk_mq_do_dispatch_sched+0x76/0x120
>>>>>>>>>> 2438 [ 1317.610302]=C2=A0 blk_mq_sched_dispatch_requests+0x100/0=
x170
>>>>>>>>>> 2439 [ 1317.617733]=C2=A0 __blk_mq_run_hw_queue+0x60/0x130
>>>>>>>>>> 2440 [ 1317.624200]=C2=A0 process_one_work+0x19c/0x3c0
>>>>>>>>>> 2441 [ 1317.630258]=C2=A0 worker_thread+0x3c/0x3b0
>>>>>>>>>> 2442 [ 1317.635937]=C2=A0 ? process_one_work+0x3c0/0x3c0
>>>>>>>>>> 2443 [ 1317.642183]=C2=A0 kthread+0x11e/0x140
>>>>>>>>>> 2444 [ 1317.647346]=C2=A0 ? kthread_park+0x90/0x90
>>>>>>>>>> 2445 [ 1317.652986]=C2=A0 ret_from_fork+0x35/0x40
>>>>>>>>>> 2446 [ 1317.658523] ---[ end trace 61026ff97261da6a ]---
>>>>>>>>>> 2447 [ 1317.665327] scsi_dump_rq: rq 6(f:801/23003, seg: 0)
>>>>>>>>>> 2448 [ 1317.671601] bio 0: d602/801 0 1024971192 0
>>>>>>>>>> 2449 [ 1317.676991] print_req_error: I/O error, dev sdb, sector =
1024971192
>>>>>>>>>> flags 801
>>>>>>>>>> 2450 [ 1317.685722] scsi_dump_rq: rq 8(f:801/23003, seg: 0)
>>>>>>>>>> 2451 [ 1317.691994] bio 0: d602/801 0 1033359800 0
>>>>>>>>> The above line shows the bio is zero-size, and this bio is submit=
ted
>>>>>>>>> from bio, since the bio->bi_flags indicates that BIO_CLONED isn't=
 set.
>>>>>>>>>
>>>>>>>>> Please apply the following debug patch, and we may see where is w=
rong.
>>>>>>>>>
>>>>>>>>> diff --git a/block/blk-core.c b/block/blk-core.c
>>>>>>>>> index 8340f69670d8..86bb61b0df83 100644
>>>>>>>>> --- a/block/blk-core.c
>>>>>>>>> +++ b/block/blk-core.c
>>>>>>>>> @@ -1125,6 +1125,7 @@ blk_qc_t submit_bio(struct bio *bio)
>>>>>>>>>       				bio_devname(bio, b), count);
>>>>>>>>>       		}
>>>>>>>>>       	}
>>>>>>>>> +	WARN_ON(bio->bi_iter.bi_size =3D=3D 0 && bio_op(bio) =3D=3D REQ=
_OP_WRITE);
>>>>>>>>>       	return generic_make_request(bio);
>>>>>>>> Sorry for delay,
>>>>>>>>
>>>>>>>> ------
>>>>>>>>
>>>>>>>> [=C2=A0 116.619136] 2019-06-29 16:12:41 mkdir -p /fs/sdb1
>>>>>>>> [=C2=A0 116.619138]
>>>>>>>> [=C2=A0 116.628743] 2019-06-29 16:12:41 mount -t xfs -o inode64 /d=
ev/sdb1
>>>>>>>> /fs/sdb1
>>>>>>>> [=C2=A0 116.628745]
>>>>>>>> [=C2=A0 116.634699] SGI XFS with ACLs, security attributes, realti=
me, scrub,
>>>>>>>> debug enabled
>>>>>>>> [=C2=A0 116.653110] XFS (sdb1): Mounting V5 Filesystem
>>>>>>>> [=C2=A0 116.670081] XFS (sdb1): Ending clean mount
>>>>>>>> [=C2=A0 690.106779] WARNING: CPU: 53 PID: 1477 at block/blk-core.c=
:1128
>>>>>>>> submit_bio+0x93/0x150
>>>>>>>> [=C2=A0 690.117972] Modules linked in: xfs dm_mod btrfs xor zstd_d=
ecompress
>>>>>>>> zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
>>>>>>>> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqby=
pass
>>>>>>>> mgag200 crct10dif_pclmul crc32_pclmul ttm crc32c_intel snd_pcm
>>>>>>>> ghash_clmulni_intel drm_kms_helper snd_timer ahci syscopyarea sysf=
illrect
>>>>>>>> snd aesni_intel sysimgblt libahci ipmi_si soundcore fb_sys_fops me=
i_me
>>>>>>>> crypto_simd ipmi_devintf ioatdma cryptd pcspkr drm ipmi_msghandler
>>>>>>>> glue_helper libata mei joydev lpc_ich i2c_i801 dca wmi acpi_power_=
meter
>>>>>>>> acpi_pad pcc_cpufreq ip_tables
>>>>>>>> [=C2=A0 690.176967] CPU: 53 PID: 1477 Comm: fio Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W I
>>>>>>>> 5.2.0-rc5-00002-g9fa09bd #1
>>>>>>>> [=C2=A0 690.187198] Hardware name: Intel Corporation S2600WTT/S260=
0WTT, BIOS
>>>>>>>> SE5C610.86B.01.01.0008.021120151325 02/11/2015
>>>>>>>> [=C2=A0 690.199375] RIP: 0010:submit_bio+0x93/0x150
>>>>>>>> [=C2=A0 690.204583] Code: ee 74 45 83 e1 01 74 26 65 48 01 35 bf 3=
9 3f 45 8b 0d
>>>>>>>> ad 96 c4 01 85 c9 75 56 8b 43 28 85 c0 75 b3 0f b6 53 10 83 fa 01 =
75 aa <0f>
>>>>>>>> 0b eb a6 65 48 8b 14 25 c0 6b 01 00 65 48 01 35 88 39 3f 45 48
>>>>>>>> [=C2=A0 690.226668] RSP: 0018:ffffb2d90efc3b40 EFLAGS: 00010246
>>>>>>>> [=C2=A0 690.233072] RAX: 0000000000000000 RBX: ffff9654c6ad9f40 RC=
X:
>>>>>>>> 0000000000000801
>>>>>>>> [=C2=A0 690.241617] RDX: 0000000000000001 RSI: ffff9654c6ad9f00 RD=
I:
>>>>>>>> ffff9654c6ad9f40
>>>>>>>> [=C2=A0 690.250146] RBP: 0000000000000000 R08: 0000000000000002 R0=
9:
>>>>>>>> 0000000000000000
>>>>>>>> [=C2=A0 690.258667] R10: 00000000000303a0 R11: ffff96757ffd4000 R1=
2:
>>>>>>>> ffffb2d90efc3e08
>>>>>>>> [=C2=A0 690.267183] R13: ffff9654c6ad9f00 R14: ffffb2d90efc3e08 R1=
5:
>>>>>>>> 0000000000000000
>>>>>>>> [=C2=A0 690.275696] FS:=C2=A0 00007fa8e005da80(0000) GS:ffff9654ff=
ac0000(0000)
>>>>>>>> knlGS:0000000000000000
>>>>>>>> [=C2=A0 690.285282] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000=
80050033
>>>>>>>> [=C2=A0 690.292252] CR2: 00007fa8cc05b3c0 CR3: 0000001fc8518001 CR=
4:
>>>>>>>> 00000000001606e0
>>>>>>>> [=C2=A0 690.300770] Call Trace:
>>>>>>>> [=C2=A0 690.304123]=C2=A0 xfs_submit_ioend+0x84/0x1e0 [xfs]
>>>>>>>> [=C2=A0 690.309668]=C2=A0 xfs_do_writepage+0x246/0x5a0 [xfs]
>>>>>>>> [=C2=A0 690.315279]=C2=A0 write_cache_pages+0x16b/0x440
>>>>>>>> [=C2=A0 690.320420]=C2=A0 ? xfs_vm_releasepage+0x80/0x80 [xfs]
>>>>>>>> [=C2=A0 690.326238]=C2=A0 xfs_vm_writepages+0x6b/0xa0 [xfs]
>>>>>>>> [=C2=A0 690.331742]=C2=A0 do_writepages+0x4b/0xf0
>>>>>>>> [=C2=A0 690.336275]=C2=A0 ? iomap_file_buffered_write+0x62/0x90
>>>>>>>> [=C2=A0 690.342162]=C2=A0 ? iomap_write_end+0x240/0x240
>>>>>>>> [=C2=A0 690.347295]=C2=A0 ? xfs_iunlock+0x165/0x220 [xfs]
>>>>>>>> [=C2=A0 690.352595]=C2=A0 ? __filemap_fdatawrite_range+0xc1/0x100
>>>>>>>> [=C2=A0 690.358673]=C2=A0 __filemap_fdatawrite_range+0xc1/0x100
>>>>>>>> [=C2=A0 690.364571]=C2=A0 ? __switch_to_asm+0x34/0x70
>>>>>>>> [=C2=A0 690.369484]=C2=A0 file_write_and_wait_range+0x4c/0xa0
>>>>>>>> [=C2=A0 690.375198]=C2=A0 xfs_file_fsync+0x5d/0x230 [xfs]
>>>>>>>> [=C2=A0 690.380499]=C2=A0 do_fsync+0x38/0x60
>>>>>>>> [=C2=A0 690.384534]=C2=A0 __x64_sys_fsync+0x10/0x20
>>>>>>>> [=C2=A0 690.389243]=C2=A0 do_syscall_64+0x5b/0x1e0
>>>>>>>> [=C2=A0 690.393857]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>>>>>> [=C2=A0 690.400020] RIP: 0033:0x7fa8cbe4f70d
>>>>>>>> [=C2=A0 690.404533] Code: bc 20 00 00 75 10 b8 4a 00 00 00 0f 05 4=
8 3d 01 f0 ff
>>>>>>>> ff 73 31 c3 48 83 ec 08 e8 6e f7 ff ff 48 89 04 24 b8 4a 00 00 00 =
0f 05 <48>
>>>>>>>> 8b 3c 24 48 89 c2 e8 b7 f7 ff ff 48 89 d0 48 83 c4 08 48 3d 01
>>>>>>>> [=C2=A0 690.426581] RSP: 002b:00007ffed6954160 EFLAGS: 00000293 OR=
IG_RAX:
>>>>>>>> 000000000000004a
>>>>>>>> [=C2=A0 690.435583] RAX: ffffffffffffffda RBX: 00005573363790f0 RC=
X:
>>>>>>>> 00007fa8cbe4f70d
>>>>>>>> [=C2=A0 690.444102] RDX: 0000000000200000 RSI: 00005573363790f0 RD=
I:
>>>>>>>> 0000000000000003
>>>>>>>> [=C2=A0 690.452615] RBP: 00007fa8b337f418 R08: 0000000000000008 R0=
9:
>>>>>>>> 0000000000000001
>>>>>>>> [=C2=A0 690.461124] R10: 00000000897b0000 R11: 0000000000000293 R1=
2:
>>>>>>>> 0000000000000000
>>>>>>>> [=C2=A0 690.469631] R13: 0000001000000000 R14: 00007fa8c81dda50 R1=
5:
>>>>>>>> 0000000000000000
>>>>>>>> [=C2=A0 690.478130] ---[ end trace 90dd4ee6d5cdfcb8 ]---
>>>>>>> I have just checked xfs code, and looks the only reason is that bio=
 size
>>>>>>> is overflowed, that means the whole bio may reach 4GB. That might be
>>>>>>> possible in case of writeback. But I have to double check if that is
>>>>>>> the case, could you test the following patch and provide the log?
>>>>>>>
>>>>>>> diff --git a/block/blk-core.c b/block/blk-core.c
>>>>>>> index 8340f69670d8..9d61e408c608 100644
>>>>>>> --- a/block/blk-core.c
>>>>>>> +++ b/block/blk-core.c
>>>>>>> @@ -1125,6 +1125,19 @@ blk_qc_t submit_bio(struct bio *bio)
>>>>>>>      				bio_devname(bio, b), count);
>>>>>>>      		}
>>>>>>>      	}
>>>>>>> +	if (WARN_ON(bio->bi_iter.bi_size =3D=3D 0 && bio_op(bio) =3D=3D R=
EQ_OP_WRITE)) {
>>>>>>> +		int i;
>>>>>>> +		printk("bio: %hx/%hx %u %llu %u\n", bio->bi_flags, bio->bi_opf,
>>>>>>> +                       bio->bi_vcnt,
>>>>>>> +                       (unsigned long long)bio->bi_iter.bi_sector,
>>>>>>> +                       bio->bi_iter.bi_size);
>>>>>>> +		for (i =3D 0; i < bio->bi_vcnt; i++) {
>>>>>>> +			struct bio_vec *bvec =3D &bio->bi_io_vec[i];
>>>>>>> +			printk("%d: pfn %lu offset %u len %u\n", i++,
>>>>>>> +                               (unsigned long)page_to_pfn(bvec->bv=
_page),
>>>>>>> +                               bvec->bv_offset, bvec->bv_len);
>>>>>>> +		}
>>>>>>> +	}
>>>>>>>      	return generic_make_request(bio);
>>>>>>>      }
>>>>>> the newest log and i also see you fix patch,=C2=A0 i will test your =
fix patch
>>>>>> more times to check it.
>>>>>>
>>>>>> ------
>>>>>>
>>>>>> [=C2=A0=C2=A0 54.656016] 2019-07-01 11:48:52 mkfs -t xfs /dev/sdb1
>>>>>> [=C2=A0=C2=A0 54.656017]
>>>>>> [=C2=A0 119.228467] WARNING: CPU: 5 PID: 1530 at block/blk-core.c:11=
28
>>>>>> submit_bio+0xa5/0x1d0
>>>>>> [=C2=A0 119.240810] Modules linked in: dm_mod btrfs xor zstd_decompr=
ess
>>>>>> zstd_compress raid6_pq libcrc32c sd_mod intel_rapl sg sb_edac
>>>>>> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypa=
ss
>>>>>> mgag200 crct10dif_pclmul snd_pcm crc32_pclmul ttm crc32c_intel snd_t=
imer
>>>>>> drm_kms_helper ghash_clmulni_intel snd syscopyarea ipmi_si sysfillre=
ct
>>>>>> soundcore aesni_intel sysimgblt ipmi_devintf crypto_simd fb_sys_fops=
 ahci
>>>>>> mei_me libahci cryptd ipmi_msghandler pcspkr glue_helper drm mei lib=
ata
>>>>>> joydev ioatdma lpc_ich i2c_i801 dca wmi acpi_power_meter acpi_pad
>>>>>> pcc_cpufreq ip_tables
>>>>>> [=C2=A0 119.306252] CPU: 5 PID: 1530 Comm: mkfs.xfs Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W I
>>>>>> 5.2.0-rc5-00001-g82f8097 #1
>>>>>> [=C2=A0 119.318274] Hardware name: Intel Corporation S2600WTT/S2600W=
TT, BIOS
>>>>>> SE5C610.86B.01.01.0008.021120151325 02/11/2015
>>>>>> [=C2=A0 119.331852] RIP: 0010:submit_bio+0xa5/0x1d0
>>>>>> [=C2=A0 119.338422] Code: 00 00 65 48 01 35 b3 39 5f 76 8b 0d a1 96 =
c4 01 85 c9
>>>>>> 0f 85 9b 00 00 00 8b 43 28 85 c0 75 a5 8b 53 10 0f b6 ca 83 f9 01 75=
 9a <0f>
>>>>>> 0b 0f b7 4b 68 0f b7 73 14 45 31 c9 4c 8b 43 20 48 c7 c7 f1 99
>>>>>> [=C2=A0 119.363296] RSP: 0018:ffff940c4fb17e58 EFLAGS: 00010246
>>>>>> [=C2=A0 119.371107] RAX: 0000000000000000 RBX: ffff88a53e3d6900 RCX:
>>>>>> 0000000000000001
>>>>>> [=C2=A0 119.381068] RDX: 0000000000040801 RSI: ffff88868138c000 RDI:
>>>>>> ffff88a53e3d6900
>>>>>> [=C2=A0 119.391041] RBP: ffff88a5448b0000 R08: ffff88a53e3d6900 R09:
>>>>>> 0000000000000000
>>>>>> [=C2=A0 119.401003] R10: 0000000000000000 R11: 0000000000000000 R12:
>>>>>> 0000000000000000
>>>>>> [=C2=A0 119.410967] R13: 0000000000000000 R14: 0000000000000000 R15:
>>>>>> 0000000000000000
>>>>>> [=C2=A0 119.420881] FS:=C2=A0 00007f37eba81780(0000) GS:ffff88a57f34=
0000(0000)
>>>>>> knlGS:0000000000000000
>>>>>> [=C2=A0 119.431839] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
>>>>>> [=C2=A0 119.440161] CR2: 00005630eb09d000 CR3: 0000001fc711c002 CR4:
>>>>>> 00000000001606e0
>>>>>> [=C2=A0 119.450017] Call Trace:
>>>>>> [=C2=A0 119.454595]=C2=A0 submit_bio_wait+0x53/0x80
>>>>>> [=C2=A0 119.460636]=C2=A0 blkdev_issue_flush+0x81/0xb0
>>>>>> [=C2=A0 119.466930]=C2=A0 blkdev_fsync+0x2f/0x40
>>>>>> [=C2=A0 119.472590]=C2=A0 do_fsync+0x38/0x60
>>>>>> [=C2=A0 119.477810]=C2=A0 __x64_sys_fsync+0x10/0x20
>>>>>> [=C2=A0 119.483722]=C2=A0 do_syscall_64+0x5b/0x1e0
>>>>>> [=C2=A0 119.489516]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>>>> [=C2=A0 119.496857] RIP: 0033:0x7f37eb2146f0
>>>>>> [=C2=A0 119.502502] Code: 48 3d 01 f0 ff ff 73 01 c3 48 8b 0d b2 78 =
20 00 f7 d8
>>>>>> 64 89 01 48 83 c8 ff c3 83 3d d9 bc 20 00 00 75 10 b8 4a 00 00 00 0f=
 05 <48>
>>>>>> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 6e f7 ff ff 48 89 04 24
>>>>>> [=C2=A0 119.526842] RSP: 002b:00007fffb27f4878 EFLAGS: 00000246 ORIG=
_RAX:
>>>>>> 000000000000004a
>>>>>> [=C2=A0 119.536975] RAX: ffffffffffffffda RBX: 0000000000000811 RCX:
>>>>>> 00007f37eb2146f0
>>>>>> [=C2=A0 119.546592] RDX: 00005630e91ba8e0 RSI: 0000000000000000 RDI:
>>>>>> 0000000000000004
>>>>>> [=C2=A0 119.556171] RBP: 0000000000000004 R08: 00005630eb02b8a0 R09:
>>>>>> 00007fffb27f4e00
>>>>>> [=C2=A0 119.565753] R10: 000000000000009b R11: 0000000000000246 R12:
>>>>>> 00007fffb27f4c60
>>>>>> [=C2=A0 119.575339] R13: 00007fffb27f4a30 R14: 00005630eb048800 R15:
>>>>>> 00005630eb05a800
>>>>>> [=C2=A0 119.584940] ---[ end trace 46a2e1214c930529 ]---
>>>>>> [=C2=A0 119.591765] bio: 0/801 0 0 0
>>>>>>
>>>>> Hi Yiding,
>>>>>
>>>>> The above warning is false positive, and it is flush request, and
>>>>> it isn't same with your original report in which the following warning
>>>>> is triggered.
>>>>>
>>>>> 	"drivers/scsi/scsi_lib.c:1034 scsi_init_io+0x11a/0x2e0"
>>>>>
>>>>> So please run the test kernel with the debug patch I sent to you today
>>>>> and try to trigger the warning in scsi_init_io().
>>>> ------
>>>>
>>>> [=C2=A0 728.863669] 230: pfn 66784668 offset 0 len 17031168
>>>> [=C2=A0 728.869319] 232: pfn 66788826 offset 0 len 22708224
>>>> [=C2=A0 728.874946] 234: pfn 66794370 offset 0 len 29933568
>>>> [=C2=A0 728.880563] 236: pfn 66801678 offset 0 len 4136960
>>>> [=C2=A0 728.886086] 238: pfn 66820096 offset 0 len 2506752
>>> Hi Yiding,
>>>
>>> Could you include all logs dumped by the debug patch?
>>>
>>> +       if (WARN_ON(bio->bi_iter.bi_size =3D=3D 0 && bio_op(bio) =3D=3D=
 REQ_OP_WRITE)) {
>>> +               int i;
>>> +               printk("bio: %hx/%hx %u %llu %u\n", bio->bi_flags, bio-=
>bi_opf,
>>> +                       bio->bi_vcnt,
>>> +                       (unsigned long long)bio->bi_iter.bi_sector,
>>> +                       bio->bi_iter.bi_size);
>>> +               for (i =3D 0; i < bio->bi_vcnt; i++) {
>>> +                       struct bio_vec *bvec =3D &bio->bi_io_vec[i];
>>> +                       printk("%d: pfn %lu offset %u len %u\n", i++,
>>> +                               (unsigned long)page_to_pfn(bvec->bv_pag=
e),
>>> +                               bvec->bv_offset, bvec->bv_len);
>>> +               }
>>> +       }
>>
>> Hi, Ming. I have attatched all log in last email,=C2=A0 can you receive =
that.
>>
>> ------
>>
>> [=C2=A0 124.334834] WARNING: CPU: 10 PID: 1421 at block/blk-core.c:1128
>> submit_bio+0xa5/0x1d0
>> [=C2=A0 124.347274] Modules linked in: dm_mod btrfs xor zstd_decompress
>> zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
>> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass
>> crct10dif_pclmul mgag200 crc32_pclmul ttm crc32c_intel ghash_clmulni_int=
el
>> drm_kms_helper snd_pcm syscopyarea sysfillrect sysimgblt aesni_intel
>> snd_timer ahci crypto_simd ipmi_si fb_sys_fops mei_me libahci snd
>> ipmi_devintf cryptd soundcore glue_helper ipmi_msghandler pcspkr drm ioa=
tdma
>> mei libata joydev lpc_ich i2c_i801 dca wmi acpi_pad acpi_power_meter
>> pcc_cpufreq ip_tables
>> [=C2=A0 124.412706] CPU: 10 PID: 1421 Comm: mkfs.xfs Tainted: G W I
>> 5.2.0-rc5-00001-g82f8097 #1
>> [=C2=A0 124.424823] Hardware name: Intel Corporation S2600WTT/S2600WTT, =
BIOS
>> SE5C610.86B.01.01.0008.021120151325 02/11/2015
>> [=C2=A0 124.438401] RIP: 0010:submit_bio+0xa5/0x1d0
>> [=C2=A0 124.444974] Code: 00 00 65 48 01 35 b3 39 bf 6f 8b 0d a1 96 c4 0=
1 85 c9
>> 0f 85 9b 00 00 00 8b 43 28 85 c0 75 a5 8b 53 10 0f b6 ca 83 f9 01 75 9a =
<0f>
>> 0b 0f b7 4b 68 0f b7 73 14 45 31 c9 4c 8b 43 20 48 c7 c7 f1 99
>> [=C2=A0 124.469850] RSP: 0018:ffffac02ce72fe58 EFLAGS: 00010246
>> [=C2=A0 124.477663] RAX: 0000000000000000 RBX: ffff95df3d416780 RCX:
>> 0000000000000001
>> [=C2=A0 124.487636] RDX: 0000000000040801 RSI: ffff95df3b4b6800 RDI:
>> ffff95df3d416780
>> [=C2=A0 124.497605] RBP: ffff95df49ce8000 R08: ffff95df3d416780 R09:
>> 0000000000000000
>> [=C2=A0 124.507569] R10: 0000000000000000 R11: 0000000000000000 R12:
>> 0000000000000000
>> [=C2=A0 124.517535] R13: 0000000000000000 R14: 0000000000000000 R15:
>> 0000000000000000
>> [=C2=A0 124.527450] FS:=C2=A0 00007fee53609780(0000) GS:ffff95df7f480000=
(0000)
>> knlGS:0000000000000000
>> [=C2=A0 124.538413] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> [=C2=A0 124.546738] CR2: 00005584d7290000 CR3: 0000001fbcd18003 CR4:
>> 00000000001606e0
>> [=C2=A0 124.556597] Call Trace:
>> [=C2=A0 124.561176]=C2=A0 submit_bio_wait+0x53/0x80
>> [=C2=A0 124.567220]=C2=A0 blkdev_issue_flush+0x81/0xb0
>> [=C2=A0 124.573512]=C2=A0 blkdev_fsync+0x2f/0x40
>> [=C2=A0 124.579172]=C2=A0 do_fsync+0x38/0x60
>> [=C2=A0 124.584391]=C2=A0 __x64_sys_fsync+0x10/0x20
>> [=C2=A0 124.590301]=C2=A0 do_syscall_64+0x5b/0x1e0
>> [=C2=A0 124.596095]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> [=C2=A0 124.603437] RIP: 0033:0x7fee52d9c6f0
>> [=C2=A0 124.609082] Code: 48 3d 01 f0 ff ff 73 01 c3 48 8b 0d b2 78 20 0=
0 f7 d8
>> 64 89 01 48 83 c8 ff c3 83 3d d9 bc 20 00 00 75 10 b8 4a 00 00 00 0f 05 =
<48>
>> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 6e f7 ff ff 48 89 04 24
>> [=C2=A0 124.633417] RSP: 002b:00007ffc8c42b4d8 EFLAGS: 00000246 ORIG_RAX:
>> 000000000000004a
>> [=C2=A0 124.643548] RAX: ffffffffffffffda RBX: 0000000000000811 RCX:
>> 00007fee52d9c6f0
>> [=C2=A0 124.653166] RDX: 00005584d6db18e0 RSI: 0000000000000000 RDI:
>> 0000000000000004
>> [=C2=A0 124.662747] RBP: 0000000000000004 R08: 00005584d721e8a0 R09:
>> 00007ffc8c42ba00
>> [=C2=A0 124.672331] R10: 000000000000009b R11: 0000000000000246 R12:
>> 00007ffc8c42b8c0
>> [=C2=A0 124.681919] R13: 00007ffc8c42b690 R14: 00005584d723b800 R15:
>> 00005584d724d800
>> [=C2=A0 124.691520] ---[ end trace 929c66c4a933d3e2 ]---
>> [=C2=A0 124.698346] bio: 0/801 0 0 0
>> [=C2=A0 124.706748] meta-data=3D/dev/sdb1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isize=3D512 agcount=3D4,
>> agsize=3D48838198 blks
>> [=C2=A0 124.706752]
>> [=C2=A0 124.721970]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sectsz=
=3D4096 attr=3D2,
>> projid32bit=3D1
>> [=C2=A0 124.721972]
>> [=C2=A0 124.736132]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 crc=3D1 =
finobt=3D1, sparse=3D0,
>> rmapbt=3D0, reflink=3D0
>> [=C2=A0 124.736134]
>> [=C2=A0 124.751645] data=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bsize=3D4096 blocks=3D195352790,
>> imaxpct=3D25
>> [=C2=A0 124.751647]
>> [=C2=A0 124.765522]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sunit=3D=
0 swidth=3D0 blks
>> [=C2=A0 124.765524]
>> [=C2=A0 124.778026] naming=C2=A0=C2=A0 =3Dversion 2=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bsize=3D4096 asci=
i-ci=3D0
>> ftype=3D1
>> [=C2=A0 124.778028]
>> [=C2=A0 124.791128] log=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3Dinternal log=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bsize=3D4096 bloc=
ks=3D95387,
>> version=3D2
>> [=C2=A0 124.791130]
>> [=C2=A0 124.804674]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sectsz=
=3D4096 sunit=3D1 blks,
>> lazy-count=3D1
>> [=C2=A0 124.804675]
>> [=C2=A0 124.818292] realtime =3Dnone=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ex=
tsz=3D4096 blocks=3D0,
>> rtextents=3D0
>> [=C2=A0 124.818294]
>> [=C2=A0 124.830580] 2019-07-01 12:36:49 mkdir -p /fs/sdb1
>> [=C2=A0 124.830582]
>> [=C2=A0 124.840509] 2019-07-01 12:36:49 mount -t xfs -o inode64 /dev/sdb1
>> /fs/sdb1
>> [=C2=A0 124.840511]
>> [=C2=A0 124.842506] SGI XFS with ACLs, security attributes, realtime, sc=
rub,
>> debug enabled
>> [=C2=A0 124.864478] XFS (sdb1): Mounting V5 Filesystem
>> [=C2=A0 124.886520] XFS (sdb1): Ending clean mount
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting watchdog daem=
on...
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Update UTMP a=
bout System Runlevel Changes...
>> [=C2=A0 727.881932] WARNING: CPU: 0 PID: 1460 at block/blk-core.c:1128
>> submit_bio+0xa5/0x1d0
>> [=C2=A0 727.892444] Modules linked in: xfs dm_mod btrfs xor zstd_decompr=
ess
>> zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
>> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass
>> crct10dif_pclmul mgag200 crc32_pclmul ttm crc32c_intel ghash_clmulni_int=
el
>> drm_kms_helper snd_pcm syscopyarea sysfillrect sysimgblt aesni_intel
>> snd_timer ahci crypto_simd ipmi_si fb_sys_fops mei_me libahci snd
>> ipmi_devintf cryptd soundcore glue_helper ipmi_msghandler pcspkr drm ioa=
tdma
>> mei libata joydev lpc_ich i2c_i801 dca wmi acpi_pad acpi_power_meter
>> pcc_cpufreq ip_tables
>> [=C2=A0 727.949105] CPU: 0 PID: 1460 Comm: fio Tainted: G=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 W I
>> 5.2.0-rc5-00001-g82f8097 #1
>> [=C2=A0 727.958733] Hardware name: Intel Corporation S2600WTT/S2600WTT, =
BIOS
>> SE5C610.86B.01.01.0008.021120151325 02/11/2015
>> [=C2=A0 727.970404] RIP: 0010:submit_bio+0xa5/0x1d0
>> [=C2=A0 727.975087] Code: 00 00 65 48 01 35 b3 39 bf 6f 8b 0d a1 96 c4 0=
1 85 c9
>> 0f 85 9b 00 00 00 8b 43 28 85 c0 75 a5 8b 53 10 0f b6 ca 83 f9 01 75 9a =
<0f>
>> 0b 0f b7 4b 68 0f b7 73 14 45 31 c9 4c 8b 43 20 48 c7 c7 f1 99
>> [=C2=A0 727.996090] RSP: 0018:ffffac02cdaebb38 EFLAGS: 00010246
>> [=C2=A0 728.001932] RAX: 0000000000000000 RBX: ffff95df4b754040 RCX:
>> 0000000000000001
>> [=C2=A0 728.009908] RDX: 0000000000000801 RSI: ffff95df4b754000 RDI:
>> ffff95df4b754040
>> [=C2=A0 728.017885] RBP: 0000000000000000 R08: 0000000000000002 R09:
>> 0000000000000000
>> [=C2=A0 728.025861] R10: 0000000000030340 R11: ffff95dffffd5000 R12:
>> ffffac02cdaebe08
>> [=C2=A0 728.033839] R13: ffff95df4b754000 R14: ffffac02cdaebe08 R15:
>> 0000000000000000
>> [=C2=A0 728.041817] FS:=C2=A0 00007f7492b0ca80(0000) GS:ffff95df7f200000=
(0000)
>> knlGS:0000000000000000
>> [=C2=A0 728.050862] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> [=C2=A0 728.057286] CR2: 00007f746532e004 CR3: 0000001fdc20e005 CR4:
>> 00000000001606f0
>> [=C2=A0 728.065264] Call Trace:
>> [=C2=A0 728.068068]=C2=A0 xfs_submit_ioend+0x84/0x1e0 [xfs]
>> [=C2=A0 728.073069]=C2=A0 xfs_do_writepage+0x246/0x5a0 [xfs]
>> [=C2=A0 728.078139]=C2=A0 write_cache_pages+0x16b/0x440
>> [=C2=A0 728.082741]=C2=A0 ? xfs_vm_releasepage+0x80/0x80 [xfs]
>> [=C2=A0 728.088025]=C2=A0 xfs_vm_writepages+0x6b/0xa0 [xfs]
>> [=C2=A0 728.092994]=C2=A0 do_writepages+0x4b/0xf0
>> [=C2=A0 728.096995]=C2=A0 ? iomap_file_buffered_write+0x62/0x90
>> [=C2=A0 728.102352]=C2=A0 ? iomap_write_end+0x240/0x240
>> [=C2=A0 728.106958]=C2=A0 ? xfs_iunlock+0x165/0x220 [xfs]
>> [=C2=A0 728.111734]=C2=A0 ? __filemap_fdatawrite_range+0xc1/0x100
>> [=C2=A0 728.117276]=C2=A0 __filemap_fdatawrite_range+0xc1/0x100
>> [=C2=A0 728.122625]=C2=A0 file_write_and_wait_range+0x4c/0xa0
>> [=C2=A0 728.127812]=C2=A0 xfs_file_fsync+0x5d/0x230 [xfs]
>> [=C2=A0 728.132591]=C2=A0 do_fsync+0x38/0x60
>> [=C2=A0 728.136105]=C2=A0 __x64_sys_fsync+0x10/0x20
>> [=C2=A0 728.140296]=C2=A0 do_syscall_64+0x5b/0x1e0
>> [=C2=A0 728.144390]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> [=C2=A0 728.150039] RIP: 0033:0x7f747e8fe70d
>> [=C2=A0 728.154036] Code: bc 20 00 00 75 10 b8 4a 00 00 00 0f 05 48 3d 0=
1 f0 ff
>> ff 73 31 c3 48 83 ec 08 e8 6e f7 ff ff 48 89 04 24 b8 4a 00 00 00 0f 05 =
<48>
>> 8b 3c 24 48 89 c2 e8 b7 f7 ff ff 48 89 d0 48 83 c4 08 48 3d 01
>> [=C2=A0 728.175027] RSP: 002b:00007ffe67fd0f00 EFLAGS: 00000293 ORIG_RAX:
>> 000000000000004a
>> [=C2=A0 728.183491] RAX: ffffffffffffffda RBX: 000055d51d05b0f0 RCX:
>> 00007f747e8fe70d
>> [=C2=A0 728.191469] RDX: 0000000000200000 RSI: 000055d51d05b0f0 RDI:
>> 0000000000000003
>> [=C2=A0 728.199446] RBP: 00007f7465e2e418 R08: 0000000000000008 R09:
>> 0000000000000001
>> [=C2=A0 728.207961] R10: 00000000897b0000 R11: 0000000000000293 R12:
>> 0000000000000000
>> [=C2=A0 728.216467] R13: 0000001000000000 R14: 00007f747ac8ca50 R15:
>> 0000000000000000
>> [=C2=A0 728.224971] ---[ end trace 929c66c4a933d3e3 ]---
>> [=C2=A0 728.230705] bio: c000/801 240 514831016 0
>> [=C2=A0 728.235725] 0: pfn 66605336 offset 0 len 18096128
>> [=C2=A0 728.241493] 2: pfn 66609754 offset 0 len 92037120
>> [=C2=A0 728.247234] 4: pfn 66632224 offset 0 len 151552
>> [=C2=A0 728.252776] 6: pfn 66632261 offset 0 len 94208
>> [=C2=A0 728.258203] 8: pfn 66632284 offset 0 len 100556800
>> [=C2=A0 728.264005] 10: pfn 66656834 offset 0 len 413696
>> [=C2=A0 728.269591] 12: pfn 66656935 offset 0 len 643072
>> [=C2=A0 728.275192] 14: pfn 66657092 offset 0 len 1982464
>> [=C2=A0 728.280848] 16: pfn 66657576 offset 0 len 606208
>> [=C2=A0 728.286416] 18: pfn 66657724 offset 0 len 126976
>> [=C2=A0 728.291948] 20: pfn 66657755 offset 0 len 249856
>> [=C2=A0 728.297470] 22: pfn 66657816 offset 0 len 626688
>> [=C2=A0 728.302989] 24: pfn 66657969 offset 0 len 499712
>> [=C2=A0 728.308505] 26: pfn 66658091 offset 0 len 610304
>> [=C2=A0 728.314014] 28: pfn 66658240 offset 0 len 876544
>> [=C2=A0 728.319516] 30: pfn 66658454 offset 0 len 495616
>> [=C2=A0 728.325042] 32: pfn 66658575 offset 0 len 1372160
>> [=C2=A0 728.330626] 34: pfn 66658910 offset 0 len 122880
>> [=C2=A0 728.336134] 36: pfn 66658940 offset 0 len 118784
>> [=C2=A0 728.341604] 38: pfn 66658969 offset 0 len 122880
>> [=C2=A0 728.347078] 40: pfn 66658999 offset 0 len 118784
>> [=C2=A0 728.352541] 42: pfn 66659028 offset 0 len 872448
>> [=C2=A0 728.358003] 44: pfn 66659241 offset 0 len 610304
>> [=C2=A0 728.363470] 46: pfn 66659390 offset 0 len 245760
>> [=C2=A0 728.368935] 48: pfn 66659450 offset 0 len 385024
>> [=C2=A0 728.374386] 50: pfn 66659544 offset 0 len 192512
>> [=C2=A0 728.379846] 52: pfn 66659591 offset 0 len 339968
>> [=C2=A0 728.385314] 54: pfn 66659674 offset 0 len 294912
>> [=C2=A0 728.390790] 56: pfn 66659746 offset 0 len 98304
>> [=C2=A0 728.396162] 58: pfn 66659770 offset 0 len 389120
>> [=C2=A0 728.401592] 60: pfn 66659865 offset 0 len 872448
>> [=C2=A0 728.407021] 62: pfn 66660078 offset 0 len 544768
>> [=C2=A0 728.412458] 64: pfn 66660211 offset 0 len 704512
>> [=C2=A0 728.417881] 66: pfn 66660383 offset 0 len 94208
>> [=C2=A0 728.423232] 68: pfn 66660406 offset 0 len 94208
>> [=C2=A0 728.428552] 70: pfn 66660429 offset 0 len 294912
>> [=C2=A0 728.433964] 72: pfn 66660501 offset 0 len 180224
>> [=C2=A0 728.439371] 74: pfn 66660545 offset 0 len 196608
>> [=C2=A0 728.444777] 76: pfn 66660593 offset 0 len 290816
>> [=C2=A0 728.450181] 78: pfn 66660664 offset 0 len 167936
>> [=C2=A0 728.455547] 80: pfn 66660705 offset 0 len 81920
>> [=C2=A0 728.460808] 82: pfn 66660725 offset 0 len 999424
>> [=C2=A0 728.466189] 84: pfn 66660969 offset 0 len 442368
>> [=C2=A0 728.471539] 86: pfn 66661077 offset 0 len 425984
>> [=C2=A0 728.476887] 88: pfn 66661181 offset 0 len 348160
>> [=C2=A0 728.482242] 90: pfn 66661266 offset 0 len 966656
>> [=C2=A0 728.487577] 92: pfn 66661502 offset 0 len 176128
>> [=C2=A0 728.492948] 94: pfn 66661545 offset 0 len 348160
>> [=C2=A0 728.498287] 96: pfn 66661630 offset 0 len 1064960
>> [=C2=A0 728.503770] 98: pfn 66661890 offset 0 len 180224
>> [=C2=A0 728.509136] 100: pfn 66661934 offset 0 len 888832
>> [=C2=A0 728.514574] 102: pfn 66662151 offset 0 len 176128
>> [=C2=A0 728.520045] 104: pfn 66662194 offset 0 len 81920
>> [=C2=A0 728.525381] 106: pfn 66662214 offset 0 len 356352
>> [=C2=A0 728.530829] 108: pfn 66662301 offset 0 len 89661440
>> [=C2=A0 728.536458] 110: pfn 66684191 offset 0 len 405504
>> [=C2=A0 728.541883] 112: pfn 66684290 offset 0 len 860160
>> [=C2=A0 728.547317] 114: pfn 66684500 offset 0 len 200704
>> [=C2=A0 728.552742] 116: pfn 66684549 offset 0 len 299008
>> [=C2=A0 728.558194] 118: pfn 66684622 offset 0 len 192512
>> [=C2=A0 728.563609] 120: pfn 66684669 offset 0 len 102400
>> [=C2=A0 728.569033] 122: pfn 66684694 offset 0 len 196608
>> [=C2=A0 728.574473] 124: pfn 66684742 offset 0 len 98304
>> [=C2=A0 728.579812] 126: pfn 66684766 offset 0 len 94208
>> [=C2=A0 728.585165] 128: pfn 66684789 offset 0 len 749568
>> [=C2=A0 728.590597] 130: pfn 66684972 offset 0 len 1490944
>> [=C2=A0 728.596119] 132: pfn 66685336 offset 0 len 684032
>> [=C2=A0 728.601542] 134: pfn 66685503 offset 0 len 495616
>> [=C2=A0 728.606964] 136: pfn 66685624 offset 0 len 196608
>> [=C2=A0 728.612391] 138: pfn 66685672 offset 0 len 585728
>> [=C2=A0 728.617814] 140: pfn 66685815 offset 0 len 94208
>> [=C2=A0 728.623168] 142: pfn 66685838 offset 0 len 94208
>> [=C2=A0 728.628505] 144: pfn 66685861 offset 0 len 77824
>> [=C2=A0 728.633830] 146: pfn 66685880 offset 0 len 778240
>> [=C2=A0 728.639286] 148: pfn 66686070 offset 0 len 196608
>> [=C2=A0 728.644710] 150: pfn 66686118 offset 0 len 503808
>> [=C2=A0 728.650165] 152: pfn 66686241 offset 0 len 85626880
>> [=C2=A0 728.655805] 154: pfn 66707146 offset 0 len 13893632
>> [=C2=A0 728.661430] 156: pfn 66710538 offset 0 len 3411968
>> [=C2=A0 728.666977] 158: pfn 66711371 offset 0 len 151552
>> [=C2=A0 728.672412] 160: pfn 66711408 offset 0 len 450560
>> [=C2=A0 728.677849] 162: pfn 66711518 offset 0 len 155648
>> [=C2=A0 728.683299] 164: pfn 66711556 offset 0 len 323584
>> [=C2=A0 728.688722] 166: pfn 66711635 offset 0 len 163840
>> [=C2=A0 728.694174] 168: pfn 66711675 offset 0 len 327680
>> [=C2=A0 728.699607] 170: pfn 66711755 offset 0 len 159744
>> [=C2=A0 728.705032] 172: pfn 66711794 offset 0 len 1130496
>> [=C2=A0 728.710544] 174: pfn 66712070 offset 0 len 974848
>> [=C2=A0 728.715968] 176: pfn 66712308 offset 0 len 651264
>> [=C2=A0 728.721384] 178: pfn 66712467 offset 0 len 2285568
>> [=C2=A0 728.726906] 180: pfn 66713025 offset 0 len 57344
>> [=C2=A0 728.732236] 182: pfn 66713039 offset 0 len 868352
>> [=C2=A0 728.737663] 184: pfn 66713251 offset 0 len 491520
>> [=C2=A0 728.743100] 186: pfn 66713371 offset 0 len 389120
>> [=C2=A0 728.748535] 188: pfn 66713466 offset 0 len 753664
>> [=C2=A0 728.753982] 190: pfn 66713650 offset 0 len 475136
>> [=C2=A0 728.759404] 192: pfn 66713766 offset 0 len 192512
>> [=C2=A0 728.764839] 194: pfn 66713813 offset 0 len 192512
>> [=C2=A0 728.770285] 196: pfn 66713860 offset 0 len 196608
>> [=C2=A0 728.775704] 198: pfn 66713908 offset 0 len 98304
>> [=C2=A0 728.781035] 200: pfn 66713932 offset 0 len 2113536
>> [=C2=A0 728.786562] 202: pfn 66714448 offset 0 len 94208
>> [=C2=A0 728.791894] 204: pfn 66714471 offset 0 len 290816
>> [=C2=A0 728.797323] 206: pfn 66714542 offset 0 len 65536
>> [=C2=A0 728.802653] 208: pfn 66714558 offset 0 len 2453504
>> [=C2=A0 728.808195] 210: pfn 66715157 offset 0 len 790528
>> [=C2=A0 728.813612] 212: pfn 66715350 offset 0 len 1056768
>> [=C2=A0 728.819129] 214: pfn 66715608 offset 0 len 76349440
>> [=C2=A0 728.824778] 216: pfn 66734248 offset 0 len 63995904
>> [=C2=A0 728.830407] 218: pfn 66749872 offset 0 len 52539392
>> [=C2=A0 728.836033] 220: pfn 66762699 offset 0 len 33771520
>> [=C2=A0 728.841649] 222: pfn 66770944 offset 0 len 5955584
>> [=C2=A0 728.847178] 224: pfn 66772398 offset 0 len 41803776
>> [=C2=A0 728.852797] 226: pfn 66782604 offset 0 len 16384
>> [=C2=A0 728.858151] 228: pfn 66782608 offset 0 len 8437760
>> [=C2=A0 728.863669] 230: pfn 66784668 offset 0 len 17031168
>> [=C2=A0 728.869319] 232: pfn 66788826 offset 0 len 22708224
>> [=C2=A0 728.874946] 234: pfn 66794370 offset 0 len 29933568
>> [=C2=A0 728.880563] 236: pfn 66801678 offset 0 len 4136960
>> [=C2=A0 728.886086] 238: pfn 66820096 offset 0 len 2506752
>> [=C2=A0 729.336992] WARNING: CPU: 40 PID: 1312 at drivers/scsi/scsi_lib.=
c:1010
>> scsi_init_io+0x103/0x170
>> [=C2=A0 729.349150] Modules linked in: xfs dm_mod btrfs xor zstd_decompr=
ess
>> zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
>> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass
>> crct10dif_pclmul mgag200 crc32_pclmul ttm crc32c_intel ghash_clmulni_int=
el
>> drm_kms_helper snd_pcm syscopyarea sysfillrect sysimgblt aesni_intel
>> snd_timer ahci crypto_simd ipmi_si fb_sys_fops mei_me libahci snd
>> ipmi_devintf cryptd soundcore glue_helper ipmi_msghandler pcspkr drm ioa=
tdma
>> mei libata joydev lpc_ich i2c_i801 dca wmi acpi_pad acpi_power_meter
>> pcc_cpufreq ip_tables
>> [=C2=A0 729.409451] CPU: 40 PID: 1312 Comm: kworker/40:1H Tainted: G=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W
>> I=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.2.0-rc5-00001-g82f8097 #1
>> [=C2=A0 729.421013] Hardware name: Intel Corporation S2600WTT/S2600WTT, =
BIOS
>> SE5C610.86B.01.01.0008.021120151325 02/11/2015
>> [=C2=A0 729.433604] Workqueue: kblockd blk_mq_run_work_fn
>> [=C2=A0 729.439805] RIP: 0010:scsi_init_io+0x103/0x170
>> [=C2=A0 729.445726] Code: 5c 41 5d c3 be 01 00 00 00 e9 49 ff ff ff 8b 4=
5 70 89
>> 83 08 01 00 00 f6 45 1a 01 75 92 31 c0 48 83 c4 08 5b 5d 41 5c 41 5d c3 =
<0f>
>> 0b 48 83 c4 08 b8 0a 00 00 00 5b 5d 41 5c 41 5d c3 48 8b 75 38
>> [=C2=A0 729.468787] RSP: 0018:ffffac02cea47c78 EFLAGS: 00010246
>> [=C2=A0 729.475705] RAX: 000000001eafb2a8 RBX: ffff95df3e7a3950 RCX:
>> 0000000000000000
>> [=C2=A0 729.484790] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
>> ffff95df3e7a3950
>> [=C2=A0 729.493889] RBP: ffff95df3e7a3840 R08: 0000000000000000 R09:
>> ffff95df3e7a3988
>> [=C2=A0 729.502995] R10: ffffac02cc71fda0 R11: fefefefefefefeff R12:
>> 0000000000000801
>> [=C2=A0 729.512123] R13: 0000000000000000 R14: 0000000000000000 R15:
>> ffff95df3ba8e800
>> [=C2=A0 729.521261] FS:=C2=A0 0000000000000000(0000) GS:ffff95df7f780000=
(0000)
>> knlGS:0000000000000000
>> [=C2=A0 729.531505] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> [=C2=A0 729.539140] CR2: 00007f7465922814 CR3: 0000000a80c0a006 CR4:
>> 00000000001606e0
>> [=C2=A0 729.548359] Call Trace:
>> [=C2=A0 729.552355]=C2=A0 sd_init_command+0x2ee/0xaf0 [sd_mod]
>> [=C2=A0 729.558882]=C2=A0 scsi_queue_rq+0x559/0xa80
>> [=C2=A0 729.564354]=C2=A0 blk_mq_dispatch_rq_list+0x3da/0x5b0
>> [=C2=A0 729.570820]=C2=A0 ? syscall_return_via_sysret+0x10/0x7f
>> [=C2=A0 729.577488]=C2=A0 ? __switch_to_asm+0x40/0x70
>> [=C2=A0 729.583192]=C2=A0 ? elv_rb_del+0x1f/0x30
>> [=C2=A0 729.588417]=C2=A0 ? deadline_remove_request+0x55/0xc0
>> [=C2=A0 729.594915]=C2=A0 blk_mq_do_dispatch_sched+0x76/0x120
>> [=C2=A0 729.601424]=C2=A0 blk_mq_sched_dispatch_requests+0x100/0x170
>> [=C2=A0 729.608626]=C2=A0 __blk_mq_run_hw_queue+0x60/0x130
>> [=C2=A0 729.614873]=C2=A0 process_one_work+0x19c/0x3c0
>> [=C2=A0 729.620734]=C2=A0 worker_thread+0x3c/0x3b0
>> [=C2=A0 729.626210]=C2=A0 ? process_one_work+0x3c0/0x3c0
>> [=C2=A0 729.632280]=C2=A0 kthread+0x11e/0x140
>> [=C2=A0 729.637281]=C2=A0 ? kthread_park+0x90/0x90
>> [=C2=A0 729.642773]=C2=A0 ret_from_fork+0x35/0x40
>> [=C2=A0 729.648172] ---[ end trace 929c66c4a933d3e4 ]---
>> [=C2=A0 729.654870] print_req_error: I/O error, dev sdb, sector 51483101=
6 flags
>> 801
>> [=C2=A0 729.849057] XFS (sdb1): writeback error on sector 514831016
>> [=C2=A0 738.467814] WARNING: CPU: 1 PID: 1460 at block/blk-core.c:1128
>> submit_bio+0xa5/0x1d0
>> [=C2=A0 738.478959] Modules linked in: xfs dm_mod btrfs xor zstd_decompr=
ess
>> zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
>> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass
>> crct10dif_pclmul mgag200 crc32_pclmul ttm crc32c_intel ghash_clmulni_int=
el
>> drm_kms_helper snd_pcm syscopyarea sysfillrect sysimgblt aesni_intel
>> snd_timer ahci crypto_simd ipmi_si fb_sys_fops mei_me libahci snd
>> ipmi_devintf cryptd soundcore glue_helper ipmi_msghandler pcspkr drm ioa=
tdma
>> mei libata joydev lpc_ich i2c_i801 dca wmi acpi_pad acpi_power_meter
>> pcc_cpufreq ip_tables
>> [=C2=A0 738.538361] CPU: 1 PID: 1460 Comm: fio Tainted: G=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 W I
>> 5.2.0-rc5-00001-g82f8097 #1
>> [=C2=A0 738.548561] Hardware name: Intel Corporation S2600WTT/S2600WTT, =
BIOS
>> SE5C610.86B.01.01.0008.021120151325 02/11/2015
>> [=C2=A0 738.560805] RIP: 0010:submit_bio+0xa5/0x1d0
>> [=C2=A0 738.566050] Code: 00 00 65 48 01 35 b3 39 bf 6f 8b 0d a1 96 c4 0=
1 85 c9
>> 0f 85 9b 00 00 00 8b 43 28 85 c0 75 a5 8b 53 10 0f b6 ca 83 f9 01 75 9a =
<0f>
>> 0b 0f b7 4b 68 0f b7 73 14 45 31 c9 4c 8b 43 20 48 c7 c7 f1 99
>> [=C2=A0 738.588175] RSP: 0018:ffffac02cdaebb38 EFLAGS: 00010246
>> [=C2=A0 738.594572] RAX: 0000000000000000 RBX: ffff95df3ce59e40 RCX:
>> 0000000000000001
>> [=C2=A0 738.603102] RDX: 0000000000000801 RSI: ffff95df3ce59e00 RDI:
>> ffff95df3ce59e40
>> [=C2=A0 738.611611] RBP: 0000000000000000 R08: 0000000000000002 R09:
>> 0000000000000000
>> [=C2=A0 738.620118] R10: 0000000000030340 R11: ffff95dffffd5000 R12:
>> ffffac02cdaebe08
>> [=C2=A0 738.628626] R13: ffff95df3ce59e00 R14: ffffac02cdaebe08 R15:
>> 0000000000000000
>> [=C2=A0 738.637125] FS:=C2=A0 00007f7492b0ca80(0000) GS:ffff95df7f240000=
(0000)
>> knlGS:0000000000000000
>> [=C2=A0 738.646689] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> [=C2=A0 738.653626] CR2: 00007f7465355004 CR3: 0000001fdc20e004 CR4:
>> 00000000001606e0
>> [=C2=A0 738.662117] Call Trace:
>> [=C2=A0 738.665420]=C2=A0 xfs_submit_ioend+0x84/0x1e0 [xfs]
>> [=C2=A0 738.670931]=C2=A0 xfs_do_writepage+0x246/0x5a0 [xfs]
>> [=C2=A0 738.676514]=C2=A0 write_cache_pages+0x16b/0x440
>> [=C2=A0 738.681638]=C2=A0 ? xfs_vm_releasepage+0x80/0x80 [xfs]
>> [=C2=A0 738.687425]=C2=A0 xfs_vm_writepages+0x6b/0xa0 [xfs]
>> [=C2=A0 738.692895]=C2=A0 do_writepages+0x4b/0xf0
>> [=C2=A0 738.697392]=C2=A0 ? iomap_file_buffered_write+0x62/0x90
>> [=C2=A0 738.703240]=C2=A0 ? iomap_write_end+0x240/0x240
>> [=C2=A0 738.708335]=C2=A0 ? xfs_iunlock+0x165/0x220 [xfs]
>> [=C2=A0 738.713600]=C2=A0 ? __filemap_fdatawrite_range+0xc1/0x100
>> [=C2=A0 738.719641]=C2=A0 __filemap_fdatawrite_range+0xc1/0x100
>> [=C2=A0 738.725489]=C2=A0 file_write_and_wait_range+0x4c/0xa0
>> [=C2=A0 738.731165]=C2=A0 xfs_file_fsync+0x5d/0x230 [xfs]
>> [=C2=A0 738.736435]=C2=A0 do_fsync+0x38/0x60
>> [=C2=A0 738.740439]=C2=A0 __x64_sys_fsync+0x10/0x20
>> [=C2=A0 738.745124]=C2=A0 do_syscall_64+0x5b/0x1e0
>> [=C2=A0 738.749711]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> [=C2=A0 738.755848] RIP: 0033:0x7f747e8fe70d
>> [=C2=A0 738.760333] Code: bc 20 00 00 75 10 b8 4a 00 00 00 0f 05 48 3d 0=
1 f0 ff
>> ff 73 31 c3 48 83 ec 08 e8 6e f7 ff ff 48 89 04 24 b8 4a 00 00 00 0f 05 =
<48>
>> 8b 3c 24 48 89 c2 e8 b7 f7 ff ff 48 89 d0 48 83 c4 08 48 3d 01
>> [=C2=A0 738.782345] RSP: 002b:00007ffe67fd0f00 EFLAGS: 00000293 ORIG_RAX:
>> 000000000000004a
>> [=C2=A0 738.791335] RAX: ffffffffffffffda RBX: 000055d51d05b0f0 RCX:
>> 00007f747e8fe70d
>> [=C2=A0 738.799843] RDX: 0000000000200000 RSI: 000055d51d05b0f0 RDI:
>> 0000000000000003
>> [=C2=A0 738.808354] RBP: 00007f7465e2e418 R08: 0000000000000008 R09:
>> 0000000000000001
>> [=C2=A0 738.816865] R10: 00000000897b0000 R11: 0000000000000293 R12:
>> 0000000000000000
>> [=C2=A0 738.825368] R13: 0000001000000000 R14: 00007f747ac8ca50 R15:
>> 0000000000000000
>> [=C2=A0 738.833858] ---[ end trace 929c66c4a933d3e5 ]---
>> [=C2=A0 738.839553] bio: c000/801 98 532946720 0
>> [=C2=A0 738.844459] 0: pfn 32001772 offset 0 len 184487936
>> [=C2=A0 738.850312] 2: pfn 61947904 offset 0 len 4194304
>> [=C2=A0 738.855993] 4: pfn 61945856 offset 0 len 352256
>> [=C2=A0 738.861521] 6: pfn 61945942 offset 0 len 3842048
>> [=C2=A0 738.867130] 8: pfn 61943808 offset 0 len 4194304
>> [=C2=A0 738.872741] 10: pfn 61941760 offset 0 len 4194304
>> [=C2=A0 738.878426] 12: pfn 61939712 offset 0 len 3362816
>> [=C2=A0 738.884095] 14: pfn 61940533 offset 0 len 831488
>> [=C2=A0 738.889666] 16: pfn 61937664 offset 0 len 4194304
>> [=C2=A0 738.895333] 18: pfn 32165430 offset 0 len 243589120
>> [=C2=A0 738.901159] 20: pfn 61935616 offset 0 len 4194304
>> [=C2=A0 738.906784] 22: pfn 61933568 offset 0 len 4194304
>> [=C2=A0 738.912414] 24: pfn 61931520 offset 0 len 4194304
>> [=C2=A0 738.918029] 26: pfn 61929472 offset 0 len 4194304
>> [=C2=A0 738.923661] 28: pfn 32224900 offset 0 len 242958336
>> [=C2=A0 738.929470] 30: pfn 61927424 offset 0 len 4194304
>> [=C2=A0 738.935063] 32: pfn 32284216 offset 0 len 243081216
>> [=C2=A0 738.940858] 34: pfn 61925376 offset 0 len 4194304
>> [=C2=A0 738.946466] 36: pfn 32343562 offset 0 len 243232768
>> [=C2=A0 738.952242] 38: pfn 32402945 offset 0 len 16384
>> [=C2=A0 738.957612] 40: pfn 61923328 offset 0 len 4194304
>> [=C2=A0 738.963182] 42: pfn 61921280 offset 0 len 4194304
>> [=C2=A0 738.968774] 44: pfn 61919232 offset 0 len 3047424
>> [=C2=A0 738.974328] 46: pfn 61919976 offset 0 len 1146880
>> [=C2=A0 738.979888] 48: pfn 61917184 offset 0 len 4194304
>> [=C2=A0 738.985456] 50: pfn 61915136 offset 0 len 4194304
>> [=C2=A0 738.991017] 52: pfn 32462295 offset 0 len 243081216
>> [=C2=A0 738.996775] 54: pfn 61913088 offset 0 len 4194304
>> [=C2=A0 739.002323] 56: pfn 61911040 offset 0 len 3039232
>> [=C2=A0 739.007892] 58: pfn 61911782 offset 0 len 1155072
>> [=C2=A0 739.013445] 60: pfn 61908992 offset 0 len 1875968
>> [=C2=A0 739.018982] 62: pfn 61909450 offset 0 len 20480
>> [=C2=A0 739.024332] 64: pfn 61909455 offset 0 len 2297856
>> [=C2=A0 739.029865] 66: pfn 61906944 offset 0 len 4194304
>> [=C2=A0 739.035420] 68: pfn 61904896 offset 0 len 4194304
>> [=C2=A0 739.040947] 70: pfn 32640459 offset 0 len 243032064
>> [=C2=A0 739.046677] 72: pfn 61902848 offset 0 len 4194304
>> [=C2=A0 739.052232] 74: pfn 32699793 offset 0 len 243228672
>> [=C2=A0 739.057977] 76: pfn 61900800 offset 0 len 4194304
>> [=C2=A0 739.063495] 78: pfn 61898752 offset 0 len 4194304
>> [=C2=A0 739.069023] 80: pfn 61896704 offset 0 len 4194304
>> [=C2=A0 739.074520] 82: pfn 32759175 offset 0 len 242909184
>> [=C2=A0 739.080230] 84: pfn 61894656 offset 0 len 4194304
>> [=C2=A0 739.085743] 86: pfn 32818479 offset 0 len 243081216
>> [=C2=A0 739.091446] 88: pfn 61892608 offset 0 len 4194304
>> [=C2=A0 739.096936] 90: pfn 61890560 offset 0 len 1286144
>> [=C2=A0 739.102418] 92: pfn 61890874 offset 0 len 2908160
>> [=C2=A0 739.107895] 94: pfn 61888512 offset 0 len 4194304
>> [=C2=A0 739.113390] 96: pfn 61886464 offset 0 len 2572288
>> [=C2=A0 739.118938] print_req_error: I/O error, dev sdb, sector 53294672=
0 flags
>> 801
>> [=C2=A0 739.430464] XFS (sdb1): writeback error on sector 532946720
>> [=C2=A0 742.762917] fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Df=
sync,
>> error=3DInput/output error
>> [=C2=A0 742.762920]
> Sorry for missing your dmesg log.
>
> Now, the issue is quite clear, and it is one int overflow issue,
> which should be addressed by the patch I posted.
>
> Please go ahead and give a test on V2!
>
> thanks,
> Ming
>
>



--===============3920806204473576469==--

