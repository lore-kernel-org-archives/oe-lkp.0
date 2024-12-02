Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7228D1DF746
	for <oe-lkp@lists.linux.dev>; Mon,  2 Dec 2024 22:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733178297; cv=none; b=VpSs6BYna0bJ2p4CDq9K+7XuvOqgJzdUDmeDGyjIJWhwBLHjlN3tcwXoZB1J6Ej05jjKsFxqM9dP5pN6ud7yvZjzXo5YpJqkahuOf7YKC+/ozxWMIgYH2kqH+SceYTGhHKIRawcxW3PFALC7Dj2LYul0MS1ANzH8UR4bTF9wdqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733178297; c=relaxed/simple;
	bh=3SCjs69uV3EDmq6n+IU/rsyU2Ua5ivJVRg07utNZIDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8HXUkYO3yzeh8027mo6PcJRnuVZA4pn33zzGz1EOOda18kwhBtex+GUTBHhvnox6FzgBFB+Skx9fnmWFK/Vq9Q/Ln1EkzGBo1Zg/ioE5kc8AIUHWkBrqBWqXaBBy9YRUlJ3kiOUkdY26NP+GO0S+qQRQW2JCmZjnRt2/gRmFbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b/k7kC2p; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b/k7kC2p"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-71d502644e2so2191215a34.0
        for <oe-lkp@lists.linux.dev>; Mon, 02 Dec 2024 14:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733178295; x=1733783095; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJCGC/sgJEzOQ87RHSL5ZFr+7rlghNfPZJAqWvkg6xg=;
        b=b/k7kC2pKI09VrmpZyDnjsuuKCD/aFNwea5EeUwxhH6kC6urzWrwdsLFxsCpinX8SO
         V49De3RXOZ1vj6mnGr9TcFOq1LIAdnS0JLxqKE+I+mr/UNk5Ie9ZCisJqMGFiOh1+S3o
         V52+moNhqSd4qxfE4p2zls/TWuGeTy4iwNmm8DjLM7g1CKxrwoL/UjBg8Ke7jUB6M500
         SydRxVGhykpotTQl5uBeQ3JQRzVuhpwv4ilJ7pLAIOQ5kBp3frBTk3jIJZQo60JNj/8b
         xMlwNGHNL9dLhQFhPJ75qFA2FBPQW4uc2776Aq5tL6z+6yYEzbBH2xnFVZpkSYeWW/rE
         lywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733178295; x=1733783095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJCGC/sgJEzOQ87RHSL5ZFr+7rlghNfPZJAqWvkg6xg=;
        b=uZDtViNyaeq58TrghFzwbpS4b5d70uq1CQLJKsFfr/hI1N1yFpmaTUf0sFvlUWPiWg
         bWufD7e0fc0H68JE8H2zRebt+1bkUQr6AproO60U+YwBpMx5qf++lgtBZGDqyzyIxU2K
         UftVNBrM5GhVMgggoe9pZOvE4faqBuH7r3Do6T+XLvUBxS6hxbgUJ1vLRafQ74Tenu/i
         mas9Yuv81QHLi6vMc23CiuHY9mX7UQ0F+wuvTe2xLJkxAlUTcylQPT6s2xKjipAjtLNf
         hAGSo6ZaRyIQyEfOLqT3JzXUaUhdeJY+a1iafcNJk5VhnP650AqGWEhAv/QHieFJD5RP
         SWUA==
X-Forwarded-Encrypted: i=1; AJvYcCUpW8semtsoM38Jfdk42LLNDK4a3WB4uW9fdLIN00AK5dqOTDT/nDAuA4yCxXEiYfCgdIse7GM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwV4RG4TqwmDc2KYIn3NzqYpet8IO5biHC7fo3G8/fTm0vWpNiC
	TAFUHJ4eLRBX79skPZnXUjTf1Y6opGHf7lbPTx7WCenRH14HSXsDQtU2j8sTkMG3+hoo3GkBknt
	BgLGwL+v5gd4ynf+Cy/hafqfouUmTWY9s9/Rw
X-Gm-Gg: ASbGncuiHt4T5PTcv10+YV4J1O+2baFfwHEmqZWkz6SmbFQV0ai7vGTDFOYtfmsXoQK
	QlxoTL0W7AY6yxFZdOrZt7vWmDb/yhjWgY/WT7CyO3ydAnAfUC0n5YxDrbzacu7w=
X-Google-Smtp-Source: AGHT+IGeeo+ghKLojpnbWTzZom5/ogyh7WRdIQxYXPU0UtlV2C/NyHWZ8m/Ani2xjLVRzoyaFLhWiHGqggOcj7aCcyE=
X-Received: by 2002:a05:6358:280d:b0:1c3:7415:693d with SMTP id
 e5c5f4694b2df-1caeaa8ba16mr49600855d.5.1733178295304; Mon, 02 Dec 2024
 14:24:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411291513.ad55672a-lkp@intel.com>
In-Reply-To: <202411291513.ad55672a-lkp@intel.com>
From: Yu Zhao <yuzhao@google.com>
Date: Mon, 2 Dec 2024 15:24:18 -0700
Message-ID: <CAOUHufYFT3jeY-1ruDwocuGQmW4-Gn69=-DhEHfQuEpv9t4KtA@mail.gmail.com>
Subject: Re: [linus:master] [madvise] 2f406263e3: stress-ng.mremap.ops_per_sec
 6.7% regression
To: oliver.sang@intel.com
Cc: Yin Fengwei <fengwei.yin@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@redhat.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Matthew Wilcox <willy@infradead.org>, 
	Minchan Kim <minchan@kernel.org>, Vishal Moola <vishal.moola@gmail.com>, 
	Yang Shi <shy828301@gmail.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Fri, Nov 29, 2024 at 12:50=E2=80=AFAM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a 6.7% regression of stress-ng.mremap.ops_per_s=
ec on:
>
>
> commit: 2f406263e3e954aa24c1248edcfa9be0c1bb30fa ("madvise:madvise_cold_o=
r_pageout_pte_range(): don't use mapcount() against large folio for sharing=
 check")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [still regression on fix commit cc864ebba5f612ce2960e7e09322a193e8fda0d7]
>
> testcase: stress-ng
> config: x86_64-rhel-8.3
> compiler: gcc-12
> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10G=
Hz (Ice Lake) with 256G memory
> parameters:
>
>         nr_threads: 100%
>         testtime: 60s
>         test: mremap
>         cpufreq_governor: performance
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202411291513.ad55672a-lkp@intel.=
com
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20241129/202411291513.ad55672a-lk=
p@intel.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testc=
ase/testtime:
>   gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/l=
kp-icl-2sp7/mremap/stress-ng/60s
>
> commit:
>   6867c7a332 ("mm: multi-gen LRU: don't spin during memcg release")
>   2f406263e3 ("madvise:madvise_cold_or_pageout_pte_range(): don't use map=
count() against large folio for sharing check")

The .config you attached shows CONFIG_LRU_GEN_ENABLED is NOT set for
LKP. So this regression can't be from the first commit above.

Also, I asked you a few times if it's possible to set it to 'y'. It'd
be great if we could do that :)
