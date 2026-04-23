Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DD83CB2ED;
	Thu, 23 Apr 2026 03:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776915307; cv=none; b=rz5v3o3XyH3gF50xM/Hr7XBINSoGk56p3480Esl8h/fj8nC1bLJxYmnD1JsdUrRIXWRZ/dv9uQVWn+hhQrAsJztEhQvyYnd9bSfCLqPgmz9t9M4J4JL4vDfecBSrtWZN+fLbfBzGQm9Cdsqhezc/JdT7VQKd0flW6w0asooBgrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776915307; c=relaxed/simple;
	bh=O7J4bA8qii69vUPI4w4QjcWJBsnk8trPzwpRsdBSkcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPUu/QuiV/+efi2zEz2bwHJknR+K7Z64L1gdNzW/HK3MrCcJZxIVGQwrDp6qCm3pNp1xp4YcDzGmIdcTJgXGxqmSwle3223y3dPUIMfGIH72O/lnjQJW/UaRk3DLuHIlOaipTFVGCHVEe2uQtrbFNm7HfjrBlmKGzE8z21n9qsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=JSBJQxr3; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="JSBJQxr3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=V6s2isDfE2FieKJNppiSMNQx/Eb5cH3C9i1Rkidi5CY=; 
	b=JSBJQxr3/MuPfP4zR2UyOyIOZdJAXRkaBy7oOxsEmcWU4m2lO+SYdWlGuyLlaKvWl3cVLvKEZnm
	n9qoEYj4o0kylQo/Y/iafHSnVy2P+a+9AWtXogScO3lQJeqpucEUZRsSd9d/QIdpDRnw3FbllQOob
	d61CzmdZA1lm3E+y4KjPGT+f+pgF5gifaczCjkdGty41VDhXHmjMinmJ5X3EjFPNF/C0A6b3tns7/
	lvql3a8Xp7kPo4dH/wvmoYWLJEfPeoXZR1Fn+1ncrWr2hIoVBItQ5EIaO6wEKNbYKF1Saa5QVfass
	zLYVqWh75XZOmCtkTOYbAjx6bKjw1/45P5cg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wFkq3-0087mr-1W;
	Thu, 23 Apr 2026 11:34:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 23 Apr 2026 11:34:51 +0800
Date: Thu, 23 Apr 2026 11:34:51 +0800
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
Message-ID: <aemTW8yiAe6y1tsQ@gondor.apana.org.au>
References: <202604211323.fac1b29e-lkp@intel.com>
 <aedvSnhOGM_mauYP@milan>
 <aehdcxC14ycvY481@gondor.apana.org.au>
 <aeh2Ii9CxtgfsX_p@milan>
 <aeh_2WwIb8nAIcy2@gondor.apana.org.au>
 <aeiHkG7X_dieMdw5@milan>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeiHkG7X_dieMdw5@milan>

On Wed, Apr 22, 2026 at 10:32:16AM +0200, Uladzislau Rezki wrote:
>
> We have added non-sleeping flags for vmalloc() to extend kvmalloc()
> functionality as folk need those.
>  
> Another option, would be: always use vfree_atomic() from the kvfree()
> path.
>  
> Any thoughts?

Perhaps add a kvfree_atomic that just calls vfree_atomic?

For rhashtable it really makes no difference either way.  But it
would eliminate the unsightly call to is_vmalloc_addr in rhashtable.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
