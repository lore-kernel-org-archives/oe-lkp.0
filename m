Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B42194C75
	for <oe-lkp@lists.linux.dev>; Fri, 17 Jan 2025 10:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737108618; cv=none; b=GuppDNG99bqWOHeaD8IDo1ZU27ahtRD4q/xuc9ccX4RecTtBBx6WSI87KNp0WpD1CnNEslwxC/JXJ7hNkTZjoYQJ7D7aexVUTkXrNGgvf1qosKplcv2StC4OHRe5Kj7RFmEsegJLVWAZFa9fMQxytGQn/qUjVFSQDhSewYJpEts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737108618; c=relaxed/simple;
	bh=LS0qvBPBOF200CTbvkO6uueZoxxR8UEMBWxEWOFRd98=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EfEJjy6gIFxcneUoaQEWEl/vRrcG1uwq4Wh+HN4jR82cOy7AXbiVkJOyMXzEiw+T8giNG6faY9Ejk3e13MorKD6SlDi+GDRdKQpEfFhAXTXwBKvV5UMFwD447Mvvu3bOS4h0TfMY4cV4A+EO0KMVaOHWx/duQvqTwcl61ym489Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tVSzxbg1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w/O1yE1h; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tVSzxbg1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w/O1yE1h"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737108219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iT4EZHH6s1Zqo1TTydmXrgZkFxxBSJj4BFDF1LxQ3Zw=;
	b=tVSzxbg1HIrx6K83aG8WIn1m5720pDU6FToAqwDGYgEHImg5ibhYYiNfPDoQr6dZHDv5s9
	lr91qTw2stO1gN08RtX/JcicHdXVhMrNbV2HJGEx3Lr9/6z0LmiE9GUjWUCI1AdyR2KwGC
	SKfigfCHUxLA0Sa2sZgH5CqkiSoks20rcg5OlMAVBB/Tu8TbpPw+BpdjL1eHwduPwOXe5n
	W/Bj+RKWbZ0jMJ3w5ZQkZq/BpH/hI97KnZZs6BtwDmYXue/aYOhiTmXSncEkGK0K7WbUGW
	oJcMgVBVCKmOxNZk6ADff7K1nmTomHB+FEoDc7rZF4JVGZa/TTQ0Z21vVlvwSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737108219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iT4EZHH6s1Zqo1TTydmXrgZkFxxBSJj4BFDF1LxQ3Zw=;
	b=w/O1yE1hzSIfLBiMr4TvsYGyrp51+yPzsYPPWvn8pZHxyvASpaj9fJJQoBiyXZFqtYrQuP
	rNZulqov5viCwZDA==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra
 <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, kernel test robot
 <oliver.sang@intel.com>
Subject: Re: [bigeasy-staging:futex_local_v6] [futex]  865221325b:
 WARNING:at_lib/rcuref.c:#rcuref_put_slowpath
In-Reply-To: <87r051akps.ffs@tglx>
References: <202412311453.9d7636a2-lkp@intel.com>
 <20250116233137.v8s-FDdH@linutronix.de> <87r051akps.ffs@tglx>
Date: Fri, 17 Jan 2025 11:03:38 +0100
Message-ID: <87o705ahad.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jan 17 2025 at 09:49, Thomas Gleixner wrote:
> On Fri, Jan 17 2025 at 00:31, Sebastian Andrzej Siewior wrote:
>>
>>     -> cnt = atomic_read(&ref->refcnt);                                          # cnt -> 0xffffffff / RCUREF_NOREF
>>     -> atomic_try_cmpxchg_release(&ref->refcnt, &cnt, RCUREF_DEAD))              # ref -> 0xe0000000 / RCUREF_DEAD
>>        -> return true
>>                                            -> cnt = atomic_read(&ref->refcnt);   # cnt -> 0xe0000000 / RCUREF_DEAD
>>                                            -> if (cnt > RCUREF_RELEASED)         # 0xe0000000 > 0xc0000000
>>                                              -> WARN_ONCE(cnt >= RCUREF_RELEASED, "rcuref - imbalanced put()")
>
> Duh. Indeed.
>
> That's a nasty one. Let me think about it.

The problem is the disconnect between the decrement and the read in the
slow path. The untested below should plug that hole. It results in two
extra instructions:

 412:	f0 83 43 40 ff       	lock addl $0xffffffff,0x40(%rbx)
 417:	78 69                	js     482 <dst_release+0x92>

vs.

 412:	be ff ff ff ff       	mov    $0xffffffff,%esi
 417:	f0 0f c1 73 40       	lock xadd %esi,0x40(%rbx)
 41c:	83 ee 01             	sub    $0x1,%esi
 41f:	78 69                	js     48a <dst_release+0x9a>

That's not the end of the world and could be further optimized, but
that's a minor detail.

Thanks,

        tglx
---
--- a/include/linux/rcuref.h
+++ b/include/linux/rcuref.h
@@ -71,27 +71,30 @@ static inline __must_check bool rcuref_g
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
