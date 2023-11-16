Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EF8847D
	for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 03:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F9Kve21A"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5446c9f3a77so552742a12.0
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 19:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700105209; x=1700710009; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpw5N7hLJVBmWx1YZh3JJftpK5bs0D0hrTfIHC0Li88=;
        b=F9Kve21Ary547BmC8Lum/dMaSHH31LrtVwOOnyDZCJOH21e1QWEeGyN4+s9v2k42HI
         zCJKn8Ne3chbzz7kaGoTSC2MJ9zmVRtRzD1ZDZCyZMZgykIpy6ZhnYtq+ocbXmz9gp40
         DMm1TSHMYAJLmOHIbmn0wyB5tvGh1pjBrF6xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700105209; x=1700710009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lpw5N7hLJVBmWx1YZh3JJftpK5bs0D0hrTfIHC0Li88=;
        b=tnplN7IatTZjxxCRjkml2Art+HkUbEz9LPljiK/5FIVouYB5/A7GbUvg66/yI48+mE
         OUzzPuTF7JwqOoXuktQMRPuwMRMsVjb6eEOtZS/KZUqMeOkfxro8kCLBmoHZlP8zKAQR
         Q3Y8ZDe6XAk3uKGVfVuk4PWQ3x+h4K585ITnXIkCAe9Ui+zEftgr2mcfokKxC2R9tNTl
         UYGK+VDuYPEqTIaNkyOLM0sE4NSC7i0VTyjGoxKAEj7JvyjjNHiHjs+FpLlwVqVdDS+0
         t67Puk4/nFgvIcS3zAu8sgqHOeoV0p2iJ8lEo4eA0LKkAjgXEKQLhXXa5bvCBCzyF6GO
         7xyA==
X-Gm-Message-State: AOJu0YxUdwUax79cQlIdnBHrsbbG37lWbgR6mjHKpD0O5oJAdkYuu8WN
	LFWYqJxTf+/Sylfnl8d1sjdmkIyXy6bVJquGT9I3v5+W
X-Google-Smtp-Source: AGHT+IEMKRgeWc6VYIaHuJHIH5mQAoz3/Oi426vsHP+DYRfWdb86DEihIT9/SS8NaTjRQtAaQA6YAw==
X-Received: by 2002:a17:906:b78c:b0:9bf:f20:8772 with SMTP id dt12-20020a170906b78c00b009bf0f208772mr11497875ejb.26.1700105209115;
        Wed, 15 Nov 2023 19:26:49 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id rv27-20020a17090710db00b009e71efcce28sm7833437ejb.210.2023.11.15.19.26.47
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 19:26:48 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53df747cfe5so526236a12.2
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 19:26:47 -0800 (PST)
X-Received: by 2002:a05:6402:1111:b0:53d:bc68:633a with SMTP id
 u17-20020a056402111100b0053dbc68633amr11218507edv.5.1700105207537; Wed, 15
 Nov 2023 19:26:47 -0800 (PST)
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
 <42895.1700089191@warthog.procyon.org.uk>
In-Reply-To: <42895.1700089191@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Nov 2023 22:26:30 -0500
X-Gmail-Original-Message-ID: <CAHk-=wi7gdgFM4tnLXfE4cj2XiKNARbGY-N2aF5h9CMaN6JUbA@mail.gmail.com>
Message-ID: <CAHk-=wi7gdgFM4tnLXfE4cj2XiKNARbGY-N2aF5h9CMaN6JUbA@mail.gmail.com>
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

On Wed, 15 Nov 2023 at 18:00, David Howells <dhowells@redhat.com> wrote:
>
> And using __memcpy() rather than memcpy():

Yeah, that's just sad. It might indeed be that you're running on a
Haswell core, and the retpoline overhead just kills that entirely. You
could try building the kernel without mitigations (or booting with
them off, which isn't quite as good) to verify.

> A disassembly of _copy_from_iter() for the latter is attached.  Note that the
> UBUF/IOVEC still uses "rep movsb"

Well, yes and no.

User copies do that X86_FEATURE_FSRM alternatives dance, so the code
gets generated with "rep movs", but you'll note that there are several
'nops' after it.

Some of the nops are because we'll be inserting STAC/CLAC (three bytes
each, I think) instructions around user accesses for SMAP-capable
CPU's.

But some of the nops are because we'll be rewriting that "rep stosb"
(two bytes, iirc) as "call rep_stos_alternative" (5 bytes) on CPU's
that don't do FSRM like yours. So your CPU won't actually be executing
that 'rep stosb' sequence.

And yes, the '__x86_return_thunk' overhead can be pretty horrific. It
will get rewritten to the appropriate thing by "apply_returns". But
like the "rep movs" and the missing STAC/CLAC, you won't see that in
the objdump, you only see it in the final binary.

                    Linus
