Content-Type: multipart/mixed; boundary="===============0217148227916794725=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: 07173c3ec2: stderr.fio:pid=#, err=#/file:filesetup.c:#, func=fsync, error=Input/output_error
Date: Mon, 01 Jul 2019 10:47:16 +0800
Message-ID: <20190701024715.GD9900@ming.t460p>
In-Reply-To: <34f9d4eb-a0b9-9f0a-e298-a31dfdfcc7fe@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0217148227916794725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yiding,

Thanks for your test & providing the log.

On Mon, Jul 01, 2019 at 08:59:06AM +0800, Liu Yiding wrote:
> =

> =E5=9C=A8 2019/6/27 =E4=B8=8A=E5=8D=8811:41, Ming Lei =E5=86=99=E9=81=93:
> > On Thu, Jun 27, 2019 at 08:59:51AM +0800, Liu Yiding wrote:
> > > Hi, Ming.
> > > =

> > > =E5=9C=A8 2019/6/26 =E4=B8=8A=E5=8D=8811:32, Ming Lei =E5=86=99=E9=81=
=93:
> > > > On Wed, Jun 26, 2019 at 10:42:52AM +0800, Liu Yiding wrote:
> > > > > sorry, something wrong with attatched file.
> > > > > =

> > > > > ------
> > > > > =

> > > > > wipefs -a --force /dev/sdb1
> > > > > mkfs -t xfs /dev/sdb1
> > > > > mkdir -p /fs/sdb1
> > > > > mount -t xfs -o inode64 /dev/sdb1 /fs/sdb1
> > > > > =

> > > > > for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
> > > > > do
> > > > >   =C2=A0=C2=A0=C2=A0 online_file=3D"$cpu_dir"/online
> > > > >   =C2=A0=C2=A0=C2=A0 [ -f "$online_file" ] && [ "$(cat "$online_f=
ile")" -eq 0 ] && continue
> > > > > =

> > > > >   =C2=A0=C2=A0=C2=A0 file=3D"$cpu_dir"/cpufreq/scaling_governor
> > > > >   =C2=A0=C2=A0=C2=A0 [ -f "$file" ] && echo "performance" > "$fil=
e"
> > > > > done
> > > > > =

> > > > > echo '[global]
> > > > > bs=3D2M
> > > > > ioengine=3Dsync
> > > > > iodepth=3D32
> > > > > size=3D68719476736
> > > > > direct=3D0
> > > > > runtime=3D300
> > > > > invalidate=3D1
> > > > > fallocate=3Dposix
> > > > > group_reporting
> > > > > =

> > > > > [task_0]
> > > > > rw=3Drandread
> > > > > directory=3D/fs/sdb1
> > > > > numjobs=3D8' | fio --output-format=3Djson -
> > > > > umount /fs/sdb1
> > > > Hi Liu Yiding,
> > > > =

> > > > Thanks for providing me the script.
> > > > =

> > > > It may take a while for me to reproduce the issue, so could you app=
ly
> > > > the following debug patch and post the log first?
> > > =

> > > =

> > > ------
> > > =

> > > 2412 [=C2=A0 112.558155] XFS (sdb1): Ending clean mount
> > > 2413 [ 1317.330820] WARNING: CPU: 63 PID: 1495 at
> > > drivers/scsi/scsi_lib.c:1034 scsi_init_io+0x11a/0x2e0
> > > 2414 [ 1317.344000] Modules linked in: xfs dm_mod btrfs xor zstd_deco=
mpress
> > > zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
> > > x86_pkg_temp_thermal intel_powerclamp coretemp kvm_i=C2=A0=C2=A0=C2=
=A0=C2=A0 ntel kvm irqbypass
> > > crct10dif_pclmul crc32_pclmul crc32c_intel mgag200 snd_pcm
> > > ghash_clmulni_intel ttm snd_timer drm_kms_helper ipmi_si ahci snd
> > > aesni_intel syscopyarea libahci ipmi_devi=C2=A0=C2=A0=C2=A0=C2=A0 ntf=
 sysfillrect sysimgblt
> > > crypto_simd mei_me fb_sys_fops soundcore ioatdma cryptd ipmi_msghandl=
er
> > > glue_helper pcspkr drm libata mei joydev lpc_ich i2c_i801 dca wmi
> > > acpi_power_meter acpi=C2=A0=C2=A0=C2=A0=C2=A0 _pad pcc_cpufreq ip_tab=
les
> > > 2415 [ 1317.408135] CPU: 63 PID: 1495 Comm: kworker/63:1H Tainted:
> > > G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 5.2.0-rc5-00001-gc2d55e2 #1
> > > 2416 [ 1317.420350] Hardware name: Intel Corporation S2600WTT/S2600WT=
T, BIOS
> > > SE5C610.86B.01.01.0008.021120151325 02/11/2015
> > > 2417 [ 1317.433545] Workqueue: kblockd blk_mq_run_work_fn
> > > 2418 [ 1317.440295] RIP: 0010:scsi_init_io+0x11a/0x2e0
> > > 2419 [ 1317.446746] Code: be 01 00 00 00 e9 44 ff ff ff 8b 45 70 89 8=
3 08 01
> > > 00 00 f6 45 1a 01 75 8a 31 c0 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 =
5f c3
> > > <0f> 0b 8b 4d 18 8b 55 28 45 31 c9 48=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
7 c6 98 da 69 82 48 c7 c7 f0
> > > 2420 [ 1317.470863] RSP: 0018:ffffa5fa4f7e7c68 EFLAGS: 00010246
> > > 2421 [ 1317.478294] RAX: 000000003d17d1b8 RBX: ffff8ae6cb742690 RCX:
> > > 0000000000000000
> > > 2422 [ 1317.487878] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
> > > ffff8ae6cb742690
> > > 2423 [ 1317.497469] RBP: ffff8ae6cb742580 R08: 0000000000023003 R09:
> > > ffff8ae6cb7426c8
> > > 2424 [ 1317.507057] R10: ffffa5fa4c7d7da0 R11: fefefefefefefeff R12:
> > > 0000000000000801
> > > 2425 [ 1317.516650] R13: 0000000000000000 R14: 0000000000000000 R15:
> > > ffff8ac800bd1800
> > > 2426 [ 1317.526253] FS:=C2=A0 0000000000000000(0000) GS:ffff8b077fac0=
000(0000)
> > > knlGS:0000000000000000
> > > 2427 [ 1317.536918] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
> > > 2428 [ 1317.544952] CR2: 00007f39a5818004 CR3: 000000343440a006 CR4:
> > > 00000000001606e0
> > > 2429 [ 1317.554554] Call Trace:
> > > 2430 [ 1317.558921]=C2=A0 sd_init_command+0x2ee/0xaf0 [sd_mod]
> > > 2431 [ 1317.565800]=C2=A0 scsi_queue_rq+0x559/0xa80
> > > 2432 [ 1317.571607]=C2=A0 blk_mq_dispatch_rq_list+0x3da/0x5b0
> > > 2433 [ 1317.578375]=C2=A0 ? syscall_return_via_sysret+0x10/0x7f
> > > 2434 [ 1317.585339]=C2=A0 ? __switch_to_asm+0x40/0x70
> > > 2435 [ 1317.591321]=C2=A0 ? elv_rb_del+0x1f/0x30
> > > 2436 [ 1317.596807]=C2=A0 ? deadline_remove_request+0x55/0xc0
> > > 2437 [ 1317.603560]=C2=A0 blk_mq_do_dispatch_sched+0x76/0x120
> > > 2438 [ 1317.610302]=C2=A0 blk_mq_sched_dispatch_requests+0x100/0x170
> > > 2439 [ 1317.617733]=C2=A0 __blk_mq_run_hw_queue+0x60/0x130
> > > 2440 [ 1317.624200]=C2=A0 process_one_work+0x19c/0x3c0
> > > 2441 [ 1317.630258]=C2=A0 worker_thread+0x3c/0x3b0
> > > 2442 [ 1317.635937]=C2=A0 ? process_one_work+0x3c0/0x3c0
> > > 2443 [ 1317.642183]=C2=A0 kthread+0x11e/0x140
> > > 2444 [ 1317.647346]=C2=A0 ? kthread_park+0x90/0x90
> > > 2445 [ 1317.652986]=C2=A0 ret_from_fork+0x35/0x40
> > > 2446 [ 1317.658523] ---[ end trace 61026ff97261da6a ]---
> > > 2447 [ 1317.665327] scsi_dump_rq: rq 6(f:801/23003, seg: 0)
> > > 2448 [ 1317.671601] bio 0: d602/801 0 1024971192 0
> > > 2449 [ 1317.676991] print_req_error: I/O error, dev sdb, sector 10249=
71192
> > > flags 801
> > > 2450 [ 1317.685722] scsi_dump_rq: rq 8(f:801/23003, seg: 0)
> > > 2451 [ 1317.691994] bio 0: d602/801 0 1033359800 0
> > The above line shows the bio is zero-size, and this bio is submitted
> > from bio, since the bio->bi_flags indicates that BIO_CLONED isn't set.
> > =

> > Please apply the following debug patch, and we may see where is wrong.
> > =

> > diff --git a/block/blk-core.c b/block/blk-core.c
> > index 8340f69670d8..86bb61b0df83 100644
> > --- a/block/blk-core.c
> > +++ b/block/blk-core.c
> > @@ -1125,6 +1125,7 @@ blk_qc_t submit_bio(struct bio *bio)
> >   				bio_devname(bio, b), count);
> >   		}
> >   	}
> > +	WARN_ON(bio->bi_iter.bi_size =3D=3D 0 && bio_op(bio) =3D=3D REQ_OP_WR=
ITE);
> >   	return generic_make_request(bio);
> =

> =

> Sorry for delay,
> =

> ------
> =

> [=C2=A0 116.619136] 2019-06-29 16:12:41 mkdir -p /fs/sdb1
> [=C2=A0 116.619138]
> [=C2=A0 116.628743] 2019-06-29 16:12:41 mount -t xfs -o inode64 /dev/sdb1
> /fs/sdb1
> [=C2=A0 116.628745]
> [=C2=A0 116.634699] SGI XFS with ACLs, security attributes, realtime, scr=
ub,
> debug enabled
> [=C2=A0 116.653110] XFS (sdb1): Mounting V5 Filesystem
> [=C2=A0 116.670081] XFS (sdb1): Ending clean mount
> [=C2=A0 690.106779] WARNING: CPU: 53 PID: 1477 at block/blk-core.c:1128
> submit_bio+0x93/0x150
> [=C2=A0 690.117972] Modules linked in: xfs dm_mod btrfs xor zstd_decompre=
ss
> zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass
> mgag200 crct10dif_pclmul crc32_pclmul ttm crc32c_intel snd_pcm
> ghash_clmulni_intel drm_kms_helper snd_timer ahci syscopyarea sysfillrect
> snd aesni_intel sysimgblt libahci ipmi_si soundcore fb_sys_fops mei_me
> crypto_simd ipmi_devintf ioatdma cryptd pcspkr drm ipmi_msghandler
> glue_helper libata mei joydev lpc_ich i2c_i801 dca wmi acpi_power_meter
> acpi_pad pcc_cpufreq ip_tables
> [=C2=A0 690.176967] CPU: 53 PID: 1477 Comm: fio Tainted: G=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 W I=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> 5.2.0-rc5-00002-g9fa09bd #1
> [=C2=A0 690.187198] Hardware name: Intel Corporation S2600WTT/S2600WTT, B=
IOS
> SE5C610.86B.01.01.0008.021120151325 02/11/2015
> [=C2=A0 690.199375] RIP: 0010:submit_bio+0x93/0x150
> [=C2=A0 690.204583] Code: ee 74 45 83 e1 01 74 26 65 48 01 35 bf 39 3f 45=
 8b 0d
> ad 96 c4 01 85 c9 75 56 8b 43 28 85 c0 75 b3 0f b6 53 10 83 fa 01 75 aa <=
0f>
> 0b eb a6 65 48 8b 14 25 c0 6b 01 00 65 48 01 35 88 39 3f 45 48
> [=C2=A0 690.226668] RSP: 0018:ffffb2d90efc3b40 EFLAGS: 00010246
> [=C2=A0 690.233072] RAX: 0000000000000000 RBX: ffff9654c6ad9f40 RCX:
> 0000000000000801
> [=C2=A0 690.241617] RDX: 0000000000000001 RSI: ffff9654c6ad9f00 RDI:
> ffff9654c6ad9f40
> [=C2=A0 690.250146] RBP: 0000000000000000 R08: 0000000000000002 R09:
> 0000000000000000
> [=C2=A0 690.258667] R10: 00000000000303a0 R11: ffff96757ffd4000 R12:
> ffffb2d90efc3e08
> [=C2=A0 690.267183] R13: ffff9654c6ad9f00 R14: ffffb2d90efc3e08 R15:
> 0000000000000000
> [=C2=A0 690.275696] FS:=C2=A0 00007fa8e005da80(0000) GS:ffff9654ffac0000(=
0000)
> knlGS:0000000000000000
> [=C2=A0 690.285282] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [=C2=A0 690.292252] CR2: 00007fa8cc05b3c0 CR3: 0000001fc8518001 CR4:
> 00000000001606e0
> [=C2=A0 690.300770] Call Trace:
> [=C2=A0 690.304123]=C2=A0 xfs_submit_ioend+0x84/0x1e0 [xfs]
> [=C2=A0 690.309668]=C2=A0 xfs_do_writepage+0x246/0x5a0 [xfs]
> [=C2=A0 690.315279]=C2=A0 write_cache_pages+0x16b/0x440
> [=C2=A0 690.320420]=C2=A0 ? xfs_vm_releasepage+0x80/0x80 [xfs]
> [=C2=A0 690.326238]=C2=A0 xfs_vm_writepages+0x6b/0xa0 [xfs]
> [=C2=A0 690.331742]=C2=A0 do_writepages+0x4b/0xf0
> [=C2=A0 690.336275]=C2=A0 ? iomap_file_buffered_write+0x62/0x90
> [=C2=A0 690.342162]=C2=A0 ? iomap_write_end+0x240/0x240
> [=C2=A0 690.347295]=C2=A0 ? xfs_iunlock+0x165/0x220 [xfs]
> [=C2=A0 690.352595]=C2=A0 ? __filemap_fdatawrite_range+0xc1/0x100
> [=C2=A0 690.358673]=C2=A0 __filemap_fdatawrite_range+0xc1/0x100
> [=C2=A0 690.364571]=C2=A0 ? __switch_to_asm+0x34/0x70
> [=C2=A0 690.369484]=C2=A0 file_write_and_wait_range+0x4c/0xa0
> [=C2=A0 690.375198]=C2=A0 xfs_file_fsync+0x5d/0x230 [xfs]
> [=C2=A0 690.380499]=C2=A0 do_fsync+0x38/0x60
> [=C2=A0 690.384534]=C2=A0 __x64_sys_fsync+0x10/0x20
> [=C2=A0 690.389243]=C2=A0 do_syscall_64+0x5b/0x1e0
> [=C2=A0 690.393857]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [=C2=A0 690.400020] RIP: 0033:0x7fa8cbe4f70d
> [=C2=A0 690.404533] Code: bc 20 00 00 75 10 b8 4a 00 00 00 0f 05 48 3d 01=
 f0 ff
> ff 73 31 c3 48 83 ec 08 e8 6e f7 ff ff 48 89 04 24 b8 4a 00 00 00 0f 05 <=
48>
> 8b 3c 24 48 89 c2 e8 b7 f7 ff ff 48 89 d0 48 83 c4 08 48 3d 01
> [=C2=A0 690.426581] RSP: 002b:00007ffed6954160 EFLAGS: 00000293 ORIG_RAX:
> 000000000000004a
> [=C2=A0 690.435583] RAX: ffffffffffffffda RBX: 00005573363790f0 RCX:
> 00007fa8cbe4f70d
> [=C2=A0 690.444102] RDX: 0000000000200000 RSI: 00005573363790f0 RDI:
> 0000000000000003
> [=C2=A0 690.452615] RBP: 00007fa8b337f418 R08: 0000000000000008 R09:
> 0000000000000001
> [=C2=A0 690.461124] R10: 00000000897b0000 R11: 0000000000000293 R12:
> 0000000000000000
> [=C2=A0 690.469631] R13: 0000001000000000 R14: 00007fa8c81dda50 R15:
> 0000000000000000
> [=C2=A0 690.478130] ---[ end trace 90dd4ee6d5cdfcb8 ]---

I have just checked xfs code, and looks the only reason is that bio size
is overflowed, that means the whole bio may reach 4GB. That might be
possible in case of writeback. But I have to double check if that is
the case, could you test the following patch and provide the log?

diff --git a/block/blk-core.c b/block/blk-core.c
index 8340f69670d8..9d61e408c608 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1125,6 +1125,19 @@ blk_qc_t submit_bio(struct bio *bio)
 				bio_devname(bio, b), count);
 		}
 	}
+	if (WARN_ON(bio->bi_iter.bi_size =3D=3D 0 && bio_op(bio) =3D=3D REQ_OP_WR=
ITE)) {
+		int i;
+		printk("bio: %hx/%hx %u %llu %u\n", bio->bi_flags, bio->bi_opf,
+                       bio->bi_vcnt,
+                       (unsigned long long)bio->bi_iter.bi_sector,
+                       bio->bi_iter.bi_size);
+		for (i =3D 0; i < bio->bi_vcnt; i++) {
+			struct bio_vec *bvec =3D &bio->bi_io_vec[i];
+			printk("%d: pfn %lu offset %u len %u\n", i++,
+                               (unsigned long)page_to_pfn(bvec->bv_page),
+                               bvec->bv_offset, bvec->bv_len);
+		}
+	}
 =

 	return generic_make_request(bio);
 }


Thanks,
Ming

--===============0217148227916794725==--

