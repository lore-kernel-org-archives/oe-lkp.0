Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078691779B8
	for <oe-lkp@lists.linux.dev>; Wed, 28 Aug 2024 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847909; cv=none; b=KyO516a6V0B8j1GG6a1mbZ6iXx3wA3iJzNfwq+B8N1cB3jqqXoyhnXGn31VDWB/OQc/+YpRWpgQWcNpsfQ9oL5jVvIt03xT1NgCt3uPrMcbsaCag1bsglp/+zsHlvLMe4HKSYB+Vby9JGeakjoskq0PMRpdUGX2vCyAKnKrnp7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847909; c=relaxed/simple;
	bh=8+PAgwgN8J0VVOgNc264Y6sbEbNtsqQcqRsyTtmORpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQUrmDeTAGiS+Inp+XFc7nVK1PMluWNlswiF14mzHdGIbGQzHe8V+ILFv+DJfMcOze3UrfyNPgM1QV7J7tocCOcu32363pdt3BjB409A2T4gbWHez2ctzRaU5N1wFxQ3byVXHBHNvUZ/vFfgGpwWgZ3CVqKOKKTRLBXrP9PP4RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vAX10Aeg; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=OS1o7Xbj; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vAX10Aeg; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=OS1o7Xbj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vAX10Aeg";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="OS1o7Xbj";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vAX10Aeg";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="OS1o7Xbj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 27A501FBB5;
	Wed, 28 Aug 2024 12:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724847906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XE2b54FEL2svPWeuarIeaLeQ+ZaYjLgKlUTER71GnU=;
	b=vAX10Aeg3n/LRdv7XkGFCL29I+7WC1NoXxDIhrSClOeFmWU2JBEAT9xxkXA4V7HI8OpMvf
	r1bCyPOb2zNNfHPZq3LbEAUgFyrP42gKx3WhvalrvdkItafFUKWUOmjG2BHqh731/w053M
	yFQlXtlU14wcIX3/k7PGulslS6P0iZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724847906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XE2b54FEL2svPWeuarIeaLeQ+ZaYjLgKlUTER71GnU=;
	b=OS1o7Xbjd1E4Sw8OfTLxXr5S0C37EDFEExcxziAGhkEAW+wMzrXwnwkoStldu+NCUXDn/6
	URhZaZSMih7XpVBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724847906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XE2b54FEL2svPWeuarIeaLeQ+ZaYjLgKlUTER71GnU=;
	b=vAX10Aeg3n/LRdv7XkGFCL29I+7WC1NoXxDIhrSClOeFmWU2JBEAT9xxkXA4V7HI8OpMvf
	r1bCyPOb2zNNfHPZq3LbEAUgFyrP42gKx3WhvalrvdkItafFUKWUOmjG2BHqh731/w053M
	yFQlXtlU14wcIX3/k7PGulslS6P0iZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724847906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XE2b54FEL2svPWeuarIeaLeQ+ZaYjLgKlUTER71GnU=;
	b=OS1o7Xbjd1E4Sw8OfTLxXr5S0C37EDFEExcxziAGhkEAW+wMzrXwnwkoStldu+NCUXDn/6
	URhZaZSMih7XpVBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15B1E1398F;
	Wed, 28 Aug 2024 12:25:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zxRXBCIXz2b8EQAAD6G6ig
	(envelope-from <chrubis@suse.cz>); Wed, 28 Aug 2024 12:25:06 +0000
Date: Wed, 28 Aug 2024 14:23:58 +0200
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
Message-ID: <Zs8W3nQszwhbSiT9@yuki.lan>
References: <202408211026.636ade1a-oliver.sang@intel.com>
 <767d1908-dc30-42ae-9a8a-d2ad42a4d491@redhat.com>
 <8bde28af-3401-4d72-b821-d8cf01bbcd64@redhat.com>
 <Zs7-A5S_ivFlosrj@yuki.lan>
 <c6fb5f16-59bb-47a5-a2dd-3c4207d73614@redhat.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6fb5f16-59bb-47a5-a2dd-3c4207d73614@redhat.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

Hi!
> I am not yet sure if we should simply allow either -EFAULT or -ENOENT for
> the "nothing mapped" case in the check (below).
>
> Alternatively, I agree, wee need to have this in the kernel so we can
> check for versions.
> 
> What would be your preference?

If we are going to stick to ENOENT for page that wasn't faulted in the
kernel from now on we should stick to it in the test as well.

Also I think there is a third case that we do not cover either, what
happens when we pass an address that is not mapped at all, e.g. NULL? Do
we get EFAULT as well?

-- 
Cyril Hrubis
chrubis@suse.cz
