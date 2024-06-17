Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639E6181315
	for <oe-lkp@lists.linux.dev>; Mon, 17 Jun 2024 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718605799; cv=none; b=kDkm2dU3HjdeeV9YC2bzBS5ZMDk9vbrSmz7JPDBc9jmEbzTsBpf+s/GZoaQKOgqK3b5seiuycyI1AqKnTSia/UbhK+LlC3eePfhUU1kkAt9DVwls+wL5S0rBWG1brjB4BKBtvgzXz0AA0LPhZwt5qMGXgk1EJWyx35sh3l32GVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718605799; c=relaxed/simple;
	bh=7L2L+mqB2GnpxBgXJomqOiBE6YgsK74wzFa9vHbYSa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBk7R2nSetcFbKT66j96JZ4EkZhMQjwDi921tI+Pv9gShLofy4PaqMkpuJFT8qlwjKstBQDurhuv9oGPdGcG4YVAGEmxSy+ETiHvQW5UqrM4NpM9l1GD1YuULehazZzyjk4p3yhIVw2mstd5TlKOeBuuGUzL8VBpFZNS7l9f2tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f0b9a1dd7so315649f8f.0
        for <oe-lkp@lists.linux.dev>; Sun, 16 Jun 2024 23:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718605796; x=1719210596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WVUiwuGsa9k+yiZxjURTV+XS0g5oBgiJFPhcdonfit8=;
        b=PfAW9hDsLs05isVASUXpqJCniey1/hq3vGslaO5ykJ7XlG2EyGr+t2PhJArE254fKl
         bfKbkbvWEIAS1wU07OLcvXWD2yLBuO2/Fe1jsb2bYZGnF9tCnJXcxYor5sY41kyVBtKt
         ZK+P9529WSm37Wifpenv0Vh9ppqhTzapJjty2Z62Fsz2wF0x2JTG3gCOs+mKO8Oo5F5/
         0WsC+Zouz1e01o4Vs6h8X7KhwAnhCa4zIK1S3skIGXnNlxHH77sjw2O4gXnScAq5zDNp
         igljUcKj+WsBG6YeC7uDmMCJk2RGWTYzN7iQA3PK+TUEZ95zoWcJFQA7YIbxsYaaP+I+
         4Z2A==
X-Forwarded-Encrypted: i=1; AJvYcCWLjkUUnNPt5LJqHMD0EQGsTbD6xDXL7C9eP5EWGC72UWIyrvPOctXjdZIgwupccNIWfKZLPuj6CSXQ7W+5YIcPqZXWgG0a
X-Gm-Message-State: AOJu0Yz7RUjRwr9l1XHtqiONAkXX9dY+yM5fBPhOcWct1ixkOWiISRcB
	vc7Ek/nUKbmJQ3w9nrkD11g+wzumGFxAkAC2YDD0wYPUYYoJeBgh
X-Google-Smtp-Source: AGHT+IFMMekEYVXUKHOIgRQ5y3J5UG5+EOGA2WdnkSS7BWEOiCg9rgyh0bAkFBTRKufFCJSYKijz6w==
X-Received: by 2002:a05:600c:3510:b0:421:7dc3:99ff with SMTP id 5b1f17b1804b1-42304852324mr67975845e9.3.1718605795415;
        Sun, 16 Jun 2024 23:29:55 -0700 (PDT)
Received: from [10.50.4.180] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c7e5sm11261973f8f.30.2024.06.16.23.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 23:29:55 -0700 (PDT)
Message-ID: <033294ee-e6e6-4dca-b60c-019cb72a6857@grimberg.me>
Date: Mon, 17 Jun 2024 09:29:53 +0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: micro-optimize skb_datagram_iter
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
References: <202406161539.b5ff7b20-oliver.sang@intel.com>
 <4937ffd4-f30a-4bdb-9166-6aebb19ca950@grimberg.me>
 <Zm9fju2J6vBvl-E0@casper.infradead.org>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <Zm9fju2J6vBvl-E0@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17/06/2024 0:56, Matthew Wilcox wrote:
> On Sun, Jun 16, 2024 at 12:24:28PM +0300, Sagi Grimberg wrote:
>>> [   13.495377][  T189] ------------[ cut here ]------------
>>> [   13.495862][  T189] kernel BUG at mm/usercopy.c:102!
>>> [   13.496372][  T189] Oops: invalid opcode: 0000 [#1] PREEMPT SMP
>>> [   13.496927][  T189] CPU: 0 PID: 189 Comm: systemctl Not tainted 6.10.0-rc2-00258-g18f0423b9ecc #1
>>> [   13.497741][  T189] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
>>> [ 13.498663][ T189] EIP: usercopy_abort (mm/usercopy.c:102 (discriminator 12))
>>> [   13.499424][  T194] usercopy: Kernel memory exposure attempt detected from kmap (offset 0, size 8192)!
>> Hmm, not sure I understand exactly why changing kmap() to kmap_local_page()
>> expose this,
>> but it looks like mm/usercopy does not like size=8192 when copying for the
>> skb frag.
>>
>> quick git browse directs to:
>> --
>> commit 4e140f59d285c1ca1e5c81b4c13e27366865bd09
>> Author: Matthew Wilcox (Oracle) <willy@infradead.org>
>> Date:   Mon Jan 10 23:15:27 2022 +0000
>>
>>      mm/usercopy: Check kmap addresses properly
>>
>>      If you are copying to an address in the kmap region, you may not copy
>>      across a page boundary, no matter what the size of the underlying
>>      allocation.  You can't kmap() a slab page because slab pages always
>>      come from low memory.
>>
>>      Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>>      Acked-by: Kees Cook <keescook@chromium.org>
>>      Signed-off-by: Kees Cook <keescook@chromium.org>
>>      Link:
>> https://lore.kernel.org/r/20220110231530.665970-2-willy@infradead.org
>> --
>>
>> CCing willy.
>>
>> The documentation suggest that under single-context usage kmap() can be
>> freely converted
>> to kmap_local_page()? But seems that when using kmap() the size is not an
>> issue, still trying to
>> understand why.
> Probably because kmap() returns page_address() for non-highmem pages
> while kmap_local_page() actually returns a kmap address:
>
>          if (!IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP) && !PageHighMem(page))
>                  return page_address(page);
>          return __kmap_local_pfn_prot(page_to_pfn(page), prot);
>
> so if skb frags are always lowmem (are they?) this is a false positive.

AFAIR these buffers are coming from the RX ring, so they should be 
coming from a page_frag_cache,
so I want to say always low memory?

> if they can be highmem, then you've uncovered a bug that nobody's
> noticed because nobody's testing on 32-bit any more.

Not sure, Jakub? Eric?
