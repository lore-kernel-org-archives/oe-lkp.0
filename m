Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F419B1F754C
	for <oe-lkp@lists.linux.dev>; Fri, 17 Jan 2025 08:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737103780; cv=none; b=gu9L4lUe15xAcFLK92fwCUspAwnCUX3FHdG9ZrT8jIMsrTHy1/JNqnCHbzsOKU3Wl4w6MCXZntrPwoR7XDAl9F7zMOD6JdAWCcHrrMEDTsDvm8vvs9xb3E8ilJRcdWZL13TP8Mz9dy2GvjWmBR4Bq9koFxydNUBZ1IT6fmfw30g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737103780; c=relaxed/simple;
	bh=VvLb0oP1hcGn3AQgBfOdADzaPWG26pLk1BRQXNAfjFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qoS/9G+DTjiLgbddpykPxO6UOOIjrygswtZxtDbh4WBjJIgdXPTJnjyOiqd0Ox/w9OsiWYVw6FozyMiZw4P2wbJ5mWVLGOso3UhatJU2CcI7wvlvtfxdt/tBHaAdSPw99tFRSt38AVxzBuTjTb7Dm/liKyqUjOMJ+HTJb4gVdfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GBuu5Do7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iCcJ55Ud; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GBuu5Do7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iCcJ55Ud"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737103776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ge8wTDS2lVvVcQpJfkTtZUwqBT3XpS4exyMdYmOOMOY=;
	b=GBuu5Do7gq7JrH48E/4QSqJKnhKcJNaZRd5suVdg+YBFC9bd2U57niy9aEfsWZCHp8+UAf
	XQ6/8okvhv37WH6skekdMDRPObo3evjmIFhiMDpZPZWK3GTp025qy+HEgePqjXNxKnKkNP
	mRBGiylmGjknCc/QTL/DOXI4Zz9GkErEp49pj+zPPGXVUTnjBwyBZfAVyn2GKtjMDciE0a
	I8gtfRfwNCGPxWkWtTi15Byit3nw8ABoWe8hXkyPLhHj9gAlWvdI3LS1MCvZlHvIWeBA2Y
	yTdEv3VbxbWpieZpeFGq7A6JeVaKvqBBU56uXLgR49oeHPhVlHBqTQcmfQXE/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737103776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ge8wTDS2lVvVcQpJfkTtZUwqBT3XpS4exyMdYmOOMOY=;
	b=iCcJ55UdlVohxLZLH5X9EUv/7M1cl8xg0HTUytMvWWPPSOUbw+tu4CKxWTsxne8IZZBeF5
	31SlBBNBUC8ry2Dg==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra
 <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, kernel test robot
 <oliver.sang@intel.com>
Subject: Re: [bigeasy-staging:futex_local_v6] [futex]  865221325b:
 WARNING:at_lib/rcuref.c:#rcuref_put_slowpath
In-Reply-To: <20250116233137.v8s-FDdH@linutronix.de>
References: <202412311453.9d7636a2-lkp@intel.com>
 <20250116233137.v8s-FDdH@linutronix.de>
Date: Fri, 17 Jan 2025 09:49:35 +0100
Message-ID: <87r051akps.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jan 17 2025 at 00:31, Sebastian Andrzej Siewior wrote:
> On 2024-12-31 16:41:41 [+0800], kernel test robot wrote:
>> [  184.841511][T52159] rcuref - imbalanced put()
>> [  184.841536][T52159] WARNING: CPU: 64 PID: 52159 at lib/rcuref.c:267 rcuref_put_slowpath+0x66/0x70
>
> after hours of yelling and cursing:
>
>       ref  = 0 (via rcuref_init(ref, 1))
>  T1                                      T2
>  rcuref_put(ref)
>  -> atomic_add_negative_release(-1, ref)                                         # ref -> 0xffffffff
>  -> rcuref_put_slowpath(ref)
>                                          rcuref_get(ref)
>                                          -> atomic_add_negative_relaxed(1, &ref->refcnt)
>                                            -> return true;                       # ref -> 0
>
>                                          rcuref_put(ref)
>                                          -> atomic_add_negative_release(-1, ref) # ref -> 0xffffffff
>                                          -> rcuref_put_slowpath()
>
>     -> cnt = atomic_read(&ref->refcnt);                                          # cnt -> 0xffffffff / RCUREF_NOREF
>     -> atomic_try_cmpxchg_release(&ref->refcnt, &cnt, RCUREF_DEAD))              # ref -> 0xe0000000 / RCUREF_DEAD
>        -> return true
>                                            -> cnt = atomic_read(&ref->refcnt);   # cnt -> 0xe0000000 / RCUREF_DEAD
>                                            -> if (cnt > RCUREF_RELEASED)         # 0xe0000000 > 0xc0000000
>                                              -> WARN_ONCE(cnt >= RCUREF_RELEASED, "rcuref - imbalanced put()")

Duh. Indeed.

That's a nasty one. Let me think about it.

