Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA436995A
	for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 19:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706642364; cv=none; b=AAM0wSVRjv0vvfbNgcIVBoIqfDfCmc2dA/60KScdMHUGn3ycU6i2XgkPhNzUkkEHpz2RzakVOoXhHqcW61fdk+ThJjE4qb71MiQmGejjU8Uik5fxohrBD5SC5G4QIU4ViuuPqqGf5TXrSlW96kIPA5esw8rxQjSmoQ3tIwkSQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706642364; c=relaxed/simple;
	bh=wzJcKIgs/uFgPoU/NkNhAK25xpfIJjwjPT1K5sVmsTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7kIF9DmBMBhzMQ7vZaJJaffirNpr7vNxvfx2LQa2JUPSwY80+JYc2yejHjWqjF3WdhM7otn5+zXaN8EVS7StwJ7FKZAtCgslZ66vObDI9BpHlF8t8HNbXvcxzgyTk6KIVyrdOG0LSe0sBxTLj/DBIXfcKKPu1INj83smT+bj6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UWWfd1ZN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UWWfd1ZN"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51032e62171so4709069e87.3
        for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 11:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706642361; x=1707247161; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G5HDN8hMhvJPlLwbvxkEblRc74lfQs68/VLCsSFwK6k=;
        b=UWWfd1ZNWiRecC8wDg6yKVXOuFbMWapLQ01LSPgTxOt2HVhqdyng/UoYPol4h+pAhQ
         hLNZBHhid5XDpF0MButdqQqtIx+gJFGMCCWQMCtq32uZLxtWF09j+v7YKXEh4JpS7tGI
         yQ5k7FZM8paY2y4tsp0tW//XV2PAcInqqmNGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706642361; x=1707247161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5HDN8hMhvJPlLwbvxkEblRc74lfQs68/VLCsSFwK6k=;
        b=hYPwB55ExyqU58tXrJBoVqml9gMCnRyZO/WnzgQfEgJSjCNncqMOZ141nX89ojfEEp
         MydV6NDmC9zKCePjEvn77jTKZOn57nyUGrPPcqZtffkVv5R84qhIRT4pp1dxzmpELRZF
         CRFDH8zcx9WvHSzpE7dJBDSrXCjVz20VXS9xbM0wMH94zzu4E1X4OqQ9OsTVZUKC6chz
         cVCnrFbLLJq27TiEQSqBx+a+njfo5qLMDXw7H2sCGJ/8ZdrCWD5nqIofOoEQkh1TOvXY
         i7hNEIBrfDV4BmWyboYWOY2UAaurrS1212oKfVfmLS28QgRRTh3OvCiRHNP7p8bLgazn
         UKNw==
X-Gm-Message-State: AOJu0YyNd/CLDwzXG/9RoPypRUzZHrL2Mbu+74EtwxDvammuuXjPCU0M
	ff2Mc5Zhdtlsk+Fyj8w9It4xONJGWWhdPVUmVhQipKVbSDtu6i5OXlsndsnlaGvpAxVarVRXMQk
	cxQ2SKQ==
X-Google-Smtp-Source: AGHT+IHLUGQRngnAKfJ7twV+bxnaFNpJEQJbCGRNBHr4eWGgPtQtHxm2H53FPk0qZfZu7mRKF4an1Q==
X-Received: by 2002:a05:6512:114f:b0:510:14cd:1d16 with SMTP id m15-20020a056512114f00b0051014cd1d16mr7151289lfg.63.1706642360757;
        Tue, 30 Jan 2024 11:19:20 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id b12-20020ac25e8c000000b0051016cdb79bsm1546848lfq.264.2024.01.30.11.19.19
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 11:19:19 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d061f1e2feso4745801fa.1
        for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 11:19:19 -0800 (PST)
X-Received: by 2002:a05:651c:19a4:b0:2d0:4f51:531 with SMTP id
 bx36-20020a05651c19a400b002d04f510531mr4399720ljb.45.1706642358738; Tue, 30
 Jan 2024 11:19:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=wh0M=e8R=ZXxa4vesLTtvGmYWJ-w1VmXxW5Mva=Nimk4Q@mail.gmail.com>
 <20240129120125.605e97af@gandalf.local.home> <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
 <CAHk-=whb91PWEaEJpRGsuWaQpYZGj98ji8HC2vvHD4xb_TqhJw@mail.gmail.com>
 <CAHk-=wgp7UkG31=cCcbSdhMv6-vBJ=orktUOUdiLzw4tQ4gDLg@mail.gmail.com>
 <20240129152600.7587d1aa@gandalf.local.home> <CAHk-=wghobf5qCqNUsafkQzNAZBJiS0=7CRjNXNChpoAvTbvUw@mail.gmail.com>
 <20240129172200.1725f01b@gandalf.local.home> <CAHk-=wjV6+U1FQ8wzQ5ASmqGgby+GZ6wpdh0NrJgA43mc+TEwA@mail.gmail.com>
 <CAHk-=wgOxTeTi02C=kOXsHzuD6XCrV0L1zk1XP9t+a4Wx--xvA@mail.gmail.com>
 <20240129174950.5a17a86c@gandalf.local.home> <CAHk-=wjbzw3=nwR5zGH9jqXgB8jj03wxWfdFDn=oAVCoymQQJg@mail.gmail.com>
 <20240129193549.265f32c8@gandalf.local.home> <CAHk-=whRxcmjvGNBKi9_x59cAedh8SO8wsNDNrEQbAQfM5A8CQ@mail.gmail.com>
 <CAHk-=wh97AkwaOkXoBgf0z8EP88ePffLnTcmmQXcY+AhFaFrnA@mail.gmail.com> <20240130132319.022817e8@gandalf.local.home>
In-Reply-To: <20240130132319.022817e8@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 30 Jan 2024 11:19:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiGb2aDbtq2+mYv6C=pYRKmo_iOu9feL9o52iRT8cuh6Q@mail.gmail.com>
Message-ID: <CAHk-=wiGb2aDbtq2+mYv6C=pYRKmo_iOu9feL9o52iRT8cuh6Q@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jan 2024 at 10:23, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> I know you don't send patches inlined anymore, which is a shame, because
> patchwork takes care of all the administering when patches are inlined, and
> I don't miss patches like I use to.

I just sent the whole series as individual patches., and doing a

  b4 am 20240130190355.11486-1-torvalds@linux-foundation.org

should get them all (or if you use patchwork, do that)

I don't normally do these inlined patches any more, because honestly,
99% of all patches I do end up being "I can't test this very well, I
think you should do something like this".

In fact, for simple ones where I might not have even compile-tested
them, much less booted into a kernel with them, I will actively
whitespace-corrupt the patch, just to make sure they aren't applied as
any kind of real workflow - they are almost always meant as a "I think
you should do this, and take credit for it all".

And so when I'm working on a series like this, I'll send attachments
just because it's easier, and because I don't want to patch-bomb
people with some kind of crazy work-in-progress thing.

But I'm reasonably comfortable with this series now, so I sent it as a
"real" patch series. I like it partly because it just removes a lot of
lines:

 3 files changed, 160 insertions(+), 433 deletions(-)

but mostly because the lines it removes are what I consider actively
broken code. So it's not just getting rid of LOC, it's getting rid of
complexity (and bugs) IMHO.

That said, I also don't think that patch series is any kind of
"final". I didn't fix up the readdir iterator locking, for example. I
don't think the SRCU parts are needed at all any more thanks to the
refcounting - the 'ei' is no longer protected by SRCU, it's protected
by virtue of us having the file open (and thus holding the dentry).

So please think of that series not as any kind of final word. More as
a "I strongly believe this is the direction eventfs should go".

I am perfectly ok with you munging those patches and taking full
credit for them, for example.

My "testing" has not involved any real tracing usage, and while I
*have* booted that thing, and have done some very basic smoke-testing
in /sys/kernel/tracing, 99% of the work was literally me just going
through the lookup code, removing everything I found objectionable,
and replacing it with what the VFS layer generally would want.

                      Linus
