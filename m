Content-Type: multipart/mixed; boundary="===============7959655585576356754=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v3 02/14] include/linux/nodemask.h: define next_memory_node() if !CONFIG_NUMA
Date: Thu, 20 May 2021 00:53:43 -0600
Message-ID: <20210520065355.2736558-3-yuzhao@google.com>
In-Reply-To: <20210520065355.2736558-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7959655585576356754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently next_memory_node only exists when CONFIG_NUMA=3Dy. This patch
adds the macro for !CONFIG_NUMA.

Signed-off-by: Yu Zhao <yuzhao@google.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
---
 include/linux/nodemask.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index ac398e143c9a..89fe4e3592f9 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -486,6 +486,7 @@ static inline int num_node_state(enum node_states state)
 #define first_online_node	0
 #define first_memory_node	0
 #define next_online_node(nid)	(MAX_NUMNODES)
+#define next_memory_node(nid)	(MAX_NUMNODES)
 #define nr_node_ids		1U
 #define nr_online_nodes		1U
 =

-- =

2.31.1.751.gd2f1c929bd-goog

--===============7959655585576356754==--

