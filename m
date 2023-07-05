Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B1DD528
	for <oe-lkp@lists.linux.dev>; Wed,  5 Jul 2023 15:55:04 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-992b2249d82so810025466b.1
        for <oe-lkp@lists.linux.dev>; Wed, 05 Jul 2023 08:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688572502; x=1691164502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eeaxsIv3ASkEqAp4A3iR6v0UBJ1ipY1YSW/EwS5Gbfg=;
        b=BIX8SNthGs/FnAVUAQ+bxOiGlyMuNqFjFbdiVzUCzvmI9I6KhPwKbkX4Fg6SO4BVwf
         cYmCWRbD66R2YKQ2YfnOcQNkzubxJpGE79N+CxP73FXxd+LnjQMvgE8RU/WCEyX9E5wR
         QQ3WsqUogH6hL23lqgaAnhkYneezqI+QK5ctg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688572502; x=1691164502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeaxsIv3ASkEqAp4A3iR6v0UBJ1ipY1YSW/EwS5Gbfg=;
        b=ClYPM8levoEJ8KjwpFvocNnQrcjrt6rN5rQ5PCVHZYIzLbqqPmYkeRT+7WVl0HnFk8
         003Ddkf+uXijYitFZwFPl9YFAjzbn2GfMRotFoNk8Aubj2d9x4ItkSDTMhytd/RSEgLK
         nItLg0qHEXHQNU5NyqkIRDVK/y0y7NoTuYBrR2HlE4GzVDPGknZpz20BWDMrkXtlZ5E/
         xynl2yOvRHAxoTCNlGAYUwXzqcklcRhzfQ1JkFevVF/AWG+kH3AY0xWODlOwtG5v8Tq1
         f65z20GKMK3n3gYw4OV+ta8Rz8jth0fbK9BwczZ87O+wpiAv8ZpkLDEMwk+BpZQUTSWG
         +KTQ==
X-Gm-Message-State: ABy/qLZt+uMOE+0e6tiJjfUJKZjAk6SLW2/OJ5bWXm5L3cORpYSnhpVk
	HQUIcwAb/CNdhXffKfB03OJ7XCB40YhwoWLV8Rvo255i
X-Google-Smtp-Source: APBJJlECRQWPwUp9kUPW065DNkbMUycaqJd8KQlpZceNsjJgNpC/lV48sRNHMip5Cv5XWs/BA+rzpQ==
X-Received: by 2002:a17:906:2206:b0:993:a379:6161 with SMTP id s6-20020a170906220600b00993a3796161mr1777207ejs.26.1688572502624;
        Wed, 05 Jul 2023 08:55:02 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id gx23-20020a170906f1d700b00992dcae806bsm7599085ejb.5.2023.07.05.08.55.02
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 08:55:02 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51e29913c35so528050a12.0
        for <oe-lkp@lists.linux.dev>; Wed, 05 Jul 2023 08:55:02 -0700 (PDT)
X-Received: by 2002:aa7:d502:0:b0:51d:d1ca:eab9 with SMTP id
 y2-20020aa7d502000000b0051dd1caeab9mr12543171edq.32.1688572501752; Wed, 05
 Jul 2023 08:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307041023.bcdbbfc0-oliver.sang@intel.com> <CAHk-=wi3Nb4t-JH6BGE5TOynik=-0kXyBGi3bLKTA85rvqHngQ@mail.gmail.com>
 <b57f35f9-53ae-5a99-d8b7-f1915c1cd1d0@nvidia.com>
In-Reply-To: <b57f35f9-53ae-5a99-d8b7-f1915c1cd1d0@nvidia.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 5 Jul 2023 08:54:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgi--892SZiqC8JWvF-vE7C+82X0VPHTCwbUpmbJWT0fw@mail.gmail.com>
Message-ID: <CAHk-=wgi--892SZiqC8JWvF-vE7C+82X0VPHTCwbUpmbJWT0fw@mail.gmail.com>
Subject: Re: [linus:master] [gup] a425ac5365: WARNING:at_mm/gup.c:#__get_user_pages
To: John Hubbard <jhubbard@nvidia.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Jul 2023 at 00:27, John Hubbard <jhubbard@nvidia.com> wrote:
>
> So it boils down to this: crashpad is reading from a valid starting
> address, inside the vma for the ld-linux-x86-64.so.2 file, but it reads
> a full 4KB page's worth, which takes it past the end of that vma.
>
> And although the expand_stack() logic is there as part of the
> __access_remote_vm() path, that logic ignores the size of the read! So
> it slips past without trying to expand the stack.
>
> Note that while next vma is indeed the stack, it is 919 GB away--a very
> large gap.

Ok, that's just the warning being a bit too simplistic.

For the case of a accessing past the end of the previous vma, old
kernels wouldn't have expanded the stack either, because not only do
we have a stack size ulimit, but even if you set that to infinity we
leave a guard gap between the previous mapping and the stack and don't
allow them to grow together.

I made the warning be about "any access below the stack" rather than
try to limit it, so your warning is basically a situation where no
actual semantic change has happened, and it's just that the warning
was overly broad.

I'll tighten it up, and switch the WARN_ON_ONCE() to just do a
"dump_stack()" so that it won't cause problems with the syzbot tests
either.

                Linus
