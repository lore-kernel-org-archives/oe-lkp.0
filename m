Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1F571B36
	for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 19:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706644519; cv=none; b=qW9jqgrMuaooM5AHPevoBJ5DRPenXsINy1ca8QfNmEXjo31g93Htxa1R1gAXCKQhXhA54qEcv8so1HpNxHA5mV9/jux3ZBF0ntFP+ksmj005WCi7m3deYWcO+MCiV6s0H7q8PeMXz9qgJzgrT9668VwayXlilAHO0qhqzuBRog8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706644519; c=relaxed/simple;
	bh=OA8oLBHPhrSLnbd9ATKoXbq8wijgvN4ewjiP+nXyvgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QB9uuG4KcLK5gxtWqKiuxPdVazpj+/kMP0W60XdLHT1ra9tnlq+rYvPZH5tvmEbuga8MfGBvKPpAfvfFS9GJY44135ZM+/QmYPazI+IsbogQxd+VcKeJ+7cP7Z61+tIFRcAqyZs34kczyBHS3A0G3D5Ywc5Mx8Uba0RZbKBJ+sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LCOY+zv4; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LCOY+zv4"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5102b00c2cdso3920683e87.3
        for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 11:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706644515; x=1707249315; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xsmhAB/FHTmzTTzdgfdlCEbbVq9kW3x2bQ5xRcrAAgg=;
        b=LCOY+zv4Bt+btShm9l1CEbZ8zbo1iqwyT23WYgVVXE6zZV2ZIuU9KbdFAauDGIPFgx
         ARH5N7+tSznvyxgbsi2fxQEpZ+9lDiLOUaMSZ5zSHnrG29PxP/mCCyuwxjPZoRCRVCTC
         kmrGgmvoyKyB4SiXiXhqXZd1VJwNXXlmNSnNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706644515; x=1707249315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsmhAB/FHTmzTTzdgfdlCEbbVq9kW3x2bQ5xRcrAAgg=;
        b=k7tP1pcnGKoR/Nw8iwjw329rinhxxy03bDEuqiA//UHO0sp/83ecJtdI9rpfddplmu
         klWHyuxRO8dAziLfi4QEMEkd8vLlEBpb74Y4oOM5tSEdgTXPXRyatgFTtyQIICQDFM9g
         CVywCmj3e5yoWyCQi7/gkhDrHyrjh8OYqADD2rTiicKDbNJc5nTVV9/6Fi2A6WGInneB
         1b7+FNJvpPtsTKTtw6A5WVnTpOkFSLaiPjK7VJRbDEwL4dzISM/vpXW6syLGkUCNnZ0D
         p3ZcozyqiaW9r44rVgDgasC9XLXBLJM5AiSDfcLxnMhCnpdLY/f3OtZmseOP8w2Ko+SW
         yzeg==
X-Gm-Message-State: AOJu0Yz/JuPdDizsamtUVlSBV6Cd0DN4If+V4dPORcYGJ10f9R6Sc7jM
	PWhrO4zv5kyWaU3g1iOnIFs2r8EDRMqDCFyE45+kVEKdK+MqccGALba4YJU/yQjC6bwDf8EjqEH
	3yApTxw==
X-Google-Smtp-Source: AGHT+IGd2CZDdCtGXHb68yyGWGNDtMtD+yzqgjpTTPJ+e9BkLjNjPYeaKXHiq85igvKAV5ZLcas4Iw==
X-Received: by 2002:a05:6512:2f1:b0:50e:e66c:4d8 with SMTP id m17-20020a05651202f100b0050ee66c04d8mr6399028lfq.30.1706644515068;
        Tue, 30 Jan 2024 11:55:15 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id j25-20020a056512345900b0051008cb4402sm1547664lfr.144.2024.01.30.11.55.14
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 11:55:14 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cf3ed3b917so50964901fa.1
        for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 11:55:14 -0800 (PST)
X-Received: by 2002:a2e:9b09:0:b0:2d0:5dc4:4e30 with SMTP id
 u9-20020a2e9b09000000b002d05dc44e30mr1808081lji.21.1706644513633; Tue, 30 Jan
 2024 11:55:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
 <CAHk-=whb91PWEaEJpRGsuWaQpYZGj98ji8HC2vvHD4xb_TqhJw@mail.gmail.com>
 <CAHk-=wgp7UkG31=cCcbSdhMv6-vBJ=orktUOUdiLzw4tQ4gDLg@mail.gmail.com>
 <20240129152600.7587d1aa@gandalf.local.home> <CAHk-=wghobf5qCqNUsafkQzNAZBJiS0=7CRjNXNChpoAvTbvUw@mail.gmail.com>
 <20240129172200.1725f01b@gandalf.local.home> <CAHk-=wjV6+U1FQ8wzQ5ASmqGgby+GZ6wpdh0NrJgA43mc+TEwA@mail.gmail.com>
 <CAHk-=wgOxTeTi02C=kOXsHzuD6XCrV0L1zk1XP9t+a4Wx--xvA@mail.gmail.com>
 <20240129174950.5a17a86c@gandalf.local.home> <CAHk-=wjbzw3=nwR5zGH9jqXgB8jj03wxWfdFDn=oAVCoymQQJg@mail.gmail.com>
 <20240129193549.265f32c8@gandalf.local.home> <CAHk-=whRxcmjvGNBKi9_x59cAedh8SO8wsNDNrEQbAQfM5A8CQ@mail.gmail.com>
 <CAHk-=wh97AkwaOkXoBgf0z8EP88ePffLnTcmmQXcY+AhFaFrnA@mail.gmail.com>
 <20240130132319.022817e8@gandalf.local.home> <CAHk-=wiGb2aDbtq2+mYv6C=pYRKmo_iOu9feL9o52iRT8cuh6Q@mail.gmail.com>
 <20240130143734.31b9b3f1@gandalf.local.home>
In-Reply-To: <20240130143734.31b9b3f1@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 30 Jan 2024 11:54:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=whMJgqu2v1_Uopg5NBschGFa_BK1Ct=s7ehwnzPpPi6nQ@mail.gmail.com>
Message-ID: <CAHk-=whMJgqu2v1_Uopg5NBschGFa_BK1Ct=s7ehwnzPpPi6nQ@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jan 2024 at 11:37, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Do you want me to put this in my urgent branch and mark them for stable,
> and then send them for 6.8?

Hmm. I think the only one that fixes a _reported_ bug is that [PTCH
2/6]. And it turns out that while 'ti->private' really is entirely
uninitialized (and I still think it's the cause of the kernel test
robot report that started this thread), the ti->flags field _is_
initialized to zero in tracefs_alloc_inode().

So even in that [PATCH 2/6], these parts:

  -     ti->flags |= TRACEFS_EVENT_INODE;
  +     ti->flags = TRACEFS_EVENT_INODE;

aren't strictly needed (but aren't wrong either).

The 'make sure to initialize ti->private before exposing the dentry'
part *definitely* needs to be part of 6.8, though. That has an
outstanding actually triggered bug report on it.

I do think that tracefs_alloc_inode() should also initialize
ti->private to NULL, but while that would fix the oops that the test
robot reported, it wouldn't fix the data-race on any ti->private
accesses.

So that "ti->private = ei" needs to be done before the d_instantiate()
(that later became a d_add()) regardless. But not having random fields
left uninitialized for future subtle bugs would be a good idea too.

Anyway.

If you do run the full tracefs tests on the whole series, and there
are no other major problems, I'll happily take it all for 6.8. And
yes, even mark it for stable. I think the other bugs are much harder
to hit, but I do think they exist. And code deletion is always good.

So give it the full test attention, and *if* it all still looks good
and there are no new subtle issues that crop up, let's just put this
saga behind us asap.

               Linus
