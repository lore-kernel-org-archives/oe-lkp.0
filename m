Content-Type: multipart/mixed; boundary="===============1128055180315257531=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: [PATCH] blk-mq: fail the request in case issue failure
Date: Sun, 22 Jul 2018 14:10:15 +0800
Message-ID: <20180722061015.761-1-ming.lei@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1128055180315257531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Inside blk_mq_try_issue_list_directly(), if the request is issued as
failed, we shouldn't try to do it again, otherwise the warning in
blk_mq_start_request() will be triggered. This change is aligned to
behaviour of other ways of request issue & dispatch.

Fixes: 6ce3dd6eec1 ("blk-mq: issue directly if hw queue isn't busy in case =
of 'none'")
Cc: Kashyap Desai <kashyap.desai@broadcom.com>
Cc: Laurence Oberman <loberman@redhat.com>
Cc: Omar Sandoval <osandov@fb.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Bart Van Assche <bart.vanassche@wdc.com>
Cc: Hannes Reinecke <hare@suse.de>
Cc: Kashyap Desai <kashyap.desai@broadcom.com>
Cc: kernel test robot <rong.a.chen@intel.com>
Cc: LKP <lkp@01.org>
Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-mq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 21f3eda98431..e13bdc2707ce 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -1794,8 +1794,12 @@ void blk_mq_try_issue_list_directly(struct blk_mq_hw=
_ctx *hctx,
 		list_del_init(&rq->queuelist);
 		ret =3D blk_mq_request_issue_directly(rq);
 		if (ret !=3D BLK_STS_OK) {
-			list_add(&rq->queuelist, list);
-			break;
+			if (ret =3D=3D BLK_STS_RESOURCE ||
+					ret =3D=3D BLK_STS_DEV_RESOURCE) {
+				list_add(&rq->queuelist, list);
+				break;
+			}
+			blk_mq_end_request(rq, ret);
 		}
 	}
 }
-- =

2.9.5


--===============1128055180315257531==--

