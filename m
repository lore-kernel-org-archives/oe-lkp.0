Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E3F3DB8F
	for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TXQixEnt"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c50ec238aeso566861fa.0
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 12:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700078863; x=1700683663; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WW2Yloo89o/8fjCDn3VtwHsMIhFIpKiAMzGXOe2NTzA=;
        b=TXQixEntkWX+4RmAxLJBlgJUvzVMq7npaIiMRGQjc4EyjOA/Y94Yr6dHwBwYK+JFXS
         WKR9I62i4G/2k8HSHu5+Xq5MnZ6tQUskCsF0UjkxfUfuDGmlUbAwBbdrmZS/sDH5DZDG
         5oU/yIb5cSAHjODS8IOJpGqOdcwlJmiKw+d38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700078863; x=1700683663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WW2Yloo89o/8fjCDn3VtwHsMIhFIpKiAMzGXOe2NTzA=;
        b=XlPz7LS+FsbRLIgiYNqA13QlJYVmUpxZdTu5tUGFXr8Z+ThBUhtMiyL59uT/paXmbT
         /1DnmIBp/wmEYV4QcAlJ361LbemmrcSxU8CosD06OTq0fJGv5iwT+2SbXOZyOVxZkAwo
         g3p8RZnIMPrlDxfSaYlrpV7bD6c1Rg7VAWjT3FDRJFDpLaGqfYzjjEWG4LDVtnfb6b6B
         r49glxGw3i36rrCwYB/8VWtTdjXIlejO10L+0GkBEzJoSnVvqdcrkFBZ596JsPRcoxIl
         p8odIgIyRzyYXRhBUqiI5Nq/AW3YQ0L7hH3KMxwmMnnqHOkXu3R3qBa68vhM1Iykjma8
         rRzw==
X-Gm-Message-State: AOJu0YwyTPy4p1UYDCgCUgv4fDKXmS3hGUII5SnGAgk4XCDs9KObB41Y
	f6hARelzH87u8v1c+6AzdR783wAH31P3nw2A+zRTe18N
X-Google-Smtp-Source: AGHT+IHrSiy5HRPT8tHWwQ9IUkVHjFksw9vmRG+1zVA82izucxGQqK8xuppxlZW2F5jX1xfZhaiRpw==
X-Received: by 2002:a2e:9dc8:0:b0:2c2:c38b:2141 with SMTP id x8-20020a2e9dc8000000b002c2c38b2141mr4528024ljj.49.1700078863604;
        Wed, 15 Nov 2023 12:07:43 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002ba586d27a2sm1757927ljj.26.2023.11.15.12.07.41
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 12:07:42 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507adc3381cso22740e87.3
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 12:07:41 -0800 (PST)
X-Received: by 2002:ac2:488d:0:b0:509:4c7b:c734 with SMTP id
 x13-20020ac2488d000000b005094c7bc734mr9119876lfc.20.1700078861508; Wed, 15
 Nov 2023 12:07:41 -0800 (PST)
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
 <20231115190938.GGZVUXcuUjI3i1JRAB@fat_crate.local> <CAHk-=whFW+uWOmOtRNh0What_fu8Xo8KF2+EeUH1kn4qFxGAhA@mail.gmail.com>
In-Reply-To: <CAHk-=whFW+uWOmOtRNh0What_fu8Xo8KF2+EeUH1kn4qFxGAhA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Nov 2023 15:07:24 -0500
X-Gmail-Original-Message-ID: <CAHk-=whrc-ruKs4Kt90EGzKd+pYhZFKs6bgBVCV=55BK+p1nzg@mail.gmail.com>
Message-ID: <CAHk-=whrc-ruKs4Kt90EGzKd+pYhZFKs6bgBVCV=55BK+p1nzg@mail.gmail.com>
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

On Wed, 15 Nov 2023 at 14:15, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So my patch really is broken. It might happen to work when everything
> else goes right, and it's small, but it is very much a "proof of
> concept" rather than something that is actually acceptable.

More breakage details

 (a) need to not do this with the boot code and EFI stub code that
doesn't handle alternatives.

     It's not a huge deal in that obviously both alternatives work,
but it causes build issues:

      ld: error: unplaced orphan section `.altinstructions' from
`arch/x86/boot/compressed/misc.o'
      ld: error: unplaced orphan section `.altinstr_replacement' from
`arch/x86/boot/compressed/misc.o'
      ...

     etc

 - our current "memcpy_orig" fallback does unrolled copy loops, and
the rep_movs_alternative fallback obviously doesn't.

It's not clear that the unrolled copy loops matter for the in-kernel
kinds of copies, but who knows. The memcpy_orig code is definitely
trying to be smarter in some other ways too. So the fallback should
try a *bit* harder than I did, and not just with the whole "don't try
to handle exceptions" issue I mentioned.

              Linus
