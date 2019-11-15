Content-Type: multipart/mixed; boundary="===============3533640603941782312=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [pipe] d60337eff1: BUG:kernel_NULL_pointer_dereference, address
Date: Fri, 15 Nov 2019 16:22:26 +0000
Message-ID: <6853.1573834946@warthog.procyon.org.uk>
In-Reply-To: <9279.1573824532@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3533640603941782312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Actually, no, this is the fix:

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 7006b5b2106d..be2fc5793ddd 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -537,7 +537,7 @@ static size_t push_pipe(struct iov_iter *i, size_t size,
 		buf->ops =3D &default_pipe_buf_ops;
 		buf->page =3D page;
 		buf->offset =3D 0;
-		buf->len =3D max_t(ssize_t, left, PAGE_SIZE);
+		buf->len =3D min_t(ssize_t, left, PAGE_SIZE);
 		left -=3D buf->len;
 		iter_head++;
 		pipe->head =3D iter_head;

David

--===============3533640603941782312==--

