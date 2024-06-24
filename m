Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6E62556F
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 18:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719255276; cv=none; b=mlFjis4H7cQrNEItzVy+y9TJlHrT8lNNckqZRf+8Y5bvZDjgvdo6X0a2pP9pgX7Iml24Rx4d8yA5YvZvF3LUjFFmnAZUFk4a9pnf0nuw9mBtxU3XJvSRaJtxGhiSpehsobcnzqWgur6FWtyKMJF0hmDujlPI6DznmOeOQ3FxY0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719255276; c=relaxed/simple;
	bh=+aHo+RDnT/WvmjPAgH8TsZySNNBozthwDDf/TaQIdEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtYCGWfXi5/55XPkqQZi/rN1UlIpSZw6n0Qv/fICbKvXwIty+yQR5ZDU0vcWHqr7djncrfxc+QhebjJBXR7n7k2h9IlzACd1od3PLz7jt1MmRj8VyLEJj+Fl5NofTwaH1kphgMoqFAXMFHUwe7B93GuC4VE/qDpOhCn9ja4cIm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=grnO4Qr5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="grnO4Qr5"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cd717ec07so3710795e87.0
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 11:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719255273; x=1719860073; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aHo+RDnT/WvmjPAgH8TsZySNNBozthwDDf/TaQIdEc=;
        b=grnO4Qr5iRVK5DFAuSNEgFVPDDLICwt7K3nFMTQmEFWvge9PFey2zoAMJ/A18ys+XZ
         fA0M3qKAtdyvveDHcl92eraWpjogrGkuk51buvruMqP5h2vUPfcnCJAL14Prsj8LF5wQ
         VlwE3tTtaY9FT+1pSB0hLvtHYpoF1az90kTbXfsl0UUJx8VMUtxyXC7HUhbVuJg1FvYe
         ZdACV+vw6uZVcN5AHwJGhjMIi3rlBpQJsOzIG3m8Njt/lbXWc48PmAvD7zKHFLUJWt6P
         pgvysuRLmgPLdwZrEN18yrKr6s/l9MFsV1I8Kh/odN7EEpW/HOXRyd3yN50yFeuv+Ut6
         Wjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719255273; x=1719860073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aHo+RDnT/WvmjPAgH8TsZySNNBozthwDDf/TaQIdEc=;
        b=deu2BIoWwfqsX4HkHWo/nxg9I7nIN2AqQqTc+kTkkziLZ66C+ACp91NCoI4XKGl1vL
         JWI5lYeGamrfur48FTEB7VoBmearJGhgp5RkOPMWOsThDNkD2yhD7uwRSLEZZsX1U7jk
         na8tmVwJzLlfmca/uR9olySTVXWlcZcvwGdTlEYOWLcAMPVp3M7x0RWMf+pegNqd4B5Q
         K/wNvfAbMn8idaKzacZ5giSYf+gbO9DXXoB/RBNBV3WvNQScswJFnL4PLlQGF7KjCnIM
         AyhImwL+z4/sTAxx97/qMTU6VW7a1a4SQrEgJQQKfEncTsBzEiPjaQcpA69XzVTDdtZZ
         Tvtw==
X-Forwarded-Encrypted: i=1; AJvYcCURNSygrlhL/q4mz9Z3Y5uc+dGNIraCO5Df0XWjvRVu26KoRSqqct6rSS3GhDAn0uWdNVuk/LzZhOdqQ70FWgRKvWMuWSlI
X-Gm-Message-State: AOJu0YxmI5YsHvQm7dpvwohdcrozOB4rWTeVQxQBh5W3uO3ha6eEQJkC
	BL+6vaaFsWUPfNKlOvw46Zeo0UzADr739X7f7clbjQCMxW3YNAq9XxiZh8ZELUMIYtjAu2o/4G+
	HL3sdCbwrpv8RDqcwyt3JAXaWkfCPyXM8WsTs
X-Google-Smtp-Source: AGHT+IG2Ylwf4qP53KT8n9LuQFgtOaFeplGVLRIskw5ThK8EM33Q7t3846sahBbOoJlS7aJZoeVlMm+NykS0UDg32fQ=
X-Received: by 2002:a05:6512:1cd:b0:52c:859c:91dd with SMTP id
 2adb3069b0e04-52ce18327aamr3287502e87.5.1719255272205; Mon, 24 Jun 2024
 11:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406241651.963e3e78-oliver.sang@intel.com> <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
 <Znm74wW3xARhR2qN@casper.infradead.org> <ad18c6fb-7d00-494b-a1f6-3d4acfbd2323@gmail.com>
In-Reply-To: <ad18c6fb-7d00-494b-a1f6-3d4acfbd2323@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 24 Jun 2024 11:53:55 -0700
Message-ID: <CAJD7tka3FZuMhmmt_FJ9yHWRnr_JS3FSbsNKmSSatp8qPL2QZg@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 0fa2857d23: WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof
To: Usama Arif <usamaarif642@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, David Hildenbrand <david@redhat.com>, 
	"Huang, Ying" <ying.huang@intel.com>, Hugh Dickins <hughd@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 11:50=E2=80=AFAM Usama Arif <usamaarif642@gmail.com=
> wrote:
>
>
> On 24/06/2024 21:33, Matthew Wilcox wrote:
> > On Mon, Jun 24, 2024 at 05:05:56AM -0700, Yosry Ahmed wrote:
> >> On Mon, Jun 24, 2024 at 1:49=E2=80=AFAM kernel test robot <oliver.sang=
@intel.com> wrote:
> >>> kernel test robot noticed "WARNING:at_mm/page_alloc.c:#__alloc_pages_=
noprof" on:
> >>>
> >>> commit: 0fa2857d23aa170e5e28d13c467b303b0065aad8 ("mm: store zero pag=
es to be swapped out in a bitmap")
> >>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> >> This is coming from WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp), and
> >> is triggered by the new bitmap_zalloc() call in the swapon path. For a
> >> sufficiently large swapfile, bitmap_zalloc() (which uses kmalloc()
> >> under the hood) cannot be used to allocate the bitmap.
> > Do we need to use a bitmap?
> >
> > We could place a special entry in the swapcache instead (there's
> > XA_ZERO_ENTRY already defined, and if we need a different entry that's
> > not XA_ZERO_ENTRY, there's room for a few hundred more special entries)=
.
>
> I was going for the most space-efficient and simplest data structure,
> which is bitmap. I believe xarray is either pointer or integer between 0
> and LONG_MAX? We could convert the individual bits into integer and
> store them, and have another function to extract the integer stored in
> xarray to a bit, but I think thats basically a separate bitmap_xarray
> API (which would probably take more space than a traditional bitmap API,
> and I dont want to make this series dependent on something like that),
> so I would prefer to use bitmap.

I believe Matthew meant reusing the xarray used by the existing
swapcache, not adding a new one for this purpose. See my response.
