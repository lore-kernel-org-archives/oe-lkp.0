Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ABE8F4A
	for <oe-lkp@lists.linux.dev>; Mon, 20 May 2024 03:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716175819; cv=none; b=KMSLftC+JLhDH5azkSrOxXoFe+q+KlPjGB/ANA2pkXbSonhvmnmexgTMA8zcvwzhsa8TpeX8t+f0fGhFf85on8WkLzrGTCnwUGJYQUGp0kCVrNQS+8mrZO7o/PTLN8s/uZ5MZKu+hxv0HSdWi7+h+RMWVVYhHxGX/arxppqeL2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716175819; c=relaxed/simple;
	bh=N+sl7jVqfc2PSloZXbsuOdKWDk7D4LeAw8ESdThcolU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dbhoe+j7+cNpeC23OSmVQPG5YdptYL5JkLx7v6NqKdsX7ZFiYtX6tjVie345ai/oZMnSt3OkyUrtzmhOIplTyYWAqvqTxxcnzCdSuGK+JE1eQtHt5RU+qRWpvCspYPGTWtlWx/hvva2ytvbL1qQNX2bhrXXrA78XNkXq/UODXJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dA7kZ35U; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dA7kZ35U"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ecc23e6c9dso61083645ad.2
        for <oe-lkp@lists.linux.dev>; Sun, 19 May 2024 20:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716175817; x=1716780617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+JrWPfIASUzFRmiR/DV6jZQiIB7Zl8bPPeoGLFG72Uo=;
        b=dA7kZ35UEilkX+oFGDbcy7Ae+FlwXAWxFfDTMhWaD9rpMiJ3dDrVb+N6dw7hYP/fwR
         099sKsWpxlXnkA6EclCueSNz4bsTD/SyEoIHI1A5nlSjTD/UxKGhhPQ0Lqoj6pWersyr
         P+C0PyKFe/DPRq5zM7jzvvpkaBphtGki5ilbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716175817; x=1716780617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JrWPfIASUzFRmiR/DV6jZQiIB7Zl8bPPeoGLFG72Uo=;
        b=KtxL9Qu+bNFdgHUEXuM5qIAwI0fWILpDpHOobY9SRu8jnpSd+O6Il0VGBvmwT4+TXt
         Acc7ec3Jwj+JYtRo2irgvxYOkLthr3G8MCTGaDZnaFL89F/WbTCgLIaPO1nyfqC1Frum
         S1Bb5+0toFbDUPqg0mtyo0Mg1QUhaC6l4TiNoCewcfwrRKAKHXAfDwU6lj+HS1Dn9ZrC
         Tp8mvvIgAA/I0flC79zOW/8gsxrYGo8TDD3HM7I9xgBu2UNw20rEL/1NrANMVBknkzdr
         TKdjZafNGpMuPdsq0LDFkN7zIYBcZv6XrLIAVUndXEs943jm7Jvvqtxu358YB7TGca++
         dwQw==
X-Forwarded-Encrypted: i=1; AJvYcCXyh02ImCMLdxyxYR2z7mdKbKDkuYoz92m1GZtlaF2kdWtBYmrmQbP8JqJzsu9cl/4YXKn3NuXsK39VW3A3DGB4+95vG1Mm
X-Gm-Message-State: AOJu0Yw6IfNFKD0isuj8BtFG1dWQ1YQKQC+DeopyFisS0+kbOj2hFfzR
	mee+RV+J6KF4uNp0ePfqC31FWUV6UUlI2qnaLXqaZ14qTj9iHSO9sUepNAOVJQ==
X-Google-Smtp-Source: AGHT+IGEIhXHFo8lQr4BEx8nWbaYE1K8DXMrMP87uwXai76RXva2jls+/QFtIlMVhVxe/QA8pDzVAQ==
X-Received: by 2002:a17:902:6bc4:b0:1ea:f9af:ee99 with SMTP id d9443c01a7336-1ef43d28276mr260443125ad.25.1716175817070;
        Sun, 19 May 2024 20:30:17 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bada3efsm193550625ad.114.2024.05.19.20.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 20:30:16 -0700 (PDT)
Date: Sun, 19 May 2024 20:30:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: kernel test robot <oliver.sang@intel.com>,
	Suren Baghdasaryan <surenb@google.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Christoph Lameter <cl@linux.com>,
	Dennis Zhou <dennis@kernel.org>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	linux-hardening@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [linux-next:master] [mm/slab]  7bd230a266:
 WARNING:at_mm/util.c:#kvmalloc_node_noprof
Message-ID: <202405192018.9A54A254A@keescook>
References: <202405151008.6ddd1aaf-oliver.sang@intel.com>
 <a7qrk7rkfbg44mhfehup3cgwi7bhcuqys72tg2ri7ck7sggfnx@643nnjnpxwzt>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7qrk7rkfbg44mhfehup3cgwi7bhcuqys72tg2ri7ck7sggfnx@643nnjnpxwzt>

On Sun, May 19, 2024 at 07:06:45PM -0400, Kent Overstreet wrote:
> this looks like an i915 bug

Yeah, agreed.

> On Wed, May 15, 2024 at 10:41:19AM +0800, kernel test robot wrote:
[...]
> > [test failed on linux-next/master 6ba6c795dc73c22ce2c86006f17c4aa802db2a60]
[...]
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202405151008.6ddd1aaf-oliver.sang@intel.com
> > 
> > 
> > [  940.101700][ T5353] ------------[ cut here ]------------
> > [ 940.107107][ T5353] WARNING: CPU: 1 PID: 5353 at mm/util.c:649 kvmalloc_node_noprof (mm/util.c:649 (discriminator 1)) 

This is:

        /* Don't even allow crazy sizes */
        if (unlikely(size > INT_MAX)) {
                WARN_ON_ONCE(!(flags & __GFP_NOWARN));


> > [  940.307791][ T5353] Call Trace:
[...]
> > [ 940.351795][ T5353] eb_copy_relocations (drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1685) i915

And this is:

                const unsigned int nreloc = eb->exec[i].relocation_count;
		...
                size = nreloc * sizeof(*relocs);

                relocs = kvmalloc_array(1, size, GFP_KERNEL);

So something isn't checking the "relocation_count" size that I assume is
coming in from the ioctl?

-Kees

-- 
Kees Cook
