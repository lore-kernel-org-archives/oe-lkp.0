Content-Type: multipart/mixed; boundary="===============3796965392850138640=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: 07173c3ec2: stderr.fio:pid=#, err=#/file:filesetup.c:#, func=fsync, error=Input/output_error
Date: Mon, 01 Jul 2019 14:44:05 +0800
Message-ID: <20190701064403.GB16809@ming.t460p>
In-Reply-To: <b7513f3a-052d-b71e-68ed-4703caf2185f@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3796965392850138640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2019 at 12:49:51PM +0800, Liu Yiding wrote:
> =

> =E5=9C=A8 2019/7/1 =E4=B8=8A=E5=8D=8810:47, Ming Lei =E5=86=99=E9=81=93:
> > [snip]
> > > > > =

> > > > > ------
> > > > > =

> > > > > 2412 [=C2=A0 112.558155] XFS (sdb1): Ending clean mount
> > > > > 2413 [ 1317.330820] WARNING: CPU: 63 PID: 1495 at
> > > > > drivers/scsi/scsi_lib.c:1034 scsi_init_io+0x11a/0x2e0
> > > > > 2414 [ 1317.344000] Modules linked in: xfs dm_mod btrfs xor zstd_=
decompress
> > > > > zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
> > > > > x86_pkg_temp_thermal intel_powerclamp coretemp kvm_i=C2=A0=C2=A0=
=C2=A0=C2=A0 ntel kvm irqbypass
> > > > > crct10dif_pclmul crc32_pclmul crc32c_intel mgag200 snd_pcm
> > > > > ghash_clmulni_intel ttm snd_timer drm_kms_helper ipmi_si ahci snd
> > > > > aesni_intel syscopyarea libahci ipmi_devi=C2=A0=C2=A0=C2=A0=C2=A0=
 ntf sysfillrect sysimgblt
> > > > > crypto_simd mei_me fb_sys_fops soundcore ioatdma cryptd ipmi_msgh=
andler
> > > > > glue_helper pcspkr drm libata mei joydev lpc_ich i2c_i801 dca wmi
> > > > > acpi_power_meter acpi=C2=A0=C2=A0=C2=A0=C2=A0 _pad pcc_cpufreq ip=
_tables
> > > > > 2415 [ 1317.408135] CPU: 63 PID: 1495 Comm: kworker/63:1H Tainted:
> > > > > G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.2.0-rc5-00001-gc2d55e2 #1
> > > > > 2416 [ 1317.420350] Hardware name: Intel Corporation S2600WTT/S26=
00WTT, BIOS
> > > > > SE5C610.86B.01.01.0008.021120151325 02/11/2015
> > > > > 2417 [ 1317.433545] Workqueue: kblockd blk_mq_run_work_fn
> > > > > 2418 [ 1317.440295] RIP: 0010:scsi_init_io+0x11a/0x2e0
> > > > > 2419 [ 1317.446746] Code: be 01 00 00 00 e9 44 ff ff ff 8b 45 70 =
89 83 08 01
> > > > > 00 00 f6 45 1a 01 75 8a 31 c0 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e=
 41 5f c3
> > > > > <0f> 0b 8b 4d 18 8b 55 28 45 31 c9 48=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 c7 c6 98 da 69 82 48 c7 c7 f0
> > > > > 2420 [ 1317.470863] RSP: 0018:ffffa5fa4f7e7c68 EFLAGS: 00010246
> > > > > 2421 [ 1317.478294] RAX: 000000003d17d1b8 RBX: ffff8ae6cb742690 R=
CX:
> > > > > 0000000000000000
> > > > > 2422 [ 1317.487878] RDX: 0000000000000000 RSI: 0000000000000000 R=
DI:
> > > > > ffff8ae6cb742690
> > > > > 2423 [ 1317.497469] RBP: ffff8ae6cb742580 R08: 0000000000023003 R=
09:
> > > > > ffff8ae6cb7426c8
> > > > > 2424 [ 1317.507057] R10: ffffa5fa4c7d7da0 R11: fefefefefefefeff R=
12:
> > > > > 0000000000000801
> > > > > 2425 [ 1317.516650] R13: 0000000000000000 R14: 0000000000000000 R=
15:
> > > > > ffff8ac800bd1800
> > > > > 2426 [ 1317.526253] FS:=C2=A0 0000000000000000(0000) GS:ffff8b077=
fac0000(0000)
> > > > > knlGS:0000000000000000
> > > > > 2427 [ 1317.536918] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
> > > > > 2428 [ 1317.544952] CR2: 00007f39a5818004 CR3: 000000343440a006 C=
R4:
> > > > > 00000000001606e0
> > > > > 2429 [ 1317.554554] Call Trace:
> > > > > 2430 [ 1317.558921]=C2=A0 sd_init_command+0x2ee/0xaf0 [sd_mod]
> > > > > 2431 [ 1317.565800]=C2=A0 scsi_queue_rq+0x559/0xa80
> > > > > 2432 [ 1317.571607]=C2=A0 blk_mq_dispatch_rq_list+0x3da/0x5b0
> > > > > 2433 [ 1317.578375]=C2=A0 ? syscall_return_via_sysret+0x10/0x7f
> > > > > 2434 [ 1317.585339]=C2=A0 ? __switch_to_asm+0x40/0x70
> > > > > 2435 [ 1317.591321]=C2=A0 ? elv_rb_del+0x1f/0x30
> > > > > 2436 [ 1317.596807]=C2=A0 ? deadline_remove_request+0x55/0xc0
> > > > > 2437 [ 1317.603560]=C2=A0 blk_mq_do_dispatch_sched+0x76/0x120
> > > > > 2438 [ 1317.610302]=C2=A0 blk_mq_sched_dispatch_requests+0x100/0x=
170
> > > > > 2439 [ 1317.617733]=C2=A0 __blk_mq_run_hw_queue+0x60/0x130
> > > > > 2440 [ 1317.624200]=C2=A0 process_one_work+0x19c/0x3c0
> > > > > 2441 [ 1317.630258]=C2=A0 worker_thread+0x3c/0x3b0
> > > > > 2442 [ 1317.635937]=C2=A0 ? process_one_work+0x3c0/0x3c0
> > > > > 2443 [ 1317.642183]=C2=A0 kthread+0x11e/0x140
> > > > > 2444 [ 1317.647346]=C2=A0 ? kthread_park+0x90/0x90
> > > > > 2445 [ 1317.652986]=C2=A0 ret_from_fork+0x35/0x40
> > > > > 2446 [ 1317.658523] ---[ end trace 61026ff97261da6a ]---
> > > > > 2447 [ 1317.665327] scsi_dump_rq: rq 6(f:801/23003, seg: 0)
> > > > > 2448 [ 1317.671601] bio 0: d602/801 0 1024971192 0
> > > > > 2449 [ 1317.676991] print_req_error: I/O error, dev sdb, sector 1=
024971192
> > > > > flags 801
> > > > > 2450 [ 1317.685722] scsi_dump_rq: rq 8(f:801/23003, seg: 0)
> > > > > 2451 [ 1317.691994] bio 0: d602/801 0 1033359800 0
> > > > The above line shows the bio is zero-size, and this bio is submitted
> > > > from bio, since the bio->bi_flags indicates that BIO_CLONED isn't s=
et.
> > > > =

> > > > Please apply the following debug patch, and we may see where is wro=
ng.
> > > > =

> > > > diff --git a/block/blk-core.c b/block/blk-core.c
> > > > index 8340f69670d8..86bb61b0df83 100644
> > > > --- a/block/blk-core.c
> > > > +++ b/block/blk-core.c
> > > > @@ -1125,6 +1125,7 @@ blk_qc_t submit_bio(struct bio *bio)
> > > >    				bio_devname(bio, b), count);
> > > >    		}
> > > >    	}
> > > > +	WARN_ON(bio->bi_iter.bi_size =3D=3D 0 && bio_op(bio) =3D=3D REQ_O=
P_WRITE);
> > > >    	return generic_make_request(bio);
> > > =

> > > Sorry for delay,
> > > =

> > > ------
> > > =

> > > [=C2=A0 116.619136] 2019-06-29 16:12:41 mkdir -p /fs/sdb1
> > > [=C2=A0 116.619138]
> > > [=C2=A0 116.628743] 2019-06-29 16:12:41 mount -t xfs -o inode64 /dev/=
sdb1
> > > /fs/sdb1
> > > [=C2=A0 116.628745]
> > > [=C2=A0 116.634699] SGI XFS with ACLs, security attributes, realtime,=
 scrub,
> > > debug enabled
> > > [=C2=A0 116.653110] XFS (sdb1): Mounting V5 Filesystem
> > > [=C2=A0 116.670081] XFS (sdb1): Ending clean mount
> > > [=C2=A0 690.106779] WARNING: CPU: 53 PID: 1477 at block/blk-core.c:11=
28
> > > submit_bio+0x93/0x150
> > > [=C2=A0 690.117972] Modules linked in: xfs dm_mod btrfs xor zstd_deco=
mpress
> > > zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
> > > x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass
> > > mgag200 crct10dif_pclmul crc32_pclmul ttm crc32c_intel snd_pcm
> > > ghash_clmulni_intel drm_kms_helper snd_timer ahci syscopyarea sysfill=
rect
> > > snd aesni_intel sysimgblt libahci ipmi_si soundcore fb_sys_fops mei_me
> > > crypto_simd ipmi_devintf ioatdma cryptd pcspkr drm ipmi_msghandler
> > > glue_helper libata mei joydev lpc_ich i2c_i801 dca wmi acpi_power_met=
er
> > > acpi_pad pcc_cpufreq ip_tables
> > > [=C2=A0 690.176967] CPU: 53 PID: 1477 Comm: fio Tainted: G=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W I
> > > 5.2.0-rc5-00002-g9fa09bd #1
> > > [=C2=A0 690.187198] Hardware name: Intel Corporation S2600WTT/S2600WT=
T, BIOS
> > > SE5C610.86B.01.01.0008.021120151325 02/11/2015
> > > [=C2=A0 690.199375] RIP: 0010:submit_bio+0x93/0x150
> > > [=C2=A0 690.204583] Code: ee 74 45 83 e1 01 74 26 65 48 01 35 bf 39 3=
f 45 8b 0d
> > > ad 96 c4 01 85 c9 75 56 8b 43 28 85 c0 75 b3 0f b6 53 10 83 fa 01 75 =
aa <0f>
> > > 0b eb a6 65 48 8b 14 25 c0 6b 01 00 65 48 01 35 88 39 3f 45 48
> > > [=C2=A0 690.226668] RSP: 0018:ffffb2d90efc3b40 EFLAGS: 00010246
> > > [=C2=A0 690.233072] RAX: 0000000000000000 RBX: ffff9654c6ad9f40 RCX:
> > > 0000000000000801
> > > [=C2=A0 690.241617] RDX: 0000000000000001 RSI: ffff9654c6ad9f00 RDI:
> > > ffff9654c6ad9f40
> > > [=C2=A0 690.250146] RBP: 0000000000000000 R08: 0000000000000002 R09:
> > > 0000000000000000
> > > [=C2=A0 690.258667] R10: 00000000000303a0 R11: ffff96757ffd4000 R12:
> > > ffffb2d90efc3e08
> > > [=C2=A0 690.267183] R13: ffff9654c6ad9f00 R14: ffffb2d90efc3e08 R15:
> > > 0000000000000000
> > > [=C2=A0 690.275696] FS:=C2=A0 00007fa8e005da80(0000) GS:ffff9654ffac0=
000(0000)
> > > knlGS:0000000000000000
> > > [=C2=A0 690.285282] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
> > > [=C2=A0 690.292252] CR2: 00007fa8cc05b3c0 CR3: 0000001fc8518001 CR4:
> > > 00000000001606e0
> > > [=C2=A0 690.300770] Call Trace:
> > > [=C2=A0 690.304123]=C2=A0 xfs_submit_ioend+0x84/0x1e0 [xfs]
> > > [=C2=A0 690.309668]=C2=A0 xfs_do_writepage+0x246/0x5a0 [xfs]
> > > [=C2=A0 690.315279]=C2=A0 write_cache_pages+0x16b/0x440
> > > [=C2=A0 690.320420]=C2=A0 ? xfs_vm_releasepage+0x80/0x80 [xfs]
> > > [=C2=A0 690.326238]=C2=A0 xfs_vm_writepages+0x6b/0xa0 [xfs]
> > > [=C2=A0 690.331742]=C2=A0 do_writepages+0x4b/0xf0
> > > [=C2=A0 690.336275]=C2=A0 ? iomap_file_buffered_write+0x62/0x90
> > > [=C2=A0 690.342162]=C2=A0 ? iomap_write_end+0x240/0x240
> > > [=C2=A0 690.347295]=C2=A0 ? xfs_iunlock+0x165/0x220 [xfs]
> > > [=C2=A0 690.352595]=C2=A0 ? __filemap_fdatawrite_range+0xc1/0x100
> > > [=C2=A0 690.358673]=C2=A0 __filemap_fdatawrite_range+0xc1/0x100
> > > [=C2=A0 690.364571]=C2=A0 ? __switch_to_asm+0x34/0x70
> > > [=C2=A0 690.369484]=C2=A0 file_write_and_wait_range+0x4c/0xa0
> > > [=C2=A0 690.375198]=C2=A0 xfs_file_fsync+0x5d/0x230 [xfs]
> > > [=C2=A0 690.380499]=C2=A0 do_fsync+0x38/0x60
> > > [=C2=A0 690.384534]=C2=A0 __x64_sys_fsync+0x10/0x20
> > > [=C2=A0 690.389243]=C2=A0 do_syscall_64+0x5b/0x1e0
> > > [=C2=A0 690.393857]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > > [=C2=A0 690.400020] RIP: 0033:0x7fa8cbe4f70d
> > > [=C2=A0 690.404533] Code: bc 20 00 00 75 10 b8 4a 00 00 00 0f 05 48 3=
d 01 f0 ff
> > > ff 73 31 c3 48 83 ec 08 e8 6e f7 ff ff 48 89 04 24 b8 4a 00 00 00 0f =
05 <48>
> > > 8b 3c 24 48 89 c2 e8 b7 f7 ff ff 48 89 d0 48 83 c4 08 48 3d 01
> > > [=C2=A0 690.426581] RSP: 002b:00007ffed6954160 EFLAGS: 00000293 ORIG_=
RAX:
> > > 000000000000004a
> > > [=C2=A0 690.435583] RAX: ffffffffffffffda RBX: 00005573363790f0 RCX:
> > > 00007fa8cbe4f70d
> > > [=C2=A0 690.444102] RDX: 0000000000200000 RSI: 00005573363790f0 RDI:
> > > 0000000000000003
> > > [=C2=A0 690.452615] RBP: 00007fa8b337f418 R08: 0000000000000008 R09:
> > > 0000000000000001
> > > [=C2=A0 690.461124] R10: 00000000897b0000 R11: 0000000000000293 R12:
> > > 0000000000000000
> > > [=C2=A0 690.469631] R13: 0000001000000000 R14: 00007fa8c81dda50 R15:
> > > 0000000000000000
> > > [=C2=A0 690.478130] ---[ end trace 90dd4ee6d5cdfcb8 ]---
> > I have just checked xfs code, and looks the only reason is that bio size
> > is overflowed, that means the whole bio may reach 4GB. That might be
> > possible in case of writeback. But I have to double check if that is
> > the case, could you test the following patch and provide the log?
> > =

> > diff --git a/block/blk-core.c b/block/blk-core.c
> > index 8340f69670d8..9d61e408c608 100644
> > --- a/block/blk-core.c
> > +++ b/block/blk-core.c
> > @@ -1125,6 +1125,19 @@ blk_qc_t submit_bio(struct bio *bio)
> >   				bio_devname(bio, b), count);
> >   		}
> >   	}
> > +	if (WARN_ON(bio->bi_iter.bi_size =3D=3D 0 && bio_op(bio) =3D=3D REQ_O=
P_WRITE)) {
> > +		int i;
> > +		printk("bio: %hx/%hx %u %llu %u\n", bio->bi_flags, bio->bi_opf,
> > +                       bio->bi_vcnt,
> > +                       (unsigned long long)bio->bi_iter.bi_sector,
> > +                       bio->bi_iter.bi_size);
> > +		for (i =3D 0; i < bio->bi_vcnt; i++) {
> > +			struct bio_vec *bvec =3D &bio->bi_io_vec[i];
> > +			printk("%d: pfn %lu offset %u len %u\n", i++,
> > +                               (unsigned long)page_to_pfn(bvec->bv_pag=
e),
> > +                               bvec->bv_offset, bvec->bv_len);
> > +		}
> > +	}
> >   	return generic_make_request(bio);
> >   }
> =

> the newest log and i also see you fix patch,=C2=A0 i will test your fix p=
atch
> more times to check it.
> =

> ------
> =

> [=C2=A0=C2=A0 54.656016] 2019-07-01 11:48:52 mkfs -t xfs /dev/sdb1
> [=C2=A0=C2=A0 54.656017]
> [=C2=A0 119.228467] WARNING: CPU: 5 PID: 1530 at block/blk-core.c:1128
> submit_bio+0xa5/0x1d0
> [=C2=A0 119.240810] Modules linked in: dm_mod btrfs xor zstd_decompress
> zstd_compress raid6_pq libcrc32c sd_mod intel_rapl sg sb_edac
> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass
> mgag200 crct10dif_pclmul snd_pcm crc32_pclmul ttm crc32c_intel snd_timer
> drm_kms_helper ghash_clmulni_intel snd syscopyarea ipmi_si sysfillrect
> soundcore aesni_intel sysimgblt ipmi_devintf crypto_simd fb_sys_fops ahci
> mei_me libahci cryptd ipmi_msghandler pcspkr glue_helper drm mei libata
> joydev ioatdma lpc_ich i2c_i801 dca wmi acpi_power_meter acpi_pad
> pcc_cpufreq ip_tables
> [=C2=A0 119.306252] CPU: 5 PID: 1530 Comm: mkfs.xfs Tainted: G=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W I=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> 5.2.0-rc5-00001-g82f8097 #1
> [=C2=A0 119.318274] Hardware name: Intel Corporation S2600WTT/S2600WTT, B=
IOS
> SE5C610.86B.01.01.0008.021120151325 02/11/2015
> [=C2=A0 119.331852] RIP: 0010:submit_bio+0xa5/0x1d0
> [=C2=A0 119.338422] Code: 00 00 65 48 01 35 b3 39 5f 76 8b 0d a1 96 c4 01=
 85 c9
> 0f 85 9b 00 00 00 8b 43 28 85 c0 75 a5 8b 53 10 0f b6 ca 83 f9 01 75 9a <=
0f>
> 0b 0f b7 4b 68 0f b7 73 14 45 31 c9 4c 8b 43 20 48 c7 c7 f1 99
> [=C2=A0 119.363296] RSP: 0018:ffff940c4fb17e58 EFLAGS: 00010246
> [=C2=A0 119.371107] RAX: 0000000000000000 RBX: ffff88a53e3d6900 RCX:
> 0000000000000001
> [=C2=A0 119.381068] RDX: 0000000000040801 RSI: ffff88868138c000 RDI:
> ffff88a53e3d6900
> [=C2=A0 119.391041] RBP: ffff88a5448b0000 R08: ffff88a53e3d6900 R09:
> 0000000000000000
> [=C2=A0 119.401003] R10: 0000000000000000 R11: 0000000000000000 R12:
> 0000000000000000
> [=C2=A0 119.410967] R13: 0000000000000000 R14: 0000000000000000 R15:
> 0000000000000000
> [=C2=A0 119.420881] FS:=C2=A0 00007f37eba81780(0000) GS:ffff88a57f340000(=
0000)
> knlGS:0000000000000000
> [=C2=A0 119.431839] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [=C2=A0 119.440161] CR2: 00005630eb09d000 CR3: 0000001fc711c002 CR4:
> 00000000001606e0
> [=C2=A0 119.450017] Call Trace:
> [=C2=A0 119.454595]=C2=A0 submit_bio_wait+0x53/0x80
> [=C2=A0 119.460636]=C2=A0 blkdev_issue_flush+0x81/0xb0
> [=C2=A0 119.466930]=C2=A0 blkdev_fsync+0x2f/0x40
> [=C2=A0 119.472590]=C2=A0 do_fsync+0x38/0x60
> [=C2=A0 119.477810]=C2=A0 __x64_sys_fsync+0x10/0x20
> [=C2=A0 119.483722]=C2=A0 do_syscall_64+0x5b/0x1e0
> [=C2=A0 119.489516]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [=C2=A0 119.496857] RIP: 0033:0x7f37eb2146f0
> [=C2=A0 119.502502] Code: 48 3d 01 f0 ff ff 73 01 c3 48 8b 0d b2 78 20 00=
 f7 d8
> 64 89 01 48 83 c8 ff c3 83 3d d9 bc 20 00 00 75 10 b8 4a 00 00 00 0f 05 <=
48>
> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 6e f7 ff ff 48 89 04 24
> [=C2=A0 119.526842] RSP: 002b:00007fffb27f4878 EFLAGS: 00000246 ORIG_RAX:
> 000000000000004a
> [=C2=A0 119.536975] RAX: ffffffffffffffda RBX: 0000000000000811 RCX:
> 00007f37eb2146f0
> [=C2=A0 119.546592] RDX: 00005630e91ba8e0 RSI: 0000000000000000 RDI:
> 0000000000000004
> [=C2=A0 119.556171] RBP: 0000000000000004 R08: 00005630eb02b8a0 R09:
> 00007fffb27f4e00
> [=C2=A0 119.565753] R10: 000000000000009b R11: 0000000000000246 R12:
> 00007fffb27f4c60
> [=C2=A0 119.575339] R13: 00007fffb27f4a30 R14: 00005630eb048800 R15:
> 00005630eb05a800
> [=C2=A0 119.584940] ---[ end trace 46a2e1214c930529 ]---
> [=C2=A0 119.591765] bio: 0/801 0 0 0
> =


Hi Yiding,

The above warning is false positive, and it is flush request, and
it isn't same with your original report in which the following warning
is triggered.

	"drivers/scsi/scsi_lib.c:1034 scsi_init_io+0x11a/0x2e0"

So please run the test kernel with the debug patch I sent to you today
and try to trigger the warning in scsi_init_io().


Thanks,
Ming

--===============3796965392850138640==--

