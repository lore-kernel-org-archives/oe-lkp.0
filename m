Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0491422D4
	for <oe-lkp@lists.linux.dev>; Tue, 25 Feb 2025 03:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740454651; cv=none; b=aDe/GDIfJB6iZP0hh4NwoG/rH4C6M41xTaUulHB3XBsHz5cSOW7GgJtTd2lKvECnVTJBtw5Hky9ZksXYAvC72zQFhhDBcpsMkfNwGZZBD0Yvtkoqv453yFP+lXKiWaMF7Du5OdZztibLolDrDlz4xD7BueqIBoRQOwXjEcl3oyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740454651; c=relaxed/simple;
	bh=S5EPnF37ffw3iF+1ZHLXECyhjo/GJShydJkxNAMz2ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6sxvo92bb9tZH9I/BKVvXydUcquz9FShOD3yEParXO8XpGLjh+2omDVR18rMoRQWBGy4EWbGzLO/5gTpUZWap09FkfFzUp2HARqjtJvQb6ESClO0Hw0gAz/7a5e5mhYkw2Sah96GRDOmB4+f/X3rzvmwthzCexOnyCGuNvH2CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MM1eg9mN; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MM1eg9mN"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c0a974d433so576367785a.1
        for <oe-lkp@lists.linux.dev>; Mon, 24 Feb 2025 19:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740454649; x=1741059449; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USFvwxXQ6lzGXBj5aNhUyA2MOnfyfO0bhqyabuuUeVw=;
        b=MM1eg9mNgA/trv1trHLyjA8vOP35ynXlEmGwY2TMBXvgtdEssQ8V2ZrSoxtuMWS/LG
         zTBPgPt8ATukcVRxgBZZhvo7qwotBjxHdeuJ+PXKI3K47muTXcQdBTXkwMg6jqhtg61K
         kSMpGeSuSf6v6MdIRzRL1zry42eNfLhLj9haKIuNVql0GTzpZZzWottaflLNhEZtYd8c
         vyk0/CUOTu8z5uyw/CiJsGq7B3rPbaJUNgXjTKd2+H+pRQV9EV7xIpB7PRquHYxOzTuQ
         V4mtLsoIe+BUUDx/Y0+I42KVLLDgniw1e7m0sRLPT1XNSl+WqeWb/UAlCNs00rSODqIF
         B9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740454649; x=1741059449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USFvwxXQ6lzGXBj5aNhUyA2MOnfyfO0bhqyabuuUeVw=;
        b=u59MmIm6SjG7E8D2lx/T89c0gjWzL/wPvrasCfHrT7fKnko4ogPXC+V69LBpk9e5YG
         wGhAj9H5H+H4r1Jv2896wAzZlHzN5XYEuK2Chif/iGPCxDBWTBkhsAPgZx1J7oImaszy
         FUuJI+yOcG/opvm1mxG7l8cWdcSTYoxaeGIIDiFLTFGEiL8yfMN5z80640FjGWd89kwT
         IRsF0oqMxOOauVDiHYQkHLeGYIWG9m797rnn9Y2qm24iKQOkf//PY5YDswSmxRw0gVnm
         GpT1pSiNSu8RWTI4F5YtkNKvSkFyoUiFH9I+jbTYw8jPkEu5AgNyzAJWRIWxbu19zhZE
         aMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkN6yExnMtQLnSjOdBONJBYA4tpk7WFb/pJ4f1ddKIiL1XVzTgHhm3GZPb8w/OPKlZqnLHwGo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9ArhfRFo1+mWFRWrA0XyBC/VT/o1pHrFgn+wqCp9GLbnELrea
	FaJTHWIUcYHgEihgL+8OCpjn1WDJKNAZU17kjfRiP47xyHIYCQqM
X-Gm-Gg: ASbGnctd9tPe5Z82oR59kS8fuJkklniQlsdeh0MskuPgkOy0tvVJW4aT2DTNbmS0ZHg
	ueZUUSqHhSDfMWxWsl+MXsvUIiirBJuJfw1eSTfoysoV+cUB23rTlxeGn/G1y9C8B+fYgJZfrfq
	PPkcjlmuuCYlGw+Y/Aybc3/A+t/E3iZTmnL/i6v1UQhVLSYKd7xk/Rto0SLanHLeSoWFiEE/4j0
	mZUB92zNl8zDa81S3ulQ9D7mCNRvB0kYRSUKEUdJpSLWlJqiQAXvh8Tbg7udExRaWu/gNkzrKXy
	HJ0Z1twK0jMAyym3PxpzJyB0zUCrYZiOa8BL5tqOuG2HyZWkrCftpWy5MuzAeuae4FHTa7bRVSI
	AJPF1+ycoyxohPTq6
X-Google-Smtp-Source: AGHT+IEp/zfZW+gsLbwJKpixYiRGcYUtm6iHbz3g8LM++Qrn86BOXxwsQ33zHlMHe2eVv4xIyAqClw==
X-Received: by 2002:a05:620a:450c:b0:7c0:7422:17d5 with SMTP id af79cd13be357-7c0cf10205dmr2237666185a.9.1740454648677;
        Mon, 24 Feb 2025 19:37:28 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c2a324bsm58593185a.38.2025.02.24.19.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:37:28 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id C1B101200043;
	Mon, 24 Feb 2025 22:37:27 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 24 Feb 2025 22:37:27 -0500
X-ME-Sender: <xms:9zq9Z4KJW73Ni9dgz3c1XkUa5a7sLqgP9IkeccNsOyBf_sFCEIxj0A>
    <xme:9zq9Z4J0UqXkJ7QuPXRZDUyC8CnjV4RkjqrMkHeahpjKFbNK7a0Q0KBpSAAwxpn24
    PMBKeom1EI2n5VOYQ>
X-ME-Received: <xmr:9zq9Z4u_AJSUW6S5n_jf06cbuc7cO0E2eqmXHpr2VQYGx8PAxRSXC2cpKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdektdeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephfetvdfgtdeukedvkeeiteeiteejieehvdet
    heduudejvdektdekfeegvddvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopeholhhivhgvrhdrshgrnhhgsehinhhtvghlrdgtohhmpdhrtghpthhtohepphgruhhl
    mhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnkhhurhdrrgdrrghrohhrrg
    esohhrrggtlhgvrdgtohhmpdhrtghpthhtohepohgvqdhlkhhpsehlihhsthhsrdhlihhn
    uhigrdguvghvpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhope
    hpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehfrhgvuggvrhhi
    tgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehjohgvlhgrghhnvghlfhesnhhvihguihgrrdgtohhm
X-ME-Proxy: <xmx:9zq9Z1bcbxNBWGLHIFiE-xJUKF82jJpQHaNyef68oWMpXPe84_hccg>
    <xmx:9zq9Z_bYIbb6DeF36BdlsN3oUjcn5EvN1Uq0zq7enW_2-Frfngg9lw>
    <xmx:9zq9ZxABBc1HsFS1Cc2PNtZ7768tjpVyOR915l5pCOg2eHbzKBGw2Q>
    <xmx:9zq9Z1ZlcxdWMyqrZjs4UtaO9tYPmSPy_sDSauCan7cZh_hWByxRtw>
    <xmx:9zq9Z3o2JrEDry3rfigELQYPaNrjUde8jWYviYu_RaCkOxPpSGGGRcFm>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 22:37:27 -0500 (EST)
Date: Mon, 24 Feb 2025 19:37:25 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Oliver Sang <oliver.sang@intel.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Ankur Arora <ankur.a.arora@oracle.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Peter Zijlstra <peterz@infradead.org>,
	Frederic Weisbecker <frederic@kernel.org>, rcu@vger.kernel.org,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v2 1/2] rcutorture: Update rcutorture_one_extend_check()
 for lazy preemption
Message-ID: <Z7069Yj6zIaDbGLA@Mac.home>
References: <Z7v4MytjhhBZkG4S@Mac.home>
 <20250224044310.14373-1-boqun.feng@gmail.com>
 <07c31e33-4720-4204-9066-e57a708f5ae7@paulmck-laptop>
 <Z70uYdsH2hn8kNze@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z70uYdsH2hn8kNze@xsang-OptiPlex-9020>

On Tue, Feb 25, 2025 at 10:43:45AM +0800, Oliver Sang wrote:
> hi, Paul, hi, Boqun Feng,
> 
> On Sun, Feb 23, 2025 at 08:58:16PM -0800, Paul E. McKenney wrote:
> > On Sun, Feb 23, 2025 at 08:43:09PM -0800, Boqun Feng wrote:
> > > From: "Paul E. McKenney" <paulmck@kernel.org>
> > > 
> > > The rcutorture_one_extend_check() function's last check assumes that
> > > if cur_ops->readlock_nesting() returns greater than zero, either the
> > > RCUTORTURE_RDR_RCU_1 or the RCUTORTURE_RDR_RCU_2 bit must be set, that
> > > is, there must be at least one rcu_read_lock() in effect.
> > > 
> > > This works for preemptible RCU and for non-preemptible RCU running in
> > > a non-preemptible kernel.  But it fails for non-preemptible RCU running
> > > in a preemptible kernel because then RCU's cur_ops->readlock_nesting()
> > > function, which is rcu_torture_readlock_nesting(), will return
> > > the PREEMPT_MASK mask bits from preempt_count().  The result will
> > > be greater than zero if preemption is disabled, including by the
> > > RCUTORTURE_RDR_PREEMPT and RCUTORTURE_RDR_SCHED bits.
> > > 
> > > This commit therefore adjusts this check to take into account the case
> > > fo non-preemptible RCU running in a preemptible kernel.
> > > 
> > > [boqun: Fix the if condition and add comment]
> > > 
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Closes: https://lore.kernel.org/oe-lkp/202502171415.8ec87c87-lkp@intel.com
> > > Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> > > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > > Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
> > > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> > > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > > ---
> > >  kernel/rcu/rcutorture.c | 14 ++++++++++++--
> > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> > > index d26fb1d33ed9..280bff706017 100644
> > > --- a/kernel/rcu/rcutorture.c
> > > +++ b/kernel/rcu/rcutorture.c
> > > @@ -1873,6 +1873,8 @@ static void rcu_torture_reader_do_mbchk(long myid, struct rcu_torture *rtp,
> > >  #define ROEC_ARGS "%s %s: Current %#x  To add %#x  To remove %#x  preempt_count() %#x\n", __func__, s, curstate, new, old, preempt_count()
> > >  static void rcutorture_one_extend_check(char *s, int curstate, int new, int old, bool insoftirq)
> > >  {
> > > +	int mask;
> > > +
> > >  	if (!IS_ENABLED(CONFIG_RCU_TORTURE_TEST_CHK_RDR_STATE))
> > >  		return;
> > >  
> > > @@ -1902,8 +1904,16 @@ static void rcutorture_one_extend_check(char *s, int curstate, int new, int old,
> > >  	WARN_ONCE(cur_ops->extendables &&
> > >  		  !(curstate & (RCUTORTURE_RDR_PREEMPT | RCUTORTURE_RDR_SCHED)) &&
> > >  		  (preempt_count() & PREEMPT_MASK), ROEC_ARGS);
> > > -	WARN_ONCE(cur_ops->readlock_nesting &&
> > > -		  !(curstate & (RCUTORTURE_RDR_RCU_1 | RCUTORTURE_RDR_RCU_2)) &&
> > > +
> > > +	/*
> > > +	 * non-preemptible RCU in a preemptible kernel uses "preempt_count() &
> > > +	 * PREEMPT_MASK" as ->readlock_nesting().
> > > +	 */
> > > +	mask = RCUTORTURE_RDR_RCU_1 | RCUTORTURE_RDR_RCU_2;
> > > +	if (!IS_ENABLED(CONFIG_PREEMPT_RCU))
> > 
> > Good catch, thank you, and it looks good to me!
> > 
> > Oliver, you are right, I was looking at the wrong console output.
> > One of those days, I guess...  :-/
> 
> 
> we tested this new patch-set, and confirmed the WARN we reported is fixed by
> whole patch-set. thanks
> 
> Tested-by: kernel test robot <oliver.sang@intel.com>
> 

Thanks!

> 
> just want to confirm one thing, we applied the patch-set as below:
> 
> * b9aa59295f037 rcutorture: Update ->extendables check for lazy preemption
> * 5ffd825e807bd rcutorture: Update rcutorture_one_extend_check() for lazy preemption
> * c9b55f9da0d2c rcu: limit PREEMPT_RCU configurations
> 
> we also made the test upon 5ffd825e807bd, which still shows the similar WARN.
> is this expected?
> 

Yes, that's expected, and that's why commit b9aa59295f037 is needed,
thank you for the double confirmation.

Regards,
Boqun

> > 
> > 							Thanx, Paul
> > 
> > > +		mask |= RCUTORTURE_RDR_PREEMPT | RCUTORTURE_RDR_SCHED;
> > > +
> > > +	WARN_ONCE(cur_ops->readlock_nesting && !(curstate & mask) &&
> > >  		  cur_ops->readlock_nesting() > 0, ROEC_ARGS);
> > >  }
> > >  
> > > -- 
> > > 2.39.5 (Apple Git-154)
> > > 
