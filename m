Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ED08F7E
	for <oe-lkp@lists.linux.dev>; Fri, 27 Oct 2023 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bQO6k4cq";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="c1y1CkuY"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2D6271FDD5;
	Fri, 27 Oct 2023 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1698393406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUVs0JJZHErbqDhBpuYqzhnE1xbQoOQQGaXgoaRPqkI=;
	b=bQO6k4cqc71OZvlliRK7VSx2gixr5TeSfdknduQK3b3l0nxq64olUqlGl+xlRDKsHyQey+
	Cu4C/hxNQh+fykl2iB2qkwvi5PQidKmkY5FKhjo2NDj/VQ0kZwW+pSm6CXjYQZwkbvLYBv
	0PKXAY6gi8Pz/TyG/FruHZ28plcSjz0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1698393406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUVs0JJZHErbqDhBpuYqzhnE1xbQoOQQGaXgoaRPqkI=;
	b=c1y1CkuYq1z4PzAkJewoZQvs19HSmdX/U9dMNgDQl7mqxgJj2YIDA3VqZAPa2xgAKlLgLU
	R4h+syyl0yRcF7Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0934D1358C;
	Fri, 27 Oct 2023 07:56:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mBWHAT5tO2VVJAAAMHmgww
	(envelope-from <vbabka@suse.cz>); Fri, 27 Oct 2023 07:56:46 +0000
Message-ID: <6e6435e3-37a5-f613-4333-18df30500847@suse.cz>
Date: Fri, 27 Oct 2023 09:56:45 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [linux-next:master] [mm/slub] 5886fc82b6:
 will-it-scale.per_process_ops -3.7% regression
To: Feng Tang <feng.tang@intel.com>, "Sang, Oliver" <oliver.sang@intel.com>
Cc: "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Jay Patel <jaypatel@linux.ibm.com>, "Huang, Ying" <ying.huang@intel.com>,
 "Yin, Fengwei" <fengwei.yin@intel.com>
References: <202310202221.fdbcbe56-oliver.sang@intel.com>
 <ZTtpZgliuj/9WTOb@feng-clx>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <ZTtpZgliuj/9WTOb@feng-clx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.95
X-Spamd-Result: default: False [-4.95 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.85)[85.36%];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 10/27/23 09:40, Feng Tang wrote:
> On Fri, Oct 20, 2023 at 10:21:28PM +0800, Sang, Oliver wrote:
>> 
>> 
>> Hello,
>> 
>> kernel test robot noticed a -3.7% regression of will-it-scale.per_process_ops on:
> 
> I was surprised to see this initially, as I know this patch which
> only affects the order of a few slabs in a certain size range, and
> 0Day has enabled the 64 bytes alignment for function address.
> 
> One only big difference of perf hot spot is
> 
>>      19.62            +1.9       21.54        perf-profile.self.cycles-pp.__fget_light
> 
> but its code flow and data doesn't have much to do with the commit.
> 
> I manually run the test case, and didn't see the affected slabs 
> actively used by checking 'slabtop'
> 
> Then I hacked to move slub.c to a very late position when linking
> kernel image, so that very few other kernel modules' alignment will
> be affected, and the regression is gone.
> 
> So this seems to be another strange perf change caused by text code
> alignment changes. similar to another recent case of MCE patch 
> https://lore.kernel.org/lkml/202310111637.dee70328-oliver.sang@intel.com/

I suspected it would be something like this, thanks for confirming!

