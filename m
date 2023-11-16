Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434C535883
	for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 17:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UDnW+A2x"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9d242846194so159155966b.1
        for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 09:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700155517; x=1700760317; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U1iPlcZ3/XGhU6rtBc5tXppbT+kLnQ6bw9pSEmXipB0=;
        b=UDnW+A2x+rwmCrCV+jTCvwwCQNwkkRB4s/wfcJbU6vegQq9on9mR8MFFYs3+/ms1dN
         eU0UvxEoczaAAlOTxJ6Bx7r3tV/bnpkgx2fg5jcxIdcP9bcXs1r0gRh064iWMwvnUTX+
         liMumQAtQu6+RHTN9Y5v+nWxbBXpqRHWs6rHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700155517; x=1700760317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1iPlcZ3/XGhU6rtBc5tXppbT+kLnQ6bw9pSEmXipB0=;
        b=BCYJNBZh8U8Zkafn0RsrAbHLATkDl9KpMA0sR1uxTSTpZKR+qey0/tUZYlM6DTeSch
         mIYd5RBs6TmPE+S5QU1j28ePtL5FFZ1pE0tNAlZ3S05PIDy3sZxFzHgjTwJnuDdf8FEB
         X80M0BDvOd3DZIiaNDyVrW6TIaoDv94hlvfqm0l6bLkdgV8cQ9xz1VWaL3C50O5kT9/S
         j01wd+AKWy1rKLpHecM0fiERrLXUScmhLZVgpomfLKfdtbdpswVBMYDjLFVsi8NfdSWl
         S8LR1gT1sASxVbd4RpJNpMmbElHdGN+CFo//FX2ZCMei/1tQINDZ0uxL5qL/Cry+XX/a
         705w==
X-Gm-Message-State: AOJu0YxdYbrFRTCNlF+BGP2R3LskBKg2bAVjLGg71gi2GIIkm9NAPcIQ
	oNrCvxR/a/CU/NkD0150xv2kkXKnCddM1YTw54rKy084
X-Google-Smtp-Source: AGHT+IFQ4usnB+rU7mjPcGp+k9NPeYoukFn/Ud0tUhu92GkU9o5UF4GwxXsB2DCs6Uuwhy3tDPa2bw==
X-Received: by 2002:a17:906:7d4:b0:9e4:7b7:267d with SMTP id m20-20020a17090607d400b009e407b7267dmr12271592ejc.52.1700155517243;
        Thu, 16 Nov 2023 09:25:17 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id o16-20020a170906775000b00982a92a849asm8648898ejn.91.2023.11.16.09.25.16
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 09:25:16 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-544455a4b56so1539428a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 09:25:16 -0800 (PST)
X-Received: by 2002:aa7:c993:0:b0:53d:a17a:7576 with SMTP id
 c19-20020aa7c993000000b0053da17a7576mr13094274edt.8.1700155516281; Thu, 16
 Nov 2023 09:25:16 -0800 (PST)
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
 <4cfd4808cc694f169aa8b83547ebc74d@AcuMS.aculab.com>
In-Reply-To: <4cfd4808cc694f169aa8b83547ebc74d@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 Nov 2023 12:24:58 -0500
X-Gmail-Original-Message-ID: <CAHk-=whuKOMn73oinrTQCcNwhXNOw5eksSBiCSzxycZ--asp4Q@mail.gmail.com>
Message-ID: <CAHk-=whuKOMn73oinrTQCcNwhXNOw5eksSBiCSzxycZ--asp4Q@mail.gmail.com>
Subject: Re: [linus:master] [iov_iter] c9eec08bac: vm-scalability.throughput
 -16.9% regression
To: David Laight <David.Laight@aculab.com>
Cc: David Howells <dhowells@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	kernel test robot <oliver.sang@intel.com>, "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, 
	"lkp@intel.com" <lkp@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Christian Brauner <christian@brauner.io>, Matthew Wilcox <willy@infradead.org>, 
	"ying.huang@intel.com" <ying.huang@intel.com>, "feng.tang@intel.com" <feng.tang@intel.com>, 
	"fengwei.yin@intel.com" <fengwei.yin@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Nov 2023 at 11:55, David Laight <David.Laight@aculab.com> wrote:
>
> I presume lack of coffee is responsible for the s/movs/stos/ :-)

Yes.

> How much difference does FSRM actually make?
> Especially when compared to the cost of a function call (even
> without the horrid return thunk).

It can be a big deal.  The subject line here is an example. On that
machine, using the call to 'memcpy_orig' clearly performs *noticeably*
better. So that 16% regression was"fast  apparently at least partly
because of

  -11.0  perf-profile.self.cycles-pp.memcpy_orig
  +14.7  perf-profile.self.cycles-pp.copy_page_from_iter_atomic

where that inlined copy (that used 'rep movsq' and other things around
it) was noticeably worse than just calling memcpy_orig that does a
basic unrolled loop.

Now, *why* it matters a lot is unclear. Some machines literally have
the "fast rep string" code disabled, and then "rep movsb" is just
horrendous. That's arguably a machine setup issue, but people have
been known to do those things because of problems (most recently
"reptar").

And in most older microarchitectures it's not just the cycles in the
repat thing, it is also a pipeline stall and I think it's also a
(partial? full?) barrier for OoO execution. That pipeline stall was
most noticeable on P4, but it's most definitely there on other cores
too.

And the OoO execution batter can mean that it *benchmarks* fairly well
when you just do "rep movs" in a loop to test, but then if you have
code *around* it, it causes problems for the instructions around it.

I have this memory from my "push for -Os" (which is from over a decade
ago, to take my memory with a pinch of salt) of seeing "rep movsb"
followed by a load of the result causing a horrid stall on the load.

A regular load-store loop will have the store data forwarded to any
subsequent load, but "rep movs" might not do that and if it works on a
cacheline level you might lose out on those kinds of things.

Don't get me wrong - I really like the rep string instructions, and
while they have issues I'd *love* for CPU's to basically do "memcpy"
and "memset" without any library call overhead. The security
mitigations have made indirect calls much worse, but they have made
regular function call overhead worse too (and there's the I$ footprint
thing etc etc).

So I like "rep movs" a lot when it works well, but it most definitely
does not work well everywhere.

Of course, while the kernel test robot doesn't seem to like the
inlined "rep movsq", clearly the machine David is on absolutely
*hates* the call to memcpy_orig. Possibly due to mitigation overhead.

The problem with code generation at this level is that you win some,
you lose some. You can seldom make everybody happy.

                 Linus
