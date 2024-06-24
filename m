Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE2819CD0B
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 17:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719250314; cv=none; b=b7GRsyzLRLmgXCFO7LI3byXeZZ4bBQbOeCiCk+t/vcOm/XQTLu6kyPTfFYCg603ModLW+CIbv15xVNbntqPNF/GKClxy5RTvxjyB4Ltxe+Kd3G1DA3FjyTnDOGU74h7Fosh7jcaPc1RCn3Pppx1VXRQFNe7cdWiffJZZKYlnU2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719250314; c=relaxed/simple;
	bh=lzw62rV6dsrTStefsBXRWeKRQD78ZZQOIsaYkQC+T9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iByBNyQHS5L/wETEKQm7cli5VqoGHqabRlQFp8eBzdZwsDusY6g05DXCLv+M5l27d3fq8bBdbpHPm3n9EFgZyY/2sWaZf2YCIbWMgnoLgMppbYXCUaSLpQAC5Rd7Dz90hvlwdG85VavtaevYNEko6gr7vxXik2VwfMSe7XmOmMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oujlT6Cs; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oujlT6Cs"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5295eb47b48so5398834e87.1
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719250311; x=1719855111; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJahqqcPYHh8+eBoSG26csJCzav1KQmoeVFSqgS7I8o=;
        b=oujlT6CstowBdtl5woPwXMdm87U8eYNTkyMsKp5naoO9WFkXRuNjzv9AypG5JCS/Ym
         CoSjpxqzrK2+bJpcNB33l4WSULBAMbF8ytrVhbKXBSWKehDqm87ZM/OPVbIn5WiPfECw
         piCNX+ozmgveq+r25PgfwnVTENESbyxOL+7SKZXDIjc5Y/ESEBmVd8B5ejy+jDdvLC1c
         PPIHYny6Vaw5CTZU1g3Ihz2dvgbnOGDsq6+4KHpjtK3OR0L7ab4KvKtB6n1C2lZ3XrKE
         +PVCdB59q81B/MTvgTP2Yaj15zyvObR9ugo4lyi2o5YXb2MOn7iAcOFVrOtvuvSaPCKV
         Aa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719250311; x=1719855111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJahqqcPYHh8+eBoSG26csJCzav1KQmoeVFSqgS7I8o=;
        b=P12m1oCoZAnFN0EJlY0CriMF7+GHxORO7v9UAH6JtQfRoSAmkKJ79YSaX7YOjvjTN3
         oEsGgNpa7zbOgsprKZpAdvsqUwYJEhwmC1mZVH0AvLl4alcY9s2FLPqfcxMHA05o0ut1
         xoVteo34/o99NgqZUkQxm8vOsskovgkT03paTSfvSvzAFRP6ojbGpXEnEBJLgtQDRuBD
         o0qlvrbLlfB7ecBymcubN/KqR8DBaxCXORDy0N26PnenXQ2J5GuoxclnXPN62Z7eOf5t
         W9moaz6DqjHiRqbt94+P017nWRXA2bMV7h0Un3wZXAWveZrC8oWBx01r4IKDBXmh1MuN
         a9+w==
X-Forwarded-Encrypted: i=1; AJvYcCWNeiNISiizX5+LbbuobvuWvjS9m5L/a2dpB22vaUPgnGChld9hH6N1U5clV9KCqMpfnT0zKnWiaesNrZETlbj0y4QWpB2k
X-Gm-Message-State: AOJu0YwtkA+4QX3GtPqzzbm8clmjJHIWjJSgmnYK+VYeQhXkurmxbp7P
	UNGzFuLfBcSczHB0/yI462FxwWR+v3DhEo8MAhBPJfJVNyguW3YfnEPMd8yBKS/J2CFIeTKHr/9
	/RaVaJDMpquxMYkxUfV576IejquN52y6eWWEE
X-Google-Smtp-Source: AGHT+IHu/6Uvh7AV/Zv0qy/SmWhabuqLk3uy9Cs1T7gS6dfZJh34AaaZ40gcXksxb2cum4I5w5DnMWycjP5k27WphGc=
X-Received: by 2002:a05:6512:6c3:b0:52c:83c2:9670 with SMTP id
 2adb3069b0e04-52ce0646e8bmr4646203e87.69.1719250310229; Mon, 24 Jun 2024
 10:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406241651.963e3e78-oliver.sang@intel.com> <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
 <12fb19d1-3e57-4880-be59-0e83cdc4b7f1@gmail.com> <61d19ec8-2ba7-e156-7bb7-f746dae8e120@google.com>
 <5b3e732c-d23d-41ef-ae5c-947fa3e866ab@gmail.com> <CAJD7tkYJVa=dd=hwqhJ8_-uzxFDaP6-GcTk3RdG_3DJouJ61AQ@mail.gmail.com>
 <cacd14a9-01fc-4844-9ac6-2e797af13c36@gmail.com>
In-Reply-To: <cacd14a9-01fc-4844-9ac6-2e797af13c36@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 24 Jun 2024 10:31:14 -0700
Message-ID: <CAJD7tkbYbJHWQtC8+nsyfgS2jq7S5Qyy3-1NJWa4m80VAR9GXA@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 0fa2857d23: WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof
To: Usama Arif <usamaarif642@gmail.com>
Cc: Hugh Dickins <hughd@google.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, David Hildenbrand <david@redhat.com>, 
	"Huang, Ying" <ying.huang@intel.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Matthew Wilcox <willy@infradead.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 10:26=E2=80=AFAM Usama Arif <usamaarif642@gmail.com=
> wrote:
>
>
> On 24/06/2024 19:56, Yosry Ahmed wrote:
> > [..]
> >>>> -       p->zeromap =3D bitmap_zalloc(maxpages, GFP_KERNEL);
> >>>> +       p->zeromap =3D kvzalloc(DIV_ROUND_UP(maxpages, 8), GFP_KERNE=
L);
> >>> No, 8 is not right for 32-bit kernels. I think you want
> >>>        p->zeromap =3D kvzalloc(BITS_TO_LONGS(maxpages), GFP_KERNEL);
> >>> but please check it carefully, I'm easily confused by such conversion=
s.
> >>>
> >>> Hugh
> >> Ah yes, didnt take into account 32-bit kernel. I think its supposed to=
 be
> >>
> >>    p->zeromap =3D kvzalloc(BITS_TO_LONGS(maxpages) * sizeof(unsigned l=
ong),
> >> GFP_KERNEL);
> > You can do something similar to bitmap_zalloc() and use:
> >
> > kvmalloc_array(BITS_TO_LONGS(nbits), sizeof(unsigned long), GFP_KERNEL
> > | __GFP_ZERO)
> >
> > I don't see a kvzalloc_array() variant to use directly, but it should
> > be trivial to add it. I can see other users of kvmalloc_array() that
> > pass in __GFP_ZERO (e.g. fs/ntfs3/bitmap.c).
> >
> > , or you could take it a step further and add bitmap_kvzalloc(),
> > assuming the maintainers are open to that.
>
> Thanks! bitmap_kvzalloc makes most sense to me. It doesnt make sense
> that bitmap should only be limited to MAX_PAGE_ORDER size. I can add
> this patch below at the start of the series and use it in the patch for
> zeropage swap optimization.
>
>
>      bitmap: add support for virtually contiguous bitmap
>
>      The current bitmap_zalloc API limits the allocation to MAX_PAGE_ORDE=
R,
>      which prevents larger order bitmap allocations. Introduce
>      bitmap_kvzalloc that will allow larger allocations of bitmap.
>      kvmalloc_array still attempts to allocate physically contiguous memo=
ry,
>      but upon failure, falls back to non-contiguous (vmalloc) allocation.
>
>      Suggested-by: Yosry Ahmed <yosryahmed@google.com>
>      Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>

LGTM with a small fix below.

> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 8c4768c44a01..881c2ff2e834 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -131,9 +131,11 @@ struct device;
>    */
>   unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
>   unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
> +unsigned long *bitmap_kvzalloc(unsigned int nbits, gfp_t flags);
>   unsigned long *bitmap_alloc_node(unsigned int nbits, gfp_t flags, int
> node);
>   unsigned long *bitmap_zalloc_node(unsigned int nbits, gfp_t flags, int
> node);
>   void bitmap_free(const unsigned long *bitmap);
> +void bitmap_kvfree(const unsigned long *bitmap);
>
>   DEFINE_FREE(bitmap, unsigned long *, if (_T) bitmap_free(_T))
>
> diff --git a/lib/bitmap.c b/lib/bitmap.c
> index b97692854966..eabbfb85fb45 100644
> --- a/lib/bitmap.c
> +++ b/lib/bitmap.c
> @@ -727,6 +727,13 @@ unsigned long *bitmap_zalloc(unsigned int nbits,
> gfp_t flags)
>   }
>   EXPORT_SYMBOL(bitmap_zalloc);
>
> +unsigned long *bitmap_kvzalloc(unsigned int nbits, gfp_t flags)
> +{
> +       return kvmalloc_array(BITS_TO_LONGS(nbits), sizeof(unsigned long)=
,
> +                             flags | __GFP_ZERO);
> +}
> +EXPORT_SYMBOL(bitmap_zalloc);

EXPORT_SYMBOL(bitmap_kvzalloc)*
