Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE96219415C
	for <oe-lkp@lists.linux.dev>; Wed, 10 Jul 2024 19:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720638910; cv=none; b=QXJ/kQRePbkUlLUuk8EwYKvLDwAQgNjFyqk3zNBKFkrnday8OrRtMb9B3j2tKqRzmYILkOfuUijB53YfTAQ/Am+Wmbf9eaW9nv5xpj67GpPTyrzrWj/awLGvEQNdRuSSxAVATCgjDbkg0K6BYEoMJJ7zYBFTOOUups2QUQpv+kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720638910; c=relaxed/simple;
	bh=J4aNViHux4qP/o52knB7g/6ZzUmCLkg1Jd1N2W1AC0M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sUYqgNhdPdOr87evKNWtIDswstNuQoyzmddHmaTWUInKBW7HxlCPePmJK8TNSBzKi124JfihQdDiLQxMTOa4aPh6W9uQdnK9QaM+E07BYNrh3Eo4ocE6AVHQOTPCqDipP35/74R9GH0VawtgTa3z+W8K6jqxrcSNFYmSrxBHDvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b/lqHEn3; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b/lqHEn3"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-64f4c11d2c9so830737b3.2
        for <oe-lkp@lists.linux.dev>; Wed, 10 Jul 2024 12:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720638908; x=1721243708; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xpJH7O0IK+mWa36m8icY/tzE/YoR+c7Wf4G7xE5ZzLM=;
        b=b/lqHEn3BIrJm5hYGsv4TieRrE2Rj0oeamUs0n6BlCugb9x+UVmPiEdQvMsusX45NC
         FwLOYXqfmV4wL0U3WV3dcWwVlAiUaUzlbkbfN3Pj7d2HVvkktR8d5yPEBypvGGGsFHMk
         FQkJsBNbG0+UDxwm2dyDpvaxu7jmm6NHkNrr5phEhLIJJS8Od81BRfZ6fDMPHgWSXICs
         L61IXEdcX2uB2GHzSdFyrcWSrj4dh7eP2BQQ1Q2chBVRG8GmvYlnljeJVZqQuWlZl7Ai
         V/0K8LMBkc3l5mfJsqvr2qpeUODecEpHgE2Xm1qKLe1p24kOqNVdE+hj5yvitxVeZzL3
         ApTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720638908; x=1721243708;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpJH7O0IK+mWa36m8icY/tzE/YoR+c7Wf4G7xE5ZzLM=;
        b=G4ExAlgwZHGyoJ4hb+j2/JVLpEI5VvijnTpGm8lzlcIBWUA1Ntf6mh8R5NfQe+ynL4
         oaH4X9+b9qQ8JsJ7mYaDB1lrlBWx5woDcVBXMMAE7ykhqqtaC5JpC7KpQvWopvlvJYaw
         TaYJIczcvtcew4YSe3RK9NG7/EMfSLSxab09MTAJb1cQ57AYim/iH/OoTmTiOHvrBE/n
         7zO8vleaNIoNosEbwH+bzj8C0jo9xHHhAk+KULmcHUD6p15gw4vx2chW2eFf5cFQuyse
         ofo3ESrGzYhMeA9yCABjBe3m9eGppX9aLEzA0RZWsx8xWC7mAQnisYkNRuWZQ7zbGrH2
         LUkg==
X-Forwarded-Encrypted: i=1; AJvYcCUp1C1zFnKt71GaM0Tj1N6gdjcdhljpWjuV9VMBqEgpoZOQ3Z6M+zkEMpBEah+/dQCpoDtdY9EXaKvXyIHWdFtLV3Py9tma
X-Gm-Message-State: AOJu0Yz0zsYzY4t++aIrrGrO2BLgqSEzMaW44f0xyfms513BYSF6D6X5
	DFofD/sNU8OjMoaMo6n5rFuqiYkgaqH6By203A1H6tC4rwHIo3WxnglIlRCovQ==
X-Google-Smtp-Source: AGHT+IFWZTHBjlwLdnh07cjhHTC+j0sZPJwKS9lkD9EQ+SwBth2W8WJCPyjo5BJ/hREJijMn9wPueA==
X-Received: by 2002:a05:690c:ec5:b0:630:de2f:79b8 with SMTP id 00721157ae682-658eed5ebd3mr74295227b3.13.1720638907584;
        Wed, 10 Jul 2024 12:15:07 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e4d2d5d1sm8308867b3.55.2024.07.10.12.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 12:15:07 -0700 (PDT)
Date: Wed, 10 Jul 2024 12:14:55 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Usama Arif <usamaarif642@gmail.com>
cc: Hugh Dickins <hughd@google.com>, kernel test robot <oliver.sang@intel.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Johannes Weiner <hannes@cmpxchg.org>, oe-lkp@lists.linux.dev, 
    lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
    Chengming Zhou <chengming.zhou@linux.dev>, 
    Yosry Ahmed <yosryahmed@google.com>, Nhat Pham <nphamcs@gmail.com>, 
    David Hildenbrand <david@redhat.com>, "Huang, Ying" <ying.huang@intel.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Shakeel Butt <shakeel.butt@linux.dev>, Andi Kleen <ak@linux.intel.com>, 
    linux-kernel@vger.kernel.org, ltp@lists.linux.it
Subject: Re: [linux-next:master] [mm] 47325a5c88:
 WARNING:at_mm/slub.c:#free_large_kmalloc
In-Reply-To: <2fe63ea9-613a-4904-8b68-134442c43261@gmail.com>
Message-ID: <75bc4bf4-afe0-a1e0-36bb-1fad7ecee210@google.com>
References: <202407101031.c6c3c651-lkp@intel.com> <dd08adbb-6df5-4556-9fc4-cf37b6234aa1@gmail.com> <053bd429-ae19-4beb-a733-a7a838b1e010@gmail.com> <4bc6400e-6199-4147-9399-4a54c94613fd@gmail.com> <612af749-0a59-f91d-693a-43d6217ffebb@google.com>
 <2fe63ea9-613a-4904-8b68-134442c43261@gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Jul 2024, Usama Arif wrote:
> On 10/07/2024 21:49, Hugh Dickins wrote:
> > It's a long time since I was active hereabouts, but the bot report
> > and your flurry of updates make me think that you should step back,
> > slow down, and look more carefully at the precedents here.
> > 
> > IIRC, the main problem is that parts of the swap_info_struct can
> > still be in use from before while you're wanting to set up new values.
> > Observe how alloc_swap_info() may return a fresh or an old allocation.
> > Observe how enable_swap_info() is called after getting swapon_mutex
> > late in swapon(), once past all possiblities of error.
> > 
> > I expect that your new zeromap needs to be taking the same care as is
> > taken with swap_map and cluster_info: to be safe, follow their example
> > in both swapon() and swapoff().
> > 
> > Hugh
> 
> Thanks, yeah sent too many in quick succession :). Will be more careful next time.
> 
> Both the 2nd and 3rd version are careful to solve the problem of using old allocation
> which you described.
> 
> The 2nd one takes care of it in the same way as swap_map.

It didn't look like that: it set "p->zeromap = zeromap" as soon as
zeromap had been allocated; whereas swap_map is only installed later
via enable_swap_info().

> 
> But I believe its unnecessary to do all that change in the 2nd version, when you can just
> set it to NULL after kvfree, which is a much smaller change and takes care of reusing old
> allocation equally well.

It's possible that there's a good reason why zeromap does not need the
same care as swap_map; and it's possible that things have changed down
the years and swap_map itself doesn't even need all that care.

But you haven't persuaded me: I repeat, step back, slow down,
think carefully about why the existing sequence is as it is
(and please don't respond without doing so).

Hugh
