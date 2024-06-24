Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A57E13D521
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719234368; cv=none; b=QQAIHQETMUNNmb3I+v6HJbdmC7ezitdilgAW6NnQuwv+2NAAHOJ4nB74bN53SWZ16xfAIDxw+/sZzI/dpGI07o+cCOirwyISzlgjXju/SMoH72M1djjNk/tpie5Ausp5LeJ/d5aakzibeWVQFtnPiCCxZMtFSkVCjnsmTigar4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719234368; c=relaxed/simple;
	bh=bsFpJ2LlKDUDMCg2nIHUAdPiP7EOnEZdOcqaM4cYPL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUs+G/3CTtddG4/xGegD88e4+tpexHAezPqgo+zISZrixhwiJOA8yWeHeiAQSmDZABmHmMYkigZ87K2oTJ/cH2KgH7lUBFv7QP0OtoEbyykQOibQ1jd3bT6lq9oYIoe+r11mYaZCxiQuB/AWPNldob6hwcNWHqXrD0s7QFcKV9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjcB/F4h; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjcB/F4h"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4248ea53493so8985005e9.3
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 06:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719234366; x=1719839166; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjbtUbH0/r3ewxHlL2R0EHYshkh/JTAG0D1DEhiQckM=;
        b=WjcB/F4hT8Qo6+L3XWKvuEpY65Peo/nJU+dUQXqpbhMZO23Jk6Z8rB6nphHwXQlgAf
         Iwqdu22UnrcCfIr6glnjtiV33nbkAe+wJjPqSoxgIYkJGAqsM95L23Xsccq59gwwGxKt
         DukCFw68E+Vjrr8DWSW7cdFepcweETNWbzz3KTE0wEkgsGoco76qLCf1E4yrAFuchV2s
         kf/BhHRi17cqZc1f8o1WR3uw+xMfuZfGLMZ8UzW4SndM6JceVjANjC8BOgot1k/+zOvX
         3Th8PYrojUOVpikoS8ZkS+r/Mtnv7Nkc2Pt8BEE3sjxwSl39abyfQXsVoVKxPGmHWPT7
         UmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719234366; x=1719839166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjbtUbH0/r3ewxHlL2R0EHYshkh/JTAG0D1DEhiQckM=;
        b=FWzfa8gn/K4tTyISPK0/rzhUVyUso5oNBfa8d3T4ULgc3O2az2idVl9+U7CWJ29Hcx
         1ytwuzv0OOrHtaKCARfd3MMdnmbpRpb2D5cAEqcQ94prAPpbSHJy0P9LpTwQ5Gdq2CVy
         p6B6ZilXlyWkRVfYTbH267HWLplq38bcWaunLevOBR61kzlYCpHGnK6yU4Xk1s5DPzDG
         jM4yvilF4bWmgsh/ifOSSNcLm5qoy30A27ybvgcjceXFzvK3YXTnGBl2ywdl6Jqj/rQh
         4aCAu13EuZqWMyrrJ12CJs7gbjEVoXIrVz9It9R9sti7F8I+vS/qfWzKtrOXXbOK9uwe
         2pMg==
X-Gm-Message-State: AOJu0YzYxGR/CbiHvw+F3qjJSuJHLZpLNuHRiAXxaahQVKn5Ua3jcMz5
	ssUH8ECbdPt3BPYimenH9rXiZdef8IRdLyT3hMv1tlfHDdPO3Bmw
X-Google-Smtp-Source: AGHT+IE4FlgLAOGpHUN4Wucv93B2eDrXC3YiiP6yeuDXARAnrn5UUyqDVlY4M0LXfHpTkpcZ0nyEuw==
X-Received: by 2002:a05:6000:1816:b0:366:f6bd:a549 with SMTP id ffacd0b85a97d-366f6bda769mr1544909f8f.11.1719234365512;
        Mon, 24 Jun 2024 06:06:05 -0700 (PDT)
Received: from ?IPV6:2001:16a2:df66:b900:46d:aa3:6645:bcd8? ([2001:16a2:df66:b900:46d:aa3:6645:bcd8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6355sm9968296f8f.17.2024.06.24.06.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 06:06:05 -0700 (PDT)
Message-ID: <12fb19d1-3e57-4880-be59-0e83cdc4b7f1@gmail.com>
Date: Mon, 24 Jun 2024 16:06:02 +0300
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 0fa2857d23:
 WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof
To: Yosry Ahmed <yosryahmed@google.com>,
 kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chengming Zhou <chengming.zhou@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
 David Hildenbrand <david@redhat.com>, "Huang, Ying" <ying.huang@intel.com>,
 Hugh Dickins <hughd@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Matthew Wilcox <willy@infradead.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org
References: <202406241651.963e3e78-oliver.sang@intel.com>
 <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24/06/2024 15:05, Yosry Ahmed wrote:
> On Mon, Jun 24, 2024 at 1:49 AM kernel test robot <oliver.sang@intel.com> wrote:
>>
>>
>> Hello,
>>
>> kernel test robot noticed "WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof" on:
>>
>> commit: 0fa2857d23aa170e5e28d13c467b303b0065aad8 ("mm: store zero pages to be swapped out in a bitmap")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> This is coming from WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp), and
> is triggered by the new bitmap_zalloc() call in the swapon path. For a
> sufficiently large swapfile, bitmap_zalloc() (which uses kmalloc()
> under the hood) cannot be used to allocate the bitmap.
>
> Usama, I think we want to use a variant of kvmalloc() here.

Yes, just testing with below diff now. The patch is not in mm-stable 
yet, so will just send another revision with below diff included. Thanks!


diff --git a/mm/swapfile.c b/mm/swapfile.c
index 0b8270359bcf..2263f71baa31 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2643,7 +2643,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, 
specialfile)
         free_percpu(p->cluster_next_cpu);
         p->cluster_next_cpu = NULL;
         vfree(swap_map);
-       bitmap_free(p->zeromap);
+       kvfree(p->zeromap);
         kvfree(cluster_info);
         /* Destroy swap account information */
         swap_cgroup_swapoff(p->type);
@@ -3170,7 +3170,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, 
specialfile, int, swap_flags)
                 goto bad_swap_unlock_inode;
         }

-       p->zeromap = bitmap_zalloc(maxpages, GFP_KERNEL);
+       p->zeromap = kvzalloc(DIV_ROUND_UP(maxpages, 8), GFP_KERNEL);
         if (!p->zeromap) {
                 error = -ENOMEM;
                 goto bad_swap_unlock_inode;

