Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EDF15ECC2
	for <oe-lkp@lists.linux.dev>; Mon,  5 Aug 2024 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880498; cv=none; b=cQEysrv+2d8IBMmHFbATySSBHq/Pq7Sr9iE4LxHMghX/GGOs5hIyurZ4RR6ySbqwe1C8hYnnPZsEFRKkBCSlPHdS5qjYJNRNp9lDlcGcacvkAwLOqmudOrH/icIfOUgJy4fMnG7ErbgYboQJqYXine7gGFadKZ1OhsbDKjVKp6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880498; c=relaxed/simple;
	bh=GQkjH4R2oNhKk0Gv7sFrDvmfpAjpYyo6PtB/FbwIiNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mx5xJIsDX0gTcUpr7B3K8Qx/D9WVcgydViS/1KvWnzUIl3GX0BvL1HUGGNCw8n7WzENAXjt5lhN0XMbKy0wgw84uKw2GNC8gnr1gr913x+rRLr1gCoj3O874sPoTQq70A/W8LFAf6qTMnKxVds5HFAV2x/SYGFzfz3zlpwYsZdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EuBTqaCB; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EuBTqaCB"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-267b7ef154aso6910127fac.0
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722880496; x=1723485296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI072rJ95IpNDgMCOsSYpX0fqCtQK3FmN4K3CCKoTUo=;
        b=EuBTqaCBQrjJ8b1DkTtJvP2YV/mX9f3qqd2fkV6tGCmEIwHh9n66rgNcV19343eDgu
         yF59yrPbjgPLeT60o8A/PepA+xZsRvoJc/5js2KoP4WLJUDgGWP0ZTE1u0GcaNkMREOd
         tRvijkavs3/J7gmRrBwXttfbSkSeL58FDOczU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722880496; x=1723485296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aI072rJ95IpNDgMCOsSYpX0fqCtQK3FmN4K3CCKoTUo=;
        b=J2IaTZmVvSQgJw0ny+SAjudmNnUBvpXz/xAM/GPez1eyjVOBigtYVlYMF1CjVnzc/a
         iWjwxJ1ZmUW2RmxwCiW/QOjuvx4EnOk/C2A2dGF6SZpehh1Zj+PIx7mpezK6TwAplo+Y
         y0RUVihbThh7uCJjrZvbVi7f7IdDRPwfFBHPDYNFm7Ln944LhCOY+vXrfHs2xkGAzg2z
         3FxasM1xXOFwC/nxRvS+25o+IU+nLy8a87dJzXFy+5qwBgot92SWbCZXtDr4iYzTsunB
         icgtY//4raYDQW+a+gaes+BeJKTFvZimfrec/ObsQmKFRdIuYPnuTARoEQyl3tilFHNo
         D64Q==
X-Forwarded-Encrypted: i=1; AJvYcCURqJ82CbYuvdMtjTHTpJOCyWb4ZPGpjtdr0CpTrEz/sEhIDa1sChk8OImoqUbp8d2j6qr8/3ucxL0mWQqnmrvIhWXVL9Z3
X-Gm-Message-State: AOJu0YwsEHxTrpq6QwN/M9fu1ybndFukQC48KAUyN5oURIW4IjuQ+70Q
	GFKoAPDDxbRVHT5HWUhhUN3DpEqGt1gw/OxbBvmhlgnPFlHF/4yOwoBuY0Hv4iEls1bhwJI/Lr+
	IcVf7X443cCftsJv9eh7cw6cqzYY0oA1WmmYb
X-Google-Smtp-Source: AGHT+IHEMfm5KZKzTuBuhbgn2BzM+Kkm0uGH+2NRDn+4bmV5rY5gAUDOiMxN7ccdXki/NJFJB+bUPiTfh36WFyShrO8=
X-Received: by 2002:a05:6870:d152:b0:260:e2ed:1abe with SMTP id
 586e51a60fabf-26891e929d5mr15828098fac.39.1722880495977; Mon, 05 Aug 2024
 10:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408041602.caa0372-oliver.sang@intel.com> <CAHk-=whbxLj0thXPzN9aW4CcX1D2_dntNu+x9-8uBakamBggLA@mail.gmail.com>
In-Reply-To: <CAHk-=whbxLj0thXPzN9aW4CcX1D2_dntNu+x9-8uBakamBggLA@mail.gmail.com>
From: Jeff Xu <jeffxu@chromium.org>
Date: Mon, 5 Aug 2024 10:54:44 -0700
Message-ID: <CABi2SkWkD0hbr_Bv1DiL-gzCgCtuJrWKvhGhh8GuU1vVMejzmw@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Pedro Falcato <pedro.falcato@gmail.com>, Dave Hansen <dave.hansen@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Jorge Lucangeli Obes <jorgelo@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, =?UTF-8?Q?Stephen_R=C3=B6ttger?= <sroettger@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Amer Al Shanawany <amer.shanawany@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	linux-api@vger.kernel.org, linux-mm@kvack.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 4, 2024 at 1:33=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, 4 Aug 2024 at 01:59, kernel test robot <oliver.sang@intel.com> wr=
ote:
> >
> > kernel test robot noticed a -4.4% regression of stress-ng.pagemove.page=
_remaps_per_sec on
> > commit 8be7258aad44 ("mseal: add mseal syscall")
>
> Ok, it's basically just the vma walk in can_modify_mm():
>
> >       1.06            +0.1        1.18        perf-profile.self.cycles-=
pp.mas_next_slot
> >       1.50            +0.5        1.97        perf-profile.self.cycles-=
pp.mas_find
> >       0.00            +1.4        1.35        perf-profile.self.cycles-=
pp.can_modify_mm
> >       3.13            +2.0        5.13        perf-profile.self.cycles-=
pp.mas_walk
>
> and looks like it's two different pathways. We have __do_sys_mremap ->
> mremap_to -> do_munmap -> do_vmi_munmap -> can_modify_mm for the
> destination mapping, but we also have mremap_to() calling
> can_modify_mm() directly for the source mapping.
>

There are two scenarios in mremap syscall.
1> mremap_to (relocate vma)
2> shrink/expand.
Those two scenarios are handled by different code path:

For case 1>
mremap_to (relocate vma)
-> can_modify_mm , check src for sealing.
-> if MREMAP_FIXED
->-> do_munmap (dst) // free dst
->->-> do_vmi_munmap (dst)
->->->-> can_modify_mm (dst) // check dst for sealing
-> if dst size is smaller (shrink case)
->-> do_munmap(dst, to remove extra size)
->->-> do_vmi_munmap
->->->-> can_modify_mm(dst) (potentially duplicate  with check for
MREMAP_FIXED,  practically, the memory should be unmapped, so the cost
 looking for a un-existed memory range in the maple tree )

For case 2>
Shrink/Expand.
-> can_modify_mm, check addr is sealed
-> if dst size is smaller (shrink case)
->-> do_vmi_munmap(remove_extra_size)
-> ->-> can_modify_mm(addr) (This is redundant because addr is already chec=
ked)

For case 2:, potentially we can improve it by passing a flag into
do_vmi_munmap() to indicate the sealing is already checked by the
caller. (however, this idea have to be tested to show actual gain)

The reported regression is in mremap, I wonder why mprotect/munmap
doesn't have similar impact, since they use the same pattern (one
extra out-of-place check for memory range)

During version 9, I tested munmap/mprotect/madvise for perf [1] .  The
test shows mseal adds   20-40 ns or 50-100 CPU cycle pre call, this is
much smaller (one tenth)  than change from 5.10 to 6.8. The test is
using multiple VMAs with various types[2].  The next step for me is
to run the stress-ng.pagemove.page_remaps_per_sec to understand why
mremap shows a big regression number.

[1] https://lore.kernel.org/all/20240214151130.616240-1-jeffxu@chromium.org=
/
[2] https://github.com/peaktocreek/mmperf

Best regards,
-Jeff


> And then do_vmi_munmap() will do it's *own* vma_find() after having
> done arch_unmap().
>
> And do_munmap() will obviously do its own vma lookup as part of
> calling vma_to_resize().
>
> So it looks like a large portion of this regression is because the
> mseal addition just ends up walking the vma list way too much.
>
>               Linus
