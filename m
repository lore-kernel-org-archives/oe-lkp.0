Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE22F3BB4A
	for <oe-lkp@lists.linux.dev>; Thu, 11 Dec 2025 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765486894; cv=none; b=HNo22z9QJaojbxAHnMr94Rfw089/TfNZJhx+iZla73oBec6TG3iyWsG8O866v4XrHIemXQV2VDh0R6Fq25WfC2TTLhKo7I55dXXFq7bp09d26A07PKofNWj8/T92aSDvrRVRRNf23mg6HktC/ZjkDrLGfGnea3lNpjRwkqr7B0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765486894; c=relaxed/simple;
	bh=dMhXM34QkY0AMoJuvZBgkb8ktahHU3IHPbUWYVBVGmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nu5/hUjfdUBfDtK9SaIhfpAiYyOZ0P1Enkc29Xczi0CHPlepcqmxNKE3Ary9k5G1ZNsDB7XIbv2HIAXYGhVdUNr0evGUFlGwFji8/2xYjO7sfvhMwNiX1BWtpGwcqmu9ymiDVwE8l3fbnPPaAkF8vWUVeX7L9d7sC24U6/sGz7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FS42Y83p; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FS42Y83p"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso123997a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 11 Dec 2025 13:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765486892; x=1766091692; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=chMTHbvRE6nLkCq/6jCK1ETnrgqh+xahaOOHqQQgZfQ=;
        b=FS42Y83pmHp4l23EU1fwo6+bxNt/L9uJzT3pJpR64sABl9YLqtPu5OdGfgcs9PeA7S
         NYEtWt++A4tdpyfPBuG6iHKwmbqVWIGeiN1LKDvKz/o1YkFP2ODsN6p8jYJdv1geiFOx
         zWgdlKAZJBmhEd1k5lz7OulSqbQVMefNC/TFHYwK3aDqhNCVDVX4L99Ak4NzKQghZHRW
         cCBgjM4xduJiKmt05fo68AdwCelpXdrvApSwk4kSt4PKbHMZbnguiqRx9JZ+eXYOzQsd
         dy1LdqTdAeM6Y3asxrPMSq+LjWlDxq0/zsJouhv6BBguSjbwCq/GzlgWQjLjoynoeDr9
         etmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765486892; x=1766091692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chMTHbvRE6nLkCq/6jCK1ETnrgqh+xahaOOHqQQgZfQ=;
        b=RM7c1rBRHfVa1GdT5BYkdRsyQsm1ki1wzJsH3+3LRcjK7rzBEUioPQ3ss7X/ZOagXP
         z7wYJKv1UiQdh2PA9WC1YzA3pCh+q8J8MtBoRfHplAuYc7EahBmKtyvOClKracFbY8pb
         vZD0yYeiU2CkusS6+WQGO7btizocyjZ87bVgjxBzpkM90pzDJT6sYth+V627aF6tqN/W
         5e+fpifVxnp5DclNj5cVtBkyCU/al2WR/hIxGqLF9hPC56Y8BYhl6Yr1KYwsO0+/pcc1
         2lL/mf6RrLVUwLJNHgbtdPWSJKGem/nAJIqJTHWL1/k3xhW0pdq/vJqgCSU3lwqR6Tud
         6/HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj01KQbmNHIdMWiMTVm06J+ghA+G/64tzmCpZMcF/olPNftxhs4Gw49SC/i0+3dZAlkTH5NR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzrTg+dFGETk+EY8+jJcEZXanPJmYfE8yD1jNLz4Si5cw+vzkv
	FvBDqY9EHwY1oZ0HRDrYohsaMWKovLDu0WQglHNC4BEGuZVidNzbWHRjrC2c+Q==
X-Gm-Gg: AY/fxX6m+tJhhneuhSuoiZaOaDMNiU3LwiTbQSt+1umc9zFtKvvl21eityQdyN5NHyk
	XRLjL20m6uSXq1/j9Ul4OtBAfi+7EyzKeXbyiyaE6LQB89VcbpeKBZLU83ezfPob73PvXbuLXpz
	kePRriay0wW6YHf/gXGzfCRCbUArGhtKTZI4+hvIMQpEkjOjF0xZRpS6AOq0keR3RrGwvoQzph/
	wjC9LzvTZ7jHi6GoHUDVAjLzPXMSahger0nWUUPXStpSJK+Qmr6swSda/+ipfCTFnk26YQATyYE
	wTcyY+0+BDByL/C6V6hgA7LP4lf9uryBPjgQ3ybfId5aArJ3XdankT5pQ7RhMOsRfEPzL54/kys
	PF1xhmXgJ4PTlc4zNI8/SVn+uv3RqrWTkSuWQcmP1UdBSGr1BXTpyrNNnjLhtGuxSuPuU7UcMsa
	i8evs6D5PfMRhKKP3OPGjWO88LgDN09zJY0BhC60vvjD8=
X-Google-Smtp-Source: AGHT+IFkQdIZ9eZRU65+BDOqZAYEMxG9QS8hVGWPfFJnB7mk9iNwrFL2LjOTkvfEyyT67cFXYiiI7Q==
X-Received: by 2002:a05:693c:608a:b0:2a4:4f86:822a with SMTP id 5a478bee46e88-2ac055977demr4018753eec.33.1765486891606;
        Thu, 11 Dec 2025 13:01:31 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac1923a917sm7992056eec.6.2025.12.11.13.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 13:01:31 -0800 (PST)
Date: Thu, 11 Dec 2025 13:01:28 -0800
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org
Subject: Re: [linus:master] [mm/vmalloc]  a061578043:
 BUG:spinlock_trylock_failure_on_UP_on_CPU
Message-ID: <aTsxKDBxelyF0G7Q@fedora>
References: <202512101320.e2f2dd6f-lkp@intel.com>
 <aToCq6XBybxAFopN@fedora>
 <20251211124710.f1a04ebb7d8b57abb2de6baa@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211124710.f1a04ebb7d8b57abb2de6baa@linux-foundation.org>

On Thu, Dec 11, 2025 at 12:47:10PM -0800, Andrew Morton wrote:
> On Wed, 10 Dec 2025 15:30:51 -0800 "Vishal Moola (Oracle)" <vishal.moola@gmail.com> wrote:
> 
> > > The kernel config and materials to reproduce are available at:
> > > https://download.01.org/0day-ci/archive/20251210/202512101320.e2f2dd6f-lkp@intel.com
> > > 
> > 
> > Hmmm. This looks like a race condition tied to reclaim. I'm assuming
> > we fail to allocate a page and kick off kswapd. Then when we fall back
> > to the bulk allocator which tries to remove a pcp page at the same time as
> > kswapd tries to reclaim it. Maybe?
> > 
> > Does something like this fix it?
> 
> Concerned.  If pcp page removal is racing with kswapd reclaim then
> that's a problem.  Altering a caller so it doesn't tickle this bug
> doesn't fix the bug?

Agreed. I'll look into it. 

> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index ecbac900c35f..0d1480723ddc 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3634,7 +3634,7 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
> >  	struct page *page;
> >  	int i;
> >  	unsigned int large_order = ilog2(nr_remaining);
> > -	gfp_t large_gfp = vmalloc_gfp_adjust(gfp, large_order) & ~__GFP_DIRECT_RECLAIM;
> > +	gfp_t large_gfp = vmalloc_gfp_adjust(gfp, large_order) & ~__GFP_RECLAIM;
> >  
> >  	large_order = min(max_attempt_order, large_order);
