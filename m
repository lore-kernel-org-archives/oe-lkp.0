Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED6A1E6187
	for <oe-lkp@lists.linux.dev>; Wed, 21 Aug 2024 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724231739; cv=none; b=l49/Rfvp1OzfVhXtm489vjpAVqAkGBCLVpavK6bv+97OqWI7J4And9iKrsueiIdf2CUF55zKulvaDCLBiSkCSXvaE4s/WnBp1/lpUDnICtbIw6M2QsCxKJT9A7v+qT2Tl4/axkxsORmzQn15mkepS9ZuY+L8TScnFe1CwiJW0Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724231739; c=relaxed/simple;
	bh=0zYpkdw1DYsMrpho6QzbijR7I1CIy98Fo0DQQIFxWa4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=m9c3G6xHJ2WSqaTPgnFqTMcnNC/KU5kBML0EOpd3op+dUV5uPK6wt4VgJ9NbTgftkZTEuVmJqDusi/iYoFYpUaLpTLFASYvkblIo40neyBOBgCflHat/I/xnbN5RxNAuqyRWu/pAL4DJYke7FP7LBqzBxzbUaBzWHaMNh3UmlDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fprQpmaC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fprQpmaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724231736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FH3DRsdfKFj6wWn8IiUofmEtPoVy0JKk5VSTOQjOCp0=;
	b=fprQpmaC9PSDsU3dZY+YHb3aLCflwOvZdUzjkwnlZXoimuae8tGTbljzYt8okegP0IvsQL
	7jimvtzpHufLBckSShRb36uMWXEn4yIZ52BTeI/gTBMEQBuAUHsF2Yo0gh9W6OeiQog9XN
	Hr2RC0g38Cwtf38n/bsWg33HdX5CuEM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-JrtuMy4hMTW8uScyxq_8zA-1; Wed, 21 Aug 2024 05:15:32 -0400
X-MC-Unique: JrtuMy4hMTW8uScyxq_8zA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36d2b05efc6so3922868f8f.2
        for <oe-lkp@lists.linux.dev>; Wed, 21 Aug 2024 02:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724231730; x=1724836530;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FH3DRsdfKFj6wWn8IiUofmEtPoVy0JKk5VSTOQjOCp0=;
        b=SQv4YgA6aI7XOpue9naGCr7F2ML6BnLTF2Au9WhGXXFbq8Pxef2ilmBDMsxQpP/4G9
         0q5fzhYvwfYHEeDCQwyYU67DrRSYBAtmtD9N0wzeJ9uyLavCzFF4lXUbBFDlX7B1A0JZ
         87qImSls/z+zTHob+WBcU+P0KaHvb+hyJHlKXh6+/9+k3iUeOptW+au5JGz0kK+piNBD
         7MdUKymjwke5+1/VG5Kn1hvHCX1KVATeNlMeGJyRuJkM9gsrD20PHS1jmWOGh/EdIT6W
         hNVDXG0X9nTI7ygn8BEifo2VTGQZ2WT3p5iPTEr9lzfvoYlI7zi14BouFY7+LV8/NmVp
         +HCg==
X-Gm-Message-State: AOJu0YyqGu0l01wzdGATj48lN5m9Uf9p/M7QEWp2i4/8gbB8qLxBQvPt
	yJy0Hmb0ni9Bh6Sk1JPA3uGZZpLdiaJO0pAfZdSyy7afoZ0NqGtMmI/p0FUXd1FIvA1adx6U420
	wdfsuvkfM25OgDD5CyGAQOw/uJlBro6ZSP75fTWBvwcFfEPtInEwoEg==
X-Received: by 2002:adf:e410:0:b0:367:8ff0:e022 with SMTP id ffacd0b85a97d-372fd82c514mr936603f8f.63.1724231729732;
        Wed, 21 Aug 2024 02:15:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlvrUtGjOXfqW9QJ0EsdZU6ssbttA+aJKQEOqlECcNqgOzmzImCpyCauFsPN9jjkgKW1cAEw==
X-Received: by 2002:adf:e410:0:b0:367:8ff0:e022 with SMTP id ffacd0b85a97d-372fd82c514mr936568f8f.63.1724231728774;
        Wed, 21 Aug 2024 02:15:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:4300:16d5:c5b:8388:a734? (p200300cbc705430016d50c5b8388a734.dip0.t-ipconnect.de. [2003:cb:c705:4300:16d5:c5b:8388:a734])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abef9948bsm18495125e9.26.2024.08.21.02.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 02:15:28 -0700 (PDT)
Message-ID: <8bde28af-3401-4d72-b821-d8cf01bbcd64@redhat.com>
Date: Wed, 21 Aug 2024 11:15:26 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm/migrate] b28dd7507f:
 ltp.move_pages04.fail
From: David Hildenbrand <david@redhat.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>,
 Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>,
 ltp@lists.linux.it, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <202408211026.636ade1a-oliver.sang@intel.com>
 <767d1908-dc30-42ae-9a8a-d2ad42a4d491@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <767d1908-dc30-42ae-9a8a-d2ad42a4d491@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.08.24 10:44, David Hildenbrand wrote:
> On 21.08.24 06:44, kernel test robot wrote:
>>
>>
>> Hello,
>>
>> kernel test robot noticed "ltp.move_pages04.fail" on:
>>
>> commit: b28dd7507f2dd7923325eab6ea1f291416dcc396 ("mm/migrate: convert add_page_for_migration() from follow_page() to folio_walk")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>> [test failed on linux-next/master bb1b0acdcd66e0d8eedee3570d249e076b89ab32]
>>
>> in testcase: ltp
>> version: ltp-x86_64-14c1f76-1_20240817
>> with following parameters:
>>
>> 	test: numa/move_pages04
>>
>>
>>
>> compiler: gcc-12
>> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480+ (Sapphire Rapids) with 256G memory
>>
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>
>>
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: https://lore.kernel.org/oe-lkp/202408211026.636ade1a-oliver.sang@intel.com
>>
>>
>>
>> Running tests.......
>> <<<test_start>>>
>> tag=move_pages04 stime=1724192393
>> cmdline="move_pages04"
>> contacts=""
>> analysis=exit
>> <<<test_output>>>
>> move_pages04    1  TFAIL  :  move_pages04.c:142: status[1] is ENOENT, expected EFAULT
> 
> This change is to be expected, and I touched on that in the patch
> description. I am rather surprised that we have a test for that
> handling, especially because it changed already (see below).
> 
> The man page says:
> 
> 	-EFAULT: This is a zero page or the memory area is not mapped
> 		 by the process.
> 
> "memory area not mapped" to me translates to "there is no mmap()", not
> "there is no page mapped". And it says:
> 
> 	-ENOENT: The page is not present.
> 
> 
> It's not really specifies what happens when "The memory area is mapped
> by the process, but no page is faulted in.".
> 
> And the old handling was even inconsistent: to achieve the old behavior,
> we abused FOLL_DUMP, which triggers in mm/gup.c:no_page_table():
> 
> (1) is_vm_hugetlb_page() *and* a hugetlb page is in the pagecache?
>       Return -EFAULT. Otherwise return NULL -> -ENOENT.
> (2) vma_is_anonymous() || !vma->vm_ops->fault ? Return -EFAULT.
>       Otherwise return NULL -> -ENOENT.
> 
> So, if nothing is mapped, for things like shmem we would always return
> "-ENOENT", for anonymous memory always "-EFAULT", and for hugetlb
> "-ENOENT" or "-EFAULT", depending on the page cache state. Inconsistent,
> and that handling is only in place because we abused FOLL_DUMP.
> 
> (there are other issues in the old implementation: on PMD migration
> entries we would likely have returned -EFAULT in some cases where we
> should have returned -ENOENT ...)
> 
> While writing folio_walk, I temporarily had a version that would return
> error codes instead of NULL to indicate "there is something, but we
> cannot return  it" and "there is nothing", but it didn't feel right. And
> I'm not really interested in revisiting that :)
> 
> ----
> 
> Staring at the test,  I realized the that behavior *changed* already,
> because we wanted to fix the "zero page" and started abusing FOLL_DUMP,
> but ended up changing the behavior for unpopulated (nothing mapped)
> memory as well:
> 
>    * NAME
>    *	move_pages04.c
>    *
>    * DESCRIPTION
>    *      Failure when page does not exit.
>    *
>    * ALGORITHM
>    *
>    *      1. Pass zero page (allocated, but not written to) as one of the
>    *         page addresses to move_pages().
>    *      2. Check if the corresponding status is set to:
>    *         -ENOENT for kernels < 4.3
>    *         -EFAULT for kernels >= 4.3 [1]
>    *
>    * [1]
>    * d899844e9c98 "mm: fix status code which move_pages() returns for
> zero page"
>    *
> 
> Likely test is *wrong*, because it claims to test the "zero page" but it
> just passes "unpopulated" memory.
> 
> Let me dig deeper into the test.

Okay, and it even looks like the test caught the unintended change for 
"unpopulated memory", but instead we decided to change the test to 
expect the other return code ... because there was some confusion about 
"zero page".

Long story short: the test needs to be fixed.

-- 
Cheers,

David / dhildenb

