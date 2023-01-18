Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1772F21
	for <oe-lkp@lists.linux.dev>; Wed, 18 Jan 2023 17:17:30 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id e132so6430956vke.11
        for <oe-lkp@lists.linux.dev>; Wed, 18 Jan 2023 09:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fdqIaz/OuT3KiECAYbJfl+d3yacajyE8FY/hHAgDXU4=;
        b=bW+I6GT3472rBqyqGwRHftx7r2GGIogKz2Y0oQTedgzUrfMCpXWKof68tlXZFbetUY
         2WATXsTp3RN1pb5gw6psBaXonl0PhuZDMJziCI8xLhFsEUJHCwD7EFzPgWd1Kuk7vxkd
         FZsGsrkAAdXlgWHrdqvwR81hEpMUYuiE/bHLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdqIaz/OuT3KiECAYbJfl+d3yacajyE8FY/hHAgDXU4=;
        b=B+hYVgZF7tpT52S/dGRtQr2FlkSLG5ahjRJU2pDmN5kHZm7RIPz0IO/flqrTrGYw9M
         KZOk6WoTig9I2DiSTw+Dl4F01mnCbhc3+OA/4NiPHJ6BEDC8qSBDbDKNhhE67fmJ1OGP
         NGXZeciZM63PnpyiL8wBwuAzEWlKUTgs8vgw0oRoujKmeogkBOA6NiARM4gHcfGaDyOA
         ht8NQJoT2FXITJkOcaoBoNWWZUybIttT5TSCebt8/H6gr/hBQs7SzVCRhu055gKakEpt
         mC6deHjcoKKzhUk+OsNa138zkGPcU6PwIQ9Lefr2XVDYFJ4a2MMfPeCGWUeLsL9rcrHU
         hjaw==
X-Gm-Message-State: AFqh2krbsiW9CutoG4LgjgqG1Mqi0ow+TysFQUtrIfomqJxMIrXS6tj8
	EWQJY1vTS/KkuTR30+dvDh/pbrK7d25CMwMu
X-Google-Smtp-Source: AMrXdXsjhSu4vOrkMUE2HOtJj7kUskTwfQXI0/skOa+LpLALYIAwp0xR8EAqYUoa8LLNdYUJVYos2w==
X-Received: by 2002:a05:6122:1818:b0:3da:822e:4d70 with SMTP id ay24-20020a056122181800b003da822e4d70mr5220622vkb.12.1674062248897;
        Wed, 18 Jan 2023 09:17:28 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id p64-20020a1fa643000000b003e1753368e0sm818637vke.27.2023.01.18.09.17.28
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 09:17:28 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id i185so36468308vsc.6
        for <oe-lkp@lists.linux.dev>; Wed, 18 Jan 2023 09:17:28 -0800 (PST)
X-Received: by 2002:a05:6214:5f82:b0:534:252f:b091 with SMTP id
 ls2-20020a0562145f8200b00534252fb091mr345510qvb.130.1674061861468; Wed, 18
 Jan 2023 09:11:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301170941.49728982-oliver.sang@intel.com> <2f483247-da76-9ec9-3e51-f690939f4585@suse.cz>
 <Y8ZVxJSZdtEk8Nco@feng-clx> <Y8aSc5xGO+rW2pyo@feng-clx> <CAHk-=wiS84nS9apjs_Vt=jjZ_+j+F8HQ3B+ABSvbzcqtW9x5Kg@mail.gmail.com>
 <Y8f0miUc//BQXN3A@feng-clx>
In-Reply-To: <Y8f0miUc//BQXN3A@feng-clx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Jan 2023 09:10:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh0pdJm6tS4-ywR3Zi70PnBjMXeCkuQKnu8utcSKjxNEw@mail.gmail.com>
Message-ID: <CAHk-=wh0pdJm6tS4-ywR3Zi70PnBjMXeCkuQKnu8utcSKjxNEw@mail.gmail.com>
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

On Wed, Jan 18, 2023 at 5:33 AM Feng Tang <feng.tang@intel.com> wrote:
>
> > Finally, your objdump version also does some horrendous decoding, like
> >
> >   c13b3e29:       8d b4 26 00 00 00 00    lea    0x0(%esi,%eiz,1),%esi
>
> I know little about these tools, and I tried objdump tool from
> Cent OS 9 (objdump version 2.35.2) and Ubuntu 22.04 (objdump version
> 2.38), they both dumped similar assembly. Please let me know if you
> want us to try other version of objdump.

It's fine - it just makes things even less legible than they already were.

I personally very seldom try to look at objdump output - I tend to do
things like

     make mm/page_alloc.s

and look at the compiler-generated assembly instead. That ends up
generally being a lot more legible for various reasons, not the least
of which is the variable name commentary that the compiler also
outputs.

So objdump is kind of a last resort, and then you just have to deal
with the fact that its output format is very nasty.

> We modify the kconfig to disable GCOV and UBSAN, and the issue can't
> be reproudced in 1000 runs.

Ok, it does seem like this is a compiler bug, as per Vlastimil's decoding.

And the reason it happens on 32-bit is probably that we just have much
fewer registers available there, and the 64-bit GCOV counts then
complicate things even more, and then some interaction between that
and UBSAN just generates crazy code.

And it probably has very little compiler test coverage in real life anyway.

From Vlastimil's decode, it does look like gcc has mixed up the
"update GCOV counts" with actual real values for "nr_pages", and is
using %eax for both things because of some register allocation
mistake.

So I think we can dismiss this one as a compiler bug. It might be good
to see if it happens with a newer version of gcc too, and even perhaps
post a gcc bugzilla entry, but since this probably isn't really a very
interesting config for real life, I'm not sure how interested people
are going to be.

                Linus
