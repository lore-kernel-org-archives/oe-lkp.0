Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D017BB0D
	for <oe-lkp@lists.linux.dev>; Wed,  3 Jul 2024 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720015902; cv=none; b=odafo3MkwKJPRpiec7LLcdMvTY5tkjn4xD5swiDoFun8cULRknwhHaeN8bvbfpJQVE/HeddZrKt0C7UZZPA4SusvH/3WBZhuqUjpjSkOHg/BS+llDchPpxR5MJMYyiUc+hqHQwajw0dvfRot7BRu5I6Wj27tNb02VOevaknT2U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720015902; c=relaxed/simple;
	bh=m8hCT7EOm/KzocY2lDql9ksozHqcMD8DmIHpk2qdW1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkgnG2fwrrdbPy/ypb7EBDqV8b8BR0FLj3eFTZ5AQ6Z7nvt7CFsQQjO3PRAEH8h/ZyNXgxZWZNW4he3kCOQ5+qpBvEYwgbaZR5cdB9UkB35mM1LfvGYFEM07lhSDIdKjm/FaISW/w7J5CB4nJz7mhu8wuavurZhZ7Bg0b8uFFZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeXkjZ6S; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeXkjZ6S"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a724958f118so668135666b.0
        for <oe-lkp@lists.linux.dev>; Wed, 03 Jul 2024 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720015900; x=1720620700; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+jfOfJ3/jY+788L7avbBrQiHekIeiMO253ikR1T3ag=;
        b=PeXkjZ6SAeDwD1I5ct3g8o0gQhk7k5ztKt7N5X5bhlimNClOsYGmJYaCsykeSu9UUV
         ugS0VfOXSCgnM+YBIUp7YzlXDxwump/opYeRHgf0isbDnY1yopij5ZS/u24LhSmq55WG
         L5gMys/u4Vh1pDa+cyTeYe6Ct6pg+d2BHy+srTMXqV1Hmeh789FZiBQJEM1lVrL7PDdH
         lhbJwIndAVNuryz/LsspKU8p0nNQbwvdhro/TKnWCDxAmkvLPEj4D66mZbXilhGpa2d5
         M2Jf0LeR5v7riAjnUo8DIrFIJ/sIGSh9zmbSjRMB+Ox3L1MhQa6TLXoTkmUVtTvy/+e6
         CNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720015900; x=1720620700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+jfOfJ3/jY+788L7avbBrQiHekIeiMO253ikR1T3ag=;
        b=kFlrQvMxMf3ulcQR01DQt1ENyGoyayoQMCZP2/iQ433R/COSTbQyhqaSojXtR3vfsR
         ZKjUP+r0Kl9MHMmk8ebz1rdtL+FHq/eOd3qK33D5xpzVTq1el4J4ZAQoseDRUheN7G6g
         AUYuQxnqyNZlAd2IEA8jKcghOYTkDlkERvlDFDVM4Nwx+/e2i63xALytqfOvZp/Xun+c
         gk3ctiULNKeY8pPPKqrfwHg1IrbQV+b+6mLK5m+7NjQ+/9m/ViNlXJ/wiMqUcxmGmB0m
         bdcGrupQR48rn3uknsZY2Icv9nEOy04O0GBh6tzskQpY3kn4q+h3J/7ZJrUcpuKRc3dc
         oXQg==
X-Forwarded-Encrypted: i=1; AJvYcCXRA5dkn32MKPc4vxaE59JaOL0ba0xSB2FMR3ceXYBn8wbvVA5aqVvZN+3Ot+aZBEWEDIEA0NeCX05xv3vWKQL5FwCeZG9N
X-Gm-Message-State: AOJu0Yy2uXUU2K0SXK8m63NhHfmRYdn5uXEhAq+YmZ1RcTSgahfjVbVM
	1N4NaG0/pRbIlv5VahJB3JSPQw6qIt8ZAZEtRhwpeTgu3Y9Ea7f043XhJAOsumQl9eSFFcfcgv8
	OsG/ofgoAMbpcPyxrlmCmI9DH7l8=
X-Google-Smtp-Source: AGHT+IE3jD545xz4CdEoFN2qZKeLPkj9TIBo3lb9j/pQ0Q6mPtJJR+TY7Q/5JydaEL8odgHFIZ7STtFK6v5V18RVLNg=
X-Received: by 2002:a17:906:594:b0:a72:40b4:c845 with SMTP id
 a640c23a62f3a-a75144badc1mr687998366b.51.1720015899409; Wed, 03 Jul 2024
 07:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGudoHGuTP-nv=zwXdQs38OEqb=BD=i-vA-9xjZ0UOyvWuXP_w@mail.gmail.com>
 <CAHk-=wgVzKtRnvDXAzueJTbgfo1o12Lw6DH97PzRe1cGA_b1oA@mail.gmail.com>
 <CAGudoHH_z1a6MX8Z8Cqbz-jDTUoAjoxdV9KrQ6yvUkNszXO5aw@mail.gmail.com>
 <CAGudoHHg-T+ZOTm0fSpW0Hztfxn=fpfnksz5Q3=3YeCeEPo7LQ@mail.gmail.com>
 <CAHk-=wiBGSLNW6GGbnec-dCbn0kWvD+OXAa5VNXPBKLXYy5KOQ@mail.gmail.com>
 <3g3arsrwnyvv562v2rsfv2ms4ht4mk45vwdkvssxkrjhfjtpdz@umyx5tl2du7o>
 <CAHk-=wg6e8QMaBOyFaGon7pik_C1COrkmEz37mtUqpBoq=R44w@mail.gmail.com>
 <6knlkefvujkry65gx6636u6e7rivqrn5kqjovs4ctjg7xtzrmo@2zd4wjx6zcym>
 <CAHk-=whagTfq=EgwpuywUUu0ti7PPQuE_ftVjZOVrjnLwtS0Ng@mail.gmail.com>
 <du5vnvwygzbtal6qogmxckawwwxgbppuq5qi5aeqcs5unrlpz3@3k5degdvflzq> <20240703-haftstrafe-anbringen-88ed445e77a4@brauner>
In-Reply-To: <20240703-haftstrafe-anbringen-88ed445e77a4@brauner>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 3 Jul 2024 16:11:25 +0200
Message-ID: <CAGudoHHkxyCkLZ4xwQ9ho5uy0TQ4K1ENJMmSYDZkaZw6YF4VEA@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 4:09=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> > As a side note this is where I should also note the *current* LSM hooks
> > are racy as is.  Suppose you can stat a particular file now, but a chow=
n
> > to 1234 means you can't. Then your stat call can race against chown +
> > other ops. You can end up in a state where LSMs gave a green light and
> > only then the state changed to one you are not allowed to look at. This
>
> Fwiw, we've discussed this before. And my opinion is that we should
> absolute not care about this. I have no interest in complicating path
> lookup or any codepath to make these hooks less racy. This raciness they
> have to deal with. This is not a comment on your patch but just that the
> raciness of security hooks is not a problem we should care to solve
> imho. If we go down that road we'll all slowly go insane trying to give
> state change guarantees to layers that hook into the VFS in really odd
> locations.

Well I noted I have no interest in working on it anyway, so... I think
we are good here on this front :)

--=20
Mateusz Guzik <mjguzik gmail.com>
