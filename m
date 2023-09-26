Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C675D7F
	for <oe-lkp@lists.linux.dev>; Tue, 26 Sep 2023 02:55:35 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c1ff5b741cso69917525ad.2
        for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 19:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695696935; x=1696301735; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrQ2Nq84VzrtnFGziz71CiExgTFO4ujxz6F6FWLEQKE=;
        b=PFYKT0+u6ExSC8uku1K0eQjRbXSNCOZLTEcKaCW663kdhUoCfyPEOvfSdwsxXBLw/K
         gicxCSWu4EFgOgwXcvra+4IrbepJ+AXNq5sx4NLI8iqhUhvKFyvhHWH8l97qrMivh9Fj
         HJUhYIcbNCygO+xliZ67wipnp53k32b5sJyJvx5XmM9n/1xPmB2ubuVUL/9YhNctYoCR
         XcaOzm2BeowJxleQtJD+AQRjtXu/YfVuXsFb/mcs6AtJT+t3FGscxyjigvEPv7t/M235
         arPHNIVWGXtcQMrsRFep9EVtFka6v35qwh3pblNFLzLune+2kVcTuqG/psUGHCIoutTk
         87DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695696935; x=1696301735;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FrQ2Nq84VzrtnFGziz71CiExgTFO4ujxz6F6FWLEQKE=;
        b=YpcE3pBq7ueXLLo4p39ZwVqkQIq0Kay82Z95S0bPJ/ON2BKVQ6IylNP6NZ/ZOEmEls
         BXAgNVA3mAym9QNSqZIDxPDDlQZaZfR5tkrsq7LbfkJwPgDLujUOrZ2YspZ0cfrJB+ge
         zVjS6kerdppllmAlnhem3/Oda08Nfj4fDF9i1fzRzvx1nhzUcdIPgCzHSzow4cJFCg2f
         Gwzo9FPeGwp6kmAL4VwMzBqJkzjVFpoT/3EGQx4dCKexgTjc22SuPrJyDCF9KwAMXUIY
         4wfUMgZyK+g2G71W6kVjWoDJlleKL7eeQVT1jGXiNCUhGVDFuPfl/thhi7y52s/dDBJm
         kAsg==
X-Gm-Message-State: AOJu0YwYTiGCmDK3JdEa3VomDX4tjyhcjniUW/d0xOFm/qoXT7lrx/7b
	ky1LN6xvF1VM78yrS4inPkX37w==
X-Google-Smtp-Source: AGHT+IFRjE7PoccokAyS+idzJy1C3sfLW4xKzMk1dOJKth/RNh3wZv7eCbzbFTyvK2j+5pvj66S70A==
X-Received: by 2002:a17:902:b284:b0:1c3:3dae:5869 with SMTP id u4-20020a170902b28400b001c33dae5869mr8423829plr.63.1695696934952;
        Mon, 25 Sep 2023 19:55:34 -0700 (PDT)
Received: from [10.254.245.222] ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id jh5-20020a170903328500b001bb9bc8d232sm9699340plb.61.2023.09.25.19.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 19:55:34 -0700 (PDT)
Message-ID: <ee06ab24-0455-d212-e995-745f83366e00@bytedance.com>
Date: Tue, 26 Sep 2023 10:55:27 +0800
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
To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 Peng Zhang <zhangpeng.00@bytedance.com>, jason.sim@samsung.com,
 kernel test robot <oliver.sang@intel.com>,
 "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
 "lkp@intel.com" <lkp@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>,
 "maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>
References: <202309242123.7ebe65b5-oliver.sang@intel.com>
 <CGME20230924135059epcas1p4c0595d07a7d50da7a877a0af696d9c78@epcms1p8>
 <20230925123907epcms1p82db5bc72fa25e390986f2e195a58b362@epcms1p8>
 <08cffec5-a3ae-f02a-ca97-d93f7a17eaee@bytedance.com>
 <20230925152353.zoezenruphilf2kc@revolver>
From: Peng Zhang <zhangpeng.00@bytedance.com>
In-Reply-To: <20230925152353.zoezenruphilf2kc@revolver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2023/9/25 23:23, Liam R. Howlett 写道:
> * Peng Zhang <zhangpeng.00@bytedance.com> [230925 08:47]:
>>
>>
>> 在 2023/9/25 20:39, Jaeseon Sim 写道:
>>>> Hello,
>>>>
>>>> kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h" on:
>>>>
>>>> commit: 2041864a22d4f4e900d0a3def4985432a21d8e6d ("maple_tree: use mas_node_count_gfp() in mas_expected_entries()")
>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>>
>>>> [test failed on linux-next/master 940fcc189c51032dd0282cbee4497542c982ac59]
>>>>
>>>> in testcase: boot
>>>>
>>>> compiler: gcc-9
>>>> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>>>>
>>>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>>>
>>>>
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>>>> | Closes: https://lore.kernel.org/oe-lkp/202309242123.7ebe65b5-oliver.sang@intel.com
>>>>
>>>>
>>>> [  113.582828][    T1] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:306
>>>> [  113.583602][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
>>>> [  113.584246][    T1] preempt_count: 1, expected: 0
>>>> [  113.584613][    T1] RCU nest depth: 0, expected: 0
>>>> [  113.584983][    T1] 1 lock held by swapper/0/1:
>>>> [ 113.585344][ T1] #0: ffffc9000001fc10 (&mt->ma_lock){+.+.}-{2:2}, at: check_forking+0x1e0/0x5c0
>>> Dear Liam,
>>>
>>> mas_expected_entries() in check_forking() tried to sleep while holding spinlock, and panic occurred.
>>> I think mas_expected_entries() in lib/test_maple_tree.c need to be modified to align with commit 2041864a22d4f.
>>> Do you have any idea for it? or Could you give some guide?
> 
> There are two ways we could fix this: one is to pass through the GFP
> flag and use different flags in the test module, the other is to move
> the testing out of the module and into the userspace tests.
Actually, there is a third method that can be used to solve this
problem, which is to use an externally sleepable lock, such as
rw_semaphore.
> 
> Adding the GFP flag to the interface might be needed in the future but
> there's no need for that now.  I was concerned about too large of a
> change to the existing code, and this would increase the runtime code
> changes - although not a lot.
> 
> I think the best thing would be to move the forking test out of the
> module into the userspace testing (tools/testing/radix-tree/maple.c)
> 
>> This is just a test module. The work[1] I'm doing modifies this place
>> and it will fix this bug.
> 
> Thanks Peng.  This is a temporary fix for upstream, but is needed for
> the LTS kernels as well.  I've mentioned your patches to others, so
> don't think they aren't noticed - they are eagerly awaited.
> 
> Since your patch adds the necessary GFP flag, we could move the
> check_forking test back in your update, (patch 7/9 [1]) which avoids the
> GFP_KERNEL flag (thanks!), if it is moved.  I think it's worth while to
> do since you already have a lot of userspace tests as well that uses
> GFP_KERNEL (4/9 [2]) and it's good to keep as much in the kernel module
> as possible.
> 
> By the way Peng, I have gotten complaints (I cannot find a reference
> quickly) from older CPUs taking a long time on the test module.  You are
> making things faster, but I just wanted you to be aware of that in case
> you add tests in the future that cause complaints :)  I still think it
> is worth keeping as much as possible in that module - it's a more valid
> test scenario and it still runs from the userspace testing.
I understand this now, and I will take this into consideration when
adding tests in the future.
> 
> ...
> 
>> Thanks.
>>
>> [1] https://lore.kernel.org/lkml/20230925035617.84767-1-zhangpeng.00@bytedance.com/
> 
> ...
> 
> Thanks,
> Liam
> 
> [1] https://lore.kernel.org/lkml/20230925035617.84767-8-zhangpeng.00@bytedance.com/
> [2] https://lore.kernel.org/lkml/20230925035617.84767-5-zhangpeng.00@bytedance.com/
> 
> 
