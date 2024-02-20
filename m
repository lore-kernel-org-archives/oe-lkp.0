Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8B94CE00
	for <oe-lkp@lists.linux.dev>; Tue, 20 Feb 2024 03:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708400400; cv=none; b=Es4nO69/luZfTdQimKIW2h9qAMDElPzo51K6Pb4Ao7fqNzXGvA8TFvn5zh8WIsLCAn3uRK/fv4Vs9AD/vhGlIjYOFdWNuYW7aBw2gu1Qxl0gUI7bjjHBKte8kvtGe6ZkFw3bePFEo2ligDbN1/Ye7GOaK70SR97R/c769b2jgpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708400400; c=relaxed/simple;
	bh=yOKGA8wab/Ee/bmU7v/Q9RlZRsEjbjN+OuIsJAHhMJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBcna4n+mjV35jxuPg7mc9T4daX/01mMJZ24UlrtVwlcXhr++vBeEDosUyZOcV5QzkFLBuGJqDsoYklGKyyql4uHDlxL3fLA2zckBh7P3HYVUiX5U89te2pFIHoTkLcIEuuMbdCL7Ie1TLmZOHo9hsh6JLoAnOwufdIdFrIkLNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=N0XUXtnP; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="N0XUXtnP"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dba177c596so26394635ad.0
        for <oe-lkp@lists.linux.dev>; Mon, 19 Feb 2024 19:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1708400398; x=1709005198; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61gdFIOyAEtp7pfCHFQh+Fc/gqgVzNiO4CpvePAyVXw=;
        b=N0XUXtnPRWj05zVMnBq1ucu2Ar7BiUkBdXDMNpJ8B6Bgu1QZ9J+INAvsbr1WUXJSui
         YAx1m0Jo+EjOiBzWwhc/VsZlkNCmtlrAlj/d+1R+WI1LCaJn2RdfecinvuLqHQmVMd6c
         WaHwJVD/ikLvyxgvbX0VzUzsbzHcslu1GDlv33hik7jGKtRvw+RgCc+a2P2kP7iSeyEw
         ZDv4UzapUDJ8fO12MFGz14wSEYmntY+BRvsXnd5rRXDXA0Sv4MJT5i5vheoGzTBQ3z8M
         HtZHXr/8FiW4IfiVnxNRbtUWqU/KBkbrC2CHfVHgCEen1loKXuMjeOpXE6gHNRIurP61
         awLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708400398; x=1709005198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=61gdFIOyAEtp7pfCHFQh+Fc/gqgVzNiO4CpvePAyVXw=;
        b=BkB5ZvYBYEVy4VwWcW8hkJrIp9LQAkAgpkirki5Kk071CjtwMoZT8rPCK9eoKDWibX
         zQ3jY++PS+geCgFGAr2qyuD/DYU3B6Ibb3Q8Ni9nCFmVsSbeZEpRcXHo6eNLqbEennL1
         /jQzbrNMciE5EgkN4y/2OltPSQfApekZTn9vobJpsInGZnEmzACLV1kXXelmqnU2Neao
         uf+Ka+nKFCCvRI8emlkx896ZsyShWmTB5NmZLTX8jU9cQyGpE1K3EAfqMLbgoWrHsiQ8
         jZg2wkD2LCMrpSI1jQD2KUb2hRJklHz96fmpHI/BKbDEvmkh/Vemf7b8MuxmwyYOBWgG
         CFqA==
X-Forwarded-Encrypted: i=1; AJvYcCV7AnXL2qTcXlddjUI3/cHCsQDZnLMkzkvNqXBLC19vGRAMbriX/kts9GWY+4HA9tSqmL4phWPRQX/ZhJl6o8XctBOFZTOE
X-Gm-Message-State: AOJu0Ywg8auAR1dxInxjE0YkeSPIJuH1yoy9ra1/H5Ko3LiUKUgFbCvc
	ctjsXYp0hhIkGv79scXo3MMv0blgl2bWjEfdR/JN+1a5LSBkfrGk8JkYKzaA3Gw=
X-Google-Smtp-Source: AGHT+IE2sqpkSGfsSyNt6OWk0KJ2ruc4yfEQBvhsEdatEOo2TxXHxnvqxWaQkQEoRQvOPY4CQbPr4A==
X-Received: by 2002:a17:903:24f:b0:1d9:4106:b8b5 with SMTP id j15-20020a170903024f00b001d94106b8b5mr17488773plh.11.1708400398198;
        Mon, 19 Feb 2024 19:39:58 -0800 (PST)
Received: from [10.254.101.216] ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170903138300b001d752c4f36asm5153333plb.78.2024.02.19.19.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 19:39:57 -0800 (PST)
Message-ID: <d99989d0-e2d6-490a-8f60-c08b98b12896@bytedance.com>
Date: Tue, 20 Feb 2024 11:39:39 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: Re: [linus:master] [sched/eevdf] 2227a957e1:
 BUG:kernel_NULL_pointer_dereference,address
Content-Language: en-US
To: Chen Yu <yu.c.chen@intel.com>
Cc: Tiwei Bie <tiwei.btw@antgroup.com>,
 kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, aubrey.li@linux.intel.com,
 Honglei Wang <wanghonglei@didichuxing.com>, Aaron Lu <aaron.lu@intel.com>
References: <202401301012.2ed95df0-oliver.sang@intel.com>
 <23cbb613-c8a2-4f07-b83b-fa3104bef642@bytedance.com>
 <8b21e697-c9b9-49aa-a7ad-e88a5d7f9c92@antgroup.com>
 <5f8f4222-a706-45b1-8eb2-fd4553cc57d8@bytedance.com>
 <ZdNLCYnJzPM2Ih2j@chenyu5-mobl2>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <ZdNLCYnJzPM2Ih2j@chenyu5-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chen,

On 2/19/24 8:35 PM, Chen Yu Wrote:
> On 2024-01-31 at 20:28:19 +0800, Abel Wu wrote:
>> On 1/31/24 8:10 PM, Tiwei Bie Wrote:
>>> On 1/30/24 6:13 PM, Abel Wu wrote:
>>>> On 1/30/24 3:24 PM, kernel test robot Wrote:
>>>>>
>>>>> [  512.079810][ T8305] BUG: kernel NULL pointer dereference, address: 0000002c
>>>>> [  512.080897][ T8305] #PF: supervisor read access in kernel mode
>>>>> [  512.081636][ T8305] #PF: error_code(0x0000) - not-present page
>>>>> [  512.082337][ T8305] *pde = 00000000
>>>>> [  512.082829][ T8305] Oops: 0000 [#1] PREEMPT SMP
>>>>> [  512.083407][ T8305] CPU: 1 PID: 8305 Comm: watchdog Tainted: G        W        N 6.7.0-rc1-00006-g2227a957e1d5 #1 819e6d1a8b887f5f97adb4aed77d98b15504c836
>>>>> [  512.084986][ T8305] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
>>>>> [ 512.086203][ T8305] EIP: set_next_entity (fair.c:?)
>>>>
>>>> There was actually a NULL-test in pick_eevdf() before this commit,
>>>> but I removed it by intent as I found it impossible to be NULL after
>>>> examining 'all' the cases.
>>>>
>>>> Also cc Tiwei who once proposed to add this check back.
>>>> https://lore.kernel.org/all/20231208112100.18141-1-tiwei.btw@antgroup.com/
>>>
>>> Thanks for cc'ing me. That's the case I worried about and why I thought
>>> it might be worthwhile to add the sanity check back. I just sent out a
>>> new version of the above patch with updated commit log and error message.
>>
>> I assuming the real problem is why it *can* be NULL at first place.
>> IMHO the NULL check with a fallback selection doesn't solve this, but
>> it indeed avoids kernel panic which is absolutely important.
> 
> I tried to reproduce this issue locally but with no luck. It might

Me either, with a x86 machine. Staring at the dmesg provided by Oliver,
I guess the bug is arch-specific.

> be related to lkp's environment so I'm thinking of adding the following
> change into lkp's test repo to help narrow down: when the pick_eevdf() finds
> an NULL candidate, print the whole rb-tree, including each entity's vruntime,
> min_vruntime, deadline, etc. So we can figure out why we failed to find a proper
> entity, thoughts?

It helps, but not in all ways IMHO. There might be someone else manipulating
the rbtree under improper locking, and if it is the case, the time of debug
could be late.

