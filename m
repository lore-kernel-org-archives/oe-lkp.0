Content-Type: multipart/mixed; boundary="===============0048876878157506141=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: 07173c3ec2: stderr.fio:pid=#, err=#/file:filesetup.c:#, func=fsync, error=Input/output_error
Date: Wed, 26 Jun 2019 11:32:24 +0800
Message-ID: <20190626033223.GB26340@ming.t460p>
In-Reply-To: <5ed0c074-0b29-7781-3cab-9d11afee19cb@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0048876878157506141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019 at 10:42:52AM +0800, Liu Yiding wrote:
> sorry, something wrong with attatched file.
> =

> ------
> =

> wipefs -a --force /dev/sdb1
> mkfs -t xfs /dev/sdb1
> mkdir -p /fs/sdb1
> mount -t xfs -o inode64 /dev/sdb1 /fs/sdb1
> =

> for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
> do
> =C2=A0=C2=A0=C2=A0 online_file=3D"$cpu_dir"/online
> =C2=A0=C2=A0=C2=A0 [ -f "$online_file" ] && [ "$(cat "$online_file")" -eq=
 0 ] && continue
> =

> =C2=A0=C2=A0=C2=A0 file=3D"$cpu_dir"/cpufreq/scaling_governor
> =C2=A0=C2=A0=C2=A0 [ -f "$file" ] && echo "performance" > "$file"
> done
> =

> echo '[global]
> bs=3D2M
> ioengine=3Dsync
> iodepth=3D32
> size=3D68719476736
> direct=3D0
> runtime=3D300
> invalidate=3D1
> fallocate=3Dposix
> group_reporting
> =

> [task_0]
> rw=3Drandread
> directory=3D/fs/sdb1
> numjobs=3D8' | fio --output-format=3Djson -
> umount /fs/sdb1

Hi Liu Yiding,

Thanks for providing me the script.

It may take a while for me to reproduce the issue, so could you apply
the following debug patch and post the log first?

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 65d0a10c76ad..4b272677458f 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -991,6 +991,30 @@ static blk_status_t scsi_init_sgtable(struct request *=
req,
 	return BLK_STS_OK;
 }
 =

+static void scsi_dump_rq(const struct request *rq)
+{
+	int i =3D 0;
+	struct req_iterator rq_iter;
+	struct bio_vec bvec;
+	struct bio *bio;
+
+	printk("%s: rq %d(f:%x/%x, seg: %d)\n", __func__,
+			rq->tag, rq->cmd_flags, rq->rq_flags,
+			rq->nr_phys_segments);
+
+	__rq_for_each_bio(bio, rq)
+		printk("bio %d: %hx/%hx %u %llu %u\n", i++,
+			bio->bi_flags, bio->bi_opf,
+			bio->bi_phys_segments,
+			(unsigned long long)bio->bi_iter.bi_sector,
+			bio->bi_iter.bi_size);
+	i =3D 0;
+	rq_for_each_bvec(bvec, rq, rq_iter)
+		printk("%d: pfn %lu offset %u len %u\n", i++,
+				(unsigned long)page_to_pfn(bvec.bv_page),
+				bvec.bv_offset, bvec.bv_len);
+}
+
 /*
  * Function:    scsi_init_io()
  *
@@ -1007,8 +1031,10 @@ blk_status_t scsi_init_io(struct scsi_cmnd *cmd)
 	struct request *rq =3D cmd->request;
 	blk_status_t ret;
 =

-	if (WARN_ON_ONCE(!blk_rq_nr_phys_segments(rq)))
+	if (WARN_ON_ONCE(!blk_rq_nr_phys_segments(rq))) {
+		scsi_dump_rq(rq);
 		return BLK_STS_IOERR;
+	}
 =

 	ret =3D scsi_init_sgtable(rq, &cmd->sdb);
 	if (ret)

Thanks,
Ming

--===============0048876878157506141==--

