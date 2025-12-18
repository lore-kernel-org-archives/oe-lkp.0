Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0276346AF6;
	Thu, 18 Dec 2025 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053230; cv=none; b=juj+5GfI+25JUZ2T+rSDZ4Tn/CUi8CSlXtsrBIavAkyO+JdTKXDLTfQmKAYUo9dSO05GqSE9LjCeH/OG/tnr70YxqYK9HQwjT5zb3aeO7Beta2vtfSM/2tLm6er8fSMmvaTPj6aXvCQUHI3otKn8vZbBIdxc4Qe/nwqGIEqKkA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053230; c=relaxed/simple;
	bh=uKaK6Np6VlHCfB4i5X+VyCVNIEPtvq+/s0Gggvo2V20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRDSKCPSw7ct1jzvsjtn0vIKungIBmf9cqSs1Cte+nBVMi7UOmt2hj2Iag5xLw4Ccqgmy9VSuVawIgxoCw2q7pTRMdi6TlbAyhspLVsoDRJBfwBpp1QsWVAmCU+Ec65FVAomqGF4lS6KsAUvgTcACb3vpfvXTnEXGkCekmycyLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kEmkX1j/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kEmkX1j/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GaG0D8F4DOGzwMuemzBMQGnSW/BzU5vt3VsAlD+aTXU=; b=kEmkX1j/UJrrryGctTnDaTsSyC
	9bfE3D6yEbbPij/AOf5lWNXbeVZsR2f7yBNDZ0edsr1AdfBBagRRDMoc37tD5m6UAuKqoXsTzmYK6
	Upog1n0utcUpUtGWAiNsToG9+PrMNupllHNPGAcboQUPmeeO08k0XB1pLCMOY05sJVjFguwSTsXp8
	lH+vXzmdrPBKkpYh1Y7sRK8szQf3cnCu0glQyAlzPqHcXNj+y6fWb7IcuJ50tV/0EXNDRCwA6QMsw
	deMUaK1CubUDqOMzjqbDZyZWMFBeC5t3BRYkY+X6u4zC/AGYJg9s5w8GMPwQ1CLvK747ikUAE5hoq
	zP0UHxKA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAFu-00000008XK7-3bzh;
	Thu, 18 Dec 2025 09:25:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0080430056B; Thu, 18 Dec 2025 11:20:20 +0100 (CET)
Date: Thu, 18 Dec 2025 11:20:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com
Subject: Re: [tip:sched/core] [sched/fair] 089d84203a:
 pts.schbench.32.usec,_99.9th_latency_percentile 52.4% regression
Message-ID: <20251218102020.GO3707891@noisy.programming.kicks-ass.net>
References: <202512181208.753b9f6e-lkp@intel.com>
 <20251218083747.GI3707891@noisy.programming.kicks-ass.net>
 <6f0954ba-2ca7-41e8-b4f7-b0b17990f659@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f0954ba-2ca7-41e8-b4f7-b0b17990f659@linux.ibm.com>

On Thu, Dec 18, 2025 at 03:41:55PM +0530, Shrikanth Hegde wrote:
> On 12/18/25 2:07 PM, Peter Zijlstra wrote:
> > On Thu, Dec 18, 2025 at 12:59:53PM +0800, kernel test robot wrote:
> > > 
> > > 
> > > Hello,
> > > 
> > > kernel test robot noticed a 52.4% regression of pts.schbench.32.usec,_99.9th_latency_percentile on:
> > > 
> > > 
> > > commit: 089d84203ad42bc8fd6dbf41683e162ac6e848cd ("sched/fair: Fold the sched_avg update")
> > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
> > 
> > Well, that obviously wasn't the intention. Let me pull that patch :/
> 
> Is it possible because it missed scaling by se_weight(se) ??

>  static inline void
>  enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> -       cfs_rq->avg.load_avg += se->avg.load_avg;
> -       cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> +       __update_sa(&cfs_rq->avg, load, se->avg.load_avg, se->avg.load_sum);
>  }

Ah, indeed, something like so then? Can the robot (Oliver/Philip)
verify?

(I was going to shelf it and look at it after the holidays, but if this
is it, we can get it fixed before I dissapear).

---
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 76f5e4b78b30..7377f9117501 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3775,13 +3775,15 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
 static inline void
 enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
-	__update_sa(&cfs_rq->avg, load, se->avg.load_avg, se->avg.load_sum);
+	__update_sa(&cfs_rq->avg, load, se->avg.load_avg,
+		    se_weight(se) * se->avg.load_sum);
 }
 
 static inline void
 dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
-	__update_sa(&cfs_rq->avg, load, -se->avg.load_avg, -se->avg.load_sum);
+	__update_sa(&cfs_rq->avg, load, -se->avg.load_avg,
+		    se_weight(se) * -se->avg.load_sum);
 }
 
 static void place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags);
