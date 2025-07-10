Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01E6235079
	for <oe-lkp@lists.linux.dev>; Thu, 10 Jul 2025 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752136073; cv=none; b=fRB5n7mciTMrI0RoOsoAmS3UDNvWAF7h/4hHSdIi5hOBMYl1VcNU5EG92IoVQeFaNfoDUJ2VSbnazWOY7FGQ3PVIqhaB9vaN0PmIB7eSYap0DhGin7X5AedEEV2ayeVB2BgEcS04DNUIOsfUh8tqK3yCP3Pt23SnBRNifixwHBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752136073; c=relaxed/simple;
	bh=4E1XLhH/ZGJ2Sc1TvmntkvgG/erJGSOAttG8VDzMfsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNuxTpniN4/0a635Wk99MpFWvZyT4Qd8hR+cz/TQ8xwpZqSVTbAthAa745h5LBVQMkqi7EN/v88DEStzTgdJIiikd+ZehRoteVizdfv4Zk7xih/81s8Am7UYFF1jbpjGa4G7Ft7ohp3Bn0zUvLf/2lGLvFmFrTG3rJ0ChUtrDyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LKX6/Aag; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LCJAmPkR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LKX6/Aag";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LCJAmPkR"
Date: Thu, 10 Jul 2025 10:27:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752136070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wUxaL7BaaPrj5xQNThkN6OHx6Dv3+6WhQ+Qhatg7DPg=;
	b=LKX6/AagtixbO/6/Uh/4ClmX8e/wdC5tbKbxpe6hP2BAB7NQ0rTDid5bCm2lucf2mrZCO4
	qkyXJsnuL79MzcEjrFOJwi7/J3lzuTIa6eVHt3JjnTtN7S3PhbgUGE6bhdlsHhZxHKZ81N
	2+F2XTJzy9n9JFuaW0Wnm+eom4Wy0n7Fv992VbKce88PGWYpMd2Gk9//eHdkJluX8NtxlW
	suCZ8XZzeHqsJwWmmFZ47deypZZqOoam3yTp9hCytBIcJTl0eBQRM0zuMXMsyQnCoOGArz
	XZmlZH7c5gVa1RFyGWpSg9qW0LBitDSycyuuLWZv35javSxmrs9L9R09WAUMXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752136070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wUxaL7BaaPrj5xQNThkN6OHx6Dv3+6WhQ+Qhatg7DPg=;
	b=LCJAmPkRlPIpcfbUfhelLvGeQEf2mwlwpkxQcCP54zmxboPGOmu412tZ1pEYka9hJJHunH
	cxMs7rDZ8Yjm+aDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Chen, Yu C" <yu.c.chen@intel.com>, Ingo Molnar <mingo@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mel Gorman <mgorman@suse.de>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	aubrey.li@linux.intel.com
Subject: [PATCH] lib/smp_processor_id: Make migration check unconditional of
 SMP
Message-ID: <20250710082748.-DPO1rjO@linutronix.de>
References: <202507100448.6b88d6f1-lkp@intel.com>
 <6cf071f3-ff5b-4025-8ce7-2f2cceb03984@intel.com>
 <20250710062528.T-Obm39T@linutronix.de>
 <292e70ed-aae5-4f52-8f85-80cba7ff301d@intel.com>
 <20250710081114.5wnABNG7@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710081114.5wnABNG7@linutronix.de>

Commit cac5cefbade90 ("sched/smp: Make SMP unconditional")
migrate_disable() even on UP builds.
Commit 06ddd17521bf1 ("sched/smp: Always define is_percpu_thread() and
scheduler_ipi()") made is_percpu_thread() check the affinity mask
instead replying always true for UP mask.

As a consequence smp_processor_id() now complains if invoked within a
migrate_disable() section because is_percpu_thread() checks its mask and
the migration check is left out.

Make migration check unconditional of SMP.

Fixes: cac5cefbade90 ("sched/smp: Make SMP unconditional")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202507100448.6b88d6f1-lkp@intel.com
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 lib/smp_processor_id.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/smp_processor_id.c b/lib/smp_processor_id.c
index a2bb7738c373c..94b3f6b195388 100644
--- a/lib/smp_processor_id.c
+++ b/lib/smp_processor_id.c
@@ -22,10 +22,8 @@ unsigned int check_preemption_disabled(const char *what1, const char *what2)
 	if (is_percpu_thread())
 		goto out;
 
-#ifdef CONFIG_SMP
 	if (current->migration_disabled)
 		goto out;
-#endif
 
 	/*
 	 * It is valid to assume CPU-locality during early bootup:
-- 
2.50.0

