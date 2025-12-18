Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E06F3314C2
	for <oe-lkp@lists.linux.dev>; Thu, 18 Dec 2025 10:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766054265; cv=none; b=L8XDyu0mB+60ciolbGC+gdyCY5zdG9rflojIKBW04G2Xa8XTtQNIlBes7MjVd/EpSFdLIp+oOoUMSWiHthaPClbU+NVJ0c40Dwh6xCHmoicdjah8voL3fyoSfNOAz/bLw96+dnOm6X7E5dqNd6WPRz1lYJyT/fxVB6u0T7j3wXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766054265; c=relaxed/simple;
	bh=H+xXSnx70jrhckSZwkGUWswJW7Qc/KEA7us16aXJezQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgP4hNB9cbqXkfQNbXVMUvLPV9Q5Rpm4cRssUhg+6ucMVMpkgjNIrW+aq+E4a9ap9KAlZqZiOulR3fLsiwiNW7rJGvxDvXOZ3sTgL935C42KuNixlfWef7Y+DvLpT4Ne+KYcfv3Q5JH1JhyEGKQTj4UZJCvI8Gcx0rxwGUaKDUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XRssUEoM; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XRssUEoM"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-649e28dccadso604545a12.3
        for <oe-lkp@lists.linux.dev>; Thu, 18 Dec 2025 02:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766054259; x=1766659059; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lts9L+PP6bVBdAUSHvryZu37rHJAPo/hVs9SIf+FB10=;
        b=XRssUEoMDrJYCDC5Iuvr7IpVwmtn7gjlC9hGDanIdreJ7onno7QaYt5niS9a39Ip5B
         d4fuYdM2AHmfl8f46UjT+vwoKyggzN9PpMvpxMHB7bGj2UG5UZDQj7Jk9LgoRZPVK7bW
         PqCWb7gk6HATtTzcuO85A5A32sA79LGrDAOTgo2QTblGZJFhkS+H8PY+iJsFoN2r3paa
         QucADGdTKgMcCilTZ5pBmQWerzhw+Hvbod21/9mFPcnL+KoYNLT8YMbFJR718q8zRCkL
         ge7TrQKvFom18nG9bHTxYxbmxQ37br1hvqxV7rmlSoPy9Ve3LBwXB2ruHCcuFMhU18Wd
         3zSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054259; x=1766659059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lts9L+PP6bVBdAUSHvryZu37rHJAPo/hVs9SIf+FB10=;
        b=CWUD3M9bwl8qe9gLue+FQyPHlMAHiqRigFH0rclytEkqJWsaH4pnaltCEjOcgNP74p
         Dt6APW9iciqz58uqQE40Z+wFBRTd5mCjnasKipzBmfYnx/GoHPm/NyK8CXgGGjxhwjTx
         yBw0omv+Jifft1dxPqIj46cKovMhqlFCbU8QsbHEGU/RBBv2CHos2txQc8/dLl5Wxlm5
         0EEuaxpLBzfdMjJ8xn20Yt6AlYjeTuaE2Nr4XcSG0arMFpLHVpt4iRsUjTXupbh+RsiM
         lCja4x94X3NdiDZe25alt/cdMpd/WPnH5YWhUF0LxqpyNgw4ieFc8lPlpr3/HvNedsCc
         OyIg==
X-Forwarded-Encrypted: i=1; AJvYcCUNTSEijMNWiUf+SC3D8rWDsXFxgeLReYCww1gqS2W068XyiC7c4JN9j0cLg0OjB9DWyPWBe6A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyBHsmpCSEJsTLawXwum/lRdsgCrxC3hQovWwuTTFhnL5NlsUl
	GQ6gEUMeabRHlpucXH2K3GI22/pskrmjiVDDEFJR8Ws3O1Ci98uyzDekQKI17P+iJNeV06sYPWs
	XjX8RFc3uRSuruiiUVrowz7DRX+W9FiYcwZ26FKKAtA==
X-Gm-Gg: AY/fxX7NnC+WyY183O07ClWkq56d7m8NWw5gbAtm31e9kWAM1tbx5sRUVXw6ncq5rZR
	B2b6kdHpoFZ2X2m8OL0RzjNtpfB00VJfqR9WI54NBMTFEWq4JKfGO8simDp1FQAll/A+V8fzNKi
	8pfgS46KzfBGX/RysISIVm2XUo8y/4Qa4q0U64zzgtSWBeL91fiZAGffZi5hqYb7MaHk0mzj9DG
	nioUXUmh1iEXLRz7F2RJUDjXn/b5IJmkxioLrixe1qFu2Ta5Jdw2pukzgJvP7IxOOEbrPTelclu
	n90AG3YkXA+Obot9TCza5+ll
X-Google-Smtp-Source: AGHT+IHrcYNHYJTWP/8atb12uZIjKN4HmCKxnJnQkWkicEecTViSRS/eyHmKxyMlP7gNkLFlkrhkwh/nyI0pLG9NOvU=
X-Received: by 2002:a05:6402:2686:b0:64b:6f56:1e52 with SMTP id
 4fb4d7f45d1cf-64b6f56213bmr885132a12.26.1766054259288; Thu, 18 Dec 2025
 02:37:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202512181208.753b9f6e-lkp@intel.com> <20251218083747.GI3707891@noisy.programming.kicks-ass.net>
 <6f0954ba-2ca7-41e8-b4f7-b0b17990f659@linux.ibm.com> <20251218102020.GO3707891@noisy.programming.kicks-ass.net>
In-Reply-To: <20251218102020.GO3707891@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 18 Dec 2025 11:37:27 +0100
X-Gm-Features: AQt7F2pfDV4FBm8Cm1GTX6oYMuUKkH_cucPHbb7FaY4vrdQr5ZHcWRj3xmbqBoM
Message-ID: <CAKfTPtBYqjcxS7S4z-e9LrSmaeR2Qhs-8twVERBa_YfyOQf0JA@mail.gmail.com>
Subject: Re: [tip:sched/core] [sched/fair] 089d84203a: pts.schbench.32.usec,_99.9th_latency_percentile
 52.4% regression
To: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, aubrey.li@linux.intel.com, 
	yu.c.chen@intel.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Dec 2025 at 11:20, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Dec 18, 2025 at 03:41:55PM +0530, Shrikanth Hegde wrote:
> > On 12/18/25 2:07 PM, Peter Zijlstra wrote:
> > > On Thu, Dec 18, 2025 at 12:59:53PM +0800, kernel test robot wrote:
> > > >
> > > >
> > > > Hello,
> > > >
> > > > kernel test robot noticed a 52.4% regression of pts.schbench.32.usec,_99.9th_latency_percentile on:
> > > >
> > > >
> > > > commit: 089d84203ad42bc8fd6dbf41683e162ac6e848cd ("sched/fair: Fold the sched_avg update")
> > > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
> > >
> > > Well, that obviously wasn't the intention. Let me pull that patch :/
> >
> > Is it possible because it missed scaling by se_weight(se) ??
>
> >  static inline void
> >  enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >  {
> > -       cfs_rq->avg.load_avg += se->avg.load_avg;
> > -       cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> > +       __update_sa(&cfs_rq->avg, load, se->avg.load_avg, se->avg.load_sum);
> >  }
>
> Ah, indeed, something like so then? Can the robot (Oliver/Philip)
> verify?

yes, rq tracks the weighted sum whereas se tracks the unweighted sum

>
> (I was going to shelf it and look at it after the holidays, but if this
> is it, we can get it fixed before I dissapear).
>
> ---
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 76f5e4b78b30..7377f9117501 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3775,13 +3775,15 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  static inline void
>  enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> -       __update_sa(&cfs_rq->avg, load, se->avg.load_avg, se->avg.load_sum);
> +       __update_sa(&cfs_rq->avg, load, se->avg.load_avg,
> +                   se_weight(se) * se->avg.load_sum);
>  }
>
>  static inline void
>  dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> -       __update_sa(&cfs_rq->avg, load, -se->avg.load_avg, -se->avg.load_sum);
> +       __update_sa(&cfs_rq->avg, load, -se->avg.load_avg,
> +                   se_weight(se) * -se->avg.load_sum);
>  }
>
>  static void place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags);
