Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B88E41743
	for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 21:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RU8MxwVR"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-54553e4888bso215690a12.2
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 13:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700085025; x=1700689825; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=euaKLHnf5NJceWFhMbsDdv1xMlqpCbfs4YJAKx1yvno=;
        b=RU8MxwVRgK5IloHQB+t0YkwHYCnwiW5GOeA/7+fcMCjS1WucPnQ29g5/iFtGy0lTDx
         wvcRTGfjDlsh1D7s21tao7D5q9p8ixerFi+Glf58SursUWhzTcoQOryqodLTd6tauQrY
         HTr+oaDQY8xTL7DTlWslJAfBkN6twCEnDk0ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700085025; x=1700689825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euaKLHnf5NJceWFhMbsDdv1xMlqpCbfs4YJAKx1yvno=;
        b=EcwgCIxjqOLOJcUslIgptOhvoIvfa5Zr1hsBkuNK+V6eqRsFbLLqdUNoEmuy7R6f5/
         3fhOE69K59pYq8rUrrPv5r5uDqyLHvn4NnxzOakPt4tUo5uddz5DyNgZawQprWST4E8j
         2E/V+86hzB/+aVvCKV/UONfavV5fx3lXUl+GRyfHNoFsgn332X81XVFtRyDkvl+uJM+O
         q/S3jOWM9P1J4nAvo7hFjcnNROmwCmTSr1FMwYuZX4UDxrmj0OyilhiIyjvXhq+ILTfw
         E5Qkp4p5NMxEgR920yK2ncUzpI/BykmUdcAReF7iMEldnZSwlQvucGvHBfqGfc0MV0gg
         6SsQ==
X-Gm-Message-State: AOJu0YxzphCJLRwjp85q9ulBsNLyyrolsr1L9QTbAMpHTMo/792QXYGP
	xLJwmWwCIfdq2ho8hfG5MdV47eYgbPbO1EMxTkHKe46R
X-Google-Smtp-Source: AGHT+IENlBCxVJ19PGJ+h997bTbBFF9poXUonYH0MoJKhON3CFamCdU3atZt0hZtavI//r1h8wrgpQ==
X-Received: by 2002:a05:6402:681:b0:53e:7881:6bdf with SMTP id f1-20020a056402068100b0053e78816bdfmr10306321edy.14.1700085025040;
        Wed, 15 Nov 2023 13:50:25 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id z37-20020a509e28000000b0053e88c4d004sm7108735ede.66.2023.11.15.13.50.24
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 13:50:24 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5409bc907edso239516a12.0
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 13:50:24 -0800 (PST)
X-Received: by 2002:aa7:d49a:0:b0:540:b1fb:b630 with SMTP id
 b26-20020aa7d49a000000b00540b1fbb630mr10875459edr.27.1700085024118; Wed, 15
 Nov 2023 13:50:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311061616.cd495695-oliver.sang@intel.com> <3865842.1700061614@warthog.procyon.org.uk>
 <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
 <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
 <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com> <4097023.1700084620@warthog.procyon.org.uk>
In-Reply-To: <4097023.1700084620@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Nov 2023 16:50:06 -0500
X-Gmail-Original-Message-ID: <CAHk-=wgR3Mw2-8k2O3S10T-f4oz8FNfg7aziLU_6pbx0qowxew@mail.gmail.com>
Message-ID: <CAHk-=wgR3Mw2-8k2O3S10T-f4oz8FNfg7aziLU_6pbx0qowxew@mail.gmail.com>
Subject: Re: [linus:master] [iov_iter] c9eec08bac: vm-scalability.throughput
 -16.9% regression
To: David Howells <dhowells@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Christian Brauner <christian@brauner.io>, 
	Matthew Wilcox <willy@infradead.org>, David Laight <David.Laight@aculab.com>, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 16:43, David Howells <dhowells@redhat.com> wrote:
>
>   LD      arch/x86/purgatory/purgatory.chk
> ld: arch/x86/purgatory/purgatory.ro:(.altinstr_replacement+0x1): undefined reference to `rep_movs_alternative'
> ld: arch/x86/purgatory/purgatory.ro:(.altinstr_replacement+0x6): undefined reference to `rep_movs_alternative'
>
> The symbol is available in the arch lib directory:

That patch of mine ends up exposing the fact that we have a lot of
special boot-time code and similar that isn't real kernel code, but is
built with kernel headers.

Normally not that noticeable, but when it modified something as core
as memcpy(), it shows up in a big way.

Sadly, we don't seem to have any obvious #define for "this is not real
kernel code". We just have a lot of ad-hoc tricks, like removing
compiler flags and disabling things like KASAN etc on a file-by-file
(or directory) basis.

The purgatory code isn't exactly boot-time code, but it's very similar
- it's kind of a limited environment that runs at crash time to load a
new kernel.

               Linus
