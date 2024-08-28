Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBD3158DC2
	for <oe-lkp@lists.linux.dev>; Wed, 28 Aug 2024 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724841547; cv=none; b=Ynxt+OeFCPjr3VFcCsP21xdv5YSK/ZDH2uLyH/lMUoJd/jP/sP3fPPUKU+gzSUgL4+OdcJJRzSPG1yUCeyNC3KGcYvQi1l/oml/QyYzIje9UIuu7dodtlWXKkkTTy1tfOX80CN9gbmkUEkl9xTdcvqbqSfxiNqzbrBddX0XZ100=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724841547; c=relaxed/simple;
	bh=h3AZZmZriezYau3YhtDzxonqeXfDKydB6fTwOOfmoFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XL/ZuZtihoKXCi+Aj3ytgAMh+c2hwFAr1NORa75/soCaeCgTiSRi7Oq0aOm94fAhIv0mJqKu+TNbZ8UnOVoimBO4+QXSbYIy0cI6I4rto6IQ2rVVn77Gbl4D/5Uv9BA0pVOEgqAULcj/7APNyALO70cqSs/nexIfE0B9XgQCjz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZNeXd6/H; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=8vRFAMNB; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZNeXd6/H; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=8vRFAMNB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZNeXd6/H";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="8vRFAMNB";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZNeXd6/H";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="8vRFAMNB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9DC0F1FBED;
	Wed, 28 Aug 2024 10:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724841543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Et7WtT1cDmNJ0huU9w473Ep4G+P2YOf6Te1HA86wFR0=;
	b=ZNeXd6/HyNzMHQzfjuy+G/7YepSnq3K9WsKk/pMbC3lG4RwxwRezfsyq8q05k8UCc+7fxd
	zxYPOsA/E4KTiSIk9ssHgepspwh6uE+Bta+eO2pbBL+4sKSFa7Oppk0u+1Ff8+5F7rciJP
	Cbw2OIPFk1R9PObb/YjiS2FIfHThEVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724841543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Et7WtT1cDmNJ0huU9w473Ep4G+P2YOf6Te1HA86wFR0=;
	b=8vRFAMNBZketU4Ad7IPRLZMEfRPFq5qnoAzug5u89rNo/mclgJ7lRiCNXfKLUjdjF39+k7
	RMxsxWvuORmcuGAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724841543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Et7WtT1cDmNJ0huU9w473Ep4G+P2YOf6Te1HA86wFR0=;
	b=ZNeXd6/HyNzMHQzfjuy+G/7YepSnq3K9WsKk/pMbC3lG4RwxwRezfsyq8q05k8UCc+7fxd
	zxYPOsA/E4KTiSIk9ssHgepspwh6uE+Bta+eO2pbBL+4sKSFa7Oppk0u+1Ff8+5F7rciJP
	Cbw2OIPFk1R9PObb/YjiS2FIfHThEVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724841543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Et7WtT1cDmNJ0huU9w473Ep4G+P2YOf6Te1HA86wFR0=;
	b=8vRFAMNBZketU4Ad7IPRLZMEfRPFq5qnoAzug5u89rNo/mclgJ7lRiCNXfKLUjdjF39+k7
	RMxsxWvuORmcuGAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82B28138D2;
	Wed, 28 Aug 2024 10:39:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8fudH0f+zmZfbQAAD6G6ig
	(envelope-from <chrubis@suse.cz>); Wed, 28 Aug 2024 10:39:03 +0000
Date: Wed, 28 Aug 2024 12:37:55 +0200
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
Message-ID: <Zs7-A5S_ivFlosrj@yuki.lan>
References: <202408211026.636ade1a-oliver.sang@intel.com>
 <767d1908-dc30-42ae-9a8a-d2ad42a4d491@redhat.com>
 <8bde28af-3401-4d72-b821-d8cf01bbcd64@redhat.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bde28af-3401-4d72-b821-d8cf01bbcd64@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
X-Spam-Score: -4.30
X-Spam-Flag: NO

Hi!
> Okay, and it even looks like the test caught the unintended change for 
> "unpopulated memory", but instead we decided to change the test to 
> expect the other return code ... because there was some confusion about 
> "zero page".
> 
> Long story short: the test needs to be fixed.

Will do, but we need the patch to land into some kernel version first so
taht we can add the range of kernels where the kernel wrongly returns
EFAULT.

Or alternatively if you are going to backport this to stable trees we
can revert the test change that expect -EFAULT so the test expects only
-ENOENT.

-- 
Cyril Hrubis
chrubis@suse.cz
