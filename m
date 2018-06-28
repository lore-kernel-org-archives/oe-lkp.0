Content-Type: multipart/mixed; boundary="===============5407390690330198991=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: [PATCH 4/6] net: remove busy polling from sock_get_poll_head
Date: Thu, 28 Jun 2018 16:20:57 +0200
Message-ID: <20180628142059.10017-5-hch@lst.de>
In-Reply-To: <20180628142059.10017-1-hch@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5407390690330198991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Busy polling always comes from a synchronous poll context, so for now we
can assume that it calls ->poll if present.  Move the busy polling in
sock_poll to the common block and remove it from sock_get_poll_head to
prepare for the removal of the get_poll_head method.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 net/socket.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index 7cf037d21805..ca300c97b7ba 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -1135,7 +1135,6 @@ static struct wait_queue_head *sock_get_poll_head(str=
uct file *file,
 =

 	if (!sock->ops->poll_mask)
 		return NULL;
-	sock_poll_busy_loop(sock, events);
 	return &sock->wq->wait;
 }
 =

@@ -1161,8 +1160,9 @@ static __poll_t sock_poll(struct file *file, poll_tab=
le *wait)
 	struct socket *sock =3D file->private_data;
 	__poll_t events =3D poll_requested_events(wait), mask =3D 0;
 =

+	sock_poll_busy_loop(sock, events);
+
 	if (sock->ops->poll) {
-		sock_poll_busy_loop(sock, events);
 		mask =3D sock->ops->poll(file, sock, wait);
 	} else if (sock->ops->poll_mask) {
 		sock_poll_wait(file, sock_get_poll_head(file, events), wait);
-- =

2.17.1


--===============5407390690330198991==--

