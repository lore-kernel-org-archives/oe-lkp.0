Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B2918AE4
	for <oe-lkp@lists.linux.dev>; Tue, 13 Feb 2024 08:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707811865; cv=none; b=oqECLzb0kaRoIUaFFpeGOYkii/gfTe0Pf6v7gfMpUoHsuEUJFVFPdqX3J0vBYZDdQaWwX2y3+7EdWmY4imkAkLV/kxCJvbVYIOxR2Eh+aNLJK3XD9d4Ase/iHf7aS5sNAH6R0XYZFshaqKDlXObWq8xf5vNoC275/gDQBb21LQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707811865; c=relaxed/simple;
	bh=wSCAQBdMfTC+3MndVZbkwv4BtZJdwtzZ+Uis1k9VN7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHntsamIG870ysHED7daDuW2GMm1XKKRwfGfizSH3akevdppeyuP8ma2MNl3OfQiKfCgBHDa0B6igwZFjxnoF4IH1S1IV7fKdAwY1YWd19gkUXTxbSaY0X5I9xqDu5HbpuqnVPCM8iqo2ayu7vhzvnyfR1AjkMg5kQX33C/P8GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t9JV5xhc; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t9JV5xhc"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4affeacaff9so771984e0c.3
        for <oe-lkp@lists.linux.dev>; Tue, 13 Feb 2024 00:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707811863; x=1708416663; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyx00npWeFsll5nwI/taY+6s7E/z5NPem7hxp9luVYI=;
        b=t9JV5xhcVkhecpfNitkd0VwEaDctbhkSWK+hFyiHL1KbtkFwyMEJNiVCI0Uar0LKak
         7jwQJRth5n/OORQ6LUK2KUO/QjJdXcsYTpPtGPGiluTCYozBQio5Wklc4gAwodXH+HAM
         ajz4yqw54ozLGVGNNcwcwx845guI8ilSfxQpQTGeFLi4REYMUHfMh3PxlMZuI5SP+wYG
         i/xXdP8k0K8+FK2dhmg5dOGdFep+0hbcVCn8pB6LYzW5tdl1Bxk+9zIEgRUXcMu3vI4u
         u1/FMzwQMMpVrWibHLnkCYftTEOtxR0g5ZAiwYXvVg9bCb69X57yjQj2BRIhqK2h0/Vf
         NthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707811863; x=1708416663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyx00npWeFsll5nwI/taY+6s7E/z5NPem7hxp9luVYI=;
        b=aOqpymA3eUFQ9AoyNugsgLJr8reZOQuZxjCZ4rzF7Gq2U61G7JQOf4OSusD7+f/xJJ
         2/fWVJxO5GVXKN8hca/9TKph/RBRA6p2IZB1vUxV6n1cQpCuLQsLWA9C8ggUA+fhs2Dh
         GKsrePxci3ZsswR+AdZJM5UPis0rt4+11Wlr7Y5JCiP2gqmRMY+Ec5Jk0GRoyDZu2eJS
         Ls7R0zMzoRGZIZGD+9CV06RhXw8Fu/HjNzEuWZQMtyaRGGOsyX+HijzzY+2QUbSDjZzP
         EcW1WupHJox+Cg9uHKdGpVIwxrbQbAySlYTY3XtyMdV8E0CEE+Bt3Hgia586wosYp8LG
         edOg==
X-Gm-Message-State: AOJu0YwHmdvnH6JLqdZH8U8qE+O8CxXPh0o50hHQ84GUUlyYk1ReAMWT
	o28pne8kQdrdDdW6ZtK8LaQAF9jHUyuxjouFks61ciPhgTMcXuaCU5bIjF5db2CVE+94TGckFQP
	TKVRnF0b++I5ffwsMcs39FgSlToqCJFrSyPG7Xw==
X-Google-Smtp-Source: AGHT+IGr0rY+BYn3KFPOnwH21/cIEVqFi5fSMMU1bOGVy5YdyOfJaSi6Db4qCj8odk6BvfgVKZLys2G4N+i1W6bMMBY=
X-Received: by 2002:a1f:dd84:0:b0:4c0:3cb3:446f with SMTP id
 u126-20020a1fdd84000000b004c03cb3446fmr5048576vkg.4.1707811863050; Tue, 13
 Feb 2024 00:11:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240208095920.8035-23-brgl@bgdev.pl> <202402122234.d85cca9b-lkp@intel.com>
 <CAMRc=McrFqa-nS3L0qGZ+eCff79jWrEZLmg-OJiNw6+FQ44i+Q@mail.gmail.com>
In-Reply-To: <CAMRc=McrFqa-nS3L0qGZ+eCff79jWrEZLmg-OJiNw6+FQ44i+Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Feb 2024 09:10:52 +0100
Message-ID: <CAMRc=McLsY47oAk3GWp0Cecb=+fEtRKjJ_L3kyKkxYkEnwME7A@mail.gmail.com>
Subject: Re: [PATCH v3 22/24] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 10:20=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>

[snip]

> >
> >
> > [   76.432519][    T1] gpiochip_find_base_unlocked: found new base at 5=
12
> > [   76.434591][    T1]
> > [   76.435240][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [   76.436545][    T1] WARNING: suspicious RCU usage
> > [   76.437813][    T1] 6.8.0-rc1-00050-gc21131f83abc #1 Tainted: G     =
            N
> > [   76.439873][    T1] -----------------------------
> > [   76.441158][    T1] drivers/gpio/gpiolib.c:219 suspicious rcu_derefe=
rence_check() usage!
> > [   76.443364][    T1]

[snip]

>
> Paul,
>
> Could you help me out here? It seems that lockdep complains (with
> "suspicious RCU usage") whenever an RCU-protected pointer is passed to
> rcu_dereference() but is not actually dereferenced later - in which
> case switching to rcu_access_pointer() helps. But in the case of the
> of_unittests() it also emits the same warning for
> gpiod_direction_input() where gdev->chip is fetched with
> rcu_dereference() using CLASS(gpio_chip_guard) and later actually
> dereferenced by calling guard.gc->...
>
> Any hints as to what I'm doing wrong?
>
> Thanks,
> Bartosz

Seems like these can be silenced with rcu_dereference_protected() so
I'll use it for now.

Bart
