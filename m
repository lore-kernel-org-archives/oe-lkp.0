Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E5019754D
	for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719505944; cv=none; b=DdB6NpNwHOyrEYmBd35pKygSmxz7ni08RiV7C0JhSQExVqhTnL9kW0lepPZXMcqLiQ5mtHC5xjTxaa749EXj1HPeUIlYWv3vi0L8N1aHdkzMYCc6pX3dSN8LIducsctk7BDA04l85+3foYwdozMecykvKEjSPJUbssMKx0+0Cos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719505944; c=relaxed/simple;
	bh=prDkbAgooKAcK1vTJuLjMcPZfqon387HpjmxbgTD8eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tNKxUCoikuIUZbCorF9mKqhLFKRvjl7GmR7QRhivaa82sLTZWjvNxFVuib9DblFJnGpnixx3of1z15YOl+AjkGR64WEcJvK98XCkrJAMULG51432LSuSCmJg0t4y8BU65DfCTlZltdDqDvigvJgTOjPYmYUgp+uy17RdRttUzT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CeMV+2VX; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CeMV+2VX"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cd8897c73so7293014e87.2
        for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719505940; x=1720110740; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ycSebCrQAPdM5kjmLyRXlbDvO9GJ9QZljEbMZ/M6I8=;
        b=CeMV+2VXAh+HVoQKGQyKR2DpuKR/tiAYCd7cbbCg7LcCYKNUfnH9dqCJoXeKvxdnZ4
         yo04iDAsL5Rg/oayzwgV0vGhov2q8+sBIBOYc0vpxKlQ5QSu3ODacwYTjoSiWHZDayAv
         Btqmx6sbIMOLBdaIH8JEX2faFHMKieQSlkHbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719505940; x=1720110740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ycSebCrQAPdM5kjmLyRXlbDvO9GJ9QZljEbMZ/M6I8=;
        b=PC1OAO+zQXsP0Rf47ybEpp87tukoYe1VIv1EK4Zo+ewzHz8DHFeCTgMlBkeHrjqZUK
         +IdO27mEmzNJo1B4RXk+oHKE+bHNpOff/fUyzfK8UPlWIJ2rzPJ02UCUaLQfohxZnq4u
         TNgvAgWOCz3hZt7u1e5XOCVMEX8JwHBvncai3AlPSWm/Jg0kfTstIe92bxx7YEMtc0YP
         l1BQq6imZnj1NXFBqdSVd/P1MycYmXyg1f/4Hr5OSXdx2p87RTyJZWxAK/6EYozvy8n1
         jUgwPe2psycS1p0pOn3yYMda7lle6D9SEP/7sndmZRQ5L4ntf2QjnvYGNZ0nvWNsEHWM
         ziTA==
X-Forwarded-Encrypted: i=1; AJvYcCUjDLTfnlzKL853lsmo+FbhJdYHLcLLDl1QX+prPQHZiAEghEQJBDymtacAOoTRncC3EzsYzMN4J48H0fc6pc1/kiDvY0uo
X-Gm-Message-State: AOJu0Yyuew2xtMtmIphBRXZ5iE3Ap/Gi3L1rzviwiefwVXc1pXecHbTN
	aymS0ZYHVhk/GY5xh9ZxwxqDuXh3dqbrqr2Z4O3psaT8tDfsdFbd888zNLEAC31AFP7ZfamvKCI
	5iIgAfw==
X-Google-Smtp-Source: AGHT+IHKnOTqeZLiwXxUxWxwp1g4Sp9QkNC+TjEbWUf5f6PJj4g6YZSlrrXNdyNFFoUF3aZiXnh9Dg==
X-Received: by 2002:a05:6512:3a2:b0:52c:dc70:ebf8 with SMTP id 2adb3069b0e04-52ce1834fb5mr8144006e87.19.1719505939771;
        Thu, 27 Jun 2024 09:32:19 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e71327ef7sm253634e87.278.2024.06.27.09.32.18
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 09:32:18 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec1620a956so96838021fa.1
        for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 09:32:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVloce5/KbgVILPaUM1LvZC7P4CEjNjmxuGoAnV4wOH+Z4gLs8R+CXMPNcEEcc4S3hUpKoqYmhPBlQkYICXOMYUEvxHoXic
X-Received: by 2002:ac2:5639:0:b0:52c:deb3:e3cf with SMTP id
 2adb3069b0e04-52ce183504bmr8087314e87.24.1719505938254; Thu, 27 Jun 2024
 09:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406270912.633e6c61-oliver.sang@intel.com> <CAGudoHF7ys8bTCE0G6vLzEbo+_NyQXmAEEGPJ4hx1yoYmBsoUA@mail.gmail.com>
 <CAGudoHFrMkdo1CoVxJUiEvQ_DyW3hzaCz18GjvLi4ny=o-q9ZQ@mail.gmail.com>
In-Reply-To: <CAGudoHFrMkdo1CoVxJUiEvQ_DyW3hzaCz18GjvLi4ny=o-q9ZQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Jun 2024 09:32:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg7PXo_QbBo8gv27OpbMgAwLh9H46kJRxAmp0FL0QD7HA@mail.gmail.com>
Message-ID: <CAHk-=wg7PXo_QbBo8gv27OpbMgAwLh9H46kJRxAmp0FL0QD7HA@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jun 2024 at 00:00, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> I'm arranging access to a 128-way machine to prod, will report back
> after I can profile on it.

Note that the bigger problem is probably not the 128-way part, but the
"two socket" part.

From a quick look at the profile data, we have for self-cycles:

  shell1 subtest:
      +4.2   lockref_get_not_dead
      +4.5   lockref_put_return
     +16.8   native_queued_spin_lock_slowpath

  getdent subtest:
      +4.1   lockref_put_return
      +5.7   lockref_get_not_dead
     +68.0   native_queued_spin_lock_slowpath

which means that the spin lock got much more expensive, _despite_ the
"fast path" in lockref being more aggressive.

Which in turn implies that the problem may be at least partly simply
due to much more cacheline ping-pong. In particular, the lockref
routines may be "fast", but they hit that one cacheline over and over
again and have a thundering herd issue, while the queued spinlocks on
their own actually try to avoid that for multiple CPU's.

IOW, the queue in the queued spinlocks isn't primarily about fairness
(although that is a thing), it's about not having all CPU cores
accessing the same spinlock cacheline.

Note that a lot of the other numbers seem "incidental". For example,
for the getdents subtest we have a lot of the numbers going down by
~55%, but while that looks like a big change, it's actually just a
direct result of this:

     -56.5%  stress-ng.getdent.ops

iow, the benchmark fundamentally did 56% less work.

IOW, I think this may all be fundamental, and we just can't do the
"wait for spinlock" thing, because that whole loop with a cpu_relax()
is just deadly.

And we've seen those kinds of busy-loops be huge problems before. When
you have this kind of busy-loop:

    old.lock_count = READ_ONCE(lockref->lock_count);
    do {
        if (lockref_locked(old)) {
            cpu_relax();
            old.lock_count = READ_ONCE(lockref->lock_count);
            continue;
        }

the "cpu_relax()" is horrendously expensive, but not having it is not
really an option either, since it will just cause a tight core-only
loop.

I suspect removing the cpu_relax() would help performance, but I
suspect the main help would come from it effectively cutting down the
wait cycles to practically nothing.

               Linus
