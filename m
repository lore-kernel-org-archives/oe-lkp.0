Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111AF16A95E
	for <oe-lkp@lists.linux.dev>; Wed, 28 Aug 2024 12:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848119; cv=none; b=PdY9rpJPB75xlu2bQMJ6Q84tqKrP8LcqQW/wcE/gkrjeaI3g7N+h8z1mlCOPQ7404eDrWPUaZJPQkgRsRh5abqr3dTJ8/560LduZ4NI+Xrt4OmZQU8/bp92SWdvYkbg6tUemqvGeU0UxME61GLQ1Fm2+hiTa8vPF55nHTOmi6bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848119; c=relaxed/simple;
	bh=/u6AEf1MJ3uaXEnvYCbVmrg34wK+BVINsOfHxWpu708=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfXvAXui8m5i3KtTgoWJleyBujiVB8RQxUN4Hqa5KMG898XDBqS10Z6jEMSon1nNklvR6yEowyE84ZJaDW1/ONPibWQbjpWtTmO6WpG9atvpjPL0OreGxH+NDWwRey5IJdalIXFtZBVviVdBCVgwKYTHvPviqnh485Yh9gAKCKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I6D2jH/j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I6D2jH/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724848116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BqX6w+nxa0Qp9v+HZKp/Y1aADrBubG2rT48f4/d5loc=;
	b=I6D2jH/jJY4wmd9TOwo1apL1B8OXPLEuwM51oZrN1Vg5AzUBI84ACip7ERyRSqa32uKV7V
	Fq49VmRzEyeHl8DTWgtBLlgD6gjCit6z7Hg38Dx70HyxXwEZ1PqUcV5u9fsHoqJA9a1x4K
	FBX5F41dVwehbJxQLXh8On374XfiZkU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-_aHupHrnPJmwXfIn_WbGIw-1; Wed, 28 Aug 2024 08:28:35 -0400
X-MC-Unique: _aHupHrnPJmwXfIn_WbGIw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42ab8492cedso62166385e9.3
        for <oe-lkp@lists.linux.dev>; Wed, 28 Aug 2024 05:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848114; x=1725452914;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BqX6w+nxa0Qp9v+HZKp/Y1aADrBubG2rT48f4/d5loc=;
        b=uPq3aUMF4eWuF0jTLZbQBbCrh+JNf/SGaKgzuQa8LwdlsCka3fqt5TuhRoz7nXFNS9
         VDA7UgYeSGsdXEMvaNPmt5psAUPCNbAlZa3hakY20FwTpKxmnYMR19NZ9//dgrHkUhpV
         4nRPZ/DvGMtKRxJCrCo8Fg3cLSU+BR1RinIy5WFQh4VefcPVrE3ipbw4YbdU6j+PyxcC
         WCJY9P8K6ZxOA3XSz0qfVcKmX354jdhlwkfit4hxZKmAT2c+7EPJ+7ZlUFuYcIeKsHLi
         aeIKJ17vY9WvqBxNKIvZjVXZlgkV6ztHvcUmZJV7JvKea4R9FUnmOkKqTTaZqhKaDYHW
         YhWw==
X-Forwarded-Encrypted: i=1; AJvYcCUpUpwgWDTBvqSanIHPOMHQX/UabJUTtW/EQeZi2j4/OhWwe5zRW0ko3qvtrwi73iGLFP3tvrI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFxt0tIM5TlZco8z/7g4T6i2Yd83g1/dazEUBpH5LGut4swibA
	CWRjoog1jbNrzyMfu++EWFUAicig2a+T8h8PMAzfPlVMJ2hQ8Y21mgb9IfFi3VCH/TQQ7SgXVws
	7vBVgyET3m9QB7u1kUl/Ka9kJG9yjKwDUkPLZdgRmzF72CUqswju62w==
X-Received: by 2002:a5d:6145:0:b0:36b:a404:500b with SMTP id ffacd0b85a97d-37496858c20mr1342894f8f.51.1724848114486;
        Wed, 28 Aug 2024 05:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOf/BYvfRgQ5cJ50FN/hulBy60s/Q4D00y4o0VyWz/OP4adkwJeHioihaI5pWwgE7/jvvoPA==
X-Received: by 2002:a5d:6145:0:b0:36b:a404:500b with SMTP id ffacd0b85a97d-37496858c20mr1342850f8f.51.1724848113600;
        Wed, 28 Aug 2024 05:28:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:1700:6b81:27cb:c9e2:a09a? (p200300cbc70617006b8127cbc9e2a09a.dip0.t-ipconnect.de. [2003:cb:c706:1700:6b81:27cb:c9e2:a09a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730817a5acsm15434076f8f.64.2024.08.28.05.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 05:28:33 -0700 (PDT)
Message-ID: <4c190c79-401e-43a9-a4d1-e64f78110e0b@redhat.com>
Date: Wed, 28 Aug 2024 14:28:31 +0200
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Zs8W3nQszwhbSiT9@yuki.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.08.24 14:23, Cyril Hrubis wrote:
> Hi!
>> I am not yet sure if we should simply allow either -EFAULT or -ENOENT for
>> the "nothing mapped" case in the check (below).
>>
>> Alternatively, I agree, wee need to have this in the kernel so we can
>> check for versions.
>>
>> What would be your preference?
> 
> If we are going to stick to ENOENT for page that wasn't faulted in the
> kernel from now on we should stick to it in the test as well.

Right, it will make kernels >= 4.3 fail, though, until this series is 
upstream. I mean, it highlights a BUG, but we had a similar condition 
with the zeropage and worked around it in the test to keep it passing.

> 
> Also I think there is a third case that we do not cover either, what
> happens when we pass an address that is not mapped at all, e.g. NULL? Do
> we get EFAULT as well?

Yes, that's documented as EFAULT and should behave that way. I can 
extend the test to handle that as well.

-- 
Cheers,

David / dhildenb

