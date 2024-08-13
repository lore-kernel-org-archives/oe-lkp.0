Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B2D47F5B
	for <oe-lkp@lists.linux.dev>; Tue, 13 Aug 2024 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723533259; cv=none; b=B+900ZDXKCt/KtAdIhVZd7PHESxsqjWt075Zm7MXfJzqmm07iuMPYUJhHeE6jcm1BU8/NUCzi2NhF50Q+IjZfXiFJz7VnkaZbpWEB5vfrA9m9SljKnwXsJm7Ct7n0Y1IUtjYDiu2djHd87WtPZswWadVjdhoXWPZ8cyqNkuuXFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723533259; c=relaxed/simple;
	bh=uj/oOXaufCtIi6AXT1hGaE54GfqBdQ9mROxzHsrl6Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBMmwoM/W996GECGTsUcz3o1aGBn4aZJNGZxG7be5T4ynt7dZx+/dc0NfsxOX0oCG0FpLcguYdACQridSmX6p/4NF3qwo3m4lXqiH6tM8f2bywxexryTK6ro16U1AognkYsqJt5DJKBxUxc0bncWrcSkng1a5r6ywmoELr2++bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HczhHuSa; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HczhHuSa"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a80eab3945eso119385866b.1
        for <oe-lkp@lists.linux.dev>; Tue, 13 Aug 2024 00:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723533256; x=1724138056; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyz3DK8dqgTmgnmWwpr2k8InrcG4osaLvAAxFacRPCg=;
        b=HczhHuSa577CWtlwmx0rNj5PJO1lYuAyMcHbhjr6ayUTzsVo2GhCcGxlZ0NOjrOd0e
         nZMk8SxRPflKNlrt5VRa66+i1QpSlMJ4fLPBD1BRfzGkzsUfEZZyq3kf1fIW2ydEZ3Ja
         0bezlspUU98QwRC4KCH6Thc9JV7O1uUDUifmPDeOEsZqo9H5F9cgjIOu3u380pofVmbX
         cDjIkrgRnMPy0bQ7uKlUYVPj2OTUHs9LNiAOsVXr+XnUTuTEEP1gD5qIyYN2BN5s6EJk
         oRhuaT9MsFKvv5zzQL1A++wEh71SvESzk52DdgoajXfIprI1lBy9EwdSxCJanSdtfDak
         MUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723533256; x=1724138056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyz3DK8dqgTmgnmWwpr2k8InrcG4osaLvAAxFacRPCg=;
        b=JOMfZmXOWwe1uVNRRyv9xN+ZLel/R5tTcA5lbshvT7aPnPll53G2hq5AiJBXyEXxfS
         lh2aK2U0N3yHG5mziaS/9UmREb2M6ykaREDrquXRLJW3ebLTkINNyM2hx8nP8hc+WfxZ
         IMXbK1u8PI0D0P9pdFxsyBZYf0I4N4whzDTUf8lliZb5aB1dGlcYBoxIp8T3yDyLRd3a
         Mr+U3ETPF4rbG/lIq0aKssWTBjJP4/zP6crnvOp6bSDKOjhzQV9ip3UmMyaL7It0TYw3
         hyTgY0hZNBdCsMPoOFbWpl0XDvZ3wCm5bmg02oK0IY5ml+q75MiOnQw0YtmaKW48OvGa
         MWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM2pFnAL5hnYrXOkFZyJNvig5wJQSXmR8hYl0hZLGWVYW7IxlGtmQJu6bOUohGQgdPi3WD3azHh5qMpBZT7UvjzpDuyeiZ
X-Gm-Message-State: AOJu0YxvbbZPmdEeJz0jYCCZKRGdpkWvMyYQZzzVKAYrwBLihhGpf3WX
	/DWrcjRKBSgzqV61ElfiLqZi35cpO+gZbrwo/i22ME0JPMd/Bt7MGHiQERIFMkRVsw/rbj15zR2
	zSFXMW9ZP2heRP3dAaUzV6sqpZJY=
X-Google-Smtp-Source: AGHT+IEC6XO8vsLlXfWHSMDSyKsREiX+qwPLaicCQ1BlMeJyYZyVAL5hPQq9CLrVz05m6L+b8AKGJ/S4ZxgHnzO/6U8=
X-Received: by 2002:a17:907:2d09:b0:a7d:34bf:600e with SMTP id
 a640c23a62f3a-a80ed2d7c6fmr136669266b.60.1723533255327; Tue, 13 Aug 2024
 00:14:15 -0700 (PDT)
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
 <wbbieqyyjqy7ulbta6muzepxwxi6galwvhjdxpqaqbeljzpcer@dpeoqrbkl5p2> <817150f2-abf7-430f-9973-540bd6cdd26f@intel.com>
In-Reply-To: <817150f2-abf7-430f-9973-540bd6cdd26f@intel.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 13 Aug 2024 09:14:03 +0200
Message-ID: <CAGudoHG1=p0GEVaSASA1C+iVYbfA5rryozAPPEoxr5uKtM=ghw@mail.gmail.com>
Subject: Re: [linus:master] [mm] c0bff412e6: stress-ng.clone.ops_per_sec -2.9% regression
To: Yin Fengwei <fengwei.yin@intel.com>
Cc: David Hildenbrand <david@redhat.com>, kernel test robot <oliver.sang@intel.com>, 
	Peter Xu <peterx@redhat.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Matthew Wilcox <willy@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org, 
	ying.huang@intel.com, feng.tang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 9:09=E2=80=AFAM Yin Fengwei <fengwei.yin@intel.com>=
 wrote:
>
> On 8/12/24 00:49, Mateusz Guzik wrote:
> > On Mon, Aug 12, 2024 at 12:43:08PM +0800, Yin Fengwei wrote:
> >> Hi David,
> >>
> >> On 8/1/24 09:44, David Hildenbrand wrote:
> >>> On 01.08.24 15:37, Mateusz Guzik wrote:
> >>>> On Thu, Aug 1, 2024 at 3:34=E2=80=AFPM David Hildenbrand <david@redh=
at.com>
> >>>> wrote:
> >>>>>
> >>>>> On 01.08.24 15:30, Mateusz Guzik wrote:
> >>>>>> On Thu, Aug 01, 2024 at 08:49:27AM +0200, David Hildenbrand wrote:
> >>>>>>> Yes indeed. fork() can be extremely sensitive to each
> >>>>>>> added instruction.
> >>>>>>>
> >>>>>>> I even pointed out to Peter why I didn't add the
> >>>>>>> PageHuge check in there
> >>>>>>> originally [1].
> >>>>>>>
> >>>>>>> "Well, and I didn't want to have runtime-hugetlb checks in
> >>>>>>> PageAnonExclusive code called on certainly-not-hugetlb code paths=
."
> >>>>>>>
> >>>>>>>
> >>>>>>> We now have to do a page_folio(page) and then test for hugetlb.
> >>>>>>>
> >>>>>>>        return folio_test_hugetlb(page_folio(page));
> >>>>>>>
> >>>>>>> Nowadays, folio_test_hugetlb() will be faster than at
> >>>>>>> c0bff412e6 times, so
> >>>>>>> maybe at least part of the overhead is gone.
> >>>>>>>
> >>>>>>
> >>>>>> I'll note page_folio expands to a call to _compound_head.
> >>>>>>
> >>>>>> While _compound_head is declared as an inline, it ends up being bi=
g
> >>>>>> enough that the compiler decides to emit a real function instead a=
nd
> >>>>>> real func calls are not particularly cheap.
> >>>>>>
> >>>>>> I had a brief look with a profiler myself and for single-threaded =
usage
> >>>>>> the func is quite high up there, while it manages to get out with =
the
> >>>>>> first branch -- that is to say there is definitely performance los=
t for
> >>>>>> having a func call instead of an inlined branch.
> >>>>>>
> >>>>>> The routine is deinlined because of a call to page_fixed_fake_head=
,
> >>>>>> which itself is annotated with always_inline.
> >>>>>>
> >>>>>> This is of course patchable with minor shoveling.
> >>>>>>
> >>>>>> I did not go for it because stress-ng results were too unstable fo=
r me
> >>>>>> to confidently state win/loss.
> >>>>>>
> >>>>>> But should you want to whack the regression, this is what I would =
look
> >>>>>> into.
> >>>>>>
> >>>>>
> >>>>> This might improve it, at least for small folios I guess:
> >> Do you want us to test this change? Or you have further optimization
> >> ongoing? Thanks.
> >
> > I verified the thing below boots, I have no idea about performance. If
> > it helps it can be massaged later from style perspective.
> >
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index 5769fe6e4950..2d5d61ab385b 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -194,34 +194,13 @@ enum pageflags {
> >   #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
> >   DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
> >
> > -/*
> > - * Return the real head page struct iff the @page is a fake head page,=
 otherwise
> > - * return the @page itself. See Documentation/mm/vmemmap_dedup.rst.
> > - */
> > +const struct page *_page_fixed_fake_head(const struct page *page);
> > +
> >   static __always_inline const struct page *page_fixed_fake_head(const =
struct page *page)
> >   {
> >       if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
> >               return page;
> > -
> > -     /*
> > -      * Only addresses aligned with PAGE_SIZE of struct page may be fa=
ke head
> > -      * struct page. The alignment check aims to avoid access the fiel=
ds (
> > -      * e.g. compound_head) of the @page[1]. It can avoid touch a (pos=
sibly)
> > -      * cold cacheline in some cases.
> > -      */
> > -     if (IS_ALIGNED((unsigned long)page, PAGE_SIZE) &&
> > -         test_bit(PG_head, &page->flags)) {
> > -             /*
> > -              * We can safely access the field of the @page[1] with PG=
_head
> > -              * because the @page is a compound page composed with at =
least
> > -              * two contiguous pages.
> > -              */
> > -             unsigned long head =3D READ_ONCE(page[1].compound_head);
> > -
> > -             if (likely(head & 1))
> > -                     return (const struct page *)(head - 1);
> > -     }
> > -     return page;
> > +     return _page_fixed_fake_head(page);
> >   }
> >   #else
> >   static inline const struct page *page_fixed_fake_head(const struct pa=
ge *page)
> > @@ -235,7 +214,7 @@ static __always_inline int page_is_fake_head(const =
struct page *page)
> >       return page_fixed_fake_head(page) !=3D page;
> >   }
> >
> > -static inline unsigned long _compound_head(const struct page *page)
> > +static __always_inline unsigned long _compound_head(const struct page =
*page)
> >   {
> >       unsigned long head =3D READ_ONCE(page->compound_head);
> >
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 829112b0a914..3fbc00db607a 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -19,6 +19,33 @@
> >   #include <asm/tlbflush.h>
> >   #include "hugetlb_vmemmap.h"
> >
> > +/*
> > + * Return the real head page struct iff the @page is a fake head page,=
 otherwise
> > + * return the @page itself. See Documentation/mm/vmemmap_dedup.rst.
> > + */
> > +const struct page *_page_fixed_fake_head(const struct page *page)
> > +{
> > +     /*
> > +      * Only addresses aligned with PAGE_SIZE of struct page may be fa=
ke head
> > +      * struct page. The alignment check aims to avoid access the fiel=
ds (
> > +      * e.g. compound_head) of the @page[1]. It can avoid touch a (pos=
sibly)
> > +      * cold cacheline in some cases.
> > +      */
> > +     if (IS_ALIGNED((unsigned long)page, PAGE_SIZE) &&
> > +         test_bit(PG_head, &page->flags)) {
> > +             /*
> > +              * We can safely access the field of the @page[1] with PG=
_head
> > +              * because the @page is a compound page composed with at =
least
> > +              * two contiguous pages.
> > +              */
> > +             unsigned long head =3D READ_ONCE(page[1].compound_head);
> > +
> > +             if (likely(head & 1))
> > +                     return (const struct page *)(head - 1);
> > +     }
> > +     return page;
> > +}
> > +
> >   /**
> >    * struct vmemmap_remap_walk - walk vmemmap page table
> >    *
> >
>
> The change can resolve the regression (from -3% to 0.5%):
>

thanks for testing

would you mind benchmarking the change which merely force-inlines _compund_=
page?

https://lore.kernel.org/linux-mm/66c4fcc5-47f6-438c-a73a-3af6e19c3200@redha=
t.com/

> Please note:
>    9cb28da54643ad464c47585cd5866c30b0218e67 is the parent commit
>    3f16e4b516ef02d9461b7e0b6c50e05ba0811886 is the commit with above
>                                             patch
>    c0bff412e67b781d761e330ff9578aa9ed2be79e is the commit which
>                                             introduced regression
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/nr_threads/testtime/test/cpuf=
req_governor/debug-setup:
>
> lkp-icl-2sp8/stress-ng/debian-12-x86_64-20240206.cgz/x86_64-rhel-8.3/gcc-=
12/100%/60s/clone/performance/yfw_test2
>
> commit:
>    9cb28da54643ad464c47585cd5866c30b0218e67
>    3f16e4b516ef02d9461b7e0b6c50e05ba0811886
>    c0bff412e67b781d761e330ff9578aa9ed2be79e
>
> 9cb28da54643ad46 3f16e4b516ef02d9461b7e0b6c5 c0bff412e67b781d761e330ff95
> ---------------- --------------------------- ---------------------------
>         fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
>             |             |             |             |             |
>            3:3            0%           3:3            0%           3:3
>    stress-ng.clone.microsecs_per_clone.pass
>            3:3            0%           3:3            0%           3:3
>    stress-ng.clone.pass
>           %stddev     %change         %stddev     %change         %stddev
>               \          |                \          |                \
>        2904            -0.6%       2886            +3.7%       3011
>    stress-ng.clone.microsecs_per_clone
>      563520            +0.5%     566296            -3.1%     546122
>    stress-ng.clone.ops
>        9306            +0.5%       9356            -3.0%       9024
>    stress-ng.clone.ops_per_sec
>
>
> BTW, the change needs to export symbol _page_fixed_fake_head otherwise
> some modules hit build error.
>

ok, I'll patch that up if this approach will be the thing to do

--=20
Mateusz Guzik <mjguzik gmail.com>
