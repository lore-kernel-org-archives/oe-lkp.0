Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191117C8D
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jul 2024 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418102; cv=none; b=tv6CNH6UCO/YrH59pJ9q6OTkR+2eXQVrTqCfWn1I7gasNFnmkbQgFA8tAfT4mzgCEHP3/k0QLaKcZF+VcoV/suxfMEr/FIEBtb5epI3i0S+JFhtQ08Q508yJGMYAqiLmj2/dNYcVB0QjuSHV4mRCtdbITTSaCHtaP+Y7Hi3PIso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418102; c=relaxed/simple;
	bh=qv2nwhj7U/OiP6BVbQ73+ZiFeHRct+dunqA1ezLOCOc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YM/GVIBjYYSe+m1V5vjBx23zTYTKs3e+mgu/A11PC6vuGVhAUnDCzFLuvlKfFNpulwpo1VH/0I7xMBDywWRYDUcxjdk+9MGyHCJlsAG1LjTG9NsEXiRMr2Hwhsy60CI6BaY9Q7KzjOcgH39Uw4kplnSs4PSDMD8PWjcr/TkzEpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GP6MTvvx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GP6MTvvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722418099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VpTMUS09ftb/4qluTJ9EvUAPoyCn6CFe8JGmUrpF4bo=;
	b=GP6MTvvxoftxIHj9RVQVJyG25a6k6sGjPN9dfXxOgsWNm181EkfGQaEEkt2bgakrpEtGL4
	rAouu0cn0L+Ee6o/JjUlzCk0ivo8CZfpEVNxcVEcws+K1RlT8i8u9QHAiKd4k/P8AiRhF9
	W7/PsrzClp/kJOCMyL+pgJe1ERjyNOU=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-05ebLLCvODyYrGWyxUTTBQ-1; Wed, 31 Jul 2024 05:28:17 -0400
X-MC-Unique: 05ebLLCvODyYrGWyxUTTBQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ef22e62457so52966101fa.2
        for <oe-lkp@lists.linux.dev>; Wed, 31 Jul 2024 02:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722418096; x=1723022896;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VpTMUS09ftb/4qluTJ9EvUAPoyCn6CFe8JGmUrpF4bo=;
        b=fqL5zfbCqVhWxaC5JA3CIIZ0T0OuOAVu0MctysIqnTMkDE3B1+yR4N8GoTUbJ4L6XD
         0/FIcKOuLrn67v5ZrSHte+y0P00Vz2Wgurtbo2dzG2+HiuJlh/ZT/oEUvdtmZ3RwmFC9
         cfyq0ZsI83FcqhMLu4sVXStx2xhX86/gRFDQaZfRl7a/lnyPUeOQp7xspFwKYxoolnkP
         /aWXmj6GTHcsZdGkCj1h+EcRaebDbRDICe+hJBOmw0aF0/hOFLNcagpInGR5iPC8QH6j
         1S3NWSIKAuTZzFdpSfgOWMfZAIyu4fZWRxVVE8Uyrm4jSFqnl3i54tjWxVU6Uxmx2eWY
         9/WQ==
X-Gm-Message-State: AOJu0Yyb5kUTjbGMqgL9Njo4mHa1DtVUOLKBj4W2B2Gbv012K1lONl02
	gbGTJw7kgPEoydJMMAayki5Ue0otIM2mNmjmQqDxlp1um2/UaNdpo3jUGL436Z0AHx7XJUz9tRp
	/LBvDJYqA6kgHgV4qzNX4P8+HJR7oJ3hLyp7pydZA3KUvR3r2XlAmCA==
X-Received: by 2002:a2e:988f:0:b0:2ef:2eb9:5e55 with SMTP id 38308e7fff4ca-2f12ecd2b00mr87831061fa.13.1722418096106;
        Wed, 31 Jul 2024 02:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJKUrWgAAn+2JH41gfvTiJBSJnqmkyAb+SRANFwb0V3rJr/jEWJxcJTWRHDVv/KC90opYRcQ==
X-Received: by 2002:a2e:988f:0:b0:2ef:2eb9:5e55 with SMTP id 38308e7fff4ca-2f12ecd2b00mr87830881fa.13.1722418095587;
        Wed, 31 Jul 2024 02:28:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:5f00:9b61:28a2:eea1:fa49? (p200300cbc70b5f009b6128a2eea1fa49.dip0.t-ipconnect.de. [2003:cb:c70b:5f00:9b61:28a2:eea1:fa49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb226a5sm14626665e9.47.2024.07.31.02.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 02:28:15 -0700 (PDT)
Message-ID: <30eed7f9-19bb-4b45-a9ce-52acbe10024e@redhat.com>
Date: Wed, 31 Jul 2024 11:28:14 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:pending-fixes] [mm/hugetlb] d3fe1a0a02:
 WARNING:at_include/linux/hugetlb.h:#huge_pte_lockptr
From: David Hildenbrand <david@redhat.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
References: <202407311421.95f5c759-lkp@intel.com>
 <ff8619f5-7506-455d-ae13-124a4e87aa02@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ff8619f5-7506-455d-ae13-124a4e87aa02@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.07.24 10:16, David Hildenbrand wrote:
> On 31.07.24 09:20, kernel test robot wrote:
>>
>>
>> Hello,
>>
>> kernel test robot noticed "WARNING:at_include/linux/hugetlb.h:#huge_pte_lockptr" on:
>>
>> commit: d3fe1a0a0272723474056e3000717d69923ad901 ("mm/hugetlb: fix hugetlb vs. core-mm PT locking")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git pending-fixes
>>
>> [test failed on linux-next/master cd19ac2f903276b820f5d0d89de0c896c27036ed]
>>
>> in testcase: trinity
>> version: trinity-i386-abe9de86-1_20230429
>> with following parameters:
>>
>> 	runtime: 300s
>> 	group: group-00
>> 	nr_groups: 5
>>
>>
>>
>> compiler: gcc-11
>> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>>
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>
>>
>> +------------------------------------------------------+------------+------------+
>> |                                                      | e98970a1d2 | d3fe1a0a02 |
>> +------------------------------------------------------+------------+------------+
>> | WARNING:at_include/linux/hugetlb.h:#huge_pte_lockptr | 0          | 12         |
>> | EIP:huge_pte_lockptr                                 | 0          | 12         |
>> +------------------------------------------------------+------------+------------+
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: https://lore.kernel.org/oe-lkp/202407311421.95f5c759-lkp@intel.com
>>
>>
>> [   39.570466][ T3479] ------------[ cut here ]------------
>> [ 39.570921][ T3479] WARNING: CPU: 0 PID: 3479 at include/linux/hugetlb.h:948 huge_pte_lockptr (include/linux/hugetlb.h:948 (discriminator 1))
> 
> Helpful! Likely triggers because in that kernel cfg P4D_SIZE is 0.

Hm, with !CONFIG_X86_5LEVEL we should have

#define PGDIR_SHIFT 39
#define P4D_SHIFT PGDIR_SHIFT
#define P4D_SIZE (1UL << P4D_SHIFT)

... getting a hugepage size >= P4D_SIZE seems pretty much impossible.

Anyhow, taking the easy route to be done with his hugetlb crap and live 
a happy live, I'll drop the warning and just handle it explicitly.

-- 
Cheers,

David / dhildenb

