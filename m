Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9834F1F5434
	for <oe-lkp@lists.linux.dev>; Tue, 15 Apr 2025 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732381; cv=none; b=WT/Rjk33mRNUa1ut0loDIeX0uaiN+iDlUEgSQYpiF7Q1wklzPiYcIobjeREO2q+Xm7tSw/aQLh8gD29uMM2vDjm/cz7ZAiqtGHJaRA01m6qiMgjc5Mk+xZErO077+3uIvXG6zoC54VO3Eb2B28U12Tl0RWC0ORqo0+GPM1r2Hkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732381; c=relaxed/simple;
	bh=1s5VUpfsnLrgZQzcnItw9zwtWIcSEbXxWfNt96WJWRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGJf+klgrcCAX6qOPD3IUBxlGo6sCLye1C2hSLunZxD5nOHoWiG9DeVe4lPx+rQdKSpimNA8FEu5OEtg/csC2MLUfMVszUc3XZ/96ofMgbdzeFoALF+7MsudHRooUreYBsGp/ge29q1nvZ3zvLbynP1WuZa2cJvIeI4cNuciV0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GVkCxMTa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GVkCxMTa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so60459885e9.1
        for <oe-lkp@lists.linux.dev>; Tue, 15 Apr 2025 08:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744732378; x=1745337178; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JLTNvpaptplrjpn5KAL5k+FFz54c8FMnV1vnh7J1TI=;
        b=GVkCxMTaKPZ3I59fJmA0eHCHV1UiDD3j5ZFC7v5JzozCCo5c48rOONSO1im0JhYEeN
         d+laqUrpWTY27MnFDshgSBYJMrytUm8ZFTWRToxfGVL3WCEKZ3ieu4EBobooZdj4sWCe
         CfNexPAKChTc/e6ym98Sq9aArbCxmooKD00kEhDF+Ey/MffRLcI3Go+Blu5t+04nAXCe
         OlBbrWIiOSMZt0vTquj6Z1+3SWzV8E0oNYhhZeCXs+W9Eosav6b0k9vptZNJA0nigujJ
         6oXZOVut7o9eMHfdsnyGZ1QhdziF3rf/3rb/edapvjxZzibnn8X2iPy0+fi5S1IshlSY
         ci7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744732378; x=1745337178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JLTNvpaptplrjpn5KAL5k+FFz54c8FMnV1vnh7J1TI=;
        b=gqYYIobXnXf0qzmrflFE7i1fvIjLricuixV8AGoxP9KAHwtgPn7cSYxVrnIFCti0Vw
         VaoDpaI0MAseZGKwsT/GovGfMyXeS8FlDYLFtYtyzkomHeTXExE4rGzStec/nb7HKiF7
         +KD6ySHz4UvAbhfqx/g2v3m+UdaVY3KsVVaa7En7OdVNeUaggyYe9sJx30srGpsiPtL9
         74a7ZZJ6sDb3oTLPN16F2f6Pd8vL28CjPTuU+H905wEpPPAopc0ImATuO+JlVQjSbVb+
         rplECh+s1/mDcJzQYQgApIkw9Pas2BfnBkR7BW/Hfl4ngc44LE8HYVc9+Zj4s12bTChj
         pZ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWLLxG0gm2/DwIVHqbOSyPDcNzB2ghn+CXwPfw8ZujTMlnOnG8EYh+rKMqILfyOzUTOp6eV5k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMg+DeX1WfPN01FFIeKOrKNMa1nhrPhh5OQ27uoxa50c7I1gAD
	n5nr0CYKx1kxCySvRikfh2JAMuyUWsNEnt2pySYWaQRDclOsMnzvWk7xIKkFe2I=
X-Gm-Gg: ASbGnctfXb4dOZMYIyShU0di/aM13xBJCgWrB8pSz8x3v1DE6LbyJN7W7WlyL9XPPYN
	tJa/3zXq86JdPFXoRgS9pgMcOq6WO6wAj6BMRIFF8KNZflFF6FBvWmv4xN0ksiAY1dGeG5t+Xd0
	Z7QQU2GT3jvsN8Evmnl2GpWGUxiIk13cM5AYZcB6oeZnHPozPf94GlI90lf+yprMyhkRyWRVWJ5
	ZOZgXni9whARrmigSY5skM8qH5RUGnskWz3a6Lq/DjZ1pu7Vwu2TTUBM91atGo0D7d1qVrvmaTD
	n8njwRl5KB11Jw1L5mKPfEuPQe26E7Pvk3B/w/Rr4As=
X-Google-Smtp-Source: AGHT+IEW4aMzZl2rGLN44yAGHE5w9xSC1sSpotrF9GYoahU/09L/4ARMu3yhHo2dTSnx9WvVaGY6jw==
X-Received: by 2002:a05:600c:5107:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-43f3a93379dmr138039845e9.6.1744732377761;
        Tue, 15 Apr 2025 08:52:57 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f204c500bsm222451965e9.0.2025.04.15.08.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 08:52:57 -0700 (PDT)
Message-ID: <77036114-8723-4af9-a068-1d535f4e2e81@linaro.org>
Date: Tue, 15 Apr 2025 16:52:56 +0100
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250415131446.GN5600@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/04/2025 2:14 pm, Peter Zijlstra wrote:
> On Tue, Apr 15, 2025 at 12:08:40PM +0200, Peter Zijlstra wrote:
>> On Tue, Apr 15, 2025 at 10:14:05AM +0100, James Clark wrote:
>>> On 15/04/2025 5:46 am, Oliver Sang wrote:
>>
>>>> yes, below patch fixes the issues we observed for da916e96e2. thanks
>>>>
>>>> Tested-by: kernel test robot <oliver.sang@intel.com>
>>>>
>>>
>>> Also fixes the same issues we were seeing:
>>>
>>> Tested-by: James Clark <james.clark@linaro.org>
>>
>> Excellent, thank you both! Now I gotta go write me a Changelog :-)
> 
> Hmm, so while writing Changelog, I noticed something else was off. The
> case where event->parent was set to EVENT_TOMBSTONE now didn't have a
> put_event(parent) anymore. So that needs to be put back in as well.
> 
> Frederic, afaict this should still be okay, since if we're detached,
> then nothing will try and access event->parent in the free path.
> 
> Also, nothing in perf_pending_task() will try and access either
> event->parent or event->pmu.
> 
> ---
> Subject: perf: Fix event->parent life-time issue
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Tue Apr 15 12:12:52 CEST 2025
> 
> Due to an oversight in merging da916e96e2de ("perf: Make
> perf_pmu_unregister() useable") on top of 56799bc03565 ("perf: Fix
> hang while freeing sigtrap event"), it is now possible to hit
> put_event(EVENT_TOMBSTONE), which makes the computer sad.
> 
> This also means that for the event->parent == EVENT_TOMBSTONE, the
> put_event() matching inherit_event() has gone missing.
> 
> Previously this was done in perf_event_release_kernel() after calling
> perf_remove_from_context(), but with it delegated to put_event(), this
> case is now entirely missed, leading to leaks.
> 
> Fixes: da916e96e2de ("perf: Make perf_pmu_unregister() useable")
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>   kernel/events/core.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -2343,6 +2343,7 @@ static void perf_child_detach(struct per
>   	 * not being a child event. See for example unaccount_event().
>   	 */
>   	event->parent = EVENT_TOMBSTONE;
> +	put_event(parent_event);
>   }
>   
>   static bool is_orphaned_event(struct perf_event *event)
> @@ -5688,7 +5689,7 @@ static void put_event(struct perf_event
>   	_free_event(event);
>   
>   	/* Matches the refcount bump in inherit_event() */
> -	if (parent)
> +	if (parent && parent != EVENT_TOMBSTONE)
>   		put_event(parent);
>   }
>   

Hi Peter,

Unrelated to the pointer deref issue, I'm also seeing perf stat not 
working due to this commit. And that's both with and without this fixup:

  -> perf stat -- true

  Performance counter stats for 'true':

      <not counted> msec task-clock 

      <not counted>      context-switches 

      <not counted>      cpu-migrations 

      <not counted>      page-faults 

      <not counted>      armv8_cortex_a53/instructions/ 

      <not counted>      armv8_cortex_a57/instructions/ 

      <not counted>      armv8_cortex_a53/cycles/ 

      <not counted>      armv8_cortex_a57/cycles/ 

      <not counted>      armv8_cortex_a53/branches/ 

      <not counted>      armv8_cortex_a53/branch-misses/ 

      <not counted>      armv8_cortex_a57/branch-misses/ 


        0.074139992 seconds time elapsed

        0.000000000 seconds user
        0.054797000 seconds sys

Didn't look into it more other than bisecting it to this commit, but I 
can dig more unless the issue is obvious. This is on Arm big.LITTLE, 
although I didn't test it elsewhere so I'm not sure if that's relevant 
or not.

Thanks
James

