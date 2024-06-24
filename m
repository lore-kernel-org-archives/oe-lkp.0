Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E53B19EECD
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 18:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719255251; cv=none; b=SupvF0qGBLDkS1/2KornQ+vv1se8nV4UXASUiWYaGUabodjwB5NzWwgkoq9IwIgQEMBMbk2zPf17MMiFL95B86+J81cAtk9rf5wSTikhGUl6YnsEStt8s6crNW/R7HeSB5tYHC4w16eZ+i0YqazVXheAiYDwjA0O9C3Nm0tQ1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719255251; c=relaxed/simple;
	bh=JITYgpOr9aslHmnHx9NrvwoZeu+k4ldEze9CbONSH20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxttIskr66DaEiS1FVBcQklq4Sqrg9gCGRHOc1lQswpPyAuNyeZUEfIJHNY/useIMFBbpBbDjbd07nCcrc557CjkUdNtzLCEOjU69+C4EGtQf/sMg843/eOjbWacf3eN9zqTD0xXvDzR8SCDsNYbiul9LzeFysNjMtCJYV8SQVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xspPWoin; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xspPWoin"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ce12707d9so1829770e87.3
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 11:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719255247; x=1719860047; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JITYgpOr9aslHmnHx9NrvwoZeu+k4ldEze9CbONSH20=;
        b=xspPWoinI1cOpM2pZ9ORXJH/UWn4rc95K8dvf4gIeJ0XxipKlZTrZotBlkdc0HQeLi
         ZPf9GD2oOomAR1n4RK6EFm1mrt+dgd+E9SSBJcs/m0jGfsNr46qv2uHqZGSC9a2k1jh4
         wKXMTehMhW+L2EYFq95dxIdWsFAsZobnMexeNRYz5fckdwlVppq4foHvn4WFdfn7aLEu
         +UpCCoQHMpvRTX0UC72CImNvmbJ2/xAicnUkWpXFiveTRYHbLONnJFjVXM4vJJ7UbsD8
         mCWeOQ3aH19kcHLa3GdOMOgnc2NXRmSQs/dNaDL54e+k/e25rtufZR8BN+3KXKWpyIOb
         6PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719255247; x=1719860047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JITYgpOr9aslHmnHx9NrvwoZeu+k4ldEze9CbONSH20=;
        b=ngij1Wh1+WyGgH6WRZNXni397RJfPtmqhoc6rcd9KxsvWUsA7I5uu00rqPNIHenPmw
         gqJLLqJbvR/o9ThBnoc3x4YHV6f4nktXqiUH0rhO5D2jLMNoGl/bjzErJbE2g22nmUXG
         URVz1hRM+VnwFEBEd5oTM5D1zDDjKVDdiu5G42wCPlX7X+Dqmnk8G4drb9hwD6VMsLrq
         1PexbEuXjHxXZTSFnb3mXmt6GbsD9Vbh2a44QZBMVq8yMHZ4aeUUAV+vTBjmbSTl9rVK
         UJSrvWFMH2C98cxlWhL98GoJLOrb+w+gu1nn6QFIeIlOt54tN9kzqxkEK0bsXSYcZ5t+
         z7QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI2rNhOlC5eupaIT3lzg1aUS471qixYKRNCpSq5pEFCHBjht6V/6xM+lJ+jcesP+RqJOz2Lfxjgdicz3gCdAKl0zFTa7Mf
X-Gm-Message-State: AOJu0Yw87C79LYU8XcuqmR+oghhOU1kzuOACyLtfrUXTDvemTnIYZOoG
	HB8rNOy/VFsGpZD39UJF6C0s2rVppxswWhTwq5CcTfs+1HAvAkbHDjlS/YfWCHBmXVWfK2vEQiI
	UvJv5261cnsi/tJTtyWbIl8cPVnl4HSMKAqkO
X-Google-Smtp-Source: AGHT+IHN+UZEsY4/F0d/hc9WcI9bVuZWn15n0XvSIxPi4V2oZ1zThrKVoWzn+Cxvu/DteI9wNCqWv1/lFdtTFzA3stw=
X-Received: by 2002:a05:6512:2083:b0:52c:e040:7d9 with SMTP id
 2adb3069b0e04-52ce0680398mr3572378e87.59.1719255246629; Mon, 24 Jun 2024
 11:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406241651.963e3e78-oliver.sang@intel.com> <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
 <Znm74wW3xARhR2qN@casper.infradead.org>
In-Reply-To: <Znm74wW3xARhR2qN@casper.infradead.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 24 Jun 2024 11:53:30 -0700
Message-ID: <CAJD7tkbF9NwKa4q5J0xq1oG6EkTDLz8UcbekSfP+DYfoDSqRhQ@mail.gmail.com>
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

On Mon, Jun 24, 2024 at 11:33=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Mon, Jun 24, 2024 at 05:05:56AM -0700, Yosry Ahmed wrote:
> > On Mon, Jun 24, 2024 at 1:49=E2=80=AFAM kernel test robot <oliver.sang@=
intel.com> wrote:
> > > kernel test robot noticed "WARNING:at_mm/page_alloc.c:#__alloc_pages_=
noprof" on:
> > >
> > > commit: 0fa2857d23aa170e5e28d13c467b303b0065aad8 ("mm: store zero pag=
es to be swapped out in a bitmap")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> >
> > This is coming from WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp), and
> > is triggered by the new bitmap_zalloc() call in the swapon path. For a
> > sufficiently large swapfile, bitmap_zalloc() (which uses kmalloc()
> > under the hood) cannot be used to allocate the bitmap.
>
> Do we need to use a bitmap?
>
> We could place a special entry in the swapcache instead (there's
> XA_ZERO_ENTRY already defined, and if we need a different entry that's
> not XA_ZERO_ENTRY, there's room for a few hundred more special entries).

After a page is swapped out during reclaim, __remove_mapping() will
call __delete_from_swap_cache() to replace the swap cache entry with a
shadow entry (which is an xa_value).

So I believe we cannot use a special xarray value without making
fundamental changes. We can, perhaps, try to pack an extra bit in the
shadow entry. In this case, we will need to change the swapin code to
check for this magic bit when looking up a folio in the swap cache,
and extra synchronization to make sure concurrent lookups do not
allocate and zero separate folios.

IOW, I think it's possible but probably with more complexity, and
perhaps not worth it.
