Content-Type: multipart/mixed; boundary="===============0886054782637357994=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v2 02/16] include/linux/nodemask.h: define next_memory_node() if !CONFIG_NUMA
Date: Tue, 13 Apr 2021 00:56:19 -0600
Message-ID: <20210413065633.2782273-3-yuzhao@google.com>
In-Reply-To: <20210413065633.2782273-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0886054782637357994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently next_memory_node only exists when CONFIG_NUMA=3Dy. This patch
adds the macro for !CONFIG_NUMA.

Signed-off-by: Yu Zhao <yuzhao@google.com>
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

2.31.1.295.g9ea45b61b8-goog

--===============0886054782637357994==--

