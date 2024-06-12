Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2A584E07
	for <oe-lkp@lists.linux.dev>; Wed, 12 Jun 2024 21:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718228817; cv=none; b=ZKcUty7ZHDrMXdlBK7gk1ijAt+yWSlxcehgOKwmeY+VvNRN/LTIlWTuv+QZHWFlVRMw3z8rw1AJvac0u8ll3s4wDntWdEHrLYb5+49ypnSTi8tXACrn482qd6o3qWxcCd6IaKAFTmcRbX3twggu4vyVWd0G29qnZyqYUYN46Q2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718228817; c=relaxed/simple;
	bh=+InWqwc59WaX46vE5AxcsSfl1jFryAeQ5J5u3z8pMrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqRfA8GZzllZuDE6AtF9UMcIuZiMXUXK3eVFrPZFLhQ5LTVJ56TlZiremVRVY4giYRNBLiGX7zpYCRYteQMw6LBP9WHQRa76d5oLhATQZIvE8ZNI7akdpKscGTisGk27oNwSy/DBlG/+xla4BDlP/2TqF1kA+NFHQxRhOANoAPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ngnk/4tp; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ngnk/4tp"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-44056f72257so106471cf.0
        for <oe-lkp@lists.linux.dev>; Wed, 12 Jun 2024 14:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718228815; x=1718833615; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGFO/gWpjWxRc6zdNFKUtA+WWgn2yoVFVUtmjvc0LMM=;
        b=Ngnk/4tpjj+BKrgUY768Dw6s4BmYukfx61U+w71lIrl8XRDwZEGFxv9Y1dDLJIu9uU
         eJQA1yxh3gnC2zWlGBk6QFPuMMYsPbsMflWKk6/q1MlxiHHPlmg0AJzKS5herb99VzDo
         urBSraaJmfg4/8GZjGoJS99f5elRFs9Fva0hkf2GGLJDtZ1hcNnVXVCHAOF1o2kK6PdW
         tvKx/wIbpSahFHl9JFESKyWrZ3gguliDmIi1N+4mpeE61KqXQsfhVPqIN2Fa8hKv0h5n
         8tB20YLRAr1STGLaq9gm3HdOFHGYm329fq0NCx5ZFoBF/iAufTYUI+Svc/S9FuhxfZFI
         /ZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718228815; x=1718833615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGFO/gWpjWxRc6zdNFKUtA+WWgn2yoVFVUtmjvc0LMM=;
        b=rXGgx8vIQ9VOVif5N+QhfS4dG7+B6ApHpioQN1/km7VxvExO4b8ImzFuQMza4dEZT+
         IcMmdjpPorCtdqB7fwhcNn+7Qn63MU9tOER3/bnN7arI51b1Vh9tg9rfsvws8D8ad68p
         zwlR5KpDdlDc2YPEZTkab/xYwsESV3ZOrv0TIDh0rMNCP4e8Hso6xtIlTTjYJbnGO5OT
         2ZBeHgrTpJeGp/w6Rbe7W6IB1u6H6p4Ofzj/qOnNosDr5L1hO5jnKYAUiZWDbbxOIEqw
         LZ36jbk0fqU6QJIdL9ET8NUbX9G2sEfdqUqXH/mixmOR9B2BGtN8mD4vJcns+PbrTDvF
         r6IA==
X-Gm-Message-State: AOJu0Ywr16Aaj735qbd1//03UjDW+c3OSSbVScfJ42BF2+UD57CBU8n2
	s+a51H2l23WhUFGz3Z5FPkIxMQs96LxpMtAblr3HZhRd3UrIM6UdAnJ76JXwr+iD7UUGURAAn4l
	SqSGxoxhipuAFMqZYux530fL9q1SoWrzF3uAr
X-Google-Smtp-Source: AGHT+IF7kA7jzJbe/avrLLkOmazBUAeVUG1MPaJsw0sfB3QphtF3xLPAgEAF+B2A3ZPJawxP8BglPYnijgmcaHbwINE=
X-Received: by 2002:a05:622a:1b17:b0:43e:cb4:1d10 with SMTP id
 d75a77b69052e-441a1272b40mr740741cf.14.1718228814988; Wed, 12 Jun 2024
 14:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240525013021.436430-2-irogers@google.com> <202405311548.1e881dea-oliver.sang@intel.com>
 <CAP-5=fX7ZyT82=W8uSZbT7c76E5+1JaoR5-y_gcj7A_=Js1YfA@mail.gmail.com>
 <Zl3Q7AtOWY8ZCcg8@xsang-OptiPlex-9020> <CAP-5=fU=UPpZTULuyZm=Ep0Ri6SdTciL5kqpciUfnWyDvz6HZg@mail.gmail.com>
In-Reply-To: <CAP-5=fU=UPpZTULuyZm=Ep0Ri6SdTciL5kqpciUfnWyDvz6HZg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 12 Jun 2024 14:46:43 -0700
Message-ID: <CAP-5=fV5Qdu5iH_DKeAXQfEmQN9SmxCViSgbOCvAmN529WoeOw@mail.gmail.com>
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

On Mon, Jun 3, 2024 at 8:46=E2=80=AFAM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Mon, Jun 3, 2024 at 7:19=E2=80=AFAM Oliver Sang <oliver.sang@intel.com=
> wrote:
[...]
> > I tried below patch
> >
> > commit a79a41133a41adc2d69c8f603c7d880b3796cbf7
> > Author: 0day robot <lkp@intel.com>
> > Date:   Mon Jun 3 16:35:45 2024 +0800
> >
> >     fix from Ian Rogers: invoke "diff -w -u" instead of "diff -u"
> >
> > diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
> > index c3fa43c497069..54d19b492db5c 100644
> > --- a/tools/perf/pmu-events/Build
> > +++ b/tools/perf/pmu-events/Build
> > @@ -39,7 +39,7 @@ $(TEST_EMPTY_PMU_EVENTS_C): $(JSON) $(JSON_TEST) $(JE=
VENTS_PY) $(METRIC_PY) $(ME
> >
> >  $(EMPTY_PMU_EVENTS_TEST_LOG): $(EMPTY_PMU_EVENTS_C) $(TEST_EMPTY_PMU_E=
VENTS_C)
> >         $(call rule_mkdir)
> > -       $(Q)$(call echo-cmd,test)diff -u $? 2> $@ || (cat $@ && false)
> > +       $(Q)$(call echo-cmd,test)diff -w -u $? 2> $@ || (cat $@ && fals=
e)
> >
> >  $(PMU_EVENTS_C): $(JSON) $(JSON_TEST) $(JEVENTS_PY) $(METRIC_PY) $(MET=
RIC_TEST_LOG) $(EMPTY_PMU_EVENTS_TEST_LOG)
> >         $(call rule_mkdir)
> >
> >
> > but make still failed. I still saw below in our build log
> >
> > --- pmu-events/empty-pmu-events.c       2024-06-03 08:41:16.000000000 +=
0000
> > +++ pmu-events/test-empty-pmu-events.c  2024-06-03 13:47:19.522463482 +=
0000
> > @@ -136,7 +136,7 @@
> >  { 2623 }, /* M3\000\0001 / M3\000\000\000\000\000\000\000\00000 */
> >  { 2078 }, /* cache_miss_cycles\000group1\000dcache_miss_cpi + icache_m=
iss_cycles\000\000\000\000\000\000\000\00000 */
> >  { 1947 }, /* dcache_miss_cpi\000\000l1d\\-loads\\-misses / inst_retire=
d.any\000\000\000\000\000\000\000\00000 */
> > -{ 2011 }, /* icache_miss_cycles\000\000l1i\\-loads\\-misses / inst_ret=
iredany\000\000\000\000\000\000\000\00000 */
> > +{ 2011 }, /* icache_miss_cycles\000\000l1i\\-loads\\-misses / inst_ret=
ired.any\000\000\000\000\000\000\000\00000 */
> >
> >  };
> >
> >
> > I will try to get generated test-empty-pmu-events.c tomorrow.
>
> Thanks Oliver, if you could get the environment variables that would
> probably also be useful.

Hi Oliver, any update on this?

Thanks,
Ian
