Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C091B140E
	for <oe-lkp@lists.linux.dev>; Thu, 29 Aug 2024 14:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724941982; cv=none; b=HNeRANQfS9uOW9jy8rdH+y0QJO9KAERHCLSBufgshHL61mhvMMgOcILxvnd3q0it41KWDyW4CaVKdPiwLaZABBa2rB3lVLz0viR0c23g+ohGV/eFMf/t611Vg/8nOWsHPzeWynGaWsbPG5hPojzDV3j7h8LfPPsFwuXB13TZJV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724941982; c=relaxed/simple;
	bh=h5BFn8XLYX650u8z+xYh7CcJ0o8BKJ4tKX7e6NmNKC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/cE8IoZ/P+mHx842vzBaONPRcD3Wy2J0l7C5xetvpm18NDe5FewppKcr4y28TjCATkiUsJIdJtuItxvc2jnt7gf7XpXDJ4K99/e/vgkoviBQjVc799mIGSY/LybJGg3tJRsTTRjaxwT0lSVLCWdlo3DiSF+iHtUpCbg/lAMTnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ib6HJNkw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=HnkQ4ZRk; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ib6HJNkw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=HnkQ4ZRk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ib6HJNkw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HnkQ4ZRk";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ib6HJNkw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HnkQ4ZRk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1E5112191F;
	Thu, 29 Aug 2024 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724941978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UgvBT/lMjv0ff6wv1Eg9swV/WKRHj1qSeWNebhjgOLE=;
	b=Ib6HJNkweLpoMNy9W+ktcnIfarHyScnBiHOx6IeKMXpW2Gq4QBRThgGCIiPK1ILP9GgRaB
	SiRi9FFczMaF9NUte0GpcZ23rNgWmGv1WfrgVIxQDgfBE95unB4H47p0kEW8orpRq/+M46
	dxEtOWVgq6V8xY5iphsktaQh9CnC7iA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724941978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UgvBT/lMjv0ff6wv1Eg9swV/WKRHj1qSeWNebhjgOLE=;
	b=HnkQ4ZRkz+qTUajSB8bGbE0s2bYu2jD9QSuBOJXfo/+nhkSo/IHe7qiLbfcyN35oYjQ8ca
	cUXPP7DlWiQnCIBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724941978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UgvBT/lMjv0ff6wv1Eg9swV/WKRHj1qSeWNebhjgOLE=;
	b=Ib6HJNkweLpoMNy9W+ktcnIfarHyScnBiHOx6IeKMXpW2Gq4QBRThgGCIiPK1ILP9GgRaB
	SiRi9FFczMaF9NUte0GpcZ23rNgWmGv1WfrgVIxQDgfBE95unB4H47p0kEW8orpRq/+M46
	dxEtOWVgq6V8xY5iphsktaQh9CnC7iA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724941978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UgvBT/lMjv0ff6wv1Eg9swV/WKRHj1qSeWNebhjgOLE=;
	b=HnkQ4ZRkz+qTUajSB8bGbE0s2bYu2jD9QSuBOJXfo/+nhkSo/IHe7qiLbfcyN35oYjQ8ca
	cUXPP7DlWiQnCIBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09AFD13408;
	Thu, 29 Aug 2024 14:32:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p6c4AZqG0GY6VwAAD6G6ig
	(envelope-from <chrubis@suse.cz>); Thu, 29 Aug 2024 14:32:58 +0000
Date: Thu, 29 Aug 2024 16:31:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: David Hildenbrand <david@redhat.com>
Cc: kernel test robot <oliver.sang@intel.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, lkp@intel.com,
	Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sven Schnelle <svens@linux.ibm.com>, Zi Yan <ziy@nvidia.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	oe-lkp@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>, ltp@lists.linux.it,
	Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [LTP] [linux-next:master] [mm/migrate] b28dd7507f:
 ltp.move_pages04.fail
Message-ID: <ZtCGVr8l_Eq5uVlu@yuki.lan>
References: <202408211026.636ade1a-oliver.sang@intel.com>
 <767d1908-dc30-42ae-9a8a-d2ad42a4d491@redhat.com>
 <8bde28af-3401-4d72-b821-d8cf01bbcd64@redhat.com>
 <Zs7-A5S_ivFlosrj@yuki.lan>
 <c6fb5f16-59bb-47a5-a2dd-3c4207d73614@redhat.com>
 <Zs8W3nQszwhbSiT9@yuki.lan>
 <4c190c79-401e-43a9-a4d1-e64f78110e0b@redhat.com>
 <Zs8Yg7nXZHG8U821@yuki.lan>
 <8a16ac0e-4a3f-48cc-a118-ea05c23d5d2b@redhat.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a16ac0e-4a3f-48cc-a118-ea05c23d5d2b@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -8.30
X-Spam-Flag: NO

Hi!
> >>> Also I think there is a third case that we do not cover either, what
> >>> happens when we pass an address that is not mapped at all, e.g. NULL? Do
> >>> we get EFAULT as well?
> >>
> >> Yes, that's documented as EFAULT and should behave that way. I can
> >> extend the test to handle that as well.
> > 
> > Ideally the test should be ported to the new test API as well, but I can
> > do that later on the top of your work.
> 
> I tried, and it all looked easy, until I realized that these tests use a 
> share code-base:
> 	testcases/kernel/syscalls/move_pages/move_pages_support.c
>
> That is also written using the old API. I assume mixing APIs might not 
> work as expected ...

The tst_resm() and tst_brkm() calls are redirected proplery in the case
that the test runs with a new API so generally it should work fine as
long as the cleanup callback is set to NULL for the tst_brkm(). That
was one of the design decision we took years ago, because we knew that
we are not going to reimplement thousands of tests instantly and that
the old and new API would have to live alongside for a decade.

I glanced over the code and I do not see anything in the
move_paves_support.c or in the kernel/lib/numa_helper.c that would break
when executed under the new library test.

-- 
Cyril Hrubis
chrubis@suse.cz
