Content-Type: multipart/mixed; boundary="===============7202045488483989698=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: [PATCH 2/6] net: remove bogus RCU annotations on socket.wq
Date: Thu, 28 Jun 2018 16:20:55 +0200
Message-ID: <20180628142059.10017-3-hch@lst.de>
In-Reply-To: <20180628142059.10017-1-hch@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7202045488483989698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We never use RCU protection for it, just a lot of cargo-cult
rcu_deference_protects calls.

Note that we do keep the kfree_rcu call for it, as the references through
struct sock are RCU protected and thus might require a grace period before
freeing.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/net.h |  2 +-
 include/net/sock.h  |  2 +-
 net/socket.c        | 10 ++++------
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/linux/net.h b/include/linux/net.h
index 08b6eb964dd6..2be0d5368315 100644
--- a/include/linux/net.h
+++ b/include/linux/net.h
@@ -114,7 +114,7 @@ struct socket {
 =

 	unsigned long		flags;
 =

-	struct socket_wq __rcu	*wq;
+	struct socket_wq	*wq;
 =

 	struct file		*file;
 	struct sock		*sk;
diff --git a/include/net/sock.h b/include/net/sock.h
index b3b75419eafe..ad85d37c83c8 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1725,7 +1725,7 @@ static inline void sock_graft(struct sock *sk, struct=
 socket *parent)
 {
 	WARN_ON(parent->sk);
 	write_lock_bh(&sk->sk_callback_lock);
-	sk->sk_wq =3D parent->wq;
+	rcu_assign_pointer(sk->sk_wq, parent->wq);
 	parent->sk =3D sk;
 	sk_set_socket(sk, parent);
 	sk->sk_uid =3D SOCK_INODE(parent)->i_uid;
diff --git a/net/socket.c b/net/socket.c
index 0f397fa33614..fe6620607b07 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -255,7 +255,7 @@ static struct inode *sock_alloc_inode(struct super_bloc=
k *sb)
 	init_waitqueue_head(&wq->wait);
 	wq->fasync_list =3D NULL;
 	wq->flags =3D 0;
-	RCU_INIT_POINTER(ei->socket.wq, wq);
+	ei->socket.wq =3D wq;
 =

 	ei->socket.state =3D SS_UNCONNECTED;
 	ei->socket.flags =3D 0;
@@ -269,11 +269,9 @@ static struct inode *sock_alloc_inode(struct super_blo=
ck *sb)
 static void sock_destroy_inode(struct inode *inode)
 {
 	struct socket_alloc *ei;
-	struct socket_wq *wq;
 =

 	ei =3D container_of(inode, struct socket_alloc, vfs_inode);
-	wq =3D rcu_dereference_protected(ei->socket.wq, 1);
-	kfree_rcu(wq, rcu);
+	kfree_rcu(ei->socket.wq, rcu);
 	kmem_cache_free(sock_inode_cachep, ei);
 }
 =

@@ -607,7 +605,7 @@ static void __sock_release(struct socket *sock, struct =
inode *inode)
 		module_put(owner);
 	}
 =

-	if (rcu_dereference_protected(sock->wq, 1)->fasync_list)
+	if (sock->wq->fasync_list)
 		pr_err("%s: fasync list not empty!\n", __func__);
 =

 	if (!sock->file) {
@@ -1211,7 +1209,7 @@ static int sock_fasync(int fd, struct file *filp, int=
 on)
 		return -EINVAL;
 =

 	lock_sock(sk);
-	wq =3D rcu_dereference_protected(sock->wq, lockdep_sock_is_held(sk));
+	wq =3D sock->wq;
 	fasync_helper(fd, filp, on, &wq->fasync_list);
 =

 	if (!wq->fasync_list)
-- =

2.17.1


--===============7202045488483989698==--

