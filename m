Content-Type: multipart/mixed; boundary="===============2768919706919177025=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: lkp@lists.01.org
Subject: [PATCH] loop: Use pr_warn_once() for loop_control_remove() warning
Date: Mon, 29 Nov 2021 19:00:43 +0900
Message-ID: <61075324-0eb4-3547-1106-92320fabf616@i-love.sakura.ne.jp>
In-Reply-To: <20211129073709.GA18483@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2768919706919177025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot reported that RCU stall via printk() flooding is
possible [1] when stress testing.

Link: https://lkml.kernel.org/r/20211129073709.GA18483(a)xsang-OptiPlex-902=
0 [1]
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/block/loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index a154cab6cd98..c3a36cfaa855 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -2103,7 +2103,7 @@ static int loop_control_remove(int idx)
 	int ret;
 =

 	if (idx < 0) {
-		pr_warn("deleting an unspecified loop device is not supported.\n");
+		pr_warn_once("deleting an unspecified loop device is not supported.\n");
 		return -EINVAL;
 	}
 		=

-- =

2.18.4


--===============2768919706919177025==--

