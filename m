Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF8183CC5
	for <oe-lkp@lists.linux.dev>; Thu,  1 Aug 2024 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722519462; cv=none; b=RpvYPaPYAOP+yd1yd4RkqwQjHspnmg/LNcAEpzZHwsRdDdipXe/YedMXheg1lAal7B/LZyddngL9kVJQtXgvHU6WTeMi6gH9ekDDu6tm3TnqXAKsaySMV53wJX9M24U8SecmvFnncvjIv/BqdCpAzzG+h/iQq0Q9040WAN0KKxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722519462; c=relaxed/simple;
	bh=1nlM8D+ejojDkFR9ik7oR51jAClmQAousUOI6P/ZAy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X52p8MSMEak+qEyzd1KtrbC4RZQEtk0Hpl3vGFVpsgvZ+jmx+zUFgmxPQvmSOoNbv1ofQyxZPpT+19uefQJgj0YdZgHmqlI0bTneQ88rkysvjocvgRM0Wm+CCB5PncoOQ8j0IlVa6SW7ijDhKekuMI2wjSaIQnKRSta4NuNBiz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4X0qhLm; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4X0qhLm"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc346ceso9843365a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 01 Aug 2024 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722519459; x=1723124259; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MJGq9K50tWQqmXkPFfvIuTp2wsCjmWRK4EiU3yCi8g=;
        b=Z4X0qhLma1elRRPr+gYBnuAanUQw9/uWekvMYI5p9d0+vTCM45ibbhHAJ/cBjlNC8I
         K0poeB8lsmxl0TdA4Q3k1HVFtZPR9TzJiwWFDexNud0jx5kXos802cjKcGVU/qvpFLug
         pC3M6mZcCRaEceAtRg/TewCUMITDyxmwlxUIO7UWeUFXlLmOu5mAKs/sdC3my2UwUSLE
         qe0Ge+3+AtxTQ92/mDi1V2XYftU4DQfvn/TjtsLeCGmErnY4CDpns/MVENH4k0dfny9Z
         DR6u48Heb3aG60VN3nEMfcP+RL6+3hI0gxjlZNnGqGEp+DUxWZcfr/cduoCtE18PCWzZ
         cxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722519459; x=1723124259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MJGq9K50tWQqmXkPFfvIuTp2wsCjmWRK4EiU3yCi8g=;
        b=GBFws+O+Kv3HaSR0fmBe0cyTeLbQWGAFVxZT8bzXFHEwL1KCjmT4kSCrtdZiut4Bbp
         AZgLFyNGbEOfNU+CP7SZ++XQKLhV6TxoCs69mCKCozKTpDw+EW+j/9ITCdqvewt4/Lfe
         5T5mkVuxGcjhpd/vNk0TXAY9lxcl5fjkxV1cGu+panoo+PrzWp7d+8+xSMhOQUB6Hl86
         yJpFN2NGharkY7RUC71NBhNKx8q/nqmVMtu4b9OYCMSqUSLGPgkpZKPoxCnXcs+hGsxT
         rfzb3gSYY1ZFpgWTb2GfMBe+GSnlbz1dcT0Xt54nCCt6tb2C4vEGqD45OVq9PzhmQb0C
         EBPA==
X-Forwarded-Encrypted: i=1; AJvYcCWalrm8liIXScMbSNiHqgW2L84j48J8zZHe8in17NcFwBifJiZCMvcf/FpB67o0CjSyNg8YGgn40W9z4draqyjfxii7/LXQ
X-Gm-Message-State: AOJu0Yw2cC2/er2eBMmpxaHVMXjTW16L6rLMtDuQVQM15/4WYnZirSA9
	DoI7QcwRuu5/cIhQe+RIYwvT2wQ6lDiOh+8nO0Ax8s1sYQO7V+C96gYPy8bCFKBL1T5HOm5TM3h
	gL0HGf/eD3izzUE/CsThHT5MrTK8=
X-Google-Smtp-Source: AGHT+IFvvHRv7PGT4EkPAH/+ZprZ5eQncaACyC1qBnx9bkqUCl/jQLddYQKFDWzGGuy8yHz0oezB7mTPpyzOtIZidgg=
X-Received: by 2002:a17:907:1c16:b0:a7a:a06b:eec9 with SMTP id
 a640c23a62f3a-a7dc4db9ef1mr15331666b.4.1722519458457; Thu, 01 Aug 2024
 06:37:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407301049.5051dc19-oliver.sang@intel.com> <193e302c-4401-4756-a552-9f1e07ecedcf@redhat.com>
 <439265d8-e71e-41db-8a46-55366fdd334e@intel.com> <90477952-fde2-41d7-8ff4-2102c45e341d@redhat.com>
 <6uxnuf2gysgabyai2r77xrqegb7t7cc2dlzjz6upwsgwrnfk3x@cjj6on3wqm4x> <5a67c103-1d9d-440d-8bed-bbfa7d3ecf71@redhat.com>
In-Reply-To: <5a67c103-1d9d-440d-8bed-bbfa7d3ecf71@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 1 Aug 2024 15:37:26 +0200
Message-ID: <CAGudoHH4NGgPdTe2yL33TNNFriPM9mVM=0_iuh5dLuesZXQMAQ@mail.gmail.com>
Subject: Re: [linus:master] [mm] c0bff412e6: stress-ng.clone.ops_per_sec -2.9% regression
To: David Hildenbrand <david@redhat.com>
Cc: "Yin, Fengwei" <fengwei.yin@intel.com>, kernel test robot <oliver.sang@intel.com>, 
	Peter Xu <peterx@redhat.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Matthew Wilcox <willy@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org, 
	ying.huang@intel.com, feng.tang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 3:34=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 01.08.24 15:30, Mateusz Guzik wrote:
> > On Thu, Aug 01, 2024 at 08:49:27AM +0200, David Hildenbrand wrote:
> >> Yes indeed. fork() can be extremely sensitive to each added instructio=
n.
> >>
> >> I even pointed out to Peter why I didn't add the PageHuge check in the=
re
> >> originally [1].
> >>
> >> "Well, and I didn't want to have runtime-hugetlb checks in
> >> PageAnonExclusive code called on certainly-not-hugetlb code paths."
> >>
> >>
> >> We now have to do a page_folio(page) and then test for hugetlb.
> >>
> >>      return folio_test_hugetlb(page_folio(page));
> >>
> >> Nowadays, folio_test_hugetlb() will be faster than at c0bff412e6 times=
, so
> >> maybe at least part of the overhead is gone.
> >>
> >
> > I'll note page_folio expands to a call to _compound_head.
> >
> > While _compound_head is declared as an inline, it ends up being big
> > enough that the compiler decides to emit a real function instead and
> > real func calls are not particularly cheap.
> >
> > I had a brief look with a profiler myself and for single-threaded usage
> > the func is quite high up there, while it manages to get out with the
> > first branch -- that is to say there is definitely performance lost for
> > having a func call instead of an inlined branch.
> >
> > The routine is deinlined because of a call to page_fixed_fake_head,
> > which itself is annotated with always_inline.
> >
> > This is of course patchable with minor shoveling.
> >
> > I did not go for it because stress-ng results were too unstable for me
> > to confidently state win/loss.
> >
> > But should you want to whack the regression, this is what I would look
> > into.
> >
>
> This might improve it, at least for small folios I guess:
>
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 5769fe6e4950..7796ae116018 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -1086,7 +1086,7 @@ PAGE_TYPE_OPS(Zsmalloc, zsmalloc, zsmalloc)
>    */
>   static inline bool PageHuge(const struct page *page)
>   {
> -       return folio_test_hugetlb(page_folio(page));
> +       return PageCompound(page) && folio_test_hugetlb(page_folio(page))=
;
>   }
>
>   /*
>
>
> We would avoid the function call for small folios.
>

why not massage _compound_head back to an inlineable form instead? for
all i know you may even register a small win in total

--=20
Mateusz Guzik <mjguzik gmail.com>
