Content-Type: multipart/mixed; boundary="===============4422314292777792422=="
MIME-Version: 1.0
From: Liu Yiding <liuyd.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: 07173c3ec2: stderr.fio:pid=#, err=#/file:filesetup.c:#, func=fsync, error=Input/output_error
Date: Mon, 01 Jul 2019 14:54:31 +0800
Message-ID: <14cf3658-21d5-a8fe-982e-60776476eb75@cn.fujitsu.com>
In-Reply-To: <20190701064403.GB16809@ming.t460p>
List-Id: <oe-lkp.lists.linux.dev>

--===============4422314292777792422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2019/7/1 =E4=B8=8B=E5=8D=882:44, Ming Lei =E5=86=99=E9=81=93:
> On Mon, Jul 01, 2019 at 12:49:51PM +0800, Liu Yiding wrote:
>> =E5=9C=A8 2019/7/1 =E4=B8=8A=E5=8D=8810:47, Ming Lei =E5=86=99=E9=81=93:
>>> [snip]
>>>>>> ------
>>>>>>
>>>>>> 2412 [=C2=A0 112.558155] XFS (sdb1): Ending clean mount
>>>>>> 2413 [ 1317.330820] WARNING: CPU: 63 PID: 1495 at
>>>>>> drivers/scsi/scsi_lib.c:1034 scsi_init_io+0x11a/0x2e0
>>>>>> 2414 [ 1317.344000] Modules linked in: xfs dm_mod btrfs xor zstd_dec=
ompress
>>>>>> zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
>>>>>> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_i=C2=A0=C2=A0=C2=
=A0=C2=A0 ntel kvm irqbypass
>>>>>> crct10dif_pclmul crc32_pclmul crc32c_intel mgag200 snd_pcm
>>>>>> ghash_clmulni_intel ttm snd_timer drm_kms_helper ipmi_si ahci snd
>>>>>> aesni_intel syscopyarea libahci ipmi_devi=C2=A0=C2=A0=C2=A0=C2=A0 nt=
f sysfillrect sysimgblt
>>>>>> crypto_simd mei_me fb_sys_fops soundcore ioatdma cryptd ipmi_msghand=
ler
>>>>>> glue_helper pcspkr drm libata mei joydev lpc_ich i2c_i801 dca wmi
>>>>>> acpi_power_meter acpi=C2=A0=C2=A0=C2=A0=C2=A0 _pad pcc_cpufreq ip_ta=
bles
>>>>>> 2415 [ 1317.408135] CPU: 63 PID: 1495 Comm: kworker/63:1H Tainted:
>>>>>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.2.0-rc5-00001-gc2d55e2 #1
>>>>>> 2416 [ 1317.420350] Hardware name: Intel Corporation S2600WTT/S2600W=
TT, BIOS
>>>>>> SE5C610.86B.01.01.0008.021120151325 02/11/2015
>>>>>> 2417 [ 1317.433545] Workqueue: kblockd blk_mq_run_work_fn
>>>>>> 2418 [ 1317.440295] RIP: 0010:scsi_init_io+0x11a/0x2e0
>>>>>> 2419 [ 1317.446746] Code: be 01 00 00 00 e9 44 ff ff ff 8b 45 70 89 =
83 08 01
>>>>>> 00 00 f6 45 1a 01 75 8a 31 c0 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41=
 5f c3
>>>>>> <0f> 0b 8b 4d 18 8b 55 28 45 31 c9 48=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
c7 c6 98 da 69 82 48 c7 c7 f0
>>>>>> 2420 [ 1317.470863] RSP: 0018:ffffa5fa4f7e7c68 EFLAGS: 00010246
>>>>>> 2421 [ 1317.478294] RAX: 000000003d17d1b8 RBX: ffff8ae6cb742690 RCX:
>>>>>> 0000000000000000
>>>>>> 2422 [ 1317.487878] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
>>>>>> ffff8ae6cb742690
>>>>>> 2423 [ 1317.497469] RBP: ffff8ae6cb742580 R08: 0000000000023003 R09:
>>>>>> ffff8ae6cb7426c8
>>>>>> 2424 [ 1317.507057] R10: ffffa5fa4c7d7da0 R11: fefefefefefefeff R12:
>>>>>> 0000000000000801
>>>>>> 2425 [ 1317.516650] R13: 0000000000000000 R14: 0000000000000000 R15:
>>>>>> ffff8ac800bd1800
>>>>>> 2426 [ 1317.526253] FS:=C2=A0 0000000000000000(0000) GS:ffff8b077fac=
0000(0000)
>>>>>> knlGS:0000000000000000
>>>>>> 2427 [ 1317.536918] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
>>>>>> 2428 [ 1317.544952] CR2: 00007f39a5818004 CR3: 000000343440a006 CR4:
>>>>>> 00000000001606e0
>>>>>> 2429 [ 1317.554554] Call Trace:
>>>>>> 2430 [ 1317.558921]=C2=A0 sd_init_command+0x2ee/0xaf0 [sd_mod]
>>>>>> 2431 [ 1317.565800]=C2=A0 scsi_queue_rq+0x559/0xa80
>>>>>> 2432 [ 1317.571607]=C2=A0 blk_mq_dispatch_rq_list+0x3da/0x5b0
>>>>>> 2433 [ 1317.578375]=C2=A0 ? syscall_return_via_sysret+0x10/0x7f
>>>>>> 2434 [ 1317.585339]=C2=A0 ? __switch_to_asm+0x40/0x70
>>>>>> 2435 [ 1317.591321]=C2=A0 ? elv_rb_del+0x1f/0x30
>>>>>> 2436 [ 1317.596807]=C2=A0 ? deadline_remove_request+0x55/0xc0
>>>>>> 2437 [ 1317.603560]=C2=A0 blk_mq_do_dispatch_sched+0x76/0x120
>>>>>> 2438 [ 1317.610302]=C2=A0 blk_mq_sched_dispatch_requests+0x100/0x170
>>>>>> 2439 [ 1317.617733]=C2=A0 __blk_mq_run_hw_queue+0x60/0x130
>>>>>> 2440 [ 1317.624200]=C2=A0 process_one_work+0x19c/0x3c0
>>>>>> 2441 [ 1317.630258]=C2=A0 worker_thread+0x3c/0x3b0
>>>>>> 2442 [ 1317.635937]=C2=A0 ? process_one_work+0x3c0/0x3c0
>>>>>> 2443 [ 1317.642183]=C2=A0 kthread+0x11e/0x140
>>>>>> 2444 [ 1317.647346]=C2=A0 ? kthread_park+0x90/0x90
>>>>>> 2445 [ 1317.652986]=C2=A0 ret_from_fork+0x35/0x40
>>>>>> 2446 [ 1317.658523] ---[ end trace 61026ff97261da6a ]---
>>>>>> 2447 [ 1317.665327] scsi_dump_rq: rq 6(f:801/23003, seg: 0)
>>>>>> 2448 [ 1317.671601] bio 0: d602/801 0 1024971192 0
>>>>>> 2449 [ 1317.676991] print_req_error: I/O error, dev sdb, sector 1024=
971192
>>>>>> flags 801
>>>>>> 2450 [ 1317.685722] scsi_dump_rq: rq 8(f:801/23003, seg: 0)
>>>>>> 2451 [ 1317.691994] bio 0: d602/801 0 1033359800 0
>>>>> The above line shows the bio is zero-size, and this bio is submitted
>>>>> from bio, since the bio->bi_flags indicates that BIO_CLONED isn't set.
>>>>>
>>>>> Please apply the following debug patch, and we may see where is wrong.
>>>>>
>>>>> diff --git a/block/blk-core.c b/block/blk-core.c
>>>>> index 8340f69670d8..86bb61b0df83 100644
>>>>> --- a/block/blk-core.c
>>>>> +++ b/block/blk-core.c
>>>>> @@ -1125,6 +1125,7 @@ blk_qc_t submit_bio(struct bio *bio)
>>>>>     				bio_devname(bio, b), count);
>>>>>     		}
>>>>>     	}
>>>>> +	WARN_ON(bio->bi_iter.bi_size =3D=3D 0 && bio_op(bio) =3D=3D REQ_OP_=
WRITE);
>>>>>     	return generic_make_request(bio);
>>>> Sorry for delay,
>>>>
>>>> ------
>>>>
>>>> [=C2=A0 116.619136] 2019-06-29 16:12:41 mkdir -p /fs/sdb1
>>>> [=C2=A0 116.619138]
>>>> [=C2=A0 116.628743] 2019-06-29 16:12:41 mount -t xfs -o inode64 /dev/s=
db1
>>>> /fs/sdb1
>>>> [=C2=A0 116.628745]
>>>> [=C2=A0 116.634699] SGI XFS with ACLs, security attributes, realtime, =
scrub,
>>>> debug enabled
>>>> [=C2=A0 116.653110] XFS (sdb1): Mounting V5 Filesystem
>>>> [=C2=A0 116.670081] XFS (sdb1): Ending clean mount
>>>> [=C2=A0 690.106779] WARNING: CPU: 53 PID: 1477 at block/blk-core.c:1128
>>>> submit_bio+0x93/0x150
>>>> [=C2=A0 690.117972] Modules linked in: xfs dm_mod btrfs xor zstd_decom=
press
>>>> zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
>>>> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass
>>>> mgag200 crct10dif_pclmul crc32_pclmul ttm crc32c_intel snd_pcm
>>>> ghash_clmulni_intel drm_kms_helper snd_timer ahci syscopyarea sysfillr=
ect
>>>> snd aesni_intel sysimgblt libahci ipmi_si soundcore fb_sys_fops mei_me
>>>> crypto_simd ipmi_devintf ioatdma cryptd pcspkr drm ipmi_msghandler
>>>> glue_helper libata mei joydev lpc_ich i2c_i801 dca wmi acpi_power_meter
>>>> acpi_pad pcc_cpufreq ip_tables
>>>> [=C2=A0 690.176967] CPU: 53 PID: 1477 Comm: fio Tainted: G=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W I
>>>> 5.2.0-rc5-00002-g9fa09bd #1
>>>> [=C2=A0 690.187198] Hardware name: Intel Corporation S2600WTT/S2600WTT=
, BIOS
>>>> SE5C610.86B.01.01.0008.021120151325 02/11/2015
>>>> [=C2=A0 690.199375] RIP: 0010:submit_bio+0x93/0x150
>>>> [=C2=A0 690.204583] Code: ee 74 45 83 e1 01 74 26 65 48 01 35 bf 39 3f=
 45 8b 0d
>>>> ad 96 c4 01 85 c9 75 56 8b 43 28 85 c0 75 b3 0f b6 53 10 83 fa 01 75 a=
a <0f>
>>>> 0b eb a6 65 48 8b 14 25 c0 6b 01 00 65 48 01 35 88 39 3f 45 48
>>>> [=C2=A0 690.226668] RSP: 0018:ffffb2d90efc3b40 EFLAGS: 00010246
>>>> [=C2=A0 690.233072] RAX: 0000000000000000 RBX: ffff9654c6ad9f40 RCX:
>>>> 0000000000000801
>>>> [=C2=A0 690.241617] RDX: 0000000000000001 RSI: ffff9654c6ad9f00 RDI:
>>>> ffff9654c6ad9f40
>>>> [=C2=A0 690.250146] RBP: 0000000000000000 R08: 0000000000000002 R09:
>>>> 0000000000000000
>>>> [=C2=A0 690.258667] R10: 00000000000303a0 R11: ffff96757ffd4000 R12:
>>>> ffffb2d90efc3e08
>>>> [=C2=A0 690.267183] R13: ffff9654c6ad9f00 R14: ffffb2d90efc3e08 R15:
>>>> 0000000000000000
>>>> [=C2=A0 690.275696] FS:=C2=A0 00007fa8e005da80(0000) GS:ffff9654ffac00=
00(0000)
>>>> knlGS:0000000000000000
>>>> [=C2=A0 690.285282] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
>>>> [=C2=A0 690.292252] CR2: 00007fa8cc05b3c0 CR3: 0000001fc8518001 CR4:
>>>> 00000000001606e0
>>>> [=C2=A0 690.300770] Call Trace:
>>>> [=C2=A0 690.304123]=C2=A0 xfs_submit_ioend+0x84/0x1e0 [xfs]
>>>> [=C2=A0 690.309668]=C2=A0 xfs_do_writepage+0x246/0x5a0 [xfs]
>>>> [=C2=A0 690.315279]=C2=A0 write_cache_pages+0x16b/0x440
>>>> [=C2=A0 690.320420]=C2=A0 ? xfs_vm_releasepage+0x80/0x80 [xfs]
>>>> [=C2=A0 690.326238]=C2=A0 xfs_vm_writepages+0x6b/0xa0 [xfs]
>>>> [=C2=A0 690.331742]=C2=A0 do_writepages+0x4b/0xf0
>>>> [=C2=A0 690.336275]=C2=A0 ? iomap_file_buffered_write+0x62/0x90
>>>> [=C2=A0 690.342162]=C2=A0 ? iomap_write_end+0x240/0x240
>>>> [=C2=A0 690.347295]=C2=A0 ? xfs_iunlock+0x165/0x220 [xfs]
>>>> [=C2=A0 690.352595]=C2=A0 ? __filemap_fdatawrite_range+0xc1/0x100
>>>> [=C2=A0 690.358673]=C2=A0 __filemap_fdatawrite_range+0xc1/0x100
>>>> [=C2=A0 690.364571]=C2=A0 ? __switch_to_asm+0x34/0x70
>>>> [=C2=A0 690.369484]=C2=A0 file_write_and_wait_range+0x4c/0xa0
>>>> [=C2=A0 690.375198]=C2=A0 xfs_file_fsync+0x5d/0x230 [xfs]
>>>> [=C2=A0 690.380499]=C2=A0 do_fsync+0x38/0x60
>>>> [=C2=A0 690.384534]=C2=A0 __x64_sys_fsync+0x10/0x20
>>>> [=C2=A0 690.389243]=C2=A0 do_syscall_64+0x5b/0x1e0
>>>> [=C2=A0 690.393857]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>> [=C2=A0 690.400020] RIP: 0033:0x7fa8cbe4f70d
>>>> [=C2=A0 690.404533] Code: bc 20 00 00 75 10 b8 4a 00 00 00 0f 05 48 3d=
 01 f0 ff
>>>> ff 73 31 c3 48 83 ec 08 e8 6e f7 ff ff 48 89 04 24 b8 4a 00 00 00 0f 0=
5 <48>
>>>> 8b 3c 24 48 89 c2 e8 b7 f7 ff ff 48 89 d0 48 83 c4 08 48 3d 01
>>>> [=C2=A0 690.426581] RSP: 002b:00007ffed6954160 EFLAGS: 00000293 ORIG_R=
AX:
>>>> 000000000000004a
>>>> [=C2=A0 690.435583] RAX: ffffffffffffffda RBX: 00005573363790f0 RCX:
>>>> 00007fa8cbe4f70d
>>>> [=C2=A0 690.444102] RDX: 0000000000200000 RSI: 00005573363790f0 RDI:
>>>> 0000000000000003
>>>> [=C2=A0 690.452615] RBP: 00007fa8b337f418 R08: 0000000000000008 R09:
>>>> 0000000000000001
>>>> [=C2=A0 690.461124] R10: 00000000897b0000 R11: 0000000000000293 R12:
>>>> 0000000000000000
>>>> [=C2=A0 690.469631] R13: 0000001000000000 R14: 00007fa8c81dda50 R15:
>>>> 0000000000000000
>>>> [=C2=A0 690.478130] ---[ end trace 90dd4ee6d5cdfcb8 ]---
>>> I have just checked xfs code, and looks the only reason is that bio size
>>> is overflowed, that means the whole bio may reach 4GB. That might be
>>> possible in case of writeback. But I have to double check if that is
>>> the case, could you test the following patch and provide the log?
>>>
>>> diff --git a/block/blk-core.c b/block/blk-core.c
>>> index 8340f69670d8..9d61e408c608 100644
>>> --- a/block/blk-core.c
>>> +++ b/block/blk-core.c
>>> @@ -1125,6 +1125,19 @@ blk_qc_t submit_bio(struct bio *bio)
>>>    				bio_devname(bio, b), count);
>>>    		}
>>>    	}
>>> +	if (WARN_ON(bio->bi_iter.bi_size =3D=3D 0 && bio_op(bio) =3D=3D REQ_O=
P_WRITE)) {
>>> +		int i;
>>> +		printk("bio: %hx/%hx %u %llu %u\n", bio->bi_flags, bio->bi_opf,
>>> +                       bio->bi_vcnt,
>>> +                       (unsigned long long)bio->bi_iter.bi_sector,
>>> +                       bio->bi_iter.bi_size);
>>> +		for (i =3D 0; i < bio->bi_vcnt; i++) {
>>> +			struct bio_vec *bvec =3D &bio->bi_io_vec[i];
>>> +			printk("%d: pfn %lu offset %u len %u\n", i++,
>>> +                               (unsigned long)page_to_pfn(bvec->bv_pag=
e),
>>> +                               bvec->bv_offset, bvec->bv_len);
>>> +		}
>>> +	}
>>>    	return generic_make_request(bio);
>>>    }
>> the newest log and i also see you fix patch,=C2=A0 i will test your fix =
patch
>> more times to check it.
>>
>> ------
>>
>> [=C2=A0=C2=A0 54.656016] 2019-07-01 11:48:52 mkfs -t xfs /dev/sdb1
>> [=C2=A0=C2=A0 54.656017]
>> [=C2=A0 119.228467] WARNING: CPU: 5 PID: 1530 at block/blk-core.c:1128
>> submit_bio+0xa5/0x1d0
>> [=C2=A0 119.240810] Modules linked in: dm_mod btrfs xor zstd_decompress
>> zstd_compress raid6_pq libcrc32c sd_mod intel_rapl sg sb_edac
>> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass
>> mgag200 crct10dif_pclmul snd_pcm crc32_pclmul ttm crc32c_intel snd_timer
>> drm_kms_helper ghash_clmulni_intel snd syscopyarea ipmi_si sysfillrect
>> soundcore aesni_intel sysimgblt ipmi_devintf crypto_simd fb_sys_fops ahci
>> mei_me libahci cryptd ipmi_msghandler pcspkr glue_helper drm mei libata
>> joydev ioatdma lpc_ich i2c_i801 dca wmi acpi_power_meter acpi_pad
>> pcc_cpufreq ip_tables
>> [=C2=A0 119.306252] CPU: 5 PID: 1530 Comm: mkfs.xfs Tainted: G=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W I
>> 5.2.0-rc5-00001-g82f8097 #1
>> [=C2=A0 119.318274] Hardware name: Intel Corporation S2600WTT/S2600WTT, =
BIOS
>> SE5C610.86B.01.01.0008.021120151325 02/11/2015
>> [=C2=A0 119.331852] RIP: 0010:submit_bio+0xa5/0x1d0
>> [=C2=A0 119.338422] Code: 00 00 65 48 01 35 b3 39 5f 76 8b 0d a1 96 c4 0=
1 85 c9
>> 0f 85 9b 00 00 00 8b 43 28 85 c0 75 a5 8b 53 10 0f b6 ca 83 f9 01 75 9a =
<0f>
>> 0b 0f b7 4b 68 0f b7 73 14 45 31 c9 4c 8b 43 20 48 c7 c7 f1 99
>> [=C2=A0 119.363296] RSP: 0018:ffff940c4fb17e58 EFLAGS: 00010246
>> [=C2=A0 119.371107] RAX: 0000000000000000 RBX: ffff88a53e3d6900 RCX:
>> 0000000000000001
>> [=C2=A0 119.381068] RDX: 0000000000040801 RSI: ffff88868138c000 RDI:
>> ffff88a53e3d6900
>> [=C2=A0 119.391041] RBP: ffff88a5448b0000 R08: ffff88a53e3d6900 R09:
>> 0000000000000000
>> [=C2=A0 119.401003] R10: 0000000000000000 R11: 0000000000000000 R12:
>> 0000000000000000
>> [=C2=A0 119.410967] R13: 0000000000000000 R14: 0000000000000000 R15:
>> 0000000000000000
>> [=C2=A0 119.420881] FS:=C2=A0 00007f37eba81780(0000) GS:ffff88a57f340000=
(0000)
>> knlGS:0000000000000000
>> [=C2=A0 119.431839] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> [=C2=A0 119.440161] CR2: 00005630eb09d000 CR3: 0000001fc711c002 CR4:
>> 00000000001606e0
>> [=C2=A0 119.450017] Call Trace:
>> [=C2=A0 119.454595]=C2=A0 submit_bio_wait+0x53/0x80
>> [=C2=A0 119.460636]=C2=A0 blkdev_issue_flush+0x81/0xb0
>> [=C2=A0 119.466930]=C2=A0 blkdev_fsync+0x2f/0x40
>> [=C2=A0 119.472590]=C2=A0 do_fsync+0x38/0x60
>> [=C2=A0 119.477810]=C2=A0 __x64_sys_fsync+0x10/0x20
>> [=C2=A0 119.483722]=C2=A0 do_syscall_64+0x5b/0x1e0
>> [=C2=A0 119.489516]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> [=C2=A0 119.496857] RIP: 0033:0x7f37eb2146f0
>> [=C2=A0 119.502502] Code: 48 3d 01 f0 ff ff 73 01 c3 48 8b 0d b2 78 20 0=
0 f7 d8
>> 64 89 01 48 83 c8 ff c3 83 3d d9 bc 20 00 00 75 10 b8 4a 00 00 00 0f 05 =
<48>
>> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 6e f7 ff ff 48 89 04 24
>> [=C2=A0 119.526842] RSP: 002b:00007fffb27f4878 EFLAGS: 00000246 ORIG_RAX:
>> 000000000000004a
>> [=C2=A0 119.536975] RAX: ffffffffffffffda RBX: 0000000000000811 RCX:
>> 00007f37eb2146f0
>> [=C2=A0 119.546592] RDX: 00005630e91ba8e0 RSI: 0000000000000000 RDI:
>> 0000000000000004
>> [=C2=A0 119.556171] RBP: 0000000000000004 R08: 00005630eb02b8a0 R09:
>> 00007fffb27f4e00
>> [=C2=A0 119.565753] R10: 000000000000009b R11: 0000000000000246 R12:
>> 00007fffb27f4c60
>> [=C2=A0 119.575339] R13: 00007fffb27f4a30 R14: 00005630eb048800 R15:
>> 00005630eb05a800
>> [=C2=A0 119.584940] ---[ end trace 46a2e1214c930529 ]---
>> [=C2=A0 119.591765] bio: 0/801 0 0 0
>>
> Hi Yiding,
>
> The above warning is false positive, and it is flush request, and
> it isn't same with your original report in which the following warning
> is triggered.
>
> 	"drivers/scsi/scsi_lib.c:1034 scsi_init_io+0x11a/0x2e0"
>
> So please run the test kernel with the debug patch I sent to you today
> and try to trigger the warning in scsi_init_io().


------

[=C2=A0 728.863669] 230: pfn 66784668 offset 0 len 17031168
[=C2=A0 728.869319] 232: pfn 66788826 offset 0 len 22708224
[=C2=A0 728.874946] 234: pfn 66794370 offset 0 len 29933568
[=C2=A0 728.880563] 236: pfn 66801678 offset 0 len 4136960
[=C2=A0 728.886086] 238: pfn 66820096 offset 0 len 2506752
[=C2=A0 729.336992] WARNING: CPU: 40 PID: 1312 at =

drivers/scsi/scsi_lib.c:1010 scsi_init_io+0x103/0x170
[=C2=A0 729.349150] Modules linked in: xfs dm_mod btrfs xor zstd_decompress =

zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac =

x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass =

crct10dif_pclmul mgag200 crc32_pclmul ttm crc32c_intel =

ghash_clmulni_intel drm_kms_helper snd_pcm syscopyarea sysfillrect =

sysimgblt aesni_intel snd_timer ahci crypto_simd ipmi_si fb_sys_fops =

mei_me libahci snd ipmi_devintf cryptd soundcore glue_helper =

ipmi_msghandler pcspkr drm ioatdma mei libata joydev lpc_ich i2c_i801 =

dca wmi acpi_pad acpi_power_meter pcc_cpufreq ip_tables
[=C2=A0 729.409451] CPU: 40 PID: 1312 Comm: kworker/40:1H Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W =

I=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.2.0-rc5-00001-g82f8097 #1
[=C2=A0 729.421013] Hardware name: Intel Corporation S2600WTT/S2600WTT, BIO=
S =

SE5C610.86B.01.01.0008.021120151325 02/11/2015
[=C2=A0 729.433604] Workqueue: kblockd blk_mq_run_work_fn
[=C2=A0 729.439805] RIP: 0010:scsi_init_io+0x103/0x170
[=C2=A0 729.445726] Code: 5c 41 5d c3 be 01 00 00 00 e9 49 ff ff ff 8b 45 7=
0 =

89 83 08 01 00 00 f6 45 1a 01 75 92 31 c0 48 83 c4 08 5b 5d 41 5c 41 5d =

c3 <0f> 0b 48 83 c4 08 b8 0a 00 00 00 5b 5d 41 5c 41 5d c3 48 8b 75 38
[=C2=A0 729.468787] RSP: 0018:ffffac02cea47c78 EFLAGS: 00010246
[=C2=A0 729.475705] RAX: 000000001eafb2a8 RBX: ffff95df3e7a3950 RCX: =

0000000000000000
[=C2=A0 729.484790] RDX: 0000000000000000 RSI: 0000000000000000 RDI: =

ffff95df3e7a3950
[=C2=A0 729.493889] RBP: ffff95df3e7a3840 R08: 0000000000000000 R09: =

ffff95df3e7a3988
[=C2=A0 729.502995] R10: ffffac02cc71fda0 R11: fefefefefefefeff R12: =

0000000000000801
[=C2=A0 729.512123] R13: 0000000000000000 R14: 0000000000000000 R15: =

ffff95df3ba8e800
[=C2=A0 729.521261] FS:=C2=A0 0000000000000000(0000) GS:ffff95df7f780000(00=
00) =

knlGS:0000000000000000
[=C2=A0 729.531505] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[=C2=A0 729.539140] CR2: 00007f7465922814 CR3: 0000000a80c0a006 CR4: =

00000000001606e0
[=C2=A0 729.548359] Call Trace:
[=C2=A0 729.552355]=C2=A0 sd_init_command+0x2ee/0xaf0 [sd_mod]
[=C2=A0 729.558882]=C2=A0 scsi_queue_rq+0x559/0xa80
[=C2=A0 729.564354]=C2=A0 blk_mq_dispatch_rq_list+0x3da/0x5b0
[=C2=A0 729.570820]=C2=A0 ? syscall_return_via_sysret+0x10/0x7f
[=C2=A0 729.577488]=C2=A0 ? __switch_to_asm+0x40/0x70
[=C2=A0 729.583192]=C2=A0 ? elv_rb_del+0x1f/0x30
[=C2=A0 729.588417]=C2=A0 ? deadline_remove_request+0x55/0xc0
[=C2=A0 729.594915]=C2=A0 blk_mq_do_dispatch_sched+0x76/0x120
[=C2=A0 729.601424]=C2=A0 blk_mq_sched_dispatch_requests+0x100/0x170
[=C2=A0 729.608626]=C2=A0 __blk_mq_run_hw_queue+0x60/0x130
[=C2=A0 729.614873]=C2=A0 process_one_work+0x19c/0x3c0
[=C2=A0 729.620734]=C2=A0 worker_thread+0x3c/0x3b0
[=C2=A0 729.626210]=C2=A0 ? process_one_work+0x3c0/0x3c0
[=C2=A0 729.632280]=C2=A0 kthread+0x11e/0x140
[=C2=A0 729.637281]=C2=A0 ? kthread_park+0x90/0x90
[=C2=A0 729.642773]=C2=A0 ret_from_fork+0x35/0x40
[=C2=A0 729.648172] ---[ end trace 929c66c4a933d3e4 ]---
[=C2=A0 729.654870] print_req_error: I/O error, dev sdb, sector 514831016 =

flags 801

------


>
>
> Thanks,
> Ming
>
>



--===============4422314292777792422==
Content-Type: application/x-xz
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

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
--===============4422314292777792422==--

