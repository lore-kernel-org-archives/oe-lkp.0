Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89485DF6E
	for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MQJU4c3F"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5484ef5e3d2so646233a12.3
        for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 05:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700228185; x=1700832985; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j4nL6lMcchz3OqRF6Jql0QZtDg2jb+Lp1wFMbOZWnTY=;
        b=MQJU4c3F0zMVSWwijvNEcM6CVFNymAAENKQhImIR4F4zlKa+xo6/wjvd/a6kFOk4xJ
         X40M+ym2eyKT7ceSGaKUjti9hsW43ZkDu+jZk8ScUEYIbz0ZqIgIjK3I+BgE84JAbcYi
         sdjV9VgXFGM5AVpj6OEau+2vM5pFJdHZCIJ64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700228185; x=1700832985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4nL6lMcchz3OqRF6Jql0QZtDg2jb+Lp1wFMbOZWnTY=;
        b=FJ33HVFKeVdIbFPrJPpMV+BwA+dEQe+KZQakzxvh69ipbdmZbE949Gtsk2/oVtUOuM
         FHTTLBzV3p5mGeeUQjWG4gNKpYPt1izJQT/MGTVmY/tADFa0hwVmZMZkaoOi55rUyPxj
         O+BjJEcghSfFKBCKxEQojdVSDbEw/NRagfb6pMhBb87hci2eyepLq7Uzm5vDLgPH5Rsq
         TAIP4KNPazfrRQq9lNJG6ypZGKjezpNv4gBSo9tfSGvltU/DS+/cnDQ1UAPmuxPboMuK
         BFcA51g5oFAGGi5pCjn0Dpg2wrx7BhJDf6lDmhnMGwxnZZQeol5pPJlEYeS3S5RdgIUj
         GWZA==
X-Gm-Message-State: AOJu0YyD7y01Ruhr0q3XKakyOloyD9DCYoFFZfPm06iTe82LQhxiWQXb
	aib7fWJL/kfXKPrODxzmhEA5sRUmf53GftEtg3X2WR3X
X-Google-Smtp-Source: AGHT+IFMj2w8LeHGZBIFk4GsZm5aAMuBUNQooPslv1oQWjdtwRSjWl87N11dGzJGMLjVAAI+7Goj5A==
X-Received: by 2002:aa7:db4d:0:b0:545:4ca7:6eee with SMTP id n13-20020aa7db4d000000b005454ca76eeemr13471474edt.22.1700228185702;
        Fri, 17 Nov 2023 05:36:25 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7c402000000b0053d9cb67248sm728671edq.18.2023.11.17.05.36.21
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 05:36:22 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5484ef5e3d2so646109a12.3
        for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 05:36:21 -0800 (PST)
X-Received: by 2002:a05:6402:55:b0:543:5927:f969 with SMTP id
 f21-20020a056402005500b005435927f969mr14403549edu.3.1700228181455; Fri, 17
 Nov 2023 05:36:21 -0800 (PST)
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
 <20231116154406.GDZVY4xmFvRQt0wGGE@fat_crate.local> <CAHk-=wjGQh3ucZFmFR0evbKu2OyEuue-bOjsrnCvxSQdj8x6aw@mail.gmail.com>
 <20231117114421.GCZVdSFZ7DKtBol821@fat_crate.local> <67acdf70c3fd4adf9bc0dddd4b10d4a1@AcuMS.aculab.com>
In-Reply-To: <67acdf70c3fd4adf9bc0dddd4b10d4a1@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Nov 2023 08:36:03 -0500
X-Gmail-Original-Message-ID: <CAHk-=wjjF7tQ4ycPiA4gbYqF-dpTQx+VVHCDqjWR=ogqNUR51g@mail.gmail.com>
Message-ID: <CAHk-=wjjF7tQ4ycPiA4gbYqF-dpTQx+VVHCDqjWR=ogqNUR51g@mail.gmail.com>
Subject: Re: [linus:master] [iov_iter] c9eec08bac: vm-scalability.throughput
 -16.9% regression
To: David Laight <David.Laight@aculab.com>
Cc: Borislav Petkov <bp@alien8.de>, David Howells <dhowells@redhat.com>, 
	kernel test robot <oliver.sang@intel.com>, "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, 
	"lkp@intel.com" <lkp@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Christian Brauner <christian@brauner.io>, Matthew Wilcox <willy@infradead.org>, 
	"ying.huang@intel.com" <ying.huang@intel.com>, "feng.tang@intel.com" <feng.tang@intel.com>, 
	"fengwei.yin@intel.com" <fengwei.yin@intel.com>, 
	linux-toolchains ML <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Nov 2023 at 08:09, David Laight <David.Laight@aculab.com> wrote:
>
> Zero length copies are different, they always take ~60 clocks.

That zero-length thing is some odd microcode implementation issue, and
I think intel actually made a FZRM cpuid bit available for it ("Fast
Zero-size Rep Movs").

I don't think we care in the kernel, but somebody else did (or maybe
Intel added a flag for "we fixed it" just because they noticed)

I at some point did some profiling, and we do have zero-length memcpy
cases occasionally (at least for user copies, which was what I was
looking at), but they aren't common enough to worry about some small
extra strange overhead.

(In case you care, it was for things like an ioctl doing "copy the
base part of the ioctl data, then copy the rest separately".  Where
"the rest" was then often nothing at all).

> My current guess for the 5000 clocks is that the logic to
> decode 'rep movsb' is loaded into a buffer that is also used
> to decode some other instructions.

Unlikely.

I would guess it's the "power up the AVX2 side". The memory copy uses
those same resources internally.

You could try to see if "first AVX memory access" (or similar) has the
same extra initial cpu cycle issue.

Anyway, the CPU you are testing is new enough to have ERMS - that's
the "we do pretty well on string instructions" flag. It does indeed do
pretty well on string instructions, but has a few oddities in addition
to the zero-sized thing.

The other bad cases tend to be along the line of "it falls flat on its
face when the source and destination address are not mutually aligned,
but they are the same virtual address modulo 4096".

Or something like that. I forget the exact details. The details do
exist, but I forget where (I suspect either Agner Fog or some footnote
in some Intel architecture manual).

So it's very much not as simple as "fixed initial cost and then a
fairly fixed cost per 32B", even if that is *one* pattern.

                Linus
