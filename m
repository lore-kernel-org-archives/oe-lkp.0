Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C95A225787
	for <oe-lkp@lists.linux.dev>; Thu, 17 Apr 2025 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880321; cv=none; b=GJZggTMR0Z78Lx6+Ez/Z0lXOz7R55yTuEwYtiKinFDLQ645eQ4xe2q1pektTdnfVn2/Afp6H6EN6baTrwlifhA2sbigFy+M/C9dRnk/xFg+QrV/UB05dPU4W8KZWlTBS+wtB5n/78wM+zeoBG0tCyyhT2Lv0PAH+H4OGWnasFRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880321; c=relaxed/simple;
	bh=r1FjPDPkdRR2v2mM9JWjJvN0mbwzm6QYZ2Q9DLtMY7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRbAKuCMpJ03J0SeMVlQkymxTscOVOBMjwt0ZeJXGxvV7+VdldiGmyTx2JQIAqOX7FUu+mqNjPnl1WsPPBJftDU5Nk9OtAEq3WRsxF6ZclpTT8PEBzpT3rsDY/AHlJIPIHo3Sj1pNgtGWHEFhtMVMsx3/pnw6laZMGGn1YU40lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n2zWada1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n2zWada1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a823036so4571955e9.0
        for <oe-lkp@lists.linux.dev>; Thu, 17 Apr 2025 01:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744880318; x=1745485118; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GP9CJN50tERxm6yE1CuNeHA83a3ivox+fButPu97ez4=;
        b=n2zWada1gWCHbyHlq7XWm2RSZawG7mNT98+HIyICcKOy6f/wFyrrrwB/4BqDygsFmY
         UWijTH1TYRE/x26huQGNvsiPKlE+49X9du6ruVRZ2S0AFoWX0Q3+pRwtmMQthI1kJQdG
         STFMU97bAY3sRY/mqLaY4xIxZPQHnkBlvUbHITgTxpEBhn7G/sdpKXJDecyE+qhGIm47
         IhfT1SLiJWmtLJZjzB/UVYw2pV2XHvruD3Gj3f2+S9aLmxdne2MPccRZPtMT2tMQ8Xb3
         IvGAI2P7xlenaMg0owWvvVivFnr+Gz7ZRxgXZkARlkoLtbl5gArm0YepxkzwNLPUJmGB
         Z7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880318; x=1745485118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GP9CJN50tERxm6yE1CuNeHA83a3ivox+fButPu97ez4=;
        b=s2qSemt/p+TF6qCeuaiRi2QTxcZj0P9U0JAScTvS4hXLBivHXmB+RiMKMoR8SFdoGP
         zyVanCcAs0Rm/rpHx1FCV95gL4rMy7fnRbLgl182kO+845hiXo3HiwlRJSexzAJTMiJ5
         Wjt/VITByvRSjlR6bPeIkJPMInb3qwgQWsslXXvlVG6iC5OnniCBS8LmX0kHdvTZXGIl
         kHrXpyeNld6s7Rgsa60oY1ciV/UHiMEG+3JO2HEvarIgxA4S0p9ejPjzSn6gd7Xc7qQ5
         CMyfGnd7Lcj7W7amQkkys0gdLgPoye6no8p/PDmW/6h/Tk4FpBR5JcU0bNRRtwepfTwO
         AulA==
X-Forwarded-Encrypted: i=1; AJvYcCWDwBFHzvJHi8JamtDBBULjb7J4oQ58Z+W56bpaMb2lcE3GOIfI13Y6aVvFPE2vJ77CYJox8og=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPwEVT80uKY7SXNq0C6OCjKEvd0ywt75vLVZ/7E0ZhSye8Ki7u
	iLQYInE61wiZSkzTDyJljCBjCCIGCIUOM2Cb/WdBagTL1CSBkc/rEWQasv5Gt1w=
X-Gm-Gg: ASbGnctbbRPPUtCe7HVi4v68ISsMAvi8hsCuR3WLj8kk9UxAOfTBFKMc27+1bCNKUiB
	SLaYFbsuMSGf03lC6TqTCLS9SeP4r+YvbrQjk+x118NMImtPvbO1zfwR8hQRkinp+c/j/CxEyaL
	PlVBgOIJ9DmeuKvBijYMuVXg/bu1nzq2eInXnTWhnUNwzL6HiSntvWdNoSl1iuef7lRBB989tGi
	XF824rUa8DoMDnxkiyL+zZxyHM4qnpy4rPePR0tU2F1tKrB6jKTbChFCh6Ij55DTK5U2e/lbTcU
	YhJShzWcDpCePn2GSvQTmGpH5hKaTwPSCA7Ck+akSsFYpAjY8VG/gA==
X-Google-Smtp-Source: AGHT+IH6CNSHBn38pTz3KSqiHQKjYubJUpsb2xFQLAfw5wd+m9vVmQ9WStqNZ9vJMOreqvzejAJH0w==
X-Received: by 2002:a05:600c:698e:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-4405d624e32mr53383385e9.12.1744880317933;
        Thu, 17 Apr 2025 01:58:37 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c0d9sm19859259f8f.32.2025.04.17.01.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 01:58:37 -0700 (PDT)
Message-ID: <72b016c4-3959-49d1-8964-0927eee101bf@linaro.org>
Date: Thu, 17 Apr 2025 09:58:36 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:perf/core] [perf] da916e96e2:
 BUG:KASAN:null-ptr-deref_in_put_event
To: Peter Zijlstra <peterz@infradead.org>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
 Ravi Bangoria <ravi.bangoria@amd.com>, linux-perf-users@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Frederic Weisbecker <fweisbec@gmail.com>
References: <202504131701.941039cd-lkp@intel.com>
 <20250414190138.GB13096@noisy.programming.kicks-ass.net>
 <Z/3krxHJLaWJTj4R@xsang-OptiPlex-9020>
 <5bc5f54b-ce6a-4834-86d4-5014d44c7217@linaro.org>
 <20250415100840.GM5600@noisy.programming.kicks-ass.net>
 <20250415131446.GN5600@noisy.programming.kicks-ass.net>
 <77036114-8723-4af9-a068-1d535f4e2e81@linaro.org>
 <20250416084610.GI4031@noisy.programming.kicks-ass.net>
 <20250416190817.GD6580@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250416190817.GD6580@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/04/2025 8:08 pm, Peter Zijlstra wrote:
> On Wed, Apr 16, 2025 at 10:46:10AM +0200, Peter Zijlstra wrote:
>> On Tue, Apr 15, 2025 at 04:52:56PM +0100, James Clark wrote:
>>> Unrelated to the pointer deref issue, I'm also seeing perf stat not working
>>> due to this commit. And that's both with and without this fixup:
>>>
>>>   -> perf stat -- true
>>>
>>>   Performance counter stats for 'true':
>>>
>>>       <not counted> msec task-clock
>>>
>>>       <not counted>      context-switches
>>>
>>>       <not counted>      cpu-migrations
>>>
>>>       <not counted>      page-faults
>>>
>>>       <not counted>      armv8_cortex_a53/instructions/
>>>
>>>       <not counted>      armv8_cortex_a57/instructions/
>>>
>>>       <not counted>      armv8_cortex_a53/cycles/
>>>
>>>       <not counted>      armv8_cortex_a57/cycles/
>>>
>>>       <not counted>      armv8_cortex_a53/branches/
>>>
>>>       <not counted>      armv8_cortex_a53/branch-misses/
>>>
>>>       <not counted>      armv8_cortex_a57/branch-misses/
>>>
>>>
>>>         0.074139992 seconds time elapsed
>>>
>>>         0.000000000 seconds user
>>>         0.054797000 seconds sys
>>>
>>> Didn't look into it more other than bisecting it to this commit, but I can
>>> dig more unless the issue is obvious. This is on Arm big.LITTLE, although I
>>> didn't test it elsewhere so I'm not sure if that's relevant or not.
>>
>> I can reproduce on x86 alderlake (first machine I tried), so let me go
>> have a quick poke.
> 
> Could you please try queue.git/perf/core ? I've fixed this and found
> another problem.
> 
> I'll post the patches tomorrow, after the robot has had a go.

Yep that's all working now, thanks.

