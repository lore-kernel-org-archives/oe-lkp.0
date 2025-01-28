Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69224156669
	for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058726; cv=none; b=D+G5bik99i7ZOSXaViY1GXVwZ/p6HDDHbA87VUsUOqEM+Hta39g5LHIFITqAdmLUdBHolqf0LS18JH/+R47WNAJD02/MeLV4IcbruiI1zCYLkd6mdtqoT/Qaql2aozA6bYw5GWivITqF7DbVe7Tn2Awjy1mwtqJI6M7bTbhxVcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058726; c=relaxed/simple;
	bh=b8rO7mfl3uAz1V+bpibO6kU822jhDsnSqp/WSTXPPhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CpMq9rt3Bm1HEQIoL/cPgc0IyuhtD5mjh6OCSd04hWS+mpLfx4HiDmzx4BsvsI4PyX3sbM7yMyAX1+63LK0crBD+TEuMQdo8XTts4hQ2Phoap9w7KKVXsiqAZTSO79QqdF2U9qKw8tsd1ImPv5zogZyufsfSVEyfI5/T4hKeCrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dU00k5Ay; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dU00k5Ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738058723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z2HccLcSb9s+ayEqjgxKzS93MXwiGaza7SftazMvYW4=;
	b=dU00k5AyqOxuQec1Com0qzhnOCKWh6+gP9+bMWpr39BSOK71eb+wNkGAvcHnf87GevU4/8
	cqCDQY7/CO5fcOmt4k5k/KYmimzcGyVF9H8J9xAMTXDUwab2x6opiorlcSCDRuX4doTUBN
	gvFhqX+fHUrbpS1npmy3SFw9k9U0mkY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-Zq2kPet9PYWE1WGZu4Uf2w-1; Tue, 28 Jan 2025 05:05:22 -0500
X-MC-Unique: Zq2kPet9PYWE1WGZu4Uf2w-1
X-Mimecast-MFC-AGG-ID: Zq2kPet9PYWE1WGZu4Uf2w
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38bee9ae3b7so3608668f8f.1
        for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 02:05:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738058721; x=1738663521;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z2HccLcSb9s+ayEqjgxKzS93MXwiGaza7SftazMvYW4=;
        b=rxiy5ZhwXnwjJsCkErAmNvjxq7e/ETxMdIcKJeead8FzsJcHT3wSfjn3Z2ta68z7A4
         9KAvDCeFzPg3tEUgPgWvZ1sW1WzjEQg6+D1N16Z+itblImmL3kAh40sBrcZ6ZRQy//S9
         UihCIbUXDxRewKmFnOfgZU07eMWinRxkZBlKtbqsBkKA0dDall0xxqkPek/mVPvSqQok
         eoMktkjwUwGWzSQxQrpp+TS0Lsq1Jo82hDFiAEA3AAN21uDykFqyJIcBxo6HSvFzV5+M
         aLE4az4/Cy0s3hrmO8t6Nxli0S+QnUcEmKxfEoOqKosr7HndTCsuGHHVIbryPgO51F8v
         7cLQ==
X-Gm-Message-State: AOJu0YzT5x/BE+CCa1gaTm6QrN7VybRaCNpoh66MEFFCRYL/yAnsDMDA
	6xykD297XVX24vybVDbPqp3UCSqU+XAzDzyLz9nM/ivR1o96pqPvItteR9tve5act0LuObc6ZmR
	6ccy76YxYD6ai1VxkN17Xg67WXFafF6xjmNMzxMa302xVRi0IatpUnQ==
X-Gm-Gg: ASbGnctPSv6xQ772GnwSMOXb06JgawSpHpRrxEmFaYaFMOWC1Bwk7L5oSfxnhq29sEE
	PKo9YbAh+lT+dvAnIJ0fKSmd2YOz44OykKNPWGeNlw3VUkNVScXbmsd/W29wYKVEEhhfoGW8dUU
	9MKHi+f4bszApPBTPq8F4SgN6tx3hfzdxvRdlysj+rttwzJ1+Gwo0ZIEIdNoCUlOknpBD44FqBX
	f+3XSrSi4xgMtXCRgtZh1lNUZ6s6XbJvW23xmiWHpzjyLIiQbdBTNzWfXNxL0C046xgePginmyw
	KVfLznsLB6x5uIPGOCO+veDYdNIbJWWVzDRuDGPN6FP2de/lVJlYIgWzbMuMniTWFSBmDGq9x4+
	MqkPXfZV0bKraGOgiOV10HXO4n0avJzYr
X-Received: by 2002:a05:6000:1863:b0:38b:669d:4dd4 with SMTP id ffacd0b85a97d-38bf5655a48mr40903653f8f.11.1738058720903;
        Tue, 28 Jan 2025 02:05:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExIsrwAs6V3V/g4k9W/2/o8JxjLKs5mpTs3/4/sTPhcgWrIQ+pr3ZiFeuFOagHL7Iw2jWSVQ==
X-Received: by 2002:a05:6000:1863:b0:38b:669d:4dd4 with SMTP id ffacd0b85a97d-38bf5655a48mr40903625f8f.11.1738058720543;
        Tue, 28 Jan 2025 02:05:20 -0800 (PST)
Received: from ?IPV6:2003:cb:c73f:ce00:1be7:6d7f:3cc3:563d? (p200300cbc73fce001be76d7f3cc3563d.dip0.t-ipconnect.de. [2003:cb:c73f:ce00:1be7:6d7f:3cc3:563d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bad87sm13685688f8f.74.2025.01.28.02.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 02:05:19 -0800 (PST)
Message-ID: <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
Date: Tue, 28 Jan 2025 11:05:17 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
To: kernel test robot <oliver.sang@intel.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 David Rientjes <rientjes@google.com>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
 Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Will Deacon <will@kernel.org>, Zach O'Keefe <zokeefe@google.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Rik van Riel <riel@surriel.com>
References: <202501281734.d408a35b-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202501281734.d408a35b-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yUpicw99jQIT_bWFsTONvUqlwONDmGQLjw1TAALSoYQ_1738058721
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.01.25 10:57, kernel test robot wrote:
> 
> hi, Qi Zheng,
> 
> this is more a FYI report than a regression report.
> 
> by 4817f70c25, parent/4817f70c25 configs have below diff,
> 
> --- /pkg/linux/x86_64-rhel-9.4/gcc-12/718b13861d2256ac95d65b892953282a63faf240/.config  2025-01-27 16:20:43.419181382 +0800
> +++ /pkg/linux/x86_64-rhel-9.4/gcc-12/4817f70c25b63ee5e6fd42d376700c058ae16a96/.config  2025-01-26 09:27:16.848625105 +0800
> @@ -1236,6 +1236,8 @@ CONFIG_IOMMU_MM_DATA=y
>   CONFIG_EXECMEM=y
>   CONFIG_NUMA_MEMBLKS=y
>   CONFIG_NUMA_EMU=y
> +CONFIG_ARCH_SUPPORTS_PT_RECLAIM=y
> +CONFIG_PT_RECLAIM=y
> 
>   #
>   # Data Access Monitoring
> 
> 
> this report seems show the impact of PT_CLAIM feature for this stress-ng case.
> 
> To us, this is not a code logic regression, but is kind of 'regression' from a
> new feature. anyway, below full report just FYI.

mmapaddr test case seems to mostly do mmap+munmap. No obvious sign of 
MADV_DONTNEED, unless buried somewhere :)

So either

(1) The series is reclaiming page tables outside of MADV_DONTNEED, which
     it shouldn't -- in particular not during munmap() where that happens
     already using the "ordinary" page table removal code for removed
     VMAs.

(2) This is the effect of MMU_GATHER_RCU_TABLE_FREE that gets selected?


I recall a recent series to select MMU_GATHER_RCU_TABLE_FREE on x86 
unconditionally (@Peter, @Rik).

-- 
Cheers,

David / dhildenb

