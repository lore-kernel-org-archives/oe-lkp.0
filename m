Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C73D3D90
	for <oe-lkp@lists.linux.dev>; Fri, 27 Oct 2023 03:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESmcFkY0"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-577e62e2adfso1344193a12.2
        for <oe-lkp@lists.linux.dev>; Thu, 26 Oct 2023 20:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698378685; x=1698983485; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5XyIEM0d5aPJyRsG/Mv/heXNjjDCRH+fj3WqLUfTb2c=;
        b=ESmcFkY0etgW1e5+euOJE0IoZ3ERnVsG2rLypnXFxKfwV5BME3YhU5sBSlTARdJBBR
         FVOPAv5wCBgMR8nyXRMoR4S7rqR3Kdx7lZyEjiJmcg/vboxT4HMAre5alhT2+Qt6UDKm
         cCEPf+Za7JuTRG8HApIvoJ+/Ujv6I2qR2BU+q04JkgGYQgsf4o7HnNNaD5KZHMJQQFGA
         Q18YGyS/4O6YFM9KqSy9e44gjTbG6HvfM0O+KxvvLUi06wKPKKWm4IZw7hjJ9gfloVL9
         RgzxOkhDrCGepxfwjrOOxEIH7Ns6mMmL+5KSWoV7Ul4z+3y8QfoT6x5vHqM6w8oX4wat
         6qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698378685; x=1698983485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XyIEM0d5aPJyRsG/Mv/heXNjjDCRH+fj3WqLUfTb2c=;
        b=vGw8bBXP2vHiI+WLVjwrsXPiHKLw13CmONjekhcrRdFXmkn2lkuijscuqwVnSX35Yj
         oHtYXe5Vv9ekjcmrAqem7iKcAVi+g3VtFQqAWsw9oN7YLn1g0rg0hvmX53FqexMuUUBG
         j+aRQev9msRvUiMZ2t64yZkv3hDAFWka2bh7y3EWORVWD+B79Bq8tMgQTVV6z9F/veGv
         dRAT0PPGMTuiV5Gs8/y9mvEaGAN6EmN712BenQNc7nvK2DRG/5rtgNexOkRtFuk0BBG9
         zt4QcLOCTuwaiRhuihMqz8UryoGNure99+UZeloTvQOkiI+kxkgE/hXAJGUbPefu/fvp
         t6gA==
X-Gm-Message-State: AOJu0Yx7bPRXv0XV+kNW4XJjkyZEkw9Q9f+Jpw0yHaaUsb8ovz+Gk4fZ
	CyqcaJpVGLTQGPrWhWyEn8g=
X-Google-Smtp-Source: AGHT+IEwmWBLyvNIJWUor782XVkhqx5XlxuPJweOG6kixg7XjGXbVG4aFxXT6sRpina/iMGTnZY0jw==
X-Received: by 2002:a05:6a20:4401:b0:179:faa1:46ba with SMTP id ce1-20020a056a20440100b00179faa146bamr2129276pzb.35.1698378685375;
        Thu, 26 Oct 2023 20:51:25 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id pv8-20020a17090b3c8800b0028005766068sm951749pjb.53.2023.10.26.20.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 20:51:24 -0700 (PDT)
Date: Thu, 26 Oct 2023 20:51:22 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: kernel test robot <oliver.sang@intel.com>, Jan Kara <jack@suse.cz>,
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] lib/find: Make functions safe on changing bitmaps
Message-ID: <ZTszoD6fhLvCewXn@yury-ThinkPad>
References: <202310251458.48b4452d-oliver.sang@intel.com>
 <374465d3-dceb-43b1-930e-dd4e9b7322d2@rasmusvillemoes.dk>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <374465d3-dceb-43b1-930e-dd4e9b7322d2@rasmusvillemoes.dk>

On Wed, Oct 25, 2023 at 10:18:00AM +0200, Rasmus Villemoes wrote:
> On 25/10/2023 09.18, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 3.7% improvement of will-it-scale.per_thread_ops on:
> 
> So with that, can we please just finally say "yeah, let's make the
> generic bitmap library functions correct

They are all correct already.

> and usable in more cases"

See below.

> instead of worrying about random micro-benchmarks that just show
> you-win-some-you-lose-some.

That's I agree. I don't worry about either +2% or -3% benchmark, and
don't think that they alone can or can't justificate such a radical
change like making all find_bit functions volatile, and shutting down
a newborn KCSAN.

Keeping that in mind, my best guess is that Jan's and Misrad's test
that shows +2% was against stable bitmaps; and what robot measured
is most likely against heavily concurrent access to some bitmap in
the kernel.

I didn't look at both tests sources, but that at least makes some
sense, because if GCC optimizes code against properly described
memory correctly, this is exactly what we can expect.

> Yes, users will have to treat results from the find routines carefully
> if their bitmap may be concurrently modified. They do. Nobody wins if
> those users are forced to implement their own bitmap routines for their
> lockless algorithms.

Again, I agree with this point, and I'm trying to address exactly this.

I'm working on a series that introduces lockless find_bit functions
based on existing FIND_BIT() engine. It's not ready yet, but I hope
I'll submit it in the next merge window.

https://github.com/norov/linux/commits/find_and_bit

Now that we've got a test that presumably works faster if find_bit()
functions are all switched to be volatile, it would be great if we get
into details and understand:
 - what find_bit function or functions gives that gain in performance;
 - on what bitmap(s);
 - is the reason in concurrent memory access (guess yes), and if so,
 - can we refactor the code to use lockless find_and_bit() functions
   mentioned above;
 - if not, how else can we address this.

If you or someone else have an extra time slot to get deeper into
that, I'll be really thankful. 

Thanks,
Yury
