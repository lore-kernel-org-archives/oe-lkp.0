Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795420102;
	b=TeWhAq8CeK/WdiJ5bPfRuaZT+gcmTJelEe2AajM9aXL1qPt11EWc/Fw8Dz6XqQFuUcO1
	 EAL/xpPevYI1Qk7iN9f/8NA2ApeU3/lYKj+nrZ+6V1aFC8wM/MfaNRjg9UC01hTAZ+0dp
	 bXR+Db0HFA4SOMRp2OYQS/8lZqw6AGflM56dDYOHIj4Wz46Mrl8+lnCEec2UXI+QoLCgf
	 k+XjtSWq5rkcBtWLDsXHilxCIYUrWVDvklUQSSmBEYvM2WzsJHQ2+t7icFozVfTpKPfGD
	 jkR3QvL5OxCf9mMNEvVnzNsC/SKRwrDLQNYlBisvKi3Poo6HdPNPYzikPBalEeC9RBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=I2Cf4kH4n47u3hSqnTQ/vRo5IDUIuI4jeAwVy/w8ZNA=;
	b=Dix8OUmBJHcAvhyZ2RcsKlk/ziPIJd4AikD33gjYSDwAmTDXqADn7GFErQBzQNtvvjPo
	 s45bRR01iq9XOewXRBtjwAmMxVGXFo0cz+otsN6PyS4pXL4yk8yZmu92VawAXKFyKRMiI
	 SVWifRvOAjxayX9XVEIoZWtYGwk9pZ/FzZQrQCrfhxJQ+P6a8cj7m9l/BGTj47rdVAuWe
	 KrPcpYycv/lH9DzxwVusk7eP2+7ZMYNOBm/DctsPZd5qyqXX+niRWFOWdw7G/yUya+UNl
	 QEoBo6JOnwFEyHDLvbS476g26aD3Gv9GkMoam3wUvQodOmjER5JTdR9Na2RejICb3Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WUV4yKUD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6921606A31A
	for <oe-lkp@lists.linux.dev>; Mon, 23 Nov 2026 07:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6921606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WUV4yKUD
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so3405868a12.3
        for <oe-lkp@lists.linux.dev>; Sun, 22 Nov 2026 23:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795420100; cv=none;
        d=google.com; s=arc-20260327;
        b=HdLhHmWcG5lFM8erLLk9CcCppqdsqb4ZwW6kEaMoIhPtJWLIb9zOcISayNkdWSVchU
         v9bzJOWL2AwLrJstAA+P732zFj6FHmslzgE78cENLlPmewypuW6zNa4e2RNoimReMupT
         a5fDOf9MxC9Pfg8YSPIin/EO/v95SvJiS/SU72JOHmbiELpB/q/YydhgcptNyjOsas1c
         T3ItkiM59s3jN+wcm/C2itim4NHMU/upKSe2B1C4btJrZwJwbKIutUvd0RHOoGKtrEL+
         uEagniJ2LjiAlc3/1E7Gmh243LHyxVyXXdUrxKBo5vppwgnxE9NfoGHidyQXc+VmhyS+
         tAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I2Cf4kH4n47u3hSqnTQ/vRo5IDUIuI4jeAwVy/w8ZNA=;
        fh=7HzXnV6T/fkAGMGBerVD+mC4MDN2i6Ccn52C/QzlO5c=;
        b=I9cINa18qhe8hzzB2TjquWFuvXhVnnY0HrjxFvPu8lSRbR9/7KSj93QFMhZLres82b
         tNnrKbj1FCmz02PyAr9QB+Bgjj3g6I5Hpyi5JjEjAC9NdNM4mYlLFtTCoaEbHMoGY/Co
         LcJO3MQEJesHml0ROPxqvKOI/nIDwVjEDiTQqUQV3H5gQIrIkyTKicgWhEURGugIMrcv
         CpMuI2Zj/s+3SuEDDUt7ol2eM90czpVWa95LBX33AbwztuAmFQaKgwhZp1HmYJ75iEfs
         BhiAIImPPUob65/tWXF62siwkdZOczjsedfhA5T7vPJkR5jBrMBoW7nWBQnw21HSkY7i
         3Hsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795420100; x=1796024900; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2Cf4kH4n47u3hSqnTQ/vRo5IDUIuI4jeAwVy/w8ZNA=;
        b=WUV4yKUDYpTn5AQJL6FosF+aNTBnqPmb5CDTkIdx1hmcQTqV7LKLDefcCdIzD5zabi
         dzjJ2w+DJuDkSILKVTcqJMlpoZKFreoG/kto17mLSZSxJQ05y1Yy0MJk0Uu/QBDantCc
         OGeTNPUh0NAHz6uaFCD+A5e2D1ietUFwDQP6A9/Yn6h1onTfTJiiR52TsmAJ4gz2rTDx
         tdhaM3ZVEHMEHciQJhMfHETfFFGb4hh2T71TcghIjESWhGM0eytfwHjWxvLcJauWXYYE
         M1KeUCxX8Tr01lmjkGM1RRxhWPXrzg+/bnEjdblP/cM4c8B5cQNJblMLZQI3Y7OjakM1
         fanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795420100; x=1796024900;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I2Cf4kH4n47u3hSqnTQ/vRo5IDUIuI4jeAwVy/w8ZNA=;
        b=d3GSEAHON+++H0Y3txwzRLdlHuJdAWfSYQFwOkKPguKjqrcrG2aOWPvkr1TtoqF8au
         /kUA8mU7JqFDJzFnfAU/kbBvKOF0SMN06o6XvLqapZR2TMbOKHV82ryzOU5bJcTbwEZJ
         67sD9rnGTZkhSqj7MpDPjsUK+qqLRkf2ROSoLbyZ0yHDI2YOBoUtmyq1kPMvTdQimPrZ
         sZbz3rehnCvX4SPELsdnIk4+eocRMr3GIHIK/4fDovIi60yJWCpZnv2r4SRgIEHAf0Vm
         PdQoVZnuqHzC3cAFy6ZnHofndX3U+g0H119sai6jPD0SOTMXdOcIdBzXYddVBgoa+u1Y
         zQLw==
X-Forwarded-Encrypted: i=1; AL+hErHeWri0piALw0bPHmVKZBSWNyURkmos1Fz3DOHb9LueGmUNjTq0jPKPoTIUCjfquVTN/uovDPI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/um3zrE8C5h2DLEImkqraWc55w/2NS3ZajJrv767Gix1CoL2rb
	06cUWMaZ6/HS+FOGF8JVjAeSuECICk19Q3s+g6ZosNZ3d/QVrlugysVKpH4xbP3wDwN2kUTgWUU
	qwKT31MJroN1vMxXejv/n+0vs7dKwYEPu0Rpbiz2ThA==
X-Gm-Gg: AZFdTZd52DIlk5gg2XFgwmLAheV3r4LSdaEw+E0rCMgASabVazk/pagBhwFl4D5gqwj
	Ww7CpZXKTEqwu/qznC7piFyXlx5I53UyMF/Qctr5CoSdEUkkMPQzjJO+G+3zq0JQS+QYG3FZZgw
	ebGWoj/UkwOCYO4lYfPKaKyUufS7uXtwRgjQQiQG477MOUIGJYEy+kuEwt2hLmoNnxsIogZ10QJ
	1LlkjyICVjpzcNxaZ0EtYNAyA47s3QfX9UkQvtRBzSXI4h+TIxUg1fc2Eye3C8Ka8djlW1eAhSW
	Lm3UKqiJiQx5EyJJh9/7QtWXj8d9XDvmU7d4jcTq8GHb9/8GaE0Nil+y29vXxtGKMwq+XY9jGGt
	FQvl7GmLdsosbSMLzudT1vezQReAh2XMK3DpbZ4HkjTeooSO3uasBOaPF0xgZVyufgQBjKg==
X-Received: by 2002:a05:6402:501d:b0:6ba:659c:8ca3 with SMTP id
 4fb4d7f45d1cf-6ba659c8fb1mr4802319a12.10.1795420100021; Sun, 22 Nov 2026
 23:48:20 -0800 (PST)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <202611230853.e2e6401-lkp@intel.com> <awPjsi/FiElpwjM+@chenyu-dev> <207b8999-73f3-4173-8a2e-8e9ee3b1a767@amd.com>
In-Reply-To: <207b8999-73f3-4173-8a2e-8e9ee3b1a767@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 23 Nov 2026 08:48:08 +0100
X-Gm-Features: Aa3M54rBBtBzw-zOTG2JSlVAzgNUBxFbCOrVn9CdlCkvmNblosyIYhZQNb699Eo
Message-ID: <CAKfTPtCiENFwCzFnsA-p8+zDSh9riv5G-ZsiEU80+4QhrpYt=A@mail.gmail.com>
Subject: Re: [linus:master] [sched/fair] 486c3d06b9: stress-ng.switch.ops_per_sec
 33.3% regression
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Chen Yu <yu.c.chen@intel.com>, kernel test robot <yi1.lai@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, aubrey.li@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 08:16, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Hello Chenyu,
>
> On 11/23/2026 12:26 PM, Chen Yu wrote:
> > I fed this to AI and asked it to reproduced it on a server, later AI told me:
> > -     int h_nr_runnable = 0;
> > +     int h_nr_runnable = 1;
> > was missing in dequeue_hierarchy() from https://lore.kernel.org/all/20261112083447.25603-1-kprateek.nayak@amd.com/
> > when merging into 486c3d06b902
> >
> > From 850d8788c72d6ae459034b85584cd5ea01df920e Mon Sep 17 00:00:00 2001
> > From: Chen Yu <yu.c.chen@intel.com>
> > Date: Mon, 23 Nov 2026 14:27:20 +0800
> > Subject: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
> >
> > commit 486c3d06b902 ("sched/fair: Avoid transient double
> > accounting for delayed tasks") changed the default of h_nr_runnable in
> > dequeue_hierarchy() from 0 to 1 and only cleared it for an already
> > delayed entity:
> >
> >       int h_nr_runnable = 1;
> >       ...
> >       /* Already accounted via set_delayed(). */
> >       if (se->sched_delayed)
> >               h_nr_runnable = 0;
> >
> > The adjust of h_nr_runnable to 1 was lost when merging into vanilla,
> > h_nr_runnable is now 0 for every dequeue, which breaks logic consuming
> > h_nr_runnable.
> >
> > Bring back the adjustment for h_nr_runnable.
> >
> > [1] https://lore.kernel.org/all/20261112083447.25603-1-kprateek.nayak@amd.com/
> >
> > Fixes: 486c3d06b902 ("sched/fair: Avoid transient double accounting for delayed tasks")
> > Reported-by: kernel test robot <yi1.lai@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202611230853.e2e6401-lkp@intel.com
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>

There is a similar patch on the mailing list at
https://lore.kernel.org/all/20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

> > ---
> >  kernel/sched/fair.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index da0d9e19c457..8a55571b9719 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8242,7 +8242,7 @@ static void dequeue_hierarchy(struct task_struct *p, int flags)
> >  {
> >       struct sched_entity *se = &p->se;
> >       bool task_throttled = flags & DEQUEUE_THROTTLE;
> > -     int h_nr_runnable = 0;
> > +     int h_nr_runnable = 1;
>
> Sorry for not spotting that earlier on the tip! Feel free to include:
>
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
>
> >       int h_nr_idle = task_has_idle_policy(p);
> >       bool dequeue = true;
> >
>
> --
> Thanks and Regards,
> Prateek
>
