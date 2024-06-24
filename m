Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB41A1DA21
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719243547; cv=none; b=cowwUuvPqrqhku7ebaNtRDm6csYWeGMaS7g/MU2F0iMr89mvHGsxg63mQggt5gVo0tT4YATXxvS4slUVta7zvcoYxRR34lQVahkIm3Sb/FceMEKe+GF0QkF6QtSOfUOsnnDZodt9iBAD47N9GSAPzolVCLZNFSU+wcuqZ+RT1J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719243547; c=relaxed/simple;
	bh=fkGCYYnByBUPtMADuMf2BMlTvJbpDBTQEAVZpRdutEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZZKv9lZEoOIwZ2ZEre/Kr8zJpaCmFNogSZiDIFtl1y9VDOtBCbsuYnnh8/NAG0tMUYwQ2g/Jur3DFte2UOUrwxOEIEZFvTxo9/+gxTtwUfTcCJ7nb1P+giuBUyPzfe8jz/54C91Mgje63LTf4+ExemN0dHmI5+vyI3PRWPvxpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQ2QBAZX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQ2QBAZX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-424798859dfso37609765e9.0
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719243544; x=1719848344; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HPcPd9wy1fSfjdoXcI4T31fTF+D9RtkuwE8EltBejPw=;
        b=eQ2QBAZXmJpR/Or5ao3I+zTL5l5oZpfDhXKqdncQBMTGWRazaNaL0jJuLhIR6vSrEA
         q7GrFNCV2YkCesnHTppjnEmo4xxcSDI4QfAkAcYQP10wAAGThHbzZ/ZTqJ4ZJzyCz5Fy
         0QpIRlsDUvgRYsgNj6mbA77PYRWYMDwXdqV3EtylI4GqXVVnP15KA0rZ6xnXmfTjVB4x
         nG6AdJtrRqW/0Tn9LlUZSOLuZKfz8nO5VtRdKqeDA+Fxye9/LRH5P6kSvv8BnBgPqmCg
         Uvgg4jFJJoHZIA3SNKYmV58sKA+jOtN8/JBR3cKzGQ3NSrcHxyhRyGNZ+V6TPrwnjJCf
         u9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243544; x=1719848344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HPcPd9wy1fSfjdoXcI4T31fTF+D9RtkuwE8EltBejPw=;
        b=IeJmAOH54y7TiPnrZr39WaCZmnn0TSqk7sb05JWnksHVxyoLtfrjTAARkR98Ts1Qex
         Hc6U65Iz5FSyS/FtS3Sr8e1LqUa7semepFS2ivI9LBY1jxNihQBWGfjVXl1kUdXbqdUm
         e0Au+EfG2n7v51j87NAITog+2Bz9DvKcu7E+FP9wKNl4B3JU9MqmqHGIwJezcQdtCgfP
         isVxvRw5SO0Pxw2EdfGVdg5JyklrE4OCWRHrKKomJ+4jwNc7629CjcBvtcQV3couf3KI
         87KZuNxjeUSFkJ6sHAL65xvYTFjkIuF2w44Q/1ZJHCbwmaDDwwRQvERxxCwgetoWiSqq
         M2ig==
X-Forwarded-Encrypted: i=1; AJvYcCW0gkhqYxcpelYZ7nmxanWe9cWUOuFGBsK5fWrmcwBZCTVNa1zmMIC06r9AbyYlqzlQOrDVNoQNxAVs5uQFivV1OKcpk/OS
X-Gm-Message-State: AOJu0Yyav2aHvR7U3YRbFc1soF4zM/9vxQ0QWBJCQAAPpkmBH7pF4UfM
	3Y7RhFQx76ZU0dzwbtRgfixmA1Dpam6LAAOZ9FGIw8ww2exwQS1U
X-Google-Smtp-Source: AGHT+IEKItbua/CYYFygu+88L+0laEZhLABVve6WLN9uF33edGgRXGcJjBtKahS8k9Dy8kc+1m3BWw==
X-Received: by 2002:a7b:cc89:0:b0:421:7f4d:525f with SMTP id 5b1f17b1804b1-4248cc35da7mr33607055e9.24.1719243543832;
        Mon, 24 Jun 2024 08:39:03 -0700 (PDT)
Received: from ?IPV6:2001:16a2:df66:b900:46d:aa3:6645:bcd8? ([2001:16a2:df66:b900:46d:aa3:6645:bcd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54c9sm179753455e9.27.2024.06.24.08.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 08:39:03 -0700 (PDT)
Message-ID: <5b3e732c-d23d-41ef-ae5c-947fa3e866ab@gmail.com>
Date: Mon, 24 Jun 2024 18:39:01 +0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 0fa2857d23:
 WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof
To: Hugh Dickins <hughd@google.com>
Cc: Yosry Ahmed <yosryahmed@google.com>,
 kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chengming Zhou <chengming.zhou@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
 David Hildenbrand <david@redhat.com>, "Huang, Ying" <ying.huang@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@infradead.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, Andi Kleen <ak@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <202406241651.963e3e78-oliver.sang@intel.com>
 <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
 <12fb19d1-3e57-4880-be59-0e83cdc4b7f1@gmail.com>
 <61d19ec8-2ba7-e156-7bb7-f746dae8e120@google.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <61d19ec8-2ba7-e156-7bb7-f746dae8e120@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24/06/2024 18:26, Hugh Dickins wrote:
> On Mon, 24 Jun 2024, Usama Arif wrote:
>> On 24/06/2024 15:05, Yosry Ahmed wrote:
>>> On Mon, Jun 24, 2024 at 1:49 AM kernel test robot <oliver.sang@intel.com>
>>> wrote:
>>>>
>>>> Hello,
>>>>
>>>> kernel test robot noticed
>>>> "WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof" on:
>>>>
>>>> commit: 0fa2857d23aa170e5e28d13c467b303b0065aad8 ("mm: store zero pages to
>>>> be swapped out in a bitmap")
>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>> This is coming from WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp), and
>>> is triggered by the new bitmap_zalloc() call in the swapon path. For a
>>> sufficiently large swapfile, bitmap_zalloc() (which uses kmalloc()
>>> under the hood) cannot be used to allocate the bitmap.
>>>
>>> Usama, I think we want to use a variant of kvmalloc() here.
> Yes, I hit the same problem with swapon in my testing,
> and had been intending to send a patch.
>
>> Yes, just testing with below diff now. The patch is not in mm-stable yet, so
>> will just send another revision with below diff included. Thanks!
>>
>>
>> diff --git a/mm/swapfile.c b/mm/swapfile.c
>> index 0b8270359bcf..2263f71baa31 100644
>> --- a/mm/swapfile.c
>> +++ b/mm/swapfile.c
>> @@ -2643,7 +2643,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *,
>> specialfile)
>>          free_percpu(p->cluster_next_cpu);
>>          p->cluster_next_cpu = NULL;
>>          vfree(swap_map);
>> -       bitmap_free(p->zeromap);
>> +       kvfree(p->zeromap);
> Yes.
>
>>          kvfree(cluster_info);
>>          /* Destroy swap account information */
>>          swap_cgroup_swapoff(p->type);
>> @@ -3170,7 +3170,7 @@ SYSCALL_DEFINE2(swapon, const char __user *,
>> specialfile, int, swap_flags)
>>                  goto bad_swap_unlock_inode;
>>          }
>>
>> -       p->zeromap = bitmap_zalloc(maxpages, GFP_KERNEL);
>> +       p->zeromap = kvzalloc(DIV_ROUND_UP(maxpages, 8), GFP_KERNEL);
> No, 8 is not right for 32-bit kernels. I think you want
> 	p->zeromap = kvzalloc(BITS_TO_LONGS(maxpages), GFP_KERNEL);
> but please check it carefully, I'm easily confused by such conversions.
>
> Hugh

Ah yes, didnt take into account 32-bit kernel. I think its supposed to be

  p->zeromap = kvzalloc(BITS_TO_LONGS(maxpages) * sizeof(unsigned long), 
GFP_KERNEL);

if using BITS_TO_LONGS.

Will wait sometime incase there are more comments and will send out 
another version.

Thanks!

>>          if (!p->zeromap) {
>>                  error = -ENOMEM;
>>                  goto bad_swap_unlock_inode;
