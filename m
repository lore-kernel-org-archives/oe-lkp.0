Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D0B25EFB7
	for <oe-lkp@lists.linux.dev>; Wed,  9 Apr 2025 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204674; cv=none; b=cN7dieJQCcorM+rBwvhCCWN22YPoqdUprDzYYZpB4brsfbTSS2TkS3wbqunuRmAGFrIpp/ZkhaUoFzvgx2oXqWA+Wbbx5AUQM8tpXylifiuFfGE25FvXgio0G42kyaMu+2/K6QZdsLgpXkFsuaODdsnCvaIjU1KTqpmFqahUKYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204674; c=relaxed/simple;
	bh=D/MCR71EqHWVnLNSKNzTIQRlJSFQd7jmnkF/gRKH0qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L49sFdB3xkelMxjLyGs3DfLlC0rh7Z9/BXEPoXrVZjv8GFmAuhZeINJo12B6KWTPVqElUWYKL2i5jKY38QNUGMtvOpjri/+xUbU/KH7CPjJ4bFiZs6UWITCHHBoMDSF8Rxg7jM4yfeG4gohNVm90hvDj5y/wBDDFi9aHCiowIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTKebqFE; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTKebqFE"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so8576101a12.1
        for <oe-lkp@lists.linux.dev>; Wed, 09 Apr 2025 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744204671; x=1744809471; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/MCR71EqHWVnLNSKNzTIQRlJSFQd7jmnkF/gRKH0qw=;
        b=lTKebqFEEo4zfbip8vajvUb8xQ86SYyT9+72ypzj6iXl4M8PeS8CgsJA5hYDPamcgx
         GRGck8L0gf5in4PDe7IsrWaOtPLNF8k0sz0VY3KvUfzDABYVLRDJr9jmsxxYXGrkQnoB
         A4O8+4G39A2K7PJFlAK64dBSXm+hHCEZywijm6dgxSk4C89OoYn3kImV9S3aeTjXSr5e
         WNveE7f5daRrIbgd/8zOa4gk3NoK7grIHFB4LepWnCUjN4DNGxknCfQA/XZcAbbu4DLy
         /XSBhcbSfkg74tk/FT8waork9b4j2cagDaMNXJEAgmfJv50UJROKvVB41njIfvfmKvCo
         v3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744204671; x=1744809471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/MCR71EqHWVnLNSKNzTIQRlJSFQd7jmnkF/gRKH0qw=;
        b=ImHeP6GaeAYo8CChw/rqnjVBAx9UIvliAHoEck1c6UtsWI9dw/7dQ6QA7evtgyTem+
         QcYTzBHwANtTWhEOMHmnZa2d0Hx/JNpdRsM61+BikFueomiN2IAC7OnDWSJvUs+9lXsY
         /2gIb8d5SgY9m2jNYd94EQiu24Xd+gFY7i8x5FQ4v5lMxcO+WW++1efrMrhq3QkgBrjA
         NXJwfLYDFGIuVGpf0uE5+4p7cYVZGvPBuTdw5GUkU6FYMnOvf3KVUMRcG6osft0Xa+p1
         u3eTvVmJSnLWUYs1TIMNGm7aDFCfr/zzQY1xPKyDFNGZlLeusThn5+IagKIt3WOjEyGJ
         COmw==
X-Forwarded-Encrypted: i=1; AJvYcCUz6GteGEr4kOIQ5Ev1wy0vEJadSHi1zoSBle9XD++VcrTGT/dUJEcRI8Efhbzgx+aE1eKd+Lc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl9yXbQtjDu8S50faeJWm99XbRqQFtnJtiNu2Itz64Cewj1sGV
	LNLverhoUqXvHE/PElFQn7TTRCULzE2K/IFEuZQzWi2mebpsN6MT3gwxlaQvH2GD1LQERwj5a3C
	F2UeZMExkjAhU3Q35qbROe3DqmIASpg==
X-Gm-Gg: ASbGncv1wf4NmuUM3yoM3CDCwdXQKedYrbo51nHtQ9hGHHR3Q1y/CtJBnGVWRSrhB7a
	+m1WeKZK/HO3NjAp8LtiWoouywFREmKYhIPTWmMqlohMAO9A3KaZjH2D/rhtK8RZggMZtSAZ5zQ
	2JaCI2MC9ACD8J4TBfwuKwiA==
X-Google-Smtp-Source: AGHT+IHwHTDwUVV0y8yWVxIZ7y0reNFw2Zw0U2c63XlmbYszH7wXVnkwIv4Bn6B4aeOEHHwzVTAbvOvhm9PHutIr5Oc=
X-Received: by 2002:a05:6402:5108:b0:5ed:1d7d:f326 with SMTP id
 4fb4d7f45d1cf-5f2f76b396fmr2347881a12.10.1744204670689; Wed, 09 Apr 2025
 06:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
 <Z/ZxDjbEDx+wkLOO@xsang-OptiPlex-9020>
In-Reply-To: <Z/ZxDjbEDx+wkLOO@xsang-OptiPlex-9020>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 9 Apr 2025 15:17:38 +0200
X-Gm-Features: ATxdqUFakI0dCljaTsNzktx3B2iZqMO90gzML0ypVEi3Jmh4B-mGiN_X3EXtlng
Message-ID: <CAGudoHGgckSpX=RwjLuaw3SvtBUCdL3n8En23AYkJdFE2GD+Qg@mail.gmail.com>
Subject: Re: RFB: unrolled inline memset and memcpy
To: Oliver Sang <oliver.sang@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-lkp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 3:07=E2=80=AFPM Oliver Sang <oliver.sang@intel.com> =
wrote:
>
> hi, Mateusz Guzik,
>
> sorry for late.
>

no worries

> On Mon, Mar 31, 2025 at 01:38:18PM +0200, Mateusz Guzik wrote:
> > Can you guys please bench the following,
>
> do you mean you want some performance comparison between with and without=
 below
> change?
>

yes


> any benchmark you are interested? we only support some micro benchmark wi=
th
> limited coverage.
>

anything you can run, nothing specific

> is it possible to push below change to a branch that we can access? if so=
, the
> change could be merged into our so-called hourly kernel, which could have=
 bigger
> coverage. otherwise, we need to use on-demand performance tests, which on=
ly
> cover some tests on part of our machine pool. [1]
>

will a branch on github do the trick?

> > at least on one CPU *with*
> > FSRM and one without?
>
> do you mean Fast Short REP MOVSB (FSRM) feature?
> if so, this is supported starting with Intel's Ice Lake. do you mean you =
want
> run same tests on machines with and without FSRM to see below patch's imp=
act?
>

yes

--=20
Mateusz Guzik <mjguzik gmail.com>
