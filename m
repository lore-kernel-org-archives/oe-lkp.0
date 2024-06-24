Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D738C1BC20
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 18:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719255027; cv=none; b=kfK9TxOPSJYm9QcEjN6fTEkSE13LTrgmAfhDI2aKPgWQI7sVW5ayTLb9ErbJgCXKn7LlV2wvLojOK+2Ken9s0sd1eIOa8JrEIt7VNd8uQLY7TBk9Q1zhA/Ogyy4XmMTRAkhrzMDqBke+D0V5jlyo1SwmitlJD+rg31/aNMqylFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719255027; c=relaxed/simple;
	bh=qcsG6vyr1tXaw2vLVjmbHIg584Hl51LOJd9BkXwOpMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MximIRnDTyDbIL3vtZwgtg6LHfhQFlXDYuOV435E1V896oP5EzBvWUGJYq5iIeKc48XXQGsjIoVTdcSpuxgIaARsQ1jpcY2a7MLs6HDWjGrw1ZggYjLJ2Da+L6k6AL2daIQOJOAge/e3zh3epK/2dEBa2/GaIqiDmWDjXvWVbeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvDGT7G0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvDGT7G0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-421757d217aso51482375e9.3
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 11:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719255024; x=1719859824; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBiWnUshv9OkKg3tPzc7vkd68oaE09mot+Fd5BTkZ5w=;
        b=SvDGT7G0KT5qRI0Pi3Grv1PlXOk2VTljU5oI4y7uHFqAooamqPZcjAkwfHbVVN+841
         2gNKSPiSxbZQGeSptBjIcrbqxNARPeABgHh2W1SsHM8A0Ra8/WjPvOF+KNT4X0BhwsRn
         lxy1WSOkRdFQ8Q2lS0ILZkojbzExNPCCppRdAZRSmnyfJJ3NHOCLX4hd9g2XBbnT84HC
         1fBAUINvwKARw/ovAo1/d03fDecNcETtdF1Ms2Bt3KPZ0/IV31KZLGHok2/D6hzH5hKI
         xST4eq18mA6fj66ZBtYwHbis5AMFM/qFRQPoV3DCr30hasOcJxOjwpHIVplhc18c0o9V
         ae5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719255024; x=1719859824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBiWnUshv9OkKg3tPzc7vkd68oaE09mot+Fd5BTkZ5w=;
        b=oWOc9BReH4+cmeRdtEue8wHk8gtGqS4xh2GkRyXbYI4BrD36zbcndDO1ZvsqoL8VDr
         z9WCKcMiHrpgPw7BzD87ZBprBAqkSKCMwjLpLVLCf7wUoKp4yJZmqn+uUSDW2i4nhwCU
         OkJf6IokNDFeqWHgT2uc5WnBK316CHSumMtfrYtBlHJ2s0EEewTndMti3WpO+ONwmOkl
         q9yOQjjRy8cGGUCIccGo+z3bfWuwZ82cQ0FDu7HbCFiEBCv7gzzuY7o1NRTxjpqJyDDh
         bLhzME2syIZ9qB+ey20ySa2gEwKJ+b2+r/RkYbyX56KOtQUwlRddhZysvMgD7Ib/AOzS
         g/sA==
X-Forwarded-Encrypted: i=1; AJvYcCUPiltzwW5yWVVWaCAFcxWlLme4krsWNZmshhMIhHnrUWkNmH9kDpUNRDSI7Zbi0bzfhx4Dn3nEXfsWhE+LYrswizOkvafL
X-Gm-Message-State: AOJu0YxulkyGtz0VNHHxgetkyvepNq7FgPclg/KKwUzbMNaIFeBk9w19
	L/7nnKii+xnruxIL2hEHG8W5LSM1wqDKHEuMl6sEZp+62Kfjqoad
X-Google-Smtp-Source: AGHT+IEG0ohM8vCl8uLGcKYTGbH3rrX+tD6F5+jka/SZNjxategSPRKu6VYzlsUqtGUOqJetdRzptg==
X-Received: by 2002:a05:600c:21cc:b0:421:756f:b2e8 with SMTP id 5b1f17b1804b1-4248cc271b9mr48044475e9.11.1719255023980;
        Mon, 24 Jun 2024 11:50:23 -0700 (PDT)
Received: from ?IPV6:2001:16a2:df66:b900:46d:aa3:6645:bcd8? ([2001:16a2:df66:b900:46d:aa3:6645:bcd8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f65easm10837829f8f.23.2024.06.24.11.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 11:50:23 -0700 (PDT)
Message-ID: <ad18c6fb-7d00-494b-a1f6-3d4acfbd2323@gmail.com>
Date: Mon, 24 Jun 2024 21:50:21 +0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 0fa2857d23:
 WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof
To: Matthew Wilcox <willy@infradead.org>, Yosry Ahmed <yosryahmed@google.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chengming Zhou <chengming.zhou@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
 David Hildenbrand <david@redhat.com>, "Huang, Ying" <ying.huang@intel.com>,
 Hugh Dickins <hughd@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, Andi Kleen <ak@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <202406241651.963e3e78-oliver.sang@intel.com>
 <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
 <Znm74wW3xARhR2qN@casper.infradead.org>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <Znm74wW3xARhR2qN@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24/06/2024 21:33, Matthew Wilcox wrote:
> On Mon, Jun 24, 2024 at 05:05:56AM -0700, Yosry Ahmed wrote:
>> On Mon, Jun 24, 2024 at 1:49 AM kernel test robot <oliver.sang@intel.com> wrote:
>>> kernel test robot noticed "WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof" on:
>>>
>>> commit: 0fa2857d23aa170e5e28d13c467b303b0065aad8 ("mm: store zero pages to be swapped out in a bitmap")
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>> This is coming from WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp), and
>> is triggered by the new bitmap_zalloc() call in the swapon path. For a
>> sufficiently large swapfile, bitmap_zalloc() (which uses kmalloc()
>> under the hood) cannot be used to allocate the bitmap.
> Do we need to use a bitmap?
>
> We could place a special entry in the swapcache instead (there's
> XA_ZERO_ENTRY already defined, and if we need a different entry that's
> not XA_ZERO_ENTRY, there's room for a few hundred more special entries).

I was going for the most space-efficient and simplest data structure, 
which is bitmap. I believe xarray is either pointer or integer between 0 
and LONG_MAX? We could convert the individual bits into integer and 
store them, and have another function to extract the integer stored in 
xarray to a bit, but I think thats basically a separate bitmap_xarray 
API (which would probably take more space than a traditional bitmap API, 
and I dont want to make this series dependent on something like that), 
so I would prefer to use bitmap.

