Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187224;
	b=4M/HRvOq5gJBNfZzrvw7QL6EbOP2MTjkb1i3948tZHoRyv8LNsruWk6syPPaO/DGd8UX
	 x7Wh7QeDNDHRstEwPjEHpSXHNQELj0GGt7ChZPmDHvU4A8l991xK1CkAS4pdweXDLZZE5
	 M2dCsFickeR0FOYs19yKwAAzz7msOy/7/HBvdAHvMhaZiMnnSzG15RkhvMNJ1NQHkKwwX
	 CAsEoIDlBbVqsXMqmrF1PvzrFwmJcY7pMo5q0EKwUxzXNm0KVZ3vTVBwR3UC9vOeVudrj
	 FrwaE1pOxyJpQqNZXdl0ND8hZQb+Wer5qMn70MNmWx7terWBbfALiIVpEgv/yg4pnvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187224;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=O0TPK5M5hrUDnQg4DmTQaVPUwM9tdKMHp47PNrEqGW0=;
	b=IDNn3zN1sEXXQ58GD63oThQt0f9/rNNgBIdhcSugV2eqzSME55tqsl9OM54Hm/hYX8qd
	 kv0wuewsjHp6mwJVerfVNm+YnGRY5Q6BAz3ivR7cOQvKmbaAkVTeQ9gq1KNudTbfvL1wK
	 d41xEUxGjc7mDcD+EUaEs9nAD2svyul4FLBC4s48MMXpDBMNXjuqOzWBoFsjvJ6rfJPyF
	 htjroWAuQIoiPNdsWschx+UqEtpB5dvdH3zCs72yct1n+aattYWs07KBR4O42NTpdYgGq
	 pp8jMSubNDGZLg2W4rqwcoBHDhEvw6zsEp1CimOX5eW2T+ki6yaBy2MlZ8iLDaFejIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FKTEVT6M;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB60B606A33F
	for <oe-lkp@lists.linux.dev>; Fri, 20 Nov 2026 15:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB60B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FKTEVT6M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795187223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0TPK5M5hrUDnQg4DmTQaVPUwM9tdKMHp47PNrEqGW0=;
	b=FKTEVT6MFJl495kupXoN9cmZMHA+Jfd6q6Jfq4FLspKXwwweay9KcJJ8H0+2w5L3enVlpl
	jfEP73alJfSCCnvDAPBwSaDDQ7OD40OAzWdsQPrpAL7XGBxok5s/By1Er9sRxurGAbmbLc
	A3zqr2xJW8ggTjGc44teWNu4cssWtX0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-jpnkgmqIMqKcfhVZLDWmCQ-1; Fri, 20 Nov 2026 15:07:00 +0000
X-MC-Unique: jpnkgmqIMqKcfhVZLDWmCQ-1
X-Mimecast-MFC-AGG-ID: jpnkgmqIMqKcfhVZLDWmCQ_1795187220
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb8da397aaso3375415e9.0
        for <oe-lkp@lists.linux.dev>; Fri, 20 Nov 2026 07:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187219; x=1795792019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O0TPK5M5hrUDnQg4DmTQaVPUwM9tdKMHp47PNrEqGW0=;
        b=UIAAaS5AsOESOpkuhOmCt+n7xPPC5Ep2LwGDgufyEUM0UCs1Vd8Wr14u2A4o2pRlh7
         cxZrGZ570jifZXPkRhaiLT4QwIhXxj0jQJhyvryYmFt3bPCfmr+qgJngyItv4myL+trm
         bPTlKHec6o2bEfZ9wTtIR7zOXJXIm1ly8pbSogjVREB91f3abplOmmC/SqqnPEG8lb3m
         uQwnWfWZ0iZsA80uVtvs8RMglgzlJsytbySfxjFD7hqILke1Ir6fc8nGxJrdHbacDiau
         qUkGVg8v32hY/c+HSQHWxH7pMwDvPCtiCAqb3jcjsrYwna8SuqyyChEigcQCULasmL69
         YXJw==
X-Forwarded-Encrypted: i=1; AL+hErH/jtWqjZV3nIS2BQ/aPaXutcHz/gwU90BPVRGR+vDG8ZWu7I7VTiVX89QVHQehL73wwd3X2aI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/9y9HyVWBrqSaFLQrX6hJPenAKTrRBoaOKbzdlhM9IeE3hxBgO
	4m2pgxrjCwCrjl0LKPP/w0zaCis/abKY7DuqkncxKeVM1ITEi0o/5wRWsKqt216eR+4PF8sDb9j
	nxokemOtLrAezUEHJlpFG+1bPfz4zITrrokNq9tZE0u8hiC9aBttnIAMr1Q==
X-Gm-Gg: AYBFou1v82kkHdhEV5Gjto/rOeydA7BpyxWck70x2b2/yzfTyya6TP9SjVoW4hk6CrA
	99KA6HN733HZ9kBIk07EeuIZejTiMFMbjka3WUCYTpLVMu7zyoCVlPTklSg1sn1tgJqIOdFF/3z
	D3549ggV/88/Qr4turihA+Aq1esBsTZJcZM4cgkxBZQL/bS7YP1glVGdr5fjLXmH6O+I7qLLs4D
	3cNGRhyod+G0J/Vmtsm2W+gP6GzLbgEjLJUISb3QmgnvMeBMk3sTRSDZd5DtODZ+EifnRahu02n
	i7BRv2kCbcj8QWM0hMwSI8kLe47GDnuXe1To/IePNApMN6K3cJ3RXj3bOllo79b9Pvicxwbsl0V
	OejL13DWPLTOFUF7/3nuMj4C8FiuYx99PmCKfVlOEZJH/57iYW2PNQyRR/KNWCalwmaJfSJ9s4X
	b6g+U=
X-Received: by 2002:a05:600c:4585:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb8881b8e4mr73498175e9.17.1795187219426;
        Fri, 20 Nov 2026 07:06:59 -0800 (PST)
X-Received: by 2002:a05:600c:4585:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb8881b8e4mr73497495e9.17.1795187219045;
        Fri, 20 Nov 2026 07:06:59 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm92714315e9.7.2026.11.20.07.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:06:58 -0800 (PST)
Date: Fri, 20 Nov 2026 16:06:55 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com, ltp@lists.linux.it,
	cgroups@vger.kernel.org, rcu@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	luca abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yurand2000@gmail.com>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Davidlohr Bueso <dave@stgolabs.net>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Qais Yousef <qyousef@layalina.io>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH v3 6/8] sched: Limit sysctl sched_rt_{period|runtime}_us
 to RT_GROUP_SCHED
Message-ID: <awBiDzEvUch_5ZJn@jlelli-thinkpadt14gen4.remote.csb>
References: <20261113-sched_dl-v3-6-a76ffa1cdeee@linutronix.de>
 <202611192004.cca8bf73-lkp@intel.com>
 <20261119142348.MkPQ2Fby@linutronix.de>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261119142348.MkPQ2Fby@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yBihzl-zfPGSncAxFLbKL-ureRuo17A0QyoRqIomOlQ_1795187220
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello,

On 19/11/26 15:23, Sebastian Andrzej Siewior wrote:
> On 2026-11-19 22:11:10 [+0800], kernel test robot wrote:
> >  [1;31mBroken: [0m
> >     • proc_sched_rt01
> > 
> >  [1;31mFailures: [0m
> >     • proc_sched_rt01
> > 
> > Session stopped
> > LTP test details
> > ----------------
> > starvation: starvation.c:115: TCONF: Skip test due to slow kernel configuration
> > proc_sched_rt01: proc_sched_rt01.c:45: TFAIL: echo 0 > /proc/sys/kernel/sched_rt_period_us expected EINVAL: EBADF (9)
> > proc_sched_rt01: proc_sched_rt01.c:47: TFAIL: echo -1 > /proc/sys/kernel/sched_rt_period_us expected EINVAL: EBADF (9)
> > proc_sched_rt01: proc_sched_rt01.c:53: TFAIL: echo -2 > /proc/sys/kernel/sched_rt_runtime_us expected EINVAL: EBADF (9)
> > proc_sched_rt01: proc_sched_rt01.c:62: TBROK: Failed to open FILE '/proc/sys/kernel/sched_rt_period_us' for reading: ENOENT (2)
> 
> The test writes to those fies and now complains because the files don't
> exist. My intention was to remove those files because writing to them
> serves no purpose and people don't know this and _assume_ they disable
> RT throttling.

I agree on the RT throttling part. Before this series, writing to them
does serve a purpose, though. 5/8 moves that functionality to sysfs,
which leaves the files without a purpose, and 6/8 then removes them. So
existing users don't lose a useless knob; they lose the working one,
which has moved somewhere else. LTP is not the only one that will
notice, I'm afraid.

This is what I meant with "yes and no" in the RFC thread: we need an
interface for admission control, and I wasn't sure how much breakage
moving it would cause. Now we have a first data point. :)

You suggested yourself back then to keep the files and make them apply
to DL only. I think that's something like:

 - keep sched_rt_{period,runtime}_us for !RT_GROUP_SCHED, backed by the
   same code as the new dl_{period,runtime}_us (sched_dl_try_boundary()),
   keeping the current validation semantics (the LTP test checks the
   EINVAL cases, and 0 is a valid runtime today)
 - pr_warn_once() on write saying they only control DEADLINE admission
   control and that RT throttling is handled by the fair_server,
   pointing to where its knobs are
 - fix the documentation as you are doing already

That way nobody gets surprised anymore, which was your point, and we
don't break anyone? We can still discuss deprecating the procfs names
later, once the new interface has been around for a while maybe?

Thanks,
Juri

