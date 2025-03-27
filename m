Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F80F20B80C
	for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743066721; cv=none; b=Bg9Xz/Z7xVzpXctC/x2LdWpjjvw6MJRKaEoWkK42qrZqC/jXbD4TIuKGf1jEOFris4AC41BwtX2dJUO8ASLV8YlVMvFOPPljNtmA877H0C1ohY/7rOWpo9QYMoC22KP/14cpR0aQrD+gGZ1t6WQ+X2owm2N4u6A5m2V0IdNKyqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743066721; c=relaxed/simple;
	bh=97fP1qZfJrEtmKbwyo4ydQSZwvCzpq2F7825aCxbZtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpFE1z1x1rMz2UyP7LPEEWJ8G+e57dIHv8xbgRqngNx7VYeavqSvIXhnvd4JkKJi4RvZzLRMEmH+7H6ynDiXt2zoma9cJTP5J7crzRAz9pRXSX+Z1YNPLL/WcAtj6ldKRjwu7iP3Umbb6xpOsAMGQA751LWganAuoSeaRaF4iqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i8g27Xwt; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i8g27Xwt"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-477282401b3so8322061cf.1
        for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743066719; x=1743671519; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+b6l40FNhgRVfbAF6laWpTMxO9IIW1hJJ+UtCtzYu04=;
        b=i8g27XwtLgyTooi0PjciR1sVRrPqLM6MWsuV5482qR2YMzrWZ6MeHgtjGBME5WS9nT
         lagmZ1CHNbo2hkY5yTTsZw7PCYOqk976i0X8w7uQNGk58dGNvNuMuXVeNv3j2l5W/7cH
         ErGX8F3Ahqfqi8jCIi7htPDk4/ygh0YO2HMNt/LvvUyJGmfEg0BscR/HsJ5io6OyPARb
         RCxSy9TVPUHXOsddWF/lIYgfWvc3WK2RYhoRVRwR2Oqjni5Ru87nxC3OrMKXbOE0tlLJ
         j9/gfET8bmee4a/MOCQ+lgjzEN+Zf+fsGJ0GssBhlCzxHgNyngbBuAI71jVTQXjDX2kP
         ri0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743066719; x=1743671519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b6l40FNhgRVfbAF6laWpTMxO9IIW1hJJ+UtCtzYu04=;
        b=Xwvpy02DJcwo/bDEcyHZgsO6NBNnSMa7JhwS88cdafqnYU+MvAvy1/iazOQ6Jcu77M
         ulaoXVaR4n5WW3GClMH7menYmKHnFEd5+TdjEdVkmnvOOqqzWwaJXMIhYSJZYdSBZitg
         yIwFT9ODw9NrIcBv7yFjeNXNLejTLqGnRMKN6hfh61sxSoP5PUciJGf/SWMI2ahpdBHi
         HUbN2wfCXheoQWrY5V9pzbkLQAWfDbdZJcDmJkjgHgYoG8C5Ln7pt/gBuRYR7fLiq+E9
         kmlKPZheOY+6gKtGvUFn4+U+EEHi7PetsTQ1L5ynzBbwFaW07DBQAVXwMfUg5iHwNyrh
         6ZBg==
X-Forwarded-Encrypted: i=1; AJvYcCW0DzV7tYRT9l5aNM8HErsIZga/UHOP06UDtTmgXlh/bsIvR1JHySnol3VkT30qa1jmM19IedA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq9J2u+Q/ca5ApOCsCRQ6XSWreorC4chmKdAq9tiSDVGxTJRa+
	Wqgud4qaAYNT/zZadSKGpBYRdJYnhi9hCdYHFfoCj/i/S7+IU2IE9Xvt75RDfUQOZIxuAe15b+5
	jhuYad5EaiOnp7NvlbxYCgJn4YeJSkDGcWDZT
X-Gm-Gg: ASbGncsN0z1whqLXscGafl79N4gDy0Hcv7DIFWV/EFLbivGK77LnwlumJtqpOIM+wjx
	Io+R8hVQHRt+f5frguW4pCUl1lPWvQ7YWTiBAsDdS5z6WtnEo2wMYwSENhL/+JQ5USi/m4Nkk1S
	6U4LQOwLr2HPMadFpbeQmsLDlztnQ=
X-Google-Smtp-Source: AGHT+IGq3aLRbE61liibJ18xlXemuiMGmGhTJiZQWBje+7JPnjbbgDMma2RLDDWKs8QX50o9E11tAljMqxUcNwkTpE8=
X-Received: by 2002:ac8:6906:0:b0:476:8a27:6b01 with SMTP id
 d75a77b69052e-4776e20ba52mr37064611cf.47.1743066718528; Thu, 27 Mar 2025
 02:11:58 -0700 (PDT)
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
In-Reply-To: <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Mar 2025 10:11:47 +0100
X-Gm-Features: AQ5f1JrvFSfU0cznx95FVC7fEJsPk5YA71f3DBhzv0nVjY72RKACuxNOLZvssF4
Message-ID: <CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 9:26=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:

> We could place all these atomic fields in separate cache lines,
> to keep read-only fields shared as much as possible.
>

Following one-liner seems good enough to separate the 4 atomics used
to control/limit

UCOUNT_RLIMIT_NPROC, UCOUNT_RLIMIT_MSGQUEUE, UCOUNT_RLIMIT_SIGPENDING,
UCOUNT_RLIMIT_MEMLOCK,


diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.=
h
index 7183e5aca282..6cc3fbec3632 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -120,7 +120,7 @@ struct ucounts {
        kuid_t uid;
        atomic_t count;
        atomic_long_t ucount[UCOUNT_COUNTS];
-       atomic_long_t rlimit[UCOUNT_RLIMIT_COUNTS];
+       atomic_long_t ____cacheline_aligned_in_smp rlimit[UCOUNT_RLIMIT_COU=
NTS];
 };

 extern struct user_namespace init_user_ns;
