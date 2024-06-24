Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E651A01B7
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 19:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719257684; cv=none; b=QdIBlaIPcgnNErMYXD+Dymp8eejWovkDEDG5hBiRXSiS1f5vqltB9WDU/qV6UCMC9PEHX8TqMriHkb9qRduLkIL88AJGBDscM140j+rjHsMA2DKn1GuqXpxfROqVnMRBkuSxPoobVir59CPaYj3mRR3r/nFSX8u0I8n+RhSBvps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719257684; c=relaxed/simple;
	bh=iRGtNnx1zZXQrR/w1GfqFSETXcoB/OmGwwh67RJ/kEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4pg/qC7jRE6eIorcaYlgQYC4idPUypybzEQagaA0MW7yrzy09QJCVZKaIekrFHYVxBj8UyF778C4boSHm8Dez6fMo/KKn/iuW7D/qPvYIu2EkKKqZXoy/gvgiHUUXQ8DhIh/1uX0zfPM6BHcJpq9ikGZBBYNhaLp9P4X1BGKkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TIZ/Qjqy; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TIZ/Qjqy"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57cb9efd8d1so9277500a12.0
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719257681; x=1719862481; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LR/qyqNf4yNhGg/W9gnglK9t/IsY+KbgwrDYpXJIh6Q=;
        b=TIZ/QjqyoBQQ8oiepIVveF7qtQR2zYBu+YXmjgCl7KvIJV8jKiPcyT08ECnmMF8hp2
         eqauA1JCFrdu/qyjyY3ktXP7DuMlqpUmrC3rOfcm5HPFJHCUEL1IhzBqrMtBnRfbZ9uj
         VNm7ZEOokfDYA5asRT9y/fNTXqr08vsqFqvz9jYCsnMGMAF/GJk7NB2dLF1ae+D3oRkR
         0OEi+gJuvgm/kwMgvQq8wrjFHlRnMa3AqYi//QWqw6mGuZepswrrAzly/GyblSO89Yjl
         08VuR5FlZpu+QsBytNH54TecRumW4v3zFVi/kSWgI0t5TWfBxKDoohH+IIx8K3LRx7Z7
         7OKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257681; x=1719862481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LR/qyqNf4yNhGg/W9gnglK9t/IsY+KbgwrDYpXJIh6Q=;
        b=d1zHvBJMbd2FQ+cLbLsDMCr3eirtb7vq8UeSKSsedf7wUo/ju1GlCrQtUCCwa8s+SF
         edz4r14GQZehR1XfMlrpmGalXc2b47T2PLCRVqw83NaEh51QvnLvLfX4zHsB10KBgo6d
         HxA85dnk2FExoONqGsyoNZjD9+6EEmmnGnz11XJyuIeNR9lE090vgg82nnEpkV0a4Tiy
         QZtgRtTl1Swfwaieu5VAolBf2OK+6MU3K6PRwb8N5RDcDWb/g6IAbZ+BM1b2iLaqlYqg
         aardAoF/asUdWk5TTeN/D58atp9EoMsNP2du3U+vsXO/clDaI+DxrKuBbwFHF6ToYvpf
         vU7g==
X-Forwarded-Encrypted: i=1; AJvYcCWjRv2jtbc85kWc4Q/QEBQMZlOl3PLWuNVRgatjI7ReLBccS9nYiW0UrlvFEOhBSyIT+GSHdv+7nbaxrkeumiMNeFcilX60
X-Gm-Message-State: AOJu0Yxf9hp+95Dz1fMspmT4DzIGRXjsMxFpdxV4oxhLE2ep9sMAJPvT
	gzwjYqU0ChRyTkH3w6Pv4kUAbgd3ltSRc0qmOnXE93U3U7VV4rEq179L4xI2Y9hSy/c7NzoyPzV
	8th1eyoC45K838rE3K70JTx3emvT8v6N22Jg2
X-Google-Smtp-Source: AGHT+IGBuCU23m+wrmkFzQkUCc4DL4NBFPm8xZ6GTjzrHf41bNowvPfktB6PfvqelK6j4q2T/3ufnLal/dwQaerFDnk=
X-Received: by 2002:a17:907:cbc9:b0:a6f:b193:758e with SMTP id
 a640c23a62f3a-a70385e67dfmr488672466b.29.1719257680243; Mon, 24 Jun 2024
 12:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406241651.963e3e78-oliver.sang@intel.com> <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
 <Znm74wW3xARhR2qN@casper.infradead.org> <CAJD7tkbF9NwKa4q5J0xq1oG6EkTDLz8UcbekSfP+DYfoDSqRhQ@mail.gmail.com>
 <ZnnBVBItTNWZE42u@casper.infradead.org> <CAJD7tkaC6d_RkhRhMpEeS1zTEtoQYw56J3LLdzD1aM9_qu-3BA@mail.gmail.com>
 <ZnnId18scFvE_a6K@casper.infradead.org>
In-Reply-To: <ZnnId18scFvE_a6K@casper.infradead.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 24 Jun 2024 12:34:04 -0700
Message-ID: <CAJD7tkZZHxXR9cFE=ZHQOnYXakrhXg0+ScT2ExxihovSgDz7_g@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 0fa2857d23: WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>, Usama Arif <usamaarif642@gmail.com>, 
	oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	David Hildenbrand <david@redhat.com>, "Huang, Ying" <ying.huang@intel.com>, Hugh Dickins <hughd@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 12:26=E2=80=AFPM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Mon, Jun 24, 2024 at 11:57:45AM -0700, Yosry Ahmed wrote:
> > On Mon, Jun 24, 2024 at 11:56=E2=80=AFAM Matthew Wilcox <willy@infradea=
d.org> wrote:
> > >
> > > On Mon, Jun 24, 2024 at 11:53:30AM -0700, Yosry Ahmed wrote:
> > > > After a page is swapped out during reclaim, __remove_mapping() will
> > > > call __delete_from_swap_cache() to replace the swap cache entry wit=
h a
> > > > shadow entry (which is an xa_value).
> > >
> > > Special entries are disjoint from shadow entries.  Shadow entries hav=
e
> > > the last two bits as 01 or 11 (are congruent to 1 or 3 modulo 4).
> > > Special entries have values below 4096 which end in 10 (are congruent
> > > to 2 modulo 4).
> >
> > You are implying that we would no longer have a shadow entry for such
> > zero folios, because we will be storing a special entry instead.
> > Right?
>
> umm ... maybe I have a misunderstanding here.
>
> I'm saying that there wouldn't be a _swap_ entry here because the folio
> wouldn't be stored anywhere on the swap device.  But there could be a
> _shadow_ entry.  Although if the page is full of zeroes, it was probably
> never referenced and doesn't really need a shadow entry.

Is it possible to have a shadow entry AND a special entry (e.g.
XA_ZERO_ENTRY) at the same index? This is what would be required to
maintain the current behavior (assuming we really need the shadow
entries for such zeroed folios).
