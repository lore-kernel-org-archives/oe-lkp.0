Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21363EA8E
	for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="g7AAK/Mf"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c5087d19a6so13150951fa.0
        for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 08:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700153317; x=1700758117; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UKTCm7ggbJLm3ZHcQ81iQju2vexC4L52XL08aMMC/TA=;
        b=g7AAK/Mf5/kJ5raEJND/vYAS7lFBRc8KAyafotPNCiT7Lrjj/uD14b5Ky6g6TLpDPf
         kRZIS+2LUlkjiY8uQoruRWaLEH0foRvl/UL/bj68TVR5Y49DPw5aRhcObHPVe5Ge6qNS
         zt4/KhiTy3BXSHO7gWwop7YhzEl1LoJLE2jug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700153317; x=1700758117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKTCm7ggbJLm3ZHcQ81iQju2vexC4L52XL08aMMC/TA=;
        b=IfNVZUWS1kh/6Oa2U/DGmLAfNP9eIsHyngBmu1UvH+ZtWXlqkIZPKgh9xeVQxxtQM7
         p9CeucfDjpsEi1V505y0XVR2kd2DArjVJvGOpdpYON51JUIzUNwTcTiPwOigxXv15fEx
         yg8rEJ0W5VCV+LqUwLO9mPuQ3Js2bESDh5IcIKWb/PTGNwRd1n2jQVGZtswz1mAetDsp
         MR6G++xEW4jU1mYShmd26ODwDbnS8kgyKxi1wyYrbXSZBlCfVS+3a0r8/Ng4Z6BzdkR4
         rRFmhQvtw9Uq1pfh6La795LB2qgpPKwdGE7o/TlzCpt6utBOw7lxgEKxg84EeiA8jCPS
         kYLg==
X-Gm-Message-State: AOJu0YyjXjgDP1d0Y4DvKB4m3NoKlkdcaCMq0PTQzTiRm1mAoIq08AaY
	Co9P4wjAIrI8Q95WkFH12OPK+K5JNvABwJjkKhIam09F
X-Google-Smtp-Source: AGHT+IE6COvucyLo6z8r1ltuHQxLFkpvR4WeXz901AwkMrThhI9He5QYWIArglwT1xrgK/BCbocm5w==
X-Received: by 2002:a2e:a4a2:0:b0:2c5:6d8:8dfc with SMTP id g2-20020a2ea4a2000000b002c506d88dfcmr7330235ljm.13.1700153317385;
        Thu, 16 Nov 2023 08:48:37 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id z20-20020a170906241400b0099bc80d5575sm8583687eja.200.2023.11.16.08.48.36
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 08:48:36 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54553e4888bso1495515a12.2
        for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 08:48:36 -0800 (PST)
X-Received: by 2002:aa7:d510:0:b0:533:520:a5a8 with SMTP id
 y16-20020aa7d510000000b005330520a5a8mr12500577edq.29.1700153316001; Thu, 16
 Nov 2023 08:48:36 -0800 (PST)
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
 <20231115190938.GGZVUXcuUjI3i1JRAB@fat_crate.local> <CAHk-=wh0TcXyGmKHfs+Xe=5Sd5bNn=NNV9CEtOy_tbyHAAmk9g@mail.gmail.com>
 <20231116154406.GDZVY4xmFvRQt0wGGE@fat_crate.local>
In-Reply-To: <20231116154406.GDZVY4xmFvRQt0wGGE@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 Nov 2023 11:48:18 -0500
X-Gmail-Original-Message-ID: <CAHk-=wjGQh3ucZFmFR0evbKu2OyEuue-bOjsrnCvxSQdj8x6aw@mail.gmail.com>
Message-ID: <CAHk-=wjGQh3ucZFmFR0evbKu2OyEuue-bOjsrnCvxSQdj8x6aw@mail.gmail.com>
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

On Thu, 16 Nov 2023 at 10:44, Borislav Petkov <bp@alien8.de> wrote:
>
> Reportedly and apparently, this pretty much addresses the issue at hand.
> However, I'd still like for the compiler to handle the small length
> cases by issuing plain MOVs instead of blindly doing "call memcpy".
>
> Lemme see how it would work with your patch...

Hmm. I know about the '-mstringop-strategy' flag because of the fairly
recently discussed bug where gcc would create a byte-by-byte copy in
some crazy circumstances with the address space attributes:

    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111657

But I incorrectly thought that "-mstringop-strategy=libcall" would
then *always* do library calls.

So I decided to test, and that shows that gcc still ends up doing the
"expand small constant size copies inline" even with that option, and
doesn't force library calls for those cases.

IOW, my assumption was just broken, and using
"-mstringop-strategy=libcall" may well be the right thing to do.

Of course, it's also possible that with all the function call overhead
introduced by the CPU mitigations on older CPU's, we should just say
"rep movsb" is always correct - if you have a new CPU with FSRM it's
good, and if you have an old CPU it's no worse than the horrendous CPU
mitigation overhead for function call/returns.

I really hate the mitigations. Oh well.

Ayway, maybe your patch is the RightThing(tm). Or maybe we should use
'rep_byte' instead of 'libcall'. Who knows..

             Linus
