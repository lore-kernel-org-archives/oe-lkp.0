Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6674D28375
	for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OZ89oT/X"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9e623356e59so825513166b.0
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 09:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700069936; x=1700674736; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjnOHCJPMB3Ob6Aoj8djmdEtslB23gqmLaPYvQZfZE8=;
        b=OZ89oT/XdeFFb5+YjpnJBI54yQ0EPsfqd07+DoSRxz5X0zNdCzZ9dTOoKldmlTO0dk
         EBoaJ/H7q3bgXq43Gyz1tJNMNAV3ON+g4Hbm1JrRVmXhR3yLa5sDXq5BwNwCNynPbUWM
         9s2od+1FOJq6Nb4uWWmpsH57lQ4GyZx7BLTWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700069936; x=1700674736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjnOHCJPMB3Ob6Aoj8djmdEtslB23gqmLaPYvQZfZE8=;
        b=r7Dx3s83DSttRNvajJtt2fFZd/Vpxr2uI0HCncZlUW3tPSXSAEzShreCIa48hrvBHU
         QSb6/VRbvYbWSHj6pE0Q2PVTiXYrsJHz+csmqdWbdk7hQysbMrdXDpKBPW1CHdg0cGDj
         GtuatktAFGb2qAAIybv396JBN9QKIiSSYuaD9w/W0DeSH5AQCS2FgBcYIQxhLPnLNAU7
         OCxw9iCcOxm4sydwpczaihDY/0adcfuBM7uxRFi8uYSCmCMiT0RMc/Oy5cx8PhnpjlS3
         gKkqLDNqOItvGTveowOLCZSpOXkBnW29HBtCR+e3OhspRFyZfEFDGtLIFo+PeAdD7c+u
         9f5g==
X-Gm-Message-State: AOJu0Yy2s0buOBlY2YL830pbbjN12nMVTIYuCcGMFCCOX6Ez5vjlqJiL
	NeWBlnmT7jEW5o8H6lx5ofJc2dCfL3e32u5WTAtukoNd
X-Google-Smtp-Source: AGHT+IFKJ6e8bdNzUMpRAKK6FoMh15i03f2y2lwZsqrFjXifPxsfnZ7MEGoSppX24rReftkxEFnRqQ==
X-Received: by 2002:a17:907:969f:b0:9eb:af0e:39da with SMTP id hd31-20020a170907969f00b009ebaf0e39damr6725500ejc.46.1700069936314;
        Wed, 15 Nov 2023 09:38:56 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a25-20020a170906469900b0098ce63e36e9sm7475139ejr.16.2023.11.15.09.38.55
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 09:38:55 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-53d9f001b35so10683836a12.2
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 09:38:55 -0800 (PST)
X-Received: by 2002:aa7:d44c:0:b0:547:a0a8:634b with SMTP id
 q12-20020aa7d44c000000b00547a0a8634bmr3923054edr.32.1700069935569; Wed, 15
 Nov 2023 09:38:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311061616.cd495695-oliver.sang@intel.com> <3865842.1700061614@warthog.procyon.org.uk>
 <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
In-Reply-To: <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Nov 2023 12:38:38 -0500
X-Gmail-Original-Message-ID: <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
Message-ID: <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
Subject: Re: [linus:master] [iov_iter] c9eec08bac: vm-scalability.throughput
 -16.9% regression
To: David Howells <dhowells@redhat.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Christian Brauner <christian@brauner.io>, Matthew Wilcox <willy@infradead.org>, 
	David Laight <David.Laight@aculab.com>, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 11:53, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I wonder if gcc somehow decided to inline "memcpy()" in
> memcpy_from_iter() as a "rep movsb" because of other inlining changes?
>
> [ Goes out to look ]
>
> Yup, I think that's exactly what happened. Gcc seems to decide that it
> might be a small memcpy(), and seems to do at least part of it
> directly.
>
> So I *think* this all is mainly an artifact of gcc having changed code
> generation due to the code re-organization.

The gcc code generation here is *really* odd. I've never seen this
before, so it may be new to newer versions of gcc. I see code like
this:

# lib/iov_iter.c:73:    memcpy(to + progress, iter_from, len);
        cmpl    $8, %edx        #, _88
        jb      .L400   #,
        movq    (%rsi), %rax    #, tmp288
        movq    %rax, (%rcx)    # tmp288,
        movl    %edx, %eax      # _88, _88
        movq    -8(%rsi,%rax), %rdi     #, tmp295
        movq    %rdi, -8(%rcx,%rax)     # tmp295,
        leaq    8(%rcx), %rdi   #, tmp296
        andq    $-8, %rdi       #, tmp296
        subq    %rdi, %rcx      # tmp296, tmp268
        subq    %rcx, %rsi      # tmp268, tmp269
        addl    %edx, %ecx      # _88, _88
        shrl    $3, %ecx        #,
        rep movsq
        jmp     .L392   #

.L398:
# lib/iov_iter.c:73:    memcpy(to + progress, iter_from, len);
        movl    (%rsi), %eax    #, tmp271
        movl    %eax, (%rcx)    # tmp271,
        movl    %edx, %eax      # _88, _88
        movl    -4(%rsi,%rax), %esi     #, tmp278
        movl    %esi, -4(%rcx,%rax)     # tmp278,
        movl    8(%r9), %edi    # p_72->bv_len, p_72->bv_len
        jmp     .L330   #
...

.L400:
# lib/iov_iter.c:73:    memcpy(to + progress, iter_from, len);
        testb   $4, %dl #, _88
        jne     .L398   #,
        testl   %edx, %edx      # _88
        je      .L330   #,
        movzbl  (%rsi), %eax    #, tmp279
        movb    %al, (%rcx)     # tmp279,
        testb   $2, %dl #, _88
        jne     .L390   #,
...

which makes *zero* sense. It first checks that the the length is at
least 8 bytes, then it moves *one* word by hand, then it aligns the
code to 8 bytes remaining, and does the remaining (possibly
overlapping at the beginning) words as one "rep movsq",

And L398 is the "I have 4..7 bytes to copy" target.

And L400 seems to be "I have 0..7 bytes to copy".

This is literally insane. And it seems to be all just gcc having for
some reason decided to do this instead of "rep movsb" or calling an
out-of-line function.

I get the feeling that this is related to how your patches made that
function be an inline function that is inlined through a function
pointer. I suspect that what happens is that gcc expands the memcpy()
first into that inlined function (without caller context), and then
inserts the crazily expanded inline later into the context of that
function pointer.

I dunno. I really only say that because I haven't seen gcc make this
kind of mess before, and that "inlined through a function pointer" is
the main unusual thing here.

How very annoying.

                 Linus
