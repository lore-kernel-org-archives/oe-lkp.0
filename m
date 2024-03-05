Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1507BB0F
	for <oe-lkp@lists.linux.dev>; Tue,  5 Mar 2024 06:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709620010; cv=none; b=jH//RL89HJ/mNka1iByEFjZo6Z6vkAUfFH73pfpRvBwYaFhIX+gqidP21MhjXoaPhhnfVULPIY0N4rnmCBbwlW8F7k8Bgex63ry/1TxbAJ6BHK4nM+hivI6SVk53ocIEiEa31POne2nOcgl6KSLF7VIp1TFV1JBrpVciNUnSHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709620010; c=relaxed/simple;
	bh=N8zB5QxRfQ1Pwoa/Axi5ct98SPkBaJZ7tUTVwQlEXrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQj0ln2SV5R8A9fSkI1B8kPuilD4UnbCGRbYNp/BLD/R4k8sa/TkxB+vrlKV3+kEUk1MinaJQ7Spl5vvDD5mH3qmkgvKgBrUwTt9ExJRqw2JxskCbqSxIUb+Xz+epBWPF56FkyYLhRZ5i8zlqUiYXNR3Ce+AvQM2lfvjTvkoYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=G3PIGRKw; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="G3PIGRKw"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e5eaf5bb3eso343234b3a.3
        for <oe-lkp@lists.linux.dev>; Mon, 04 Mar 2024 22:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709620008; x=1710224808; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2w88aP0w0l2XM2FEGGnYLLZzGTri3r+uTrIgue2qs4=;
        b=G3PIGRKwRvTlb2vFoa19xYFbYR+TYOwRzXAm1UHSiHFTnNr/1nmO2JFaf/csiP6nXL
         Hotyim8axo+xTFqZbnWezCPupTO0qD3L56VxHmL8K10lMAA2YxEmLSDHH6L9Gf0c8Oc4
         8uRg3WJOC7+yl3mXWSMpCUfYDxNaW8W1bHx9DboeKZMpSbKHyNVCfRShLzsNgXtFdYAI
         rjzauFtBnY1GYkarg7PYZ9/PSejnn1g2+viYzBOSjT4y+weN1pFbV7LegELNMh3qDckx
         m9IHldB6kQnhJfveqmGnLSqfOefmoN/D2cLNboYONZDZmRJQODW/IiGeRLxypSj/B4ro
         Khbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709620008; x=1710224808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2w88aP0w0l2XM2FEGGnYLLZzGTri3r+uTrIgue2qs4=;
        b=q9nkvoYZP7wJElcX/W9QXVI0fI2xuR/zQ0IzCI4m/fGQjeSpLvrRTe8BHiPU3YdpcF
         F2UK/MEsfrWgf8P15k8Yx7yrIqSIGxWuhhNLDvAssxxypuy/6mZ6Ll/ZehlSk3+0F5SC
         kdGPsg+HniHWMKKx2v9fQ2NzkBSFPy6+J4I7GO6zw9YYhGDgSkH4Kpadl+sntBByKkWY
         TOJI9qCOHLu/EcHpNDrl309V0thtFc8+wSb2GIXdwPOX6nas7edEHp2MiieF6CCK4nUt
         ab9fq7arsK2tbyDhu+4IEmQx/0ooHRVnpK99l4qXPCDkzkubjDVAQ3u42Wcpe6AgaHVr
         Vbvg==
X-Gm-Message-State: AOJu0Yw2iRWVmzQD6iB4rY7Pn+rf340//mT0hHkczwn/QJMApWJg4OpU
	j10uxFWvDYIVhuRuNKYD3pNhz8nz0M8aekLv+/Kv8G2YcD+W3DM/QuNB4/My2QwROyPZI+OKplA
	A
X-Google-Smtp-Source: AGHT+IFjrJQ9ghS+9AJ4azPUvBka2eHedp4SB5zrkZ15ZtPebDeqsNbsGisGu+WWcgnZkOeCqVYqgQ==
X-Received: by 2002:a05:6a00:2315:b0:6e4:fa4b:b6e0 with SMTP id h21-20020a056a00231500b006e4fa4bb6e0mr12965155pfh.15.1709620008404;
        Mon, 04 Mar 2024 22:26:48 -0800 (PST)
Received: from [10.254.206.221] ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id jw37-20020a056a0092a500b006e621e75cffsm2750121pfb.83.2024.03.04.22.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 22:26:48 -0800 (PST)
Message-ID: <2db1ec36-c227-4bed-b3d5-a0dc4834a193@bytedance.com>
Date: Tue, 5 Mar 2024 14:26:43 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm/zswap] 18ce3c9e4c:
 BUG:spinlock_bad_magic_on_CPU
Content-Language: en-US
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yosry Ahmed <yosryahmed@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Nhat Pham <nphamcs@gmail.com>
References: <202403051008.a8cf8a94-lkp@intel.com>
From: Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <202403051008.a8cf8a94-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/3/5 14:02, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:spinlock_bad_magic_on_CPU" on:
> 
> commit: 18ce3c9e4c2d7cc1b7eaf1e8cc95be8e34209dac ("mm/zswap: global lru and shrinker shared by all zswap_pools")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 67908bf6954b7635d33760ff6dfc189fc26ccc89]
> 
> in testcase: boot
> 
> compiler: clang-17
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +----------------------------------------------------+------------+------------+
> |                                                    | acc2918c08 | 18ce3c9e4c |
> +----------------------------------------------------+------------+------------+
> | BUG:spinlock_bad_magic_on_CPU                      | 0          | 12         |
> +----------------------------------------------------+------------+------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202403051008.a8cf8a94-lkp@intel.com
> 
> 
> 
> [   88.645344][    T8] BUG: spinlock bad magic on CPU#0, kworker/0:1/8
> [ 88.645699][ T8] lock: zswap+0xd0/0x110, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0 
> [   88.646351][    T8] CPU: 0 PID: 8 Comm: kworker/0:1 Tainted: G        W       TN 6.8.0-rc5-00353-g18ce3c9e4c2d #1
> [   88.646922][    T8] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [   88.647458][    T8] Workqueue: cgroup_destroy css_killed_work_fn
> [   88.647785][    T8] Call Trace:
> [   88.648049][    T8]  <TASK>
> [ 88.648308][ T8] dump_stack_lvl (lib/dump_stack.c:107) 
> [ 88.648557][ T8] do_raw_spin_lock (kernel/locking/spinlock_debug.c:?) 
> [ 88.648807][ T8] zswap_memcg_offline_cleanup (mm/zswap.c:784) 

Hmm, zswap is not enabled so this new spinlock is not initialized at all...

Maybe it's better to take Nhat's suggestion to change static struct zswap {}
to multiple static variables, to keep in consistent with other global variables
in zswap.

I will fix it and sent out a hotfix after testing.

Thanks.
