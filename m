Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A477B17277F
	for <oe-lkp@lists.linux.dev>; Fri, 29 Nov 2024 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873560; cv=none; b=W8TyWUcQjMxiYyopStYy/oK62L/3H/6TuK6raeUPlN90dRaosxDTZv7hInYj5+rHw257XoDPuih3EBJJ7jLPht0gaCCtXTFP6s18FT1TJiYXvVwO02wzqQrnPfQv5EnOoB7vCDFTud0jGtni8jjoGcA7g/jxeN1xdJ0abslo+oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873560; c=relaxed/simple;
	bh=+eJ2DdjjN5mt0tkgk6GNqw7jOnWFeq05qFBaxOy7G/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkdfDbPszrsP5aO0QIxIoO1eDrOAHPAKmESQpzhoViEJc3LboO7Ly7+1wPo8udQDz/PXer3fAMcHXYyUbpWJmMSexIFjZMWiSoVO2dL4iAqyug+Mg4spwVoFPYt2OmWEwwPumCta8rF1MNTnSHE8obhT2aQmVAOPI6LbVlBfuh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ag9vNMy6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ag9vNMy6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732873557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2CMh10fMtJjOTCsMaQYRHEwEDpOIse91ya0q2XctgVE=;
	b=ag9vNMy6lWbcQtfVFDpApzg72FNFA9jieLdU/cXcS5egdpq/54DFvVP1o+2WFceJGN4Lra
	rv2k4Tyd3g+1e18xwQ4R4NcFko/hncNnEq5RvQjptrxwuGWfic0BZNj0h9GZhXdrU5KT6M
	eCq2eaBc10vWp3zHUdz4VBHJSwnRQYI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-PhOacVwoPhyZ91zWOG4HCw-1; Fri, 29 Nov 2024 04:45:54 -0500
X-MC-Unique: PhOacVwoPhyZ91zWOG4HCw-1
X-Mimecast-MFC-AGG-ID: PhOacVwoPhyZ91zWOG4HCw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4349e97bfc4so15056605e9.3
        for <oe-lkp@lists.linux.dev>; Fri, 29 Nov 2024 01:45:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732873553; x=1733478353;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2CMh10fMtJjOTCsMaQYRHEwEDpOIse91ya0q2XctgVE=;
        b=e2GFcnc5fktwgrJF2BSeTctF8wNK10shgO+nFGhYmCD0mEROPZyxVuIOMhEK50j55+
         tDSuZ6kY/9TkqLmUO/dyHHS0Q0GOtWzQxcP+8G+vXj2khUGXblVHqLsVt4KTry5sQhvY
         s2Ewh/MXixK8ishjRt9LXqujm/r5w/2o0qZnbag3oG3m5368y/EIHb+TutgwhHUwDIkh
         R/PyDdfqv2Sx+fGqXaEh8foa35j4dBi79dbv5GVnXV5Csdpqf8PCEbJkrDPh66MPklz7
         aBAEByv3gkuQdxKJNaDgcfCs+bTMRouVrsLLrFAuYHgvHSz7mcgnj0VC8RhkbAHnWP1G
         pbsQ==
X-Gm-Message-State: AOJu0YxDxqERPuvimYI/sHitWSpe9T+9AFzxU2HH2XK7yV8crhPainSH
	6K6zq3DG9VUjQRJYhh6qh0fz8BZnhoLZ57MDWlR2BP+NfEyb7qDQuRhkwcT9dBbP+IER7Zy47aP
	trnDOzcu06iVBCSAWYYjZ8dfdMd+II3WInw/1F/RtfiD34Cw4L8cqiA==
X-Gm-Gg: ASbGncs+lGtOqHnrkIQj0tKoR8DlJNRSAPsq0Nb4GBRzyHAigOQFuIHnW5U/Ba2Rzer
	WgFDQ6x5pRafUJRx4g3npSbKKj2i+d6NiEnGTGET3Abi/J6fnTOkS5Wf32kSVMZzKbLzUGJByEI
	xpKRshFTpTzEq9Rqz7C2F69T5JgDTrtkOFtTBogWy+ccuWRuvEkgoMv1oXC6/Uve78te81qgxwq
	BlIDbsVym/6MehLmllfq/vi8ivahrJvMwZjcd3VmogBgr2u0OD0Ps3nB3qUvfoMGuKDJIAzuWR8
	V7ZF49ZnSp8m+T/UWpflFZiBgF28Fs7ojb7wFG1W5V0aHnuwTu1Cp2yhC6Bwy4y9W/KJJEX5D6A
	PLQ==
X-Received: by 2002:a5d:6dad:0:b0:382:3959:f429 with SMTP id ffacd0b85a97d-385c6ccaeafmr11080906f8f.5.1732873553019;
        Fri, 29 Nov 2024 01:45:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8JzoC9JMCXdm9jg9jlWlCFCVipya1jw/IPEEUtYi2V4iKWDyzIpXQTPW0hPwUOsoHg7n9mg==
X-Received: by 2002:a5d:6dad:0:b0:382:3959:f429 with SMTP id ffacd0b85a97d-385c6ccaeafmr11080883f8f.5.1732873552709;
        Fri, 29 Nov 2024 01:45:52 -0800 (PST)
Received: from ?IPV6:2003:cb:c71c:a700:bba7:849a:ecf1:5404? (p200300cbc71ca700bba7849aecf15404.dip0.t-ipconnect.de. [2003:cb:c71c:a700:bba7:849a:ecf1:5404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f326a9sm47722075e9.35.2024.11.29.01.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 01:45:52 -0800 (PST)
Message-ID: <e08c88bf-8aa0-4b18-9d8a-77f1a60436e7@redhat.com>
Date: Fri, 29 Nov 2024 10:45:51 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [madvise] 2f406263e3: stress-ng.mremap.ops_per_sec
 6.7% regression
To: kernel test robot <oliver.sang@intel.com>,
 Yin Fengwei <fengwei.yin@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Yu Zhao <yuzhao@google.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Matthew Wilcox <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>, Vishal Moola <vishal.moola@gmail.com>,
 Yang Shi <shy828301@gmail.com>, linux-mm@kvack.org
References: <202411291513.ad55672a-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202411291513.ad55672a-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m8ciM2npOyCvyIuKb3mYwxgMpnIi6oW8R51p0UqL5nE_1732873553
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.11.24 08:49, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 6.7% regression of stress-ng.mremap.ops_per_sec on:
> 
> 
> commit: 2f406263e3e954aa24c1248edcfa9be0c1bb30fa ("madvise:madvise_cold_or_pageout_pte_range(): don't use mapcount() against large folio for sharing check")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [still regression on fix commit cc864ebba5f612ce2960e7e09322a193e8fda0d7]
> 
> testcase: stress-ng
> config: x86_64-rhel-8.3
> compiler: gcc-12
> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
> parameters:
> 
> 	nr_threads: 100%
> 	testtime: 60s
> 	test: mremap
> 	cpufreq_governor: performance

A MADV_COLD / MADV_PAGEOUT patch for large folios / THP affecting a 
stress-ng mremap test (where propably no THP are used)?

Sounds unlikely ... ;)

-- 
Cheers,

David / dhildenb

