Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BD515442D
	for <oe-lkp@lists.linux.dev>; Fri, 13 Dec 2024 04:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734063768; cv=none; b=n/Nqo5nqWaP+ONwAyKi2I63wKoLi29XOQq8Yvz1jZpYM7hvgPg0+c4tbiQbjL5I9QhDfBG+7K0nb1JyximevNmvydwG7niwMnah/IZByt5kriHINPWXT8fYzEgae5PKtSV2ZWCv2koAl+2kF3/xWZvzt7SoWcg5e6GDSc/qZ+L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734063768; c=relaxed/simple;
	bh=ojlvihfvzGrfCRyRnL2DrfCyL4PYjfoSzc9ch2VJB/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3/l0NoqBqAWjoqe94kuhXIPfA0vnf2lDooBaCxdYVWG8tHQ7BZ8bUSDa2KIyE8ERIyKrxt1Vg8YzsGL+kKV1mvBdinCvtJ1AzgxW40r84JQgrFtmWkQSYZ0F5egN8O9ZAcI4tm8SFMrvMsjrXYEDYTLd5uGPBJNRaeyrHymIg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ob8dhcF3; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ob8dhcF3"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4679b5c66d0so96471cf.1
        for <oe-lkp@lists.linux.dev>; Thu, 12 Dec 2024 20:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734063766; x=1734668566; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zusNDVE9tIk+XAMjo2wDNCl3eBQntRzpxBDCfZphJ0=;
        b=Ob8dhcF3hKJSayUE+FiIa0x02fbMj+HId/AotndBjCTDfko/HV/Pmlk7IJGJRDVvQA
         jYYJiOqi0AITMcfQJfTM3BH8CCtjCjWUVYmUgcXwsXvxRUi70Tn8D5D8fri2W4s9SB1/
         Qe9rWRp7pzr6GaW+ElJlIwaDzLhtFSKGMyYFgpxZktLC3TwUi22lHQSS9wFbwcs8T3Rx
         Q+UeSVByr0bo2sXULCVTtL1s7J+WXUyUyu2vFU0D0696pgoiIuEZH3dWDfoOKgRD5VRr
         CA2X6fvY8osAEaH7QIFgUmeta15YtZfyf6Gy9HwphJvldRZm7I+hBUNIX4bpz/mtF60V
         zgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734063766; x=1734668566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zusNDVE9tIk+XAMjo2wDNCl3eBQntRzpxBDCfZphJ0=;
        b=wZYAAvD3wexSqQzm6XgLjKAhjD8kQ8cPSNDT2NEKk7pn+Pax5D2SG3ag9ShZgAXwoB
         t9zENa/jEYRRlf5xF7uo7DVzpasM1wuppcoYGuFhlvKmOD/Iedy3ZRNjoemvPVBYHRqb
         pfDc0H/9794FfegkTRqJYUpNunxORq+6Ok3tepI4zQOC8Gf7iSY0l8lBI+4eXiCb7igW
         tfwmQ17UTA1BlK7PRCuxUj6t8Uc8HTQWTvc6QePA3SyhhNWhn/nbiDp4t4LSOdWKCPDL
         BoOvbQdtCfHcT+/VJ2aLP47VgoSQ79lEzzvcPHBijrnqGGMghJJmQQEuflJGmCdiL2/V
         WPFA==
X-Forwarded-Encrypted: i=1; AJvYcCXBd02uO9JUNhoDxp2rDoakWuYAhVa9VsI1n7WdJyOTrsE20/vzH2NfDJTkGjo9aUcfueGjJl4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCtqEjJ8jmqM85op6vYSk9Q60LvietWObjdyeAiSKU24sgggwt
	6cFCojwqjmqwGND8irmNHKH7bO6btQlA/h/iIz5I/VL2plWB1FpCilScLPY/kNL9sCMUoz8w2qO
	A/JGTy6ci6qAAxIpqQtl74e3E2EbEzXSmU8Go
X-Gm-Gg: ASbGncsLgc6TZqytJr/JXEDYZYb9u0fYwUYFAztmlS8uXFoGmEl4fbGArx1dHFMumxs
	wbdFNYkPYKmb4rz6ZAmJb0OeErf8d1qmtWHpbdQ==
X-Google-Smtp-Source: AGHT+IHUjsjX9/4hhtNsDvYlspKvkzYig7wPXadi+PWScjnds/jNc+sQHm8865fCSk/cwCPwuMUgBfUr39sbO0iN8jA=
X-Received: by 2002:a05:622a:250e:b0:467:462e:a51b with SMTP id
 d75a77b69052e-467a4275a11mr2308501cf.14.1734063765511; Thu, 12 Dec 2024
 20:22:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJuCfpF2e7niEbR=nX2u0HZHq-7tjRGB=xV397pFpjdzBqUGfQ@mail.gmail.com>
 <20241213013332.89910-1-00107082@163.com> <20241212201212.c61bfebbbdb51b3c8bfeed11@linux-foundation.org>
In-Reply-To: <20241212201212.c61bfebbbdb51b3c8bfeed11@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 12 Dec 2024 20:22:34 -0800
Message-ID: <CAJuCfpEbEd57-8Lrn9_jSK0p=KN7p0PwsuhhjxJViqcN+v+0bw@mail.gmail.com>
Subject: Re: [PATCH v3] mm/codetag: clear tags before swap
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Wang <00107082@163.com>, kent.overstreet@linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lkp@intel.com, 
	oe-lkp@lists.linux.dev, oliver.sang@intel.com, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 8:12=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 13 Dec 2024 09:33:32 +0800 David Wang <00107082@163.com> wrote:
>
> > When CONFIG_MEM_ALLOC_PROFILING_DEBUG is set, kernel WARN would be
> > triggered when calling __alloc_tag_ref_set() during swap:
> >
> >       alloc_tag was not cleared (got tag for mm/filemap.c:1951)
> >       WARNING: CPU: 0 PID: 816 at ./include/linux/alloc_tag.h...
> >
> > Clear code tags before swap can fix the warning. And this patch also fi=
x
> > a potential invalid address dereference in alloc_tag_add_check() when
> > CONFIG_MEM_ALLOC_PROFILING_DEBUG is set and ref->ct is CODETAG_EMPTY,
> > which is defined as ((void *)1).
> >
> > Signed-off-by: David Wang <00107082@163.com>
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202412112227.df61ebb-lkp@intel.c=
om
>
> This points at
>
> 51f43d5d82ed ("mm/codetag: swap tags when migrate pages"), which had
>         Fixes: e0a955bf7f61 ("mm/codetag: add pgalloc_tag_copy()")
>
> e0a955bf7f61 ("mm/codetag: add pgalloc_tag_copy()") had
>         Fixes: dcfe378c81f7 ("lib: introduce support for page allocation =
tagging")
>         Cc: <stable@vger.kernel.org>
>
> And I'm thinking that this fix should have
>         Fixes: 51f43d5d82ed ("mm/codetag: swap tags when migrate pages")
>         Cc: <stable@vger.kernel.org>

Yes, that is correct. Sorry for missing that.

>
