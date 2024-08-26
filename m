Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0FF19AA41
	for <oe-lkp@lists.linux.dev>; Mon, 26 Aug 2024 20:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724704054; cv=none; b=Ijsyo5vjgbKkckgPM4QWdG6pt+HwXhuByKe1Kta93f/nVlimcceiwNd/qZBdiumXe7qCY1fa+15b5KRLOQ4LUDZC3+5Veu9oxEirTxl0W2nXhryPExN6Tw2Ga1Gf/EyMck0MMh1Zw5+2ByIyUO3LekT323yCCgY55aNup+Pk+10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724704054; c=relaxed/simple;
	bh=jJJZm9KBAfOmijf7JoDGV39xtSB1B8gZTCkPm4LKWr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3kQ4bznpzQBUBGbbPRjGXLdqCeCkuY3RrXejv9MJ7ry5qiF4N0X9PF2HcHCI3S+FhsSLqQTK/XHuRsXOqzm3gcKXrPtJFMScrXP/Ck/p0lhGULsSM0dPX+ethd9cHgyIIY3tYNjICXj+KSt6+PG5CymTh4/qtYONfQ70/eMpw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xrz5hmbG; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=hWSQNOxu; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xrz5hmbG; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=hWSQNOxu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xrz5hmbG";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="hWSQNOxu";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xrz5hmbG";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="hWSQNOxu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6B1511F8AE;
	Mon, 26 Aug 2024 20:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724704049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tKyaYIvThFI4rSLLMtBRxA0iwJL7PQ25bt4xJ6byBIo=;
	b=xrz5hmbGabIensZOuky19zZls7eSUIUSI+MRvCbylA4Y60LaAI9YcvgCcD/X3TyztcMnNg
	0iG51Ce1o5c+Rq83w5jZg+qys1eCvaDy8NvlaZvmAG6iM7gi9FYNQuCY+y+dI4GjtpwTF1
	EYzcToyGSCACcbDsx+9MMr9nL9ecvYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724704049;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tKyaYIvThFI4rSLLMtBRxA0iwJL7PQ25bt4xJ6byBIo=;
	b=hWSQNOxuwJGPgjOG9S68TncKJ0RnAiUq8Oibd94G3oZYHlaUqbv2mcX8k3Oynu8abme2HL
	xOs1VleckKqYlWDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724704049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tKyaYIvThFI4rSLLMtBRxA0iwJL7PQ25bt4xJ6byBIo=;
	b=xrz5hmbGabIensZOuky19zZls7eSUIUSI+MRvCbylA4Y60LaAI9YcvgCcD/X3TyztcMnNg
	0iG51Ce1o5c+Rq83w5jZg+qys1eCvaDy8NvlaZvmAG6iM7gi9FYNQuCY+y+dI4GjtpwTF1
	EYzcToyGSCACcbDsx+9MMr9nL9ecvYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724704049;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tKyaYIvThFI4rSLLMtBRxA0iwJL7PQ25bt4xJ6byBIo=;
	b=hWSQNOxuwJGPgjOG9S68TncKJ0RnAiUq8Oibd94G3oZYHlaUqbv2mcX8k3Oynu8abme2HL
	xOs1VleckKqYlWDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50E2713724;
	Mon, 26 Aug 2024 20:27:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id n7gYEzHlzGZkRwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 26 Aug 2024 20:27:29 +0000
Message-ID: <4fbe9507-13b9-4af5-88c3-63379835f386@suse.cz>
Date: Mon, 26 Aug 2024 22:27:29 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [slub] 3a34e8ea62:
 BUG:KASAN:slab-use-after-free_in_kmem_cache_rcu_uaf
Content-Language: en-US
To: Jann Horn <jannh@google.com>, kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>,
 kasan-dev@googlegroups.com
References: <202408251741.4ce3b34e-oliver.sang@intel.com>
 <CAG48ez1o2GvYuMxox5HngG57CFcZYVJ02PxF_20ELN7e29epCA@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSBWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBzdXNlLmN6PsLBlAQTAQoAPgIbAwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBKlA1DSZLC6OmRA9UCJPp+fMgqZkBQJkBREIBQkRadznAAoJECJPp+fMgqZkNxIQ
 ALZRqwdUGzqL2aeSavbum/VF/+td+nZfuH0xeWiO2w8mG0+nPd5j9ujYeHcUP1edE7uQrjOC
 Gs9sm8+W1xYnbClMJTsXiAV88D2btFUdU1mCXURAL9wWZ8Jsmz5ZH2V6AUszvNezsS/VIT87
 AmTtj31TLDGwdxaZTSYLwAOOOtyqafOEq+gJB30RxTRE3h3G1zpO7OM9K6ysLdAlwAGYWgJJ
 V4JqGsQ/lyEtxxFpUCjb5Pztp7cQxhlkil0oBYHkudiG8j1U3DG8iC6rnB4yJaLphKx57NuQ
 PIY0Bccg+r9gIQ4XeSK2PQhdXdy3UWBr913ZQ9AI2usid3s5vabo4iBvpJNFLgUmxFnr73SJ
 KsRh/2OBsg1XXF/wRQGBO9vRuJUAbnaIVcmGOUogdBVS9Sun/Sy4GNA++KtFZK95U7J417/J
 Hub2xV6Ehc7UGW6fIvIQmzJ3zaTEfuriU1P8ayfddrAgZb25JnOW7L1zdYL8rXiezOyYZ8Fm
 ZyXjzWdO0RpxcUEp6GsJr11Bc4F3aae9OZtwtLL/jxc7y6pUugB00PodgnQ6CMcfR/HjXlae
 h2VS3zl9+tQWHu6s1R58t5BuMS2FNA58wU/IazImc/ZQA+slDBfhRDGYlExjg19UXWe/gMcl
 De3P1kxYPgZdGE2eZpRLIbt+rYnqQKy8UxlszsBNBFsZNTUBCACfQfpSsWJZyi+SHoRdVyX5
 J6rI7okc4+b571a7RXD5UhS9dlVRVVAtrU9ANSLqPTQKGVxHrqD39XSw8hxK61pw8p90pg4G
 /N3iuWEvyt+t0SxDDkClnGsDyRhlUyEWYFEoBrrCizbmahOUwqkJbNMfzj5Y7n7OIJOxNRkB
 IBOjPdF26dMP69BwePQao1M8Acrrex9sAHYjQGyVmReRjVEtv9iG4DoTsnIR3amKVk6si4Ea
 X/mrapJqSCcBUVYUFH8M7bsm4CSxier5ofy8jTEa/CfvkqpKThTMCQPNZKY7hke5qEq1CBk2
 wxhX48ZrJEFf1v3NuV3OimgsF2odzieNABEBAAHCwXwEGAEKACYCGwwWIQSpQNQ0mSwujpkQ
 PVAiT6fnzIKmZAUCZAUSmwUJDK5EZgAKCRAiT6fnzIKmZOJGEACOKABgo9wJXsbWhGWYO7mD
 8R8mUyJHqbvaz+yTLnvRwfe/VwafFfDMx5GYVYzMY9TWpA8psFTKTUIIQmx2scYsRBUwm5VI
 EurRWKqENcDRjyo+ol59j0FViYysjQQeobXBDDE31t5SBg++veI6tXfpco/UiKEsDswL1WAr
 tEAZaruo7254TyH+gydURl2wJuzo/aZ7Y7PpqaODbYv727Dvm5eX64HCyyAH0s6sOCyGF5/p
 eIhrOn24oBf67KtdAN3H9JoFNUVTYJc1VJU3R1JtVdgwEdr+NEciEfYl0O19VpLE/PZxP4wX
 PWnhf5WjdoNI1Xec+RcJ5p/pSel0jnvBX8L2cmniYnmI883NhtGZsEWj++wyKiS4NranDFlA
 HdDM3b4lUth1pTtABKQ1YuTvehj7EfoWD3bv9kuGZGPrAeFNiHPdOT7DaXKeHpW9homgtBxj
 8aX/UkSvEGJKUEbFL9cVa5tzyialGkSiZJNkWgeHe+jEcfRT6pJZOJidSCdzvJpbdJmm+eED
 w9XOLH1IIWh7RURU7G1iOfEfmImFeC3cbbS73LQEFGe1urxvIH5K/7vX+FkNcr9ujwWuPE9b
 1C2o4i/yZPLXIVy387EjA6GZMqvQUFuSTs/GeBcv0NjIQi8867H3uLjz+mQy63fAitsDwLmR
 EP+ylKVEKb0Q2A==
In-Reply-To: <CAG48ez1o2GvYuMxox5HngG57CFcZYVJ02PxF_20ELN7e29epCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,intel.com,kvack.org,gmail.com,google.com,googlegroups.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,01.org:url,imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Spam-Flag: NO
X-Spam-Level: 

On 8/26/24 22:18, Jann Horn wrote:
> Hi!
> 
> On Sun, Aug 25, 2024 at 11:45 AM kernel test robot
> <oliver.sang@intel.com> wrote:
>> Hello,
>>
>> kernel test robot noticed "BUG:KASAN:slab-use-after-free_in_kmem_cache_rcu_uaf" on:
>>
>> commit: 3a34e8ea62cdeba64a66fa4489059c59ba4ec285 ("slub: Introduce CONFIG_SLUB_RCU_DEBUG")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>> [test failed on linux-next/master c79c85875f1af04040fe4492ed94ce37ad729c4d]
>>
>> in testcase: kunit
>> version:
>> with following parameters:
>>
>>         group: group-00
>>
>>
>>
>> compiler: gcc-12
>> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory
>>
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: https://lore.kernel.org/oe-lkp/202408251741.4ce3b34e-oliver.sang@intel.com
>>
>>
>> The kernel config and materials to reproduce are available at:
>> https://download.01.org/0day-ci/archive/20240825/202408251741.4ce3b34e-oliver.sang@intel.com
> 
> Oh, this is a weird one...

As I replied I think lkp simply reacts to the BUG: in dmesg and doesn't
filter it out as an expected test output.

> Do you happen to have either the vmlinux ELF file that this issue
> happened with, or a version of the bug report that's been run through
> scripts/decode_stacktrace.sh, so that we can tell whether the reported
> slab-use-after-free is on line 1029 (which would mean that either ASAN
> is not tracking the state of the object correctly or the object is

The reported freed stack suggests the object was already freed by rcu, so we
should be past the rcu_read_unlock();

> freed earlier than it should) or line 1039 (which would mean the
> KUNIT_EXPECT_KASAN_FAIL() is not working at it should)?

There's also "ok 38 kmem_cache_rcu_uaf" in the log so the kunit test macro
is satisfied.
