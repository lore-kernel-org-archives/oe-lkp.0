Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479A29453
	for <oe-lkp@lists.linux.dev>; Wed,  8 Feb 2023 09:15:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5DD3C33D56;
	Wed,  8 Feb 2023 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1675847746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6i3DQ9ADagvo6tUvd/7VoA0Rk5hn/gfeYkFT3pxlEFQ=;
	b=krBSNn42FpsDhDwCLLag/72t40la7FaIaRdUbLsR2hn0hI6Uri/GYRZ7Nd9d+iWJO2GhcU
	Xh2AKLT10AW7WEM+wF2I0nYmoO2R6JDw0pJd7v8AYKaqMn5Vu+CgnN3kG4FQI3zYk+mXhs
	haaSEpkgZL6go8RI9x4AJLZZ34xrc74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1675847746;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6i3DQ9ADagvo6tUvd/7VoA0Rk5hn/gfeYkFT3pxlEFQ=;
	b=t8eM9FTTqx3vUd8b1lG0eXuBOGGgUS+jr91RhQE+QuiZ4SEGoF72wI6Zuxl0IMLy2j/CxQ
	FCexphRlc1t3BsAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C81713A1F;
	Wed,  8 Feb 2023 09:15:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id PvhFAkJo42NWEwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Wed, 08 Feb 2023 09:15:46 +0000
Message-ID: <e3a8f265-ea15-35ba-e46e-89024e83db47@suse.cz>
Date: Wed, 8 Feb 2023 10:15:45 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: mm, slab/slub: Ensure kmem_cache_alloc_bulk() is available early
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>,
 kernel test robot <oliver.sang@intel.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Michael Walle <michael@walle.cc>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Hans de Goede <hdegoede@redhat.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mm@kvack.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>
References: <202302011308.f53123d2-oliver.sang@intel.com>
 <87o7qdzfay.ffs@tglx> <9a682773-df56-f36c-f582-e8eeef55d7f8@suse.cz>
 <875ycdwyx6.ffs@tglx> <871qn1wofe.ffs@tglx>
 <6c0b681e-97bc-d975-a8b9-500abdaaf0bc@suse.cz>
 <8b7762c3-02be-a5c9-1c4d-507cfb51a15c@suse.cz> <87edr1uykw.ffs@tglx>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <87edr1uykw.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/23 19:20, Thomas Gleixner wrote:
> On Tue, Feb 07 2023 at 15:47, Vlastimil Babka wrote:
>> From 340d7c7b99f3e67780f6dec480ed1d27e6f325eb Mon Sep 17 00:00:00 2001
>> From: Vlastimil Babka <vbabka@suse.cz>
>> Date: Tue, 7 Feb 2023 15:34:53 +0100
>> Subject: [PATCH] mm, slab/slub: remove notes that bulk alloc/free needs
>>  interrupts enabled
>>
>> The slab functions kmem_cache_[alloc|free]_bulk() have been documented
>> as requiring interrupts to be enabled, since their addition in 2015.
>> It's unclear whether that was a fundamental restriction, or an attempt
>> to save some cpu cycles by not having to save and restore the irq
>> flags.
> 
> I don't think so. The restriction is rather meant to avoid huge
> allocations in atomic context which causes latencies and also might
> deplete the atomic reserves.

Fair enough.

> So I rather avoid that and enforce !ATOMIC mode despite the
> local_irq_save/restore() change which is really only to accomodate with
> early boot.

We could add some warning then? People might use the bulk alloc unknowingly
again e.g. via maple tree. GFP_KERNEL would warn through the existing
warning, but e.g. GFP_ATOMIC currently not.
Some maple tree users could use its preallocation instead outside of the
atomic context, when possible.

> Thanks,
> 
>         tglx

