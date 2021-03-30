Content-Type: multipart/mixed; boundary="===============0738114022953340395=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: [PATCH mmotm] mm: vmscan: fix shrinker_rwsem in free_shrinker_info()
Date: Tue, 30 Mar 2021 16:44:05 -0700
Message-ID: <alpine.LSU.2.11.2103301640240.2584@eggly.anvils>
List-Id: <oe-lkp.lists.linux.dev>

--===============0738114022953340395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Lockdep warns mm/vmscan.c: suspicious rcu_dereference_protected() usage!
when free_shrinker_info() is called from mem_cgroup_css_free(): there it
is called with no locking, whereas alloc_shrinker_info() calls it with
down_write of shrinker_rwsem - which seems appropriate.  Rearrange that
so free_shrinker_info() can manage the shrinker_rwsem for itself.

Link: https://lkml.kernel.org/r/20210317140615.GB28839(a)xsang-OptiPlex-9020
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Hugh Dickins <hughd@google.com>
Cc: Yang Shi <shy828301@gmail.com>
---
Sorry, I've made no attempt to work out precisely where in the series
the locking went missing, nor tried to fit this in as a fix on top of
mm-vmscan-add-shrinker_info_protected-helper.patch
which Oliver reported (and which you notated in mmotm's "series" file).
This patch just adds the fix to the end of the series, after
mm-vmscan-shrink-deferred-objects-proportional-to-priority.patch

 mm/vmscan.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- mmotm/mm/vmscan.c	2021-03-28 17:26:54.935553064 -0700
+++ linux/mm/vmscan.c	2021-03-30 15:55:13.374459559 -0700
@@ -249,18 +249,20 @@ void free_shrinker_info(struct mem_cgrou
 	struct shrinker_info *info;
 	int nid;
 =

+	down_write(&shrinker_rwsem);
 	for_each_node(nid) {
 		pn =3D memcg->nodeinfo[nid];
 		info =3D shrinker_info_protected(memcg, nid);
 		kvfree(info);
 		rcu_assign_pointer(pn->shrinker_info, NULL);
 	}
+	up_write(&shrinker_rwsem);
 }
 =

 int alloc_shrinker_info(struct mem_cgroup *memcg)
 {
 	struct shrinker_info *info;
-	int nid, size, ret =3D 0;
+	int nid, size;
 	int map_size, defer_size =3D 0;
 =

 	down_write(&shrinker_rwsem);
@@ -270,9 +272,9 @@ int alloc_shrinker_info(struct mem_cgrou
 	for_each_node(nid) {
 		info =3D kvzalloc_node(sizeof(*info) + size, GFP_KERNEL, nid);
 		if (!info) {
+			up_write(&shrinker_rwsem);
 			free_shrinker_info(memcg);
-			ret =3D -ENOMEM;
-			break;
+			return -ENOMEM;
 		}
 		info->nr_deferred =3D (atomic_long_t *)(info + 1);
 		info->map =3D (void *)info->nr_deferred + defer_size;
@@ -280,7 +282,7 @@ int alloc_shrinker_info(struct mem_cgrou
 	}
 	up_write(&shrinker_rwsem);
 =

-	return ret;
+	return 0;
 }
 =

 static inline bool need_expand(int nr_max)
--===============0738114022953340395==--

