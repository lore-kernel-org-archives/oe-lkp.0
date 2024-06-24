Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8E01353FF
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 12:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719230796; cv=none; b=XAO0AsjmWPf2DCjLKDNqCiH5IRBJUB+JPTi/ttt/3Y9iZLCY1rVg2Hx8f2nfJrp6/1BrdKNn5Nwuc1rduSljtrestcEuIuQyoWGkjl1fnzOsqs36tCHN2SgbOgrrOehiy+Jam9BmV8qrEB9ndT8tTKUirXA7jqKP2njbTflwx8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719230796; c=relaxed/simple;
	bh=N2Ye8UlFO/9bFj19GHT6YROH8QmOdP64rM3WllHkw6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFGo7ovUzmNtvd3D0ifZGL8gg+GegKGbzYi+0I2JAwycXnJ/PFJPQnxy5slR60TNPW8oH9GjPRBTyAewdWI6sfARjEzGH2iQvFscLRogiRA1GHySwyuwUZg73d3x7zAsm5f4HXqQze6ykIbjNAtvLMzLnrYmfRMOb26BnG78I0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HyPL692i; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HyPL692i"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57d1679ee6eso7465386a12.1
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 05:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719230793; x=1719835593; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2Ye8UlFO/9bFj19GHT6YROH8QmOdP64rM3WllHkw6c=;
        b=HyPL692i92yL4QY5eeBbSLjxLdF39kzNj3EtETs0T7FoWBEIndbXJPIDp88suSNVR7
         8Ps2q1siJGRzneN4SPlWoofLYs//nkbYqaQwt1UW9FMi/5+ZwkfhPjLCxQdsrm8Rl7VC
         Xu7gDg2E4w2+GDUJulTkGXFXUBPYkHmUJBXS11/SjRRnV3PgTfgEEfWwLO4iAAXpF9/9
         DYE5PPXPFrZUjaJbrrIKmjPc5z+gKzAzWrpE2BfAjCY1LhCJYU6ydHx13ZO/Ojcc9rkf
         tE/yczFPjmqA0WoaAZIDxJh3+uCpy3Q6BaN+EULpXfiyjjabtBuBUWz1ZOLji48DKfko
         VOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719230793; x=1719835593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2Ye8UlFO/9bFj19GHT6YROH8QmOdP64rM3WllHkw6c=;
        b=NUp58YgYLCZWam0wT0dbf6UnPlFKxThCNq9ZDbFvNZ8SFDZsInP/ssjR84W3ft3F0S
         hZbLP6bU46OY0FOhx5OADH5FI8fO+8RMSP4mRN95tARiYSFrKVt3dWudzowatr+3MfEy
         CE6pFwBnYfNfunLQM3qh0aBegVqGQq6MpicA/wb6EXNYjlX4CSBzTE8WzTfFC5zHmMPc
         T8uKHJXsVp0o3orut0gOgGb6+8NfOm8Fs5ychKK5f5MMpif3WWa7Wd+vFCTHSOfRO1hm
         MA1wcEz579MTqfweboDplXxAwmlf2nxdJQI3bIH3ylWxaTMiQNdqUKR7fsRmaX8sB/gL
         jgKA==
X-Forwarded-Encrypted: i=1; AJvYcCU88MN8O0QyNFuQulrRRwQuP5LW5npsmr653F5EZxh4exqQGYAmjlIgmoYs7rP1hqXTXFyf1ePgeCXvsP6oMGdDc+gkAgd7
X-Gm-Message-State: AOJu0YxzJqPkpRwnQRtv3k3a6GhC/Xf+EJ8KMtqIm8qSbOyUMKU27+yK
	OCcvP1Nesa4YTOjRSKc/ZfsZDDgHYSoLDgJCpFf/Kx9BmnznAYXuL08HpNM6+UUCJBTP1ImRAV0
	36yyLnjR8qk7u9P7q1LVtOEv2XtNEsxyfLgHn
X-Google-Smtp-Source: AGHT+IHNbHupo5acr2B4R/P/hsgga+93sAkzQ/xIPu1nrmVLsRmIQlcAe0rDHcwgQa/2R4VXwD7MHFj2EsLxttIyVH0=
X-Received: by 2002:a17:906:f909:b0:a6f:62c5:87be with SMTP id
 a640c23a62f3a-a6ffe270a03mr393937866b.4.1719230792180; Mon, 24 Jun 2024
 05:06:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406241651.963e3e78-oliver.sang@intel.com>
In-Reply-To: <202406241651.963e3e78-oliver.sang@intel.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 24 Jun 2024 05:05:56 -0700
Message-ID: <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 0fa2857d23: WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof
To: kernel test robot <oliver.sang@intel.com>
Cc: Usama Arif <usamaarif642@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	David Hildenbrand <david@redhat.com>, "Huang, Ying" <ying.huang@intel.com>, Hugh Dickins <hughd@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@infradead.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Andi Kleen <ak@linux.intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 1:49=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "WARNING:at_mm/page_alloc.c:#__alloc_pages_nopr=
of" on:
>
> commit: 0fa2857d23aa170e5e28d13c467b303b0065aad8 ("mm: store zero pages t=
o be swapped out in a bitmap")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

This is coming from WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp), and
is triggered by the new bitmap_zalloc() call in the swapon path. For a
sufficiently large swapfile, bitmap_zalloc() (which uses kmalloc()
under the hood) cannot be used to allocate the bitmap.

Usama, I think we want to use a variant of kvmalloc() here.
