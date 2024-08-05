Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C8166F3B
	for <oe-lkp@lists.linux.dev>; Mon,  5 Aug 2024 19:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722887305; cv=none; b=edyu1Igub5onaxdSfrpEtYr7Z3raUOoMqvStzKYSSbDLQRNWp403oJX0YWegHXw7EZFi1+HDL0Lkzpqgumuiu99hxPl4azKPX2JbSDcSk6UJfFfR/rz5GUl/4xw61mFVHorQ7LgdoaeOvGH5Gq2f4g+nfBEK1Xjvi1KeY07v7kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722887305; c=relaxed/simple;
	bh=mgZkO49kXrbYPJTqfPbU/zGoDP6KaGhqgEz+BOKxzbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eaVIx5+VCPeVQ5b/SiY1ZTKdgh5n2zpdJJjYQ4nle5d/rZqLKoa2+BjNZXDvjdd2aWicaHCM82CZ7jjio5CTdSi18mPtzkX+HQEtnm+Uri27qgZk+UFegc1XplM3vj65uBi5tkPx/8ZGFfYuVX3ujKQcD5WGv8leR4u7nrn233o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UpPeTqLl; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UpPeTqLl"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a77ec5d3b0dso1232702766b.0
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 12:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722887301; x=1723492101; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wlI56xvrJ7x2cg4LdNK/30BBgdmdk2xf+663DeBt1mg=;
        b=UpPeTqLlYCTBydwgpJt2H3+zBVE4GdJv4L8wdYETTF4KrzcS4bOnCUhp1RxbnWyV4A
         KsvILoIpJM/yRZ+1Cutv0OEPetJGBnAIVAhjEiiNpAeGtSMOTWFNqZS/hePue1cXKQAF
         dYJuAnMvQwi0cpuccC+t/FPYthIvbzwBdnbJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722887301; x=1723492101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlI56xvrJ7x2cg4LdNK/30BBgdmdk2xf+663DeBt1mg=;
        b=Tgj6ZS6H6DjKICb6FugQMNQyhF4ZfSkULe+Slf33GiQS+tO7iHPJ6L9ZVtf6bB4lvv
         3Da5yzYD7wcVEhqId4CqOjMqx0IT1mLjf7yVlQlaBwkTIN1A5g2yGOz7Wu++j+U3VNbN
         aNZTntSfjmeTyH5KBJwOMGOgVtSBeeZRobbPeanRURSGcYLuVHGmqme8Y1Q0vEqJTvyJ
         QUsRnXl/UYXlet7ywc6ofOi2viai67O9g8RNHWJMKBgjExihQiEwcg1ytGckshKBUhDP
         UziY+aaAnIKA6Iu0UeaowkUmLwA8dGkFzQS3h1X8/b4/PtwhYTo/nCGlOpgv1ldeQ5EM
         edHA==
X-Forwarded-Encrypted: i=1; AJvYcCXEs7OwlIuCPsIh8jRD3JwwXD8S/l9ww+qmK9alvhi/u9KDere+FE8tdFXNLQaBI+Ml9dMo26+Lj/uPwBT3dyUYd959srLA
X-Gm-Message-State: AOJu0Ywpy9IzmePNRvQocjmbNUZbwJmBPGoS7RBs66bngOfnEmBLbAqO
	+C/T4ll2FdMAuN7QFx1CMKpF0ToP6pE6NQ15zp5WzCWNSHIniQNep1Gmf86CUaXddZIiXey/T4O
	pHCSCPw==
X-Google-Smtp-Source: AGHT+IE7Qq0jY5q5/Y3lvwFU8FFvPrQ6YObWZR75VHbGtxmHKB7/egmeG/yHrkd4u0hhoeNidaPkgQ==
X-Received: by 2002:a17:907:3208:b0:a7a:c083:8578 with SMTP id a640c23a62f3a-a7dc50989e2mr788034666b.52.1722887301468;
        Mon, 05 Aug 2024 12:48:21 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e85286sm491620566b.171.2024.08.05.12.48.20
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 12:48:20 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so14880818a12.3
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 12:48:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwXkUTANT41sw3wq1T2scmmxzmzG8WijR99LejWfLiE0jzvyXPd8e/qvn0w5AXFe0clw70J14ILiaM54FRCFE7rzi3AyYC
X-Received: by 2002:a17:907:3f8b:b0:a7a:9954:1fc1 with SMTP id
 a640c23a62f3a-a7dc4ea981cmr878526366b.24.1722887300410; Mon, 05 Aug 2024
 12:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408041602.caa0372-oliver.sang@intel.com> <CAHk-=whbxLj0thXPzN9aW4CcX1D2_dntNu+x9-8uBakamBggLA@mail.gmail.com>
 <CAKbZUD3B03Zjex4STW8J_1VJhpsYb=1mnZL2-vSaW-CaZdzLiA@mail.gmail.com>
 <CALmYWFuXVCvAfrcDOCAR72z2_rmnm09QeVVqdhzqjF-fZ9ndUA@mail.gmail.com>
 <CAHk-=wgPHCJ0vZMfEP50VPjSVi-CzL0fhTGXgNLQn=Pp9W0DVA@mail.gmail.com> <CALmYWFuCvphvLQOuQHBbFq0G8Ekyze=q45Tt4dATOt-GhO2RGg@mail.gmail.com>
In-Reply-To: <CALmYWFuCvphvLQOuQHBbFq0G8Ekyze=q45Tt4dATOt-GhO2RGg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 Aug 2024 12:48:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgySgXXkZtx49Xq70X2CmSizM8siacYKncMmFWRzKjs5Q@mail.gmail.com>
Message-ID: <CAHk-=wgySgXXkZtx49Xq70X2CmSizM8siacYKncMmFWRzKjs5Q@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: Jeff Xu <jeffxu@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
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

On Mon, 5 Aug 2024 at 12:38, Jeff Xu <jeffxu@google.com> wrote:
>
> I'm curious, why does ppc need to unmap vdso ? ( other archs don't
> have unmap logic.)

I have no idea. There are comments about 'perf' getting confused about
mmap counts when 'context.vdso' isn't set up.

But x86 has the same context.vdso logic, and does *not* set the
pointer before installing the vma, for example. Also does not zero it
out on munmap(), although it does have the mremap logic.

For all I know it may all be entirely unnecessary, and could be
removed entirely.

          Linus
