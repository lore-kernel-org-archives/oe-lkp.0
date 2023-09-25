Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97BE79E3
	for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 12:47:44 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-27740ce6c76so1261108a91.0
        for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 05:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695646064; x=1696250864; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59e9Q+NrO3YE3TBwjwnvWwS+h5vOxpRFbiC+fpXnho4=;
        b=KvsCOitycm9U11s6hjZjER4mvAeOJbKfBIgfnhx6P+bY+RQO/+8/6FeJuInW3fLE3E
         LrUQvEvYvovnUfQsRx0wtooofUWTPyN8CREzRLVuKCdD1pBrzxJf4gV5bo1BTC2WKUdK
         r+qW0pJzNIMaugz1mGg7iVntpQ6PoWVjOhBHENew3gGY4lDcCJVjOp5DwREujsajJ6S2
         DFIrStDNfpkMZu9Jp9/kOGvTPRCwGwNTB7H/crrYlIew2h+OJzsEjfXt8upskX4wOnz+
         Tf1VcIGxcuyp1NN66jZhhCcgecMTWd4OkvG2AbPUPu6nvgm6LYZf8R7um2ql3lZ0wnRR
         +oWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695646064; x=1696250864;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=59e9Q+NrO3YE3TBwjwnvWwS+h5vOxpRFbiC+fpXnho4=;
        b=JzlvHJsPpM9jrS4y1Ls61eUHFn0fYYEIZdhX5QtCMtECU9vZ1yr/VEY42NL2atFIxa
         zcCGNVLyzQHAoSAtrMmEO5XhpJSPliTw28YIiUQDrBv6rGET0ZYFXFO6t2CBNQfE0fvK
         1HAYHTDVescxc6pW6jpR29DGXmPVFCjHGq+noN1c1zJRstml7h0j07NBL9X6GcWM5X2E
         omrcWiKDgObvRDeVsBc4pULKeFoW+qaiTpbT5RFdcFCjtd+tOeSUSeIkPur6ts0/4UYT
         pFWIXPRTeq8mUMxN5SjLKh1Q8VWk77CB0D4FLXGOZtLV7a9MLx2ejTjMycfTwgCwrdnZ
         4xEg==
X-Gm-Message-State: AOJu0YxMjnCLZxxDnl8DO9feXinwHqlOLo2sR7oBRkkZ0jyOlmtjXhkG
	RW7I4OCTtIIuS5rKPUEvmPlM1g==
X-Google-Smtp-Source: AGHT+IH277ayvbbTrXBiD6qr6Nsgm4xhuGeDj2Elii+1fXVOA0Dh/BeA5TfGw7xDEtnf3gUIAuoINA==
X-Received: by 2002:a17:90b:100e:b0:26d:4421:854d with SMTP id gm14-20020a17090b100e00b0026d4421854dmr3981851pjb.37.1695646063884;
        Mon, 25 Sep 2023 05:47:43 -0700 (PDT)
Received: from [10.254.235.57] ([139.177.225.226])
        by smtp.gmail.com with ESMTPSA id n1-20020a17090a2c8100b0027732eb24bbsm4220955pjd.4.2023.09.25.05.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 05:47:42 -0700 (PDT)
Message-ID: <08cffec5-a3ae-f02a-ca97-d93f7a17eaee@bytedance.com>
Date: Mon, 25 Sep 2023 20:47:36 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [linux-next:master] [maple_tree] 2041864a22:
 BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
To: jason.sim@samsung.com
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 kernel test robot <oliver.sang@intel.com>,
 "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
 "lkp@intel.com" <lkp@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Peng Zhang
 <zhangpeng.00@bytedance.com>, Suren Baghdasaryan <surenb@google.com>,
 "maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>
References: <202309242123.7ebe65b5-oliver.sang@intel.com>
 <CGME20230924135059epcas1p4c0595d07a7d50da7a877a0af696d9c78@epcms1p8>
 <20230925123907epcms1p82db5bc72fa25e390986f2e195a58b362@epcms1p8>
From: Peng Zhang <zhangpeng.00@bytedance.com>
In-Reply-To: <20230925123907epcms1p82db5bc72fa25e390986f2e195a58b362@epcms1p8>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2023/9/25 20:39, Jaeseon Sim 写道:
>> Hello,
>>
>> kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h" on:
>>
>> commit: 2041864a22d4f4e900d0a3def4985432a21d8e6d ("maple_tree: use mas_node_count_gfp() in mas_expected_entries()")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>> [test failed on linux-next/master 940fcc189c51032dd0282cbee4497542c982ac59]
>>
>> in testcase: boot
>>
>> compiler: gcc-9
>> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>>
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: https://lore.kernel.org/oe-lkp/202309242123.7ebe65b5-oliver.sang@intel.com
>>
>>
>> [  113.582828][    T1] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:306
>> [  113.583602][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
>> [  113.584246][    T1] preempt_count: 1, expected: 0
>> [  113.584613][    T1] RCU nest depth: 0, expected: 0
>> [  113.584983][    T1] 1 lock held by swapper/0/1:
>> [ 113.585344][ T1] #0: ffffc9000001fc10 (&mt->ma_lock){+.+.}-{2:2}, at: check_forking+0x1e0/0x5c0
> Dear Liam,
> 
> mas_expected_entries() in check_forking() tried to sleep while holding spinlock, and panic occurred.
> I think mas_expected_entries() in lib/test_maple_tree.c need to be modified to align with commit 2041864a22d4f.
> Do you have any idea for it? or Could you give some guide?
This is just a test module. The work[1] I'm doing modifies this place
and it will fix this bug.
Thanks.

[1] 
https://lore.kernel.org/lkml/20230925035617.84767-1-zhangpeng.00@bytedance.com/
> 
> Thanks
> Jaeseon
>   
>> [  113.586160][    T1] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G                TN 6.6.0-rc2-00018-g2041864a22d4 #1
>> [  113.586924][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
>> [  113.587701][    T1] Call Trace:
>> [  113.587949][    T1]  <TASK>
>> [ 113.588172][ T1] dump_stack_lvl (lib/dump_stack.c:107)
>> [ 113.588540][ T1] dump_stack (lib/dump_stack.c:114)
>> [ 113.588668][ T1] __might_resched (kernel/sched/core.c:10188)
>> [ 113.588668][ T1] __might_sleep (kernel/sched/core.c:10117 (discriminator 17))
>> [ 113.588668][ T1] kmem_cache_alloc (include/linux/kernel.h:112 include/linux/sched/mm.h:306 mm/slab.h:709 mm/slub.c:3460 mm/slub.c:3486 mm/slub.c:3493 mm/slub.c:3502)
>> [ 113.588668][ T1] ? mas_alloc_nodes (lib/maple_tree.c:160 lib/maple_tree.c:1249)
>> [ 113.588668][ T1] mas_alloc_nodes (lib/maple_tree.c:160 lib/maple_tree.c:1249)
>> [ 113.588668][ T1] mas_node_count_gfp (lib/maple_tree.c:1331)
>> [ 113.588668][ T1] mas_expected_entries (lib/maple_tree.c:5580)
>> [ 113.588668][ T1] check_forking+0x205/0x5c0
>> [ 113.588668][ T1] ? check_mas_store_gfp+0x580/0x580
>> [ 113.588668][ T1] ? mt_destroy_walk (lib/maple_tree.c:5273)
>> [ 113.588668][ T1] ? mtree_destroy (lib/maple_tree.c:6392)
>> [ 113.588668][ T1] ? lock_downgrade (kernel/locking/lockdep.c:5761)
>> [ 113.588668][ T1] ? __raw_spin_lock_init (kernel/locking/spinlock_debug.c:26)
>> [ 113.588668][ T1] maple_tree_seed (lib/test_maple_tree.c:3584)
>> [ 113.588668][ T1] ? check_empty_area_window+0x3000/0x3000
>> [ 113.588668][ T1] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:63 (discriminator 22))
>> [ 113.588668][ T1] ? write_comp_data (kernel/kcov.c:236)
>> [ 113.588668][ T1] ? check_empty_area_window+0x3000/0x3000
>> [ 113.588668][ T1] do_one_initcall (init/main.c:1232)
>> [ 113.588668][ T1] ? trace_event_raw_event_initcall_level (init/main.c:1223)
>> [ 113.588668][ T1] ? parameq (kernel/params.c:171)
>> [ 113.588668][ T1] ? __kasan_kmalloc (mm/kasan/common.c:384)
>> [ 113.588668][ T1] kernel_init_freeable (init/main.c:1293 init/main.c:1310 init/main.c:1329 init/main.c:1547)
>> [ 113.588668][ T1] ? rest_init (init/main.c:1429)
>> [ 113.588668][ T1] kernel_init (init/main.c:1439)
>> [ 113.588668][ T1] ? rest_init (init/main.c:1429)
>> [ 113.588668][ T1] ret_from_fork (arch/x86/kernel/process.c:153)
>> [ 113.588668][ T1] ? rest_init (init/main.c:1429)
>> [ 113.588668][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312)
>> [  113.588668][    T1]  </TASK>
>>
>>
>>
>> The kernel config and materials to reproduce are available at:
>> https://download.01.org/0day-ci/archive/20230924/202309242123.7ebe65b5-oliver.sang@intel.com
>>
>>
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://protect2.fireeye.com/v1/url?k=cc5f4a3e-add45f07-cc5ec171-000babffae10-d841b249634d3b66&q=1&e=af92f0ae-c873-480a-8f2b-9d5c35053b67&u=https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests%2Fwiki
> 
