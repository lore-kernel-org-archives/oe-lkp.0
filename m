Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20761191
	for <oe-lkp@lists.linux.dev>; Tue, 16 Jul 2024 00:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721089427; cv=none; b=GPbSv9Q0vD2KCcIkI38KuQH8nAaRICj8aENqV7TFqfcuT6tD0BObE7hIlvggbDZsKY/1mFjbg+mi2iGKaiK1Rwlj+o532+QMUqE27tKxkWDX52aZfLFfBt9A/6qPBtqIkOv75hbRGQZ3pTuUGdxWCzsFIAuaiB6XZ3d79uNinws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721089427; c=relaxed/simple;
	bh=w+9uP3NYMGiGGm8C01qAIjXCvPwsduD/KyZg9fbAvdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCKETjSbxKoYuVFb3zEk5vWIZR0reKxdztmqCH1UwWwlxh2Wz2+xkZ2Pw+wIQP3N9u88wbQbD+UBKVz9wdy1MSzGKvSX2anAVTSQyMvpRmOxwI/oOxVgUFI9kmntRGY1FKM2CwjZWCWCrcqNZCmW9RJiIrj6ilSvD3n/fj4wYog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iu/vLgWC; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iu/vLgWC"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-44a8b140a1bso145191cf.0
        for <oe-lkp@lists.linux.dev>; Mon, 15 Jul 2024 17:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721089425; x=1721694225; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atOyFauWlMezUFieUVAk0q6tNEF19uog8150eFOHK5o=;
        b=Iu/vLgWCaB2lYw8BRJ6jpOM5Xqtocg9Mv07CMYpgZxppJFViaNkYy+UfnzKSZtYLzn
         gDieNUfZij9YJJgtosI3FIBpceiB3TcL9MlFuCjqY9KMIJgRQMtXAfI+xYEn4k31HnBD
         zQbS/78Y1iHXkpiLqeFbOsrth07rmLB6QR/w46OAdus9rVHnZZsAe+n9zreqhOS2HUzm
         pd+V9xT8CTCIk/GbHabRS8rZ4r/G9JKRnYJtbkppYzUIyZuHHr+E3vhyMhFU5KUk6jy3
         mgBMod9KoW6JjoGf7Mp/0waqKesjmK6qfL4NddI7rDzbbYfS4Ecs/T0K47L3HmO6Za4O
         EFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721089425; x=1721694225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atOyFauWlMezUFieUVAk0q6tNEF19uog8150eFOHK5o=;
        b=hYR5fWaNcaJ68lqS5QS1+RqVbgzPfsHyFMe/u5f04M+HXqQPM9vgpCcVNwz0uweB3g
         kT6fzgzQvR6LCRSEn9lRD88Ks2gipjtfwRyFuy3kHyDq2Ag58Juadrvl+VsI6w94ATW/
         aMEDv3QhABi6Wh7WjG1+1GcN5tLje6rp0IU6gnKPw+Q5lKATt/fjmO+I6aovUBq8QIxv
         pABIj1P6ASK6Oa+fz3+qBc4+yt/t+9Npm6Bet24QbXO7aDZCmb8q4gt4ZpAI58BwXNp0
         mjxLZVg+EilakRWoDoLeZsnSL7n5xD+Xa+Vo2RkL8g8zuQ3QmACNsManF3A8+uXZtpgv
         0YbA==
X-Gm-Message-State: AOJu0YxhI8P0OJfoj74T8Sfqs/exS3Qa5Ha2NO/PZ5gZFwINwrzvM+Is
	VH85s6xCfrz+xTPiS+SJQYhnfTK03OZ99BXvPey8/txkNoyTvfzGCGXEOwnT/PYwK3zMZNh2Z6k
	umuiPPkMn5uRKz326swmewtF+df00kPJtemjX
X-Google-Smtp-Source: AGHT+IE/kw/J8yKZw6NIetUbx7QF0zylSsoXWZkbL5jj7VHdECRTorHmo1jZJ3C3EkNfgS8fl+Q/Qni/Y4/oltYoqD8=
X-Received: by 2002:a05:622a:40cc:b0:447:e6c6:bd3 with SMTP id
 d75a77b69052e-44f7b93f886mr738431cf.21.1721089424804; Mon, 15 Jul 2024
 17:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240525013021.436430-2-irogers@google.com> <202405311548.1e881dea-oliver.sang@intel.com>
 <CAP-5=fX7ZyT82=W8uSZbT7c76E5+1JaoR5-y_gcj7A_=Js1YfA@mail.gmail.com>
 <Zl3Q7AtOWY8ZCcg8@xsang-OptiPlex-9020> <CAP-5=fU=UPpZTULuyZm=Ep0Ri6SdTciL5kqpciUfnWyDvz6HZg@mail.gmail.com>
 <CAP-5=fV5Qdu5iH_DKeAXQfEmQN9SmxCViSgbOCvAmN529WoeOw@mail.gmail.com> <ZmphzTKiDDYkPPP+@xsang-OptiPlex-9020>
In-Reply-To: <ZmphzTKiDDYkPPP+@xsang-OptiPlex-9020>
From: Ian Rogers <irogers@google.com>
Date: Mon, 15 Jul 2024 17:23:32 -0700
Message-ID: <CAP-5=fUUnnL18x_mdQdaCePOSbk5VWP3jfAS44n7qahD7pja5Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] perf jevents: Autogenerate empty-pmu-events.c
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weilin Wang <weilin.wang@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Jing Zhang <renyu.zj@linux.alibaba.com>, John Garry <john.g.garry@oracle.com>, 
	Sandipan Das <sandipan.das@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 8:07=E2=80=AFPM Oliver Sang <oliver.sang@intel.com>=
 wrote:
> > > > but make still failed. I still saw below in our build log
> > > >
> > > > --- pmu-events/empty-pmu-events.c       2024-06-03 08:41:16.0000000=
00 +0000
> > > > +++ pmu-events/test-empty-pmu-events.c  2024-06-03 13:47:19.5224634=
82 +0000
> > > > @@ -136,7 +136,7 @@
> > > >  { 2623 }, /* M3\000\0001 / M3\000\000\000\000\000\000\000\00000 */
> > > >  { 2078 }, /* cache_miss_cycles\000group1\000dcache_miss_cpi + icac=
he_miss_cycles\000\000\000\000\000\000\000\00000 */
> > > >  { 1947 }, /* dcache_miss_cpi\000\000l1d\\-loads\\-misses / inst_re=
tired.any\000\000\000\000\000\000\000\00000 */
> > > > -{ 2011 }, /* icache_miss_cycles\000\000l1i\\-loads\\-misses / inst=
_retiredany\000\000\000\000\000\000\000\00000 */
> > > > +{ 2011 }, /* icache_miss_cycles\000\000l1i\\-loads\\-misses / inst=
_retired.any\000\000\000\000\000\000\000\00000 */

Hi Oliver,

I tried to reproduce the problem by installing more locales on my
machine, setting the environment variables, checking my environment
variables, etc. I couldn't reproduce it. Looking more closely at the
diff above and the other diffs in your email something strange appears
to be happening around dots.

From:
 --- pmu-events/empty-pmu-events.c
we know the minus lines are those from the files in this patch series.
From:
+++ pmu-events/test-empty-pmu-events.c
we know the plus lines are those generated by jevents.py.

In the diff output above the "inst_retired.any" doesn't match
"inst_retiredany" (no dot before the word "any"). The repository file
pmu-events/empty-pmu-events.c is missing the dot in the event name but
jevents.py is generating it, hence the diff. But looking at
pmu-events/empty-pmu-events.c in:
https://lore.kernel.org/lkml/20240525013021.436430-2-irogers@google.com/
The dot is present.

I think what is happening is that when you apply the patches for some
reason the dots are being consumed in
tools/perf/pmu-events/empty-pmu-events.c, the build then informs you
of this by failing. The locales idea was a red herring and this has
something to do with how you apply patches.

Does this make sense? Perhaps you can try testing the patches in an
ordinary client applying the patches using something like "b4 am
20240525013021.436430-1-irogers@google.com". At the moment I think the
patch series is good and I don't have a way to fix what I think the
problem is, with how you applied the patches.

Thanks,
Ian
