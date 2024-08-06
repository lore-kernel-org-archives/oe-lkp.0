Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF101625
	for <oe-lkp@lists.linux.dev>; Tue,  6 Aug 2024 00:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722903236; cv=none; b=P7ctgvkhbJdU5ZNpq5ZlUuAQS7vOMWrFQ/oECkvWCOPuqTFminsuaHfQBM81z9V05LbOwvdpGd5wGUIjyrSatJ9uqBd6cB8PUGSlcMGf0fEBKTWskHz7GieH00G/vLPD+p/yy6AEacmOwJBChyk912rOGaqrkcauU1rCH/FFxUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722903236; c=relaxed/simple;
	bh=KhE7wem6k7+mMBHOIKFkuNlqunhQlQKQ2o5ffgZbY9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDSQ2Zn9mFCkFHWCq6LEkLebFudP3Btha8LnxhaEH0UdkWjIG35LN2mG8iOepw4RHmUE8oY5hIGIA3zQdzUpCswuzkq2SmlvgQ7PZE2WCgh46VqYKy3thy/qo4NLOG04tqnpIoTfWCZ0YbB0cUBJAHpV/9wXhdkreotp/ovJjPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=foo9xNVu; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="foo9xNVu"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f04b4abdcso114552e87.2
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 17:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722903233; x=1723508033; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s/w/R50dzf1u4Y5vhvcxV6m9BvUcW7XkQaFxdwQ7Gmk=;
        b=foo9xNVuUagSjKV+uXTMLx6XiMX+I85xVOxPxRxbMlscckI6pv2638OzElLmHiuv5b
         ZWXmNbbj2J1xJ03OZeKHAI0GXcLguahwlvbcAesMRgacB1tid0h0SWhg4ummzksZqia/
         bfNeiAx/Dm0inqa2aRRuKU71glVy923r/Hu2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722903233; x=1723508033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/w/R50dzf1u4Y5vhvcxV6m9BvUcW7XkQaFxdwQ7Gmk=;
        b=CbOrzImB4JwnU8zi8r8Rq/oKkcoAHJ+YT472GZxrqhtthtfoBk4FFuk1JxRjaWSeIY
         XcBCYURdzgU5NEU9WiC9SPTo4Gn54oHl40+P/ebrknvTs2NZ0Tha07oZ8R2FnlCEBlcM
         s3jkwdA5VMnnmcGURyTfdqpvw2ND6eoT5FqSF8/7IVzON1F2jE/x0tYFaQEG7yzrsUHC
         TPLeRiQqMhhAAsksSFJD7zXdOKDukhHJqJh9gYKJ2g4LK2U9bE8T8B4NnvRPVo8f0gpJ
         RmKlF2d9Mp+qTPUq5YJ30OY72jKi55OMIzgN31d9Ou7FhbVlNfGdR0UucPXn6HMjQqL/
         6Vow==
X-Forwarded-Encrypted: i=1; AJvYcCXawrfG1TqhE7QrmTtJFBNYRCgQvs2ag+Yj+uqIu8YMjgUbUJt5fYmQqzFKovtXblZH3HeZSUrdNc630yVtr/fkMJSXneBP
X-Gm-Message-State: AOJu0YzDDIS1SLk1DNxq7XiHvReTmfH5veBFSI2+luAWOCZdzAx61/FR
	zae2xQciUTioZwLpiS5zKRv1VC2UyXmllzjrMP/2tfoMzlp2KiJWlA91rq1G+7MD7CEa85VEMeM
	XMbDpzg==
X-Google-Smtp-Source: AGHT+IF8jZSlrlSOcc3zfWD7TPAO9FFkl8j3pL9ur23naZEMpxBPPwlCF1dMzMisjmPUgriArYASYw==
X-Received: by 2002:a05:6512:a96:b0:52c:e0db:5fc2 with SMTP id 2adb3069b0e04-530bb395eaemr9822329e87.38.1722903232750;
        Mon, 05 Aug 2024 17:13:52 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ec8dafsm500715066b.220.2024.08.05.17.13.50
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 17:13:51 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso56749a12.2
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 17:13:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVT4v7znZuuB8vpw4NN39IqP6zcP83pjSqHgDWVew4BySfYzrnifUwZJBO+OpC0kpffX+W85MtG7lDswz+N3PkLCyHDvyN8
X-Received: by 2002:aa7:cd69:0:b0:58c:804a:6ee2 with SMTP id
 4fb4d7f45d1cf-5b7f4294a1emr9353286a12.20.1722903230289; Mon, 05 Aug 2024
 17:13:50 -0700 (PDT)
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
 <CALmYWFuCvphvLQOuQHBbFq0G8Ekyze=q45Tt4dATOt-GhO2RGg@mail.gmail.com>
 <CAHk-=wgySgXXkZtx49Xq70X2CmSizM8siacYKncMmFWRzKjs5Q@mail.gmail.com> <D38D6LJZOIQK.2GV58PGVL5K85@gmail.com>
In-Reply-To: <D38D6LJZOIQK.2GV58PGVL5K85@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 Aug 2024 17:13:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeWqr+0Ktzbwqrw17aESe5dZm5Kt6nwqtKJX00VsDqWg@mail.gmail.com>
Message-ID: <CAHk-=wjeWqr+0Ktzbwqrw17aESe5dZm5Kt6nwqtKJX00VsDqWg@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Jeff Xu <jeffxu@google.com>, Michael Ellerman <mpe@ellerman.id.au>, 
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

On Mon, 5 Aug 2024 at 16:25, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Can userspace on other archs not unmap their vdsos?

I think they can, and nobody cares. The "context.vdso" value stays at
some stale value, and anybody who tries to use it will just fail.

So what makes powerpc special is not "you can unmap the vdso", but
"powerpc cares".

I just don't quite know _why_ powerpc cares.

Judging by the comments and a quick 'grep', the reason may be

    arch/powerpc/perf/callchain_32.c

which seems to have some vdso knowledge.

But x86 does something kind of like that at signal frame generation
time, and doesn't care.

I really think it's an issue of "if you screw with the vdso, you get
to keep both broken pieces".

           Linus
