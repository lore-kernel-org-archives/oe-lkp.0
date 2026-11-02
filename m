Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625993;
	b=cIubJ+1SSDrLaIl9MxFkggZemHEzDkljHd3/F42a0u/PWSegfHaad9sQiOUFyvnEQO0Y
	 2pRPrjrTNSf/+JhFt6/EB3ffkhqrcAjADnXoLLSUKthmnOTW6yup2tX8k6ore9QbD/MKQ
	 BmdxfgTvBE8BpqWeCy8LhEm6aUWxOjJuk2Egq6F8qtZYQxiEs2YJ9BJ7Uosn5Mj2mzqOc
	 2UAsVLMhJ+bHDiNlXr6oZNk2OFIYfEJiARna5qtnJyH3/xUedRkkjw2LjXk98ww3YhOTI
	 hr7UToV/O5z59SLLGbOn7Ckh1htB5vBJMsEvIeqlg6And73g+pDjrttedHgb+bMoEmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625993;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=EypA7ofiZgDT9X4mYdZ8YjqN20vfxOuQSGG39U4lXWE=;
	b=OB6fLyYikcLutXZos8Okl4Uww9blOCRZeSttj9xLZ1dKMs+9Gh/pTAuJL8UwB9b6q8oV
	 tpM6rErYnIZDhbDg1Sh4OpRjrf4+8UG16UlWtS221wu9jvZOHNatUuU1mXU3EgE3mvJj9
	 z3eGAM9jeCQ7y1o7Z1SdBrixVD8994NuCQ3QX+t4o1Jad17fTGGKRjmEJzWoxD21GfYK2
	 pgEZaeI2M1o82gQgWIZBMiuDOG8EsiHWLBTuCQrw0/94vbkQfsVX1XKtA3aWWNE/9/Kmw
	 +6RxgrU0LhtO1t+BSMTRvdcxVu4/zS3cxHiSYQiHWUU6LesSRPdw/8UswpulSwIThKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=temperror header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JwQMdx0M;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CHBpP0yo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JwQMdx0M;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CHBpP0yo;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868E1606A324
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 13:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 868E1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JwQMdx0M;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CHBpP0yo;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JwQMdx0M;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CHBpP0yo
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A30A31F7C2;
	Mon,  2 Nov 2026 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793625985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EypA7ofiZgDT9X4mYdZ8YjqN20vfxOuQSGG39U4lXWE=;
	b=JwQMdx0MYCHUjMAv8rsQWjbnS1g4As3a2avKMVxAY3xAhcmNUpvCX0TW/G4+YAw3pjaUh6
	9pNFNUSuJCULDyy8+k+HEqOk07WyEerAu/WBQule19RQMWYYSANm0qq/T0XErGKtMpFrot
	iWuLaGxvDNmmGTerQyOm6Gt4W61Yn6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793625985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EypA7ofiZgDT9X4mYdZ8YjqN20vfxOuQSGG39U4lXWE=;
	b=CHBpP0yo1RxUBJuvP/lk1dhrEChwnVXtVtYxNkc+ZIRyEuePocF0xQ+T357iKcBb6HBcby
	Q8D0RJfdTFzrWLBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JwQMdx0M;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CHBpP0yo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793625985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EypA7ofiZgDT9X4mYdZ8YjqN20vfxOuQSGG39U4lXWE=;
	b=JwQMdx0MYCHUjMAv8rsQWjbnS1g4As3a2avKMVxAY3xAhcmNUpvCX0TW/G4+YAw3pjaUh6
	9pNFNUSuJCULDyy8+k+HEqOk07WyEerAu/WBQule19RQMWYYSANm0qq/T0XErGKtMpFrot
	iWuLaGxvDNmmGTerQyOm6Gt4W61Yn6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793625985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EypA7ofiZgDT9X4mYdZ8YjqN20vfxOuQSGG39U4lXWE=;
	b=CHBpP0yo1RxUBJuvP/lk1dhrEChwnVXtVtYxNkc+ZIRyEuePocF0xQ+T357iKcBb6HBcby
	Q8D0RJfdTFzrWLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8066E134B8;
	Mon,  2 Nov 2026 13:26:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tBSEAYCP6GqhdQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 02 Nov 2026 13:26:24 +0000
Date: Mon, 2 Nov 2026 13:26:22 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	jannh@google.com, liam@infradead.org, willy@infradead.org, paulmck@kernel.org, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
Message-ID: <auiMK6ynztyF1-MM@pedro-suse.tail5790ac.ts.net>
References: <20261101154503.3203036-1-surenb@google.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101154503.3203036-1-surenb@google.com>
X-Spamd-Result: default: False [-13.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.51
X-Spam-Level: 
X-Rspamd-Queue-Id: A30A31F7C2

On Sun, Nov 01, 2026 at 07:45:03AM -0800, Suren Baghdasaryan wrote:
> Pss metrics can be affected by map count even if VMA tree stays unchanged,
> therefore tests checking VMA tree integrity can't use them. Use Rss instead
> and pre-populate the VMAs so that Rss changes if a VMA gets skipped or
> double-counted.
> 
> To ensure all test VMAs are populated with anonymous pages, remain
> mergeable across VMA operations, and do not have their Rss changed by
> memory reclaim:
> - Toggle PROT_EXEC instead of PROT_WRITE between adjacent test VMAs so
>   all test VMAs remain writable and MAP_POPULATE faults in anonymous pages
>   (rather than the shared zero page, which is not accounted in Rss).
> - Use mprotect() instead of mmap(..., MAP_FIXED) in split_vma() and
>   merge_vma() so the first page of the split VMA stays resident.
>   mprotect(..., PROT_NONE) splits the VMA without unmapping the first page
>   (pte_present() remains true for PAGE_NONE PTEs), and
>   mprotect(..., self->mod_info->prot) merges it back. Both parts of the
>   split VMA retain their non-zero Rss.
> - Lock all present pages in the child with mlockall(MCL_CURRENT |
>   MCL_FUTURE | MCL_ONFAULT) so memory pressure cannot reclaim pages and
>   alter Rss during the test.

FWIW, I was wondering if it would remain constant in face of compaction (page
migration). It seems so, from looking at the code the migration entry should
make it count the RSS. But is it always the case? I'm not super familiar with
the migration logic.
 

-- 
Pedro
