Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A07321AF
	for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 21:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RBTdE8n8"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507adc3381cso3248026e87.3
        for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 13:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700258271; x=1700863071; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+6VZ1GkKB2rFO5TykEwur/IyTwYdR4pBiOjNsHftfp0=;
        b=RBTdE8n89H8ghMfyuFoHBufFV9GmlLw95paZIp22tpn4mjdLNnVnZqt3q7tfCh26jy
         kWs7QmczfAXeTZuv8RPrOZBu36BLs0STnmFSlrnqckQZlw0GEl+qJS/W0PXIvc2Dpgc+
         okk5LHO/FHmIGoDU0RXDoLXeMNysM6MYxPtnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700258271; x=1700863071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6VZ1GkKB2rFO5TykEwur/IyTwYdR4pBiOjNsHftfp0=;
        b=EBFeN386Nozvz/7gdUGIjeXIodTv4tzzaCiCKTWsDVVFAKPdobAgT8XQPIsub12Eus
         I2duWGudmxLkkBi0GDJRBHNaeqTTZ0sPKAC24QN/M0DGgKnO5J7sAFRbJO39zqR/FCkc
         hg0rECqwm6Ab/3I8bneVoZX766/x5z5R4L89zpf668ZCC253z4sjxBUJT/RGKhEOefjZ
         jPYVRkFE4w2Mt/sP4RSZDJGCctX/DQyoOI/XEvCN+qt/tzZuXijJvn/diQcRqMz+VdIv
         8vRkGwDSYNs8CcPvKrMkFax78Ef4kQE8fPAuRVuc+VFuhg4uyyB7qkf1lG9ys5aN4sM1
         fyGw==
X-Gm-Message-State: AOJu0YyuMPv1AE0xPUQFTmo5GZJWdHgxdDXrN/Dlj/W64SEeBuHUdZhB
	EGj3sd6kfYlILlGOmZTFPDQFRPboNx6sESUsn6Ouuc5T
X-Google-Smtp-Source: AGHT+IHJ4BCcS4fFeV5a+WjUadjHsdwUM7msKVJkOCTvGD5Ajq49sf+Wmtz84ykYuHJPxrKtfFQ99g==
X-Received: by 2002:a05:6512:3c9b:b0:509:8d86:bbf0 with SMTP id h27-20020a0565123c9b00b005098d86bbf0mr608384lfv.42.1700258270999;
        Fri, 17 Nov 2023 13:57:50 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004fe3a8a9a0bsm357358lfn.202.2023.11.17.13.57.50
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 13:57:50 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-507cee17b00so3240478e87.2
        for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 13:57:50 -0800 (PST)
X-Received: by 2002:ac2:4552:0:b0:509:4530:e7fb with SMTP id
 j18-20020ac24552000000b005094530e7fbmr598249lfm.32.1700258270001; Fri, 17 Nov
 2023 13:57:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
 <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
 <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com>
 <20231115190938.GGZVUXcuUjI3i1JRAB@fat_crate.local> <CAHk-=wh0TcXyGmKHfs+Xe=5Sd5bNn=NNV9CEtOy_tbyHAAmk9g@mail.gmail.com>
 <232440.1700153046@warthog.procyon.org.uk> <864270.1700230337@warthog.procyon.org.uk>
 <20231117160940.GGZVeQRLgLjJZXBLE1@fat_crate.local> <CAHk-=wj33FoGBQ7HkqjLbyOBQogWpYAG7WUTXatcfBF5duijjQ@mail.gmail.com>
 <CAHk-=whLbJ7vvB1ACVC6t44zjihX8w7GMY2y584+Fm83rsmaKg@mail.gmail.com> <20231117191243.GHZVe7K4vN9n5M92gb@fat_crate.local>
In-Reply-To: <20231117191243.GHZVe7K4vN9n5M92gb@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Nov 2023 13:57:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiRQHD5xnB8H9Lwk9fJPDpfVNAwPS4KLnfrcrU3zbMAdQ@mail.gmail.com>
Message-ID: <CAHk-=wiRQHD5xnB8H9Lwk9fJPDpfVNAwPS4KLnfrcrU3zbMAdQ@mail.gmail.com>
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

On Fri, 17 Nov 2023 at 11:13, Borislav Petkov <bp@alien8.de> wrote:
>
> I wouldn't want to optimize some weird loads. Especially if you have
> weird loads which perform differently depending on what uarch
> "optimizations" they sport.
>
> I guess optimizing for the majority of machines - modern FSRM ones which
> can do "rep; movsb" just fine - is one way to put it. And the rest is
> best effort.

Yeah, we shouldn't optimize for microbenchmarks in particular.

The kernel robot performance reports have been interesting, because
they do end up often pointing to real issues. But we've had these
kinds of things too, where the benchmark is just odd and clearly
happens to trigger something that is just very machine-specific.

So I don't think we should use either of these benchmarks as a "we
need to optimize for *this*", but it is another example of how much
memcpy() does matter. Even if the end result is then "but different
microarchitectrues react so differently that we can't please
everybody".

            Linus
