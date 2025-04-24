Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEAC221FD5
	for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 09:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487542; cv=none; b=T85nmodYjkxzHTTdUqkzDiTPjW7B1fjc6AUNx8de2ZRhfoulgfKC4alVUZ6Wmv4cdf8Mb7KHntC8GfgkMK2fZ7ifFpcWe+fJnA8LBrxefig0+NidLchkARRNtzWhLAItWnXwiTm0cmAzTnPc58vcDvq5dxTAB9k+A68TBfZ4nKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487542; c=relaxed/simple;
	bh=NB2oNOCnxG85GWEANUQdzI220Wn03rrzKWljOGrWZgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3rMAbdhLk4JP1fLNrxIjGJJng0noJsyLNHLlsrHeG2ka6HvDBL3vgd8LacNECrYirIkt6n7bBCdvJhgQ2InrrNLPpLl9Pn8nR8TEMFCUmbaGNHUFg8A7ki41hscy//Q+qV0TQ+06/ujuk8HtxLgkWfD4SSWridedhpas5O+lz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dd0wBsBh; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dd0wBsBh"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so8890621fa.1
        for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745487539; x=1746092339; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NB2oNOCnxG85GWEANUQdzI220Wn03rrzKWljOGrWZgs=;
        b=Dd0wBsBhZZrX2guWasZlRAKaSTipK1rUrRRPcDXBYzE0XniUwOCuEZQyeHBAN52982
         4+cvg9J/AlbDzNA+lEa0mSl/+NR7YYGKHYPvYQKKy4XtvCTqLE/PHNBjDTDgaLtTTw0O
         UVyIohi1y9xSxh3Ohw/MTxnEIoImAmnPtJDL3nTRQLP7ihv8/UpDTR0AkeHSwbAQKSdx
         rEtm/UussvivjRc6NzMdCmrmnEzJp5vqnL2rzeeTip45ROSne8VkZC1kYmzG4zhfJeKn
         nuyjL+oQopXnGLWTa44MRZ6ekai3KXjGeZ45URIKARYJR1uMPfcyEqqMFMe7XCYuRjDu
         HvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487539; x=1746092339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NB2oNOCnxG85GWEANUQdzI220Wn03rrzKWljOGrWZgs=;
        b=VVpbE43FNKZWy7VRW0VuIETA3PmZUR7iOx2gX0tAqyYP4nkeyhK5/FYG5hwpmvsxeF
         GQxxLqZ6j0MmfAagajvTm56qTcqtHxtMAuR1snVNLd+EVNeTgvREV/OGSeARWBQ5Kq2b
         CffBqClNkPr8EXaR/AXkBqw2j0Js0tn/YHO8gI5/G1xGiF/vsBuO1CFC/mgZakeGYyXH
         8PnoFoJjeuIC2DM7ZfvJCix1yvN5CPR+pihcRbUe05gxxremXBFpUlXY09cbphZ/pj/P
         I0sx0qL12oZq0fR6fMeeCYb21nWuB6n8Ee5ee/+bwNjQ3FnR6W6nadOwnnA5UnXH6NF+
         6ArQ==
X-Gm-Message-State: AOJu0YxhkjUTiZjGhVhCpdQTWzmWt6GUBFHt/mkOVLYvtg+YRcGRWCPl
	UPrzEH0/EJqcbfR737DSdlbUcGfI57wgSTLuHBfsr9DYjOAyMSwaN4+DTbHUhNRaqCF6xUvdwm2
	k4BGi3eTKfE5h/kqAjoQiqGs1NsQ=
X-Gm-Gg: ASbGncuoHECKwIZ0Il/xSO1mRo46thhvPj8z/SaV5j4WTeVm0CMPFix1nri3mJCg+HY
	BUwgeh8g6fydkVfIgi6bwTQOhxii3q0zhOyjjTtzh7WnD7A53C+w2VErtJdWTGIkbLTzDcbklXD
	nk24QCBhkt8lvTiwltxaOfAg==
X-Google-Smtp-Source: AGHT+IGxVjnHtPNegbr3C7Imfp6iB6vUgpa+DyLIQKc23y3BGS5YQua6rG4/E/4fQIRZ0NImjw5iKW4U3PoyKnwuILY=
X-Received: by 2002:a05:651c:1614:b0:30d:62c1:3bdd with SMTP id
 38308e7fff4ca-3179eaf48d1mr7393771fa.23.1745487538397; Thu, 24 Apr 2025
 02:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504241621.f27743ec-lkp@intel.com>
In-Reply-To: <202504241621.f27743ec-lkp@intel.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 24 Apr 2025 17:38:41 +0800
X-Gm-Features: ATxdqUEbFuGWETRbMvxzKfov8XBuQuSyhGaBkFQpEJHsk77t9tC6s3UekgRaWuw
Message-ID: <CAMgjq7AHR9zg+-BRhMeE_06endOP1dno0=rKZjU2CUmUzbh0ow@mail.gmail.com>
Subject: Re: [linus:master] [mm, swap] 7277433096: swapin.throughput 33.0% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <v-songbaohua@oppo.com>, Hugh Dickens <hughd@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Kalesh Singh <kaleshsingh@google.com>, 
	Nhat Pham <nphamcs@gmail.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 4:40=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
>
> note:
> from commit message, this regression should be expected. we still make ou=
t this
> report FYI what's the possible impact of this change.
>
> below details just FYI.

Hi,

For most workloads with random swap io, there shouldn't be any
regression. I checked the test and it's doing a sequential swapout
with 8 workers (after a fresh swapon?). I was expecting
bae8a4ef3efb56bb7e83bafd3c0856845aeaf605 ("mm, swap: use a global swap
cluster for non-rotation devices") to optimize it. Seems that's not
enough?

I guess we might also need to disable the cluster shuffle in
setup_clusters for HDD. The shuffle was meant to reduce lock
contention on swap cache, the contention is clearly not an issue for
HDD, the bottleneck for this test is IO, that might be making the IO
more randomized. Or maybe clusters will better be sorted by offset for
HDD.

It seems this test can be easily reproduced with `$USEMEM -n $nr_task
-W -d -p $TMP/pidfile $((size / nr_task))`, I think it's not a real
problem in productions, but I'll try fix this if have time.
