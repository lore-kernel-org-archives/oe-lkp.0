Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3936E57A
	for <oe-lkp@lists.linux.dev>; Thu,  4 May 2023 18:56:32 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so20282387a12.0
        for <oe-lkp@lists.linux.dev>; Thu, 04 May 2023 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1683226591; x=1685818591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3KrGRxES7yi69TfDGsEI+bo95SlGqJYT0mXPM1FxOQ=;
        b=Z1L2Sn+N5TgrdO9tqr9/4QraLBAKu8sysz9/Vq0ah1ytoVYTAV093sEvwDNfsqvdEf
         w4QhJ68h7RBItbtGCONt699d1s69Qat6Xi1ULqD+2kwCphzkoA8gQ5IxZsfODsPyGoVm
         zT3EmNUEnOEHAecClPTcJc4sqMU0qdXHwC5xY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683226591; x=1685818591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3KrGRxES7yi69TfDGsEI+bo95SlGqJYT0mXPM1FxOQ=;
        b=dsC90zo7h8Ql15Mg2AxEnM7/HBhFgtfOTeYi45Mz0i6oljx/+mgJwMt+GkL9/n0fgA
         gXjvVAYCBlTnii0qBmsC766VS2LgIqBf74ypFdQ2OnscXTYgd29hlPn1jpQZosdkp2Uq
         t0xkXT32UXOi8lUHgoKG/hRtW2fGc5k1zYWKFLtVfAeqKWhpav4tYnf5AE4BloMHmbZ/
         M8q6Nvp/wcm1omNUVHOkgDnbSaOPOgWpVum+FHGNz1AjHC3dt3q5RrxUbKTSa2nYIPkg
         J00e38d2vjM/UbR2SuALS9tMk/p/HdGF8VkzOZe7kNCqOhYf1tJmiKOSITAwfW3IwX9z
         UtVQ==
X-Gm-Message-State: AC+VfDyAFUpa/SySdgaOII0DyHZxAeUwAECMO80EIklMBbv8WOJVs2xZ
	qTeycsYFITFZbE/4VavCCH1YpVEQ/Pi7NtHq9eMMMVxo
X-Google-Smtp-Source: ACHHUZ6qlah+iETUhrNKOMWbo1i/sZni38TouzuRWkC8U4r3NhFoXP12XavWyx8Vp0lWfBs2VVA9RA==
X-Received: by 2002:a17:907:7b99:b0:965:5046:f446 with SMTP id ne25-20020a1709077b9900b009655046f446mr5965946ejc.9.1683226590574;
        Thu, 04 May 2023 11:56:30 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906595600b0094ed3abc937sm18906153ejr.82.2023.05.04.11.56.29
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 11:56:30 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so20130626a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 04 May 2023 11:56:29 -0700 (PDT)
X-Received: by 2002:a17:907:96a8:b0:94a:643e:9e26 with SMTP id
 hd40-20020a17090796a800b0094a643e9e26mr6489766ejc.14.1683226589525; Thu, 04
 May 2023 11:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305041446.71d46724-yujie.liu@intel.com> <CAHk-=wgYqsXvK0zA0o061NSkc=dXX4LoP_4m41TyskN9RHrojQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgYqsXvK0zA0o061NSkc=dXX4LoP_4m41TyskN9RHrojQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 May 2023 11:56:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjMz_=WyfQMx1ebofeq+w6Cr_kRcJ1Xc=D6iKc4My16bQ@mail.gmail.com>
Message-ID: <CAHk-=wjMz_=WyfQMx1ebofeq+w6Cr_kRcJ1Xc=D6iKc4My16bQ@mail.gmail.com>
Subject: Re: [linus:master] [x86] adfcf4231b: blogbench.read_score -10.9% regression
To: kernel test robot <yujie.liu@intel.com>, Frank Denis <j@pureftpd.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 10:39=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And I suspect that the 'blogbench.read_score' thing probably does
> mostly big reads, and really really liked the cacheline optimizations
> of 'rep movs' even when it was slow in other things.

Oh, and I went to look at the blogbench code, and it's a
*horrifically* bad benchmark for this case.

It may actually be a good benchmark for other things - the "look up
random filenames" etc might be somewhat indicative of real performance
on some loads.

But the read() system call part is very much *not* good.

It looks like the reason blogbench likes 'rep movs' is the traditional
reason why memory copy benchmarks tend to like uncached copies: it
looks like the benchmark doesn't actually even look at the data it
reads.

It's a common pattern, but it's a bad pattern. It's not very different
from doing CPU benchmarks using an empty loop:

     for (int i =3D 0; i < 1000000; i++) /*nothing*/;

and then being surprised when the compiler optimized the loop away
because it doesn't actually *do* anything.

Of course, unlike the empty loop, the kernel will still do the reads,
but the kernel will do the reads with the assumption that the result
matters.

And for blogbench, that is *doubly* not the case.

Because it looks like blogbench does a loop over

        read_dummy_file(file_name);

which will open that file, and then loop over

        #define READ_CHUNK_SIZE 65536
        ...
            static char garbage[READ_CHUNK_SIZE];
        ..
        loop:
                if ((readen =3D read(fd, garbage, sizeof garbage))

and that variable is very appropriately named indeed. It is very much garba=
ge.

So it really looks like what is going on is that you have

 (a) a threaded application (looks like N=3D100 for reads by default)

 (b) doing 'read()' calls into a *shared* buffer in parallel

 (c) and never using the buffer for anything else

which means that a memory copy that does non-temporal writes is going
to look artificially really good, because nobody wants to ever see the
end result.

Now, the "nobody wants to ever see the end result", might actually be
at least _partially_ valid in some historical setting, if you were to
use DMA to then push things out to a network. Back in the olden days,
that was actually a valid reason to use non-temporal writes, because
the DMA would have to invalidate the caches anyway.

So that part is wrong, but isn't necessarily *horrifically* wrong.
It's just bad.

But using one shared destination buffer for N readers is *completely*
bogus. Any cache-lines would bounce around like crazy for the
(pointless) sharing. I'd like to call it "false sharing", but it's not
really false: it's intentionally just using one big shared buffer as a
sink for all these read() calls.

End result: I think the benchmark scores for reading are entirely
pointless random numbers, and trying to optimize the kernel for this
benchmark is exactly the wrong thing to do.

The benchmark doesn't actually do anything half-way valid.

At a *minimum* that benchmark should have different threads using
different read() buffers.

I suspect it might be a good idea to also touch some of the data,
because that would be the normal situation (even with old-style
zero-copy DMA you'd probably not do raw file data and push it out to
the network unmodified).

Because otherwise you will always find that objectively bad memory
copies will do better than a good memory copy that makes sense.

Anyway, that was a very long-winded way of saying that I will not use
that benchmark as a reason to touch the kernel "copy_to_user()"
implementation.

Of course, that's not to say that this might not be a real regression
on real loads, but I'd want to see those other numbers.

It looks like this is an old benchmark that hasn't been touched in
years (just going by the github activity), but I'm cc'ing the author
anyway, and will add a pointer to this email as a github issue. Maybe
the developer cares, maybe he doesn't, but no reason not to at least
mention this and see if maybe the benchmark can be improved to at
least use a thread buffers for the reads.

(The same issues are true for the writing side too, of course, but the
writing side has less parallelism and a shared *source* is not the
same kind of problematic from a cache pattern standpoint, so probably
isn't going to have anything like the same effect from any memcpy
implementation).

                  Linus
