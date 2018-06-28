Content-Type: multipart/mixed; boundary="===============2883027942592090387=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 16:20:59 +0200
Message-ID: <20180628142059.10017-7-hch@lst.de>
In-Reply-To: <20180628142059.10017-1-hch@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2883027942592090387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The doubling of the indirect calls caused a too big regression for some
benchmarks in our post-spectre world.

With some of the nastiness in the networking code moved out of the way
we can instead stick a pointer to a waitqueue into struct file and
avoid one of the indirect calls.  This actually happens to simplify
the code quite a bit as well.

Note that for this removes the possibility of actually returning an
error before waiting in poll.  We could still do this with an ERR_PTR
in f_poll_head with a little bit of WRITE_ONCE/READ_ONCE magic, but
I'd like to defer that until actually required.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/filesystems/Locking |  4 +---
 Documentation/filesystems/vfs.txt | 15 +++++---------
 drivers/char/random.c             |  8 ++++----
 fs/aio.c                          | 22 ++++++---------------
 fs/eventfd.c                      | 33 +++++++++++++++++++------------
 fs/eventpoll.c                    |  9 +--------
 fs/pipe.c                         | 12 +++--------
 fs/select.c                       | 18 ++++-------------
 fs/timerfd.c                      | 31 +++++++++++++++++------------
 include/linux/fs.h                |  2 +-
 include/linux/poll.h              |  7 +------
 net/socket.c                      | 17 +++-------------
 12 files changed, 67 insertions(+), 111 deletions(-)

diff --git a/Documentation/filesystems/Locking b/Documentation/filesystems/=
Locking
index 2c391338c675..4d183e8258b6 100644
--- a/Documentation/filesystems/Locking
+++ b/Documentation/filesystems/Locking
@@ -441,7 +441,6 @@ prototypes:
 	int (*iterate) (struct file *, struct dir_context *);
 	int (*iterate_shared) (struct file *, struct dir_context *);
 	__poll_t (*poll) (struct file *, struct poll_table_struct *);
-	struct wait_queue_head * (*get_poll_head)(struct file *, __poll_t);
 	__poll_t (*poll_mask) (struct file *, __poll_t);
 	long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
 	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
@@ -505,8 +504,7 @@ in sys_read() and friends.
 the lease within the individual filesystem to record the result of the
 operation
 =

-->poll_mask can be called with or without the waitqueue lock for the waitq=
ueue
-returned from ->get_poll_head.
+->poll_mask can be called with or without the waitqueue lock
 =

 --------------------------- dquot_operations -----------------------------=
--
 prototypes:
diff --git a/Documentation/filesystems/vfs.txt b/Documentation/filesystems/=
vfs.txt
index 829a7b7857a4..2d2f07acafa8 100644
--- a/Documentation/filesystems/vfs.txt
+++ b/Documentation/filesystems/vfs.txt
@@ -857,7 +857,6 @@ struct file_operations {
 	ssize_t (*write_iter) (struct kiocb *, struct iov_iter *);
 	int (*iterate) (struct file *, struct dir_context *);
 	__poll_t (*poll) (struct file *, struct poll_table_struct *);
-	struct wait_queue_head * (*get_poll_head)(struct file *, __poll_t);
 	__poll_t (*poll_mask) (struct file *, __poll_t);
 	long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
 	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
@@ -903,16 +902,12 @@ otherwise noted.
 	activity on this file and (optionally) go to sleep until there
 	is activity. Called by the select(2) and poll(2) system calls
 =

-  get_poll_head: Returns the struct wait_queue_head that callers can
-  wait on.  Callers need to check the returned events using ->poll_mask
-  once woken.  Can return NULL to indicate polling is not supported,
-  or any error code using the ERR_PTR convention to indicate that a
-  grave error occured and ->poll_mask shall not be called.
-
   poll_mask: return the mask of EPOLL* values describing the file descript=
or
-  state.  Called either before going to sleep on the waitqueue returned by
-  get_poll_head, or after it has been woken.  If ->get_poll_head and
-  ->poll_mask are implemented ->poll does not need to be implement.
+  state.  Called either before going to sleep on ->f_poll_head, or after it
+  has been woken.  On files that support ->poll_mask the ->f_poll_head fie=
ld
+  must point to a wait_queue_head that poll can wait on.  The waitqueue mu=
st
+  have the same (or a longer) life time as the struct file itself.
+  If  ->poll_mask is implemented ->poll does not need to be implement.
 =

   unlocked_ioctl: called by the ioctl(2) system call.
 =

diff --git a/drivers/char/random.c b/drivers/char/random.c
index a8fb0020ba5c..e6260a9fa3b9 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1875,10 +1875,10 @@ urandom_read(struct file *file, char __user *buf, s=
ize_t nbytes, loff_t *ppos)
 	return ret;
 }
 =

-static struct wait_queue_head *
-random_get_poll_head(struct file *file, __poll_t events)
+static int random_open(struct inode *inode, struct file *file)
 {
-	return &random_wait;
+	file->f_poll_head =3D &random_wait;
+	return 0;
 }
 =

 static __poll_t
@@ -1990,9 +1990,9 @@ static int random_fasync(int fd, struct file *filp, i=
nt on)
 }
 =

 const struct file_operations random_fops =3D {
+	.open =3D random_open,
 	.read  =3D random_read,
 	.write =3D random_write,
-	.get_poll_head  =3D random_get_poll_head,
 	.poll_mask  =3D random_poll_mask,
 	.unlocked_ioctl =3D random_ioctl,
 	.fasync =3D random_fasync,
diff --git a/fs/aio.c b/fs/aio.c
index e1d20124ec0e..84f498df8afc 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -168,7 +168,6 @@ struct fsync_iocb {
 struct poll_iocb {
 	struct file		*file;
 	__poll_t		events;
-	struct wait_queue_head	*head;
 =

 	union {
 		struct wait_queue_entry	wait;
@@ -1632,7 +1631,7 @@ static int aio_poll_cancel(struct kiocb *iocb)
 {
 	struct aio_kiocb *aiocb =3D container_of(iocb, struct aio_kiocb, rw);
 	struct poll_iocb *req =3D &aiocb->poll;
-	struct wait_queue_head *head =3D req->head;
+	struct wait_queue_head *head =3D req->file->f_poll_head;
 	bool found =3D false;
 =

 	spin_lock(&head->lock);
@@ -1655,7 +1654,7 @@ static int aio_poll_wake(struct wait_queue_entry *wai=
t, unsigned mode, int sync,
 	struct file *file =3D req->file;
 	__poll_t mask =3D key_to_poll(key);
 =

-	assert_spin_locked(&req->head->lock);
+	assert_spin_locked(&file->f_poll_head->lock);
 =

 	/* for instances that support it check for an event match first: */
 	if (mask && !(mask & req->events))
@@ -1703,30 +1702,21 @@ static ssize_t aio_poll(struct aio_kiocb *aiocb, st=
ruct iocb *iocb)
 	req->file =3D fget(iocb->aio_fildes);
 	if (unlikely(!req->file))
 		return -EBADF;
-	if (!file_has_poll_mask(req->file))
+	if (!req->file->f_poll_head)
 		goto out_fail;
 =

-	req->head =3D req->file->f_op->get_poll_head(req->file, req->events);
-	if (!req->head)
-		goto out_fail;
-	if (IS_ERR(req->head)) {
-		mask =3D EPOLLERR;
-		goto done;
-	}
-
 	init_waitqueue_func_entry(&req->wait, aio_poll_wake);
 	aiocb->ki_cancel =3D aio_poll_cancel;
 =

 	spin_lock_irq(&ctx->ctx_lock);
-	spin_lock(&req->head->lock);
+	spin_lock(&req->file->f_poll_head->lock);
 	mask =3D req->file->f_op->poll_mask(req->file, req->events) & req->events;
 	if (!mask) {
-		__add_wait_queue(req->head, &req->wait);
+		__add_wait_queue(req->file->f_poll_head, &req->wait);
 		list_add_tail(&aiocb->ki_list, &ctx->active_reqs);
 	}
-	spin_unlock(&req->head->lock);
+	spin_unlock(&req->file->f_poll_head->lock);
 	spin_unlock_irq(&ctx->ctx_lock);
-done:
 	if (mask)
 		__aio_poll_complete(aiocb, mask);
 	return 0;
diff --git a/fs/eventfd.c b/fs/eventfd.c
index ceb1031f1cac..8904b127577b 100644
--- a/fs/eventfd.c
+++ b/fs/eventfd.c
@@ -101,14 +101,6 @@ static int eventfd_release(struct inode *inode, struct=
 file *file)
 	return 0;
 }
 =

-static struct wait_queue_head *
-eventfd_get_poll_head(struct file *file, __poll_t events)
-{
-	struct eventfd_ctx *ctx =3D file->private_data;
-
-	return &ctx->wqh;
-}
-
 static __poll_t eventfd_poll_mask(struct file *file, __poll_t eventmask)
 {
 	struct eventfd_ctx *ctx =3D file->private_data;
@@ -311,7 +303,6 @@ static const struct file_operations eventfd_fops =3D {
 	.show_fdinfo	=3D eventfd_show_fdinfo,
 #endif
 	.release	=3D eventfd_release,
-	.get_poll_head	=3D eventfd_get_poll_head,
 	.poll_mask	=3D eventfd_poll_mask,
 	.read		=3D eventfd_read,
 	.write		=3D eventfd_write,
@@ -390,7 +381,8 @@ EXPORT_SYMBOL_GPL(eventfd_ctx_fileget);
 static int do_eventfd(unsigned int count, int flags)
 {
 	struct eventfd_ctx *ctx;
-	int fd;
+	struct file *file;
+	int fd, error;
 =

 	/* Check the EFD_* constants for consistency.  */
 	BUILD_BUG_ON(EFD_CLOEXEC !=3D O_CLOEXEC);
@@ -408,12 +400,27 @@ static int do_eventfd(unsigned int count, int flags)
 	ctx->count =3D count;
 	ctx->flags =3D flags;
 =

-	fd =3D anon_inode_getfd("[eventfd]", &eventfd_fops, ctx,
+	error =3D get_unused_fd_flags(O_RDWR | (flags & EFD_SHARED_FCNTL_FLAGS));
+	if (error < 0)
+		goto err_free_ctx;
+	fd =3D error;
+
+	file =3D anon_inode_getfile("[eventfd]", &eventfd_fops, ctx,
 			      O_RDWR | (flags & EFD_SHARED_FCNTL_FLAGS));
-	if (fd < 0)
-		eventfd_free_ctx(ctx);
+	if (IS_ERR(file)) {
+		error =3D PTR_ERR(file);
+		goto err_put_unused_fd;
+	}
+	file->f_poll_head =3D &ctx->wqh;
+	fd_install(fd, file);
 =

 	return fd;
+
+err_put_unused_fd:
+	put_unused_fd(fd);
+err_free_ctx:
+	eventfd_free_ctx(ctx);
+	return error;
 }
 =

 SYSCALL_DEFINE2(eventfd2, unsigned int, count, int, flags)
diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index ea4436f409fb..a0d199be91db 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -922,13 +922,6 @@ static __poll_t ep_read_events_proc(struct eventpoll *=
ep, struct list_head *head
 	return 0;
 }
 =

-static struct wait_queue_head *ep_eventpoll_get_poll_head(struct file *fil=
e,
-		__poll_t eventmask)
-{
-	struct eventpoll *ep =3D file->private_data;
-	return &ep->poll_wait;
-}
-
 static __poll_t ep_eventpoll_poll_mask(struct file *file, __poll_t eventma=
sk)
 {
 	struct eventpoll *ep =3D file->private_data;
@@ -972,7 +965,6 @@ static const struct file_operations eventpoll_fops =3D {
 	.show_fdinfo	=3D ep_show_fdinfo,
 #endif
 	.release	=3D ep_eventpoll_release,
-	.get_poll_head	=3D ep_eventpoll_get_poll_head,
 	.poll_mask	=3D ep_eventpoll_poll_mask,
 	.llseek		=3D noop_llseek,
 };
@@ -1973,6 +1965,7 @@ static int do_epoll_create(int flags)
 		goto out_free_fd;
 	}
 	ep->file =3D file;
+	file->f_poll_head =3D &ep->poll_wait;
 	fd_install(fd, file);
 	return fd;
 =

diff --git a/fs/pipe.c b/fs/pipe.c
index bb0840e234f3..6817a60bebc9 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -509,14 +509,6 @@ static long pipe_ioctl(struct file *filp, unsigned int=
 cmd, unsigned long arg)
 	}
 }
 =

-static struct wait_queue_head *
-pipe_get_poll_head(struct file *filp, __poll_t events)
-{
-	struct pipe_inode_info *pipe =3D filp->private_data;
-
-	return &pipe->wait;
-}
-
 /* No kernel lock held - fine */
 static __poll_t pipe_poll_mask(struct file *filp, __poll_t events)
 {
@@ -768,6 +760,7 @@ int create_pipe_files(struct file **res, int flags)
 =

 	f->f_flags =3D O_WRONLY | (flags & (O_NONBLOCK | O_DIRECT));
 	f->private_data =3D inode->i_pipe;
+	f->f_poll_head =3D &inode->i_pipe->wait;
 =

 	res[0] =3D alloc_file(&path, FMODE_READ, &pipefifo_fops);
 	if (IS_ERR(res[0])) {
@@ -778,6 +771,7 @@ int create_pipe_files(struct file **res, int flags)
 	path_get(&path);
 	res[0]->private_data =3D inode->i_pipe;
 	res[0]->f_flags =3D O_RDONLY | (flags & O_NONBLOCK);
+	res[0]->f_poll_head =3D &inode->i_pipe->wait;
 	res[1] =3D f;
 	return 0;
 =

@@ -930,6 +924,7 @@ static int fifo_open(struct inode *inode, struct file *=
filp)
 =

 	/* We can only do regular read/write on fifos */
 	filp->f_mode &=3D (FMODE_READ | FMODE_WRITE);
+	filp->f_poll_head =3D &pipe->wait;
 =

 	switch (filp->f_mode) {
 	case FMODE_READ:
@@ -1023,7 +1018,6 @@ const struct file_operations pipefifo_fops =3D {
 	.llseek		=3D no_llseek,
 	.read_iter	=3D pipe_read,
 	.write_iter	=3D pipe_write,
-	.get_poll_head	=3D pipe_get_poll_head,
 	.poll_mask	=3D pipe_poll_mask,
 	.unlocked_ioctl	=3D pipe_ioctl,
 	.release	=3D pipe_release,
diff --git a/fs/select.c b/fs/select.c
index 317891ff8165..26e20063454a 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -38,20 +38,10 @@ __poll_t vfs_poll(struct file *file, struct poll_table_=
struct *pt)
 {
 	if (file->f_op->poll) {
 		return file->f_op->poll(file, pt);
-	} else if (file_has_poll_mask(file)) {
-		unsigned int events =3D poll_requested_events(pt);
-		struct wait_queue_head *head;
-
-		if (pt && pt->_qproc) {
-			head =3D file->f_op->get_poll_head(file, events);
-			if (!head)
-				return DEFAULT_POLLMASK;
-			if (IS_ERR(head))
-				return EPOLLERR;
-			pt->_qproc(file, head, pt);
-		}
-
-		return file->f_op->poll_mask(file, events);
+	} else if (file->f_poll_head) {
+		if (pt && pt->_qproc)
+			pt->_qproc(file, file->f_poll_head, pt);
+		return file->f_op->poll_mask(file, poll_requested_events(pt));
 	} else {
 		return DEFAULT_POLLMASK;
 	}
diff --git a/fs/timerfd.c b/fs/timerfd.c
index d84a2bee4f82..08e820166c4d 100644
--- a/fs/timerfd.c
+++ b/fs/timerfd.c
@@ -227,14 +227,6 @@ static int timerfd_release(struct inode *inode, struct=
 file *file)
 	return 0;
 }
 	=

-static struct wait_queue_head *timerfd_get_poll_head(struct file *file,
-		__poll_t eventmask)
-{
-	struct timerfd_ctx *ctx =3D file->private_data;
-
-	return &ctx->wqh;
-}
-
 static __poll_t timerfd_poll_mask(struct file *file, __poll_t eventmask)
 {
 	struct timerfd_ctx *ctx =3D file->private_data;
@@ -363,7 +355,6 @@ static long timerfd_ioctl(struct file *file, unsigned i=
nt cmd, unsigned long arg
 =

 static const struct file_operations timerfd_fops =3D {
 	.release	=3D timerfd_release,
-	.get_poll_head	=3D timerfd_get_poll_head,
 	.poll_mask	=3D timerfd_poll_mask,
 	.read		=3D timerfd_read,
 	.llseek		=3D noop_llseek,
@@ -386,8 +377,9 @@ static int timerfd_fget(int fd, struct fd *p)
 =

 SYSCALL_DEFINE2(timerfd_create, int, clockid, int, flags)
 {
-	int ufd;
+	int ufd, error;
 	struct timerfd_ctx *ctx;
+	struct file *file;
 =

 	/* Check the TFD_* constants for consistency.  */
 	BUILD_BUG_ON(TFD_CLOEXEC !=3D O_CLOEXEC);
@@ -424,12 +416,25 @@ SYSCALL_DEFINE2(timerfd_create, int, clockid, int, fl=
ags)
 =

 	ctx->moffs =3D ktime_mono_to_real(0);
 =

-	ufd =3D anon_inode_getfd("[timerfd]", &timerfd_fops, ctx,
+	error =3D get_unused_fd_flags(O_RDWR | (flags & TFD_SHARED_FCNTL_FLAGS));
+	if (error < 0)
+		goto out_free_ctx;
+	ufd =3D error;
+
+	file =3D anon_inode_getfile("[timerfd]", &timerfd_fops, ctx,
 			       O_RDWR | (flags & TFD_SHARED_FCNTL_FLAGS));
-	if (ufd < 0)
-		kfree(ctx);
+	if (IS_ERR(file)) {
+		error =3D PTR_ERR(file);
+		goto err_put_unused_fd;
+	}
+	file->f_poll_head =3D &ctx->wqh;
+	fd_install(ufd, file);
 =

 	return ufd;
+err_put_unused_fd:
+	put_unused_fd(ufd);
+out_free_ctx:
+	return error;
 }
 =

 static int do_timerfd_settime(int ufd, int flags, =

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 5c91108846db..cc0fb83d3743 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -878,6 +878,7 @@ struct file {
 	loff_t			f_pos;
 	struct fown_struct	f_owner;
 	const struct cred	*f_cred;
+	struct wait_queue_head	*f_poll_head;
 	struct file_ra_state	f_ra;
 =

 	u64			f_version;
@@ -1720,7 +1721,6 @@ struct file_operations {
 	int (*iterate) (struct file *, struct dir_context *);
 	int (*iterate_shared) (struct file *, struct dir_context *);
 	__poll_t (*poll) (struct file *, struct poll_table_struct *);
-	struct wait_queue_head * (*get_poll_head)(struct file *, __poll_t);
 	__poll_t (*poll_mask) (struct file *, __poll_t);
 	long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
 	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
diff --git a/include/linux/poll.h b/include/linux/poll.h
index fdf86b4cbc71..e3dd9dfee20a 100644
--- a/include/linux/poll.h
+++ b/include/linux/poll.h
@@ -74,14 +74,9 @@ static inline void init_poll_funcptr(poll_table *pt, pol=
l_queue_proc qproc)
 	pt->_key   =3D ~(__poll_t)0; /* all events enabled */
 }
 =

-static inline bool file_has_poll_mask(struct file *file)
-{
-	return file->f_op->get_poll_head && file->f_op->poll_mask;
-}
-
 static inline bool file_can_poll(struct file *file)
 {
-	return file->f_op->poll || file_has_poll_mask(file);
+	return file->f_op->poll || file->f_poll_head;
 }
 =

 __poll_t vfs_poll(struct file *file, struct poll_table_struct *pt);
diff --git a/net/socket.c b/net/socket.c
index 4354afe8ad96..155d4ba38645 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -117,8 +117,6 @@ static ssize_t sock_write_iter(struct kiocb *iocb, stru=
ct iov_iter *from);
 static int sock_mmap(struct file *file, struct vm_area_struct *vma);
 =

 static int sock_close(struct inode *inode, struct file *file);
-static struct wait_queue_head *sock_get_poll_head(struct file *file,
-		__poll_t events);
 static __poll_t sock_poll_mask(struct file *file, __poll_t);
 static __poll_t sock_poll(struct file *file, struct poll_table_struct *wai=
t);
 static long sock_ioctl(struct file *file, unsigned int cmd, unsigned long =
arg);
@@ -143,7 +141,6 @@ static const struct file_operations socket_file_ops =3D=
 {
 	.llseek =3D	no_llseek,
 	.read_iter =3D	sock_read_iter,
 	.write_iter =3D	sock_write_iter,
-	.get_poll_head =3D sock_get_poll_head,
 	.poll_mask =3D	sock_poll_mask,
 	.poll =3D		sock_poll,
 	.unlocked_ioctl =3D sock_ioctl,
@@ -422,6 +419,8 @@ struct file *sock_alloc_file(struct socket *sock, int f=
lags, const char *dname)
 =

 	sock->file =3D file;
 	file->f_flags =3D O_RDWR | (flags & O_NONBLOCK);
+	if (sock->ops->poll_mask)
+		file->f_poll_head =3D &sock->wq->wait;
 	file->private_data =3D sock;
 	return file;
 }
@@ -1128,16 +1127,6 @@ int sock_create_lite(int family, int type, int proto=
col, struct socket **res)
 }
 EXPORT_SYMBOL(sock_create_lite);
 =

-static struct wait_queue_head *sock_get_poll_head(struct file *file,
-		__poll_t events)
-{
-	struct socket *sock =3D file->private_data;
-
-	if (!sock->ops->poll_mask)
-		return NULL;
-	return &sock->wq->wait;
-}
-
 static __poll_t sock_poll_mask(struct file *file, __poll_t events)
 {
 	struct socket *sock =3D file->private_data;
@@ -1167,7 +1156,7 @@ static __poll_t sock_poll(struct file *file, poll_tab=
le *wait)
 	if (sock->ops->poll) {
 		mask =3D sock->ops->poll(file, sock, wait);
 	} else if (sock->ops->poll_mask) {
-		sock_poll_wait(file, sock_get_poll_head(file, events), wait);
+		sock_poll_wait(file, &sock->wq->wait, wait);
 		mask =3D sock->ops->poll_mask(sock, events);
 	}
 =

-- =

2.17.1


--===============2883027942592090387==--

