Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9F730FB5
	for <oe-lkp@lists.linux.dev>; Tue, 26 Sep 2023 19:08:26 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7743448d88eso288782285a.2
        for <oe-lkp@lists.linux.dev>; Tue, 26 Sep 2023 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1695755305; x=1696360105; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OLOwfeR5xU0JkWgHppZTnSrmVCHvBFEdyXxtN5C1UH8=;
        b=cZEqWV8RJ/JNZgJvH2UyM+w1jHboU0aYRk+KGMR0AokSqlNhwRlM5g50uBXxWRpdpS
         7Hve/Rup1J4ST3P9hbgndel+hXDTrYyx5VPWQadrFnptr43h7eaMSPvg3epdgrVr4Hdp
         zZjgCtVnJ731CvDalQ3wCgC0aK36eBP8DbRxqlatnszwhwVXzEcU2J//1L4PktkpRBQr
         H/n95wRclERkaV2DihhtyTpHkVc1H/TaUwc5imf/dNvUBmcyLe1QLhihsg58vSACORZJ
         T+gW/hex14lbllH1yQEQT48Ybo94CZ88+AR6ZcFdwGGIlOwaStYgEWufs586btfNJUiN
         8V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695755305; x=1696360105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLOwfeR5xU0JkWgHppZTnSrmVCHvBFEdyXxtN5C1UH8=;
        b=EYRe8Va+1ULKtshjoY8SYccCBkAbSAXH0G7/923FQitainspg+YFtrPY1g6JUbb0qS
         QDRDMPAZC2jXNAbCHWtFljOciO9mCO2BoTJ1BiYdApN+ni7CPV5l450ZqK9bqte2/CkO
         GSsxt70tWjAvi40F+EU0aFej613zueQtA3JpVa6Az+8eIr0cOqlDE8r9r8UabCRnnNdU
         o7QVxp39i6ZviTc55sJStT7GItPmVcAoIPWiLGHM/d4e2ZOSYOuwkVUZ2WPlRJCLrJmo
         tXHU910K3OlJpCNf/4qWyD4xCv9ojOgY7uM85w9zXJxRADcSYMKkjEs4LebdMpHi7QDu
         ykLQ==
X-Gm-Message-State: AOJu0YwbTL6t5NEYjie3ascOCRmWCyv/Ksw78JFfmcOadmjnooabE60H
	y447cEWnSc8fpcfVasFTQaTNaQ==
X-Google-Smtp-Source: AGHT+IFfGkB9uJl9KKXPORqHqZ2V8U6AqL+BWNgp8UfNl741E2mQpaQcAbLBJHORevhlHWovOPS7Fg==
X-Received: by 2002:a05:620a:1a0d:b0:774:13e:71cd with SMTP id bk13-20020a05620a1a0d00b00774013e71cdmr13153634qkb.56.1695755305347;
        Tue, 26 Sep 2023 12:08:25 -0700 (PDT)
Received: from localhost (cpe-76-182-20-124.nc.res.rr.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id x25-20020ae9f819000000b0076f12fcb0easm2199560qkh.2.2023.09.26.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 12:08:24 -0700 (PDT)
Date: Tue, 26 Sep 2023 15:08:24 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Filipe Manana <fdmanana@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>,
	Filipe Manana <fdmanana@suse.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, David Sterba <dsterba@suse.com>,
	linux-btrfs@vger.kernel.org, ying.huang@intel.com,
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [kdave-btrfs-devel:dev/guilherme/temp-fsid-v4] [btrfs]
 6c9131ed0d: stress-ng.sync-file.ops_per_sec -44.2% regression
Message-ID: <20230926190824.GA407285@perftesting>
References: <202309261552.a03eeb4c-oliver.sang@intel.com>
 <ZRMqjzDP/G+MKL5R@debian0.Home>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRMqjzDP/G+MKL5R@debian0.Home>

On Tue, Sep 26, 2023 at 08:01:35PM +0100, Filipe Manana wrote:
> On Tue, Sep 26, 2023 at 03:34:59PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a -44.2% regression of stress-ng.sync-file.ops_per_sec on:
> > 
> > 
> > commit: 6c9131ed0d644324adeeaccd2feeef8d04950b2d ("btrfs: always reserve space for delayed refs when starting transaction")
> > https://github.com/kdave/btrfs-devel.git dev/guilherme/temp-fsid-v4
> 
> David, can you remove this patch from misc-next/for-next in the meanwhile?
> 
> Starting to reserve space in advance for delayed refs is causing the slowdown,
> and I can reproduce it with the stress-ng test reported below.
> 
> By avoiding refilling the delayed block reserve I can recover about 60% of the
> lost performance, but that increases the chance in extreme scenarios of exhausting
> the global reserve and reaching a dead end -ENOSPC while committing transactions.
> It has happened rarely, both upstream and on SLE kernels.
> 
> At the moment I don't see how to keep both the upfront reservation of space for
> delayed refs and the refill of the delayed refs reserve without the performance
> impact on a test like that stress-ng test.

It's ok to eat a performance regression for correctness.  I think if you can
reduce the pain that's good, but going slower is better than not going at all.

Long term I have plans to make this better, stress-ng hilights the problem here
quite nicely.  The more pressure we have on the enospc machinery the more likely
we're going to do tickets and hit arbitrary waits.

What I want to do is take away the strict "we're over the limit, you now must
flush and wait" behavior and instead have something more akin to what MM does,
simply allow overcommit to occur, add the usage to a per-cpu counter everywhere
to avoid the spin lock contention, and then switch to the normal "ticket and
wait" system once we exceed certain thresholds.

Basically I want ENOSPC to not do anything until we're down to no chunk space
left and we're within 80% full in the available metadata block group.  This will
drastically improve performance, but is a larger project.

Until then trading performance for correctness is simply what we have to do.
Thanks,

Josef
