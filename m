Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB918E046
	for <oe-lkp@lists.linux.dev>; Thu, 29 Aug 2024 13:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939367; cv=none; b=L270BhqG59wnt0xVb+J67Qc3JuZUpdmEGoz87NMvcGdSru4nGPRARXrwv/ghXhv4AhpjyBcgGlpBA+XaIRl55FrILC4gnfkaaO14/ZBAiuB5MP6VDXjsVXz1LjlA6FWJyfVs7jYhKS/DPU2klRZxAN9AHvqRIoQm+5XVoM7rsC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939367; c=relaxed/simple;
	bh=EQ/3NupLppvCT7yUWvtQa5MtpuFY0XWOB7RjIJuKKK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLrnRGXCbTv+zUTz1zG7KVwmiLBE7dRjJVKNon2fByVFjTVH/Xo42V06WZ85q+j2rXIE/4dhZcg0kiQloJ3kIgH3y6ZwtRTlRBcHu1Tnsw5kd1CiPHlUaL9/OKDXMXrHbVguZE9J0/GTbUdUdted06D8BflEhclcLNaKgz/8BRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bXzZGJcm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bXzZGJcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724939364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YXeMCPB8XUwA+GrH5mBsawuNF+gaG4norj+rELVS68U=;
	b=bXzZGJcmZJTs/WDr8k/Sp1FDi+jwyf7UEEI3uuD1EpWCT4GXMGHpsKqj/bXg33ZHt124jt
	rvOyk4ssPC7J3TWv3hSN8dLM7OzxVNb/JrWTsAaRGYqr2YE7dl6NtPqKCfXLVX2RMT42oN
	4jwJWUSR8bfCcqrJUwA/0qI0/5NGpN4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-rkUJ18C4PnOFoOu6A9tQRw-1; Thu, 29 Aug 2024 09:49:23 -0400
X-MC-Unique: rkUJ18C4PnOFoOu6A9tQRw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3718baf35e0so525315f8f.1
        for <oe-lkp@lists.linux.dev>; Thu, 29 Aug 2024 06:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724939362; x=1725544162;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YXeMCPB8XUwA+GrH5mBsawuNF+gaG4norj+rELVS68U=;
        b=bQada/mFw1zM8FM2bVkbwKj3HRauCGSb56PYZUYIQOYTgSa01RGfPgR+KG6OVPs67+
         1g1R9wde5FrW8tcJKrqpJqMBwwXnG7nUYeY1DHnm7HfXYUjFbLvGHujTjqefNqS9Rk4A
         n2bmdDx346gOdDGbNVUOudvflrEMFKg1w2DCMdVzuXzox30yhSUSsAHm59KcU5HgL0BI
         IlwzsoeX/kuNBiSddGhGP4IQPiKV0iHk33+56b2n0jzMzhQy3crSRbamA6ZE7+FVDpcY
         vUZ3S0RYHQ8fNY3YbCLKMqSVBKx+uxk3y9UNqyoW+pOYQGqUQ+x1FSWOyjBcdpKG330c
         DzMw==
X-Forwarded-Encrypted: i=1; AJvYcCV2RAcTHRXq8J4E3kxB5I6G43X2nhvByXZON49EPJ+3V/0LY7mvvDBYE+Ox66eHxs7ycBL1seg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkxYdpigtFBOaB1PP72J6KfDJcctuEgc7wEhvYJMC2gCJjepr6
	ZslkMyNaPkZbdB2Lc0F5nIlkybT3kihQlQPMxhiXBGzdHw+4uXazBCN+G0nvzofHtwFH46aF95C
	wJ/YN1Z9fii9peO1NJBcp45sqh7Gv+6RV3WPOlE/LaGJqvpqPvxq3uw==
X-Received: by 2002:adf:e641:0:b0:367:980a:6aa with SMTP id ffacd0b85a97d-3749b589cc7mr2111423f8f.54.1724939361913;
        Thu, 29 Aug 2024 06:49:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGObVB/Ocly9Kb3LfFCU0iUWwVmHJ0ECuxr4T7zH9h78htvkeg8FcNKPAF8QoiQyTfnY8cGJg==
X-Received: by 2002:adf:e641:0:b0:367:980a:6aa with SMTP id ffacd0b85a97d-3749b589cc7mr2111364f8f.54.1724939361025;
        Thu, 29 Aug 2024 06:49:21 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:c600:c1d6:7158:f946:f083? (p200300cbc711c600c1d67158f946f083.dip0.t-ipconnect.de. [2003:cb:c711:c600:c1d6:7158:f946:f083])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0a4dsm18038305e9.12.2024.08.29.06.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 06:49:20 -0700 (PDT)
Message-ID: <8a16ac0e-4a3f-48cc-a118-ea05c23d5d2b@redhat.com>
Date: Thu, 29 Aug 2024 15:49:19 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [LTP] [linux-next:master] [mm/migrate] b28dd7507f:
 ltp.move_pages04.fail
To: Cyril Hrubis <chrubis@suse.cz>
Cc: kernel test robot <oliver.sang@intel.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, lkp@intel.com,
 Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Sven Schnelle <svens@linux.ibm.com>, Zi Yan <ziy@nvidia.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, oe-lkp@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, ltp@lists.linux.it,
 Janosch Frank <frankja@linux.ibm.com>
References: <202408211026.636ade1a-oliver.sang@intel.com>
 <767d1908-dc30-42ae-9a8a-d2ad42a4d491@redhat.com>
 <8bde28af-3401-4d72-b821-d8cf01bbcd64@redhat.com> <Zs7-A5S_ivFlosrj@yuki.lan>
 <c6fb5f16-59bb-47a5-a2dd-3c4207d73614@redhat.com> <Zs8W3nQszwhbSiT9@yuki.lan>
 <4c190c79-401e-43a9-a4d1-e64f78110e0b@redhat.com> <Zs8Yg7nXZHG8U821@yuki.lan>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Zs8Yg7nXZHG8U821@yuki.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.08.24 14:30, Cyril Hrubis wrote:
> Hi!
>>> If we are going to stick to ENOENT for page that wasn't faulted in the
>>> kernel from now on we should stick to it in the test as well.
>>
>> Right, it will make kernels >= 4.3 fail, though, until this series is
>> upstream. I mean, it highlights a BUG, but we had a similar condition
>> with the zeropage and worked around it in the test to keep it passing.
> 
> What we do in this case is that you are free to send a patch, we will do
> review but the final merge will happen once the code has been released
> in the upstream kernel.

Yes, let me send something out for discussion.

> 
>>> Also I think there is a third case that we do not cover either, what
>>> happens when we pass an address that is not mapped at all, e.g. NULL? Do
>>> we get EFAULT as well?
>>
>> Yes, that's documented as EFAULT and should behave that way. I can
>> extend the test to handle that as well.
> 
> Ideally the test should be ported to the new test API as well, but I can
> do that later on the top of your work.

I tried, and it all looked easy, until I realized that these tests use a 
share code-base:
	testcases/kernel/syscalls/move_pages/move_pages_support.c

That is also written using the old API. I assume mixing APIs might not 
work as expected ...

-- 
Cheers,

David / dhildenb

