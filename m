Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0C21BD9FC
	for <oe-lkp@lists.linux.dev>; Wed, 30 Oct 2024 22:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730326601; cv=none; b=IOHpoalP8JxvhTwilwdVF9vrjcW/1/3PhAGIFlFpWCaEDhqr1ckxzd6sFMPb5myriXR9xdaN5f7A9E9tfp7IiDyTLuP2YuM34bLpHiPksdQvMCqovrMhUATe+QJeIzp+i519Ao2b/B3CZDVCGkxiEPMBpOJIbglDHPqKuzwpgF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730326601; c=relaxed/simple;
	bh=x27zj7bkt6bMfPik2cS5129bupoGtGFiuz6JcA5jT8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4su3IFbJXsaAUm6dDmZAiOEZ86ktA9TjnFiAQykCbjaihhJlVKySioOFFix9jrPILbQBTzh55OvyDlCSMS3WMJjyURXnzcnEd+QcoC5wSeNUupYzERerEGNLdbnulM4JNuPLyGIEJXuR9J29pzcCT7X9GjtnrMTUDxc+klh8q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gpg3pDIP; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gpg3pDIP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so47622666b.0
        for <oe-lkp@lists.linux.dev>; Wed, 30 Oct 2024 15:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730326598; x=1730931398; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeckrXObfHi3msDV22fzQk52trXEUquKLE6RqY4+MfQ=;
        b=gpg3pDIPeYVUjRhbNfSTRIXp/ams4NLNxavOjlz/20KD7JWlO1FtlzIinjnIWmJcBp
         yrHzemVWLf4VoxtReN8oJ2ft9O1YqWOZGLxcA0wWpTAwIn0elAhlc3TRfqioDKw2ldaP
         DLgSaPJq5JYCiv7V59hhIs+QDkG6bhxEA3sCIaUSgB4YVbJ6eFDwO4U9QhAm41mtvle1
         67f7D7KCsYg2vD39hoWNbmnlw/7kq47mBOcn9nhZ/yWj8uAxkhKHJx7Jt2IH/rqRptBZ
         3je5LcGygeJggHPR7oT7WAT76tWd/AKE5Wd02EumUF0s/grcVAyEGAEX27ZN6Q+Ux+X2
         SbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730326598; x=1730931398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OeckrXObfHi3msDV22fzQk52trXEUquKLE6RqY4+MfQ=;
        b=NwcrDPKlou4AzBNptZxuxFUQwkaceV7HBuRQ2hfXLHB8hdNP9lf6+npAR9K5QzqLwq
         9QocGMIy8kd2ZDAgdSxbjrEKkj7UkxZOf/6sLwXVJ42AC2tEuCjFJ2CPAA5hPwP7y+aC
         52gXbVvNZqcoPNxJY3m5CLI3NXNmYBG4PzcrTuGNjkdFJtvZEQIW8pH7Nj1yyyJpJ4E+
         8SdF/oDulbEkZrZN7ScR3zJRkmGvgUkkUF94eZSJYdYa6HJ4axWGrFFCiZmSGpn2tI8Y
         e0OZ2CAtdCxnsgor6fBDDHSgbCQtFBAWh/BvJh4t+UO+aWcH5601H8IvXY1V3wXean10
         vvqA==
X-Forwarded-Encrypted: i=1; AJvYcCWgLu5JIZp/r/haOV4YWNprIKjSm0yGJDtOKSQW/hEkx8p1DltdYQnDR12YoS8yiAMRn2fF6NQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKOLfuEUlt7h9C5162UEuWdguF1HdajiPdDBG20cYnBK32Ez26
	vdS4vcyDJcZ0u3BsRY+br7jjhOFyf0uaE1Og9l2MGwrBpe41jSm42r7IGkLFZdzhZz+A+cdOP7E
	MEi1FeS7608knBPCN74Ps1JHDTdHqture7OI=
X-Google-Smtp-Source: AGHT+IFtcnR1pNj7nQdIP3C7pjjkEiP5CGzDG5SrKKy/creuaJ8I/O0AHx8friC7yOnBTk8H3TlxvOFAZUKlJnE8I/Y=
X-Received: by 2002:a17:907:3f04:b0:a99:f167:47c7 with SMTP id
 a640c23a62f3a-a9de632cbb1mr1746522466b.55.1730326597752; Wed, 30 Oct 2024
 15:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410301316.e51421de-lkp@intel.com> <877c9qynxo.ffs@tglx>
In-Reply-To: <877c9qynxo.ffs@tglx>
From: John Stultz <jstultz@google.com>
Date: Wed, 30 Oct 2024 15:16:26 -0700
Message-ID: <CANDhNCoUyqvFa=mqrXra2KQ4ryeTnj-HkO4y8cxtQJyYZWz-2Q@mail.gmail.com>
Subject: Re: [tip:timers/core] [timekeeping] 5aa6c43eca: BUG:KCSAN:data-race_in_timekeeping_debug_get_ns/timekeeping_update_from_shadow
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel test robot <oliver.sang@intel.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 1:50=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Wed, Oct 30 2024 at 13:47, kernel test robot wrote:
> > this is another report about BUG:KCSAN, the change does not introduce n=
ew KCSAN
> > issue, but causes stats changes as below.
> >
> > [   70.265411][    C1] BUG: KCSAN: data-race in timekeeping_debug_get_n=
s / timekeeping_update_from_shadow
> > [   70.265430][    C1]
> > [   70.265433][    C1] write to 0xffffffff8483fef8 of 296 bytes by inte=
rrupt on cpu 0:
> > [ 70.265440][ C1] timekeeping_update_from_shadow+0x8e/0x140
> > [ 70.265452][ C1] timekeeping_advance (kernel/time/timekeeping.c:2394)
> > [ 70.265462][ C1] update_wall_time (kernel/time/timekeeping.c:2403)
>
> timekeeping_update_from_shadow() holds the sequence count write.
>
> > [ 70.265642][ C1] timekeeping_debug_get_ns (kernel/time/timekeeping.c:4=
15 kernel/time/timekeeping.c:399 kernel/time/timekeeping.c:307)
> > [ 70.265653][ C1] ktime_get (kernel/time/timekeeping.c:431 (discriminat=
or 4) kernel/time/timekeeping.c:897 (discriminator 4))
> > [ 70.265660][ C1] tick_nohz_lowres_handler (kernel/time/tick-sched.c:22=
0 kernel/time/tick-sched.c:290 kernel/time/tick-sched.c:1486)
>
> ktime_get()
>
>         do {
>            seq =3D read_seqcount_begin(&tk_core.seq);
>            timekeeping_debug_get_ns();
>         } while (read_seqcount_retry(&tk_core.seq, seq));
>
> So this should be safe against concurreny. I assume the issue here is
> that timekeeping_debug_get_ns() has a nested
>
>         do {
>            seq =3D read_seqcount_begin(&tk_core.seq);
>            ....
>         } while (read_seqcount_retry(&tk_core.seq, seq));
>
> inside. Which is still correct, but confuses KCSAN. Marco?
>
> But that aside, since 135225a363ae timekeeping_cycles_to_ns() is fully
> overflow protected and unconditionally handles negative motion (before
> it was x86 only), the value of timekeeping_debug_get_ns() becomes
> questionable.
>
> I'm leaning towards removing it completely.
>
> John?

Yeah. I could be wrong, but I'm not sure of anyone beyond myself that
has really utilized the TIMEKEEPING_DEBUG logic (and I've not enabled
it myself in a few years). I don't think we've had any problem reports
from it either.

So no objection from me.

thanks
-john
