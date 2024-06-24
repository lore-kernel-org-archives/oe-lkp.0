Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A7719B59D
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719255505; cv=none; b=aCNno9FGQ4CzgGpl7U+wSJHSgC84zFwTNMMjx3FxxuGRoHWmynKVuwTwepMdjtVqIozPvig8Gi2NsLLqevWG/1ALOHIihbduuwyGjplGsORvjcqltcN8BChGYsdftC4tqt9lKXslG/3+izxsBzxItQ9MlBMHvbk67+W9xXH63jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719255505; c=relaxed/simple;
	bh=DfhT8mFcn1a2LnOPe6P8pC0Ip5/ghH5Ia7q534z27A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fecu/kcQ18xoNJB0ugZnMZA1LvMcUc63bsJTgRLEnJlP9LNciG7E1bRHhK76dzSbxIDwgIVbq4L1A3ThMeMna6gGI2bKRZsopVcQNAkEEHDX5mxJF4wQowg1BTdGTRgBJLSFs3lmwnC4GC7xE2LJdB9uX9z4l0iG6HOEzOdkXnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tbLotnFB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tbLotnFB"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso3062190e87.3
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719255502; x=1719860302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6eHEi9SDkMR5e8OVKWA2OEJfqCnQ6uOrn8cT6wmAEU=;
        b=tbLotnFBds6M4m1HBljasaMgCK9aiJI+EuTvn5XO99zykaKJcwt0KOa/Zh8AZDUEXh
         HCrpYGZdbwuB2wEII5rPfsRMr/0SotNOZWzSQbfJJ2JiN+GryULchSIhOjnWkeT+FPJL
         4PoxdFfjTy5KqSaFTmrR22VNGwuZRcdUzolu5wz/S0qqh0QbrGxQTo5VmsDeEr8mCBx6
         17BWaSFCZqWbuFI9CqyC+9jEtUqIBrR96m20NkQb8t1JJgyuK8wicei5cyQEMK2+a40W
         8WzN9hk3b7OTwteKdmt98LJFnoQa1t5/hI7ppf08L4NJC/hetVLoQ3s51aAHdq0bYK1P
         VCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719255502; x=1719860302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6eHEi9SDkMR5e8OVKWA2OEJfqCnQ6uOrn8cT6wmAEU=;
        b=XVqD+xMnbcnJJVPoY+J3XKA7egk4aojz/krj5PbpQN4zUngFb2Wz+yF9RaH/scHOHd
         d0CjYnqCe+H5LEahD6k/0H/s2QbRVBfXAoZ/uOPYdZLy8ZZ4xE653SREcmQ+FOkVhoCZ
         GRHLKYBCRJq03wBw8OEz5EIL+3i3FN41nLFfLGvr61mh0DuOOrFH40U7/l95wKfjlVof
         MMLcISsYtBvo7NJ0xwvFVFK02oiKw2U99vIej5zLa0aWndx3+3FrcGPRTHHLzMNbsIyB
         h1Kiyg1CbGS9Pp4t0HD+H9wEghgGQM3vrviL/BNVLj5T6tRw9RSsEmWrHUPwdty9Ub6C
         1jDw==
X-Forwarded-Encrypted: i=1; AJvYcCUHbFlFz/UkXeRZmmdolVfTqRJB0GTMAIf7EsKNFr/Qc8AlGy5P9w41/b567JxW5iBR4YWbObtaM4Q5aD3JzVD5/ux6gx+I
X-Gm-Message-State: AOJu0YxOlJfxyxi0P5jHGkDUh8KjNvJ3uJaMTlLhEQdj/VyRfIl4IS7W
	Mdfy4su8FqMv193JVtYiH7rGKCp8muVGa/9jmYbE2ZqdgV6gHCMX5aSq2P1ghCcujHK1WC3sESG
	AgMUlo8R/JhTbeyCqUaGJ12pNfESBWWIw5+oP
X-Google-Smtp-Source: AGHT+IHZyMdLsQ0W8EhH8qJWEWYjdB11FpXA4gznRxXggQHm6CWkxFasr+6EMUBtpjMO8i0fGNvQ63unX8iPSPC2YxI=
X-Received: by 2002:a19:8c0a:0:b0:52c:842b:c276 with SMTP id
 2adb3069b0e04-52ce185d1c2mr3618157e87.53.1719255501855; Mon, 24 Jun 2024
 11:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406241651.963e3e78-oliver.sang@intel.com> <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
 <Znm74wW3xARhR2qN@casper.infradead.org> <CAJD7tkbF9NwKa4q5J0xq1oG6EkTDLz8UcbekSfP+DYfoDSqRhQ@mail.gmail.com>
 <ZnnBVBItTNWZE42u@casper.infradead.org>
In-Reply-To: <ZnnBVBItTNWZE42u@casper.infradead.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 24 Jun 2024 11:57:45 -0700
Message-ID: <CAJD7tkaC6d_RkhRhMpEeS1zTEtoQYw56J3LLdzD1aM9_qu-3BA@mail.gmail.com>
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

On Mon, Jun 24, 2024 at 11:56=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Mon, Jun 24, 2024 at 11:53:30AM -0700, Yosry Ahmed wrote:
> > After a page is swapped out during reclaim, __remove_mapping() will
> > call __delete_from_swap_cache() to replace the swap cache entry with a
> > shadow entry (which is an xa_value).
>
> Special entries are disjoint from shadow entries.  Shadow entries have
> the last two bits as 01 or 11 (are congruent to 1 or 3 modulo 4).
> Special entries have values below 4096 which end in 10 (are congruent
> to 2 modulo 4).

You are implying that we would no longer have a shadow entry for such
zero folios, because we will be storing a special entry instead.
Right?

This is the "fundamental" change I am talking about.
