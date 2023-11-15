Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7B51D55E
	for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RquYnmfb"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507ad511315so10038318e87.0
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 08:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700067548; x=1700672348; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1sF8rVm6qSPjNpZ4MRVa5Fv/0C/XbN0BqIbvH3bfCTs=;
        b=RquYnmfb1FkQa+U2R4TkIrXSkPJ2xESi8BzfAVcjxfu12UOP/+kihkrFtsrOJP9OKs
         GHNYpebrFjWwZofAk3xWXQPAfG3GuDhztCNGv6kCpP5pORKb7aOOAMgitKlKimcQP/L7
         awm0xKakkotCd+vhlS/6R20S/AKpT6mZXO1NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067548; x=1700672348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sF8rVm6qSPjNpZ4MRVa5Fv/0C/XbN0BqIbvH3bfCTs=;
        b=bDUxWTWZltbXXtMTAUMLv+42eM5ZH5BLO6cZ4Wr4ZpDFLbdFFwOcOLH3TQSk2ruON2
         yPbYbVpaa/G0a2EyzAV03o9hxar6i1HnqJUalOn48zmnF4vBIOD4siw6cRNVd4VgD7i2
         LAMAo66DszxU88yV7EsIlB6LfavLLlJ8hmq1E8/2RmGEAx4JlMJt+f/BVv7H8SaOJNft
         K20c02XrbYf+A54H2Sjoj/EB66d9F2LObS2IjG+8AtogCbmafMX/bUOHKj/1a65LUq7g
         HyBqZYpOtDYiotM4imEQrIzZ0fkMaRPN3uDCd+kXBo1xoZabUE1yZQQIb5wiKLkBRbfW
         NVyg==
X-Gm-Message-State: AOJu0YzKtopqhnqz5DR1I3VNFlyUkfXUYY7G2NpAXu/wiqTboBmxD4/G
	mdNBicos49vaDwhh4He+7zJj47wAo1tns9mOA547/Zm8
X-Google-Smtp-Source: AGHT+IEbB5Q9+ph1a3ApOV9f3cfEoJyIjKFvg1ADLKwK3trQ78wZkxazTBKbPtUrYq7mBglHYQREiA==
X-Received: by 2002:ac2:558b:0:b0:4fb:bef0:948e with SMTP id v11-20020ac2558b000000b004fbbef0948emr8418736lfg.5.1700067547972;
        Wed, 15 Nov 2023 08:59:07 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id q7-20020a0565123a8700b004fe10276bbfsm1699439lfu.296.2023.11.15.08.59.07
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:59:07 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c788f5bf53so81585291fa.2
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 08:59:07 -0800 (PST)
X-Received: by 2002:a05:6402:1052:b0:542:d69d:d075 with SMTP id
 e18-20020a056402105200b00542d69dd075mr8367028edu.6.1700067205341; Wed, 15 Nov
 2023 08:53:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311061616.cd495695-oliver.sang@intel.com> <3865842.1700061614@warthog.procyon.org.uk>
In-Reply-To: <3865842.1700061614@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Nov 2023 11:53:08 -0500
X-Gmail-Original-Message-ID: <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
Message-ID: <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
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

On Wed, 15 Nov 2023 at 10:28, David Howells <dhowells@redhat.com> wrote:
>
> But the outcome is a bit variable and the result spaces overlap considerably.
> I certainly don't see a 17% performance reduction.  Now, this may be due to
> hardware differences.  The CPU I'm using is an Intel i3-4170 - which is a few
> years old at this point.

I tried to look at the perf profile changes in the original report,
and very little of it makes sense to me.

Having looked at quite a lot of those in the past (although certainly
less than Oliver) hat's *usually* a result of a test that is unstable.

In this case, though, I think the big difference is

  -11.0  perf-profile.self.cycles-pp.memcpy_orig
  +14.7  perf-profile.self.cycles-pp.copy_page_from_iter_atomic

which is a bit odd. It looks like the old code used to use a regular
out-of-line memcpy (and that machine doesn't have FSRM), and the new
code for some reason does it inline.

I wonder if gcc somehow decided to inline "memcpy()" in
memcpy_from_iter() as a "rep movsb" because of other inlining changes?

[ Goes out to look ]

Yup, I think that's exactly what happened. Gcc seems to decide that it
might be a small memcpy(), and seems to do at least part of it
directly.

So I *think* this all is mainly an artifact of gcc having changed code
generation due to the code re-organization.

         Linus
