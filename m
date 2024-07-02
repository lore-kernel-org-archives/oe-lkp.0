Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E221BD02F
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jul 2024 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719939792; cv=none; b=q/smnuQKa/F2SOiv61rrNcvPkMlsx+qykzKKCExoGYpsho1g8OrZLtTsoGoq5094Sj60C2lyCY+nWYgVKDWAl8wwv8f1wWXu9XEDXEBIcae0/6ffjkJdWL9VYXXmH/aMZSgUiTVkrRd3Qit6CdyVpvrg/7a8t63AOweFKGsuOOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719939792; c=relaxed/simple;
	bh=SJjrYGYHHwZ61PnvF9q5/p7fpSWQxsDabX0KAL9mp38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkNUlPvLk9/fNoiIeYEl28R4FIieVqchxOamoYnHC3pxK6mVcH4J70dkn0Zebuz2TTrYF5fkLoHm5eFcO8I6AkCeagWiKb4s9LUMhYQoNihRa5zSJluuvODOtKYdUV+jy9raF+CbyT5a0i/VVYYPD3b0LOAilkYAKwGNPhNTCZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWGmSRwX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWGmSRwX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a72af03ebdfso634215366b.3
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 10:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719939789; x=1720544589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJjrYGYHHwZ61PnvF9q5/p7fpSWQxsDabX0KAL9mp38=;
        b=bWGmSRwXvivrZKk0tR9V5gAP9bDkhf3sqMuOBXJ7L+CZh24zB8nDj0OwRc2zeUF4yi
         yYnm/HGRPQUmN+2BXdgfCxYYgZbsASFZe73vPgBXBMA7E3clc90V/2yAFPpKIR+vm8fI
         fVjSXtY6AH9+165MmeZyCyzcbOAQ2GyNRDzy0Cg+iqx1jGGyAXsZ2ZFidt2Kba3sIrrG
         b8lYK+Xj9Piy3guiHgIj//AaWhM4Y+2xzeLo2c+I16H3OmkzTYikaLRaK3wxnPhd7Uof
         KPIiHfg/9IKZgy8aKTGzynw+L0BNW0nAjw+UTk48C1BHqv65X4cTYkKdJg0NgPlYqNTz
         2zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719939789; x=1720544589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJjrYGYHHwZ61PnvF9q5/p7fpSWQxsDabX0KAL9mp38=;
        b=ikFnE7wKD7Bpg41kpdYrSVK8V/MpmrCr4nxaDsg4ZDOeAd/heH8rCXvMbX+ElBAiB1
         /yDUaqEHIkLWyPHWS0/rNBkTJyxBHG5AhsRv9PVQE2M14PSQUW83ue196kpMcPD3Sk4Y
         iAHMuTERgFdpu75zrzFdL17bWdSIajBgjlkvNOUx2hg0inj8AvOUkAkcCLzUH88/EbU4
         9hXFV8HUOUhjd8HGqdseZFXNwMQJS+7t+kKtDc+RyYZh7qdshDC2ZgyVlG3XRXDThVQU
         292MilXNmqjdMv6LEVFrAZCh3m3PzSOiruV+e8JuMfb47Y5j1sgvDMlS5Wz7o44OAVmj
         yKbA==
X-Forwarded-Encrypted: i=1; AJvYcCWKMC9OIkOYbN94hFmLMcGOgXFQaFoBKEgwbghYbx7ttVbGPKa/TR98OGofpNWEat/U2ozRjiAwVSWQAnDOd9NavWdhE2zn
X-Gm-Message-State: AOJu0YzDiznTGeF+ZXWuDRs1zITOYmiJ5G01MlGAIs3hlQM7mx1zlipH
	WRD+xnR3vyYtZDCA6L+C0XtvO16RcQwtq3iee4jDSgBxQZDWj7A/TpmVRxo1rb2/jLUCtt5sqXu
	IiN04LJMS2lObWvUu/eewPD2h1gedyg==
X-Google-Smtp-Source: AGHT+IGXNQd+0tJLmUXddHIo1j/DHEEZvybJUyBGUresmYG9sx1mdFAY7nd0ymNHYdn+8GtUly3OiEWyux7bo0SKJ2Q=
X-Received: by 2002:a17:906:3183:b0:a75:1069:5b94 with SMTP id
 a640c23a62f3a-a75143e700emr545024766b.21.1719939789328; Tue, 02 Jul 2024
 10:03:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406270912.633e6c61-oliver.sang@intel.com> <lv7ykdnn2nrci3orajf7ev64afxqdw2d65bcpu2mfaqbkvv4ke@hzxat7utjnvx>
 <vgg45kxk2fiyznm44w2saz3qjiwrjp3spvpswsl4ovd2jl5c5g@54dlbd4kdlh4> <CAHk-=wgnDSS7yqNbQQ9R6Zt7gzg6SKs6myW1AfkvhApXKgUg4A@mail.gmail.com>
In-Reply-To: <CAHk-=wgnDSS7yqNbQQ9R6Zt7gzg6SKs6myW1AfkvhApXKgUg4A@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 2 Jul 2024 19:02:56 +0200
Message-ID: <CAGudoHGuTP-nv=zwXdQs38OEqb=BD=i-vA-9xjZ0UOyvWuXP_w@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 6:47=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 2 Jul 2024 at 05:10, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >
> > Well there is also the option of going full RCU in the fast path, which
> > I mentioned last time around lockref.
> >
> > This would be applicable at least for stat, fstatx, readlink and access
> > syscalls.
>
> Yes. That would be the optimal thing - have some "don't take a lockref
> on the last component at all, because we will finish the use of it
> under RCU".
>
> I looked at that some time ago, and it didn't look _horrendous_ from a
> conceptual standpoint, but the details just got to be nasty.
>
> What I wanted to do was to hook into the "we're still in RCU mode"
> with a callback that stat could set.
>
> And we'd call it at complete_walk() -> try_to_unlazy() ->
> legitimize_path() time just before we do that lockref_get_not_dead()
> thing.
>
> So then the path walkers that are ok with RCU state (ie mostly just
> 'stat()' and friends) could set that callback, and get a callback
> while the path walk is still in RCU mode, and could fill in the stat
> data then and say "I'm done" and we'd never actually finalize the path
> at all, and never do the final lockref_get_not_dead().
>
> Sounds simple in theory. And then when I looked at doing the actual
> code patch, I ended up just running away scared.

I was thinking a different approach.

A lookup variant which resolves everything and returns the dentry + an
information whether this is rcu mode.

if not the regular handling + path_put sort it out.

If yes then the fast path handling gets involved. If a filesystem can
provide a custom callback for the regular usage above, there would be
an optional callback for rcu mode as well (and it would be illegal to
only have one). Should this run into any trouble it can return -AGAIN
at which point try_to_get_actual_full_ref() (but better named) routine
is called and it tries to get the actual ref.

Suppose the callback or in-place handling worked out. Then a routine
to validate nothing changed (at least dentry seq?) is called. Should
it succeed that's it, otherwise the entire thing redos the work the
old fashioned way.

I have not looked to closely yet but I think this is very much doable
without much swearing, I am going to look into it after I find some
time, maybe this weekend.

Regardless of the above I think decoupling actual dentry ref from the
d_lock is a valuable step anyway, I am going to take a stab at that
too. Most of the work is kind of already done with the 1->0 transition
already handled. Just need to replace non-atomic updates with atomics
and cmpcxhg with a flag to whack new additions.

All that aside, the lockref patch reported here needs to get dropped
from the tree and I don't think a lockref-specific replacement is
viable.
--=20
Mateusz Guzik <mjguzik gmail.com>
