Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E8316DECD
	for <oe-lkp@lists.linux.dev>; Thu,  1 Aug 2024 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722519065; cv=none; b=FxUsCk0h1XZ7RA5R+hlL89PDp3XKaVUk3PGtDzdwhUureRvRDc3zXghQ1VaCQk4fFwo/UWIzYwavcgjM0VNOPUOPV9CROrh+HID+aKl6waIxGWLcj15lg/5H5OeIIHz6sgjloJrZ30SQWdN6fQZ6ie4wlowzQMW6WESvdiR65Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722519065; c=relaxed/simple;
	bh=5JQrkiP0uOjwss1rpQy/l3A+rpzTZUsAeWqATieGYNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lX+3/U3Q47ae651HPzzunTrXlsjMWvnuvECBHPxnw/Wt9ODCTaTdhxsb0ytyZU27YAXJXOH5c3UsSTmGstf3Nv9ZnH0vYAkAxAc+XOQlEUe2+fco33lsKEKOa11dT4sfNV8fbhtDVq2ydYZb58mGblRalaU7Iah2F3GNeI10QM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4usHrs8; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4usHrs8"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5b391c8abd7so5892573a12.2
        for <oe-lkp@lists.linux.dev>; Thu, 01 Aug 2024 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722519062; x=1723123862; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tv4iB82yfscVGFR90a765Fg0rBGgnQwJipeiUQwNkUo=;
        b=l4usHrs8aAy2qwYJFlegzNvvGBr1PEnTaZ+CvtzbgjRtaeLXKjs/RKzeDW4e9avSHo
         s5cy3op/K0vvQZC9pMzAoxb7BBuTtD+8X3TecyNJZFcvkb2iQovvMSR8G9NVq8VxOY0q
         wCZ5h2dQrxgj9Rxxh3eaRwQb8XvhU+nICf4d6h02ZbK/zD+rViJNTlS0WlDJYXYk0isb
         IX4gm9F5XQE+Ig/QIsRY46I8KPBI7xHO6fMeMsO/eHxcxcUvIgokrmPu7T1jwxanCpp2
         V/6929UU93Dn1alNUXo1KTNgdgCtGE04v2rE0C+EimqdEbzsIZp3p1NLdMIDnAbJpR7g
         U/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722519062; x=1723123862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tv4iB82yfscVGFR90a765Fg0rBGgnQwJipeiUQwNkUo=;
        b=hyYhiOMMFwlY8B+ytVUKLJYflrFwMjRLjw+oXx7dGDKovLEpCniJj4NXseeVmzl62d
         KGfgyICF+cAVVnFKMZYjN4IGGU1UmWG1TQw5i28erPzCf6gRULz3l/tEzaaCPLwsV/83
         6rsa95Wcfg56X0Zvlo5h/NyfSslohNo66ZdEE+fxeMsHa+myDNbprVIZ/w8iFe9olgRo
         HMjOJg3AY9DI2HHao9+bPvvd+pWm4a5wqb3TqTlZ0YrfAxkI9kcBdV4wrDshqmJbuV0w
         2TOEYTmlFVluaJG80st8Va0+7u4GynPbJOMb2g1CilGeBCaauo6bEuHAdx18dA5oof+q
         OkRw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ktq/cuShikCLRrfPTRg+OLdeB27XwE2wgDBL7tu/MZrW/1wg0UnN98GGPKvHxFdj5k+bWyYld4Di+XfK7UHPOLl822m/
X-Gm-Message-State: AOJu0YyXWu+s4ZtYbJkjRf+mh8v53oASV/y2Sdr5eFBIfkiW0zlVBtDg
	+OCgahzuaayWOiKP8cyTHBGpZWmjYj/LH8bHWm2Kv6Sk2wRJ14GO
X-Google-Smtp-Source: AGHT+IElO9v+4Isd9ZaN2clcpXml/1imltaATSqt4uv4tE5W6CFLpI3ysrDPJAq4DaCky1y+YsIR6w==
X-Received: by 2002:a50:ee8d:0:b0:5a1:a447:9f9b with SMTP id 4fb4d7f45d1cf-5b7f54136b9mr201616a12.27.1722519061241;
        Thu, 01 Aug 2024 06:31:01 -0700 (PDT)
Received: from f (cst-prg-90-207.cust.vodafone.cz. [46.135.90.207])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5af959990c9sm8749591a12.47.2024.08.01.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 06:30:59 -0700 (PDT)
Date: Thu, 1 Aug 2024 15:30:49 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: "Yin, Fengwei" <fengwei.yin@intel.com>, 
	kernel test robot <oliver.sang@intel.com>, Peter Xu <peterx@redhat.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Matthew Wilcox <willy@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org, ying.huang@intel.com, feng.tang@intel.com
Subject: Re: [linus:master] [mm] c0bff412e6: stress-ng.clone.ops_per_sec
 -2.9% regression
Message-ID: <6uxnuf2gysgabyai2r77xrqegb7t7cc2dlzjz6upwsgwrnfk3x@cjj6on3wqm4x>
References: <202407301049.5051dc19-oliver.sang@intel.com>
 <193e302c-4401-4756-a552-9f1e07ecedcf@redhat.com>
 <439265d8-e71e-41db-8a46-55366fdd334e@intel.com>
 <90477952-fde2-41d7-8ff4-2102c45e341d@redhat.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90477952-fde2-41d7-8ff4-2102c45e341d@redhat.com>

On Thu, Aug 01, 2024 at 08:49:27AM +0200, David Hildenbrand wrote:
> Yes indeed. fork() can be extremely sensitive to each added instruction.
> 
> I even pointed out to Peter why I didn't add the PageHuge check in there
> originally [1].
> 
> "Well, and I didn't want to have runtime-hugetlb checks in
> PageAnonExclusive code called on certainly-not-hugetlb code paths."
> 
> 
> We now have to do a page_folio(page) and then test for hugetlb.
> 
> 	return folio_test_hugetlb(page_folio(page));
> 
> Nowadays, folio_test_hugetlb() will be faster than at c0bff412e6 times, so
> maybe at least part of the overhead is gone.
> 

I'll note page_folio expands to a call to _compound_head.

While _compound_head is declared as an inline, it ends up being big
enough that the compiler decides to emit a real function instead and
real func calls are not particularly cheap.

I had a brief look with a profiler myself and for single-threaded usage
the func is quite high up there, while it manages to get out with the
first branch -- that is to say there is definitely performance lost for
having a func call instead of an inlined branch.

The routine is deinlined because of a call to page_fixed_fake_head,
which itself is annotated with always_inline.

This is of course patchable with minor shoveling.

I did not go for it because stress-ng results were too unstable for me
to confidently state win/loss.

But should you want to whack the regression, this is what I would look
into.
