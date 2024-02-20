Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9D854BC4
	for <oe-lkp@lists.linux.dev>; Tue, 20 Feb 2024 04:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708401892; cv=none; b=mWN5A2sv8P/Jre7sLMFdFhEfOQXDjr4AilPzyiJBvky6jU05yAlRsBX7Sq3ftdihy6RgbPUwXHjnNQVOKRdd3nKEIXbdalfkzC74E3ilLOIHA+9EooxO32Q6XSl7CuTRo/Pii+k55o9rmXKL1M6GqKbudvBP4MULPNoFdNRB70w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708401892; c=relaxed/simple;
	bh=GH67LCty89vHUo8LQF2ouv/Za92p+R/LzvO9zerLKPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYjBFkhmW5Z0hvY2Gh23K5HSe+rEQcEjFhLbomTnzYL94a3mE2YmESEo2ig5dYVBa3On5i8nq0ARQJvmG3qHsmvmTJl3ds7Gu9atGcMWuoWW080py4Cg7TWntaUGOoEhccz+Gdw6b++WdZelGt45K7VzSCOZn/f/7plXQSABDsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dGBMtXiY; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dGBMtXiY"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-59ff33f1018so477592eaf.1
        for <oe-lkp@lists.linux.dev>; Mon, 19 Feb 2024 20:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1708401889; x=1709006689; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjNAXhtqcq0OJbE00M8kzJyMouse+2xlykONtccgn1M=;
        b=dGBMtXiYzN2GfqOkDN4wtkyQcnCLs5+whWeJeQGiXEYFByCYLB+pgiXzEZSNeD1VB0
         HIsh8LhDcPxOXxVVNvuevu7nxkq3S3gx4XOY0dzQF6SjvAHhc4J4xfS0caIJgg6PwyMZ
         hL3ixXHUh5TToyNGk+ZyrvCgycWxL8bhFlOM9A/YlUzvllajAWg+TT64GV57p8aYpUUt
         59zjikat2LTO4extMVcBN6v3M0e3Ym3U7ykIG2ZbfyEluv2gGQPNtIQCf9LvfPFD2Jtm
         a5ocFcs/kifQptWtQ37VDXPp7LelI62VbAkS5ancUKKPlQ7nf1T9V3blNwY5kCC0kIHT
         tNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708401889; x=1709006689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjNAXhtqcq0OJbE00M8kzJyMouse+2xlykONtccgn1M=;
        b=X030v6xvxFJUguX1MhjaCR+8umWGHakD6qxTuovxPXY3AR9Up5NR2lxz2NWAl8UveE
         3esRSi/T+zJnQCI9IrxH8RuPWgi/D4m0Ejq9dtLxC1ePyPPhWqvl8BS1oC6WnfqWIGrr
         mKPNV08uQDkD7dJmaNME3IlnUpH+YuHt+KpIbr6MzRmvOAn5ra8d6boudRNB/GouwY+j
         4QuKSIoQqM86GDC0f+BeRRgAc6DaRhc0TszZTolrxx0rW/jI31iy2ObRSZwuW4r2RWTs
         zQLj0rXQFqpDmO9HRl6DDL/QvumxNHG6ytDqfgwvZE4seSZSTe8S+jvw4vInKjYP7kAa
         wsCw==
X-Forwarded-Encrypted: i=1; AJvYcCUx1TZXSJ/Q2FOlBeU0103g+pkmJbZ1YkrPslDxPHLx4G3ew7wljwUjdv8I3AJCxjpVWQhVtUenX7e/m/D06kIdnfIgxeof
X-Gm-Message-State: AOJu0Ywn+sqDUAlABMaszGTj67tNr1Ppjq52ZjOz7ihmG7C64AmbXP65
	iJ7x21Fmzodcg092O5aqfdT4P/klyjYs2gBjnOEFAr6jeeC2IujN2LuYA3tp8DA=
X-Google-Smtp-Source: AGHT+IGqbIi3dcKVEvmS79jnBDZhkymxCYUewjSajJgJfGj/gxvlqCjJlNdTmxFPxJrM8w9NtR3ytw==
X-Received: by 2002:a05:6358:8187:b0:17a:fa59:bb87 with SMTP id r7-20020a056358818700b0017afa59bb87mr14885552rwk.16.1708401888822;
        Mon, 19 Feb 2024 20:04:48 -0800 (PST)
Received: from [10.254.101.216] ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id o9-20020a62f909000000b006e0814dbb3bsm5756211pfh.96.2024.02.19.20.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 20:04:48 -0800 (PST)
Message-ID: <9d8cf754-86ad-491f-9c3b-cca9efb2f5b2@bytedance.com>
Date: Tue, 20 Feb 2024 12:04:33 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [linus:master] [sched/eevdf] 2227a957e1:
 BUG:kernel_NULL_pointer_dereference,address
To: Chen Yu <yu.c.chen@intel.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, aubrey.li@linux.intel.com,
 Tiwei Bie <tiwei.btw@antgroup.com>,
 Honglei Wang <wanghonglei@didichuxing.com>, Aaron Lu <aaron.lu@intel.com>
References: <202401301012.2ed95df0-oliver.sang@intel.com>
 <23cbb613-c8a2-4f07-b83b-fa3104bef642@bytedance.com>
 <ZdNOb7fOLIoY5sgW@chenyu5-mobl2>
Content-Language: en-US
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <ZdNOb7fOLIoY5sgW@chenyu5-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/19/24 8:49 PM, Chen Yu Wrote:
> 
> While looking at pick_eevdf(), I have a thought.
> Currently the sched entity is sorted by their deadline. During task
> pickup, the pick_eevdf() scans for an candidate sched entity with the
> smallest deadline. Meanwhile this candidate sched entity must also be
> eligible.
> 
> The scan is O(lgn) on average, and O(1) at best case. How about making the
> average scan even faster by sorting the sched entity not only by deadline,
> but also the eligibility? The idea is that, the eligible sched entity with
> smaller deadline is sorted at the front the tree. Otherwise, if the entity
> is not eligible, even if it has a smaller deadline, it should be sorted
> at the end of the tree.

Eligibility is dynamic due to the nature of weighted average vruntime.
IIUC if doing so like above, update_curr() should take the responsibility
to re-sort the tree which seems to be O(logN).

> 
> After the change, pick_eevdf() get the leftmost sched entity at O(1) on
> average. Besides, it is guaranteed to return non-NULL sched entity in
> pick_eevdf(), which prevents suspicious NULL pointer exception in pick_eevdf().

It is guaranteed when doing pick that the rbtree is non-NULL, and given
that rq lock is held, I don't think the bug is inside pick_eevdf().

> 
> For example, suppose there are two sched entities to be queued, se_a and se_b.
> Consider their eligibility and deadline, there are 6 combination:
> 
> 1. se_a is eligible, se_b is eligible, se_a.deadline < se_b.deadline
> 2. se_a is eligible, se_b is eligible, se_a.deadline >= se_b.deadline
> 3. se_a is eligible, se_b is not eligible
> 4. se_a is not eligible, se_b is eligible
> 5. se_a is not eligible, se_b is not eligible, se_a.deadline < se_b.deadline
> 6. se_a is not eligible, se_b is not eligible, se_a.deadline >= se_b.deadline
> 
> In scenario 1, 3, 5, sched_entity se_a should be sorted before se_b,
> so pick_eevdf() would pick se_a first.
> 
> When enqueuing a new sched entity, it is regarded as eligible if its
> vlag is positive. In theory later in pick_eevdf(), the eligibility
> of this sched entity should be re-checked via entity_eligible(). But
> consider if the sched entity is eliglble when enqueued, it is very
> likely the same sched entity remains eligible when pick_eevdf(), because
> the V keeps moving forward but the vruntime of this sched entity remain
> unchanged - the vlag could get larger.
> 
> Something like this untested:
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 533547e3c90a..831043cc1432 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -551,11 +551,19 @@ static inline u64 min_vruntime(u64 min_vruntime, u64 vruntime)
>   static inline bool entity_before(const struct sched_entity *a,
>   				 const struct sched_entity *b)
>   {
> -	/*
> -	 * Tiebreak on vruntime seems unnecessary since it can
> -	 * hardly happen.
> -	 */
> -	return (s64)(a->deadline - b->deadline) < 0;
> +	bool eli_a, eli_b;
> +
> +	eli_a = (a->vlag >= 0) ? true : false;
> +	eli_b = (b->vlag >= 0) ? true : false;
> +
> +	if ((eli_a && eli_b) || (!eli_a && !eli_b))
> +		/*
> +		 * Tiebreak on vruntime seems unnecessary since it can
> +		 * hardly happen.
> +		 */
> +		return (s64)(a->deadline - b->deadline) < 0;
> +
> +	return eli_a ? 1 : 0;
>   }
>   
>   static inline s64 entity_key(struct cfs_rq *cfs_rq, struct sched_entity *se)
> @@ -877,10 +885,8 @@ struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
>    */
>   static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
>   {
> -	struct rb_node *node = cfs_rq->tasks_timeline.rb_root.rb_node;
>   	struct sched_entity *se = __pick_first_entity(cfs_rq);
>   	struct sched_entity *curr = cfs_rq->curr;
> -	struct sched_entity *best = NULL;
>   
>   	/*
>   	 * We can safely skip eligibility check if there is only one entity
> @@ -899,45 +905,8 @@ static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
>   	if (sched_feat(RUN_TO_PARITY) && curr && curr->vlag == curr->deadline)
>   		return curr;
>   
> -	/* Pick the leftmost entity if it's eligible */
> -	if (se && entity_eligible(cfs_rq, se)) {
> -		best = se;
> -		goto found;
> -	}
> -
> -	/* Heap search for the EEVD entity */
> -	while (node) {
> -		struct rb_node *left = node->rb_left;
> -
> -		/*
> -		 * Eligible entities in left subtree are always better
> -		 * choices, since they have earlier deadlines.
> -		 */
> -		if (left && vruntime_eligible(cfs_rq,
> -					__node_2_se(left)->min_vruntime)) {
> -			node = left;
> -			continue;
> -		}
> -
> -		se = __node_2_se(node);
> -
> -		/*
> -		 * The left subtree either is empty or has no eligible
> -		 * entity, so check the current node since it is the one
> -		 * with earliest deadline that might be eligible.
> -		 */
> -		if (entity_eligible(cfs_rq, se)) {
> -			best = se;
> -			break;
> -		}
> -
> -		node = node->rb_right;
> -	}
> -found:
> -	if (!best || (curr && entity_before(curr, best)))
> -		best = curr;
> -
> -	return best;
> +	/* Pick the leftmost entity */
> +	return se;
>   }
>   
>   #ifdef CONFIG_SCHED_DEBUG
