Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDFC2108
	for <oe-lkp@lists.linux.dev>; Fri,  8 Sep 2023 09:47:15 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68e369ba5f8so1512587b3a.2
        for <oe-lkp@lists.linux.dev>; Fri, 08 Sep 2023 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1694166435; x=1694771235; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOFDh/D3nnnbGTYfl9jTSGlOLCGKw3LCJaJiKQKzt8k=;
        b=AEMZZGkYW8Hm/JSB5U1vK3MhPFpteZS0RFYtG2/eLN2/FyVKFkh+ks9echmtBCGfTU
         5KqdgYh1hY7Wuk5LfpyDKC1PXQx+8orXgCdNxsorTpF+7AqdAi0ZF+1fSJRA+diBD5Ky
         U7gVvlazQ3rAUf71eMi3fXbv+RAWOyiOtSwFJxdGKzM5vaQ36M2q9sbR0KR6kMpQoKca
         84g/b5sbcMmjQsq4vL6wtSqwj04JNO9S7iCvizmE997ORSzXQxn7Vx2TZPn7kOTyABXT
         qVTfOXZVuPjNNbMLMRZl14d8CPLcq/F0TALllWg/of51HEFoVHNG71FTjxNP9AaZzyeL
         4sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694166435; x=1694771235;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZOFDh/D3nnnbGTYfl9jTSGlOLCGKw3LCJaJiKQKzt8k=;
        b=aAziEcHa9G43fKtnbl/bgjzi55F92qoH30RtDU1lmfduLzeinejrn/VkI67TdGTgNY
         vVL3d7IrqtKg32YQSqqun2mAFm8eCbu8SNmfBywcSaOZWjFXKEG0f1DW6h9luuNgQY9y
         4Rg5qYcqFatyIZeWPhxTsCRsZ2FUS9MLs1xSclB9o4FeDMp4XkjnhkOiWrfCDDb2aWRI
         xHbvkPlm7D9vO3Fry8K/XT7A2efM4RXg0B4SKf+lQgeKitNadnDPrvMUeZ0CxZOH9pdh
         yCx1CdmZojiasL2ECKacY71rc2/2j+SdZeGFHBzt0wmgOq6xvAKIqGcxzcCzOMN7/yx7
         tWCQ==
X-Gm-Message-State: AOJu0YydaawZ+jKYfwok8V8jpGYiN2Ty/QscbzvbyL927MeUg4M45zFd
	z3KyPNeKLuC+vdyxXPIfotR9qA==
X-Google-Smtp-Source: AGHT+IGToacl2IfMv5vF0nuGEuNbbaTH2uXstB2lcyAVK5QoZX/d+uZ0rVygQlbRD+yxYwSf4/OO+w==
X-Received: by 2002:a05:6a20:1441:b0:153:588c:f197 with SMTP id a1-20020a056a20144100b00153588cf197mr2569108pzi.35.1694166435181;
        Fri, 08 Sep 2023 02:47:15 -0700 (PDT)
Received: from [10.254.232.87] ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902bd0500b001bba7aab822sm439696pls.5.2023.09.08.02.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 02:47:14 -0700 (PDT)
Message-ID: <bbb0959d-5ad1-846b-b896-eb4c5dd900bf@bytedance.com>
Date: Fri, 8 Sep 2023 17:47:03 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 5/6] maple_tree: Update check_forking() and
 bench_forking()
To: Matthew Wilcox <willy@infradead.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Peng Zhang <zhangpeng.00@bytedance.com>,
 kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, maple-tree@lists.infradead.org, linux-mm@kvack.org,
 corbet@lwn.net, akpm@linux-foundation.org, brauner@kernel.org,
 surenb@google.com, michael.christie@oracle.com, peterz@infradead.org,
 mathieu.desnoyers@efficios.com, npiggin@gmail.com, avagin@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <202308312115.cad34fed-oliver.sang@intel.com>
 <0e9a87d9-410f-a906-e95c-976a141f24f0@bytedance.com>
 <20230907180301.lms4ihtwfuwj7bkb@revolver>
 <ZPoThAU9zoW2q/YR@casper.infradead.org>
From: Peng Zhang <zhangpeng.00@bytedance.com>
In-Reply-To: <ZPoThAU9zoW2q/YR@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2023/9/8 02:16, Matthew Wilcox 写道:
> On Thu, Sep 07, 2023 at 02:03:01PM -0400, Liam R. Howlett wrote:
>>>>   WARNING: possible recursive locking detected
>>>>   6.5.0-rc4-00632-g2730245bd6b1 #1 Tainted: G                TN
>>>>   --------------------------------------------
>>>>   swapper/1 is trying to acquire lock:
>>>> ffffffff86485058 (&mt->ma_lock){+.+.}-{2:2}, at: check_forking (include/linux/spinlock.h:? lib/test_maple_tree.c:1854)
>>>>
>>>>   but task is already holding lock:
>>>>   ffff888110847a30 (&mt->ma_lock){+.+.}-{2:2}, at: check_forking (include/linux/spinlock.h:351 lib/test_maple_tree.c:1854)
>>> Thanks for the test. I checked that these are two different locks, why
>>> is this warning reported? Did I miss something?
>>
>> I don't think you can nest spinlocks like this.  In my previous test I
>> avoided nesting, but in your case we cannot avoid having both locks at
>> the same time.
>>
>> You can get around this by using an rwsemaphore, set the two trees as
>> external and use down_write_nested(&lock2, SINGLE_DEPTH_NESTING) like
>> the real fork.  Basically, switch the locking to exactly what fork does.
Here I can use rwsemaphore to avoid the warning. But what about in
mtree_dup()? mtree_dup() handles locks internally.

Maybe spin_lock_nested() mentioned by Matthew can be used in
mtree_dup().
> 
> spin_lock_nested() exists.
Thanks for mentioning this, I'll have a look.
> 
> You should probably both read through
> Documentation/locking/lockdep-design.rst It's not the best user
> documentation in the world, but it's what we have.
> 
