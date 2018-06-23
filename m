Content-Type: multipart/mixed; boundary="===============7816648162821744983=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Sat, 23 Jun 2018 09:15:08 +0200
Message-ID: <20180623071508.GA848@lst.de>
In-Reply-To: <20180622200255.GB30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7816648162821744983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 09:02:55PM +0100, Al Viro wrote:
> > While at the same time corect poll code already checks net_busy_loop_on
> > to set POLL_BUSY_LOOP.  So except for sockets where people set the
> > timeout to 0 the code already does the right thing as-is.  IMHO not
> > really worth wasting a FMODE_* flag for it, but if you insist I'll add
> > it.
> =

> It's not just that - there's also an issue of extra indirect call on the
> fast path for sockets.  You get this method of yours + ->poll_mask(),
> which hits another indirect to per-family ->poll_mask().  It might be
> better to have these combined, sparing us an extra indirect call.
> =

> Just give it the same calling conventions as ->poll_mask() have...

The problem is that for the busy poll we want the actual busy poll +
__pollwait + ->poll_mask.  Which is going to make that new poll_busy_loop
with a return value look exactly like ->poll.

So for now I'm tempted to just do this:

---
>From 4abf23f6565ff2a74f1859758f9c894abe476a00 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Sat, 23 Jun 2018 09:02:59 +0200
Subject: FOLD: remove ->poll_busy_loop again

Busy looping always comes in from poll(2) or select(2).  So instead of
adding a separate method we can just do it at the beginning of ->poll
for now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/select.c        |  8 --------
 include/linux/fs.h |  1 -
 net/socket.c       | 20 ++++++--------------
 3 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/fs/select.c b/fs/select.c
index 25327efca2f9..c68f7cdc777a 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -38,14 +38,6 @@ __poll_t vfs_poll(struct file *file, struct poll_table_s=
truct *pt)
 {
 	unsigned int events =3D poll_requested_events(pt);
 =

-	/*
-	 * XXX: might be worth adding a f_mode flag to see if busy looping is
-	 * supported.  Although callers probably only keep setting it when
-	 * supported, that's why POLL_BUSY_LOOP is reported in the output.
-	 */
-	if ((events & POLL_BUSY_LOOP) && file->f_op->poll_busy_loop)
-		file->f_op->poll_busy_loop(file, events);
-
 	if (file->f_op->poll) {
 		return file->f_op->poll(file, pt);
 	} else if (file->f_poll_head) {
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 82133bd1a047..bfaebdc03878 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1722,7 +1722,6 @@ struct file_operations {
 	int (*iterate_shared) (struct file *, struct dir_context *);
 	__poll_t (*poll) (struct file *, struct poll_table_struct *);
 	__poll_t (*poll_mask) (struct file *, __poll_t);
-	void (*poll_busy_loop)(struct file *file, __poll_t events);
 	long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
 	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
 	int (*mmap) (struct file *, struct vm_area_struct *);
diff --git a/net/socket.c b/net/socket.c
index b52e5b900e09..0aaa49190b30 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -131,19 +131,6 @@ static ssize_t sock_splice_read(struct file *file, lof=
f_t *ppos,
 				struct pipe_inode_info *pipe, size_t len,
 				unsigned int flags);
 =

-#ifdef CONFIG_NET_RX_BUSY_POLL
-static void sock_poll_busy_loop(struct file *file, __poll_t events)
-{
-	struct socket *sock =3D file->private_data;
-
-	/* once, only if requested by syscall */
-	if (sk_can_busy_loop(sock->sk))
-		sk_busy_loop(sock->sk, 1);
-}
-#else
-#define sock_poll_busy_loop	NULL
-#endif
-
 /*
  *	Socket files have a set of 'special' operations as well as the generic =
file ones. These don't appear
  *	in the operation structures but are done directly via the socketcall() =
multiplexor.
@@ -155,7 +142,6 @@ static const struct file_operations socket_file_ops =3D=
 {
 	.read_iter =3D	sock_read_iter,
 	.write_iter =3D	sock_write_iter,
 	.poll_mask =3D	sock_poll_mask,
-	.poll_busy_loop =3D sock_poll_busy_loop,
 	.poll =3D		sock_poll,
 	.unlocked_ioctl =3D sock_ioctl,
 #ifdef CONFIG_COMPAT
@@ -1163,6 +1149,12 @@ static __poll_t sock_poll(struct file *file, poll_ta=
ble *wait)
 	struct socket *sock =3D file->private_data;
 	__poll_t events =3D poll_requested_events(wait), mask =3D 0;
 =

+	/*
+	 * Poll once, if requested by syscall.
+	 */
+	if ((events & POLL_BUSY_LOOP) && sk_can_busy_loop(sock->sk))
+		sk_busy_loop(sock->sk, 1);
+
 	if (sock->ops->poll) {
 		mask =3D sock->ops->poll(file, sock, wait);
 	} else if (sock->ops->poll_mask) {
-- =

2.17.1


--===============7816648162821744983==--

