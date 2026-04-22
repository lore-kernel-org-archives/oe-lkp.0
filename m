Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058E372EC0;
	Wed, 22 Apr 2026 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776844770; cv=none; b=VjVGtwNVdgPOaLJR1OtCHJ1aXDluSjvKYYxteURZi27IRYBnBhh91rNDjZ1BUVGNyE6tbgeOfZTeAaXJfOaZXrT34thFt6bIsOLYGypNa0kmVHdF3a1YJBuvMisTe1WH81sFKEuV8kBmXoi6J8sQbwp0LAEbUaBUCBZc/6XpdzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776844770; c=relaxed/simple;
	bh=QoJogCD3dsV/2F0cm69DkVVvChdFFb8fXAGPI5AeaKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1F37RCzNF3Au5sJ6/+CWATeEQbAG1SWTmbeXlvs6IcTMfxqneW/WtRAlwepKC30m2t1ebWeTUHZhm//3ACfFvumEx2FWQlsiq/2vbo6LvsV5TQSteFU8hgFOjzyQOrn/0YAKHJTjRd06A5zXRbkwttNwz8JUcxWicO4a+g4fqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=iXH+AChG; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="iXH+AChG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=RKsQz6u8ayP/3L26MgNLWofkJm3W1LTrJTeC6jfaHIY=; 
	b=iXH+AChGGdqd+UoRwbmc++bH3laUG3KIj90IutsaOgclyzpxVKonyn5kgxZ6KSMR1owk5BPTjs0
	MV13yYfA1eMURsGQF5OVFZvND2wpBCG+wAYfm3k0TCHgSpX8VkLNTnbw9+Pa5Kei4f0VEGnbdLzfs
	qT5rYL9jOxxNUjSWHPZNQuqUDpxVBv/PUTXNWHuT0lV+HQjq9c3zSu31x5EsnGkeHsNSiruvPQDcj
	BxbCQJOC+xReCIYzCuiFLOO7BGeIU97ogKID/km8D0CPl3EIW5I4vpZx60yeM7I00+8QmVXJWKRuF
	FGe1vyKNW0bwQNmWm7aVJgymGgqffpQojhtQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wFSUT-007uVI-0V;
	Wed, 22 Apr 2026 15:59:22 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 22 Apr 2026 15:59:21 +0800
Date: Wed, 22 Apr 2026 15:59:21 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Thomas Graf <tgraf@suug.ch>, oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [linus:master] [mm]  c6307674ed:
 BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
Message-ID: <aeh_2WwIb8nAIcy2@gondor.apana.org.au>
References: <202604211323.fac1b29e-lkp@intel.com>
 <aedvSnhOGM_mauYP@milan>
 <aehdcxC14ycvY481@gondor.apana.org.au>
 <aeh2Ii9CxtgfsX_p@milan>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeh2Ii9CxtgfsX_p@milan>

On Wed, Apr 22, 2026 at 09:17:54AM +0200, Uladzislau Rezki wrote:
>
> since your GFP_ATOMIC context allocated chunk of memory using vmalloc()
> sense kvfree() uses vfree(). The simplest fix to free via RCU.

Why is kvmalloc returning vmalloc memory under GFP_ATOMIC?
Is there a new GFP flag to tell it to not return vmalloc memory?

This has been working for over a decade, what changed?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
