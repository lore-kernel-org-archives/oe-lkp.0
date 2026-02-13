Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A62C3033F9
	for <oe-lkp@lists.linux.dev>; Fri, 13 Feb 2026 22:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771020377; cv=none; b=owkx9WQUMj1ivGD2V+QOF81YG5ppnuxsPUgxIq1fzT+EGYqQymtDhh7i+PoxVMG284SuMmO2/U2euL2uE27mrHhTpiYtxLEmnp4kZlf18zaBCoc+hwsWwPsV8a7m1SkC0UhJlFdBEs31v/6elLz9D7fxqLTKQ1Lp2cEA+0FRhTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771020377; c=relaxed/simple;
	bh=VCLc4urSuZs+uQzKv3gDbDjmPSIBqblZiuHGGFk0T0s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U3CW3/PGkCpqjuIafgts88VhbIQp5UmJhuvMWfIUKHki/JEwG5of7KAe57Bm2kcAUFms83de0kJ9LvKj2pokm9pvlrNcXtnfOOucG9VySGUxNPxrsBsH6qdYgwIkhCD3EWJdzwmQow6PgkRHboFomzLnjoBxpRPZ7j4H2gM5ze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0GIG1jgu; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0GIG1jgu"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3568090851aso5385236a91.1
        for <oe-lkp@lists.linux.dev>; Fri, 13 Feb 2026 14:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771020376; x=1771625176; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3+8wgP0hLvuyQjlEWi6cPiKj7yXP1cNio+CtqHI+Rwc=;
        b=0GIG1jgunDiQlob/G1uhKzOCFq6B7uPvVgkwARXaeTWe0jwipe6TrQWm8a7BtKmnUf
         eX5X4DtkKW8KVIGsf57JghUo2pbnBaLXeUnSG+tgfGUR0bbPZ+vLMT6BpM5oMMz7SUKB
         0FB9fpfWe0f3qUCiMkN7efzjGy3B4iTpe6Ul5F+Ar9/GbiOyZa1gUGGrWJHCs4UCdhfI
         ZalBH3KLLWsrq6xSVm2Pkh9ZCkpSgIKDHVizgBnSdSoze6NIvMVvbRcF5sMa/baRNbYW
         yfEtodou6cCs232UxPn65nnUhYvoocR2zaaqMzPVjgYw9jRjnKhhQ/Ra1u8WJFRHoZdc
         qouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771020376; x=1771625176;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+8wgP0hLvuyQjlEWi6cPiKj7yXP1cNio+CtqHI+Rwc=;
        b=ql88GvZR9Vd69flKeFpyW49SNhTygc0mXnUZY6Emelzbwb2HBcDQ9xSePTggopJP2l
         LEn/WWrA2wr1qOGLRazwjjus9En6XuRD+B9y8pFtC6MkY6dburOkqEET/KvUV6qm4dqX
         JnzJKg3QUvD+MEbAeBENTrni/7eiHnceIhVuLEbadB4PhqBOyckYrfsZ9Cp/EZAu9ijR
         w5nlv47zblb7Iz2viVDYTYxB1FVeyQpAkrE8q7aV9wlhwGZhnNqyLez4IEAd9A3gAp8Z
         LqRXlC03gp9xwvmvwxpMWta2YRCK6rH518BOqSJlFary9zN3HSyZ9JYeD9DMqdkCAJGC
         V8QA==
X-Forwarded-Encrypted: i=1; AJvYcCUVysoeuwFjbtaXiL8OpwrJxsrDuh4WM4A7MLuMNHYgqg5HCb7cwcEmOE2lcYBL1I47RnpmXsk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoJNvIPSWUrgEIjTZvd5VWC6oqx5BWfo+bjomgVcx9bIgU6qsG
	jom3JTxBa6143aD9N9zbFoCSb8Xo0l6EwKCFkg2Lg0s7T72+J/1ezvRqH1WhOZBbLrdvbwip2Nq
	riSs4JA==
X-Received: from plbkb13.prod.google.com ([2002:a17:903:338d:b0:2a9:628c:cd39])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2281:b0:2aa:d075:5db7
 with SMTP id d9443c01a7336-2ad17495727mr7594275ad.25.1771020375587; Fri, 13
 Feb 2026 14:06:15 -0800 (PST)
Date: Fri, 13 Feb 2026 14:06:13 -0800
In-Reply-To: <20260213104006.GK3016024@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202602122157.4e861298-lkp@intel.com> <20260213104006.GK3016024@noisy.programming.kicks-ass.net>
Message-ID: <aY-gVWbdPUUQmcUR@google.com>
Subject: Re: [linus:master] [sched/core]  704069649b: kernel-selftests.kvm.hardware_disable_test.fail
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, sched-ext@lists.linux.dev, 
	aubrey.li@linux.intel.com, yu.c.chen@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 13, 2026, Peter Zijlstra wrote:
> On Thu, Feb 12, 2026 at 10:08:04PM +0800, kernel test robot wrote:
> > we found the kernel-selftests.kvm.hardware_disable_test failed consistently upon
> > this commit but pass on parent. unfortunately, we didn't find many useful
> > information in dmesg. this report is just FYI what we observed in our tests.
> > 
> > kernel test robot noticed "kernel-selftests.kvm.hardware_disable_test.fail" on:
> > 
> > commit: 704069649b5bfb7bf1fe32c0281fe9036806a59a ("sched/core: Rework sched_class::wakeup_preempt() and rq_modified_*()")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> So this commit has been in tip (and thus -next) since 17 Dev '25. How
> come this is only reported now?

Well, on my end, I still don't do a good job of testing linux-next.  But AFAICT,
it wouldn't have mattered in this case, because I probably wouldn't have noticed
given the nature of the failure and how I run KVM selftests.
