Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE32DDBF
	for <oe-lkp@lists.linux.dev>; Tue,  8 Aug 2023 09:59:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 837582031A;
	Tue,  8 Aug 2023 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1691488750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tv+ZghxAfCxLOqZPv3CyvrkPVy+sfVKBpO+7ooghzNk=;
	b=zmsfjY6MRT3flhWagijVnhr8jPGbN3zAgkpJOfcsB4bcaAR7mhSQRwNNq6n+ky5zdSzqQ+
	yumoGduk17gLNstsul9Ieau2UP+QMgym7MBEws4DCxT2VNx4275QZxd97z80ftLG+SsHTr
	GBn20N5Wlc8XSE3UfXVhtUHkLvb2BdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1691488750;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tv+ZghxAfCxLOqZPv3CyvrkPVy+sfVKBpO+7ooghzNk=;
	b=KWaTPpkpsC9NB1tTzYPgMjlapotcodSopYQoVZ0P7r4c7NN+Xny4dVC8VbjSvYXtiWj2YY
	iopgwM1rVG4IlICw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38A2113451;
	Tue,  8 Aug 2023 09:59:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id pPQqDe4R0mT/JwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Tue, 08 Aug 2023 09:59:10 +0000
Message-ID: <df1b15c3-e665-e23b-a4f9-cc554352eda8@suse.cz>
Date: Tue, 8 Aug 2023 11:59:09 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC 2/2] mm/slub: prefer NUMA locality over slight memory saving
 on NUMA machines
Content-Language: en-US
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>, Feng Tang <feng.tang@intel.com>,
 "Sang, Oliver" <oliver.sang@intel.com>, Jay Patel <jaypatel@linux.ibm.com>,
 Binder Makin <merimus@google.com>, aneesh.kumar@linux.ibm.com,
 tsahu@linux.ibm.com, piyushs@linux.ibm.com, fengwei.yin@intel.com,
 ying.huang@intel.com, lkp <lkp@intel.com>,
 "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20230723190906.4082646-1-42.hyeyoo@gmail.com>
 <20230723190906.4082646-3-42.hyeyoo@gmail.com>
 <1f88aff2-8027-1020-71b2-6a6528f82207@suse.cz>
 <CAB=+i9R52jLzD9eAMxhRTMHTFDmAGPDPcD0pwCxxDwq5yFZbxQ@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAB=+i9R52jLzD9eAMxhRTMHTFDmAGPDPcD0pwCxxDwq5yFZbxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/7/23 10:39, Hyeonggon Yoo wrote:
> On Thu, Aug 3, 2023 at 11:54 PM Vlastimil Babka <vbabka@suse.cz> wrote:
>>
> 
> Thank you for looking at it!
> 
> Yeah, it was a PoC for what I thought "oh, it might be useful"
> and definitely I will try to measure it.
> 
>> We could also postpone this until we have tried the percpu arrays
>> improvements discussed at LSF/MM.
> 
> Possibly, but can you please share your plans/opinions on it?

Here's the very first attempt :)
https://lore.kernel.org/linux-mm/20230808095342.12637-7-vbabka@suse.cz/

> I think one possible way is simply to allow the cpu freelist to be
> mixed by objects from different slabs

I didn't try that way, might be much trickier than it looks.

> if we want to minimize changes, Or introduce a per cpu array similar
> to what SLAB does now.

Yes.

> And one thing I'm having difficulty understanding is - what is the
> mind behind/or impact of managing objects
> on a slab basis, other than avoiding array queues in 2007?

"The mind" is Christoph's so I'll leave that question to him :)
