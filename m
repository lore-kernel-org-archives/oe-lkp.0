Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698AF3BB44;
	Fri, 19 Dec 2025 20:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766175985; cv=none; b=iu6jDcitfFEigTeGSfdL1I0aDfqbDVBJoX6Kqgb0YUgMJYiuCFiUDZvb7PF5Em/NhLtpv2AqCkV7RRMQEub/xaHC+YNomKl/lPxUoM/m0n5sCw2NmgoUfROJC4M/77oQqMP6Udlp+AJpq0FYllJVCz58dsh0Ie4etMi30kxtpig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766175985; c=relaxed/simple;
	bh=YK9jhuEwTYJGNUKHh/4KiO65zd9zluowb/1Zfxi8Oc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTVZyl6T6G0cWJgOeW4U/9feFyqf7zLTgUhPEDAu7TcLuGVbyxtHvg6z6Ap7E5XtWyh0gU1HLdBl5tpEzG3zrM/9tENRIk2fBdNCms8YZo7gyxvJ2y8qSmypAQhLsmjZt79rMm697HfmWfJT5fNo5e9BriyLrPkTVROkAcdSsXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nzQiadJm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nzQiadJm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Emc2vbC3qID9SHvuPS4TRJl94rbUBBjY6SgXZbxDzrg=; b=nzQiadJmwnoIXWr50jaaz0BETh
	eseBcZG2LzIFeLu+KZFFSq/sC8APmKarn/LWWwWVkJfzkYcHKKMxYuVoxZBpwmHvgSkp4o6nFm2Si
	7Ppe1NY8c6UX5364m94uVhIwzZs6dfF7T1E0IUfXSax3aj12vCwVmgQDFV3J2Lu9iVVfOTDy0Itoi
	9BzgWv5sbP8cErMCNGCnZEzpSN/o5Da1Y6fibaxbCaNjuY4eG1Ui0aY7Y3giuzj8xuBJcZ5U9AhtO
	ll6DAioRUYEtZhnvMiYyghKS6kjWSU6XbZCQwJZpFqwg1U+2nFeew0Y9ayt2Kq4+rNjxBAXoyYGdZ
	7Zpxv5OA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWh3G-000000084bL-2llR;
	Fri, 19 Dec 2025 20:26:14 +0000
Date: Fri, 19 Dec 2025 20:26:14 +0000
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Vishal Moola <vishal.moola@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	Mel Gorman <mgorman@techsingularity.net>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [linus:master] [mm/vmalloc]  a061578043:
 BUG:spinlock_trylock_failure_on_UP_on_CPU
Message-ID: <aUW05pyc9nZkvY-1@casper.infradead.org>
References: <202512101320.e2f2dd6f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512101320.e2f2dd6f-lkp@intel.com>

On Wed, Dec 10, 2025 at 02:10:28PM +0800, kernel test robot wrote:
> kernel test robot noticed "BUG:spinlock_trylock_failure_on_UP_on_CPU" on:
> 
> commit: a0615780439938e8e61343f1f92a4c54a71dc6a5 ("mm/vmalloc: request large order pages from buddy allocator")

I agree with Andrew; this commit is only exposing, not causing the bug.

> [ 1046.632156][    C0] BUG: spinlock trylock failure on UP on CPU#0, kcompactd0/28

The first thing to note is that this will only show up on CONFIG_SMP=n
builds, on account of it being behind a #ifndef.  So almost nobody will
ever see it.  It's also a failure of a trylock, so the worst consequence
is going to be performance.

> [ 1046.640168][    C0]  spin_dump (kernel/locking/spinlock_debug.c:71)
> [ 1046.640853][    C0]  do_raw_spin_trylock (kernel/locking/spinlock_debug.c:?)

This comes from SPIN_BUG_ON(!ret, lock, "trylock failure on UP");

> [ 1046.641678][    C0]  _raw_spin_trylock (include/linux/spinlock_api_smp.h:89 kernel/locking/spinlock.c:138)
> [ 1046.642473][    C0]  __free_frozen_pages (mm/page_alloc.c:2973)

        pcp = pcp_spin_trylock(zone->per_cpu_pageset, UP_flags);

> [ 1046.651984][    C0]  <TASK>
> [ 1046.652466][    C0]  asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:697)
> [ 1046.653389][    C0] RIP: 0010:_raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:95 include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194)
> [ 1046.654391][    C0] Code: 00 44 89 f6 c1 ee 09 48 c7 c7 e0 f2 7e 86 31 d2 31 c9 e8 e8 dd 80 fd 4d 85 f6 74 05 e8 de e5 fd ff 0f ba e3 09 73 01 fb 31 f6 <ff> 0d 2f dc 6f 01 0f 95 c3 40 0f 94 c6 48 c7 c7 10 f3 7e 86 31 d2
> All code
> ========
>    0:	00 44 89 f6          	add    %al,-0xa(%rcx,%rcx,4)
>    4:	c1 ee 09             	shr    $0x9,%esi
>    7:	48 c7 c7 e0 f2 7e 86 	mov    $0xffffffff867ef2e0,%rdi
>    e:	31 d2                	xor    %edx,%edx
>   10:	31 c9                	xor    %ecx,%ecx
>   12:	e8 e8 dd 80 fd       	call   0xfffffffffd80ddff
>   17:	4d 85 f6             	test   %r14,%r14
>   1a:	74 05                	je     0x21
>   1c:	e8 de e5 fd ff       	call   0xfffffffffffde5ff
>   21:	0f ba e3 09          	bt     $0x9,%ebx
>   25:	73 01                	jae    0x28
>   27:	fb                   	sti
>   28:	31 f6                	xor    %esi,%esi
>   2a:*	ff 0d 2f dc 6f 01    	decl   0x16fdc2f(%rip)        # 0x16fdc5f		<-- trapping instruction
>   30:	0f 95 c3             	setne  %bl
>   33:	40 0f 94 c6          	sete   %sil
>   37:	48 c7 c7 10 f3 7e 86 	mov    $0xffffffff867ef310,%rdi
>   3e:	31 d2                	xor    %edx,%edx
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	ff 0d 2f dc 6f 01    	decl   0x16fdc2f(%rip)        # 0x16fdc35
>    6:	0f 95 c3             	setne  %bl
>    9:	40 0f 94 c6          	sete   %sil
>    d:	48 c7 c7 10 f3 7e 86 	mov    $0xffffffff867ef310,%rdi
>   14:	31 d2                	xor    %edx,%edx
> [ 1046.657511][    C0] RSP: 0000:ffffc900001cfb50 EFLAGS: 00000246
> [ 1046.658482][    C0] RAX: 0000000000000000 RBX: 0000000000000206 RCX: 0000000000000000
> [ 1046.659740][    C0] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [ 1046.660979][    C0] RBP: ffffc900001cfb68 R08: 0000000000000000 R09: 0000000000000000
> [ 1046.662239][    C0] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888807e35f50
> [ 1046.663505][    C0] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [ 1046.664741][    C0]  free_pcppages_bulk (mm/page_alloc.c:1494)

Line 1494 is a } so I presume this is really 1493:
        spin_unlock_irqrestore(&zone->lock, flags);
... which makes sense; if an interrupt comes in during the IRQ-disabled
section, it's going to be serviced when we re-enable interrupts.

> [ 1046.665618][    C0]  drain_pages_zone (include/linux/spinlock.h:391 mm/page_alloc.c:2632)

And this is where we do:

        struct per_cpu_pages *pcp = per_cpu_ptr(zone->per_cpu_pageset, cpu);
                spin_lock(&pcp->lock);
                        free_pcppages_bulk(zone, to_drain, pcp, 0);

Now, as I recall, we are very much doing this on purpose.  We decided
not to disable interrupts at this point for improved interrupt
latency, accepting the possibility that we'd occasionally fail
the trylock.  Except on UP that's now an assertion failure.

How to fix?
