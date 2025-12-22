Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10124323417
	for <oe-lkp@lists.linux.dev>; Mon, 22 Dec 2025 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766419878; cv=none; b=FKnfY/mTR4YFRIuJx5Ot2NrD1vxAfGgqMkROnEI/pD45aUAfiCHrpLaa/V7YYJ1xjpwwpCuBq9MAOgk+lyhlMScPScV5Ch9qdDr4gb+HEGNBti8ed70zDKW27xrcKQ3kYw8ITgI8lfaLfeB9qKJoAYG0jo8zg+QvXM6Ji16DgTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766419878; c=relaxed/simple;
	bh=Y7DOTmpHW+R2yRI0bP4JiHZxskD11cZdGEJbpTh+Kos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyfoWd5dSr1s+wBleSact7riKKTH5p/5lf3uznT8oM6vsuTtaIDFT9yq+DSt3ehsVEoaFnghp6yp8Xqk99n1AM2oYqxoauUe0K8cdhunkEqVQOaVGMFxXrwxBa9nH70zqsHMWpVfVN7TT+nkGaX4Bkemhb46O2lADK4VkmzskgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=tqoxDoaC; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Lot4pniX; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=zTarqlek; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=GkX85H+l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="tqoxDoaC";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Lot4pniX";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="zTarqlek";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="GkX85H+l"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 259935BCDA;
	Mon, 22 Dec 2025 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1766419875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AKhTDzTzmD5iKvmoTGnpWCFjsyMXUoyPigq7m7JqQmY=;
	b=tqoxDoaCPc0AcEMn8QE74YblxKt9/oimhQ/BHAoTpP1C99doouK9n+IyOegyLASbV3qjic
	Qqgy1AJMctRb5iCqXWWKMmAVSyI4CZwqX4G2+VAcrJluoM1wDwRgRDmHtixSejVfqm62h8
	aUI3OqUzAvXUiP1wVEUEHFNHrznOW+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1766419875;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AKhTDzTzmD5iKvmoTGnpWCFjsyMXUoyPigq7m7JqQmY=;
	b=Lot4pniXzhejp6mYqaooYLLzLxgZEPH5ZmJiRJABivVIoavxBPSRycSKChtinWIiIV99mI
	CVf6R2LieI5wsEBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1766419874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AKhTDzTzmD5iKvmoTGnpWCFjsyMXUoyPigq7m7JqQmY=;
	b=zTarqlekhFb2QnZCpQJSi7bSo8COvZ6VOBOFx3svvXRaGYKEsxuTgzcgwB8V3y+A3hFB2o
	dUA1XDuP5/DJwKAjwCEP4/VWaMu0+NIQd1J/QohOpGGyrvTIrV6Daqmcuhk3K5+2TVpqHp
	vd0S0VE2ybBqEYbCOAvPtOLXKnUdEb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1766419874;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AKhTDzTzmD5iKvmoTGnpWCFjsyMXUoyPigq7m7JqQmY=;
	b=GkX85H+luA75Q/QWZBgVSB9T0h/0H7IeLCqBIt992Km9Iaezk7kxHP4+O0lQ+3R54bb5A5
	B3W6CGw8T6GPtYAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 075213EA63;
	Mon, 22 Dec 2025 16:11:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I6J/AaJtSWnDFAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 22 Dec 2025 16:11:14 +0000
Message-ID: <5a1721bc-e7e8-40e8-b2b9-c071d18a0112@suse.cz>
Date: Mon, 22 Dec 2025 17:11:13 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [mm/vmalloc] a061578043:
 BUG:spinlock_trylock_failure_on_UP_on_CPU
To: Matthew Wilcox <willy@infradead.org>,
 kernel test robot <oliver.sang@intel.com>
Cc: Vishal Moola <vishal.moola@gmail.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
 Mel Gorman <mgorman@techsingularity.net>
References: <202512101320.e2f2dd6f-lkp@intel.com>
 <aUW05pyc9nZkvY-1@casper.infradead.org>
 <aUXhy1Jyv7_GccIp@casper.infradead.org>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <aUXhy1Jyv7_GccIp@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,intel.com,vger.kernel.org,linux-foundation.org,kvack.org,techsingularity.net];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

On 12/20/25 00:37, Matthew Wilcox wrote:
> On Fri, Dec 19, 2025 at 08:26:14PM +0000, Matthew Wilcox wrote:
>> Now, as I recall, we are very much doing this on purpose.  We decided
>> not to disable interrupts at this point for improved interrupt
>> latency, accepting the possibility that we'd occasionally fail
>> the trylock.  Except on UP that's now an assertion failure.

IIRC the primary motivation wasn't irq latency, it was to avoid IPIs for
remote drains. So the drain_pages_zone() can be in fact locking pcp of
another cpu, and any local operations on that cpu are then supposed to fail
their trylock (should be relatively rare). Disabling irqs would then make no
sense for protecting other cpu.

> This is stupid and wrong.  If we have CONFIG_SMP=n and
> CONFIG_DEBUG_SPINLOCK=n, then trylock always succeeds.  And we'll end
> up corrupting the data structure protected by the lock.  So the warning
> is real, and we need to fix this.

That seems to be true and we should probably be doing spin_lock_irqsave() on
UP instead of spin_lock() in drain_pages_zone() and several other places.
Ideally via some wrappers like we have for the trylock operations that also
do some UP-specific stuff - pcp_spin_trylock() and pcp_spin_trylock().

> With my distro hat on, I do not give two hoots.  We don't ship a nosmp
> kernel.  I suspect all other distros (except maybe something targetting
> m68k?) are in the same boat.

Yeah seems the problem was introduced at 6.2 with commit 574907741599
("mm/page_alloc: leave IRQs enabled for per-cpu page allocations") or
something around that.

I'm off until Jan 5th so won't be developing a fix until then, but agree it
doesn't seem that urgent now.

