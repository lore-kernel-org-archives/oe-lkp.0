Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DF239FFA
	for <oe-lkp@lists.linux.dev>; Tue, 27 Feb 2024 16:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709052254; cv=none; b=DtnQ3yB9P2hdNwYyeTVDqsSI/bJ/HL2XJa7720KSadSBPU2aIpk60rP1gZ3gkIDggmTv6uv8O3eket+qacy1vKaLtkYWJ6t5IS6vqMSHQh/+te2CGpwuDxkev49m6St3FeDTh0L3MT8ggAYIAP/5KWmJN0GDPWEawYP1ejsD2/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709052254; c=relaxed/simple;
	bh=KIp0rmx+ayKj9IPU67F3Rr4R242hsgywg+SNQZ5dgfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zpnh24bonMm6g4AaF9YxcpZ4AHsFxcNG7tXJwqJv7rzkdQVQahbz7ra5kdqwSyFZkUYScUCPM8CEKd5SUPte0iAHTQpcOGm95TSa1dnuq14G2BvZHO289/mLk4z4JIvGwqwXUoArmq+rnMI5gnMmnhdYv96R4SDv7+7JaV6aC38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hMAeUVWO; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hMAeUVWO"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7dad8437347so11533241.3
        for <oe-lkp@lists.linux.dev>; Tue, 27 Feb 2024 08:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709052251; x=1709657051; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIp0rmx+ayKj9IPU67F3Rr4R242hsgywg+SNQZ5dgfk=;
        b=hMAeUVWO1r7wpAfCp5H0Pc2JjUZGQoEwwKGWHGkcxUgJi77rTr2+RtRjwu5t1dY0Vo
         rRioGbxqRGIsVtsVX85EUncKbCDd9F2GLaPQ6BOzOV7XG+eeIzN+GVF7MoG0AdBA70w+
         OmMuwTk1BiaGfZSPyRJLY8BKOrAinNknRPDSA4Np8g3VkZCgXyOKjI3sOsuSEUmY8ha3
         9rOwT77lpLIp6E7LD27o3KMVtrOxnd/9K0HEZ+1iYDEF+d5Unr04QYCC310quIRhbZ6K
         LIArxIMwLuZD6CVOA5I81IhB0XyFOrSDJmXc1EBOpMvMt0DaJ63A5zBY7dcsRlfMimtw
         09kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709052251; x=1709657051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIp0rmx+ayKj9IPU67F3Rr4R242hsgywg+SNQZ5dgfk=;
        b=UqAUUEmKG5ckpmWeJ9+LcELFjnZy5A2ntFS2ufMJM/kcryG47T9k1IjWkV7SvFd8ao
         0ZxyiA7v2vE2Sfm0AQ1O43TI2z6nogWaU1tUX+0pT0F+0fYmQXuiWHx+XhESZ+y/c3oJ
         g4C8OpiLuDoZhNkQ9oHjZB5rY1No4nfdW1AvWc7ZTA8WkpT3AFLs+uxmX5QJcwSiPlvY
         cDjEIM4uihjAeQGRzCnC5uZ0+hBffpoQvL95i2XEqTPlzvmasCdnHwUV4AsOjTde5AC7
         sHQPNhhju3rmS5UW5XJp0eB5CVBlP8WGuwy23ZrXVrJCOVHmwfNsGPc7U0d3XVQwMRFY
         N4bQ==
X-Gm-Message-State: AOJu0YyeUj6HL07z3HjfESs0ISTjTIUmmIt04f4JJ47qz2Od/Y3nLMTV
	oPd3Dz+eD1caIuq9OMOSC2GDcSmwIwFgANyCTpGBdG1Wyve8UbIdSU/Jh+wwU3JVHsdyvKRmboC
	9LVtbX9Rpbtqx8FCDhpHdEmc6kI/nOpMTYJAtLA==
X-Google-Smtp-Source: AGHT+IH2ONdjwwoI0rA5UtAbqRSwSTglngGy8N+DsOjlwARrz+89QUblO+JAMpp5uvf/Fs8kmMiJ+34cMXWkQ0nywbc=
X-Received: by 2002:a05:6102:3ecd:b0:470:a136:5c00 with SMTP id
 n13-20020a0561023ecd00b00470a1365c00mr10812685vsv.17.1709052251549; Tue, 27
 Feb 2024 08:44:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240214084419.6194-3-brgl@bgdev.pl> <202402262225.50983057-lkp@intel.com>
In-Reply-To: <202402262225.50983057-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 27 Feb 2024 17:44:00 +0100
Message-ID: <CAMRc=Me=sfoimct+YHhhq+1vSY8eb7vNdvON4zibx3a6EhnzJg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] gpio: cdev: use correct pointer accessors with SRCU
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 3:28=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" o=
n:
>
> commit: ef4aabaa372144b2bfa9c4ddc83255831cff9ebd ("[PATCH v2 2/4] gpio: c=
dev: use correct pointer accessors with SRCU")
> url: https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/g=
pio-take-the-SRCU-read-lock-in-gpiod_hog/20240214-164752
> base: https://git.kernel.org/cgit/linux/kernel/git/brgl/linux.git gpio/fo=
r-next
> patch link: https://lore.kernel.org/all/20240214084419.6194-3-brgl@bgdev.=
pl/
> patch subject: [PATCH v2 2/4] gpio: cdev: use correct pointer accessors w=
ith SRCU
>
> in testcase: boot
>
> compiler: clang-17
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>

Please disregard this one, the issue is fixed in patch 3/4 which is
already in next.

Bart
