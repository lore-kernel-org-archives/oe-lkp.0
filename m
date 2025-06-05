Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EEC274FF0
	for <oe-lkp@lists.linux.dev>; Thu,  5 Jun 2025 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749142233; cv=none; b=WzUQkw4nQ9rLIixc+xaOil70ZKslVC76nS1+5ANDLJ00YwLd8tcr3a3nkKEumUerw33Qy/LWpdg5IXqvLN6Iu5fzVCBDxqfk5FtHmx9nqrndFAjO+0TIu8RUEb6EuYFxZ4jEy5oTvVguzBPi23sWaKWyTIIooLyFFDXYl7PwcNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749142233; c=relaxed/simple;
	bh=ZHCAmfHlX4KQFHaG55ogITAmWjpCAZ9v2RgfvCQDhOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lul4F8s3sWI/x0GkQheF08oQP+cFg79LaV7oqv49Eche/H38QTUJsr1U3BMQUyHJ5O86O43ZJgZriEkHiOwWxdAZ1EOiB/b83HlqeUOjn+7OYmOvt7raxexC1HwMYLhOBn62PEoXMVaMxbwP1ZiKgCFDOIhsIb1dSkgvosTL1/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cd89a4N6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cd89a4N6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a0ac853894so1135172f8f.3
        for <oe-lkp@lists.linux.dev>; Thu, 05 Jun 2025 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749142229; x=1749747029; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jz9xUyA/EiH5AU4vuSWkBdaNT/IXuogFlw5tRX78z5A=;
        b=cd89a4N6XXFWd2aJxvARr5mG+QorlFB+niLl2rBLRcinVbhi586ckffTMWCeTnYgN6
         4lo9YBObkE4kpNNJszairChCLnBZDU99wmSe2jsc7PVrMNBqsSjC9D5g513pBYrkG5kg
         s89/blz/u0dFdGyf7vpJuySGQO7u2C6ATO8HVazhnfUv4QfB5nWYxKzJXVkxjVHGSEGf
         2cyWWVmMQt50kRavyY6o7mAOnRTfIl3ublEocAOzcB5I4TOJG4x+6eE5SQo5qwNzDf+A
         YEcEU7oZa++Ao0ZT9kXfY/Hw9gv3cI8WlTfHB5FVVJ4uqjcSjYpOZxNgDJBgc7zd+I+K
         6gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749142229; x=1749747029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz9xUyA/EiH5AU4vuSWkBdaNT/IXuogFlw5tRX78z5A=;
        b=Njp3OPmLF6/ZHM0CHEp1HRCQ2P/Kyw8ZYvPsmQyCp91kfEhCC8ilI3p+eQri1nTfDf
         yxKKGQDZbvL3RdOC4gosH+7N91i8HV8d9Ii/t4Mz4HFirZmNXjyTJ6S6GRydUUC5q8lR
         raAkypWGFkB4zk5SUJq8+HVV6S+swIQ66idmAJc0VgPGODLUgd6c8dMh1GnPUuRCeZQF
         PqrNfWqpViUvWz8XOSWM8aCd7riSAvJjcLsdSslEej8lkkyttJ+XxCN/BUCEantqyjvE
         MwboUoY1f5TOqAOvcv1Qcpd376eki2k22JX7UEeMRTlH33R+pcUXm9813W+QUum9QdFk
         Zb1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxD4RAhPbaTCiJC+cPQDuVivfe9heKvzpwiBU5XvqrKQknKEuvrWVSd82WInGlWk/yDpa+gTA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHLYste7cs/nYhH4JxyDoQhrcid9cHUE90vH+orKloP8Fwg+Ty
	2o/bW+7Px8qafOA5/XTeB/FDR2WpIWavVHCI51Qmsm14f3otrPseDu2+CxxhHSd8zmY=
X-Gm-Gg: ASbGncuACouES/ARj7khxrXXlnbTjzxS2LLLwtJJgyjCBimQaFf8kfXKMOIZCO5aWji
	vz8g44uV6r1sW8+QGwXuYkwskQ6mBSrw97qK05POEzRDXA3KeZVV0FCdZOfPcThrf+N/NBiIoB/
	0YD8DWFPLG9BedRfHBoYBzSDqF1D2gjw+yEMNC/Dm+r4rPtWv+COcBGGDDjyJEmB4uKMe6mwOvK
	bieaYrXZJash/V/B9BQyE0P4ng8wSnVgxH8b2ylbgadDkhMEiv05fcx2BamSzvvKYv1i7TVLuUx
	zGgtQzTrSYiZP/AQlUDkcMw5uRXibgpOafdKWztBGSQZj+tqH8tpIrq6SOtE1LhDbXrGDg==
X-Google-Smtp-Source: AGHT+IGRSHzXfap9n0kjJuSMfLR19jyrXtVbAavtSq9J0Rzklw4pAacRpF/BuRTIrpXiqvpyofge9w==
X-Received: by 2002:a05:6000:2283:b0:3a4:fa6a:9174 with SMTP id ffacd0b85a97d-3a51d9708d4mr7314965f8f.33.1749142229184;
        Thu, 05 Jun 2025 09:50:29 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-248.rct.o2.cz. [109.81.1.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a0a96sm25345955f8f.96.2025.06.05.09.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:50:28 -0700 (PDT)
Message-ID: <6a770057-2076-4523-9c98-5ff10ac3562f@suse.com>
Date: Thu, 5 Jun 2025 18:50:27 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] module: Make sure relocations are applied to the
 per-CPU section
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-modules@vger.kernel.org, oe-lkp@lists.linux.dev, lkp@intel.com,
 linux-kernel@vger.kernel.org, kernel test robot <oliver.sang@intel.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Allison Henderson <allison.henderson@oracle.com>, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
References: <202506041623.e45e4f7d-lkp@intel.com>
 <20250604152707.CieD9tN0@linutronix.de>
 <20250605060738.SzA3UESe@linutronix.de>
 <beb343ec-6349-4f9c-9fea-588b04eb49ee@suse.com>
 <20250605155405.3BiTtQej@linutronix.de>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250605155405.3BiTtQej@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/5/25 5:54 PM, Sebastian Andrzej Siewior wrote:
> On 2025-06-05 15:44:23 [+0200], Petr Pavlu wrote:
>> Isn't this broken earlier by "Don't relocate non-allocated regions in modules."
>> (pre-Git, [1])?
> 
> Looking further back into the history, we have
> 	21af2f0289dea ("[PATCH] per-cpu support inside modules (minimal)")
> 
> which does
> 
> +       if (pcpuindex) {
> +               /* We have a special allocation for this section. */
> +               mod->percpu = percpu_modalloc(sechdrs[pcpuindex].sh_size,
> +                                             sechdrs[pcpuindex].sh_addralign);
> +               if (!mod->percpu) {
> +                       err = -ENOMEM;
> +                       goto free_mod;
> +               }
> +               sechdrs[pcpuindex].sh_flags &= ~(unsigned long)SHF_ALLOC;
> +       }
> 
> so this looks like the origin.

This patch added the initial per-cpu support for modules. The relocation
handling at that point appears correct to me. I think it's the mentioned patch
"Don't relocate non-allocated regions in modules" that broke it.

> 
> …
>>> --- a/kernel/module/main.c
>>> +++ b/kernel/module/main.c
>>> @@ -2816,6 +2816,10 @@ static struct module *layout_and_allocate(struct load_info *info, int flags)
>>>  	if (err)
>>>  		return ERR_PTR(err);
>>>  
>>> +	/* Add SHF_ALLOC back so that relocations are applied. */
>>> +	if (IS_ENABLED(CONFIG_SMP) && info->index.pcpu)
>>> +		info->sechdrs[info->index.pcpu].sh_flags |= SHF_ALLOC;
>>> +
>>>  	/* Module has been copied to its final place now: return it. */
>>>  	mod = (void *)info->sechdrs[info->index.mod].sh_addr;
>>>  	kmemleak_load_module(mod, info);
>>
>> This looks like a valid fix. The info->sechdrs[info->index.pcpu].sh_addr
>> is set by rewrite_section_headers() to point to the percpu data in the
>> userspace-passed ELF copy. The section has SHF_ALLOC reset, so it
>> doesn't move and the sh_addr isn't adjusted by move_module(). The
>> function apply_relocations() then applies the relocations in the initial
>> ELF copy. Finally, post_relocation() copies the relocated percpu data to
>> their final per-CPU destinations.
>>
>> However, I'm not sure if it is best to manipulate the SHF_ALLOC flag in
>> this way. It is ok to reset it once, but if we need to set it back again
>> then I would reconsider this.
> 
> I had the other way around but this flag is not considered anywhere
> else other than the functions called here. So I decided to add back what
> was taken once.
> 
>> An alternative approach could be to teach apply_relocations() that the
>> percpu section is special and should be relocated even though it doesn't
>> have SHF_ALLOC set. This would also allow adding a comment explaining
>> that we're relocating the data in the original ELF copy, which I find
>> useful to mention as it is different to other relocation processing.
> 
> Not sure if this makes it better. It looks like it continues a
> workaround…
> The only reason why it has been removed in the first place is to skip
> the copy process.

The SHF_ALLOC flag is also removed to prevent the section from being allocated
by layout_sections().

> We could also keep the flag and skip the section during the copy
> process based on its id. This was the original intention.
> 
>> For instance:
>>
>> 	/*
>> 	 * Don't bother with non-allocated sections.
>> 	 *
>> 	 * An exception is the percpu section, which has separate allocations
>> 	 * for individual CPUs. We relocate the percpu section in the initial
>> 	 * ELF template and subsequently copy it to the per-CPU destinations.
>> 	 */
>> 	if (!(info->sechdrs[infosec].sh_flags & SHF_ALLOC) &&
>> 	    infosec != info->index.pcpu)
>> 		continue;
>>
> 
> If you insist but…

It seems logical to me that the SHF_ALLOC flag is removed for the percpu section
since it isn't directly allocated by the regular process. This is consistent
with what the module loader does in other similar cases. I could also understand
keeping the flag and explicitly skipping the layout and allocate process for the
section. However, adjusting the flag back and forth to trigger the right code
paths in between seems fragile to me and harder to maintain if we need to
shuffle things around in the future.

-- 
Cheers,
Petr
