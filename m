Content-Type: multipart/mixed; boundary="===============8566250370731329951=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 12:00:14 +0200
Message-ID: <20180622100014.GA12425@lst.de>
In-Reply-To: <20180622095608.GA12263@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8566250370731329951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

And a version with select() also covered:

---
>From 317159003ae28113cf759c632b161fb39192fe3c Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Fri, 22 Jun 2018 11:36:26 +0200
Subject: fs: optimize away ->_qproc indirection for poll_mask based polling

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/select.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/fs/select.c b/fs/select.c
index bc3cc0f98896..2c9d81892509 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -528,6 +528,24 @@ static int do_select(int n, fd_set_bits *fds, struct t=
imespec64 *end_time)
 					wait_key_set(wait, in, out, bit,
 						     busy_flag);
 					mask =3D vfs_poll(f.file, wait);
+					if (f.file->f_op->poll) {
+						mask =3D f.file->f_op->poll(f.file, wait);
+					} else if (file_has_poll_mask(f.file)) {
+						struct wait_queue_head *head;
+
+						head =3D f.file->f_op->get_poll_head(f.file, wait->_key);
+						if (!head) {
+							mask =3D DEFAULT_POLLMASK;
+						} else if (IS_ERR(head)) {
+							mask =3D EPOLLERR;
+						} else {
+							if (wait->_qproc)
+								__pollwait(f.file, head, wait);
+							mask =3D f.file->f_op->poll_mask(f.file, wait->_key);
+						}
+					} else {
+						mask =3D DEFAULT_POLLMASK;
+					}
 =

 					fdput(f);
 					if ((mask & POLLIN_SET) && (in & bit)) {
@@ -845,7 +863,25 @@ static inline __poll_t do_pollfd(struct pollfd *pollfd=
, poll_table *pwait,
 	/* userland u16 ->events contains POLL... bitmap */
 	filter =3D demangle_poll(pollfd->events) | EPOLLERR | EPOLLHUP;
 	pwait->_key =3D filter | busy_flag;
-	mask =3D vfs_poll(f.file, pwait);
+	if (f.file->f_op->poll) {
+		mask =3D f.file->f_op->poll(f.file, pwait);
+	} else if (file_has_poll_mask(f.file)) {
+		struct wait_queue_head *head;
+
+		head =3D f.file->f_op->get_poll_head(f.file, pwait->_key);
+		if (!head) {
+			mask =3D DEFAULT_POLLMASK;
+		} else if (IS_ERR(head)) {
+			mask =3D EPOLLERR;
+		} else {
+			if (pwait->_qproc)
+				__pollwait(f.file, head, pwait);
+			mask =3D f.file->f_op->poll_mask(f.file, pwait->_key);
+		}
+	} else {
+		mask =3D DEFAULT_POLLMASK;
+	}
+
 	if (mask & busy_flag)
 		*can_busy_poll =3D true;
 	mask &=3D filter;		/* Mask out unneeded events. */
-- =

2.17.1


--===============8566250370731329951==--

