Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC2613B
	for <oe-lkp@lists.linux.dev>; Tue, 15 Aug 2023 07:33:57 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5233deb7cb9so6360918a12.3
        for <oe-lkp@lists.linux.dev>; Tue, 15 Aug 2023 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1692084835; x=1692689635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ptPuBEpK+bTuLrHXWomcWZqL5q0T5IOC69Hvw3A95bI=;
        b=h7n/uDShYxSNwBRM50GOcCYxuc5JsYL93sEbxiZjMXPXLrqKWNgGPMQHT55ERVVzUL
         rJ6DnJJzSLywuxsjaP6QrDBf6HopbKSrZ8QnrDztCvKFxUNp+GccUBrtgSDq/4TYZAKk
         fWvzz4oIF9Me0r7rMIjrl5MMY8kDEdukA6gUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692084835; x=1692689635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptPuBEpK+bTuLrHXWomcWZqL5q0T5IOC69Hvw3A95bI=;
        b=Sr58NuSuJ1chp06NoSmppfgnOMalBDyf5nBV0VryGQk6TI2Bm3ngjnHxsrbEmvsR3H
         fG9n73rHPWeOyOduJUDBIR2g4wpgYEv1wQg9gKKDB2ftdSq2kD8eLv8+NZG25DjHY8K4
         Pzi4Gp48e7ViGgzJYnHd92SsbGRuCDXoyP69A8pSOQXjkycM7wnMrtDg5CojOUiqGysL
         vAQlsMQxnHYC9jREoz5oXDau8n5mqHR4GZ4Z9I9G1i1LmWkPcd9jq9rOu45UErWu4e+U
         Z0fEhNY17bS5kA5qQVenO7/ll4aXdYSPPJKi6P3ZUmJJ9Rasz6y1e8+stKa8KCYWs6gU
         vblw==
X-Gm-Message-State: AOJu0Yw6bA0hwQfX5KHF1d4orL6KDygUuHuhvGNhG2YE9ZpmI49mbRE4
	1psQ9H6zyPfgyWxCfvrf38+CHxfjEeIfEw75pFx9GRDE
X-Google-Smtp-Source: AGHT+IGdEql3QUX9v4cFYFRDO7mmNaVt3GmXEDdunEQASlmf4g5ykM9CMmLZhZyxbzdTfpdp/UJqOQ==
X-Received: by 2002:aa7:c793:0:b0:523:33eb:1103 with SMTP id n19-20020aa7c793000000b0052333eb1103mr7806571eds.14.1692084835484;
        Tue, 15 Aug 2023 00:33:55 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id f6-20020a056402160600b005233deb30aesm6459348edv.10.2023.08.15.00.33.53
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:33:54 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5232bb5e47bso6381625a12.2
        for <oe-lkp@lists.linux.dev>; Tue, 15 Aug 2023 00:33:53 -0700 (PDT)
X-Received: by 2002:a05:6402:290:b0:523:1004:1c9a with SMTP id
 l16-20020a056402029000b0052310041c9amr8202386edv.35.1692084833506; Tue, 15
 Aug 2023 00:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308151426.97be5bd8-oliver.sang@intel.com>
In-Reply-To: <202308151426.97be5bd8-oliver.sang@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Aug 2023 07:33:36 +0000
X-Gmail-Original-Message-ID: <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
Message-ID: <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
Subject: Re: [linus:master] [locking] c8afaa1b0f: stress-ng.zero.ops_per_sec
 6.3% improvement
To: kernel test robot <oliver.sang@intel.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Aug 2023 at 07:12, kernel test robot <oliver.sang@intel.com> wrote:
>
> kernel test robot noticed a 6.3% improvement of stress-ng.zero.ops_per_sec on:

WTF? That's ridiculous. Why would that even test new_inode() at all?
And why would it make any difference anyway to prefetch a new inode?
The 'zero' test claims to just read /dev/zero in a loop...

[ Goes looking ]

>      39.35            -0.3       39.09        perf-profile.calltrace.cycles-pp.inode_sb_list_add.new_inode.shmem_get_inode.__shmem_file_setup.shmem_zero_setup

Ahh. It also does the mmap side, and the shared case ends up always
creating a new inode.

And while the test only tests *reading* and the mmap is read-only, the
/dev/zero file descriptor was opened for writing too, for a different
part of a test.

So even though the mapping is never written to, MAYWRITE is set, and
so the /dev/zero mapping is done as a shared memory mapping and we
can't do it as just a private one.

That's kind of stupid and looks unintentional, but whatever.

End result: that benchmark ends up being at least partly (and a fairly
noticeable part) a shmem setup benchmark, for no actual good reason.

Oh well. I certainly don't mind the removal apparently then also
helping some odd benchmark case, but I don't think this translates to
anything real. Very random.

                    Linus
