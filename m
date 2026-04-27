Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990882F1FFC
	for <oe-lkp@lists.linux.dev>; Mon, 27 Apr 2026 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300636; cv=none; b=eaQ0XFbDvzywbVT9bRQ6K80Sx7p0C4J96B41lmW9hUDCKvKNEf/6o8k1DcdhujpXKyfDPlhldsoHMay3QEcwF/KwcTYA1U++FUECFgurtpYFsAylVLttGHtSk9EYAWSsffHP7YUxlKxO5s9SqCpwX3ynSZ51397zC8x2NqTsiqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300636; c=relaxed/simple;
	bh=l2+MP8ZK8T1levLBHf2vptoDeEIWYSaO6URPdmaNgKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y06gXdP3IrfN54di355EP0G/6qzRkeADxDptmFTyJ2dAlG9eT8sEfeER/RXqyMlYbs8aslczvGvQd6zXSZuCDRAKpQqbfgN6I+HQiVXZiSYaVhLlkWYZku3XXGbVIqQ7UoOkJQawSEjGqsmnKZdyt+G7SV4qWzMmU4z6a5fY6zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MyA4oRVw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MyA4oRVw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cf7190580so751934f8f.0
        for <oe-lkp@lists.linux.dev>; Mon, 27 Apr 2026 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777300633; x=1777905433; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8VFYyvlKojOOO2+l6jJaxHSJX5GHJpaq7eGFfHuQ08c=;
        b=MyA4oRVwO80e9c19OOTDcFntErghF01yBFP/bVYJYEQY65wkc9Iva9kkSXLG5aJ8oX
         p5IcW6OerOo3qUbHCjzwJG8/TjnNiwn29QNbZUcLz6x+Ea86i3bFHwkfINOM9eYv4xF7
         X+HsemJJpJn5EaZAW1m2DRVUUIJ/+yO+Si4SN3cA49u50TSVtvpUfcgqn8bQAePTxAc5
         B04nuJuc3iide8IvvrUN22CQGeysbq+sMFTf/0+01rBV36m86xlFaUlvTyg2XZbh6X7x
         KuDLmaOuM2t9zpQ/vCQhTfPVrUkuBOXYd7WtO62/30pUwvuIu3/RZEPx8qPMkn+eOAh/
         qBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777300633; x=1777905433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VFYyvlKojOOO2+l6jJaxHSJX5GHJpaq7eGFfHuQ08c=;
        b=hLKcUh0kCSpKWdWd3OTqK4ceimVnBOh8weKZ+8gkGPcUpk5HNLiEaEFNa5ICb/tmxd
         xLI2mK59M50i1dI+b5CQdMe0gwn/969zC+GLkYlYAu/lqFk4CAxc2jt7nLxzEJFfsvEK
         hjIJlzf2QZgKcJBljX1QocRtp/EkKSzX7LmyhXxCmaQKShuPmSa2+q1lAGFtpqX3+mgJ
         9ebhMPDYMxSTcnUFfSCJchIiChi+q/Tejq3GoPKollel4+2QtRwDCl9BZz0P4qFkE3rE
         LCt1MIxJgu6YkZ1m9ZMfltLuvM4XVJlM8fN6rCfM5pKRFn3x8C9Mb404P64X0sZ6OKb5
         EEAw==
X-Forwarded-Encrypted: i=1; AFNElJ/CzeShtO+wY+pHJ/NdtJLXklQgdnckfoEodLmIML1D8O8OrEsiY51UcZt13/SgfHLxSMdyL6A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg2ghjtwSY3ISArbQQVigqBmzFX7us7QHNY7m0c2dl670bTSHS
	tNRS/3hA9U0ROiOZUYJmEzfdxdhk60O71mRpRMkP89YMBqjAbpRnH1Jhbwu/fFTxFJc=
X-Gm-Gg: AeBDietYCO0cdeUDm+V6Y4VF3pwqN1sYPno41N/x5li3tZOhtoQFWfRU/0vhCHhbgaf
	y19kGSFriDgjBEmkt7fGRbu2kSNo1UnwbNc2vMjZ2woY9AWcn5B+UUGj67AkvEaWQkiEyjaCkNh
	GJzxuQ4ulZNNtJPi/Zi4Paj6JnpGJPVIPGCAAJh7RLYhbdTXpRCTVXsUOozobRdlcoSzK2UKpQ+
	sHug4t28hpMZTL7MV5KzsC5kDbTttzreFN9+93ii10yHsuZXSmmoPHp90uQJpgrSdyBkLAbXXkT
	mm2rQznx/oaGsfP3fyoTmeyVWOYeILlV3x5p4VH7bdVWxkxlhBCBknrjIjIZQ+B2Kah7SeW6A0c
	qkD5JwbdKg3o6BkPsnPD/gBF7MVOB70Kv/eXRNAjLd7kj1WhnNZ9dijcrInKbiSNCN6J4m59TQk
	vQT/qEDoIqCdYY0lOoIFa9nT78VQOavBwjfa8OU3er7x2XwF06Iznthg8/+de0kWUSle2W
X-Received: by 2002:a5d:4569:0:b0:446:9d8:bb6d with SMTP id ffacd0b85a97d-44609d8bc72mr52152f8f.2.1777300632863;
        Mon, 27 Apr 2026 07:37:12 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm86796551f8f.6.2026.04.27.07.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:37:12 -0700 (PDT)
Message-ID: <6cae0418-eabe-4864-b87f-b1f953de06b0@suse.com>
Date: Mon, 27 Apr 2026 16:37:11 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [mm] c6307674ed:
 BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
Content-Language: en-US
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Harry Yoo
 <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
 Thomas Graf <tgraf@suug.ch>, oe-lkp@lists.linux.dev, lkp@intel.com,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Marco Elver <elver@google.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org
References: <202604211323.fac1b29e-lkp@intel.com> <aedvSnhOGM_mauYP@milan>
 <aehdcxC14ycvY481@gondor.apana.org.au> <aeh2Ii9CxtgfsX_p@milan>
 <aeh_2WwIb8nAIcy2@gondor.apana.org.au> <aeiHkG7X_dieMdw5@milan>
 <aemTW8yiAe6y1tsQ@gondor.apana.org.au>
 <4e269fb1-cd6c-46ca-ac2a-168ce9fd06fe@suse.com> <ae9wFZp7dS8QF8br@milan>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <ae9wFZp7dS8QF8br@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/26 16:17, Uladzislau Rezki wrote:
> On Mon, Apr 27, 2026 at 10:53:52AM +0200, Vlastimil Babka wrote:
>> On 4/23/26 05:34, Herbert Xu wrote:
>> > On Wed, Apr 22, 2026 at 10:32:16AM +0200, Uladzislau Rezki wrote:
>> >>
>> >> We have added non-sleeping flags for vmalloc() to extend kvmalloc()
>> >> functionality as folk need those.
>> >>  
>> >> Another option, would be: always use vfree_atomic() from the kvfree()
>> >> path.
>> >>  
>> >> Any thoughts?
>> > 
>> > Perhaps add a kvfree_atomic that just calls vfree_atomic?
>> 
>> kvfree()'s comment says
>> 
>> " * Context: Either preemptible task context or not-NMI interrupt."
>> 
> I am not sure the description clearly reflects the intended usage.
> To me it sounds like all contexts but excluding NMI.

Agree it's not clear, my immediate reaction was the same and took me a bit
to understand.

> For example, calling this under spin_lock() will be invalid, as
> the vfree() path may invoke cond_resched().

Yeah, it's covered by the "preemptible" word, but not super clear.
IIUC it all boils down to this in vfree():


        if (unlikely(in_interrupt())) {
                vfree_atomic(addr);
                return;
        }

Which can do the right thing in an interrupt, but obviously cannot
automatically recognize the "under spin_lock()" situation.

So I don't think we can change it now with all the existing callers, but if
a better wording exists, we could make the comment more clear.

>> so this is neither. It might be ok then to create kvfree_atomic(). Always
>> using vfree_atomic() from kvfree() might be wasteful.
>> 
>> > For rhashtable it really makes no difference either way.  But it
>> > would eliminate the unsightly call to is_vmalloc_addr in rhashtable.
>> > 
> Seems atomic version makes sense here:
> 
> <snip>
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 15a60b501b95..2b5ab488e96b 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -1234,6 +1234,9 @@ void *kvrealloc_node_align_noprof(const void *p, size_t size, unsigned long alig
>  extern void kvfree(const void *addr);
>  DEFINE_FREE(kvfree, void *, if (!IS_ERR_OR_NULL(_T)) kvfree(_T))
>  
> +extern void kvfree_atomic(const void *addr);
> +DEFINE_FREE(kvfree_atomic, void *, if (!IS_ERR_OR_NULL(_T)) kvfree_atomic(_T))
> +
>  extern void kvfree_sensitive(const void *addr, size_t len);
>  
>  unsigned int kmem_cache_size(struct kmem_cache *s);
> diff --git a/mm/slub.c b/mm/slub.c
> index 2b2d33cc735c..e25a0eab6ff7 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -6802,6 +6802,22 @@ void kvfree(const void *addr)
>  }
>  EXPORT_SYMBOL(kvfree);
>  
> +/**
> + * kvfree_atomic() - Free memory.
> + * @addr: Pointer to allocated memory.
> + *
> + * Same as kvfree(), but safe to use in atomic contexts.
> + * Must not be called from NMI context.
> + */
> +void kvfree_atomic(const void *addr)
> +{
> +	if (is_vmalloc_addr(addr))
> +		vfree_atomic(addr);
> +	else
> +		kfree(addr);
> +}
> +EXPORT_SYMBOL(kvfree_atomic);
> +
>  /**
>   * kvfree_sensitive - Free a data object containing sensitive information.
>   * @addr: address of the data object to be freed.
> <snip>
> 
> I can post it if no objections.

LGTM but also should be now used in rhashtable_try_insert() I think?

> 
> --
> Uladzislau Rezki

