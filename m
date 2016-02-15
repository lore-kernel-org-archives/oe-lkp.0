Content-Type: multipart/mixed; boundary="===============1531823112329661457=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] af097cab1b: EIP is at vprintk_emit+0xab2/0xb5c
Date: Mon, 15 Feb 2016 22:20:34 +0900
Message-ID: <20160215132034.GA447@swordfish>
In-Reply-To: <87vb5qd9yu.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1531823112329661457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/15/16 09:43), kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux Sergey-Senozhatsky/printk-move-can_use_c=
onsole-out-of-console_trylock_for_printk/20160213-024210
> commit af097cab1b878d5be746be8bcaa9a79986716c41 ("printk: set may_schedul=
e for some of console_trylock callers")


Hello,
thanks for reporting,

any chance you can test the patch below?

---

 kernel/printk/printk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 9917f69..7268a40 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2208,7 +2208,7 @@ void console_unlock(void)
 	static u64 seen_seq;
 	unsigned long flags;
 	bool wake_klogd =3D false;
-	bool do_cond_resched, retry;
+	bool do_cond_resched, retry =3D false;
 =

 	if (console_suspended) {
 		up_console_sem();
@@ -2241,7 +2241,8 @@ again:
 	}
 =

 	/* flush buffered message fragment immediately to console */
-	console_cont_flush(text, sizeof(text));
+	if (!retry)
+		console_cont_flush(text, sizeof(text));
 =

 	for (;;) {
 		struct printk_log *msg;


--===============1531823112329661457==--

