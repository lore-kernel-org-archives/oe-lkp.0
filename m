Content-Type: multipart/mixed; boundary="===============3366449079139302895=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: [PATCH 1/6] net: remove sock_poll_busy_flag
Date: Thu, 28 Jun 2018 16:20:54 +0200
Message-ID: <20180628142059.10017-2-hch@lst.de>
In-Reply-To: <20180628142059.10017-1-hch@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3366449079139302895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Can simplify be inlined into the only caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/busy_poll.h | 6 ------
 net/socket.c            | 5 ++++-
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/net/busy_poll.h b/include/net/busy_poll.h
index c5187438af38..4a459a0d70d1 100644
--- a/include/net/busy_poll.h
+++ b/include/net/busy_poll.h
@@ -130,12 +130,6 @@ static inline void sock_poll_busy_loop(struct socket *=
sock, __poll_t events)
 	}
 }
 =

-/* if this socket can poll_ll, tell the system call */
-static inline __poll_t sock_poll_busy_flag(struct socket *sock)
-{
-	return sk_can_busy_loop(sock->sk) ? POLL_BUSY_LOOP : 0;
-}
-
 /* used in the NIC receive handler to mark the skb */
 static inline void skb_mark_napi_id(struct sk_buff *skb,
 				    struct napi_struct *napi)
diff --git a/net/socket.c b/net/socket.c
index 8a109012608a..0f397fa33614 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -1171,7 +1171,10 @@ static __poll_t sock_poll(struct file *file, poll_ta=
ble *wait)
 		mask =3D sock->ops->poll_mask(sock, events);
 	}
 =

-	return mask | sock_poll_busy_flag(sock);
+	/* this socket can poll_ll so tell the system call */
+	if (sk_can_busy_loop(sock->sk))
+		mask |=3D POLL_BUSY_LOOP;
+	return mask;
 }
 =

 static int sock_mmap(struct file *file, struct vm_area_struct *vma)
-- =

2.17.1


--===============3366449079139302895==--

