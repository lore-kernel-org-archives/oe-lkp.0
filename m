Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B11175BF
	for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081464; cv=none; b=CyiZblq1tA/YaCYuY1aly7spq3ZMvLz9BCgtrFhcZBdheGDnCp4hNNx5ameTH1zbthB0jnNvRW1ipkeTPtz2VTWJguwcLQUvI7VxDwiFMM8NAigTyHz2mFnq9v6gioZfmy9Ftjv6YxBxsbNRmAMlAfJklcK1/qagEvyK5JHduq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081464; c=relaxed/simple;
	bh=9DRpbO/laZRlrGDbB6eJj1DVHnezphlWfDR2GDoHqYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASqdrr2JR0FyqpezCVHS/Q1Bh13xtYuPbKvi45sLL62WI+zzNMK4XRBYg0y3e7hjfzzHpa4Sv9/8yM4avr8cW0zV4QTokCjmGfJqwXyq6UO16W4/GR29hjLdfW9Z+pp9tPfSTc15U6aA0Gl5kcAVd19hRkOy/EKax8th/3hRsns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XysiDeLJ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XysiDeLJ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476ac73c76fso11631031cf.0
        for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743081461; x=1743686261; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DRpbO/laZRlrGDbB6eJj1DVHnezphlWfDR2GDoHqYQ=;
        b=XysiDeLJmVrJc3bXfiyHVL+IDY4ET/Ibw9h2JTq2272zdaE3GpHb69Ur958eThhAt9
         D2YtgTUZ6P/x/qoAnocEbtUQDtw64251E4yWDBFFImlpRYqFuJZYs7LM+OG/yE0pHPOK
         pSOm/LHUm0U5e3y70/8kJ16rxT3paPV4ejDWVJkI7krVHv9DThAQ0+ynDM9+ClCqs90Y
         WJWGtro4WMVtPrAftco76aY9HC/goZq44oqA4Br5sQakdhL2jvJJ1dJsoQRTnJirKZ1M
         vMgje7FdAA7W1sZN9oidG6NXGUYRXgBV1pPH9yP8EeTqOifrjWGYo0czAbw1YNzayG5i
         B0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743081461; x=1743686261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DRpbO/laZRlrGDbB6eJj1DVHnezphlWfDR2GDoHqYQ=;
        b=H9ZBUWyspVtdSEq3O5amry4oE597biAVdNyZ/P+En+nN5tR/q1a/hiIu13w321LCzL
         dKyYzpHIVWgWZKTV5VtG8adKNwC8iMX9SwBbzKDbZuBm0Y8uD22fjqjnrNmLMcqRoxHp
         JtgDb6YI39e5dJQqej4TE7RjU3foSfMUEGYAWPVLU1akFdIknTk/BCJ96O+yvtonHrqZ
         c0ecvvInDqhAl3jQfyIXbXQvpcWFGFOXn5yWLUfQcUCjoZwmbmtHiWv+KOCxeNH8x5ZT
         NdQZgZm4nveVJx1gZ9K/JpeYJg2jPJr9vGjhWeBZte8yklMfdaVvru8iLUR4R1b6W7X3
         dnnA==
X-Forwarded-Encrypted: i=1; AJvYcCUK5QprEfY2fTsLfucrAxZDM+lmqwulVGBgF2bFsRobFEGITgp85EfL++crViKbhCRhjgX16xM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzHOu2zDlDGJAgORO6xy/gD7Dvie5RJJ2k7uMOMf1ZYhU4ux4H
	23rjHkQwHXNUma866MInZsLHB4gO9sCTucEzq7QfEK7lL09IV9O/asTlSOsmwZ0uszBUlDuhqKz
	c9F+VKYPtRoPvyiDuTAJA4vXK375u9+b9x/li
X-Gm-Gg: ASbGncsf3pav9HOTbkOJlc7vAYFRUIWPdUPeegPovuGUu6ptUbHEtDRFkqJFq0zBhBL
	nsjqehL2YHjfKjhYNAcpR1iZ/IgJi1tlCHDPYx2WzWe0MtrfASM5FMDd39L7tK0E2XDsvOk3DG1
	E8SbWCWclhKA1+IbVICUyr57mF2eE=
X-Google-Smtp-Source: AGHT+IEWBIKYVf0v48fp0zwlf/Iaha02NsHdBDRjn0S/B7uo/GW8mi5KZnJ1xg+0SS2zN6aJiXcCTXDt0md29z2NxSI=
X-Received: by 2002:a05:622a:1446:b0:477:6fdb:75d3 with SMTP id
 d75a77b69052e-4776fdb7666mr43014251cf.4.1743081460695; Thu, 27 Mar 2025
 06:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
 <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
 <877c4azyez.ffs@tglx> <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
 <CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com>
 <87v7ruycfz.ffs@tglx> <CANn89iJvxYsF0Y9jH+Oa2=akrydR8qbWAMbz_S6YZQMSe=2QWQ@mail.gmail.com>
 <87jz8ay5rh.ffs@tglx>
In-Reply-To: <87jz8ay5rh.ffs@tglx>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Mar 2025 14:17:28 +0100
X-Gm-Features: AQ5f1JoGmxVZSAGdTOg2wWSOeOkq_wZ9f2AcSbIhDi26H4jWYlCUDcAK11n7cN0
Message-ID: <CANn89i+r-k-2UNtnyWC6PaJmO_R6Wc6UROgeoir5BmgVV8wDqQ@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 2:14=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Thu, Mar 27 2025 at 12:37, Eric Dumazet wrote:
> > On Thu, Mar 27, 2025 at 11:50=E2=80=AFAM Thomas Gleixner <tglx@linutron=
ix.de> wrote:
> >> Cute. How much bloat does it cause?
> >
> > This would expand 'struct ucounts' by 192 bytes on x86, if the patch
> > was actually working :)
> >
> > Note sure if it is feasible without something more intrusive like
>
> I'm not sure about the actual benefit. The problem is that parallel
> invocations which access the same ucount still will run into contention
> of the cache line they are modifying.
>
> For the signal case, all invocations increment rlimit[SIGPENDING], so
> putting that into a different cache line does not buy a lot.
>
> False sharing is when you have a lot of hot path readers on some other
> member of the data structure, which happens to share the cache line with
> the modified member. But that's not really the case here.

We applications stressing all the counters at the same time (from
different threads)

You seem to focus on posix timers only :)
