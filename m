Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546C43BF694
	for <oe-lkp@lists.linux.dev>; Wed, 22 Apr 2026 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846741; cv=none; b=hVkYEXNPe+h4yNUAFPmgO/MoXjInzKVUD5KY6uY3AYkn6O+xm3IhK8x69XPXj6+hq96aYMsubEHAQiLaDw8ReRlVUKFdaUD0n2AAb23WYusvqa+aIcecfVKvf+BjxPjVWFHpoH/7yE8oYvV+oqe3EBLGxxrNzb5FNklWlNlhRoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846741; c=relaxed/simple;
	bh=/Dql2vHXzlDirVhQ+AEJT4Od0o+aw8bnb3bi3hLke3Y=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpn6kmCGM0CsgYjW7ybciq0Ox4mH6gJ6TTbeOt6qMoZ2KkrRqByn2LLInYpzAK0qTq6s6BkXor6XEk6LWFZ/gtxhip8NGa0iNf2TJVuxARc+dTlBu5yTRR97LS6S3UpPZQkwzgUjMIGFQvrnNGUObaPo4BjQFlYo3xomeQ/k/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RACV6YXU; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RACV6YXU"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38dd575bca3so56336981fa.1
        for <oe-lkp@lists.linux.dev>; Wed, 22 Apr 2026 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776846738; x=1777451538; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NilMrlPz33EGYo1Xi2LZqhviU9wGvBx8IHXWSsnM/W4=;
        b=RACV6YXU7Z1vzvEiE5E14wC8XP8qFs+GvGD3f8K5IPb3fUmQkEe5+t7WIGoQgV4bHP
         MDv7dR3d07j7CRvybiAMWpWSv5OQn8qWlDrVXzo6M4FZfZ9/1VL8KVaCmDp0nMdLiPFI
         1mN2u5l98Zyh6Lh/HV4FdPcazBsKNHE+TZrX23nhci4zDdJA+UHDgYUDA06lrMUb7sqW
         J6CDvK4m2eL0i7a3HmhzE9Di/7pGwGHFVLYyac4GueeA29YwZYrPrS0HlurYqK9jUSjr
         JJ0k1K0lvwryIeXSi8JiYVFYzn+h3zr8zidXcK/67h5dOiyF7vWLk6D8siHmvyC6CXbs
         SiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846738; x=1777451538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NilMrlPz33EGYo1Xi2LZqhviU9wGvBx8IHXWSsnM/W4=;
        b=c041Oczvgbocl+KIYXVqIZJmVxe7E7+J1zIVO6uP85uwKvmPKd/9ZLOhiql43KPPlu
         TRN0T1AeNZAxfZGXWxQE2LDvDyY4cziJOp0YOiKLhyjgsDWVy+CjrfmPVLV9M3AOffhV
         vL7hrgmAV2K4atLkseeJLe00Et+qFB/MEEZwLD5PnApcctEybyE85M39Vxzu+fJPxLxC
         eAmqW0Y8eljTKBiLQ77tzb8OLsWKw5yWbOClZkvyuxFL7JRpBtoXc+JDw1znq0TcPAIQ
         bN0JVcKQkvLU/VZLQLDUBEalaGbUSXZB8ASO8q7ctHr9z4M9dirbF4GHRwbBc7lV5Krg
         /Uhw==
X-Forwarded-Encrypted: i=1; AFNElJ9j8OANRT8/oaKYtExgZ2UJzKGV832/irmCjFZqCrEYcoPXhna8LKlpwgqw0cpBvTleJitlKa4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRiRGqJVhMdF2qsvocBbw9am357v/wPnryWsLaGW5ba51p4Uk8
	h77PxZaEEbvbXuSL7IQvbwQhBoIZ90oNrkiU+xHcab8KCPBEx9jNsS6P
X-Gm-Gg: AeBDievmhSmwlIHMLmGcOhm+nRg00cwZi77UOFD7tt/D+uJClFcdk2dr8W+K6VSW1QK
	0jAbEVMDpWZhc+WTf4Dkxc3/pSySY8scnSbSnBa/c/cwjCY6VbMaYH+qqyYrMm66bruEeibcLYJ
	20VD6lCK9WvH+l8sEkhZu9a8KyOt6QAg1YN2muq04yx/PZbZRfnDwh538aDZ61KDGF5S6xJnqYs
	p13nZ9VciWQ2SRUH61h6RFVryWWd+8eeBmF6T3nsUA8SoFXF6eg/SyPcH0dS/+xIV92s1BQ70z7
	/AVASQ7txrV27XCg+/gB/dQ3HrTMfGenLgKEK3Qnt+MM+OoOcNUpzI88IXqx34R2kAs5lYGkVYk
	1YsiEC3F8zeW/aFrYltB9gZHTNutLVy0H5zBbvlc9caGE53ObRsAAjnGoQvXYHqijB+Phu1rcfY
	Q=
X-Received: by 2002:a05:6512:2396:b0:5a4:143b:3f3e with SMTP id 2adb3069b0e04-5a416f4c297mr6613859e87.0.1776846738105;
        Wed, 22 Apr 2026 01:32:18 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b7bsm36262921fa.23.2026.04.22.01.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:32:17 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 22 Apr 2026 10:32:16 +0200
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Uladzislau Rezki <urezki@gmail.com>, Thomas Graf <tgraf@suug.ch>,
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [linus:master] [mm]  c6307674ed:
 BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
Message-ID: <aeiHkG7X_dieMdw5@milan>
References: <202604211323.fac1b29e-lkp@intel.com>
 <aedvSnhOGM_mauYP@milan>
 <aehdcxC14ycvY481@gondor.apana.org.au>
 <aeh2Ii9CxtgfsX_p@milan>
 <aeh_2WwIb8nAIcy2@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeh_2WwIb8nAIcy2@gondor.apana.org.au>

On Wed, Apr 22, 2026 at 03:59:21PM +0800, Herbert Xu wrote:
> On Wed, Apr 22, 2026 at 09:17:54AM +0200, Uladzislau Rezki wrote:
> >
> > since your GFP_ATOMIC context allocated chunk of memory using vmalloc()
> > sense kvfree() uses vfree(). The simplest fix to free via RCU.
> 
> Why is kvmalloc returning vmalloc memory under GFP_ATOMIC?
> Is there a new GFP flag to tell it to not return vmalloc memory?
> 
> This has been working for over a decade, what changed?
> 
We have added non-sleeping flags for vmalloc() to extend kvmalloc()
functionality as folk need those.
 
Another option, would be: always use vfree_atomic() from the kvfree()
path.
 
Any thoughts?
 
--
Uladzislau Rezki
