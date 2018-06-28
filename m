Content-Type: multipart/mixed; boundary="===============5637412672524898136=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: [PATCH 5/6] net: remove sock_poll_busy_loop
Date: Thu, 28 Jun 2018 16:20:58 +0200
Message-ID: <20180628142059.10017-6-hch@lst.de>
In-Reply-To: <20180628142059.10017-1-hch@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5637412672524898136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There is no point in hiding this logic in a helper.  Also remove the
useless events !=3D 0 check, and reorder the remaining ones so that the
cheaper test comes first.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/busy_poll.h | 9 ---------
 net/socket.c            | 4 +++-
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/include/net/busy_poll.h b/include/net/busy_poll.h
index 4a459a0d70d1..71c72a939bf8 100644
--- a/include/net/busy_poll.h
+++ b/include/net/busy_poll.h
@@ -121,15 +121,6 @@ static inline void sk_busy_loop(struct sock *sk, int n=
onblock)
 #endif
 }
 =

-static inline void sock_poll_busy_loop(struct socket *sock, __poll_t event=
s)
-{
-	if (sk_can_busy_loop(sock->sk) &&
-	    events && (events & POLL_BUSY_LOOP)) {
-		/* once, only if requested by syscall */
-		sk_busy_loop(sock->sk, 1);
-	}
-}
-
 /* used in the NIC receive handler to mark the skb */
 static inline void skb_mark_napi_id(struct sk_buff *skb,
 				    struct napi_struct *napi)
diff --git a/net/socket.c b/net/socket.c
index ca300c97b7ba..4354afe8ad96 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -1160,7 +1160,9 @@ static __poll_t sock_poll(struct file *file, poll_tab=
le *wait)
 	struct socket *sock =3D file->private_data;
 	__poll_t events =3D poll_requested_events(wait), mask =3D 0;
 =

-	sock_poll_busy_loop(sock, events);
+	/* poll once if requested by the syscall */
+	if ((events & POLL_BUSY_LOOP) && sk_can_busy_loop(sock->sk))
+		sk_busy_loop(sock->sk, 1);
 =

 	if (sock->ops->poll) {
 		mask =3D sock->ops->poll(file, sock, wait);
-- =

2.17.1


--===============5637412672524898136==--

