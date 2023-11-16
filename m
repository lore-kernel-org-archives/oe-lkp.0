Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27711718
	for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 22:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JpET9h2C"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9db6cf8309cso186994566b.0
        for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 14:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700174565; x=1700779365; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fg0CJY1mi+VcLE2vTZuvqELHi9zo++jHybcNxPzB83U=;
        b=JpET9h2CDVnOrFqHCKpxeRo4Wdg/fhUk6Xu9An11mT4bs7HUbZxIUA3nYq156P6gqq
         LoJG3SI/DSo5kJ7ycyV5cpdLPCOJDkKW1vavwavhhWSDcWctiB/x8LVZIlqFEa49V2O0
         FU+5MUXLaiLb5vxQGNBikF7W1LNIWoudJCPZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174565; x=1700779365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fg0CJY1mi+VcLE2vTZuvqELHi9zo++jHybcNxPzB83U=;
        b=sY7QCpMiLpAplWbl+Fs2xqh61g1W34u86vM3PHAcI88fdJ2LKkoHrCV3X+jXWqFIKC
         xTotwjT+rZGnX8hFn8htcLCPYPR4KhXXG8x079UVuCJZr8FvAkbIujKhulM5cSu4x52z
         Y+1XSOYbA/e/wbEoS+qopXvuxj66VeMK6skJd66rDrThvAdaXkvilX+eCZAS3/DiMoIr
         FICwLnTW9PWCtY+vtnsoq6WUeRwwuHo/KSLtvS88dO0Z9QO51SuwplauX7Jnax1oxcZw
         JJ5HI0SzqIekoKJsCZGZPvYma0ZMiKxthdX8aKB+jXiiCS5s2KykRF0N60WEegKFichd
         MXAA==
X-Gm-Message-State: AOJu0Yzm1YF54G3QO+L4nofR6lMq3jbtcLZ1D43PghWxcf4pPmzqUxMX
	uM27YGmjwxPADXM47RdQJGe5BEJN3Dr46iC67TVl+Unm
X-Google-Smtp-Source: AGHT+IEGaejH+n+S7lNgFLgwcdlY9fwAbv9yyXO+JxVcOv3SSji81guqWvEY2ropvqQndQBBkEzyVg==
X-Received: by 2002:a17:906:ae8e:b0:9bd:a7a5:3a5a with SMTP id md14-20020a170906ae8e00b009bda7a53a5amr13112544ejb.36.1700174565546;
        Thu, 16 Nov 2023 14:42:45 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id lh3-20020a170906f8c300b009dd7097ca22sm115350ejb.194.2023.11.16.14.42.45
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 14:42:45 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so11656145e9.3
        for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 14:42:45 -0800 (PST)
X-Received: by 2002:a05:6402:2050:b0:543:d584:7d8f with SMTP id
 bc16-20020a056402205000b00543d5847d8fmr12994935edb.32.1700174226739; Thu, 16
 Nov 2023 14:37:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311061616.cd495695-oliver.sang@intel.com> <3865842.1700061614@warthog.procyon.org.uk>
 <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
 <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
 <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com>
 <4097023.1700084620@warthog.procyon.org.uk> <CAHk-=wgR3Mw2-8k2O3S10T-f4oz8FNfg7aziLU_6pbx0qowxew@mail.gmail.com>
 <42895.1700089191@warthog.procyon.org.uk> <CAHk-=wi7gdgFM4tnLXfE4cj2XiKNARbGY-N2aF5h9CMaN6JUbA@mail.gmail.com>
 <282731.1700168945@warthog.procyon.org.uk>
In-Reply-To: <282731.1700168945@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 Nov 2023 17:36:47 -0500
X-Gmail-Original-Message-ID: <CAHk-=wjNv9NK=6rTNuQUkBfngw-jvP81esrV5ZLq0RBR9qaOuA@mail.gmail.com>
Message-ID: <CAHk-=wjNv9NK=6rTNuQUkBfngw-jvP81esrV5ZLq0RBR9qaOuA@mail.gmail.com>
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

On Thu, 16 Nov 2023 at 16:13, David Howells <dhowells@redhat.com> wrote:
>
>
> Okay, I disabled RETPOLINE, which seems like it should be the important one.
> With inlined memcpy:

Yeah, your machine really seems to hate the out-of-line call version.

It is also not unlikely that the benchmark is the perfect example of
that kind of "bad memory copy benchmark" where the actual results of
the copy are never used or touched. It's one case that sometimes makes
"rep movs" look (somewhat artificially) good, just because the
optimized rep string will do cacheline copies in L2. So if you never
touch the source or the destination of the copy, it never even gets
brought into the L1.

                 Linus
