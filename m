Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC0E1CF8F
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jul 2024 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719952989; cv=none; b=ka77m9XQsGwZvZQ1yEhUPNH6D30w5RqZkTRLkI3GnWwdAAbkZOTzvA5qsQNvU9g6mVyMjRr70J+ymINOxXscoANPe07yK0t9wcyjwqtAj/pwcBHc7e1F8YHtXLx/bDqZlzOGoF7GZo8N0VkfUlnMRI94GAFgjD4uYJ677onJCfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719952989; c=relaxed/simple;
	bh=6LNyVKKBMDAeeCTDCW+Q7xzEdYm5alFZdgDwqZcfDpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5pTC2/pgqTDFus5+dTSSmi8dwUOF10XkZ3YDbukEQOK72I6eyqUfQOF4qzT+ut7ZHtTE/7+QXszFgl11v87UPGkyCYDXjrhVmLOlj6usRNk9K4PD1zHniwKt2kySQoW2NWZc7zxJhWN/untIb/jblxRbEjc4dumWV2lM6JoZTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=E4gSHhdx; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="E4gSHhdx"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-584ee8da49aso3361827a12.0
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 13:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719952986; x=1720557786; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m06DGl+JsSnB+foAEKorv4GRJLNuZ2K+S42zJ3Ubdg0=;
        b=E4gSHhdxXsVvCFTMGuhcIewj+oLnWVfBWKL5uvXwNCBfJ7gL9jwZcere6+xzatrjzH
         zTBlxytJggGSq6lqIdNgyadZ55TY1p8E/KnHAV+UEgM9o96kBXIYjvd4ozVOpeE4WOxZ
         J6mDIAouSGPS3jl8jEBZJrc4oDthi41Yo7FPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719952986; x=1720557786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m06DGl+JsSnB+foAEKorv4GRJLNuZ2K+S42zJ3Ubdg0=;
        b=EWsjfp3xb7mSP4DtISGcrlsuVxNmtHdam/llcKJ22aozkh+V5LkLYXYmq6vW3T0CVb
         pw7kDMBumFvIrJALpL1k8xIZk4jeHxFdUSih/WyzRv7p3AmrTMLsweoB4vfBaiJKJUTG
         rRcaiNFzVcXP0WJ0byUwRIC+EnOC3toUoTYwFaGOsUQS/kS8XcT8MvhNIafylgAwAdG3
         Or140AAZwolxtyX9mmTlBmeHUEE00WhUh3axU6doupDTHO/JWCRrp+125fyNj0nKzqKD
         tgu9j0piIxayVLBQsgUc3Y09EFhBRvKr1Pj6BBY6EKbOe4AjgX+kCIEIb6+f6azVhp6h
         HnAg==
X-Forwarded-Encrypted: i=1; AJvYcCXRilhp2T2MvDsWYxoT1AHheMVGRPDo87tHX34pavBp6UYhJt3ez7Wln/3uVGxNgFnRCxTdiH1LYwryEkHmmVC5dp5ZA/NI
X-Gm-Message-State: AOJu0Ywv9TKsuHyvquw3uWejoquG2CzUPBsObUnTNk+57T2R1BLFttFX
	LaPsiORTnnbH2J5c77gcjmu33HE+1ZSWTkIPT29TfmYKiK/gnWk9/X4IRHCg9YLQ94jMqAP1+JY
	Dwgfo+Q==
X-Google-Smtp-Source: AGHT+IHKmN9hObMHo8Ej6L5famXKFddSXAvPzf1gNwelndqA6j7rwcSk3ykzT9/6BASSatqqdKINOA==
X-Received: by 2002:a05:6402:40ca:b0:57d:3df:ba2d with SMTP id 4fb4d7f45d1cf-5865b56aa56mr11780704a12.2.1719952986164;
        Tue, 02 Jul 2024 13:43:06 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324ed2dsm6121339a12.28.2024.07.02.13.43.05
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 13:43:05 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a751ed17b1eso507781166b.1
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 13:43:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXzXMXF2KFZh7K+ihkHyq8OePpkETySyMrY//u27SibGPRQQd9LH5OLUNgQT7VzPAHeYjdLDmfhR7AYSYBuuR06hgZQifd
X-Received: by 2002:a17:906:eb4c:b0:a6f:935b:8777 with SMTP id
 a640c23a62f3a-a72aefa5ab3mr919607766b.25.1719952985057; Tue, 02 Jul 2024
 13:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406270912.633e6c61-oliver.sang@intel.com> <lv7ykdnn2nrci3orajf7ev64afxqdw2d65bcpu2mfaqbkvv4ke@hzxat7utjnvx>
 <vgg45kxk2fiyznm44w2saz3qjiwrjp3spvpswsl4ovd2jl5c5g@54dlbd4kdlh4>
 <CAHk-=wgnDSS7yqNbQQ9R6Zt7gzg6SKs6myW1AfkvhApXKgUg4A@mail.gmail.com>
 <CAGudoHGuTP-nv=zwXdQs38OEqb=BD=i-vA-9xjZ0UOyvWuXP_w@mail.gmail.com>
 <CAHk-=wgVzKtRnvDXAzueJTbgfo1o12Lw6DH97PzRe1cGA_b1oA@mail.gmail.com>
 <CAGudoHH_z1a6MX8Z8Cqbz-jDTUoAjoxdV9KrQ6yvUkNszXO5aw@mail.gmail.com>
 <CAGudoHHg-T+ZOTm0fSpW0Hztfxn=fpfnksz5Q3=3YeCeEPo7LQ@mail.gmail.com>
 <CAHk-=wiBGSLNW6GGbnec-dCbn0kWvD+OXAa5VNXPBKLXYy5KOQ@mail.gmail.com> <3g3arsrwnyvv562v2rsfv2ms4ht4mk45vwdkvssxkrjhfjtpdz@umyx5tl2du7o>
In-Reply-To: <3g3arsrwnyvv562v2rsfv2ms4ht4mk45vwdkvssxkrjhfjtpdz@umyx5tl2du7o>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jul 2024 13:42:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg6e8QMaBOyFaGon7pik_C1COrkmEz37mtUqpBoq=R44w@mail.gmail.com>
Message-ID: <CAHk-=wg6e8QMaBOyFaGon7pik_C1COrkmEz37mtUqpBoq=R44w@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jul 2024 at 13:33, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> If you are politely by lkml standards suggesting I should probably drop
> the idea due to unforseen complexities

Oh, absolutely not. I'd love to see how nasty - or not nasty - the
patch would end up being. I think it would be very interesting.

I'm just explaining why _I_ never got around to it.

I do think that the 'stat()' family of syscalls are some of the most
critical system calls out there. And while I suspect the benchmarks
that stat the same file over and over in parallel are worthless, if we
can do 'stat()' without ever even dirtying the dentry at all, that
would be absolutely lovely.

           Linus
