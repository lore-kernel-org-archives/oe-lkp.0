Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357231494CC
	for <oe-lkp@lists.linux.dev>; Mon, 20 Jan 2025 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737392924; cv=none; b=dl5JSdzopfUkyv5Kso7UR0o51kDePrSmJJaJspBGaq6VJ+48sFrwdKqTbtNnC8BzLj+p9D/jnVGcDe9YmJKWKplWqksNIEJ8SF+/PJf55dIbnphqdMio2bahOHEhyUetO48e6JsHIArOPwZTAHWvO7tFfneYeqGzOrFhJuwL/Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737392924; c=relaxed/simple;
	bh=rqBoB5tvgFfXxsD+JHKDhaELw5d1ExdCb7js9dbP1NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUaZLv3H9Df9mFzL/H+5mV8JVmXh5h+xgZtqho7Ee6CmJqC+WZyP2HxZcVDtm4A+LP2Gks9hQM4J8z0zMHQDchxqfzUSJgx7nrUQWwcGo63SabRJv9hqA1ri3coIfKy09NmWnuG+DIB2E3j6IHfn02LH5XmcDAHzV9f6xnkqCQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3IB8R0qS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iz42NLoL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3IB8R0qS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iz42NLoL"
Date: Mon, 20 Jan 2025 18:08:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737392919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pUmGTEjQCTD/ZbTu3dQvCJ7DZwlUdxErixTsdcw9sTY=;
	b=3IB8R0qSbb9kJCkSO92EemVYr7kwb5gFprAzT011R5UVQkd4C7f4vbbkYKs+81EOsi0U5B
	eoa/cJ+k3UHwjo5U5wRiMXIJk/gNj5ONR/XQD3LsfdHSGC3QPjQZl30YWBZ9mgLUJaSRGG
	OBhAQse9HCAOYAkki+sabVMWR2k3snDLHt5D9ydw79TPHC7jVKoaduTZZlYABZEVvqj8ds
	yVDbRKTVicfRIwOofCJKRGuArBy50wScxlsgZw0Jk0kth6jn7iuP/tfHkGZDPR1PohxOEo
	Oawd5s38Gqp7KjEfaDAFOWI1Yew1fcSKBBXYLjJWrMpD1GxblBFgraLHN1uyfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737392919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pUmGTEjQCTD/ZbTu3dQvCJ7DZwlUdxErixTsdcw9sTY=;
	b=iz42NLoLPWojUsupGVFZW55nC/EHYgLBnfwVEvL6uisXJrno/fT0EunjDddCIoNyDs4qsl
	BJC+Hrg2LhMMxRBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, kernel test robot <oliver.sang@intel.com>
Subject: Re: [bigeasy-staging:futex_local_v6] [futex]  865221325b:
 WARNING:at_lib/rcuref.c:#rcuref_put_slowpath
Message-ID: <20250120170837.6L_h7LNK@linutronix.de>
References: <202412311453.9d7636a2-lkp@intel.com>
 <20250116233137.v8s-FDdH@linutronix.de>
 <87r051akps.ffs@tglx>
 <87o705ahad.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o705ahad.ffs@tglx>

On 2025-01-17 11:03:38 [+0100], Thomas Gleixner wrote:
> >
> > That's a nasty one. Let me think about it.
> 
> The problem is the disconnect between the decrement and the read in the
> slow path. The untested below should plug that hole. It results in two
> extra instructions:

This works, I'm going to reset it with the futex patches so the bot does
not choke on it again.

From: Thomas Gleixner <tglx@linutronix.de>
Date: Sun, 19 Jan 2025 00:55:32 +0100
Subject: [PATCH] rcuref: Avoid false positive "imbalanced put" report.

The kernel test robot reported an "imbalanced put" which turned out to
be false positive. Consider the following race:

            ref  = 0 (via rcuref_init(ref, 1))
 T1                                      T2
 rcuref_put(ref)
 -> atomic_add_negative_release(-1, ref)                                         # ref -> 0xffffffff
 -> rcuref_put_slowpath(ref)
                                         rcuref_get(ref)
                                         -> atomic_add_negative_relaxed(1, &ref->refcnt)
                                           -> return true;                       # ref -> 0

                                         rcuref_put(ref)
                                         -> atomic_add_negative_release(-1, ref) # ref -> 0xffffffff
                                         -> rcuref_put_slowpath()

    -> cnt = atomic_read(&ref->refcnt);                                          # cnt -> 0xffffffff / RCUREF_NOREF
    -> atomic_try_cmpxchg_release(&ref->refcnt, &cnt, RCUREF_DEAD))              # ref -> 0xe0000000 / RCUREF_DEAD
       -> return true
                                           -> cnt = atomic_read(&ref->refcnt);   # cnt -> 0xe0000000 / RCUREF_DEAD
                                           -> if (cnt > RCUREF_RELEASED)         # 0xe0000000 > 0xc0000000
                                             -> WARN_ONCE(cnt >= RCUREF_RELEASED, "rcuref - imbalanced put()")

The problem is the additional read in the slow path (after it
decremented to RCUREF_NOREF) which can happen after the counter has been
marked RCUREF_DEAD.

Avoid the false positive by reusing the returning value from the
decrement. Now every "final" put uses RCUREF_NOREF in the slow path and
attempts the final cmpxchg() to RCUREF_DEAD.

Fixes: ee1ee6db07795 ("atomics: Provide rcuref - scalable reference counting")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202412311453.9d7636a2-lkp@intel.com
Debugged-by:: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/rcuref.h | 9 ++++++---
 lib/rcuref.c           | 5 ++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/linux/rcuref.h b/include/linux/rcuref.h
index 2c8bfd0f1b6b3..6322d8c1c6b42 100644
--- a/include/linux/rcuref.h
+++ b/include/linux/rcuref.h
@@ -71,27 +71,30 @@ static inline __must_check bool rcuref_get(rcuref_t *ref)
 	return rcuref_get_slowpath(ref);
 }
 
-extern __must_check bool rcuref_put_slowpath(rcuref_t *ref);
+extern __must_check bool rcuref_put_slowpath(rcuref_t *ref, unsigned int cnt);
 
 /*
  * Internal helper. Do not invoke directly.
  */
 static __always_inline __must_check bool __rcuref_put(rcuref_t *ref)
 {
+	int cnt;
+
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held() && preemptible(),
 			 "suspicious rcuref_put_rcusafe() usage");
 	/*
 	 * Unconditionally decrease the reference count. The saturation and
 	 * dead zones provide enough tolerance for this.
 	 */
-	if (likely(!atomic_add_negative_release(-1, &ref->refcnt)))
+	cnt = atomic_sub_return_release(1, &ref->refcnt);
+	if (likely(cnt >= 0))
 		return false;
 
 	/*
 	 * Handle the last reference drop and cases inside the saturation
 	 * and dead zones.
 	 */
-	return rcuref_put_slowpath(ref);
+	return rcuref_put_slowpath(ref, cnt);
 }
 
 /**
diff --git a/lib/rcuref.c b/lib/rcuref.c
index 97f300eca927c..5bd726b71e393 100644
--- a/lib/rcuref.c
+++ b/lib/rcuref.c
@@ -220,6 +220,7 @@ EXPORT_SYMBOL_GPL(rcuref_get_slowpath);
 /**
  * rcuref_put_slowpath - Slowpath of __rcuref_put()
  * @ref:	Pointer to the reference count
+ * @cnt:	The resulting value of the fastpath decrement
  *
  * Invoked when the reference count is outside of the valid zone.
  *
@@ -233,10 +234,8 @@ EXPORT_SYMBOL_GPL(rcuref_get_slowpath);
  *	with a concurrent get()/put() pair. Caller is not allowed to
  *	deconstruct the protected object.
  */
-bool rcuref_put_slowpath(rcuref_t *ref)
+bool rcuref_put_slowpath(rcuref_t *ref, unsigned int cnt)
 {
-	unsigned int cnt = atomic_read(&ref->refcnt);
-
 	/* Did this drop the last reference? */
 	if (likely(cnt == RCUREF_NOREF)) {
 		/*
-- 
2.47.1

