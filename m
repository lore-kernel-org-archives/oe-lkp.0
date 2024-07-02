Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F901BE24F
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jul 2024 17:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719941305; cv=none; b=MNH2LJIGB103yrDcpS+NMMsioj7ZcKD9gQmwyiWOgr/MPtD2O86ll5OxbqQ36sS3SQZRgWoZ8I7EpHzRYDbKB0rmam9gmuGwZaTqV6ZCI88sSdhRNESxHstM5AvcvxYKcLDBMYY8gdTERTTERW99/+DLYobRZSpyGQFv7SJecbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719941305; c=relaxed/simple;
	bh=zJ01PiKqTGK1aFizfZp2xIRt/CPOcwzWRyfYJQiri4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IB/fRz4znhEQmN2xWjfvkFgth+PQd4HXkF4nyr/pNLsozuKT4TY9Luo7J65/jtD29q3MCVLa0yw5VygrP34kGFuPfVWOf1+87s2j6RcF/xeZJ5tXAQS7LHDQKLPJf2UIAMKuXVeBMUooy8dRRjc/KjaSPy5J7vSZ1j4SjH9O5H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h0fPQ3+M; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h0fPQ3+M"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-58b447c5112so1291584a12.3
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719941302; x=1720546102; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6HNAk1/iogZZbC+mbI2kSdd+21FuSzIbsGeDPYt2wqg=;
        b=h0fPQ3+Mt8+/eNapKM0IVuX7dxoJG0j2WHy3x0LRsLdkPFKKKvbsmlyjVmAzDQ2OXa
         doL2c9Yfh6yIg5mxeMavkU07GVfvoMrfTlYKThdSeQKptBEBNpFC+claEfNs39GKhEb8
         6VGFydKPJHyBdCBjm4zgW7/p6PNYXzmemguuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719941302; x=1720546102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HNAk1/iogZZbC+mbI2kSdd+21FuSzIbsGeDPYt2wqg=;
        b=IZrI5tu7zTlbf/Oytrw/Uzr+n/RYbovyLFYKvF7sxaEUC7gYQerWBhdH3Wil8MjRUo
         UrLMCsuGA/QMi6CDu8sqy9QJ/vXupwK/I+wpb/oxxNV8W93Z8NF495TRjPnXsII5tNHy
         eqSNGpw6wTE6e3ycZW6qpBs9PBpqrqLgAPMK+fEKOp/neswifCnUuwWeM9m0wVNm1dro
         7rqVrJHFK5CVsSkWhdkiSsJnf5TsiMoY85OWSXEwbzIRopnXiNGKqzTLgKu0BMkTHIPv
         K1LUS2zn8usjnSAedP9DjErTYxoioRyUgsyxZ9pX1cBZOg/0XQUDx+Y2G6TXU8Pap0tM
         7yOA==
X-Forwarded-Encrypted: i=1; AJvYcCVJPgLTW895v9PDDYotQVokfRwzqatYKAl+6EzyRrQEZ8I8B4h2TOOohK1ai63RXpdfvVhrgQnE/8Su5Cxi+DPfx7rpdMMk
X-Gm-Message-State: AOJu0YyBCZSRcFWnFrTjDk4DUWIT4fodqo2CnR3uvhjIj2HLGuCrgI1V
	m/g2A1dKKah38v4WysneeZ0EDJkG/L3s35mQGNYMRWURD7PReKA9ybO2q6oE936EPIurrn0+dq1
	LxsB5Yw==
X-Google-Smtp-Source: AGHT+IFdH4Q5LrUtb0ExhDE44u0Z+vjrQAHlBiwkGtwH7E8YEYmY8AO/fPdxQAxQq6gwQwAroEpATQ==
X-Received: by 2002:a05:6402:26d3:b0:57a:2e93:fe80 with SMTP id 4fb4d7f45d1cf-5879f59b6c7mr8060928a12.18.1719941302013;
        Tue, 02 Jul 2024 10:28:22 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58615038a86sm5931280a12.95.2024.07.02.10.28.21
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 10:28:21 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso2561273a12.0
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 10:28:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDVRHzI9HjAJPkmHZH64BEDkdywg0ajtDMWgdMwRJ8B9rjVhA5kphYAkTkEEvgXpjzWaVCkEUJRot/bWar0R8xKy8OpaBS
X-Received: by 2002:a17:907:97d3:b0:a75:3c31:4f58 with SMTP id
 a640c23a62f3a-a753c315afdmr274936566b.32.1719941300909; Tue, 02 Jul 2024
 10:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406270912.633e6c61-oliver.sang@intel.com> <lv7ykdnn2nrci3orajf7ev64afxqdw2d65bcpu2mfaqbkvv4ke@hzxat7utjnvx>
 <vgg45kxk2fiyznm44w2saz3qjiwrjp3spvpswsl4ovd2jl5c5g@54dlbd4kdlh4>
 <CAHk-=wgnDSS7yqNbQQ9R6Zt7gzg6SKs6myW1AfkvhApXKgUg4A@mail.gmail.com> <CAGudoHGuTP-nv=zwXdQs38OEqb=BD=i-vA-9xjZ0UOyvWuXP_w@mail.gmail.com>
In-Reply-To: <CAGudoHGuTP-nv=zwXdQs38OEqb=BD=i-vA-9xjZ0UOyvWuXP_w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jul 2024 10:28:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgVzKtRnvDXAzueJTbgfo1o12Lw6DH97PzRe1cGA_b1oA@mail.gmail.com>
Message-ID: <CAHk-=wgVzKtRnvDXAzueJTbgfo1o12Lw6DH97PzRe1cGA_b1oA@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jul 2024 at 10:03, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> I was thinking a different approach.
>
> A lookup variant which resolves everything and returns the dentry + an
> information whether this is rcu mode.

That would work equally.

But the end result ends up being very similar: you need to hook into
that final complete_walk() -> try_to_unlazy() -> legitimize_path() and
check a flag whether you actually then do "get_lockref_or_dead()" or
not.

It really *shouldn't* be too bad, but this is just so subtle code that
it just takes a lot of care. Even if the patch itself ends up not
necessarily being very large.

As mentioned, I've looked at it, but it always ended up being _just_
scary enough that I never really started doing it.

               Linus
