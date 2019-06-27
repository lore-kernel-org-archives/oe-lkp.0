Content-Type: multipart/mixed; boundary="===============2199744874350392154=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: 07173c3ec2: stderr.fio:pid=#, err=#/file:filesetup.c:#, func=fsync, error=Input/output_error
Date: Thu, 27 Jun 2019 11:41:09 +0800
Message-ID: <20190627034108.GA17139@ming.t460p>
In-Reply-To: <173ea4c1-f6b1-7ae7-e9aa-2c3613659f8c@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2199744874350392154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2019 at 08:59:51AM +0800, Liu Yiding wrote:
> Hi, Ming.
> =

> =E5=9C=A8 2019/6/26 =E4=B8=8A=E5=8D=8811:32, Ming Lei =E5=86=99=E9=81=93:
> > On Wed, Jun 26, 2019 at 10:42:52AM +0800, Liu Yiding wrote:
> > > sorry, something wrong with attatched file.
> > > =

> > > ------
> > > =

> > > wipefs -a --force /dev/sdb1
> > > mkfs -t xfs /dev/sdb1
> > > mkdir -p /fs/sdb1
> > > mount -t xfs -o inode64 /dev/sdb1 /fs/sdb1
> > > =

> > > for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
> > > do
> > >  =C2=A0=C2=A0=C2=A0 online_file=3D"$cpu_dir"/online
> > >  =C2=A0=C2=A0=C2=A0 [ -f "$online_file" ] && [ "$(cat "$online_file")=
" -eq 0 ] && continue
> > > =

> > >  =C2=A0=C2=A0=C2=A0 file=3D"$cpu_dir"/cpufreq/scaling_governor
> > >  =C2=A0=C2=A0=C2=A0 [ -f "$file" ] && echo "performance" > "$file"
> > > done
> > > =

> > > echo '[global]
> > > bs=3D2M
> > > ioengine=3Dsync
> > > iodepth=3D32
> > > size=3D68719476736
> > > direct=3D0
> > > runtime=3D300
> > > invalidate=3D1
> > > fallocate=3Dposix
> > > group_reporting
> > > =

> > > [task_0]
> > > rw=3Drandread
> > > directory=3D/fs/sdb1
> > > numjobs=3D8' | fio --output-format=3Djson -
> > > umount /fs/sdb1
> > Hi Liu Yiding,
> > =

> > Thanks for providing me the script.
> > =

> > It may take a while for me to reproduce the issue, so could you apply
> > the following debug patch and post the log first?
> =

> =

> =

> ------
> =

> 2412 [=C2=A0 112.558155] XFS (sdb1): Ending clean mount
> 2413 [ 1317.330820] WARNING: CPU: 63 PID: 1495 at
> drivers/scsi/scsi_lib.c:1034 scsi_init_io+0x11a/0x2e0
> 2414 [ 1317.344000] Modules linked in: xfs dm_mod btrfs xor zstd_decompre=
ss
> zstd_compress raid6_pq libcrc32c sd_mod sg intel_rapl sb_edac
> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_i=C2=A0=C2=A0=C2=A0=C2=
=A0 ntel kvm irqbypass
> crct10dif_pclmul crc32_pclmul crc32c_intel mgag200 snd_pcm
> ghash_clmulni_intel ttm snd_timer drm_kms_helper ipmi_si ahci snd
> aesni_intel syscopyarea libahci ipmi_devi=C2=A0=C2=A0=C2=A0=C2=A0 ntf sys=
fillrect sysimgblt
> crypto_simd mei_me fb_sys_fops soundcore ioatdma cryptd ipmi_msghandler
> glue_helper pcspkr drm libata mei joydev lpc_ich i2c_i801 dca wmi
> acpi_power_meter acpi=C2=A0=C2=A0=C2=A0=C2=A0 _pad pcc_cpufreq ip_tables
> 2415 [ 1317.408135] CPU: 63 PID: 1495 Comm: kworker/63:1H Tainted:
> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 5.2.0-rc5-00001-gc2d55e2 #1
> 2416 [ 1317.420350] Hardware name: Intel Corporation S2600WTT/S2600WTT, B=
IOS
> SE5C610.86B.01.01.0008.021120151325 02/11/2015
> 2417 [ 1317.433545] Workqueue: kblockd blk_mq_run_work_fn
> 2418 [ 1317.440295] RIP: 0010:scsi_init_io+0x11a/0x2e0
> 2419 [ 1317.446746] Code: be 01 00 00 00 e9 44 ff ff ff 8b 45 70 89 83 08=
 01
> 00 00 f6 45 1a 01 75 8a 31 c0 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3
> <0f> 0b 8b 4d 18 8b 55 28 45 31 c9 48=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c7 c6=
 98 da 69 82 48 c7 c7 f0
> 2420 [ 1317.470863] RSP: 0018:ffffa5fa4f7e7c68 EFLAGS: 00010246
> 2421 [ 1317.478294] RAX: 000000003d17d1b8 RBX: ffff8ae6cb742690 RCX:
> 0000000000000000
> 2422 [ 1317.487878] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
> ffff8ae6cb742690
> 2423 [ 1317.497469] RBP: ffff8ae6cb742580 R08: 0000000000023003 R09:
> ffff8ae6cb7426c8
> 2424 [ 1317.507057] R10: ffffa5fa4c7d7da0 R11: fefefefefefefeff R12:
> 0000000000000801
> 2425 [ 1317.516650] R13: 0000000000000000 R14: 0000000000000000 R15:
> ffff8ac800bd1800
> 2426 [ 1317.526253] FS:=C2=A0 0000000000000000(0000) GS:ffff8b077fac0000(=
0000)
> knlGS:0000000000000000
> 2427 [ 1317.536918] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> 2428 [ 1317.544952] CR2: 00007f39a5818004 CR3: 000000343440a006 CR4:
> 00000000001606e0
> 2429 [ 1317.554554] Call Trace:
> 2430 [ 1317.558921]=C2=A0 sd_init_command+0x2ee/0xaf0 [sd_mod]
> 2431 [ 1317.565800]=C2=A0 scsi_queue_rq+0x559/0xa80
> 2432 [ 1317.571607]=C2=A0 blk_mq_dispatch_rq_list+0x3da/0x5b0
> 2433 [ 1317.578375]=C2=A0 ? syscall_return_via_sysret+0x10/0x7f
> 2434 [ 1317.585339]=C2=A0 ? __switch_to_asm+0x40/0x70
> 2435 [ 1317.591321]=C2=A0 ? elv_rb_del+0x1f/0x30
> 2436 [ 1317.596807]=C2=A0 ? deadline_remove_request+0x55/0xc0
> 2437 [ 1317.603560]=C2=A0 blk_mq_do_dispatch_sched+0x76/0x120
> 2438 [ 1317.610302]=C2=A0 blk_mq_sched_dispatch_requests+0x100/0x170
> 2439 [ 1317.617733]=C2=A0 __blk_mq_run_hw_queue+0x60/0x130
> 2440 [ 1317.624200]=C2=A0 process_one_work+0x19c/0x3c0
> 2441 [ 1317.630258]=C2=A0 worker_thread+0x3c/0x3b0
> 2442 [ 1317.635937]=C2=A0 ? process_one_work+0x3c0/0x3c0
> 2443 [ 1317.642183]=C2=A0 kthread+0x11e/0x140
> 2444 [ 1317.647346]=C2=A0 ? kthread_park+0x90/0x90
> 2445 [ 1317.652986]=C2=A0 ret_from_fork+0x35/0x40
> 2446 [ 1317.658523] ---[ end trace 61026ff97261da6a ]---
> 2447 [ 1317.665327] scsi_dump_rq: rq 6(f:801/23003, seg: 0)
> 2448 [ 1317.671601] bio 0: d602/801 0 1024971192 0
> 2449 [ 1317.676991] print_req_error: I/O error, dev sdb, sector 1024971192
> flags 801
> 2450 [ 1317.685722] scsi_dump_rq: rq 8(f:801/23003, seg: 0)
> 2451 [ 1317.691994] bio 0: d602/801 0 1033359800 0

The above line shows the bio is zero-size, and this bio is submitted
from bio, since the bio->bi_flags indicates that BIO_CLONED isn't set.

Please apply the following debug patch, and we may see where is wrong.

diff --git a/block/blk-core.c b/block/blk-core.c
index 8340f69670d8..86bb61b0df83 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1125,6 +1125,7 @@ blk_qc_t submit_bio(struct bio *bio)
 				bio_devname(bio, b), count);
 		}
 	}
+	WARN_ON(bio->bi_iter.bi_size =3D=3D 0 && bio_op(bio) =3D=3D REQ_OP_WRITE);
 =

 	return generic_make_request(bio);
 }
thanks,
Ming

--===============2199744874350392154==--

