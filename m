Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007D9156242
	for <oe-lkp@lists.linux.dev>; Fri, 31 May 2024 16:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173497; cv=none; b=m1Yq0bbb5LtJSAb29FJSFuGQh6GnDCKurLtDy3M3fKFv8+7Hbo5OlnqpQEHv7R/87AkQt/uWFK+ho42PpKEyylzxVz3jRM9D4k09o30eWC5kQV7OrgHr9pxCeW9GiKDE0ApXZfMOzy2P3P/PdEhn+TnoJMVe+1mM65sVk8d3kfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173497; c=relaxed/simple;
	bh=k6V/f1+BsCmlpZVVeAjfyvro0dNzpctVLuN3eNRB7DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIO/MkDsjB2ivg+pRLbE8IH3JgKF2ljYTg1C89A38sMepy12lXQlHQpc/N20TuZVtQU4VGYym8YpMf+BdMaKuUSEyinTLQRmBEip1FhFFPvB9sI+dwCWCIQbf7Jstmo8xMk3iPWHEFlJXl+xP0YoT+jYhzJTYUcK4TFiiH9LjQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wxw+WOFJ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wxw+WOFJ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-43e14f0bd75so91cf.1
        for <oe-lkp@lists.linux.dev>; Fri, 31 May 2024 09:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717173495; x=1717778295; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a/elQ/DVLq9OarBTd3P+ramDxjQmELz1kHVgXiQECk=;
        b=Wxw+WOFJhbL2dzc5MPuofDoQ700KNYQc0EYZpmJ4OEKPk1oCZNN5MbSPrniA/8a6E+
         oU0IRNSp4RFBc0F0YymBs+z99g6I/1Qd7C1klzNGLWoApCofFFvYaqVmoyiE1smlkcd7
         NrHjvtafvroHBz5SOl2o9aERRmcM9VxiHehX/m/squ4rTtSZRtdbUs7s3kc3mBz5lLVB
         nYh2NIXwt/7ZjyRzscLvI1+TL9GIexHspC5a4UIVBGDNR7rrjPD+C+XsB1PK+iNwKtAZ
         doBCyrXmxoV/0j9TuHbNaVjQjaddBwZ4Q+8ASVKUajOJeJceLUDnr0xlRUSBJzd3Dd84
         /WPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717173495; x=1717778295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+a/elQ/DVLq9OarBTd3P+ramDxjQmELz1kHVgXiQECk=;
        b=VS/4etLWMq+vUCxH6QcVikxdb3Hk474MWkqfClr0uuEVTQ+KD25POaFYgKpbPP5MUn
         NxIw552Hbkypno1qshkOzXtejMlcuS1N2J4OATa99N0tNGod4cLTv7DfiKXhxW7WUP0j
         tDdU3ZXmNWoBsmeU6iwShn6lfYKOYLvFv3acdJwui/VAqb5RJFskrGDAXobw+gIzmsW7
         iq1VkpVemvlmLYwSCnA4cHm+40wWpfKCYUTTBc9swbJF6ZlZo56pZMY92g55gg167ldr
         W58ALnsFqlskpgWWHU9/I1zC9YwNgtkFndV1ubJjuWJ8MaKUTWE9MFkc0TY7uARliuWl
         dlXg==
X-Gm-Message-State: AOJu0YwQ6SFnykH3f9mSz87W8huG9WLyj/T5Gn/+Q+mSDU9WDdhhKNIo
	TPUY9AFYPwgLQtLDGvmDMXbuvfEAoZ7Zhs9TFyCI1We0mQbmKTlQGyCp7cOwWO4lnOashiBeulG
	wRjhOWNEOhJCTjqjUg/rDYjIZT+ILBVrDK6SB
X-Google-Smtp-Source: AGHT+IEUvq8IrfxBqobB0qnsPcM/t9xGiOwgW/rm8obnqr7xsT5g6O6XEVnLgbOG+qBuq25Erbdj7agTEdB59tYJqCI=
X-Received: by 2002:a05:622a:4a14:b0:43f:b19e:d3ba with SMTP id
 d75a77b69052e-43ff2c5399bmr3098651cf.8.1717173494634; Fri, 31 May 2024
 09:38:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240525013021.436430-2-irogers@google.com> <202405311548.1e881dea-oliver.sang@intel.com>
In-Reply-To: <202405311548.1e881dea-oliver.sang@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 31 May 2024 09:38:01 -0700
Message-ID: <CAP-5=fX7ZyT82=W8uSZbT7c76E5+1JaoR5-y_gcj7A_=Js1YfA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] perf jevents: Autogenerate empty-pmu-events.c
To: kernel test robot <oliver.sang@intel.com>
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

On Fri, May 31, 2024 at 1:16=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
> hi, Ian Rogers,
>
> we actually want to seek your advice. in our env, there is no problem to =
build
> parent.
>
> * 3249f8b84526d (linux-review/Ian-Rogers/perf-jevents-Autogenerate-empty-=
pmu-events-c/20240525-093240) perf jevents: Autogenerate empty-pmu-events.c
> * 7d88bd0d22746 perf jevents: Use name for special find value   <--- pare=
nt
>
> however, failed to build perf upon 3249f8b84526d. but there is not many u=
seful
> information in below detail log.
>
> is there any dependency or env setting for us to build this commit? Thank=
s!

Hi Oliver,

Thanks for the report and the work testing! Seeing the output:

[..snip..]
> --- pmu-events/empty-pmu-events.c       2024-05-30 08:20:10.000000000 +00=
00
> +++ pmu-events/test-empty-pmu-events.c  2024-05-30 15:55:37.332495538 +00=
00
> @@ -136,7 +136,7 @@
>  { 2623 }, /* M3\000\0001 / M3\000\000\000\000\000\000\000\00000 */
>  { 2078 }, /* cache_miss_cycles\000group1\000dcache_miss_cpi + icache_mis=
s_cycles\000\000\000\000\000\000\000\00000 */
>  { 1947 }, /* dcache_miss_cpi\000\000l1d\\-loads\\-misses / inst_retired.=
any\000\000\000\000\000\000\000\00000 */
> -{ 2011 }, /* icache_miss_cycles\000\000l1i\\-loads\\-misses / inst_retir=
edany\000\000\000\000\000\000\000\00000 */
> +{ 2011 }, /* icache_miss_cycles\000\000l1i\\-loads\\-misses / inst_retir=
ed.any\000\000\000\000\000\000\000\00000 */
>
>  };
>
> @@ -373,7 +373,7 @@
[..snip..]

It appears the version of empty-pmu-events.c the patch adds and the
version generated in your test configuration are differing because of
whitespace. Perhaps a hex editor will show what the exact difference
is, it must relate to locales or something. Like you mention this
could be resolved by an env change.

> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240531/202405311548.1e881dea-ol=
iver.sang@intel.com

I didn't see the generated test-empty-pmu-events.c there and so
couldn't follow up on the locale/env exploration. I wonder that a
suitable workaround is to change from the patch:

+$(EMPTY_PMU_EVENTS_TEST_LOG): $(EMPTY_PMU_EVENTS_C) $(TEST_EMPTY_PMU_EVENT=
S_C)
+       $(call rule_mkdir)
+       $(Q)$(call echo-cmd,test)diff -u $? 2> $@ || (cat $@ && false)

to instead of invoking "diff -u" to invoke "diff -w -u", that is to
ignore whitespace. I can send a v3 with this.

Thanks,
Ian
