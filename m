Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA8627EC89
	for <oe-lkp@lists.linux.dev>; Tue, 15 Apr 2025 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708451; cv=none; b=OoRrwa7fDBP42OCtLTgSho1SD2iFPAJdgdADOGdSgHCb4GggCNWSFFmXuZOrl3NkMfmo7nflBnp0MIQFqke0LAtofBEYStvdBcBx7t0UEhaGFpzUVHwNaWhENMXNrv75aGEcz8W4vYZeBFcqXILdiYD3MLelSpswkb3/s3rt6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708451; c=relaxed/simple;
	bh=xJd/4b5bhY+n+QZLhZcR9CAG7yTmRPKvPTAhgwEa3PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0CFLjMfF99Acry9H8NtDZSr+H0nbvY20jIV2sArtiY+0j6k9AIQ8EGy+QnZEl3M39tGF2qAIdEK6O1YP2mxzyjtmnlrB+5J8Gomrfio9YZVeRTr5/ziSZcbYQklQCAmRqnkqZBgQ+7iLZYseS2PEudtrhBMeXGFDLJjYdRKsLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nkgHig9g; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkgHig9g"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c2688619bso3427433f8f.1
        for <oe-lkp@lists.linux.dev>; Tue, 15 Apr 2025 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744708446; x=1745313246; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7sZcT0Yr0/41RO7Ihzkb4EBq+VMI1W841HKAaxgJwa8=;
        b=nkgHig9gJ0U8E8sB4QEx7qF7pyRWaWyo0hQYjXDGiV6ho8eC6UfxILKB7O02sNgzLp
         zzPSUJHI5xgZYD1yOO2iKkqbBgGsAfozJrk1YeYdVE9azbcZWY2QIkVPWNx2eb0EdwJj
         hsau6Y0FfFpGTd/m08w7ukdQkwOt3I5xJt7+wLWLx6Q7yU0W3gl2OjBe28M1bbpS2xcz
         f5zI/3u7qALlXOVac6gmssrGP3Z3dnufqgRFBuvxgWS1oUTHDLTc40DhJ++ILFEpveb2
         htYpODGOBPJCeaPNk+BYM5NoseROOhZvZqdWz3B8DbGUGTHsfvuQek0AGJwiic6H0NtT
         9Wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708446; x=1745313246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7sZcT0Yr0/41RO7Ihzkb4EBq+VMI1W841HKAaxgJwa8=;
        b=MzharVu4xxa1LJicoQZgx2TP5QXRd6S7H6uuXpZU8KqU7gEWgkI/5/jActVOm2l432
         1v0/qdRjJFo/pvdIpkqSIojGb71ApIJbTZ+rYuSGIGJuKZSMx1xmGW+rXpwrkEKpDQwm
         M6IYGdoALhv8Q1jl7adlcmkPWxDfbUJqhHLeqzxcL8N8c3h+e4lrzzPLQLqomLOZs5v4
         66SpwbnEbVkkX6eyTHl/69XqmFM3smarIQKo/jg5Oz4outv+n+01lTjaEYDZVfjcCgFs
         H8h011cu69DizR5uwU2a9du3Y4MlS0q4AE0NK/UQqBoWc7+wEFKcM2MQwWnmDo+9KZIa
         tehw==
X-Gm-Message-State: AOJu0YxbWxTvDVTsk6v4NqUY57bhZ+0KcSXVUBvEf9PqfV5zXai71XHZ
	KmDhfbdSQtvANqFXwLA4LfOiBlA3Crpa71idUINvZHBFHxY6UolFK40OIhnd4Bujo2ZF9OtWAtZ
	RU6M=
X-Gm-Gg: ASbGncvW0QBGRHwc4ifgtqLNY0x8XnxC3tymFYNafXcguMvUenz5wzSmf0e5UzXbEqd
	jR0fesnw8uwGYMOA9fvmk/ibDIvKmwlC8fX8LsxIJc1qtw8NStt87hCboAq8yOY+K6SMGB+DvsA
	tNQ0p4rJXeoQhni+U1jqeykgbGE6kAHxvnBMnB4iSeRIraV6Np3SyD7P4MvQ5RUfMUBIKNatCaI
	QrGKGG0r+epNJJHXHfMeKogJs0vSaWiKJEXKp+z4qdtAA4C/hF6z+2JS1xGOr+Oa4HA2FcZi1zB
	o+HuHDTJnrJAesTUvz/F3NRu9fDl6fGUrbWiLm2YhH0=
X-Google-Smtp-Source: AGHT+IFIPck0/EXs55Sp/jmilaWHfYYKBCqyBfvSyEux/z5dVtEkS0FpAt5aWShFY0ittLuuU/tdIw==
X-Received: by 2002:a05:6000:220f:b0:391:3157:7717 with SMTP id ffacd0b85a97d-39eaaeaa3d5mr13405746f8f.34.1744708446594;
        Tue, 15 Apr 2025 02:14:06 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c614sm13775004f8f.27.2025.04.15.02.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:14:06 -0700 (PDT)
Message-ID: <5bc5f54b-ce6a-4834-86d4-5014d44c7217@linaro.org>
Date: Tue, 15 Apr 2025 10:14:05 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:perf/core] [perf] da916e96e2:
 BUG:KASAN:null-ptr-deref_in_put_event
To: Oliver Sang <oliver.sang@intel.com>, Peter Zijlstra <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 x86@kernel.org, Ravi Bangoria <ravi.bangoria@amd.com>,
 linux-perf-users@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
References: <202504131701.941039cd-lkp@intel.com>
 <20250414190138.GB13096@noisy.programming.kicks-ass.net>
 <Z/3krxHJLaWJTj4R@xsang-OptiPlex-9020>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <Z/3krxHJLaWJTj4R@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/04/2025 5:46 am, Oliver Sang wrote:
> hi, Peter Zijlstra,
> 
> On Mon, Apr 14, 2025 at 09:01:38PM +0200, Peter Zijlstra wrote:
>> On Mon, Apr 14, 2025 at 09:59:25AM +0800, kernel test robot wrote:
>>>
>>>
>>> Hello,
>>>
>>> kernel test robot noticed "BUG:KASAN:null-ptr-deref_in_put_event" on:
>>>
>>> commit: da916e96e2dedcb2d40de77a7def833d315b81a6 ("perf: Make perf_pmu_unregister() useable")
>>> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git perf/core
>>>
>>> [test failed on linux-next/master 29e7bf01ed8033c9a14ed0dc990dfe2736dbcd18]
>>>
>>> in testcase: trinity
>>> version: trinity-x86_64-ba2360ed-1_20241228
>>> with following parameters:
>>>
>>> 	runtime: 300s
>>> 	group: group-02
>>> 	nr_groups: 5
>>>
>>>
>>>
>>> config: x86_64-randconfig-078-20250407
>>> compiler: clang-20
>>> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>>>
>>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>>
>>>
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>>> | Closes: https://lore.kernel.org/oe-lkp/202504131701.941039cd-lkp@intel.com
>>>
>>
>> Does this help?
> 
> yes, below patch fixes the issues we observed for da916e96e2. thanks
> 
> Tested-by: kernel test robot <oliver.sang@intel.com>
> 

Also fixes the same issues we were seeing:

Tested-by: James Clark <james.clark@linaro.org>

>>
>> ---
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index 2eb9cd5d86a1..528b679aaf7e 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -5687,7 +5687,7 @@ static void put_event(struct perf_event *event)
>>   	_free_event(event);
>>   
>>   	/* Matches the refcount bump in inherit_event() */
>> -	if (parent)
>> +	if (parent && parent != EVENT_TOMBSTONE)
>>   		put_event(parent);
>>   }
>>   
> 

