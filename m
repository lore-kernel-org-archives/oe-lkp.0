Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3FE1E0DD6;
	Wed, 29 Jan 2025 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169641; cv=none; b=qB7Pq7A/QQfTyY8nxjCpRSIi26dCwGopn3F7hhgoDYlQFt5vlf4OeG5GZYOYyPIxMP5OQalcv4UTqD5Tr72nBpOfdZhSPzEsq3HsON9MzypzYn7ML4wdPDvcFeabBTNwFt+lHPQuLKIqw5hTYuuQrk9+aJtuAnV75xMSgR4qCSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169641; c=relaxed/simple;
	bh=26TVeJLApSfpFOCdq/sMvBH6uWyJex8IpMFiNdRJO0c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F0CEccV4B1XD1Pn7duRYjvA+MiBazlaE3aN1pXZHdqkgIZGiYmMYmi3RUfZK4LHw1Uha4yqLJlzI6uJRfQnW50V7ikZjGbWGO6MsddjJpDzrne465F88vT94yo0DQmg2o3bniEaM6ue7QzsLNAkEYQCoLjuL731g3OTKGRtHMjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from [2601:18c:8180:83cc:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tdBJY-000000000og-3Rbn;
	Wed, 29 Jan 2025 11:53:20 -0500
Date: Wed, 29 Jan 2025 11:53:20 -0500
From: Rik van Riel <riel@surriel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Peter Zijlstra <peterz@infradead.org>, David
 Hildenbrand <david@redhat.com>, kernel test robot <oliver.sang@intel.com>,
 oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, David Rientjes <rientjes@google.com>,
 Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Mel Gorman <mgorman@suse.de>, Muchun
 Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>, Will Deacon
 <will@kernel.org>, Zach O'Keefe <zokeefe@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
Message-ID: <20250129115320.1334ad5f@fangorn>
In-Reply-To: <05da0ae9-073e-4578-b65c-f837c28eead8@paulmck-laptop>
References: <20250128113100.GB7145@noisy.programming.kicks-ass.net>
	<2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
	<20250128132847.GB505@noisy.programming.kicks-ass.net>
	<18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
	<8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
	<2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
	<14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
	<20250129105920.7a4bffa1@fangorn>
	<Z5pTZ0XLFzfM5dic@casper.infradead.org>
	<488401565cac6b5f9e3232d0ca481055876c919b.camel@surriel.com>
	<05da0ae9-073e-4578-b65c-f837c28eead8@paulmck-laptop>
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

On Wed, 29 Jan 2025 08:36:12 -0800
"Paul E. McKenney" <paulmck@kernel.org> wrote:
> On Wed, Jan 29, 2025 at 11:14:29AM -0500, Rik van Riel wrote:

> > Paul, does this look like it could do the trick,
> > or do we need something else to make RCU freeing
> > happy again? =20
>=20
> I don't claim to fully understand the issue, but this would prevent
> any RCU grace periods starting subsequently from completing.  It would
> not prevent RCU callbacks from being invoked for RCU grace periods that
> started earlier.
>=20
> So it won't prevent RCU callbacks from being invoked.

That makes things clear! I guess we need a different approach.

Qi, does the patch below resolve the regression for you?

---8<---

=46rom 5de4fa686fca15678a7e0a186852f921166854a3 Mon Sep 17 00:00:00 2001
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
Suggested-by: Paul McKenney <paulmck@kernel.org>
Reported-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/page_alloc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 6e469c7ef9a4..73e334f403fd 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -94,11 +94,15 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
=20
 #if defined(CONFIG_SMP) || defined(CONFIG_PREEMPT_RT)
 /*
- * On SMP, spin_trylock is sufficient protection.
+ * On SMP, spin_trylock is sufficient protection against recursion.
  * On PREEMPT_RT, spin_trylock is equivalent on both SMP and UP.
+ *
+ * Block softirq execution to prevent RCU frees from running in softirq
+ * context while this CPU holds the PCP lock, which could result in a whole
+ * bunch of frees contending on the zone->lock.
  */
-#define pcp_trylock_prepare(flags)	do { } while (0)
-#define pcp_trylock_finish(flag)	do { } while (0)
+#define pcp_trylock_prepare(flags)	local_bh_disable()
+#define pcp_trylock_finish(flag)	local_bh_enable()
 #else
=20
 /* UP spin_trylock always succeeds so disable IRQs to prevent re-entrancy.=
 */
--=20
2.47.1

