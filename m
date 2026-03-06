Received: from tiger.tulip.relay.mailchannels.net (tiger.tulip.relay.mailchannels.net [23.83.218.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E8F346FA0
	for <oe-lkp@lists.linux.dev>; Fri,  6 Mar 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.248
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772819613; cv=pass; b=JFyo6+B0mux1Ee+E95FaBSeDHlr0UCLwl7Vrr5jYAGbpYb3nICJ0OQEllsE38x7TJLUQJrVq7LiS9C5iVmuX34BKRaWs6FsfpAxsbVWQan7aR1LUrv6iFz1eFe/sq+goqQq7s7AEoMLFjWk6QFOT+nEZ8Z4AUwRff3YCLMQ6iy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772819613; c=relaxed/simple;
	bh=j0oc61eR8qNzjjiZfUb+Q2zxjX/C9DoE2kBmkZ7xNs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fO/hRTpuHQMzboE+ZKyY5l7C9oaPsyk8BHg8/9x8SM2ATaBbRK0pH0JeKcc2sew9pzvLVSbwtzwRhOfHAJZoJb5iJ0WrAtZmwmRe5TgmA5b0dT++/5girixuEbl32SIPF73Edf/lKZHJx3mrFMuVJVYgf2VLY53RUMvjfsTNDzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=Ut/mDxbR; arc=pass smtp.client-ip=23.83.218.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="Ut/mDxbR"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 3AAEA161F00;
	Fri, 06 Mar 2026 17:53:26 +0000 (UTC)
Received: from pdx1-sub0-mail-a222.dreamhost.com (trex-green-6.trex.outbound.svc.cluster.local [100.110.84.91])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 64239161D23;
	Fri, 06 Mar 2026 17:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1772819605;
	b=vzgdAdizBkyQqBvk81eLnd9tLqwzvtVqQji4mLF2n2M1br455EwmRlm2qtOhi1ypR3fBVg
	77n2pIdXO1mX792H22MGwc6LQRMxmBJzbNZfMJ6v1woPu0daQOhcpk04XQZ9i8SbYKkSMQ
	sZ2vNQSBQGL+nF5iIS4lp2tLfzMOg1dIrptTF/1P0hofk8P3MCD5gOnJCi62ZP/pRUqtGi
	Zuz1/Y8Fm93loCJAljIzl2Xfyg7o8ahDoM0AO5G9bsY20qflAOyymrE5UICyicZ+Xl7ZiZ
	1zzhQyvioMYz7iJmY+JpxsbYEvmIPtV5Ve66EkX/U688GW71R/faMmJxTiGMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1772819605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=j0oc61eR8qNzjjiZfUb+Q2zxjX/C9DoE2kBmkZ7xNs0=;
	b=XpDuJuxzhCtuXLKyrHLZ0Udfh/NgPujNsD7C184Mt1d3uO11ZhcQdVn0pkHKGh63t6RICE
	rcvizxJeoklc+qCcBzNtSZN07BUgSKGRMFiak3Bd+rsWDLJ8VZ9z52dIYX3hZfIQZxZL/K
	T4U2EDFEGTsIoYrt5+APu724yVPerxNBFRuPVz//ms88bikjGn8SOTVqcwmqeTjsVlbdUY
	3GBF6iNX/jNFvLzM2E9gZdhq+hhbH6bVAyAePPCCThEs+WdDyE213mRCA8q2LcHC1jY/6R
	vsv9GB8KycPz1C6y9Z12ixBilaOkYLmuwP/3oUiXPHCz7MCB6R+f4jscXHprDg==
ARC-Authentication-Results: i=1;
	rspamd-8f47468b4-hhzfn;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Spill-Quick: 27a9d54c52882f51_1772819605971_1261802917
X-MC-Loop-Signature: 1772819605971:2552928646
X-MC-Ingress-Time: 1772819605971
Received: from pdx1-sub0-mail-a222.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.110.84.91 (trex/7.1.3);
	Fri, 06 Mar 2026 17:53:25 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a222.dreamhost.com (Postfix) with ESMTPSA id 4fSDXh5pJFz2S;
	Fri,  6 Mar 2026 09:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1772819605;
	bh=j0oc61eR8qNzjjiZfUb+Q2zxjX/C9DoE2kBmkZ7xNs0=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=Ut/mDxbRfZO3NsIr+SjGvGBLiO2d7NSLLwUjWoc/9SbwP34TMdUYfSZ+eFHJcrbPc
	 nupNtB/x2M11UIWbN4B4dsfG17piiX3eCcChKqDuVMZY86DWs7cSYcGgtuPeTJQQ06
	 BIl4g1sS1APpA2CyXXwSXxd1rkMsc2ABCIvhJQd3TOTUUQ/4XNcz+TGDBi2jItUg+C
	 CTjgdD3SpOeRatIicPUV8YAGPwxT0CY/C5G9v3vUixBY8D8exGWITqI/rmYCaLpqz5
	 v5RTpNntM0RQqfSR3QpQ0XVhFYOGRBScMyetqLSt1sevNNpMLtPNr7fLr++F49gM1N
	 BXnmVB4HeocTw==
Date: Fri, 6 Mar 2026 09:53:21 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v2] selftests/futex: Compile also on libnuma < 2.0.16
Message-ID: <20260306175321.gr34uo6a7cdolohp@offworld>
References: <202507150858.bedaf012-lkp@intel.com>
 <20250715075735.tdXLHcEA@linutronix.de>
 <20250715095203.vVbUIvob@linutronix.de>
 <87h5z5tq51.ffs@tglx>
 <20250818135458.F352St6W@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250818135458.F352St6W@linutronix.de>
User-Agent: NeoMutt/20220429

On Mon, 18 Aug 2025, Sebastian Andrzej Siewior wrote:

>After using numa_set_mempolicy_home_node() the test fails to compile on
>systems with libnuma library versioned lower than 2.0.16.

I am running into this problem with 2.0.16 (Debian), and looking at the
numactl source (https://github.com/numactl/numactl) this should be bumped up.

$ git describe --contains 8f2ffc89654c
v2.0.18~5

Thanks,
Davidlohr
