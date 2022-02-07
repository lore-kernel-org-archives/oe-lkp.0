Content-Type: multipart/mixed; boundary="===============5437529347527495096=="
MIME-Version: 1.0
From: Usama Arif <usama.arif@bytedance.com>
To: lkp@lists.01.org
Subject: [PATCH] io_uring: unregister eventfd while holding lock when freeing ring ctx
Date: Mon, 07 Feb 2022 10:50:40 +0000
Message-ID: <20220207105040.2662467-1-usama.arif@bytedance.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5437529347527495096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is because ctx->io_ev_fd is rcu_dereference_protected using
ctx->uring_lock in io_eventfd_unregister. Not locking the function
resulted in suspicious RCU usage reported by kernel test robot.

Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Usama Arif <usama.arif@bytedance.com>
---
 fs/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index ad8f84376955..dbc9d3f3f6c5 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -9471,8 +9471,8 @@ static __cold void io_ring_ctx_free(struct io_ring_ct=
x *ctx)
 		__io_sqe_files_unregister(ctx);
 	if (ctx->rings)
 		__io_cqring_overflow_flush(ctx, true);
-	mutex_unlock(&ctx->uring_lock);
 	io_eventfd_unregister(ctx);
+	mutex_unlock(&ctx->uring_lock);
 	io_destroy_buffers(ctx);
 	if (ctx->sq_creds)
 		put_cred(ctx->sq_creds);
-- =

2.25.1

--===============5437529347527495096==--

