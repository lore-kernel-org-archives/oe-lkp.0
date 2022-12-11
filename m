Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198792571
	for <oe-lkp@lists.linux.dev>; Sun, 11 Dec 2022 18:28:09 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id x11so2024268qtv.13
        for <oe-lkp@lists.linux.dev>; Sun, 11 Dec 2022 10:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VcIjNZvmXhwLlIH4qzTb3os7YT1CTCX89zz+g7s11S8=;
        b=MGBmNEXQ9KDFHMWkhfA16f3WXE9+n6bQWGbQ/WBcrwvvD7XGUxNJ4lULAQ4bF52hyX
         I45Gmp4HDqpBwWuXX3l+4nvpELR0hLZgp15u/sM1JcfxMioNWKmTXOmZ3q/OnbB9HyzY
         NTeZGgpA0T0hHbjbfhGwL2uIoepMHlEZ6wf+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcIjNZvmXhwLlIH4qzTb3os7YT1CTCX89zz+g7s11S8=;
        b=SNl7MSNy/U/Vyb7TqwQkMx71j3sdIhly2XYr5coHuxA04Pxp9pLPjKq6x8xCn7j4p4
         9ILzeRmPDOZWQ+MNNQ4R9eZ5xOY03Do235u/+tgYzvj0YwbLPPPCNPQNZ+mp8+q28LJp
         NTs2YloJ4d493HDvCiJSlgYIzXYcDTRTvaze9RiUz+20eFeMp3Ue97ncrmEbWCKqwWTB
         70SIKISTpa4g6r99hgOLSqEtrvZ/5npQLuWpndIr1qKGyNGttCYFhn3uyaEoPc53y39t
         QxGcBC+T1gFP3Ar/kjZJaei3AHsKNwFdTtgGLUueX765RaUr5QZtRNe6Zf5+MioEa38R
         GItQ==
X-Gm-Message-State: ANoB5pksGpNVSQFJ28oOrIDqQcYsK3OVdHRS9/4Y1wNZlyZjSasBfTdX
	I1WC6Y9HNQlE7GSTu70Z032fBC+vmCVUCClY
X-Google-Smtp-Source: AA0mqf4vTW4ThZVzVzriiP+XVgADVW2bIIFUvPi5UDO7vPUPT16mdu4BBzcAxyNbPEAyRpkzAShVQg==
X-Received: by 2002:a05:622a:1f0d:b0:3a4:fa86:13d4 with SMTP id ca13-20020a05622a1f0d00b003a4fa8613d4mr18425772qtb.33.1670783288262;
        Sun, 11 Dec 2022 10:28:08 -0800 (PST)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id dm49-20020a05620a1d7100b006bbc3724affsm4351886qkb.45.2022.12.11.10.28.05
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 10:28:07 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id i12so6859962qvs.2
        for <oe-lkp@lists.linux.dev>; Sun, 11 Dec 2022 10:28:05 -0800 (PST)
X-Received: by 2002:ad4:4101:0:b0:4b1:856b:4277 with SMTP id
 i1-20020ad44101000000b004b1856b4277mr70224982qvp.129.1670783284766; Sun, 11
 Dec 2022 10:28:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212112131.994277de-oliver.sang@intel.com>
In-Reply-To: <202212112131.994277de-oliver.sang@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 11 Dec 2022 10:27:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wipgS=05hJdztC8sJj01wpxMKQ67tV53UyFa2WtZ93o5A@mail.gmail.com>
Message-ID: <CAHk-=wipgS=05hJdztC8sJj01wpxMKQ67tV53UyFa2WtZ93o5A@mail.gmail.com>
Subject: Re: [ammarfaizi2-block:dhowells/linux-fs/fscache-fixes] [mm, netfs,
 fscache] 6919cda8e0: canonical_address#:#[##]
To: kernel test robot <oliver.sang@intel.com>
Cc: David Howells <dhowells@redhat.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Rohith Surabattula <rohiths.msft@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
	Steve French <sfrench@samba.org>, Shyam Prasad N <nspmangalore@gmail.com>, 
	Dave Wysochanski <dwysocha@redhat.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	Ilya Dryomov <idryomov@gmail.com>, Ammar Faizi <ammarfaizi2@gnuweeb.org>, 
	"GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, v9fs-developer@lists.sourceforge.net, 
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com, 
	ceph-devel@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

The disassembly isn't great, because the test robot doesn't try to
find where the instructions start, but before that

>    4:   48 8b 57 18             mov    0x18(%rdi),%rdx

instruction we also had a

      mov    (%rdi),%rax

and it looks like this is the very top of 'filemap_release_folio()',
so '%rdi' contains the folio pointer coming into this.

End result:

On Sun, Dec 11, 2022 at 6:27 AM kernel test robot <oliver.sang@intel.com> wrote:
>
>    4:   48 8b 57 18             mov    0x18(%rdi),%rdx
>    8:   83 e0 01                and    $0x1,%eax
>    b:   74 59                   je     0x66

The

    and    $0x1,%eax
    je     0x66

above is the test for

    BUG_ON(!folio_test_locked(folio));

where it's jumping out to the 'ud2' in case the lock bit (bit #0) isn't set.

Then we have this:

>    d:   48 f7 07 00 60 00 00    testq  $0x6000,(%rdi)
>   14:   74 22                   je     0x38

Which is testing PG_private | PG_private2, and jumping out (which we
also don't do) if neither is set.

And then we have:

>   16:   48 8b 07                mov    (%rdi),%rax
>   19:   f6 c4 80                test   $0x80,%ah
>   1c:   75 32                   jne    0x50

Which is checking for PG_writeback.

So then we get to

    if (mapping && mapping->a_ops->release_folio)
            return mapping->a_ops->release_folio(folio, gfp);

which is this:

>   1e:   48 85 d2                test   %rdx,%rdx
>   21:   74 34                   je     0x57

This %rdx value is the early load from the top of the function, it's
checking 'mapping' for NULL.

It's not NULL, but it's some odd value according to the oops report:

  RDX: ffff889f03987f71

which doesn't look like it's valid (well, it's a valid kernel pointer,
but it's not aligned like a 'mapping' pointer should be.

So now when we're going to load 'a_ops' from there, we load another
garbage value:

>   23:   48 8b 82 90 00 00 00    mov    0x90(%rdx),%rax

and we now have RAX: b000000000000000

and then the 'a_ops->release_folio' access will trap:

>   2a:*  48 8b 40 48             mov    0x48(%rax),%rax          <-- trapping instruction
>   2e:   48 85 c0                test   %rax,%rax
>   31:   74 24                   je     0x57

The above is the "load a_ops->release_folio and test it for NULL", but
the load took a page fault because RAX was garbage.

But RAX was garbage because we already had a bogus "mapping" pointer earlier.

Now, why 'mapping' was bogus, I don't know. Maybe that page wasn't a
page cache page at all? The mapping field is in a union and can
contain other things.

So I have no explanation for the oops, but I thought I'd just post the
decoding of the instruction stream in case that helps somebody else to
figure it out.

                 Linus
