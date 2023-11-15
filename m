Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AD128FE
	for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 18:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B1XJPgW+"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso2305266b.0
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 10:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700073972; x=1700678772; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G+xxF8an19N64H/pRk8mbK+sEYYkdEuOsGzAOFfR0W0=;
        b=B1XJPgW+ZpaOWYDqPR9ndG/c/wKq9Qkzs2FvyRMXGzCj/GmixHfFRXF2UyjJoe6YlV
         eqhjk7n6jnUWNPOs5iYb00a+XSSuLBK88vGuNB2hMmtCh/c435ETL//fW7KnwLvbLDxL
         vVyGlvPl/xCdskQciCWHu02LMc+7jMe0JZehc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700073972; x=1700678772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+xxF8an19N64H/pRk8mbK+sEYYkdEuOsGzAOFfR0W0=;
        b=ZNUe+XZYXCklhj1rGel/nUkiIjkErga3nfqowlPB2rL2Y22KtBRlaAKKqlP1Ikj6pg
         cZw2aeo1O1hbGaWA/1Bn9tkYuZdLvcW2DiBNN3eq+QVsRxetXmfzIGTPRrvnjJLdjA1c
         ksHnBARrO/ijHwy1RFrwOVVmtUvTAkjwX7ysQViXlyzHaWDM2i/mirRg08hjnDpaqKDS
         aP370qrRJhcDqd/XJVwiF/Bz7vPa/QMJXNn+7YcqPZ+Mbc3IFnWySmLlzzHYBGGS+bSF
         OxUPrMRjqEKeAaW6h8/dSzFrIOjoVG1M0Vc6DfWzVkRaOWIlm00JEWOQChl3/hgOqIqL
         o28Q==
X-Gm-Message-State: AOJu0Yw/bKrpDv7Qut7+6opDlW87bMk6aqkZqQRbwE93BFbhR0ahWjZt
	QfKOYsjCOrgOHz157a9cucMAJConwXvitsc4y0b85fj0
X-Google-Smtp-Source: AGHT+IGunLJVNxlPd+xIK3/13z9dZgSvVI+mowkQp6cfC8DSy4swBa8xoXbujIaxsqMotsav0e8NrA==
X-Received: by 2002:a17:906:7943:b0:9d3:e48f:30d3 with SMTP id l3-20020a170906794300b009d3e48f30d3mr13931983ejo.31.1700073972620;
        Wed, 15 Nov 2023 10:46:12 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id uz4-20020a170907118400b0099290e2c163sm7373988ejb.204.2023.11.15.10.46.11
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 10:46:11 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5446c9f3a77so27184a12.0
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 10:46:11 -0800 (PST)
X-Received: by 2002:a05:6402:1111:b0:53d:bc68:633a with SMTP id
 u17-20020a056402111100b0053dbc68633amr10573131edv.5.1700073971308; Wed, 15
 Nov 2023 10:46:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311061616.cd495695-oliver.sang@intel.com> <3865842.1700061614@warthog.procyon.org.uk>
 <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
 <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com> <4007890.1700073334@warthog.procyon.org.uk>
In-Reply-To: <4007890.1700073334@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Nov 2023 13:45:54 -0500
X-Gmail-Original-Message-ID: <CAHk-=whFGA6YPJp3zazUwBG6ort8i34vGv9utYdOgYpekyt++Q@mail.gmail.com>
Message-ID: <CAHk-=whFGA6YPJp3zazUwBG6ort8i34vGv9utYdOgYpekyt++Q@mail.gmail.com>
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

On Wed, 15 Nov 2023 at 13:35, David Howells <dhowells@redhat.com> wrote:
>
> That's not what I see.  See attached for a dump of _copy_from_iter from my
> kernel.  It's just using REP MOVSB.

Yeah, an unconditional REP MOVSB is not right either. That just means
that it performs truly horrendously badly on some machines.

Do you perhaps have CONFIG_CC_OPTIMIZE_FOR_SIZE set? That makes gcc
use "rep movsb" - even for small copies that most definitely should
*not* use "rep movsb".

Anyway, you should never use CC_OPTIMIZE_FOR_SIZE as any kind of
baseline. I'd actually love to use it in general, but it really makes
gcc do silly things when it goes for size optimizations that make no
sense at all (because it will go for size over anything else).

It turns out that on FSRM machines (ie anything really new), it's ok,
because even small constant-sized copies do work ok with "rep movsb",
but there are cases where it's absolutely horrendously bad.

                 Linus
