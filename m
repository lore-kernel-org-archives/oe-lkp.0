Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6242E414
	for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738071783; cv=none; b=LEah9uPf9pA39dMa8YKedPP6/do9HGj984UHpwfNYRcoNAFdn2x+5fo0X2SlzwegxLIyQZkvNH2qf47BX4er7UgUg8jfVTnNwFFGCRJr/1gxCAkHnUWwGGRkwC4BLXSykaHdLQIVNpAG+UH4Z0qBRuG6ZgVHpNRLD5W1ebHjeBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738071783; c=relaxed/simple;
	bh=DVPmhpg2urIeY57V25hGcXeT+tw36iSdG/k7BtDssC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSBaSCRJVVab6b9x7GF0cqorhM9KA6z2uPxfQ5G0e3Y+x3+hlKOKKBYy2iHcJMgahSaIvNgCWScqCB7ehBLnUk/tR3dDKJCdjCJjnmMMrOInyS6VmucF7wtGyjjWKEt1JXNnXIaY6/EUuo3B/XtXKHuV1kWAIcFOaNeKkj/r1rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZXX4Kow5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZXX4Kow5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738071779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hZb1tgMYKKO6xq7+97trtTEKGVI1F+L6dEguRsD0bRM=;
	b=ZXX4Kow5zJ9yzH7qARWYy+Ts/OEPtj5UOVt9ZmNktInwydt1FQWI2rESH/8vOia0K8OEa6
	uYNx6G5G3mA4OWeHUCD9b3VSuVUbEax/BPF+FktpHd17q4mMAYqnUXEsFblFTqyVVMtp80
	k0CgbLfB5aSsZ3umD54WrvcsKdL37VU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-NnFi8KC7NXCmwEfwvvNSNQ-1; Tue, 28 Jan 2025 08:42:57 -0500
X-MC-Unique: NnFi8KC7NXCmwEfwvvNSNQ-1
X-Mimecast-MFC-AGG-ID: NnFi8KC7NXCmwEfwvvNSNQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385d80576abso3450708f8f.3
        for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 05:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738071776; x=1738676576;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hZb1tgMYKKO6xq7+97trtTEKGVI1F+L6dEguRsD0bRM=;
        b=gfP7eUfVfvA3Mh3PefkxBFpeVv98HCEVfrUOIR2Wb4czmIzK9JsVadncZR3bkgcblw
         zQ+I+BNmlZuxshZAbKa1Zz6DuZCs53kPcsLgZL5dO3T8AaUeFF8sDLQGzsL2TDuEykcL
         f+ORj0BO51u8Uc+oHyNLL87quKPXIMa4lKhYGc/87kOSsV/dqLgYygKHgI6/Q4u3eXa3
         CAG9JKabfGLyys6Ajay+HQJbMkTyGXJigiCSBN0atIepy4efteTlDP/gxle2hHDGLQJp
         HG7ewS9i7f6njjG69ngydJSQYU6AhzANJadQOhA3gU6CQfz4IYrt+QE8Kd4nxSp04/QA
         1Iyg==
X-Forwarded-Encrypted: i=1; AJvYcCUXJwfvsxBuEDBNOSvQSPzyw7CTAS7fJPZ70dAhIn2vpk2eh5CUbkz9bFQNeUbmp1wIc+sAYeE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtJxKGfeecUKyH3n66FBpv53PQibb8aiY63Rr4nKc8TZVAwmzG
	NP/u9UQoL6oazSqu3tnum2V3TE2uirfshpxPpmlPzp888A+13U8H0XyX3YP03JX6/JeEc4PRS5k
	XFP94i/7KHUxaOjuVcflwXzbzIfRDAt5LibJMVhx0SN15w/hxRr5UZA==
X-Gm-Gg: ASbGnctsAQWzgRGQaMxH4U3AN4rqjHvc1Q1SlSa/96aIOSwtVhvkEJ/ozMTih5P5/65
	GYFq2AdPRbRA2SnGznsRjQO6rKK0ebZY7lskwMrRfH9CuPh/6h4y7NINj4UlSLfnQs5vV+DM6H+
	rXG9K8cMBnW5w996JmAqReybeBtFkOPzt6HzIlmvnDc6aQvTodXe24BHo7AGWSoqKxdoqIKEI4D
	uAdAPiyq9Le6nOBGf62CzS2IxG+9iQaSeJQU54djB9t2xuO6T/fcIE+q4Gia5Wy2pCwTmNhAN5z
	WIXG9VknhBmXrRYFaL6teAgD1c9fCFLLgtgRvYlWceCBxntvQNZpf4h4CnU3Xo+WHWasQeJsBf/
	vzcxoOvugotw8tVDjJqyQKOCJCFUP3TOs
X-Received: by 2002:adf:cd82:0:b0:385:ee3f:5cbf with SMTP id ffacd0b85a97d-38bf565a596mr32485386f8f.20.1738071776486;
        Tue, 28 Jan 2025 05:42:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0G4oXe2+sPFjzzP9M0tbMV8Qq1EU8/tPXga1z6LpCtWszFXL0hkcN+5KApRzcZFfN+Bc3Ew==
X-Received: by 2002:adf:cd82:0:b0:385:ee3f:5cbf with SMTP id ffacd0b85a97d-38bf565a596mr32485349f8f.20.1738071776089;
        Tue, 28 Jan 2025 05:42:56 -0800 (PST)
Received: from ?IPV6:2003:cb:c73f:ce00:1be7:6d7f:3cc3:563d? (p200300cbc73fce001be76d7f3cc3563d.dip0.t-ipconnect.de. [2003:cb:c73f:ce00:1be7:6d7f:3cc3:563d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1761ffsm13934140f8f.7.2025.01.28.05.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 05:42:54 -0800 (PST)
Message-ID: <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
Date: Tue, 28 Jan 2025 14:42:52 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Rientjes <rientjes@google.com>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
 Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Will Deacon <will@kernel.org>, Zach O'Keefe <zokeefe@google.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Rik van Riel <riel@surriel.com>
References: <202501281734.d408a35b-lkp@intel.com>
 <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
 <20250128113100.GB7145@noisy.programming.kicks-ass.net>
 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
 <20250128132847.GB505@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20250128132847.GB505@noisy.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dOi7NAEl-lCtwfUiUacEQ46VVICL0SUD6hifCT8njs4_1738071776
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.01.25 14:28, Peter Zijlstra wrote:
> On Tue, Jan 28, 2025 at 12:39:51PM +0100, David Hildenbrand wrote:
>> On 28.01.25 12:31, Peter Zijlstra wrote:
> 
>>>> I recall a recent series to select MMU_GATHER_RCU_TABLE_FREE on x86
>>>> unconditionally (@Peter, @Rik).
>>>
>>> Those changes should not have made it to Linus yet.
>>>
>>> /me updates git and checks...
>>>
>>> nope, nothing changed there ... yet
>>
>> Sorry, I wasn't quite clear. CONFIG_PT_RECLAIM made it upstream, which has
>> "select MMU_GATHER_RCU_TABLE_FREE" in kconfig.
>>
>> So I'm wondering if the degradation we see in this report is due to
>> MMU_GATHER_RCU_TABLE_FREE being selected by CONFIG_PT_RECLAIM, and we'd get
>> the same result (degradation) when unconditionally enabling
>> MMU_GATHER_RCU_TABLE_FREE.
> 
> Ah, yes, put a RHEL based config (as is the case here) should already
> have it selected due to PARAVIRT.

Ah, right. Most distros will just have it enabled either way.

But that would then mean that MMU_GATHER_RCU_TABLE_FREE is not the cause 
for the regression here, and something else is going wrong.

-- 
Cheers,

David / dhildenb

