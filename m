Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950201C16
	for <oe-lkp@lists.linux.dev>; Fri,  2 Dec 2022 08:50:34 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0BC3C1FE16;
	Fri,  2 Dec 2022 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669971027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LZIm84O2bOoJ4U2lQJhS8k8kVVfk2BSguwHQiEl9M5c=;
	b=bUk3okfzs0YoxvvN5f+8+xRn5zpW4Gi8OmvjTDMX8cYsCbH0Vu7ctaHt/1juowu6cw8hR5
	11ok1o+tPH4vwlJ/kIIWjQScvYCPvPQjQdw8BoPTom8tZJMJ0GlXr0gWN8dICTztWxDfKY
	tz0fTw31190RQHEkhH9cA3w4QatgETI=
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E0DC9133DE;
	Fri,  2 Dec 2022 08:50:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA
	id c4f6M1K8iWMiMgAAGKfGzw
	(envelope-from <mhocko@suse.com>); Fri, 02 Dec 2022 08:50:26 +0000
Date: Fri, 2 Dec 2022 09:50:26 +0100
From: Michal Hocko <mhocko@suse.com>
To: kernel test robot <yujie.liu@intel.com>
Cc: Shakeel Butt <shakeelb@google.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Andrew Morton <akpm@linux-foundation.org>,
	kernel test robot <oliver.sang@intel.com>,
	Soheil Hassas Yeganeh <soheil@google.com>,
	Feng Tang <feng.tang@intel.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Eric Dumazet <edumazet@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kselftests: cgroup: update kmem test precision tolerance
Message-ID: <Y4m8Unt6FhWKC6IH@dhcp22.suse.cz>
References: <202212010958.c1053bd3-yujie.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212010958.c1053bd3-yujie.liu@intel.com>

OK, so this is a full patch to fix this
--- 
From 7f338ed952ba4a100822004bc8399bf720b42899 Mon Sep 17 00:00:00 2001
From: Michal Hocko <mhocko@suse.com>
Date: Fri, 2 Dec 2022 09:45:29 +0100
Subject: [PATCH] kselftests: cgroup: update kmem test precision tolerance

1813e51eece0 ("memcg: increase MEMCG_CHARGE_BATCH to 64") has changed
the batch size while this test case has been left behind. This has led
to a test failure reported by test bot:
not ok 2 selftests: cgroup: test_kmem # exit=1

Update the tolerance for the pcp charges to reflect the
MEMCG_CHARGE_BATCH change to fix this.

Reported-by: kernel test robot <yujie.liu@intel.com>
Link: https://lore.kernel.org/oe-lkp/202212010958.c1053bd3-yujie.liu@intel.com
Signed-off-by: Michal Hocko <mhocko@suse.com>
---
 tools/testing/selftests/cgroup/test_kmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_kmem.c b/tools/testing/selftests/cgroup/test_kmem.c
index 22b31ebb3513..1d073e28254b 100644
--- a/tools/testing/selftests/cgroup/test_kmem.c
+++ b/tools/testing/selftests/cgroup/test_kmem.c
@@ -24,7 +24,7 @@
  * the maximum discrepancy between charge and vmstat entries is number
  * of cpus multiplied by 32 pages.
  */
-#define MAX_VMSTAT_ERROR (4096 * 32 * get_nprocs())
+#define MAX_VMSTAT_ERROR (4096 * 64 * get_nprocs())
 
 
 static int alloc_dcache(const char *cgroup, void *arg)
-- 
2.30.2

-- 
Michal Hocko
SUSE Labs
