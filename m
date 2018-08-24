Content-Type: multipart/mixed; boundary="===============7163672605315479550=="
MIME-Version: 1.0
From: Davidlohr Bueso <dave@stgolabs.net>
To: lkp@lists.01.org
Subject: [PATCH] ipc/shm: properly return EIDRM in shm_lock()
Date: Thu, 23 Aug 2018 20:09:20 -0700
Message-ID: <20180824030920.GD3677@linux-r8p5>
In-Reply-To: <20180823041434.GC3677@linux-r8p5>
List-Id: <oe-lkp.lists.linux.dev>

--===============7163672605315479550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When getting rid of the general ipc_lock(), this was missed
furthermore, making the comment around the ipc object validity
check bogus. Under EIDRM conditions, callers will in turn not
see the error and continue with the operation.

Fixes: 82061c57ce9 (ipc: drop ipc_lock())
Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 ipc/shm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ipc/shm.c b/ipc/shm.c
index b0eb3757ab89..4cd402e4cfeb 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -199,6 +199,7 @@ static inline struct shmid_kernel *shm_lock(struct ipc_=
namespace *ns, int id)
 	}
 =

 	ipc_unlock_object(ipcp);
+	ipcp =3D ERR_PTR(-EIDRM);
 err:
 	rcu_read_unlock();
 	/*
-- =

2.16.4


--===============7163672605315479550==--

