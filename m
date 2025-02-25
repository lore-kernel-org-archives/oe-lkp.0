Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016B2641E9
	for <oe-lkp@lists.linux.dev>; Tue, 25 Feb 2025 09:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476750; cv=none; b=VCFbfbrYQrWY/akArFvJJMt/BIoKbG21gXtIvyG9DmzXIZ6PYK6HYJlDNJL7Klaxjd6kumz/+Zu2UtUrT/NGMFhXWV2MpAY1f/+d2KjGuY2dsDBDj+jOO4DTShyJiEzNOq2nQaPEmgpXAeAJiGhaXl4U7Niv5gx+RR6X7Zb0Odc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476750; c=relaxed/simple;
	bh=bsdbdybJum/9TKHMpxJaYeBEjyIt+O6OA8vVk7UB/0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BezWktMzgNWiS4OvqZ9ctZMqDwLFqzWiiwJLaAQ9Ac6EZzL+j4/KrRJMQXmgjd5F7IyVxvR/99jW0tIgAP3Mru6bqaxS3Mz5DzHsCo0xKQMvei1GkS3zF8Gz8leYRApVZMkwl4s+tVW82YLYk0FWBhTIlaqepD6kCPTWgr/P568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FGVcTH+N; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FGVcTH+N"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso835966666b.3
        for <oe-lkp@lists.linux.dev>; Tue, 25 Feb 2025 01:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740476747; x=1741081547; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHVXaGLoHnHcEuRO0aCTBF6tz3V90gTR/4gwvCrCe3c=;
        b=FGVcTH+NTYPGF+9zHGVth89TG17bqRT/bJGpvSBfskn1/0dXr61RcR0oZ4gwvo1S/2
         fFcVpLve7dxiPFQBY3JOnPM099leJAe2ZNISGhnJGSzBrgnuhlAOC6Q1jIfYJiOsWhhz
         3ASuj7Q4bjglQh2HA4iFhQdThxbPO3dc8AZIt4Sj5/ufwHyJ/P+ZC6eSUY+FxWPpK1uC
         CY5CCXrg+zJvgM+xlxDgC3u2ddte5fiZWqQWF8Aybivv/cOALBd83SWoYvs84+T4+zR7
         748HRmHRxfHqdK0/kwvOwuwdT1J1+TKXetB1YSvNZ0WWeva26UdWNCajPIpYyhjSfPnF
         mfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740476747; x=1741081547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHVXaGLoHnHcEuRO0aCTBF6tz3V90gTR/4gwvCrCe3c=;
        b=fJ1MF7neGpNfxDDU/ohkRaa2vVoUO7o1BWcEYni9e6IVvQOfxGaAKIU39JM2LCyGBv
         orM7AIs5I9TrSVJse2S1sAJHpDuKH7pdKGdZiXrZu+6Ryf4FpIDn1Egb43TDwKqBPOBJ
         ZJs6YTB8055zZoMazwmwnqRdrc+nQDXQUwYyDtsHZBcA9cWW7Y4yq10DzUxAn3oOwq8j
         Y2Te5VXps9e+/GUtYe0NUKx9iAtalf0eP30B8nscFJYYx5rmrGWnH4Nq2zjHL3QpL4oM
         6ncY7Llc+obHrTcsn4OdiTqHghuorI8Pnio0/VPBXbuLV6SF/Qzzy0MjnN+19A9SmLpS
         29Gg==
X-Forwarded-Encrypted: i=1; AJvYcCX14BUG51Z1xe+VlFHbLpGhaKCUHKeuPDom6ofU9a3Fyx+iVgBj7+Xc0snbAKXtLAimJUkT7Uo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+LVOk00YzVOg8CzFCLrogBtscE1H/dDYrOcw/BZhw9Gy3P73z
	U6f77T/J46tZYCiGfUWJ7UwsPE0oJmMTxkETRl1B2mimCHT9S2th+CGWysATCL4gL29Auta+SpR
	VOehZMrck2TEfBsB+1L01Lr4Pb1oPiZ8vjCrRZg==
X-Gm-Gg: ASbGncvJqSyjN7A57C0tPOKx0zE1Xj0YMFpBsSTdfRNftM02wQwJl9dhx0iUER1U89l
	0m1qkZQNDQJkKXLA50LLBmBWZYmlmhtCmEP7fuiVCqlL0Q/XtcCn0TF2itq6PjbRrr7xpMuaZaY
	Pq8uHpkukbUO/Zlkf4imgbr3qZ0AEQxmfFbFet
X-Google-Smtp-Source: AGHT+IHy5CXUnGuuk5vTmSwlwqnhNPOn45I7gdCsEA2weqy4YQrc6Fq6PBRDF776Svd8jFTrDK4CUkwKi2Vp+4Fmcsc=
X-Received: by 2002:a17:907:970c:b0:abc:b96:7bd2 with SMTP id
 a640c23a62f3a-abc0d97d421mr1576384066b.11.1740476746998; Tue, 25 Feb 2025
 01:45:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502251026.bb927780-lkp@intel.com> <tencent_6D9B516AFF16965A3BB652A049D6CA847706@qq.com>
In-Reply-To: <tencent_6D9B516AFF16965A3BB652A049D6CA847706@qq.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 25 Feb 2025 10:45:35 +0100
X-Gm-Features: AWEUYZmvkDsNth2SEizMKQjlIz2X8mlnwK3RzzO7EOkh1PJdhu483jlPhyWEu-w
Message-ID: <CAKfTPtBWDFSj8E53i=qSK7kR1qsT68xLvVp4+HGr5FXrna-xRg@mail.gmail.com>
Subject: Re: [tip:sched/core] [sched] 2ae891b826: hackbench.throughput 6.2% regression
To: Chen Yu <yu.chen.surf@foxmail.com>
Cc: zihan zhou <15645113830zzh@gmail.com>, oe-lkp@lists.linux.dev, 
	kernel test robot <oliver.sang@intel.com>, lkp@intel.com, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, aubrey.li@linux.intel.com, 
	yu.c.chen@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Feb 2025 at 10:31, Chen Yu <yu.chen.surf@foxmail.com> wrote:
>
> On 2025-02-25 at 10:32:13 +0800, kernel test robot wrote:
> >
> >
> > Hello,
> >
> > kernel test robot noticed a 6.2% regression of hackbench.throughput on:
> >
> >
> > commit: 2ae891b826958b60919ea21c727f77bcd6ffcc2c ("sched: Reduce the de=
fault slice to avoid tasks getting an extra tick")
> > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
> >
> > [test failed on linux-next/master d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8=
afa]
> >
> > testcase: hackbench
> > config: x86_64-rhel-9.4
> > compiler: gcc-12
> > test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.=
00GHz (Ice Lake) with 256G memory
> > parameters:
> >
> >       nr_threads: 100%
> >       iterations: 4
> >       mode: process
> >       ipc: socket
> >       cpufreq_governor: performance
> >
> >
> >   39754543 =C4=85  3%     +56.8%   62349308        hackbench.time.invol=
untary_context_switches
> >
>
> This patch shrinks the base_slice so the deadline is reached earlier to t=
rigger the
> tick preemption IIUC. For the hackbench case, my assumption is that hackb=
ench seems to

For systems with more than 8 CPUs, the base slice was
0.75*(1+ilog2(8)) =3D 3ms which is exactly 3 tick periods at 1000hz but
because the tick period is almost never fully accounted to the task,
the task was running 4 tick periods instead of 3. The normalized
base_slice has been reduced from 0.75 to 0.70ms so the base slice
becomes 2.8ms for 8 CPUs and more and the main result is that tasks
will run 3 tick periods instead of 4.

> encounter more wakeup preemption and hurts throughtput. If more frequent =
tick preemption
> is needed, but more frequent wakeup preemption is not, are we able to do =
this base_slice
> shrink for tick preemption only rather than the wakeup preemption? A wild=
 guess, can we
> add smaller base_slice 0.7 in update_deadline() for tick preemption, but =
remains the old
> value 0.75 in update_deadline() for wakeup preemption during enqueue.
>
> But consider that the 6% regression is not that high, and the user might =
customize
> base_slice via debugfs on-demand, we can keep an eye on this and revist i=
t in the
> future(we have encountered some SPECjbb regression due to over-preemption=
).
>
> thanks,
> Chenyu
>
