Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD018C34B
	for <oe-lkp@lists.linux.dev>; Tue, 25 Feb 2025 23:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740525022; cv=none; b=Gv32bwB7urb28aqDXXH9m66Nwxf01XJ1XJydoES67IOTnJH905QDVNJwe6zGJD8jpU8wbynPGStqXuobMVFbve8Rb6KuOCsIMiwLzM4dLTwby25a2vh2iHuUhiKPRk/zqKVr+Zd2XKCBuaqxLIu6wS8+dbDdOAlo+PXtiCxLgiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740525022; c=relaxed/simple;
	bh=+kvbUQZyXSL4zamHMB07/kBb9aSkSvHGTQvnF1zvxkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atyrnHPBRJ94KFGkXUaVptWaZO2nWh2NeoGVOd3rzqFtTkK6IHaHpKimqTetooyFWqk/D4V4YoRB2dAtpf15A9xixN3L7HhhBaAIv1ZSa/I00aDq6v9iHTSOQKin9XP/i8ceJwaAX/JCiz/61Oh1GuWt9ZoFubfMQV1dRwAkO9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=vOzH6ME3; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="vOzH6ME3"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f2b7ce319so5115626f8f.2
        for <oe-lkp@lists.linux.dev>; Tue, 25 Feb 2025 15:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1740525019; x=1741129819; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GR/f1XfgOyLiD0/Fzm3IhtRl2Wk8lZ2d6RNv1rFkKW8=;
        b=vOzH6ME3Ifd4aY0fP2mHehQAmMR6mGcXqkd98WEfvpgboSUj89OOJH2DhG11OENVt9
         Jqe8ct5bSdNxOt5upJs3jwp4UVQV06t9iENgdQsshAAJ4keRjy5Tphdx33B+HCFb+iTz
         XylsTnNtW6Cro+TkNq/JLZXNAbyPXN+Sb3M6GvRyq8Ux3qzZxbw7zb/u5t93vOdoi+ac
         nqlxrACUSsEt839M62xbC6aolIPvv4NVxyzz5oXBFTMcs55UQ2FGH6orFZR3NGTsn/vM
         5qpn6G9oZDVwBhei8SZh1PenUyiHTEv/5ZioSrtbga3SyGvCEhdx1IoZ+PgAAvZOWCmt
         Oerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740525019; x=1741129819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GR/f1XfgOyLiD0/Fzm3IhtRl2Wk8lZ2d6RNv1rFkKW8=;
        b=VE3UkLkEkSEPnRbQ0WLmG2b6KkCLCS0N0G/zVrgRLpjmVePdh/tV2+ban4ljWB9Atx
         XJcoPIsWzVE/nKoeqXXdudVghNo5TqR3RVbePQzykgj4/sxptxvBAYtTnAiNchgHlwGF
         npXStmQn7zdeUWoXgLRIRj8HZDYThOJLg4Ri5I3oCYPnr8gkHTlt7Jz4V+g/yP7CYanL
         VD6cbW1nBCVzFj0uJcEHI9ZF6AhehbJ+V6hnHooMkzC6Ao/p//qThzdNxb+kTgZdYXYP
         Rw4RF5eIjO+BHITZC3ZhWGGBpfx3aUer8SZPoDJakJiUPlnncSYbKPx8FjFaPqtS6fnX
         nvZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1joSmIqw1CtyNgd1yZkWnT0moK2+3SVTmhlPJgRJ7liJrRoBvcqHCIiyvnnAnbbSOoTQlKtE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaOABucnjIA20g9swxSLqbrR3aQyi1TiAH9oCdt03zcUvEQTc1
	mG8Dsnv/R88RWv6kK0V+bcO9aKyeoKO6CIXezzyvxDpPCGCZhBoDzGoVx649VF8=
X-Gm-Gg: ASbGncsgzPJP4P3Qao85hTX5v+5iMUqw5kX25jUB04WtdHVYygdzmw3wGgGgQma9Lf7
	ELbw6WCEd5RCf+1BDvIPf7LtSoJfsa9VBDSJtvtRmIuv+wNBRqG06kGa39K2PqvP5om19EOnafS
	11/lxgLXC2BhM3aqCI7uvZihX58CjVNmFRqF98BEd9r80RXp101c7pnvsoOOaVhZChX+PNC8+jC
	UkllMOEUiZTQ8lAbxdJ2cYGRfChLw8o9Um+IhFDFKwTNrVCGHv2XKJXKEBs1fSpHGYgdzhzIIPA
	GN+UrUbbX01pE6TMVDdF
X-Google-Smtp-Source: AGHT+IFzKxgT+FDekkwTj58ufLFPS3qmQu4xLsL8NJ7EyApAQDJ+XquwGx750TREzyjfZG0WuyEI6A==
X-Received: by 2002:a05:6000:1546:b0:38a:87cc:fb42 with SMTP id ffacd0b85a97d-390d4f3cee1mr709890f8f.21.1740525018774;
        Tue, 25 Feb 2025 15:10:18 -0800 (PST)
Received: from airbuntu ([46.186.201.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba58760bsm2039845e9.38.2025.02.25.15.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 15:10:18 -0800 (PST)
Date: Tue, 25 Feb 2025 23:10:14 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Chen Yu <yu.chen.surf@foxmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	zihan zhou <15645113830zzh@gmail.com>, oe-lkp@lists.linux.dev,
	kernel test robot <oliver.sang@intel.com>, lkp@intel.com,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com
Subject: Re: [tip:sched/core] [sched]  2ae891b826:  hackbench.throughput 6.2%
 regression
Message-ID: <20250225231014.yztrap5ihain3cd2@airbuntu>
References: <202502251026.bb927780-lkp@intel.com>
 <tencent_6D9B516AFF16965A3BB652A049D6CA847706@qq.com>
 <20250225122705.GD34233@noisy.programming.kicks-ass.net>
 <tencent_CC411B43EAD996961A06366F606C96DD0406@qq.com>
 <20250225134220.qjctfqwwhjz7bspp@airbuntu>
 <tencent_1A4C28B62DA5726C31A985601B07F664250A@qq.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_1A4C28B62DA5726C31A985601B07F664250A@qq.com>

On 02/25/25 23:35, Chen Yu wrote:
> On 2025-02-25 at 13:42:20 +0000, Qais Yousef wrote:
> > On 02/25/25 21:15, Chen Yu wrote:
> > > On 2025-02-25 at 13:27:05 +0100, Peter Zijlstra wrote:
> > > > On Tue, Feb 25, 2025 at 05:31:34PM +0800, Chen Yu wrote:
> > > > 
> > > > > 
> > > > > But consider that the 6% regression is not that high, and the user might customize
> > > > > base_slice via debugfs on-demand, we can keep an eye on this and revist it in the
> > > > > future(we have encountered some SPECjbb regression due to over-preemption).
> > > > 
> > > > You can specify a per-task slice using sched_attr::sched_runtime. Also
> > > > see commit 857b158dc5e8 ("sched/eevdf: Use sched_attr::sched_runtime to
> > > > set request/slice suggestion")
> > > > 
> > > >
> > > 
> > > Thanks, we'll have a try during the next test cycle.
> > 
> > Could you also try with HRTICK enabled?
> > 
> > 	echo HRTICK | sudo tee /sys/kernel/debug/sched/features
> 
> Sure. Is HRTICK supposed to encourage preemption? I thought
> hackbench might be sensitive to preemption(downgrading).

Yes my bad, I don't know why I read this as preemption was happening later not
earlier. Please ignore me then.

Thanks

--
Qais Yousef
