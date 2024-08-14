Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D801A76B6
	for <oe-lkp@lists.linux.dev>; Wed, 14 Aug 2024 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723633592; cv=none; b=cfEZgg9dt1c+kyTi7ZzVylQuT3qW32i0KwTK4ecFT9dvpWp4DMuCiDu6kXEJWdTphDpkuFoOsftLg+zv2Rp3QA3kyYPuT8uNAGTWbUCYz7nEM1kLsCq0qhnlhRL8sv9o7HA5hGCwI8AODhxnWYRP4osxpcIMSesJAIoPGXo2sgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723633592; c=relaxed/simple;
	bh=Qv97l7e5b0LvgnkvHUMfmxlR5ZaDvutE8U+fW/r807Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWy+7MbcP17xmwx70Zhn7zNCotzAq/Fp8fTKp4NBlTBocwOGyVcB3aZRPWqmVOlD6y8KVSDmZqXv65sHc1kLoekei4saWPWHvTuSKSHAPhlV+6ynaDvgmBqzNPu+ZltWoUOG0GEeK+U5TQ46vApvnds/0DAOTiqP9LOprwEb1uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2m9LKNe; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2m9LKNe"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5af51684d52so7038638a12.1
        for <oe-lkp@lists.linux.dev>; Wed, 14 Aug 2024 04:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723633589; x=1724238389; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37k6zoJGI4ySfWeQa+WNWY1gPNVBQcPCdoUsogardSg=;
        b=a2m9LKNe2X0UsZRKmeKgaQ+QNhdLux/AgTDyQ00UDlNycd6pazg5JzRTs9T245THG3
         C6rwObXm8vXjKKNUNN6daMvnasCWLgbEqb5vhz2i7bRo5RtyjqOD06zoVCuipnW2UmGI
         vHGhbh7EBkONk87XRrCUaXc5VC86K4pv1WRpC9VRtGOJvOxdzBUfQV54YZ6c7Qdvdrj0
         thf84Ai47p4motV6Vbp/nXRmf+9sX6tdUXmrw3+ur57iBuDyjT6B+O4KMKX0zujAQuh8
         M+tPhZPjm6slyI/bVRZdc4gDx2XldTECQV5Ja7KX8c3VqWdC6fU1n1O7ihBxehC7mre4
         Bu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723633589; x=1724238389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37k6zoJGI4ySfWeQa+WNWY1gPNVBQcPCdoUsogardSg=;
        b=H0LPdOTIiXP9Hc8DQVtsaWyNBZp8FnB7ABj8Zk5/1ujK0yNXU3QYHLXeCXonlvQMsH
         vHzQNx3QO6lU8S2vmL+ybNy6MpbZl2IAl1+AYT/Y4aURDuBMr3o0Nw6g1x8KUQfTj1LF
         vxGmx0t7W4nzmtcrK7RWkXWpYYh4Yuukx3OzVoYwUes/3SHOPrl0VUeO7FozuFngRYb8
         SvjC/rnZZE4PyOFTLmVTEUI9hY3hczWY6N1C69e7RM5WYGoj7r4OisbSouyawrPcwsB5
         qGRT0+G0FjJsCNhgV+zHOC+JlrhwYLmxg+JMdzEJ2p7uUi6syJtsx1ziZbr+OFWfJFcq
         YKEA==
X-Forwarded-Encrypted: i=1; AJvYcCVrzIgSBX8eKq+Ch0gc9rB59lVNfG03EWeWfkz9ZFGGcu1IUmww5LBU7Tduzcy4ymc9mcRLZmhwocDhqgcJHKlHVjIX947v
X-Gm-Message-State: AOJu0YxS9ea3NMnf3M/qJVJP/JGFLq33UcdvKENwPTgjeBoPG6JLQsI/
	0SYely2NORjFNb5uJ58fjQBPebjuoIc25RX4cx5XIKcLDhHSj5ptBDlgYk5+RNjJJOvpZ2/7leu
	jyqUcKRqfo5wuq9Xcpl2Lz/SThgg=
X-Google-Smtp-Source: AGHT+IFxno9/G65dhVjx9wlF+xu4tEDdgzUpJUbvbTdDjN+mgCawXy6DPLVolNNzGcxoDLTcEYyfGJZYqxfZiWA7z2c=
X-Received: by 2002:a17:907:c8a0:b0:a7a:b73f:7582 with SMTP id
 a640c23a62f3a-a8366c120e5mr172158566b.2.1723633589129; Wed, 14 Aug 2024
 04:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407301049.5051dc19-oliver.sang@intel.com> <193e302c-4401-4756-a552-9f1e07ecedcf@redhat.com>
 <439265d8-e71e-41db-8a46-55366fdd334e@intel.com> <90477952-fde2-41d7-8ff4-2102c45e341d@redhat.com>
 <6uxnuf2gysgabyai2r77xrqegb7t7cc2dlzjz6upwsgwrnfk3x@cjj6on3wqm4x>
 <5a67c103-1d9d-440d-8bed-bbfa7d3ecf71@redhat.com> <CAGudoHH4NGgPdTe2yL33TNNFriPM9mVM=0_iuh5dLuesZXQMAQ@mail.gmail.com>
 <5c0979a2-9a56-4284-82d2-42da62bda4a5@redhat.com> <c7e0d029-0a64-4b27-bd62-cf9a3577d7ff@intel.com>
 <wbbieqyyjqy7ulbta6muzepxwxi6galwvhjdxpqaqbeljzpcer@dpeoqrbkl5p2>
 <817150f2-abf7-430f-9973-540bd6cdd26f@intel.com> <CAGudoHG1=p0GEVaSASA1C+iVYbfA5rryozAPPEoxr5uKtM=ghw@mail.gmail.com>
 <f4ddda8d-3513-4471-8609-acb3ce29219e@intel.com> <CAGudoHECfSYd7EcxiY+soh157m9H4xfU1en=TgX_=QkpbsOFdg@mail.gmail.com>
 <116e117c-2821-401d-8e62-b85cdec37f4a@redhat.com>
In-Reply-To: <116e117c-2821-401d-8e62-b85cdec37f4a@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 14 Aug 2024 13:06:16 +0200
Message-ID: <CAGudoHGzNu4MUDyd1OeP+R=TdOzO6Nidk26_hrinBncz6FpGvw@mail.gmail.com>
Subject: Re: [linus:master] [mm] c0bff412e6: stress-ng.clone.ops_per_sec -2.9% regression
To: David Hildenbrand <david@redhat.com>
Cc: Yin Fengwei <fengwei.yin@intel.com>, kernel test robot <oliver.sang@intel.com>, 
	Peter Xu <peterx@redhat.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Matthew Wilcox <willy@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org, 
	ying.huang@intel.com, feng.tang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 11:45=E2=80=AFAM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 14.08.24 06:10, Mateusz Guzik wrote:
> > On Wed, Aug 14, 2024 at 5:02=E2=80=AFAM Yin Fengwei <fengwei.yin@intel.=
com> wrote:
> >>
> >> On 8/13/24 03:14, Mateusz Guzik wrote:
> >>> would you mind benchmarking the change which merely force-inlines _co=
mpund_page?
> >>>
> >>> https://lore.kernel.org/linux-mm/66c4fcc5-47f6-438c-a73a-3af6e19c3200=
@redhat.com/
> >> This change can resolve the regression also:
> >
> > Great, thanks.
> >
> > David, I guess this means it would be fine to inline the entire thing
> > at least from this bench standpoint. Given that this is your idea I
> > guess you should do the needful(tm)? :)
>
> Testing
>
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 5769fe6e4950..25e25b34f4a0 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -235,7 +235,7 @@ static __always_inline int page_is_fake_head(const st=
ruct page *page)
>          return page_fixed_fake_head(page) !=3D page;
>   }
>
> -static inline unsigned long _compound_head(const struct page *page)
> +static __always_inline unsigned long _compound_head(const struct page *p=
age)
>   {
>          unsigned long head =3D READ_ONCE(page->compound_head);
>
>
> With a kernel-config based on something derived from Fedora
> config-6.8.9-100.fc38.x86_64 for convenience with
>
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=3Dy
>
> add/remove: 15/14 grow/shrink: 79/87 up/down: 12836/-13917 (-1081)
[snip]
> Total: Before=3D32786363, After=3D32785282, chg -0.00%

I guess there should be no opposition then?

Given that this is your patch I presume you are going to see this through.

I don't want any mention or cc on the patch, thanks for understanding :)

--=20
Mateusz Guzik <mjguzik gmail.com>
