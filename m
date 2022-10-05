Content-Type: multipart/mixed; boundary="===============0316538093881604825=="
MIME-Version: 1.0
From: Alexey Gladkov <legion@kernel.org>
To: lkp@lists.01.org
Subject: [PATCH] sysctl: Fix mq permission check
Date: Wed, 05 Oct 2022 19:07:30 +0200
Message-ID: <20221005170730.835761-1-legion@kernel.org>
In-Reply-To: <202210052100.86dbb00a-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0316538093881604825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kernel test robot found a typo that causes mq_permissions() to return a
useless value.

Reported-by: kernel test robot <yujie.liu@intel.com>
Link: https://lore.kernel.org/r/202210052100.86dbb00a-yujie.liu(a)intel.com
Fixes: 7608b6a72ed0 ("sysctl: Allow to change limits for posix messages que=
ues")
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 ipc/mq_sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipc/mq_sysctl.c b/ipc/mq_sysctl.c
index ff1054fbbacc..ce03930aced5 100644
--- a/ipc/mq_sysctl.c
+++ b/ipc/mq_sysctl.c
@@ -102,7 +102,7 @@ static int mq_permissions(struct ctl_table_header *head=
, struct ctl_table *table
 	if (uid_eq(current_euid(), ns_root_uid))
 		mode >>=3D 6;
 =

-	if (in_egroup_p(ns_root_gid))
+	else if (in_egroup_p(ns_root_gid))
 		mode >>=3D 3;
 =

 	mode &=3D 7;
-- =

2.33.4

--===============0316538093881604825==--

