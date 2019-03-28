Content-Type: multipart/mixed; boundary="===============9219836535444981088=="
MIME-Version: 1.0
From: Johannes Thumshirn <jthumshirn@suse.de>
To: lkp@lists.01.org
Subject: Re: [block] 4e366a7962: blktests.nvme.005.fail
Date: Thu, 28 Mar 2019 17:31:29 +0100
Message-ID: <bb98759a-2b51-9785-d903-282ca1ed91cb@suse.de>
In-Reply-To: <20190325010409.GB6379@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============9219836535444981088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 25/03/2019 02:04, kernel test robot wrote:
[...]
> nvme/005 (reset local loopback target)                      =

>     runtime  ...
> nvme/005 (reset local loopback target)                       [failed]
>     runtime  ...  0.596s
>     something found in dmesg:
>     [   24.160182] run blktests nvme/005 at 2019-03-24 07:35:16
>     [   24.346189] nvmet: adding nsid 1 to subsystem blktests-subsystem-1
>     [   24.373089] nvmet: creating controller 1 for subsystem blktests-su=
bsystem-1 for NQN nqn.2014-08.org.nvmexpress:uuid:dbd85962-80d1-4872-ac0f-d=
0214f3b1131.
>     [   24.394247] WARNING: CPU: 1 PID: 881 at /kbuild/src/x86_64/block/b=
lk-merge.c:608 blk_rq_map_sg+0x5f0/0x6c0
>     [   24.396082] Modules linked in: nvme_loop nvme_fabrics nvmet nvme_c=
ore loop crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel ata=
_generic sd_mod pata_acpi sg bochs_drm ttm ppdev drm_kms_helper syscopyarea=
 sysfillrect sysimgblt fb_sys_fops snd_pcm drm ata_piix snd_timer aesni_int=
el crypto_simd snd cryptd glue_helper libata joydev soundcore pcspkr serio_=
raw virtio_scsi i2c_piix4 parport_pc floppy parport ip_tables
>     [   24.403009] CPU: 1 PID: 881 Comm: nvme Not tainted 5.0.0-rc6-00148=
-g4e366a7 #1
>     [   24.404372] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),=
 BIOS 1.10.2-1 04/01/2014
>     [   24.405930] RIP: 0010:blk_rq_map_sg+0x5f0/0x6c0
>     [   24.406808] Code: 41 8b 91 10 01 00 00 8b 43 24 85 c2 0f 84 e3 fb =
ff ff f7 d0 21 d0 83 c0 01 41 01 40 0c 01 83 d0 00 00 00 e9 cd fb ff ff 0f =
0b <0f> 0b e9 c3 fc ff ff 80 3d 66 f3 1d 01 00 0f 85 88 fb ff ff 48 c7
>     [   24.410274] RSP: 0000:ffffb95c409d7908 EFLAGS: 00010202
>     ...
>     (See '/lkp/benchmarks/blktests/blktests/results/nodev/nvme/005.dmesg'=
 for the entire message)

OK we're tripping over this in blk_rq_map_sg():

607    /*
608     * Something must have been wrong if the figured number of
609     * segment is bigger than number of req's physical segments
610     */
611    WARN_ON(nsegs > blk_rq_nr_phys_segments(rq));

In all cases I could reproduce it I had nsegs =3D=3D 2 and
rq->nr_phys_segments =3D=3D 1 (rq->bio->bi_phys_segments =3D=3D 1).

Adding this into nvme-loop "fixes" the issue but I don't think this is
the correct way to do

--- a/drivers/nvme/target/loop.c
+++ b/drivers/nvme/target/loop.c
@@ -387,6 +387,7 @@ static int nvme_loop_configure_admin_que
                goto out_free_tagset;
        }

+       blk_queue_segment_boundary(ctrl->ctrl.admin_q, PAGE_SIZE - 1);
        error =3D nvmf_connect_admin_queue(&ctrl->ctrl);
        if (error)
                goto out_cleanup_queue;

What raises my suspicion is this code fragment from bio_add_pc_page():

 731
 732   /* If we may be able to merge these biovecs, force a recount */
 733   if (bio->bi_vcnt > 1 && biovec_phys_mergeable(q, bvec - 1, bvec))
 734           bio->bi_phys_segments =3D -1;

This -1 (from this patch) would fit the one less than 'nsegs' but after
days of searching and staring at the code, I cannot find where we loose
the one. Before this patch set we would only have cleared the
BIO_SEG_VALID flag and thus we never run out of sync.

Adding a call to blk_recount_segments() doesn't do any difference here.

It can of be a read herring as well.

What makes me suspicious is the fact that I can't reliably trigger it by
running nvme/005 but have to run it in a loop ranging between several
seconds to some minutes.

Anyone any ideas? I've been staring at this for several days now but
can't find out whats wrong.

Thanks a lot,
	Johannes
-- =

Johannes Thumshirn                            SUSE Labs Filesystems
jthumshirn(a)suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)
Key fingerprint =3D EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850

--===============9219836535444981088==--

