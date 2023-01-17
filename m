Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DB4D52D
	for <oe-lkp@lists.linux.dev>; Tue, 17 Jan 2023 18:25:36 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id r15so4698312qtx.6
        for <oe-lkp@lists.linux.dev>; Tue, 17 Jan 2023 10:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t/Yj1dkETHJ3x/vd9B2cSXc0BtF92b0sf7AI+rPbVN0=;
        b=XCLE/+dWnhPFHp0Rjc45XkkaJtd/3aeBb1T0m6KOH6FOQ3duqOHkSne6Erdt0xqRvR
         LQe+kifp9lcJdtA03kTU5SGMsqQugmGdSLpd2Q2WTVkHIhWK7chONEMxksCRtnlBR/+e
         GyV+R9HcOZ5gfXDs6DPbyI/iCP1P/BakruKyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/Yj1dkETHJ3x/vd9B2cSXc0BtF92b0sf7AI+rPbVN0=;
        b=FrnFUn5Z4FI3ubmW9p9LaEyoicL+pLWakvW23hhiBixub0OeMVCgekzxqIwVX6apev
         JcaqRCA3WMpuqMQDIIcbFf7+OsYPQkjWGZIVuyqDI3EXXq3qK2hbxtM7lYp+fV6V2tQH
         Mk4BJq4xdpKF+OzJKWtLyM98AYEvzAaKj7pshomDx50D9uvQaV16gHZjTHDFY4eYb75g
         UnTpX7lnb/zuOQaaauf863mM4i39ULhIfmXHTjhiVdWvtAinLS1i4M0vUtYNjT7V+kva
         EqQeDKjvxi/0sn4oN8TNaxq/wq03toGBarmIb7xoq94adfGM6ksRU3XnK4clJmbhhiIG
         AC3w==
X-Gm-Message-State: AFqh2kqVkIi/qx7N1jdHLnuu6ZzQdIQP5Uoi0HM5BWY7DCpiaAWqDloH
	TgfIfU47G5YddnJzZjLlQGOZGqXP9jRguWuJ
X-Google-Smtp-Source: AMrXdXutxwM1NYoMLuOd8drjc5wu7MyzLhjIvyXITmCMOP9/UQs61S+HqWmB3+NMLkYPfA5y53ozBA==
X-Received: by 2002:ac8:70d5:0:b0:3ad:903d:3ed4 with SMTP id g21-20020ac870d5000000b003ad903d3ed4mr4176298qtp.59.1673979935057;
        Tue, 17 Jan 2023 10:25:35 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id fg13-20020a05622a580d00b003a6a92a202esm16400324qtb.83.2023.01.17.10.25.33
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 10:25:34 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id s19so3115646qkg.7
        for <oe-lkp@lists.linux.dev>; Tue, 17 Jan 2023 10:25:33 -0800 (PST)
X-Received: by 2002:a37:4651:0:b0:705:b232:4ed9 with SMTP id
 t78-20020a374651000000b00705b2324ed9mr143177qka.216.1673979933694; Tue, 17
 Jan 2023 10:25:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301170941.49728982-oliver.sang@intel.com> <2f483247-da76-9ec9-3e51-f690939f4585@suse.cz>
 <Y8ZVxJSZdtEk8Nco@feng-clx> <Y8aSc5xGO+rW2pyo@feng-clx>
In-Reply-To: <Y8aSc5xGO+rW2pyo@feng-clx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jan 2023 10:25:17 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiS84nS9apjs_Vt=jjZ_+j+F8HQ3B+ABSvbzcqtW9x5Kg@mail.gmail.com>
Message-ID: <CAHk-=wiS84nS9apjs_Vt=jjZ_+j+F8HQ3B+ABSvbzcqtW9x5Kg@mail.gmail.com>
Subject: Re: [linus:master] [hugetlb] 7118fc2906: kernel_BUG_at_lib/list_debug.c
To: Feng Tang <feng.tang@intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, "Sang, Oliver" <oliver.sang@intel.com>, 
	Mike Kravetz <mike.kravetz@oracle.com>, "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jann Horn <jannh@google.com>, 
	"Song, Youquan" <youquan.song@intel.com>, Andrea Arcangeli <aarcange@redhat.com>, Jan Kara <jack@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, 
	Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <songmuchun@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	"Yin, Fengwei" <fengwei.yin@intel.com>, hongjiu.lu@intel.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 4:22 AM Feng Tang <feng.tang@intel.com> wrote:
>
> With the following patch to use 'O1' instead 'O2' gcc optoin for
> page_alloc.c, the list corruption issue can't be reproduced for
> commit 7118fc2906 in 1000 runs.

Ugh.

It would be lovely if you could just narrow it down with

  #pragma GCC optimize ("O1")
 ...
  #pragma GCC optimize ("O2")

around just that prep_compound_page(), but when I tried it myself I
get some function attribute mismatch errors.


> As is can't be reproduced with X86_64 build, it could be i386
> compiling related.

Your particular config causes a huge amount of nasty 64-bit arithmetic
according to the objdump code, with sequences like

  c13b3cbb:       83 05 d0 28 6c c5 01    addl   $0x1,0xc56c28d0
  c13b3cc2:       83 15 d4 28 6c c5 00    adcl   $0x0,0xc56c28d4

which seems to be just from some coverage profiling being on
(CONFIG_GCOV?), or something. It makes it very hard to read the code.

You also have UBSAN enabled, which - again - makes for some really
grotty asm that hides any actual logic.

Finally, your objdump version also does some horrendous decoding, like

  c13b3e29:       8d b4 26 00 00 00 00    lea    0x0(%esi,%eiz,1),%esi

which is just a 7-byte 'nop' instruction, but again, it makes it
rather hard to actually read the code.

With the i386 defconfig, gcc generates a function that is just ~30
instructions for me, so this makes a huge difference in the legibility
of the code.

I wonder if you can recreate the issue with a much more
straightforward config. By all means, leave DEBUG_PAGEALLOC and SLUB
debugging on, but without the things like UBSAN and GCOV.

> I also objdumped 'prep_compound_page' for vmlinux of 7118fc2906 and
> its parent commit 48b8d744ea84, which have big difference than the
> simple 'set_page_count()' change, but I can't tell which part is
> abnormal, so attach them for further check.

Yeah, I can't make heads or tails of them either, see above on how
illegible the objdump files are. And that's despite not even having
all of prep_compound_page() in them (it's missing
prep_compound_page.cold, which is probably just UBSAN fixup code, but
who knows..)

That said, with the i386 defconfig, the only change from adding
set_page_count() to the loop seems to be exactly that:

 .L589:
-       movl    $1024, 12(%eax)
+       movl    $0, 28(%eax)
        addl    $32, %eax
+       movl    $1024, -20(%eax)
        movl    %esi, -28(%eax)
        movl    $0, -12(%eax)
        cmpl    %edx, %eax

(don't ask me why gcc does *one* access using the pre-incremented
pointer, and then the rest to the post-incremented ones, but whatever
- it means that it's not just "add a mov $0", it's also changing how
the

        p->mapping = TAIL_MAPPING;

instruction is done, which is that

-       movl    $1024, 12(%eax)
+       movl    $1024, -20(%eax)

part of the change)

             Linus
