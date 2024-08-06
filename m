Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A961C2335
	for <oe-lkp@lists.linux.dev>; Tue,  6 Aug 2024 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955436; cv=none; b=LL498cpoSkh9NGRazurJFhEbKRkZgtCjtrTijVkM89OmXyYCsW4Urfiwm9D60gVBVGKHCeqWA2uDVVe3bq28ScwvMb5VGjYDv7aEsDSpPf03xgXZCrlWL5X1KLZkvXh28Gd9+P3YmvFpCTSD1bUCoQhCbgDRj8CwUo200zspng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955436; c=relaxed/simple;
	bh=cCHKtmZMWG5EuRXdTg7nfVOF5FzmMBB79fIHhpEkj/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxCoSubWFjouG+qwzeWGD+1gxlu8EP9Y2kSGZZUFxWs3o9qwF+d767nqGjKPYdT5G4Ijm4aSPU+fg1qPB3PuUL+2x9qjbQvclgnj8OAh77Iz48/DBhLt3J39WRJsbMRC363oIhv4Gi6Bzva+y+445teSVv2f59N8A5RBxzkf8Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZnsFQNl8; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZnsFQNl8"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7a81bd549eso62730266b.3
        for <oe-lkp@lists.linux.dev>; Tue, 06 Aug 2024 07:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722955432; x=1723560232; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V1nh4YKkk4IMpcnlyRV2vMP/rs/wYu0mGINEfgtlYvY=;
        b=ZnsFQNl8tGiRHUQYTIa3HqgfWgz+QA2IZvrMtJ8I5jvKrRpMK+16SClbEdNXGBmdiu
         nYNFr4xOAZ/wQN5cI9GIl2BBNxJSEe+hqrFbyXRXL587y5jZ5/wgkWmLrTAPCz2uiDmK
         RYmJtpc879Ye+oE6ms1s/Yybb+z2ubvkAyMTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722955432; x=1723560232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1nh4YKkk4IMpcnlyRV2vMP/rs/wYu0mGINEfgtlYvY=;
        b=iotw2q8nBQJZO7CmviDc6Zy0Tc2iMwXZ3MfVLOhupInA/uylBGBwp96FiEqct96smy
         8rmUEX4HlQCHxEKxxN0mSHYJf1fFy3x7GPWxojxrOMsAz3tVDTlZzOTM+1EbTA1nGVYA
         dSxbgcyqLEI1vLC45WhTsZLiylj4qUClQ/HXR/IobKoQp354TNBvoifyFzYcGtNjQOyT
         jh1PV8iDJCURCzlUEvVJ2evpVg12JXUWQsbTkzRHvi+iVxi6k9CDgc1JzUyJBjk52Eqk
         hrniA57T1n54Kh6j0IGdsWg54GjtL8wM2tghiZiq6aN1djLcZsWXde327cosqMu0RF0Q
         acQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6XLQXLTCPZLlU/ZumApQX9GHIFUJP7sEYNzkeJaT0kYbiwJrRpD024J87y/IcIeypg8rPNmaQDvHWNQ87YtF2jwyuJS2Q
X-Gm-Message-State: AOJu0Yx5L2/rqaNICYt1kkf5gMmWKf+zI6hLsdtGXtem1kTsV9Tbx55t
	M4vkBflvnEDgHuzXVqtBFG5vTD0EIcrVnNc2jPh2cFVQkleAo3Ebob9cHFEq3KWWc1vFp45bhmz
	wAUkJSQ==
X-Google-Smtp-Source: AGHT+IH/p8vYqqtkI0eqEXEB+ZTtw8zEYxbmnZm83/vN4YAz6CTxjnWVpC7h3xNoEeQ5CWenqhvrkw==
X-Received: by 2002:a17:907:2dac:b0:a6f:586b:6c2 with SMTP id a640c23a62f3a-a7dc510131cmr1056940766b.60.1722955432374;
        Tue, 06 Aug 2024 07:43:52 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d437f5sm549273966b.125.2024.08.06.07.43.52
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 07:43:52 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso1267722a12.1
        for <oe-lkp@lists.linux.dev>; Tue, 06 Aug 2024 07:43:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjvMOhBm3teheIypN3TjUTV8NGpW19GcInZoB1zvt2KlRAN5YlyKQUVLqpoAQPqz2UXz0R7Idkj6jM/BENnSG/hh7DBB1P
X-Received: by 2002:a05:6402:c08:b0:5b9:3846:8bab with SMTP id
 4fb4d7f45d1cf-5b938469427mr8541227a12.14.1722955431683; Tue, 06 Aug 2024
 07:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408041602.caa0372-oliver.sang@intel.com> <CAHk-=whbxLj0thXPzN9aW4CcX1D2_dntNu+x9-8uBakamBggLA@mail.gmail.com>
 <CAKbZUD3B03Zjex4STW8J_1VJhpsYb=1mnZL2-vSaW-CaZdzLiA@mail.gmail.com>
 <CALmYWFuXVCvAfrcDOCAR72z2_rmnm09QeVVqdhzqjF-fZ9ndUA@mail.gmail.com>
 <CAHk-=wgPHCJ0vZMfEP50VPjSVi-CzL0fhTGXgNLQn=Pp9W0DVA@mail.gmail.com>
 <CAHk-=wgdTWpCqTMgM9SJxG2=oYwhAueU_fDHMPifjpH5eHG8qw@mail.gmail.com>
 <87o766iehy.fsf@mail.lhotse> <CAHk-=whQwJaS=jVWVvvvf0R=45EGMb0itmhhSpa7_xWJXQY71Q@mail.gmail.com>
 <87bk25j1sx.fsf@mail.lhotse>
In-Reply-To: <87bk25j1sx.fsf@mail.lhotse>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 Aug 2024 07:43:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=whQ4x+ZgG7txteY70fvmHkuvRstMZj06XscmKfDL+RBCg@mail.gmail.com>
Message-ID: <CAHk-=whQ4x+ZgG7txteY70fvmHkuvRstMZj06XscmKfDL+RBCg@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jeff Xu <jeffxu@google.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Pedro Falcato <pedro.falcato@gmail.com>, 
	kernel test robot <oliver.sang@intel.com>, Jeff Xu <jeffxu@chromium.org>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Dave Hansen <dave.hansen@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Jorge Lucangeli Obes <jorgelo@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, =?UTF-8?Q?Stephen_R=C3=B6ttger?= <sroettger@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Amer Al Shanawany <amer.shanawany@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	linux-api@vger.kernel.org, linux-mm@kvack.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2024 at 05:03, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Or should I turn it into a series and post it?

I think post it as a single working patch rather than as a series that
breaks things and then fixes it.

And considering that you did all the testing and found the problems,
just take ownership of it and make it a "Suggested-by: Linus" or
something.

That's what my original patch was anyway: "something like this".

            Linus
