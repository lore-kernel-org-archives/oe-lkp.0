Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04225212D9E
	for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075482; cv=none; b=r7tdER9ZfPa/W9nk2546n0Uxj/PMyTBZBrX8hq+4PH/jsFydmxE6S4pSHSIUgNk7uQRHlHOPxirlcY2+s2PtIpMqwV40VmbeXZcr3KeHPkK1Y4b8VIL1idv9xsyMkaO2vr/rF+Td+M+Q8c1Musjq5ZIesB7v93cJcX5u6+Uu1Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075482; c=relaxed/simple;
	bh=jJgFpwlIGzvdgTu5NIuLqljmZcu4Bj1hntEIypGP3WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6V7rCVP6AcsPI31g6xNSFkEP/bAGUO1MOJ6NVsLjAhiKpmcV2ngOUZNpZtmCs43e1fGuqN9/OkybRNfNU6R0CGhCh3sj583LYF6JtALVPgTZLwY3/VpwNc1dMsOYtC1opsIRYtkb1AyG0tI1jcb3Vngk7BFdOZ2aKKHv8z5iKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Am6vln2J; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Am6vln2J"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-477296dce76so7791301cf.3
        for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 04:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743075480; x=1743680280; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1q7MD5L4p1QWH6dvXV/jdGu9zU55RX2uZ00Mq2fH7Y=;
        b=Am6vln2JiZQE5xLDd6GocfMFp3ORGP9W68sylp0rzrOJyxn9kX/6rR/4OvuwAeg7xY
         8xwgIK+dhGYoswWOzjktoXSHdiip336p+ekQzLVk74bHPP9xftI6YMpy0Olo09SJbbE2
         TDjsavl9fsCQaE7QU9S0qey4U7Hb2gBqsg1t2H6rX6t7T2tNaW9Ky09LmfKs+P8+egm8
         U3bZgr5f9x1AIPtobmqdWFazL/r0sTaUT7T5ev7rzmCwSR0F+KnHn6S36k0ETqKqoNbA
         Tk/sFbqqKPTaUAm2xoVS2Zj8JzLi7b2MzH7OuyzszwlEAPSEOVl0eH819nsPHuKqz6c+
         kkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075480; x=1743680280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1q7MD5L4p1QWH6dvXV/jdGu9zU55RX2uZ00Mq2fH7Y=;
        b=E00Jex4NBac4ON9HyPvNVw226Qasg2s68iDEeWxu6DshGmHJznwTw/v/qyDd8LvCVj
         Tn3CbfUNtPCbFF3WLJQIS40zrmsfChc5PuL/aa9P/wTe5MBoRYxluVskMNWPEJEAZJU4
         4A4zpswn4CNSmO8Tqf+S9RViA2xCEjuKhtS9Fzk+qRAVXSFiGBIUsHgC9zlcfnWQd52w
         fJ1e2y7SFQCKert4tP22ZnvaNl1rFQZfBixzIgt1t3UIrFsWY7b6PD/cAuYIuAgETOvI
         0Mtf+oRDdXhBKX5BWkROJOksMOGW323gFRx6kVM2rgNnGD/pHmi9WVRYcNCdYKNSvQun
         3gtA==
X-Forwarded-Encrypted: i=1; AJvYcCXDAWIJuywU5TPHQ8UOeIMcXI9hVmfPU3okcJLCwbGTvxGTESK/sIPq1ewSBIhg+LSLWDmlUH8=@lists.linux.dev
X-Gm-Message-State: AOJu0YynPBY/5RNdYN+1ADTkRd6lK3Qfpx3G3Vgwl2NVUerEvMULQ8c4
	Pt7e1zqMgtjKdj1EC4qW79568i69ia9uh8VNskjwlkKd8HplvkjyYdhjZLN015VFg/KcMr0AKYs
	60IYuOPVkqqHMpqYL2neBZGCYwbQnWAsLWQ93
X-Gm-Gg: ASbGncsd6aO8efIbnSitdaRmeORI2SgSCFvHm/3ezv+1MkDjMZw4jl6OSg0ouCeHN7o
	QtCK9cKafbMd3qNC5PKnTpzwHgEB5/LOi5U0EloFq+YivD/bJQUdpoIg4olh/yoeXuD/ROL/8OJ
	j6uGxrmqzFatDUb+oNMOUoL2uWUCk=
X-Google-Smtp-Source: AGHT+IFMK1+BRWSCgAgLNRsQgWuq7hn+JjgvqMr67X53YHJ6vdJkGkcfutooQweF9AELFGacZ4T19Jmld+d58szJUpM=
X-Received: by 2002:a05:622a:a12:b0:476:9b40:c2cf with SMTP id
 d75a77b69052e-4776e21f0aemr64540851cf.50.1743075479560; Thu, 27 Mar 2025
 04:37:59 -0700 (PDT)
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
 <CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com> <87v7ruycfz.ffs@tglx>
In-Reply-To: <87v7ruycfz.ffs@tglx>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Mar 2025 12:37:48 +0100
X-Gm-Features: AQ5f1JpaXRqbndei8EK3d-QrLVd1cHoGleu01HKLXFr1d0BmULk0gBaqe9nHrLk
Message-ID: <CANn89iJvxYsF0Y9jH+Oa2=akrydR8qbWAMbz_S6YZQMSe=2QWQ@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 11:50=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>
> On Thu, Mar 27 2025 at 10:11, Eric Dumazet wrote:
> > On Thu, Mar 27, 2025 at 9:26=E2=80=AFAM Eric Dumazet <edumazet@google.c=
om> wrote:
> >
> >> We could place all these atomic fields in separate cache lines,
> >> to keep read-only fields shared as much as possible.
> >>
> >
> > Following one-liner seems good enough to separate the 4 atomics used
> > to control/limit
> >
> > UCOUNT_RLIMIT_NPROC, UCOUNT_RLIMIT_MSGQUEUE, UCOUNT_RLIMIT_SIGPENDING,
> > UCOUNT_RLIMIT_MEMLOCK,
> >
> >
> > diff --git a/include/linux/user_namespace.h b/include/linux/user_namesp=
ace.h
> > index 7183e5aca282..6cc3fbec3632 100644
> > --- a/include/linux/user_namespace.h
> > +++ b/include/linux/user_namespace.h
> > @@ -120,7 +120,7 @@ struct ucounts {
> >         kuid_t uid;
> >         atomic_t count;
> >         atomic_long_t ucount[UCOUNT_COUNTS];
> > -       atomic_long_t rlimit[UCOUNT_RLIMIT_COUNTS];
> > +       atomic_long_t ____cacheline_aligned_in_smp rlimit[UCOUNT_RLIMIT=
_COUNTS];
> >  };
>
> Cute. How much bloat does it cause?

This would expand 'struct ucounts' by 192 bytes on x86, if the patch
was actually working :)

Note sure if it is feasible without something more intrusive like

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.=
h
index 7183e5aca282..3513df720430 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -120,7 +120,10 @@ struct ucounts {
        kuid_t uid;
        atomic_t count;
        atomic_long_t ucount[UCOUNT_COUNTS];
-       atomic_long_t rlimit[UCOUNT_RLIMIT_COUNTS];
+
+       struct {
+               atomic_long_t ____cacheline_aligned_in_smp val;
+       } rlimit[UCOUNT_RLIMIT_COUNTS];
 };

 extern struct user_namespace init_user_ns;
@@ -136,7 +139,7 @@ void put_ucounts(struct ucounts *ucounts);

 static inline long get_rlimit_value(struct ucounts *ucounts, enum
rlimit_type type)
 {
-       return atomic_long_read(&ucounts->rlimit[type]);
+       return atomic_long_read(&ucounts->rlimit[type].val);
 }

 long inc_rlimit_ucounts(struct ucounts *ucounts, enum rlimit_type
type, long v);
diff --git a/kernel/ucount.c b/kernel/ucount.c
index 86c5f1c0bad9..0cd5498890f8 100644
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@ -266,7 +266,7 @@ long inc_rlimit_ucounts(struct ucounts *ucounts,
enum rlimit_type type, long v)
        long ret =3D 0;

        for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
-               long new =3D atomic_long_add_return(v, &iter->rlimit[type])=
;
+               long new =3D atomic_long_add_return(v, &iter->rlimit[type].=
val);
                if (new < 0 || new > max)
                        ret =3D LONG_MAX;
                else if (iter =3D=3D ucounts)
@@ -281,7 +281,7 @@ bool dec_rlimit_ucounts(struct ucounts *ucounts,
enum rlimit_type type, long v)
        struct ucounts *iter;
        long new =3D -1; /* Silence compiler warning */
        for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
-               long dec =3D atomic_long_sub_return(v, &iter->rlimit[type])=
;
+               long dec =3D atomic_long_sub_return(v, &iter->rlimit[type].=
val);
                WARN_ON_ONCE(dec < 0);
                if (iter =3D=3D ucounts)
                        new =3D dec;
@@ -294,7 +294,7 @@ static void do_dec_rlimit_put_ucounts(struct
ucounts *ucounts,
 {
        struct ucounts *iter, *next;
        for (iter =3D ucounts; iter !=3D last; iter =3D next) {
-               long dec =3D atomic_long_sub_return(1, &iter->rlimit[type])=
;
+               long dec =3D atomic_long_sub_return(1, &iter->rlimit[type].=
val);
                WARN_ON_ONCE(dec < 0);
                next =3D iter->ns->ucounts;
                if (dec =3D=3D 0)
@@ -316,7 +316,7 @@ long inc_rlimit_get_ucounts(struct ucounts
*ucounts, enum rlimit_type type,
        long dec, ret =3D 0;

        for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
-               long new =3D atomic_long_add_return(1, &iter->rlimit[type])=
;
+               long new =3D atomic_long_add_return(1, &iter->rlimit[type].=
val);
                if (new < 0 || new > max)
                        goto dec_unwind;
                if (iter =3D=3D ucounts)
@@ -334,7 +334,7 @@ long inc_rlimit_get_ucounts(struct ucounts
*ucounts, enum rlimit_type type,
        }
        return ret;
 dec_unwind:
-       dec =3D atomic_long_sub_return(1, &iter->rlimit[type]);
+       dec =3D atomic_long_sub_return(1, &iter->rlimit[type].val);
        WARN_ON_ONCE(dec < 0);
        do_dec_rlimit_put_ucounts(ucounts, iter, type);
        return 0;
