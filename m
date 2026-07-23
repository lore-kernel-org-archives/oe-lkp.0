Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785AA41A51B
	for <oe-lkp@lists.linux.dev>; Thu, 23 Jul 2026 20:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784838901; cv=pass; b=tLRQ4hsQFKApwKut/xAEaQd8KY+qA0N9iFjvcax+WlMAMfpLbw5bI31/nQZeWh9obxUC+lrW63K08Al4yZ/Zb/Np8NsihTzcK2ym8101DnX89Sv3m8oQUKGCeE0N6VtOEXxshzU2Z2CLuQgyBg4DsOToWWLxIpv9u9PwDWy+6o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784838901; c=relaxed/simple;
	bh=R3ZBRQeLdAV+uLNkFaWvtnsFjrlD96P8SX9cas7gHFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWTIzjSTfic8di0hNmuhBLA3MAbcne4E4aw4CHhNdaCJRtnKTqDj9OrVfnqhxJ2oWNPm2fUvc07iJs4VilkIovbmw/auU3lOlMu2O1p2gi7kPKR33UNcht+MoRyZCqJU7zlQxIILL3leetEiHpiMK9DT09Xa5gp4zEpJrqHof3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hrqgR3rB; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hrqgR3rB"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso2487e87.0
        for <oe-lkp@lists.linux.dev>; Thu, 23 Jul 2026 13:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784838892; cv=none;
        d=google.com; s=arc-20260327;
        b=NtHHB2pM88PWpQw/BYwyjxI9Uc17UmG4NlBs2oqoL76jwSmFTNvcZBcy4GvLilJpWn
         /Ji8M35dN1ylx/OCEQWIpgrlRdWEe5G8nRft7lKkQnDyBWN5wpg4NnswbfPgL7UkKIjF
         NqW5ZUC7uZKTePwA9KxWf0NKiwmcwRNTSX/cdiZCA+ADixS6sc+V52ZZQ710TABGvIjC
         zrFQ3zmK+RyE0LAYoh+rTZK8tuvugnx+5kFPKG5+pF0oyi3LF4GfV6Y7r5QC/6NMsut3
         f2gbNVR2JnYZXJt8eVFX+pGxND5SlavCIl7Enx2VZp8hocn3gY+VVT+41nbqj3oEy88X
         PnHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kEd5Z19QO9gSWI1pJHRYKW58SP1uRktgGVYqFC8ZvOg=;
        fh=1XAwqKipRwo/8v7BpmGhgCYDOFqVzcSHX7w2E65pNvI=;
        b=k7hIOweUQyKM8wRHyX9XeYLUOiQnYCZRUhX/Id1oNd0F02vpw3jLVaKyENh87Xf/FL
         2xcDWDU5r+ZCGOoXUtf5GjYGtdXlNHRxEdRg1r/IonLq4Xv/BXlVDWtabqiB2FhNhltC
         YY58CCavBURe2hg0k0CAgKyP6neEh7D+dqjRhj+y4ZaaIXEyvXWY5c0UgFCuCI/UZx8k
         S4Tmn+14eW4B31SMdCYTNhkxBnSO4ovT9+Ap3naHi3ovh3MQ5q9+8NI4b/St9J2QXj/F
         c25kqhzVH0ZTO1NsT6lvOk68c79mY3KcgA9rLqjwbGGUTvARsHBpyV698ZfPTWD/iBQT
         fLnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784838892; x=1785443692; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEd5Z19QO9gSWI1pJHRYKW58SP1uRktgGVYqFC8ZvOg=;
        b=hrqgR3rBj8WBQBiAnuf20oQuTabK0+e5bBOtB53YiuATHdCyePgnIgoe8RdtLg9seI
         qlmQnuNGIEXDzdAwxMYaTWl/v2C89iHu8rky2N705HCmKwnF4RLqP1987dUfftULnakp
         HufBe+t3PEhr6taVmd3Z5xOPhxPsnvhGCLZ4Yr/Pqa5glCjlSUjmVoJVuPDVOTciZRAl
         eOh/uJ9kOpfXo5JydYrVnLx5fT/xQMAtbw4gXa/95kEPRa2TTGJ2ChrY+3FnXmrYNLYw
         4aA79A9vNx0yIfMXVRM5od+MpjwDxqkst1+e13Ok+QcXf0N/Bq1tz9b/pQPwH7N/FQUD
         q0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784838892; x=1785443692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEd5Z19QO9gSWI1pJHRYKW58SP1uRktgGVYqFC8ZvOg=;
        b=YQiqPt5yqOamKFcms2ZXcU6eH4OQw4W6odX34u/EXMkNB7GZ1z6LpbNcUnpCucah4O
         DHVAO4Rd6CTBpmBu8/+NMr55yxjDXpx1mEqdAgbhqMfI49V7kGDs/m4cN0HNY6gh59IL
         aigg3/OV/XZC6zMjFGE1eR4Vx2xb9DDpGpSiQtQIB2EYUV1JZnj02yMLX14lvuwBKG+q
         j1Ul9L8T6xi7JIUvHkr2AvtBFuLAsrO5MQBXSk/rBCsK/9yWmKYDCntSfHurYLz7WnS+
         odEW3Ru9gxLTY/yhT2W8OpNCFuN8U+H0XmAGgpcb9yRVKk64VvC9bc5NZaU5t0V1iC9p
         uxTg==
X-Forwarded-Encrypted: i=1; AHgh+RpHFAprhsTVeO5lweocNgVShrL7kN8XZrIloue9QygFOEQ11Kx1n0GWwkyVuVjchu24YkZSn+g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt3EWr8X4N0HeG8ZdF4of7soryNXWWOeBotpZBTFyDDSDtm0/6
	hROVWq6/AVeQMgsCRsRUaBPjFVj7ICHBD2/MCS0ZYzda9wrgniniwB82jlIgHZi/GPADfMZB0hw
	ExdVoKXGrirNFSKhlQFutBk3lj3ERwS6nqseuVm2UroEOos5tqjygmqxmrvk=
X-Gm-Gg: AR+sD122k61eK9OtNJ4RuSUTBppHz9lUi/UEzlEx3pEcAP7JmJyhQZ/se+7YcVqrZOS
	bmvIyVB519A9rPt5LXxZEUxxRoxiGjcUvtJeZQvsBKwl/xiSjg+BXCPY6lz0yJKp9lE1zDYi5n2
	gqHTpIhHHPTiWYRlA1JWxUF4FmI6dDwNox71STOpazt1f0VVrYERx6Ynobzw67W4fx4jM6EM3qa
	aw2DJs4t46dKPKCZtwpNEyHeQdSg1xo59ndIPYxrZIcvXGIvATq/jcdPSJS4/p3gvoiAFDRCzQB
	wItxNgxAg1cwGbA=
X-Received: by 2002:a05:6512:2256:b0:5aa:79d6:b559 with SMTP id
 2adb3069b0e04-5b2b831579fmr41528e87.0.1784838891615; Thu, 23 Jul 2026
 13:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606181547.617a6967-lkp@intel.com> <20260723024527.2822383-1-zhangbo56@xiaomi.com>
In-Reply-To: <20260723024527.2822383-1-zhangbo56@xiaomi.com>
From: Frederick Mayle <fmayle@google.com>
Date: Thu, 23 Jul 2026 13:34:38 -0700
X-Gm-Features: AUfX_my81u5Yiwnp3_sx2Jz9uaienneHL8ShgZjQXkoLqlzrqkAMEhV1zQf24kc
Message-ID: <CAHCxdc64d-6qNBwwSZX8mdz4-V+88No2x0wG4mex5WPXBDE9AA@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 7b32f64bc5: pts.svt-av1.Preset13.Bosphorus4K.frames_per_second
 45.8% regression
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: oliver.sang@intel.com, jack@suse.cz, akpm@linux-foundation.org, 
	david@kernel.org, kaleshsingh@google.com, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, lkp@intel.com, oe-lkp@lists.linux.dev, 
	surenb@google.com, willy@infradead.org, baohua@kernel.org, 
	zhangbo56 <zhangbo56@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 7:46=E2=80=AFPM Bo Zhang <zhangbo0325@gmail.com> wr=
ote:
>
> From: zhangbo56 <zhangbo56@xiaomi.com>
>
> On Thu 18-06-26 16:00:42, kernel test robot wrote:
> > kernel test robot noticed a 45.8% regression of
> > pts.svt-av1.Preset13.Bosphorus4K.frames_per_second on:
> >
> > commit: 7b32f64bc512b40b268776c5ac4d354b325b3197
> > ("mm: limit filemap_fault readahead to VMA boundaries")
> >
> >     169.95 +/- 6%     -45.8%      92.15 +/- 10%  pts.svt-av1.Preset13.B=
osphorus4K.frames_per_second
> >     220.57 +/- 3%    +870.9%       2141        pts.time.major_page_faul=
ts
>
> Hi Oliver,
>
> Could you help test if the below patch fixes the regression?
>
> The 870% increase in major faults suggests that readahead is being cut
> short too aggressively. The current approach unconditionally sets
> _max_index on every fault, which likely prevents readahead from
> prefetching ahead effectively for sequential access patterns.
>
> The fix: only limit readahead when the fault is close to the VMA end --
> if there are fewer pages remaining in the VMA than ra_pages, set
> _max_index. Otherwise, do nothing.
>
> For a 4MB VMA with ra_pages=3D32, only faults in the last 32 pages (128KB=
)
> trigger the limit. The other 99.9% of faults see no change at all.
>
> Similarly, only clamp the read-around start when the fault is near the
> VMA beginning.
>
> This applies on top of 7b32f64bc512 and can be applied with git am.
>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> ---
>  mm/filemap.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 97772a05a18e..9f1e1c9ea6df 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3313,8 +3313,11 @@ static struct file *do_sync_mmap_readahead(struct =
vm_fault *vmf)
>         vm_flags_t vm_flags =3D vmf->vma->vm_flags;
>         bool force_thp_readahead =3D false;
>         unsigned short mmap_miss;
> +       unsigned long vma_end_pgoff =3D vmf->vma->vm_pgoff + vma_pages(vm=
f->vma);
> +       unsigned long vma_pages_left =3D vma_end_pgoff - vmf->pgoff;
>
> -       ractl._max_index =3D vmf->vma->vm_pgoff + vma_pages(vmf->vma) - 1=
;
> +       if (vma_pages_left < ra->ra_pages)
> +               ractl._max_index =3D vma_end_pgoff - 1;
>
>         /* Use the readahead code, even if readahead is disabled */
>         if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
> @@ -3398,7 +3401,8 @@ static struct file *do_sync_mmap_readahead(struct v=
m_fault *vmf)
>                  * mmap read-around
>                  */
>                 ra->start =3D max_t(long, 0, vmf->pgoff - ra->ra_pages / =
2);
> -               ra->start =3D max(ra->start, vmf->vma->vm_pgoff);
> +               if (vmf->pgoff - vmf->vma->vm_pgoff < ra->ra_pages / 2)
> +                       ra->start =3D max(ra->start, vmf->vma->vm_pgoff);
>                 ra->size =3D ra->ra_pages;
>                 ra->async_size =3D ra->ra_pages / 4;
>                 ra->order =3D 0;
> @@ -3441,7 +3445,12 @@ static struct file *do_async_mmap_readahead(struct=
 vm_fault *vmf,
>         }
>
>         if (folio_test_readahead(folio)) {
> -               ractl._max_index =3D vmf->vma->vm_pgoff + vma_pages(vmf->=
vma) - 1;
> +               unsigned long vma_end_pgoff =3D vmf->vma->vm_pgoff +
> +                                            vma_pages(vmf->vma);
> +               unsigned long vma_pages_left =3D vma_end_pgoff - vmf->pgo=
ff;
> +
> +               if (vma_pages_left < ra->ra_pages)
> +                       ractl._max_index =3D vma_end_pgoff - 1;
>                 fpin =3D maybe_unlock_mmap_for_io(vmf, fpin);
>                 page_cache_async_ra(&ractl, folio, ra->ra_pages);
>         }
> --
> 2.34.1
>

I maybe missing something subtle, but, I think you've changed it from "don'=
t
read beyond the VMA" to "if there is a chance we could read beyond the VMA,
don't read beyond the VMA", which seems like a more complex expression of t=
he
same behavior.
