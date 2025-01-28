Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5131B4223
	for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 15:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738079960; cv=none; b=Y9cdYiVh3EtSfnv/nSGruT+5I5/Yz1++DQnP7I4x3P0TEF6ZgBrtR0GpDE++ALnkdx4JpvCd3y2nykniG6khp6kRxcO5X1ExYgkGJ/0qU3p9ornZCmk/CdHi3LwxllNF9S3hbOYWiB7dLvRaipqYjxrHehAgY8e6jWCp0+E4oWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738079960; c=relaxed/simple;
	bh=6H17ebZieFuo8QRO1abKL/98wl9AEiIGn6X6pZ1rrAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTmlzQVRm9T6cyXbw776ETV8WbBqGvjQvMyLeMrm9hmu1abNvkyJWLkLXLQwuI1HS7rEbqZatprkDQa87Z+neNCyi2zRGE9rXeH75M3btSJyhE/9eilHxJsSkeAxkk6v7bM3n+2jqA14515j008AQ8ySMPvTlylK9NUyI42T5wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hnaHfzNk; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hnaHfzNk"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso7818945a91.1
        for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 07:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738079957; x=1738684757; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FcFXVmpeWLaOTbMBFSx1K5RCNZo8yu2zdYEka+TaMpU=;
        b=hnaHfzNkVH4ID3MqiE7cte7ywAtaCGCTWrCxbgheq91DpiANSQhQctkzt90hFJXPgr
         URHCbUNBReBJuTYsxOxUSFCOuLOxRIt0hEOVPiot3fvwXETDm+nZCAeyNqOBD4h8y8rB
         vH9bW3bfeG6XiBn4bHrUTvR292J9NeO3zNXpFHkFyNQg0vifGJyMtzMcI6V43HKNeoUk
         7dRMTBw9uds2+vJA0QRiQigQTuWATN8nikepcglejdSp/oL/1clYVh9Uz6gR/wp6T2LJ
         CESktZ5HrZQyve8m0SpwU12NXA3fttrwUaopSyEud9bT4cOtRdXG5u2tWcSamg0lKfr3
         4Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738079957; x=1738684757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcFXVmpeWLaOTbMBFSx1K5RCNZo8yu2zdYEka+TaMpU=;
        b=UO++ehH72d6Lxae5+hjUFsix9AtXAuGuzSfCCgCzYawxXuRE0st2pkL6cajvVRCYXj
         gatKuJIU86IknDRInUdSkh2K6HiP6DIKtg7NnjEthWv/+qTOfTbKNANAXTVKMx2Vsvxv
         b0fUfPR94txR28+d+sWAdIJZoRxtDGdNOGPOqmZsAEdkYOGb8QXj38HdAFX4gMseZIWj
         uSjUhksF1aEUAcRdb/l2iJzeig98ld3Yds7MDMky3kN3ZNe7p34uZunEeM8QZl48tMUe
         ivG1M6rz3P+rEBruCa1fDIBnml4BO88Z+WG2Mg8gLaKCLfUIE6Xed1mqg4RRFMVlx0TH
         JLwA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9lSfHETmSp2HLxzTv5wXc02m2LmebqtJO0GRmiOfG/3mvFkGoCtrmjM/WRgqKNQGAI0FNkE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxV7fvw6W4C/oLrMngVtlVMY9IfulX8A9rF+AH/DRFLzNtYj5uQ
	wlBs4QxkMD6c/GwiiVj7CcHm+ZJZ8JeoMTPQAC+fSDbqrRXLVq2H/sB4gBr4/Bk=
X-Gm-Gg: ASbGnctTqepNmBHe/EXOAFu1LstqwfSR5Fp1CzbaDUzpIfZ9Oe92A074NYg6297FAcb
	OVmP8bhvpPMoGDmgXHx4qHOEvHYLZusYJfqstLk8cFsKzYXLbJkqyJD/XVEa3C0s2xJddkPbOo4
	Y9NsOWzwaqqpDUEFpAWh3ZAscg0R5ZSAi2KKuC6oCMV0L2kQr6v+ZGQg4oEFZRJHfCRl8gBsBNt
	ZUZOVsN0NAVCo3L4O9uoFoPYWmoK856BMS1bPV1kcblPmBKjinSVYSK75hJvvbUeleNX/A7/66K
	iWHbiAPJW1b15kxvJjPtwu+CApeJ9v1+Rw6w4lSG66DZKRk+so1T9AC76fkUaWEMDSaRdpCsn9O
	Dag606O6j3Drjwj4=
X-Google-Smtp-Source: AGHT+IFngimGxynW5tJ16OrcamQhczwTsyiGYTXixNAlpl9qZTUVAJ5KgMSNtzunxmn1CEnIaPIhxA==
X-Received: by 2002:a05:6a00:84f:b0:725:df1a:288 with SMTP id d2e1a72fcca58-72dafaf8ab3mr74335171b3a.24.1738079957442;
        Tue, 28 Jan 2025 07:59:17 -0800 (PST)
Received: from ?IPV6:240e:370:8b13:97f0:154c:a6ff:49c9:f239? ([240e:370:8b13:97f0:154c:a6ff:49c9:f239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b3f86sm9708981b3a.67.2025.01.28.07.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 07:59:16 -0800 (PST)
Message-ID: <e0c0dd89-ca82-4423-aae5-eb8ec60b31da@bytedance.com>
Date: Tue, 28 Jan 2025 23:59:07 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Rientjes <rientjes@google.com>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
 Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Will Deacon <will@kernel.org>, Zach O'Keefe <zokeefe@google.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Rik van Riel <riel@surriel.com>
References: <202501281734.d408a35b-lkp@intel.com>
 <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
 <20250128113100.GB7145@noisy.programming.kicks-ass.net>
 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
 <20250128132847.GB505@noisy.programming.kicks-ass.net>
 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/28 21:42, David Hildenbrand wrote:
> On 28.01.25 14:28, Peter Zijlstra wrote:
>> On Tue, Jan 28, 2025 at 12:39:51PM +0100, David Hildenbrand wrote:
>>> On 28.01.25 12:31, Peter Zijlstra wrote:
>>
>>>>> I recall a recent series to select MMU_GATHER_RCU_TABLE_FREE on x86
>>>>> unconditionally (@Peter, @Rik).
>>>>
>>>> Those changes should not have made it to Linus yet.
>>>>
>>>> /me updates git and checks...
>>>>
>>>> nope, nothing changed there ... yet
>>>
>>> Sorry, I wasn't quite clear. CONFIG_PT_RECLAIM made it upstream, 
>>> which has
>>> "select MMU_GATHER_RCU_TABLE_FREE" in kconfig.
>>>
>>> So I'm wondering if the degradation we see in this report is due to
>>> MMU_GATHER_RCU_TABLE_FREE being selected by CONFIG_PT_RECLAIM, and 
>>> we'd get
>>> the same result (degradation) when unconditionally enabling
>>> MMU_GATHER_RCU_TABLE_FREE.
>>
>> Ah, yes, put a RHEL based config (as is the case here) should already
>> have it selected due to PARAVIRT.
> 
> Ah, right. Most distros will just have it enabled either way.
> 
> But that would then mean that MMU_GATHER_RCU_TABLE_FREE is not the cause 

In addition, commit 718b13861d22 ("x86: mm: free page table pages by RCU 
instead of semi RCU")
also made a change, that is, when freeing a single page table pages, use
RCU to free the page table page instead of sending the IPI.

But in theory this should not cause performance regression, and I have
tested the performance of munmap with bpftrace and found no regression.

> for the regression here, and something else is going wrong.

It looks like it, I will investigate it carefully.

Thanks!

> 
