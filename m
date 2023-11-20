Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C915254
	for <oe-lkp@lists.linux.dev>; Mon, 20 Nov 2023 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PT9UHYCO"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5094cb3a036so6537023e87.2
        for <oe-lkp@lists.linux.dev>; Mon, 20 Nov 2023 08:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700496410; x=1701101210; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gvvrj1QlPb+xqGFyqA+peRigK3UgbxK38qicOcTMV9s=;
        b=PT9UHYCOV2XM6BCgYtHwuf+P3qiy+Ppx3FcREGzEX0SASdxPx3CwBWOlkf+71tRu8M
         I6s2GCHnQX97vKqY0axbOrC2gEpFz2F+/oYbGskm9XitCGsu+yQfk5pQenT5b/5fEekl
         k1Dia1s5jr/pSft0ChSzJ9QX1t5Q8eGwdn2Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700496410; x=1701101210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gvvrj1QlPb+xqGFyqA+peRigK3UgbxK38qicOcTMV9s=;
        b=bNorhUH4c0tY6BRK0ARGd7xWsAQDIr9D5KOg6OWbqyteaqfx9Uxmtuueln2cQrdStd
         ZN7hh6vi1mBztHpqIr7w1Y1pxepkRH9kc/7u7AJqUUQidHF9cQSJyoIBGTR6XrX+hgFi
         SJFojEGSEA43kl1lUJni1itN2zpj5YcPFoPLxBUxg3JEmcbH70X2HILsNbfQ0uiZiDDo
         VagLHqyaJH619H6SvE8Kg5QTRM0IqUqyGRUKdbtKl9Y9I1KoZm0CBXX7E4jQdzMT7ZL+
         lMiVdWMtqMIfhxj6OL/LA8AZfFb+fTQuYbn2uXVrgdNX3oGAxQoX944mjexhh3ZggruJ
         VPZQ==
X-Gm-Message-State: AOJu0Yybl2WhI4d745aeR6dyRaOiuKTKdRwo15QMB1nIDccjH3w/q/O2
	QlEr8WuMmQXSShjOxznwR+pyak9UdU8l+IdcI5VPEQ==
X-Google-Smtp-Source: AGHT+IFi+kgxbAHUZ4R/0DYmgMyzFXLesI2W9C8CWvQfuQ9ii4Bp5exmzIioBF7eayksU856xC3jzA==
X-Received: by 2002:a19:ae17:0:b0:500:a378:db71 with SMTP id f23-20020a19ae17000000b00500a378db71mr5521065lfc.57.1700496409840;
        Mon, 20 Nov 2023 08:06:49 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id mb20-20020a170906eb1400b009fc3f347109sm2059572ejb.156.2023.11.20.08.06.48
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 08:06:49 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-544455a4b56so6292253a12.1
        for <oe-lkp@lists.linux.dev>; Mon, 20 Nov 2023 08:06:48 -0800 (PST)
X-Received: by 2002:a05:6402:134c:b0:53e:4762:9373 with SMTP id
 y12-20020a056402134c00b0053e47629373mr5522481edw.18.1700496408702; Mon, 20
 Nov 2023 08:06:48 -0800 (PST)
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
 <CAHk-=whLbJ7vvB1ACVC6t44zjihX8w7GMY2y584+Fm83rsmaKg@mail.gmail.com>
 <20231117191243.GHZVe7K4vN9n5M92gb@fat_crate.local> <CAHk-=wiRQHD5xnB8H9Lwk9fJPDpfVNAwPS4KLnfrcrU3zbMAdQ@mail.gmail.com>
 <2284219.1700487177@warthog.procyon.org.uk>
In-Reply-To: <2284219.1700487177@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Nov 2023 08:06:30 -0800
X-Gmail-Original-Message-ID: <CAHk-=wid6dc9WpRdv5Gk1YL+bb9jkaMwc74b0UYA75tntq8xnw@mail.gmail.com>
Message-ID: <CAHk-=wid6dc9WpRdv5Gk1YL+bb9jkaMwc74b0UYA75tntq8xnw@mail.gmail.com>
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

On Mon, 20 Nov 2023 at 05:33, David Howells <dhowells@redhat.com> wrote:
>
> So what, if anything, should I change?

I don't think you need to worry about this.

Not that I like ignoring kernel robot report performance regressions,
because they've often been useful to find unexpected issues. But this
one seems to clearly be just a random code choice issue by the
compiler, and be very CPU-specific anyway.

We'll figure out some good way to make memcpy() a bit more reliable
wrt the code it generates, but it's not the iov_iter code that should
worry about it.

               Linus
