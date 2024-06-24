Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A017F2F24
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719248201; cv=none; b=RofmCFPVdFHIQvE6lvMyhVmndqUNjkI1+mjJpF39MtMqfTxzERSs1KEjArrq6AKrRGX4SX8+jJHRDuG8jSaufZIkSCdrvjn50TpVMICRrGZ3xi/pVdhm5H9jAnCG0S8ZW3dzLUkwJHTIDvUrolG5V/iN8D4PfpgneaZrytfQhuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719248201; c=relaxed/simple;
	bh=8dC7zutNXYS97u7qMCFvxruvUdqrxOLwbSb/vRFzut0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SoV7OwBWkXeMLnU/DHEDAopSof3qZwi513ppEdQvnovZVvbDcKbrlzMlmtChFCbp1cViGSBOdNUz16gxttH/7bA6XXJr3uSRn39Ytz1l0/C1L8kGPN7fmsUkb1dVOtQVCv1hVPnYslg/lMntlLf8jH7xt7cqdmvDD56QQslx+SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FNVTjzCJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FNVTjzCJ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ce674da85so1287161e87.2
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 09:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719248198; x=1719852998; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgpq1QF/Ve4mEImU/Kh0C9TjVcEEm8pShiW7TRID6w0=;
        b=FNVTjzCJqsb/XWe/wtW+4s8t0wk2Pbrd0FGzQ7odRoztIpDU7ndRjc24OO2AVazCA3
         iYHJ75STtDWMNifgmwffoGaUk2dVrqZKzr0GT6s/CW2muGnqHZJT2EDDRrpUsfAZzI4J
         aBP5hSEf79DkmdKyr8pbDIISdglSlOih8Dg8jVTSp8Qw/6rpFRLSMKttIdbqCvgSFAYq
         T3apy7fAJTjpfugHNiMnpk6RCE4Bjb3UTm8ZOuXZn0jhhk+1mQBRanNqZ5YOhWqxZUoW
         jGdSeIc5tfi8AnnxZZX9Uwz+6Ts58QlJMJV6T+fxQ9LE6lh3RVuvVY6n/93cgDoDkRqo
         2laA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719248198; x=1719852998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tgpq1QF/Ve4mEImU/Kh0C9TjVcEEm8pShiW7TRID6w0=;
        b=KzJuo4ZiG1FRpVPnHYDsVueIt6rFDbLMd3jO2xLQD9xPMiU1+gPVGT1y1xJAaVfPvK
         AwMK6Uft701KxMHgSIQMTQ5upD9Ths+jGyMJeYcOR5TMp2cxAwwrSfGMv5FzSUBiEiXO
         /zdn2W+xOHro9KqU2bMS3rXY+mb6fCH8+13GDaxF+0F1LFKD2vUGG6CvVOUMBr/8wsIN
         FvdQv0PiJzxs5CHUmmoXu4OaSH45IwarOlB4ZKJuBa23zwGdl7qfLvjH96vcBMDf1ujG
         Xd5zsXFRSGnG1ogK3CFKuR7TKhV47Kq/DmXKryjApF4hN602fPgfzJBcdZecI5xTkT2b
         O6Zw==
X-Forwarded-Encrypted: i=1; AJvYcCV52owLFAMzcutymfO2c/o/YFvgtBy1rHnYoSmsgtZBtu6cMQ3HRlmq/X2Q9ei+J5tvutCXwWTtc/s+HF+Zbl/EC3WKicL/
X-Gm-Message-State: AOJu0YyDWyzp/8fcpZSrsG5EV3sbC0JZq9S1BoCm9atb/VSqDoeYAUfn
	Tvm0+mMzMhqywvMZ2zocF8Uy1/oViNQcxw9y7EwgveKTl0GhvLj2xPvnCWx0FuN5ggIRXBwzLK7
	gJz0NKY+kmWdRyLOqJxqn05hqfrQeG7UpKGbS
X-Google-Smtp-Source: AGHT+IE8sFWItYyQrcc7D82fyGAeyAkoAiXZQQd6SdE0goCRpyIPtEQ4YkvGbn4Lbkqv8o2yAvJGQIZLNEPiIHqc+nM=
X-Received: by 2002:ac2:5de7:0:b0:52c:e05f:94a1 with SMTP id
 2adb3069b0e04-52ce186282emr3466994e87.68.1719248197229; Mon, 24 Jun 2024
 09:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406241651.963e3e78-oliver.sang@intel.com> <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com>
 <12fb19d1-3e57-4880-be59-0e83cdc4b7f1@gmail.com> <61d19ec8-2ba7-e156-7bb7-f746dae8e120@google.com>
 <5b3e732c-d23d-41ef-ae5c-947fa3e866ab@gmail.com>
In-Reply-To: <5b3e732c-d23d-41ef-ae5c-947fa3e866ab@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 24 Jun 2024 09:56:01 -0700
Message-ID: <CAJD7tkYJVa=dd=hwqhJ8_-uzxFDaP6-GcTk3RdG_3DJouJ61AQ@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 0fa2857d23: WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof
To: Usama Arif <usamaarif642@gmail.com>
Cc: Hugh Dickins <hughd@google.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, David Hildenbrand <david@redhat.com>, 
	"Huang, Ying" <ying.huang@intel.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Matthew Wilcox <willy@infradead.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"

[..]
> >>
> >> -       p->zeromap = bitmap_zalloc(maxpages, GFP_KERNEL);
> >> +       p->zeromap = kvzalloc(DIV_ROUND_UP(maxpages, 8), GFP_KERNEL);
> > No, 8 is not right for 32-bit kernels. I think you want
> >       p->zeromap = kvzalloc(BITS_TO_LONGS(maxpages), GFP_KERNEL);
> > but please check it carefully, I'm easily confused by such conversions.
> >
> > Hugh
>
> Ah yes, didnt take into account 32-bit kernel. I think its supposed to be
>
>   p->zeromap = kvzalloc(BITS_TO_LONGS(maxpages) * sizeof(unsigned long),
> GFP_KERNEL);

You can do something similar to bitmap_zalloc() and use:

kvmalloc_array(BITS_TO_LONGS(nbits), sizeof(unsigned long), GFP_KERNEL
| __GFP_ZERO)

I don't see a kvzalloc_array() variant to use directly, but it should
be trivial to add it. I can see other users of kvmalloc_array() that
pass in __GFP_ZERO (e.g. fs/ntfs3/bitmap.c).

, or you could take it a step further and add bitmap_kvzalloc(),
assuming the maintainers are open to that.

The main reason I want to avoid doing the multiplication inline is
because kvmalloc_array() has a check_mul_overflow() check, and I
assume it must have been added for a reason.
