Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD2B3D3BD
	for <oe-lkp@lists.linux.dev>; Tue, 18 Jun 2024 06:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718692638; cv=none; b=bzAimYMdOyKWwcFMdR4nxPFpJzjnFkdzd8R8mWPhA9mDO3viSA2PLzcF87QV/3ss0/9S5lMdBUtECK7+8xUzME50Mb7cvAc4/egRwjDnSBsLs/Ym3QV7u9OJKO2jOc7BAxNNBQS3v5kHjgXUcKY1EjYKAvOWjCFTL4cEaaqc7oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718692638; c=relaxed/simple;
	bh=kKG3LoaN8i1fZM2+Uiv01A/APKBv0KTnskvfgtA2EZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThdIGjkQF2u/djIE3Qs0t6OxraOhZHVxap1YLeTw6cINesNpZQe8OWxLbd9oIUIK+MbELlI2qjD+zYr+nOcBJvP7v5xMpyUonQU3EomC02pSOYXouCcohwpdxEhiTkA+3ivwVis6oeJhJmG+458TB0kejahJW6IleDBXWjDK6es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42181803bf2so3689645e9.1
        for <oe-lkp@lists.linux.dev>; Mon, 17 Jun 2024 23:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718692635; x=1719297435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVwea0+I4NLq7+dG08BtNHJMsBWeqSrLkoIHm1db4Ns=;
        b=b5nVzyxWXWm5UIsBhQeVerb8GRqvf75oHerdG0tLlAiwEaQwvuHMs4o+z1y960sroO
         GqP3+9rZSEoGmkGVM5YugG+bxZ57dfqs5FWYmqrxoQYxYzq5eS9y6Q3UsUyuIlf30R+8
         3pC/BLfOHZkgp5/m8p5FcS1J8hSbCz5bDsHBBTGcIjVw8xzTJB/SRwuibqUDS1WYJHMO
         q/ABwd6F/V7S24QBOX0mNhKpSE7FHRHCLj4hamQ9g2Vkg/crweAd0Ixbw5i06iL3BOj2
         06Ot+s/+Sj/s+Nf/S8fJHja1HumsPTFAEhqr8G2l3iyjkJp4m4H+WndafWYDEPp9pvsN
         phZA==
X-Forwarded-Encrypted: i=1; AJvYcCUR+aHDFOh1r8oeo5g4TDOboysAJpbxXS90CwwH9oKAJb5osUBeqIFW3qsb4r/F5LK+ZPika6zN4C2Iigvg92lU2cJqgFVq
X-Gm-Message-State: AOJu0YzSkhUzbaGEn5P5O4Lkb1S0SPsp2myD8A0pX3YCYqQq9wJQiI+F
	tgp+vXAh5b+HWPJoVjlF5cEDT/p3Pr4ZvQCYhGgyMExyXkg8nqUP
X-Google-Smtp-Source: AGHT+IFKxoltx8QthQmyCM/c9GPuthf8xjdKeq4pYbybe/TjWnMmRWa0nSdlcb2tEF3VMCGD5KOgdQ==
X-Received: by 2002:a05:600c:5118:b0:422:615f:647d with SMTP id 5b1f17b1804b1-423048226a8mr82144435e9.1.1718692635054;
        Mon, 17 Jun 2024 23:37:15 -0700 (PDT)
Received: from [10.50.4.180] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f602e802sm180084745e9.11.2024.06.17.23.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 23:37:14 -0700 (PDT)
Message-ID: <90819fe9-d5e5-4519-9cb5-9df6e245410c@grimberg.me>
Date: Tue, 18 Jun 2024 09:37:12 +0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: micro-optimize skb_datagram_iter
To: Jakub Kicinski <kuba@kernel.org>, David Howells <dhowells@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>
References: <202406161539.b5ff7b20-oliver.sang@intel.com>
 <4937ffd4-f30a-4bdb-9166-6aebb19ca950@grimberg.me>
 <Zm9fju2J6vBvl-E0@casper.infradead.org>
 <033294ee-e6e6-4dca-b60c-019cb72a6857@grimberg.me>
 <20240617095852.66c96be9@kernel.org>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20240617095852.66c96be9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/06/2024 19:58, Jakub Kicinski wrote:
> On Mon, 17 Jun 2024 09:29:53 +0300 Sagi Grimberg wrote:
>>> Probably because kmap() returns page_address() for non-highmem pages
>>> while kmap_local_page() actually returns a kmap address:
>>>
>>>           if (!IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP) && !PageHighMem(page))
>>>                   return page_address(page);
>>>           return __kmap_local_pfn_prot(page_to_pfn(page), prot);
>>>
>>> so if skb frags are always lowmem (are they?) this is a false positive.
>> AFAIR these buffers are coming from the RX ring, so they should be
>> coming from a page_frag_cache,
>> so I want to say always low memory?
>>
>>> if they can be highmem, then you've uncovered a bug that nobody's
>>> noticed because nobody's testing on 32-bit any more.
>> Not sure, Jakub? Eric?
> My uneducated guess would be that until recent(ish) sendpage rework
> from David Howells all high mem pages would have been single pages.

dHowells?
