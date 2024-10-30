Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A3F33E1
	for <oe-lkp@lists.linux.dev>; Wed, 30 Oct 2024 07:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730274837; cv=none; b=Vjsj/0so1xTb7XXT0ABsPqOCVDOOEkGNMSpht8CU8YTioMnqg01dxk87N1xvMXQE+4QNZp2XSrSefxEpdwK+XGI+oqn3OnAKpEifThDGkmDoSrxarOE+fLVfJf0Ql1+UtvKZz3CBf3pasAYO5n2ZE5lEDNEte2hchr9wXy8x1n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730274837; c=relaxed/simple;
	bh=8P7ZCe1IEzzHbjJkryj6fiDJvxxL2p5Se3zfdO1sF2k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pZve43HxQ6n8YZpsiOn9UliQcBUVGppQUcbu7F8KWWBH9UdYarLCQZFoBGrG4Du+TsIbAnGTqeXFg67c0tzVk6q0TjCNdmuyIaZv+Sr1EjwTpFDYZanHZExX7CgRjcjJG2hJieb84vJB7Loc2GFmFR3eve/FItC5FiM9Z8akB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zvlUhmHy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k3jE8dKD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zvlUhmHy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k3jE8dKD"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730274832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dp2kidU3DMg9NIXYa3nRFRS2kQiKFScOIofbBFZfLzU=;
	b=zvlUhmHyrOadULkRxRZ9T6kLuWzZTTwa9PDx+Y75D8SZR2SXsBauf45HWu7YN/pZnQX92U
	AuF6abPiXZCiBVGX3Uv4VLD1X0AKiA9ZLdl7NQcXP61FWy+9mY83QOfz0pMkzjoHgQ3Iv7
	GwyohjC8LGPz4BbWN3C7ubYF1vJt0b6ziB557fCpVtfHzsme67nRO/1cBinTJShackbaSk
	MxA8PtcdRSRjE04+zdLcrfC78YdwwWW+MCa0dbRNIcDtvNWPb/cMAOlt8ciFCSy6qMc4e3
	NV2pBwhnusRdDvqwdhGA3EOxRpz6Soqg1L49qVvYHrAkvHiah/6Z5KyV16kjEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730274832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dp2kidU3DMg9NIXYa3nRFRS2kQiKFScOIofbBFZfLzU=;
	b=k3jE8dKDnRlQzGzs+/8kvb8/4yAMVBdh5VsAyQMgOaGe2ClJUIeECNp3hYWSZQHYDdmqey
	4IlZfSG7vMIwFBBw==
To: kernel test robot <oliver.sang@intel.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Frederic Weisbecker <frederic@kernel.org>, oliver.sang@intel.com
Subject: timers: Add missing READ_ONCE() in __run_timer_base()
In-Reply-To: <202410301205.ef8e9743-lkp@intel.com>
References: <202410301205.ef8e9743-lkp@intel.com>
Date: Wed, 30 Oct 2024 08:53:51 +0100
Message-ID: <87a5emyqk0.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

__run_timer_base() checks base::next_expiry without holding
base::lock. That can race with a remote CPU updating next_expiry under the
lock. This is an intentional and harmless data race, but lacks a
READ_ONCE(), so KCSAN complains about this.

Add the missing READ_ONCE(). All other places are covered already.

Fixes: 79f8b28e85f8 ("timers: Annotate possible non critical data race of next_expiry")
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Closes: https://lore.kernel.org/oe-lkp/202410301205.ef8e9743-lkp@intel.com
---
 kernel/time/timer.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -2422,7 +2422,8 @@ static inline void __run_timers(struct t
 
 static void __run_timer_base(struct timer_base *base)
 {
-	if (time_before(jiffies, base->next_expiry))
+	/* Can race against a remote CPU updating next_expiry under the lock */
+	if (time_before(jiffies, READ_ONCE(base->next_expiry)))
 		return;
 
 	timer_base_lock_expiry(base);
