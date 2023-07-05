Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6946AB
	for <oe-lkp@lists.linux.dev>; Wed,  5 Jul 2023 17:15:31 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fba74870abso8300101e87.0
        for <oe-lkp@lists.linux.dev>; Wed, 05 Jul 2023 10:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688577330; x=1691169330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gVbA+8Izu9ivmJZn/qB70KgKLBZPRbZJf6rvmQg+Ec4=;
        b=C1zCtkZe0cDfiF5Y3w7+zNdsQeOj8x8Z5PIsWL3IcPb8Iy+oz/p8plvukxsGIIs8+I
         cQXrNWnTp5T/i/SUzTOlVV/WrXM+5VXjU8IW664Ovk3TNnvSloHZty6gSD5BmhI1y/Nv
         QOzfGsziV/s7QshFwAwK4iMKLQi1Ttr5SFEhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688577330; x=1691169330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVbA+8Izu9ivmJZn/qB70KgKLBZPRbZJf6rvmQg+Ec4=;
        b=RprCZfjw2z1mcZSGDIJyRH0CpHLvhO5YknJq/cdmDk3faj1xR493d4asxavkoPyyXP
         nSbezCrYB7OOR71R0mGL1zqijGp2K3OYmepohDTavi5kv/utFe3ZQQdwIqF4k1WyNBR6
         RrXq4Vpj9PVnvmf3xIsdjwdTDgLS1i5LsVlGEh0ZANVNTF1tyJs3Ed76aMbUBfVlOPvn
         EiSrV8CpGv1KYlNbBNv5bkXOU1U2wRoybhfGvXkeMmarBOnm5gIBKmzUa9HAsHOq6hUw
         XW/ljjN3rdB6V00Jq0/sJFJeC1efL/+SaTR0eV+qPkLbd/ZxodbGEAuTGh8a0LkLUFPT
         M7EQ==
X-Gm-Message-State: ABy/qLbQbjTrj/CeDZT/kOmgg3FlShLvBwQgcvchimGpcD4ePeVYM6QA
	OlNRkR6iiEG8ularex/CTKz+62GdSF0DW4mEe7LwBlVK
X-Google-Smtp-Source: APBJJlEazlXS7C2bMIjhanXbCsu5s8PRN9isgzuESJLRr0SULOi6aBejT7WEco7lwCws3LOL3hrLBA==
X-Received: by 2002:ac2:5b1a:0:b0:4fa:fc12:2bdd with SMTP id v26-20020ac25b1a000000b004fafc122bddmr11148219lfn.40.1688577329805;
        Wed, 05 Jul 2023 10:15:29 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id g25-20020aa7c859000000b0050cc4461fc5sm13178578edt.92.2023.07.05.10.15.29
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 10:15:29 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51da8a744c4so7855281a12.0
        for <oe-lkp@lists.linux.dev>; Wed, 05 Jul 2023 10:15:29 -0700 (PDT)
X-Received: by 2002:aa7:d5c8:0:b0:51e:fb9:7f20 with SMTP id
 d8-20020aa7d5c8000000b0051e0fb97f20mr6131122eds.41.1688577328716; Wed, 05 Jul
 2023 10:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307041023.bcdbbfc0-oliver.sang@intel.com> <CAHk-=wi3Nb4t-JH6BGE5TOynik=-0kXyBGi3bLKTA85rvqHngQ@mail.gmail.com>
 <b57f35f9-53ae-5a99-d8b7-f1915c1cd1d0@nvidia.com> <CAHk-=wgi--892SZiqC8JWvF-vE7C+82X0VPHTCwbUpmbJWT0fw@mail.gmail.com>
In-Reply-To: <CAHk-=wgi--892SZiqC8JWvF-vE7C+82X0VPHTCwbUpmbJWT0fw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 5 Jul 2023 10:15:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjieeCJd+XYWHs9bR_-Bcw_OJiHDtK8NKGDeA_C_SuBng@mail.gmail.com>
Message-ID: <CAHk-=wjieeCJd+XYWHs9bR_-Bcw_OJiHDtK8NKGDeA_C_SuBng@mail.gmail.com>
Subject: Re: [linus:master] [gup] a425ac5365: WARNING:at_mm/gup.c:#__get_user_pages
To: John Hubbard <jhubbard@nvidia.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Jul 2023 at 08:54, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'll tighten it up, and switch the WARN_ON_ONCE() to just do a
> "dump_stack()" so that it won't cause problems with the syzbot tests
> either.

I pushed it out. It's based on the thing that Oliver already tested,
but expanded a bit from that (and with a better calling convention, so
that when we're done we can just delete the whole helper function and
replace it with "find_vma()" like it is supposed to just be).

It's lightly tested, but I no longer have any trivial ways to trigger
the warning, so the testing was literally "now it doesn't say anything
at all".

It should still trigger the warning by literally doing some direct-IO
GUP below the stack - but at least the obvious cases of false
positives hopefully don't trigger.

At least until somebody comes up with another obvious case that I
didn't think of ;)

               Linus
