Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19013A8F3
	for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Gplds3+I"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9c603e235d1so3925866b.3
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 11:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700075399; x=1700680199; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t3Gj/lDYAeGknhoabh8oIVCV+PKddkxsuVMwfg7hA2k=;
        b=Gplds3+IE8uR1xwAweIdb8Y1Bo+B5lyFsOT8gkAW4F6qXPpxPgxCmatBquDufqllV7
         UGxfEOaSGohbqDr00bEaxeDFHpZSi/pTOs2/COQPnvY9zT/iP6whHoVbXOZ3kjKrjVdp
         3STJtTsEwwkwnE6Ly8JXd2GBo+udPk0yRxlTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700075399; x=1700680199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Gj/lDYAeGknhoabh8oIVCV+PKddkxsuVMwfg7hA2k=;
        b=nqKU2xZ21Io2ZZCpmv/1cZJH7GhhY3vJQkI9dYibFalkqLkfzfqHFiuyAqiZnUVhmI
         NJOSRqe6pBfLAWw5XSynFbqL30bHD8kKhRV8FsSJ2OK5+c3/Va0GTCBJ/gGTLHO/ZtRt
         JZscCpbD0TAU1BRvRGgRIroMqppu5LrDAmyNkpcNW2h1N3sRBRHMCr87ksIj2v9UA3T/
         +EiP12yOe7ZxpM53yvE+fX8jLgUeW4fbpkTqyTtB+mbDZikdwHxbJkc4AUjbcN0xObax
         4119O5yIyWIgNH/qlbhUs9OgIWnoG6bGkJ4XEOfs5elhgjomIPke6ULMmof+u2/qBWsg
         Y2Cw==
X-Gm-Message-State: AOJu0YwxkEVVBRntstDx1K+GlKKLFSXKt6nd5NSw5iBZbhhlbyYh8qq4
	0rgwm5Sbyb1d5u+rmY7sohf3A6FU5SyOdnjrae56GM8O
X-Google-Smtp-Source: AGHT+IG/7ATUNACa04LD3i3AJxmrmxkWSMog/YlwOGzZeT8rpbSHsjDjiPLLGcmbPJcPaCQWZqCwXQ==
X-Received: by 2002:a17:906:c243:b0:9b3:308:d045 with SMTP id bl3-20020a170906c24300b009b30308d045mr9384863ejb.46.1700075399675;
        Wed, 15 Nov 2023 11:09:59 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id r18-20020a170906351200b009e621aeec0fsm7446635eja.192.2023.11.15.11.09.58
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 11:09:58 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-543923af573so57175a12.0
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 11:09:58 -0800 (PST)
X-Received: by 2002:aa7:ca4a:0:b0:540:eb72:baae with SMTP id
 j10-20020aa7ca4a000000b00540eb72baaemr8814139edt.40.1700075397646; Wed, 15
 Nov 2023 11:09:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311061616.cd495695-oliver.sang@intel.com> <3865842.1700061614@warthog.procyon.org.uk>
 <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
 <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
 <4007890.1700073334@warthog.procyon.org.uk> <CAHk-=whFGA6YPJp3zazUwBG6ort8i34vGv9utYdOgYpekyt++Q@mail.gmail.com>
In-Reply-To: <CAHk-=whFGA6YPJp3zazUwBG6ort8i34vGv9utYdOgYpekyt++Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Nov 2023 14:09:40 -0500
X-Gmail-Original-Message-ID: <CAHk-=whtDxahdzn4yLP_3BNb496AQ0y5QrE36JVLUkqRM+un5A@mail.gmail.com>
Message-ID: <CAHk-=whtDxahdzn4yLP_3BNb496AQ0y5QrE36JVLUkqRM+un5A@mail.gmail.com>
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

On Wed, 15 Nov 2023 at 13:45, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Do you perhaps have CONFIG_CC_OPTIMIZE_FOR_SIZE set? That makes gcc
> use "rep movsb" - even for small copies that most definitely should
> *not* use "rep movsb".

Just to give some background an an example:

        __builtin_memcpy(dst, src, 24);

with -O2 is done as three 64-bit move instructions (well, three in
both direction, so six instructions total), and with -Os you get

        movl $6, %ecx
        rep movsl

instead.  And no, this isn't all that uncommon, because things like
the above is what happens when you copy a small structure around.

And that "rep movsl" is indeed nice and small, but it's truly
horrendously bad from a performance angle on most cores, compared to
the six instructions that can schedule nicely and take a cycle or two.

There are some other cases of similar "-Os generates unacceptable
code". For example, dividing by a constant - when you use -Os, gcc
thinks that it's perfectly fine to actually generate a divide
instruction, because it is indeed small.

But in most cases you really *really* want to use a "multiply by
reciprocal" even though it generates bigger code. Again, it ends up
depending on microarchitecture, and modern cores tend to do better on
divides, but it's another of those things where saving a copuple of
bytes of code space is not the right choice if it means that you use a
slow divider.

And again, those "divide by constant" often happen in implicit
contexts (ie the constant may be the size of a structure, and the
divide is due to taking a pointer difference). Let's say you have a
structure that isn't a power of two, but is (to pick a random but not
unlikely value) is 56 bytes in size.

The code generation for -O2 is (value in %rdi)

        movabsq $2635249153387078803, %rax
        shrq $3, %rdi
        mulq %rdi

and for -Os you get (value in %rax):

        movl $56, %ecx
        xorl %edx, %edx
        divq %rcx

and that 'divq' is certainly again smaller and more obvious, but again
we're talking "single cycles" vs "potentially 50+ cycles" depending on
uarch.

                  Linus
