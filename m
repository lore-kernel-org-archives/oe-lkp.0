Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14464BE5A
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jul 2024 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719938852; cv=none; b=Yh25NXFZO+7uVyS4Q0oYKXRL+WeK9ex6laBMlznqwvFwAm6mQXE8TDhVrhmAjWfUruZEnhwhEsTtbLQV3fe8ql9ltdUXtg5WanyJ9Bd+4GaVMJ1COFSq9/LbSoD58pUw7WLNP8R/C/83/Yg8to0RO0fgeo6HRvFC16lpcLaRyx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719938852; c=relaxed/simple;
	bh=JJCfUnxAyde8Pswp5C9S3wRVqYZag4IPQp284yiV5vU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AWHQjSW1NFdSbzfVIuTzMMD0RVCuj++TfNUsUecSjD2dldmC1QDm4+Q5Y402kaeJSss5Ntm6YJeW81nDEMrj++olHRj2dw4nj2Sbtn3mdPF3eYTuTBs+stB1G7wYhVmc691WJy1dQBhueC2joy6kjwu9C5PiBByXvyyRBMJIgIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RMIry4zu; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RMIry4zu"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a72510ebc3fso660672166b.2
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 09:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719938849; x=1720543649; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UuomGKlgZ/JCx5qkaXWQw7kYZlgSwRcXF7z8kwqPXBk=;
        b=RMIry4zuXut0tNmG6ZbZfULzxuFq1/apI0BQ6hxufI/ILL48WXmvBIjF7drPhWVa9p
         MQ6yWk/JLq8qivWv9BOw8KlrtBzgISa6ZC8gdkFKcTG0bvdpzl6/brzTVLH5Kq61gOHb
         SmdG5zvy+EIUvKG0utaiasWPpanv9XlZyD6cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719938849; x=1720543649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuomGKlgZ/JCx5qkaXWQw7kYZlgSwRcXF7z8kwqPXBk=;
        b=Z2VFPz2XhBFMxlwW9DrOvmvHBaffiU0E5l11xr3JxtrNukvLE47frMJK0avzFGyLH3
         qFOHJ69HzGLkHYahQNzXWYE+VMXjasdHFZajdItGUEJkaw6Q0FOtYZdwCbJF2O6Gf2R1
         JZUBKN9uDy5H+2LPgLPGyH2bIEMpAlefZgpWgjyeOlvUcLRCo17sSufrgYP0bQpWqb0W
         3aR5pGTbCDjUVb5RVFzCRbkPb3iip/2FXomrtqzbBtXMNPaxHhOi0opgGqUPzMkvsJU7
         tFSb1lmi2JSx3ecSc96PCW/mGFCX7igKMWNsZuZ8y16x6OJct8ewevQEq4N3fW+8umb5
         +9MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCJI6dDgXGoh0Nh3AvMMFFF8TdQEyCr4rnptBt314EzWGe4qOX6V6koergANJhPS/44wPbOObVglOZ3B/HnW1ebx6AaVzP
X-Gm-Message-State: AOJu0YxeQMNDWTEiFIRQMcoF9r+BLRBcMCTpHBkM67MVId3G2hf7ahVW
	1z02SQ3GjV10anNZncVtcxN2GCnsAkklsCbdsQcVuWzbrBzuZEb4rd9PtmFXyfZtjT2eX1tDxwb
	T+Onzug==
X-Google-Smtp-Source: AGHT+IHt1J/5dUbec+udX4SPjKEEuoHNasoMcRlijPbnrv8/zNqKsx9fhjy8TyHVPDPsBYplArWf3Q==
X-Received: by 2002:a17:906:f58b:b0:a72:536c:fd4c with SMTP id a640c23a62f3a-a75144de2d5mr829440966b.66.1719938849236;
        Tue, 02 Jul 2024 09:47:29 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08cea1sm435816566b.156.2024.07.02.09.47.28
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 09:47:28 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a72510ebc3fso660669766b.2
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 09:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTOFAt/oIMvmVVbf5dClUcTMLtA2QKuPn+ER1N/KRdNGQkuPu5K+ml84sJY1R557AFf4mzwAg+tFnzeI4I13bYpwOFs+7+
X-Received: by 2002:a17:906:c2ce:b0:a6f:493d:5b9f with SMTP id
 a640c23a62f3a-a7514474146mr573370666b.35.1719938848162; Tue, 02 Jul 2024
 09:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406270912.633e6c61-oliver.sang@intel.com> <lv7ykdnn2nrci3orajf7ev64afxqdw2d65bcpu2mfaqbkvv4ke@hzxat7utjnvx>
 <vgg45kxk2fiyznm44w2saz3qjiwrjp3spvpswsl4ovd2jl5c5g@54dlbd4kdlh4>
In-Reply-To: <vgg45kxk2fiyznm44w2saz3qjiwrjp3spvpswsl4ovd2jl5c5g@54dlbd4kdlh4>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jul 2024 09:47:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgnDSS7yqNbQQ9R6Zt7gzg6SKs6myW1AfkvhApXKgUg4A@mail.gmail.com>
Message-ID: <CAHk-=wgnDSS7yqNbQQ9R6Zt7gzg6SKs6myW1AfkvhApXKgUg4A@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jul 2024 at 05:10, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> Well there is also the option of going full RCU in the fast path, which
> I mentioned last time around lockref.
>
> This would be applicable at least for stat, fstatx, readlink and access
> syscalls.

Yes. That would be the optimal thing - have some "don't take a lockref
on the last component at all, because we will finish the use of it
under RCU".

I looked at that some time ago, and it didn't look _horrendous_ from a
conceptual standpoint, but the details just got to be nasty.

What I wanted to do was to hook into the "we're still in RCU mode"
with a callback that stat could set.

And we'd call it at complete_walk() -> try_to_unlazy() ->
legitimize_path() time just before we do that lockref_get_not_dead()
thing.

So then the path walkers that are ok with RCU state (ie mostly just
'stat()' and friends) could set that callback, and get a callback
while the path walk is still in RCU mode, and could fill in the stat
data then and say "I'm done" and we'd never actually finalize the path
at all, and never do the final lockref_get_not_dead().

Sounds simple in theory. And then when I looked at doing the actual
code patch, I ended up just running away scared.

           Linus
