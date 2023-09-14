Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn [202.108.3.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908E5250FD
	for <oe-lkp@lists.linux.dev>; Thu, 14 Sep 2023 05:58:41 +0000 (UTC)
X-SMAIL-HELO: pek-lxu-l1.wrs.com
Received: from unknown (HELO pek-lxu-l1.wrs.com)([111.198.228.56])
	by sina.com (172.16.97.23) with ESMTP
	id 65029FC9000216F9; Thu, 14 Sep 2023 13:53:14 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 59030431458597
X-SMAIL-UIID: 6CA756EA4A77410D88DFC3554C509A18-20230914-135314-1
From: Edward AD <eadavis@sina.com>
To: oliver.sang@intel.com
Cc: akpm@linux-foundation.org,
	eadavis@sina.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lkp@intel.com,
	ltp@lists.linux.it,
	oe-lkp@lists.linux.dev,
	syzbot+b591856e0f0139f83023@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] mm: extpand queue_pages_range() to find and lock the vma range
Date: Thu, 14 Sep 2023 13:53:13 +0800
Message-ID: <20230914055313.151192-1-eadavis@sina.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <202309121302.8864096c-oliver.sang@intel.com>
References: <202309121302.8864096c-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using for_each_vma_range to find vmas, and not only inside locking, but also 
outside locking to ensure that vma_start_write are performed.

Reported-and-tested-by: syzbot+b591856e0f0139f83023@syzkaller.appspotmail.com
Signed-off-by: Edward AD <eadavis@sina.com>
---
 mm/pagewalk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index b7d7e4fcfad7..b31d59a27f57 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -479,6 +479,7 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
 		.mm		= mm,
 		.private	= private,
 	};
+	struct vma_iterator vmi;
 
 	if (start >= end)
 		return -EINVAL;
@@ -488,8 +489,9 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
 
 	process_mm_walk_lock(walk.mm, ops->walk_lock);
 
-	vma = find_vma(walk.mm, start);
-	do {
+	vma_iter_init(&vmi, walk.mm, start);
+	for_each_vma_range(vmi, vma, end) {
+		process_vma_walk_lock(vma, ops->walk_lock);
 		if (!vma) { /* after the last vma */
 			walk.vma = NULL;
 			next = end;
@@ -501,10 +503,8 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
 			if (ops->pte_hole)
 				err = ops->pte_hole(start, next, -1, &walk);
 		} else { /* inside vma */
-			process_vma_walk_lock(vma, ops->walk_lock);
 			walk.vma = vma;
 			next = min(end, vma->vm_end);
-			vma = find_vma(mm, vma->vm_end);
 
 			err = walk_page_test(start, next, &walk);
 			if (err > 0) {
@@ -522,7 +522,7 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
 		}
 		if (err)
 			break;
-	} while (start = next, start < end);
+	};
 	return err;
 }
 
-- 
2.25.1

