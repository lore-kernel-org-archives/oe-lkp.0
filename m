Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B98F1CAA9C
	for <oe-lkp@lists.linux.dev>; Wed, 25 Jun 2025 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863570; cv=none; b=FvcKIS/t/l9RbwHCKl51+eHEZ4T8rlMntA8+kOOf8IqJPTn8t4H1vDBiESOfg5+G+JX8dthmJfT29eLMg1e7AwZH9B//CtxPJHZDqoj3CK0GTJXG68LPwiWVCPjSL83uy18fjNgYWV6AvPnDG+8Bl5SaYIvFBduOfTR7LkrMe0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863570; c=relaxed/simple;
	bh=CoHQ+3pE0BaR40sPkkySRTRvOejlJ0PIfGy/gZW5z0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbPjKIjaUC7u7oI/f2zn0t3tOYpHAiIrT0Us/Slh3TGJ2eJuVhbdAJwGMH2zEiTkuK2na25DLwJromgdR0W4GY1VLdPoJBi469MbF+6KdBl2h6qvZHjEWyy0v3C+3M54uAGx3FQg4O0VOoyubrQO8rAa8fBhsC6hTlm8ZRSHzzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KjpPaRwA; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KjpPaRwA"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so221595ab.0
        for <oe-lkp@lists.linux.dev>; Wed, 25 Jun 2025 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750863568; x=1751468368; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsCMZQqmkVUqqMH5tInvaFnJAvvkUkKU0tRaWra23tY=;
        b=KjpPaRwA2rXsBxVzvHtAULoN9RQBkMOr8A6lYGeKR+12hiYR+athzpIDOFfN41/RZL
         JzWXa0cQI6R0Jp7HNt0qLSTRGA9AWvic5fyGQCMjvgvpISTB0r0SMeXj7gplW6Tr4cxz
         ZByTBlxY4vLodoS12hLphyNP2smVf4O0UGn7EwD8Ixo0GEyc3Af+Dvm0uXG05WJf+V+F
         TXschr/sLT1QeKcVmNc8mcwPfZGy7/hjo1Zs1bTd6GXK1Ja8LTmzuqGZfme5ANOjLnbm
         jWQFCkEokIVd5qUdNSoCy7AHDNI4EZRI445cmSTXZZbtlHfyZvvr3k+w9wB4ilboDq+B
         PSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863568; x=1751468368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsCMZQqmkVUqqMH5tInvaFnJAvvkUkKU0tRaWra23tY=;
        b=hsb54kTZ6WCkfehBYxdZj3BA9oAqYzMZHNUNs7BqTIdayrPGgrp+TFAYVaOCY16JaZ
         MmlQe8+VjwTmwF/hnNzxIrdbEOsyOuNYANUq//pGMP9lhm9nGmnP8Fy0laBTSLse6UIs
         DZRS2TL13PZ8Cn9PkGBWmAlhcMRW+91Cm3RlnPSo88yWmwZL3ip3+yR8jUDCeXe1ZziI
         x/q5jeUdAV1us1XlvcL9dhW4L4AI11jn2xwHDw6ORpVLa/N6vwfAtf6wIUo1hG6B1pcs
         aFXZUDznT6qjyK0i/7cdVW3CFideIVZvfRzwevMfCBZ+9WOW+fZPRSxUYNrLFrdHir92
         0Ptg==
X-Gm-Message-State: AOJu0Yyythk2AuhLvNAhFn3voRsSVm0iQTYjgndROV8ZYyi2l8aBqzgS
	6BGAssahePPb+TE34HxzOUAaodZldSWQsUW5GIg1PJpCkhimkYsQlFNImrmSJCjYpauAw1UAC/N
	HZxHi48aP1sefG/toEcf+NiI0oymd/zpBHt6xoaG/
X-Gm-Gg: ASbGnctfyKP1Oj0VrT4jgKOn6fyumdO38I+uJtz6kSPPSRJZn6yuM6dx/y6hxm5WDAG
	CnMWD+hMhqs3y8APydN5GzIjAwZ08tTjq0srbtldtOmkLpUG5Oa4GSPGlj4mW2mXtKcPACBowOw
	oN1IM5fr0JBqYKoNzjVBnESa3qHoF5EFQCn5+s+1AZEDvl5c2/ObfFiI0fiPkYZpHaS3/J2SQo
X-Google-Smtp-Source: AGHT+IFI1YA2zH+zwvyR1rJy+aBfBTCdNd7dhjmmd4EIqlXPDQxc4ZqqXXA6xdosT56rixSXJZOqOwhRJkl+rdl/sss=
X-Received: by 2002:a05:6e02:1c2d:b0:3de:20ec:5c71 with SMTP id
 e9e14a558f8ab-3df3433f362mr2634565ab.6.1750863568011; Wed, 25 Jun 2025
 07:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202506251422.589f230a-lkp@intel.com>
In-Reply-To: <202506251422.589f230a-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Jun 2025 07:59:16 -0700
X-Gm-Features: Ac12FXwVkD2jR7gdqWgouTrWU3Qi_fnDI_mR6AWnf5ozIzz7mqmYgU8s5q6WaJs
Message-ID: <CAP-5=fU6hxJp7NhnQ4zDv6xdSfue9xyRhznp62=OxKLjok8UAA@mail.gmail.com>
Subject: Re: [linux-next:master] [perf target] 5ddf4c3a17: perf-sanity-tests.perf_record_tests.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Namhyung Kim <namhyung@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:10=E2=80=AFAM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "perf-sanity-tests.perf_record_tests.fail" on:
>
> commit: 5ddf4c3a17dc499fcbaf35692bc894340062dee8 ("perf target: Separate =
parse_uid into its own function")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master f817b6dd2b62d921a6cdc0a3ac599cd1851f343=
c]
>
> in testcase: perf-sanity-tests
> version:
> with following parameters:
>
>         perf_compiler: clang
>         group: group-02
>
>
> config: x86_64-rhel-9.4-bpf
> compiler: gcc-12
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz=
 (Kaby Lake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202506251422.589f230a-lkp@intel.=
com
>
>
> 2025-06-22 14:23:54 sudo /usr/src/linux-perf-x86_64-rhel-9.4-bpf-5ddf4c3a=
17dc499fcbaf35692bc894340062dee8/tools/perf/perf test 126 -v
> 126: perf record tests                                               : Ru=
nning (1 active)
> --- start ---
> test child forked, pid 8698
>  13bca6c-13bcaa5 g test_loop
> perf does have symbol 'test_loop'
> Basic --per-thread mode test
> Per-thread record [Skipped event not supported]
> Register capture test
> Register capture test [Failed missing output]

Register capturing is different functionality to UID filtering.

> Basic --system-wide mode test
> System-wide record [Skipped not supported]
> Basic target workload test
> Workload record [Failed record]

Something seems off, possibly something to do with permissions here.

> Branch counter test
> branch counter feature not supported on all core PMUs (/sys/bus/event_sou=
rce/devices/cpu) [Skipped]
> Cgroup sampling test
> Cgroup sampling [Skipped not supported]
> Basic leader sampling test
> Leader sampling [Failed record]

And here.

I suspect this was a test machine issue although later patches do add
UID filtering tests to this test. I don't see anything actionable
here.

Thanks,
Ian

> Topdown leader sampling test
> Topdown leader sampling [Skipped event parsing failed]
> precise_max attribute test
> precise_max attribute [Skipped no cycles:P event]
> precise_max attribute [Skipped no instructions:P event]
> precise_max attribute [Skipped no hardware events]
> ---- end(-1) ----
> 126: perf record tests                                               : FA=
ILED!
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250625/202506251422.589f230a-lk=
p@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
