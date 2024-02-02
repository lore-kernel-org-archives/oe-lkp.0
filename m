Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F0D62166
	for <oe-lkp@lists.linux.dev>; Fri,  2 Feb 2024 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706865250; cv=none; b=Mh4kkiTHeMT3EzueZ6TKtmatXHsuuxDHOqBDOTwRVFHNdQCij7zs56h9nUhxTCuRn1vXVFo16Tltm7ETUngeowY7FxLYx0XDuqx0MH3cNQ1yJs9HFr7SOnUHhqkR++BgabZd6DV7dwuw47bKAUScMClrQ4VXoX2tFmp3MmP2uwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706865250; c=relaxed/simple;
	bh=kBYTNwS6Us4GwZnCPZJooUBVvwncpX0u33cfM3dFqGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hk/xd7Yo9oQPAu4g3wLhgx0Sg23TRaf3/lI3ai1w+TaWsl+Mt5vKouhoSCuwC2FCg81ERrnwevtLJ3w++XRZQG7nV6WTZGKi/SWVfKSDN4HbeI3Aw7Jx8jy1l7j0CDBJr7VcrzwqriFwQWECW09vzweIWB7Qxi+/cT8oYgACDW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9O3sgbm; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9O3sgbm"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-785388b3281so113220785a.2
        for <oe-lkp@lists.linux.dev>; Fri, 02 Feb 2024 01:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706865248; x=1707470048; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbAAumpPfIt/JaTeqaHTjOEYGyvHU1h2sRc7QPBrzJg=;
        b=E9O3sgbmnvnsCwu+xiGLV8E3DRvngVYLkPhIbbP/Kq/zt5YlecABi251hbGQQSh9iX
         24OzFX7yiRNIE1kNpVteP5ezniToGyjoORKEeJGtuqrZVPkdHREWGMzIjji3P+TGphCr
         m+WcSSQ1V9fmbocR5h/POcyYYsF76PunIveYSVt1yOx80WiOwdO9OLJyg8N8l5EoUOS/
         OmY6ZQ2vbv0kVQjyNCphx/chW6HI+v8kFhmzpZXh9nUFdEy0oK0aMmr7s7adDjB8ZMlx
         ErIEr37wnnPZHsxATp6Oj84yiTymklnRVz7+9+Sn58oUcUhowcfkb2XlNCXvLRCAXize
         V8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706865248; x=1707470048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbAAumpPfIt/JaTeqaHTjOEYGyvHU1h2sRc7QPBrzJg=;
        b=sugpxyzy00N7APqRHTWLS0hkSVKH5QhZRzvIxTRulYGuHUBUy88fVEriCVh2Y5cpGv
         1G50c5GqYypp9cuvd104uBBbSIqwc67PwjOvFkpdB6a1y0oY+jCcAU5aEdtK4debvYRh
         ev7kcQa1sKlrsWwOmuN0BZfnXoExQdm3AYppziRYcFifYLfme9e+utI8sllZxajrC3pP
         +OhNMbziUe0WC5djEpX7J4edyp8HjrZTy/ejLE/6/Z+XiZIfAiRIYNMTlfQSBgSWs38H
         U9ly1msy/n+04hYKZffbAda4hFtaVwsm7HXlLm/m4vhAiwTXl2/Hr2BfgiEi8VHaLBhY
         3F/w==
X-Gm-Message-State: AOJu0Yy/O3jpWCr4n7ZIUSnJDnZk4fQJSxwHk/BlnlFpYbLqyNb+eiVx
	dkRCL7F4LOedIwpJwJXshvuO+NmYZsh2TyY6pIhoTiJAQvNrj17VUQR1mWGb/pG/SKpoaf5K1t5
	aQKe4/2vrXX0xHNHs9gXEmvNHYOU=
X-Google-Smtp-Source: AGHT+IEA6Ff4lcXRh07SyKhXAs07igcF4REEo54H7o8fp0nV88H0+Q3BYm+9VXx6KrD6j55EIuIdaID2z7TnHzCt2R4=
X-Received: by 2002:a0c:a99b:0:b0:686:ad1a:ecb7 with SMTP id
 a27-20020a0ca99b000000b00686ad1aecb7mr1009057qvb.42.1706865247858; Fri, 02
 Feb 2024 01:14:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401312229.eddeb9a6-oliver.sang@intel.com> <CAOQ4uxiwCGxBBbz3Edsu-aeJbNzh5b-+gvTHwtBFnCvbto2v-g@mail.gmail.com>
In-Reply-To: <CAOQ4uxiwCGxBBbz3Edsu-aeJbNzh5b-+gvTHwtBFnCvbto2v-g@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 2 Feb 2024 11:13:56 +0200
Message-ID: <CAOQ4uxgAaApTVxxPLKH69PMP-5My=1vS_c6TGqvV5MizMKoaiw@mail.gmail.com>
Subject: Re: [linus:master] [remap_range] dfad37051a: stress-ng.file-ioctl.ops_per_sec
 -11.2% regression
To: kenel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 5:47=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Wed, Jan 31, 2024 at 4:13=E2=80=AFPM kenel test robot <oliver.sang@int=
el.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed a -11.2% regression of stress-ng.file-ioctl.o=
ps_per_sec on:
> >
> >
> > commit: dfad37051ade6ac0d404ef4913f3bd01954ee51c ("remap_range: move pe=
rmission hooks out of do_clone_file_range()")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
>
> Can you please try this fix:
>
>  7d4213664bda remap_range: move sanity checks out of do_clone_file_range(=
)
>
> from:
>
> https://github.com/amir73il/linux ovl-fixes
>

Sorry, Oliver, this was a buggy commit.
I pushed this fixes version to ovl-fixes branch:

 1c5e7db8e1b2 remap_range: merge do_clone_file_range() into
vfs_clone_file_range()

Can you please test.

Thanks,
Amir.
