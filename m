Content-Type: multipart/mixed; boundary="===============7462991071792398199=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: [PATCH 3/6] net: don't detour through struct to find the poll head
Date: Thu, 28 Jun 2018 16:20:56 +0200
Message-ID: <20180628142059.10017-4-hch@lst.de>
In-Reply-To: <20180628142059.10017-1-hch@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7462991071792398199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As far as I can tell sock->sk->sk_wq->wait will always point to
sock->wq->wait.  That means we can do the shorter dereference and
not worry about any RCU protection.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 net/socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/socket.c b/net/socket.c
index fe6620607b07..7cf037d21805 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -1136,7 +1136,7 @@ static struct wait_queue_head *sock_get_poll_head(str=
uct file *file,
 	if (!sock->ops->poll_mask)
 		return NULL;
 	sock_poll_busy_loop(sock, events);
-	return sk_sleep(sock->sk);
+	return &sock->wq->wait;
 }
 =

 static __poll_t sock_poll_mask(struct file *file, __poll_t events)
-- =

2.17.1


--===============7462991071792398199==--

