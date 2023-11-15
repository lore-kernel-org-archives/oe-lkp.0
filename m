Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C351EB47
	for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 19:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DB+boQqs"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-507bd64814fso10395237e87.1
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 11:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700075766; x=1700680566; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ASZLC/ODVoT1N8Pjpom0HFAzc3MgwAYR1S4lEQGUD4=;
        b=DB+boQqsLtpiiOOkYS2n65JJ6g+XR1YeK2QReD3dGJ3ju919MTuIUvM2FlqdKjQs8i
         Z3f+hMQlEjryjsXfFYn9y6pNfSQ+U5y1Tpk3uqNMWZ7B33y46fEk40w0SXVlD4L7jBLf
         7nxtKs+yONbdmpS5ROGJFwmyLiT52JIt/yVS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700075766; x=1700680566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ASZLC/ODVoT1N8Pjpom0HFAzc3MgwAYR1S4lEQGUD4=;
        b=ErorgXCOYnn994haMV0EDWH4aGy7TxgjsVgz/jthCUGFve4lIO1q9GRGRuY2jCEKZS
         9pnPVKTlyYmjPjh1vo8msLUeGFAQnKKUKYxxOmG2rDelzGpWklwWp5zgXEEyLOHOLWnJ
         hqdSqIBgqs59iLy0BGVT0hCg57OJmDAtLARzrceQUBZ5EMPOSdtB0Wn/YlZUKiGY5Oeo
         ePLSaILIb+dsk66bLKCkybaQFRDrLRnqRatqVwW7ZaKXEK0grbiOjFK2NJlLqGCn7Vxu
         0c08psjrtLcb0MWlXe8QYSm41WV6RyvKPIGj5WDOYRejpq1F9lRTZ+nFEJhY/tH/WL4s
         3WiQ==
X-Gm-Message-State: AOJu0Yw0p7HMcfhcTEaD576ilai8sf0jhThHDCx41KtflwGQT1oXGU7x
	HA/0FIiriDyoc+PdfOB+cUeMDv0Iim7bfFvwLXaVu0Na
X-Google-Smtp-Source: AGHT+IEWNKMalRysoLr3XoaUShhPvdvxIffc2h4qErbhdshf3pCObrGVyk28rqX4O2Gc7TMknFvveA==
X-Received: by 2002:a19:a40a:0:b0:500:daf6:3898 with SMTP id q10-20020a19a40a000000b00500daf63898mr214858lfc.26.1700075765874;
        Wed, 15 Nov 2023 11:16:05 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id t9-20020a1709066bc900b009b27d4153c0sm7537195ejs.178.2023.11.15.11.16.03
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 11:16:03 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53ed4688b9fso67093a12.0
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 11:16:03 -0800 (PST)
X-Received: by 2002:a05:6402:5193:b0:543:5789:4d6c with SMTP id
 q19-20020a056402519300b0054357894d6cmr292256edd.2.1700075763431; Wed, 15 Nov
 2023 11:16:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311061616.cd495695-oliver.sang@intel.com> <3865842.1700061614@warthog.procyon.org.uk>
 <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
 <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
 <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com> <20231115190938.GGZVUXcuUjI3i1JRAB@fat_crate.local>
In-Reply-To: <20231115190938.GGZVUXcuUjI3i1JRAB@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Nov 2023 14:15:46 -0500
X-Gmail-Original-Message-ID: <CAHk-=whFW+uWOmOtRNh0What_fu8Xo8KF2+EeUH1kn4qFxGAhA@mail.gmail.com>
Message-ID: <CAHk-=whFW+uWOmOtRNh0What_fu8Xo8KF2+EeUH1kn4qFxGAhA@mail.gmail.com>
Subject: Re: [linus:master] [iov_iter] c9eec08bac: vm-scalability.throughput
 -16.9% regression
To: Borislav Petkov <bp@alien8.de>
Cc: David Howells <dhowells@redhat.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Christian Brauner <christian@brauner.io>, 
	Matthew Wilcox <willy@infradead.org>, David Laight <David.Laight@aculab.com>, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 14:10, Borislav Petkov <bp@alien8.de> wrote:
>
> Should we define an alternative_memcpy() which is used *only* during
> rewriting so that this becomes a non-issue?

Yeah, I think the instruction rewriting should use something that
explicitly cannot possibility itself need rewriting, and a plain
'memcpy()' is obviously that.

The good news is that at least things like structure copies would
*not* trigger that alternative, so it's only explicit memcpy() calls
that my patch changes. But I would not be surprised if instruction
rewriting does that. I didn't actually check.

> Yours looks simple enough and makes sense. Lemme poke at it a bit in the
> coming days and see what happens.

Note that it has a nasty interaction with fortify-source, which is why
it has that hacky "#undef memcpy" in that unrelated header.

Also note that I was being very very lazy in how I re-used the
"rep_movs_alternative" function that we already have. And it's
actually a bad laziness, because our existing rep_movs_alternative
does the exception handling for user mode faults.

We don't actually want exception handling for 'memcpy()', because it
could hide bugs. If a memcpy() gets a bad pointer, we want the oops,
not a partial copy.

So my patch really is broken. It might happen to work when everything
else goes right, and it's small, but it is very much a "proof of
concept" rather than something that is actually acceptable.

               Linus
