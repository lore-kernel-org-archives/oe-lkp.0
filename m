Content-Type: multipart/mixed; boundary="===============1629923717623982534=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v3 01/14] include/linux/memcontrol.h: do not warn in page_memcg_rcu() if !CONFIG_MEMCG
Date: Thu, 20 May 2021 00:53:42 -0600
Message-ID: <20210520065355.2736558-2-yuzhao@google.com>
In-Reply-To: <20210520065355.2736558-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1629923717623982534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

page_memcg_rcu() warns on !rcu_read_lock_held() regardless of
CONFIG_MEMCG. The following legit code trips the warning when
!CONFIG_MEMCG, since lock_page_memcg() and unlock_page_memcg() are
empty for this config.

  memcg =3D lock_page_memcg(page1)
    (rcu_read_lock() if CONFIG_MEMCG=3Dy)

  do something to page1

  if (page_memcg_rcu(page2) =3D=3D memcg)
    do something to page2 too as it cannot be migrated away from the
    memcg either.

  unlock_page_memcg(page1)
    (rcu_read_unlock() if CONFIG_MEMCG=3Dy)

Locking/unlocking rcu consistently for both configs is rigorous but it
also forces unnecessary locking upon users who have no interest in
CONFIG_MEMCG.

This patch removes the assertion for !CONFIG_MEMCG, because
page_memcg_rcu() has a few callers and there are no concerns regarding
their correctness at the moment.

Signed-off-by: Yu Zhao <yuzhao@google.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
---
 include/linux/memcontrol.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index c193be760709..6bcac3d91dd1 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1131,7 +1131,6 @@ static inline struct mem_cgroup *page_memcg(struct pa=
ge *page)
 =

 static inline struct mem_cgroup *page_memcg_rcu(struct page *page)
 {
-	WARN_ON_ONCE(!rcu_read_lock_held());
 	return NULL;
 }
 =

-- =

2.31.1.751.gd2f1c929bd-goog

--===============1629923717623982534==--

