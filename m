Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098232;
	b=5a5ObA3rHgmmOSlh01cyNJvUVRJSsuE8UWqm7uiVgJo1ailQuxETAxuilovEC8Lw10TH
	 tLmCDtZgSDCcCtzUGw8G1WyPBXG2xOPVGGU9YCpB6JVBaTX/sLF9Xs/lpD4Fs2i3uzyOP
	 ru6diKTdglSpPb40Aiwk1NbPCYa/O5kNXwronBZS8husqQZzTT6E7HRlfMMB+qSODM3o2
	 XpMopWg61ZAkqArn4vGsBsHs26pD7gyR9AiYKVX/vRVfkbksuN4TDEzGl/LDfq/c79g8j
	 7025S/ppbTnQDAILtDdFUonkKOZb/8d7c41gR996U45rl+Bo6WXEeYIGt674QaCSQ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098232;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=sFju/1HR8D4dGfEsV9o9IsWma24lYxtJ3WMUExZI3CM=;
	b=ikK7Spg8meKV3VFuJ2IMP2Xj7WDX6UMg02Ey8IQsis0ap+PrtwinjPYMzH4Ktf0wJZMh
	 PDwXVYcJZ0ma+AQT3XsR6xmO0J1DQ+qVty3RCow2qOtkLsfwJWnQ1QITIY/ezzLlPnJfD
	 mLAzARYNkGluyyg1hyyv0x/9ukR0fdLC6QqjX7pBN/MO50YJ2OL4axccI9i1E6f3KSYe/
	 tFhp+5hymt/iNPLxsEZuQbIC/jT8agLVBwRrVBTPQyZlNpbN9oI7J48z8rz9sS2wE4GV+
	 WcZ1CC0MuigZVtFs3b1OGoAz78p+6C0TGIB9f5Cxfpy7lfhcFPx6OQv3lpJbz73ZTfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=T0xL47Vb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hB3TSCjH;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58428606A32A
	for <oe-lkp@lists.linux.dev>; Thu, 19 Nov 2026 14:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58428606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=T0xL47Vb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hB3TSCjH
Date: Thu, 19 Nov 2026 15:23:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795098230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFju/1HR8D4dGfEsV9o9IsWma24lYxtJ3WMUExZI3CM=;
	b=T0xL47VbEsUbhj2RinyONMU2/ofHZXyc9bMcofgkQ2RiSxRzL9YUli0b3MjC3CRLdSjWw+
	CdTbMmcisggITNMMGvaXS4U1Dg0QTcPO31+bqYELe6RpbrdSF53b9Ybrly8r8PWqUjZxQ3
	BnRGIvZBg/kBFeFy5bCbMCdmblcEGCwyAmr4G2B0Oi/u6T4glU5b+0nyXUtAS+2kcfPaKE
	a1kusWTLGmSwgCtcNcd42yv3sy7G0H8bZGiBm2oUDRlpE5yO3vNMeQbm/Kxe+ptTXdpiu6
	UT1FlePKgJvTeweokPV2JjSGn8nn+SS4pj6iSD6YvPc8AHJBojMsHVs7ZJzdRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795098230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFju/1HR8D4dGfEsV9o9IsWma24lYxtJ3WMUExZI3CM=;
	b=hB3TSCjHaJc0Tb+O4RfNg+PzzpZkdB6FNKDa3Y8i52g+wfjZ2gSZH3CSN9c8sBBjo/O0cw
	5oEHHy4C+qexRpCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com, ltp@lists.linux.it,
	cgroups@vger.kernel.org, rcu@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
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
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Qais Yousef <qyousef@layalina.io>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH v3 6/8] sched: Limit sysctl sched_rt_{period|runtime}_us
 to RT_GROUP_SCHED
Message-ID: <20261119142348.MkPQ2Fby@linutronix.de>
References: <20261113-sched_dl-v3-6-a76ffa1cdeee@linutronix.de>
 <202611192004.cca8bf73-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202611192004.cca8bf73-lkp@intel.com>

On 2026-11-19 22:11:10 [+0800], kernel test robot wrote:
>  [1;31mBroken: [0m
>     =E2=80=A2 proc_sched_rt01
>=20
>  [1;31mFailures: [0m
>     =E2=80=A2 proc_sched_rt01
>=20
> Session stopped
> LTP test details
> ----------------
> starvation: starvation.c:115: TCONF: Skip test due to slow kernel configu=
ration
> proc_sched_rt01: proc_sched_rt01.c:45: TFAIL: echo 0 > /proc/sys/kernel/s=
ched_rt_period_us expected EINVAL: EBADF (9)
> proc_sched_rt01: proc_sched_rt01.c:47: TFAIL: echo -1 > /proc/sys/kernel/=
sched_rt_period_us expected EINVAL: EBADF (9)
> proc_sched_rt01: proc_sched_rt01.c:53: TFAIL: echo -2 > /proc/sys/kernel/=
sched_rt_runtime_us expected EINVAL: EBADF (9)
> proc_sched_rt01: proc_sched_rt01.c:62: TBROK: Failed to open FILE '/proc/=
sys/kernel/sched_rt_period_us' for reading: ENOENT (2)

The test writes to those fies and now complains because the files don't
exist. My intention was to remove those files because writing to them
serves no purpose and people don't know this and _assume_ they disable
RT throttling.

Sebastian
