Content-Type: multipart/mixed; boundary="===============2512000767307570019=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [blk] 394534b2c5: fsmark.files_per_sec -44.7% regression
Date: Mon, 08 Feb 2021 11:35:49 +0100
Message-ID: <20210208103549.ybguxqxv7vfmkfde@linutronix.de>
In-Reply-To: <5bf5b060-23d3-1a1b-2ab4-09942639e6ce@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2512000767307570019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-02-07 14:11:07 [+0800], Xing, Zhengjun wrote:
> =

> I find that the blk branch has been re-based recently (re-based from
> v5.11-rc4 to v5.11-rc5).
> I re-test the updated branch, the regression now is -3.4%

Thank you, this looks much better now.

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/iterations/nr_threads/disk/fs=
/filesize/test_size/sync_method/nr_directories/nr_files_per_directory/cpufr=
eq_governor/ucode:
> lkp-csl-2sp7/fsmark/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9=
/1x/32t/1SSD/f2fs/9B/400M/fsyncBeforeClose/16d/256fpd/performance/0x5003003
> =

> commit:
> =C2=A0 cb9615f3ffb846160084d36783c6820845a97ce3 (blk-mq: Always complete =
remote completions requests in softirq)
> =C2=A0 54c06aefd2ea984866db5c24fdc4d1be0a14f221=C2=A0(blk-mq: Use llist_h=
ead for blk_cpu_done)
> =

> cb9615f3ffb84616 54c06aefd2ea984866db5c24fdc
> ---------------- ---------------------------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0 30450=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -3.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 29417=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fsmark.files_per_sec

So for my understanding: the 3.4% regression is from commit
cb9615f3ffb846160084d36783c6820845a97ce3 to commit
54c06aefd2ea984866db5c24fdc4d1be0a14f221 ?

There is no comparison from v5.11-rc5 against the last head (or a commit
in between)?

I would have expected a regression in cb9615f3ffb84616 since it changes
the behaviour in your case (NUMA + single queue device). The second
patch (54c06aefd2e) is just an optimisation of the former.

Disabling remote queue completion (by setting
/sys/devices/*/block/*/queue/rq_affinity from 1 to 0) should mostly
accomplish what the first patch does here in your case or by using the
patch below.

diff --git a/block/blk-mq.c b/block/blk-mq.c
index f21d922ecfaf0..13338870d7846 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -647,6 +647,8 @@ static inline bool blk_mq_complete_need_ipi(struct requ=
est *rq)
 {
 	int cpu =3D raw_smp_processor_id();
 =

+	return false;
+
 	if (!IS_ENABLED(CONFIG_SMP) ||
  		!test_bit(QUEUE_FLAG_SAME_COMP, &rq->q->queue_flags))
  			return false;


Sebastian
--===============2512000767307570019==--

