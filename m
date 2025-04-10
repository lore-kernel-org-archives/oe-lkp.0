Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA254A04
	for <oe-lkp@lists.linux.dev>; Thu, 10 Apr 2025 04:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744257688; cv=none; b=h7+i9yPCf+FKWgfomZS6DR3uAE8cKaeE70Sxn5aoydH7ibNM/xcSVuYTia3shD+kpu3F2z1aZhJvDYNCdoBXIDxOrJvFJqI2Xntf3fHtm0Fq1W+PkXIsQPpQT7jRqoUiC8eFYjM/NJitMqq+LQ/7RbtxXyQYkhS1K1NLvgzPX7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744257688; c=relaxed/simple;
	bh=CwvzL4AsMzXSbjL3ZETc3aWRdXIswR4wRLn0nVk+SRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4vgt5FTmgFWCfQvyV3iDLz2BC4e/YD9z98UYoi6oms9denqDc64SV+6V9MDGUOdAfxUeZNGFR+k7E4R3C2DISKqG02s9v2sKc0C22FYeIc3rvyRgSTASyFLY8spKR4asv156TUEzERxUaKOeRA5PFVTZW/FWAu5ue1ka0uF9Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMCbmuXd; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMCbmuXd"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abf3d64849dso76151266b.3
        for <oe-lkp@lists.linux.dev>; Wed, 09 Apr 2025 21:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744257685; x=1744862485; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwvzL4AsMzXSbjL3ZETc3aWRdXIswR4wRLn0nVk+SRY=;
        b=lMCbmuXdOxkfYC+mJo+laWfK+bukY+x37G3SfsePnOdi+SmeZq4+CWZ7aRtXNl73lx
         8SvTOlvEqRfqWbOOo/DyhE8pyHOU+0NkmEnJIlbLLOxfJLOBptIXlGpo6K5z361Tl3t3
         4MgMFQXoOH6LOUK0QX8yDVp/9/GNIyMZBRo7nxU8KNfXGIqheqV1OdT3zdtY8OancIna
         ZiMSog5TIuokLGmVZN04HvPIuK1TN0GGdjeEFRiLHS1vRoT6rQTegqqsLgcC39h71Cc/
         Fg2+twcl1gT/INZNMy2fbL8+lBVcg9M6jwCv1imqFuLZDtBCZbq06qaWvnch3oMutY/b
         VnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744257685; x=1744862485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwvzL4AsMzXSbjL3ZETc3aWRdXIswR4wRLn0nVk+SRY=;
        b=EmbYpt7meMawgKRowYTjN1uNO2D4vx5MNsrTd6UuC0+1HxtEU/DDY7edMNcqALsxsv
         m+IXKXKS/s0mVBDmGNpiuwVly4DLb9sC5/N+OiZUE7savAwtOPX5KU9PhK+o+ky6U8KS
         OSu1N4ZIAmkCQdYmURjhDKUPAECVjmxcJwDooza+vfZGCWGGI/Tw32kkYNrND5aCqaaQ
         AvQRW0vCgvmXkX5TE74AkBfWBRWzrcr2ImbgTm4t+v5IfyciIjrJv5M8nKSqz5sHFMAm
         2Fb2Im/taAP8pjG/Uwy9wGQMUiwPLP7X9aPTQ9gNqp+HdKuVb1VQTnaX8QCdLScazNV2
         /BAg==
X-Forwarded-Encrypted: i=1; AJvYcCXgqbtEuomalPYHGpHYFIiK1O3hJ7cHpZek+xixHNoMb+koUDxMSdGT42CsIeyINzyXj3WWsfA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKcdohZURZX3D6xaIpYjgzToQW2E/3cvo0PK2/C5LcznoTbKb3
	9JKNF7lcnP77AkWLvXjFOMktt1801SvK8YCqAJx9ND+DWi5iOPTcUVZL28/VO9cJEQymPlLANWC
	lvpWYoqC+vwDLlVJGWmCVG8nK/yg=
X-Gm-Gg: ASbGnctzQyfpc5XTgHuuR/N39Suy+iSTdQax6aCoKfmRfCvbDVuYTyIRRyGCj4o1uzv
	GxRGtYMwOHSBpScg77WKys6hoquSq2XR6aKpsVPHxeRI5eDKX1t7XV25SSyerH+obbDCIsk/iz3
	KijiURWv5ePI1uzjwSPn9e
X-Google-Smtp-Source: AGHT+IGZTLYIwdQumP0uv7CnTlzR5H5jLbLjswRRV47HoP22F4zYo9r0A0rVM7qMqikD2m06HiQUj985Mm0BNxJPbb8=
X-Received: by 2002:a17:906:c115:b0:ac2:9841:3085 with SMTP id
 a640c23a62f3a-acabd204600mr99268266b.30.1744257684862; Wed, 09 Apr 2025
 21:01:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
 <Z/ZxDjbEDx+wkLOO@xsang-OptiPlex-9020> <CAGudoHGgckSpX=RwjLuaw3SvtBUCdL3n8En23AYkJdFE2GD+Qg@mail.gmail.com>
 <Z/cjiJKmcEMgAqcP@xsang-OptiPlex-9020>
In-Reply-To: <Z/cjiJKmcEMgAqcP@xsang-OptiPlex-9020>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 10 Apr 2025 06:01:12 +0200
X-Gm-Features: ATxdqUENY_gbqdRjCnQNKCz9myOLcQwmzp4Dp0_X-JS_ChgJfLm1-ldvG4ac8YU
Message-ID: <CAGudoHGD0EhEajMCxdQ3f5sjzsSJhZUb6c+rfAjFGx_9S7hqoA@mail.gmail.com>
Subject: Re: RFB: unrolled inline memset and memcpy
To: Oliver Sang <oliver.sang@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-lkp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 3:49=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Mateusz Guzik,
>
> On Wed, Apr 09, 2025 at 03:17:38PM +0200, Mateusz Guzik wrote:
> >
> > > is it possible to push below change to a branch that we can access? i=
f so, the
> > > change could be merged into our so-called hourly kernel, which could =
have bigger
> > > coverage. otherwise, we need to use on-demand performance tests, whic=
h only
> > > cover some tests on part of our machine pool. [1]
> > >
> >
> > will a branch on github do the trick?
>
> yes, that will be great. one benefit is if you want test new changes in t=
he
> future, you just need force push to overwrite old patch, or create new br=
anch,
> we can detect the update then try to merge into our hourly kernels. if me=
rge
> is ok, the test will be triggered.
>

https://github.com/mjguzik/linux/tree/lkp-bench

based on master

--=20
Mateusz Guzik <mjguzik gmail.com>
