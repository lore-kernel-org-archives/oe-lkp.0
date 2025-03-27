Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC382054E8
	for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063983; cv=none; b=eJoImzvdZCrkuUFcXd0tmoUuEkNnJknpCve1Hp1j64Osd63bSDnUYb8+4BaHl6a0SQUyYKIT9Ctu5kkCJfy+v69z3RxjHFF+naCMnBlT7Gc9MqANSH/ll+tFMUQUJ3doaoA22XCuMjc9feImqRfNSwCxEjOTzqsOXz3bTzu8lDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063983; c=relaxed/simple;
	bh=oYoU6rrUgf5SUZ0R7XLmkS8IgbsCFKVKcKoSfyYUCv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6iCABjnoZashX9oKebE6zvGYld43gd3m8bO4Fha3EBcsacVbpO4D60R1ac1E6HFTMPMD9IObmNxxyExVHZqjthRcY61COcOOqzyxd71YpsikBfHqokPjjkw71gR4D6Wy5IFHElndYq1F2HYxoHTT+NIci+VrSca1hZtMNk+U7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OBjgfheL; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OBjgfheL"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4769f3e19a9so5287961cf.0
        for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743063980; x=1743668780; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmalLC5Na4GTkMmPNIYaOK7rSnGDkHzJa5etUB00I2A=;
        b=OBjgfheLqGqWulvRYpsYyWWiiGNKRs9jgbq4t0ZDlDQ2QeTMrKvAzhv8FwNEZvCFM6
         9solP6Xn8idxUPfQ1IlQuUbY6Fu/pLE/YsXX/ZNrbbFCDfyimjUopuic/vuZET+doMbh
         3keui6/NvT1GWyzWtnMtv14OYQkMaduppZzUGH9YVPHrMnkEK7WRKwk3kmyelu1cfR7J
         wHiWGFXW6k+aruAkABRaDbcLTfTZP7gSCKBOqR5xZHLR+fAkfD6JqwRoO3jGxyRdjgll
         xQPi1lmiz2oCguNAxo3rba0Q4Ca6C0LDffIhdV/fACNhLHw7pmnQ+P2yHMdv96Mze+G1
         JKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743063980; x=1743668780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmalLC5Na4GTkMmPNIYaOK7rSnGDkHzJa5etUB00I2A=;
        b=A5uDnMsaHMQpRzl1gy/JreWJqdRd8uEgLK0vA7XQMJ+/VPk4F33P3FCDHKUmBsqr5B
         rNwMD0MbjPic/vwqRxU0sx16ZHMr1Obc+h3bvuC0AoHvh6fvUZkV/gGcIrCsYx1eWX1A
         VwvFjmdj5v/H4CdZeeHJsef046x/oUNOiahr09SmV//f+8wTzOHVS6kQ2Z9O2NAxcZMZ
         4VxeKdbjMRc0fIBhIrxwCahf0n6EfgbvmFz/sjPPedol1/RpinWx5+GzdQADcrDfrwk+
         J4ULsXn4EsPzWXJTjKb7iHEpmbb28N1iUQsOMsHOhrMZpU+BYxj2wlxdSHV653DsqfQk
         rJzA==
X-Forwarded-Encrypted: i=1; AJvYcCXyX/2XDaufTijHnSoCR7udmoPy/AKfwHLSzIXIcePmu/CUGc973r6gSsm18w6NEgSrm7q+DBg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr513gEYlo3uWEwePiQB3BoajsP3FZsINLTvqlj9BmSFMbskvt
	SkKhzYxx4gX7PW1S7ffc6HioTjXSeN9aQhTYA+iF1kayBbH8uFF/pMZ0tmxw3OtDPfMnhwP+sf6
	7agY710lvRBSyNh1vsrvK/7MJvYVu9Tk6WhdH
X-Gm-Gg: ASbGncviITcTUIaVxDKG7ReIixQl0INadUXrnBcIhOGXFdG+c0dyfe++fer47hGQx0L
	dBbvyfI1QIt6u8UFAmj1N/lkjQgf946Fe8g4bxvxV3gF/p5twTsXg5ZG6WZGgLNSLRNkiu27MfJ
	oXsoEyBOHpW3BqLdyPosoF8C50eEE=
X-Google-Smtp-Source: AGHT+IGl6mZ0a7+3v7Ggn/OxSS/fAlKeakvrk8pfOEeBh/kXVj+anvy9K06ATqhG+V8GQZVxV7pACMkSJajK+KBGarc=
X-Received: by 2002:ac8:4758:0:b0:477:7007:7055 with SMTP id
 d75a77b69052e-47770077176mr24126621cf.12.1743063980031; Thu, 27 Mar 2025
 01:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
 <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com> <877c4azyez.ffs@tglx>
In-Reply-To: <877c4azyez.ffs@tglx>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Mar 2025 09:26:09 +0100
X-Gm-Features: AQ5f1JqrJlEHraIvtxnqqzfUm-aKvXZVfgCjo84W0r3w8se_wp2vuP4inJWs2UI
Message-ID: <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 9:10=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Thu, Mar 27 2025 at 07:21, Eric Dumazet wrote:
> > On Wed, Mar 26, 2025 at 10:11=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.c=
om> wrote:
> >> On Wed, Mar 26, 2025 at 09:07:51AM +0100, Thomas Gleixner wrote:
> >> > Unfortunately I can't reproduce any of it. I checked the epoll test
> >> > source and it uses a posix timer, but that commit makes the hash les=
s
> >> > contended so there is zero explanation.
> >> >
> >>
> >> The short summary is:
> >> 1. your change is fine
> >
> > Let me rephrase this.
> >
> > Absolutely wonderful series, thanks a lot Thomas for doing it.
>
> Thank you!
>
> > Next bottlenecks are now these ones, but showing up in synthetic
> > benchmarks only.
>
> Right. I saw them too when working on this.
>
> >     33.36%  timer_storm      [kernel.kallsyms]           [k]
> > inc_rlimit_get_ucounts
> >
> >     32.85%  timer_storm      [kernel.kallsyms]           [k]
> > dec_rlimit_put_ucounts
>
> These two are not really posix-timer specific. They are also the
> standouts for any signal micro benchmark.
>
> I stared at the implementation a bit, but there is not much we can do
> about that I fear.

We could place all these atomic fields in separate cache lines,
to keep read-only fields shared as much as possible.

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.=
h
index 7183e5aca282..6ddf667022d9 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -118,7 +118,10 @@ struct ucounts {
        struct hlist_node node;
        struct user_namespace *ns;
        kuid_t uid;
-       atomic_t count;
+       atomic_t count ____cacheline_aligned_in_smp;
+       /* Note : should probably put all the following atomic_long_t
+        * in separate cache lines (one atomic_long_t per cache line).
+        */
        atomic_long_t ucount[UCOUNT_COUNTS];
        atomic_long_t rlimit[UCOUNT_RLIMIT_COUNTS];
 };
