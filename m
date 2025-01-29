Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CA33997;
	Wed, 29 Jan 2025 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166380; cv=none; b=ughcYATkbXP8mvmf7eWLYo03HndDOW6O5cezEb2ZNevyByLlbPLReGaGgGLfZKaeD/7qiTL9gRysBWB3g3E6LZu5nNThVjDY8xzaNnDAtxNDDRb/glE2hzvj/BJBSZ8rGoP0fY6XnVKyoMxvKGAiBBDq01voPcbROAMBlBhMO5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166380; c=relaxed/simple;
	bh=/UBN3rWpoVO98L6KhnzMyn+L9gNWxHD8PwnRrdoDIr8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CqDChF8fx1UXLBJxA5A23GbjFP+pn+vLdg3+8US5x5cVWyGVo7v9t/fNLD7WpZw/u6iCuyNgR8sXgY97j9mTVJPCf/Xt6zg0MsZ5jA+PnlRUGU7tvw8i8Shqnx0HD+glSPLz1rw74awvBhztYipWGZ3aYuKwlyF6XDiJY0MXHro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from [2601:18c:8180:83cc:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tdATJ-000000008KM-0fL1;
	Wed, 29 Jan 2025 10:59:21 -0500
Date: Wed, 29 Jan 2025 10:59:20 -0500
From: Rik van Riel <riel@surriel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Peter Zijlstra <peterz@infradead.org>, David Hildenbrand
 <david@redhat.com>, kernel test robot <oliver.sang@intel.com>,
 oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, David Rientjes <rientjes@google.com>,
 Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>,
 Mel Gorman <mgorman@suse.de>, Muchun Song <muchun.song@linux.dev>, Peter Xu
 <peterx@redhat.com>, Will Deacon <will@kernel.org>, Zach O'Keefe
 <zokeefe@google.com>, Dan Carpenter <dan.carpenter@linaro.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
Message-ID: <20250129105920.7a4bffa1@fangorn>
In-Reply-To: <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
References: <202501281734.d408a35b-lkp@intel.com>
	<46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
	<20250128113100.GB7145@noisy.programming.kicks-ass.net>
	<2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
	<20250128132847.GB505@noisy.programming.kicks-ass.net>
	<18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
	<8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
	<2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
	<14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: riel@surriel.com

On Wed, 29 Jan 2025 16:14:01 +0800
Qi Zheng <zhengqi.arch@bytedance.com> wrote:

>
> It seems that the pcp lock is held when doing tlb_remove_table_rcu(), so
> trylock fails, then bypassing PCP and calling free_one_page() directly,
> which leads to the hot spot of zone lock.

Below is a tentative fix for the issue. It is kind of a big hammer,
and maybe the RCU people have a better idea on how to solve this
problem, but it may be worth giving this a try to see if it helps
with the regression you identified.

---8<---

=46rom 2b0302f821d1fc94c968ac533dcc62b9ffe00c38 Mon Sep 17 00:00:00 2001
From: Rik van Riel <riel@surriel.com>
Date: Wed, 29 Jan 2025 10:51:51 -0500
Subject: [PATCH 2/2] mm,rcu: prevent RCU callbacks from running with pcp lo=
ck
 held

Enabling MMU_GATHER_RCU_TABLE_FREE can create contention on the
zone->lock.  This turns out to be because in some configurations
RCU callbacks are called when IRQs are re-enabled inside
rmqueue_bulk, while the CPU is still holding the per-cpu pages lock.

That results in the RCU callbacks being unable to grab the
PCP lock, and taking the slow path with the zone->lock for
each item freed.

Speed things up by blocking RCU callbacks while holding the
PCP lock.

Signed-off-by: Rik van Riel <riel@surriel.com>
Reported-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/page_alloc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 6e469c7ef9a4..b3c4002ab0ab 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3036,6 +3036,13 @@ static struct page *rmqueue_pcplist(struct zone *pre=
ferred_zone,
 		return NULL;
 	}
=20
+	/*
+	 * Prevent RCU callbacks from being run from the spin_lock_irqrestore
+	 * inside rmqueue_bulk, while the pcp lock is held; that would result
+	 * in each RCU free taking the zone->lock, which can be very slow.
+	 */
+	rcu_read_lock();
+
 	/*
 	 * On allocation, reduce the number of pages that are batch freed.
 	 * See nr_pcp_free() where free_factor is increased for subsequent
@@ -3046,6 +3053,7 @@ static struct page *rmqueue_pcplist(struct zone *pref=
erred_zone,
 	page =3D __rmqueue_pcplist(zone, order, migratetype, alloc_flags, pcp, li=
st);
 	pcp_spin_unlock(pcp);
 	pcp_trylock_finish(UP_flags);
+	rcu_read_unlock();
 	if (page) {
 		__count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
 		zone_statistics(preferred_zone, zone, 1);
--=20
2.47.1

