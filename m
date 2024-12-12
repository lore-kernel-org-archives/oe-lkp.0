Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA572F50
	for <oe-lkp@lists.linux.dev>; Thu, 12 Dec 2024 04:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733976267; cv=none; b=d0Jd0xa2YXvb6PohqMdtZi1azpoJ8KSNFjUh8A5U7LZtrrwvKFeIsER17ZFuaZM+Col5j2bnZKICdviogDx3hY12EMV3Hy4OjlK0rcpQ2yJmXFgzlI002XohgFjetWdzRnTGFhWdv7Uner4uBLzlOLl3xMuQBjvW74Ecl4/UtVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733976267; c=relaxed/simple;
	bh=9qrj+5UBBMO1AYeXDcm4vjAebLLX3t6+QsLL3o428rs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C8guoZBX9WWSQ7YJfOj/aPNQsOXNhKNyxwVRVQOCMW/RjydydMVg/GajO/kRncZKvLl5jfJOsJYkjt03a3BMJ/W8rbeRwM7du794NIVnUOMQIm6tjTMwhC6U2m/y2k3Fj74AakTt7NYJUZwKi6tid5ij51+1Rn88/0I9WT1aJi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kmq6t/PY; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kmq6t/PY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NISGI
	FQ99jxLIPdLWNb92see1Jj4Nxu/t+MRtsryHa8=; b=kmq6t/PYPITh7s39rMDDY
	SU5sxVMP4JTbAtorTdPT63bba1XjfQbsF00WyEjWvAGFlO1tMgYQJzeCC/KyzDoG
	Dm9WxTuhw+mRi/7aTrR+rKIloNipcJCw/llhopAlvVNbp9SMvJxUSo/Wtcm64C22
	uDqYk8v5t9GpDOrcMZ+sgM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3HzQCYFpnKtQfAA--.12556S4;
	Thu, 12 Dec 2024 12:01:28 +0800 (CST)
From: David Wang <00107082@163.com>
To: surenb@google.com,
	kent.overstreet@linux.dev
Cc: yuzhao@google.com,
	oliver.sang@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	David Wang <00107082@163.com>
Subject: [PATCH] mm/codetag: clear tags before swap
Date: Thu, 12 Dec 2024 12:01:04 +0800
Message-Id: <20241212040104.507310-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202412112227.df61ebb-lkp@intel.com>
References: <202412112227.df61ebb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3HzQCYFpnKtQfAA--.12556S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Wry3Zw4rJw1xWFyxGFWruFg_yoW8CFW7pr
	4UWr1UGa95Jry7CrWvgw12vr15Xw45t3W5GFWY9as5ZryYyr47Gr4kWFy2qFnrZFWkGF4I
	yrnFgrWIk3WUJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGjg7UUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hizqmdaUlMGXgABs2

When CONFIG_MEM_ALLOC_PROFILING_DEBUG is set, kernel WARN would be
triggered when calling __alloc_tag_ref_set() during swap:

	alloc_tag was not cleared (got tag for mm/filemap.c:1951)
	WARNING: CPU: 0 PID: 816 at ./include/linux/alloc_tag.h...

Clear code tags before swap can fix the warning. And this patch also fix
a potential invalid address dereference in alloc_tag_add_check() when
CONFIG_MEM_ALLOC_PROFILING_DEBUG is set and ref->ct is CODETAG_EMPTY,
which is defined as ((void *)1).

Signed-off-by: David Wang <00107082@163.com>
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202412112227.df61ebb-lkp@intel.com
---
 include/linux/alloc_tag.h | 2 +-
 lib/alloc_tag.c           | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
index 7c0786bdf9af..cba024bf2db3 100644
--- a/include/linux/alloc_tag.h
+++ b/include/linux/alloc_tag.h
@@ -135,7 +135,7 @@ static inline struct alloc_tag_counters alloc_tag_read(struct alloc_tag *tag)
 #ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
 static inline void alloc_tag_add_check(union codetag_ref *ref, struct alloc_tag *tag)
 {
-	WARN_ONCE(ref && ref->ct,
+	WARN_ONCE(ref && ref->ct && !is_codetag_empty(ref),
 		  "alloc_tag was not cleared (got tag for %s:%u)\n",
 		  ref->ct->filename, ref->ct->lineno);
 
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 35f7560a309a..cc5fda9901c2 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -209,6 +209,10 @@ void pgalloc_tag_swap(struct folio *new, struct folio *old)
 		return;
 	}
 
+	/* clear tags before swap */
+	set_codetag_empty(&ref_old);
+	set_codetag_empty(&ref_new);
+
 	/* swap tags */
 	__alloc_tag_ref_set(&ref_old, tag_new);
 	update_page_tag_ref(handle_old, &ref_old);
-- 
2.39.2

