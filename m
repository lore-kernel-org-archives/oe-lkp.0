Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FFD171D2
	for <oe-lkp@lists.linux.dev>; Fri, 22 Nov 2024 14:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732285690; cv=none; b=Ktw1gJo/mYjIaB88jxi8UsAmflCrmmewL8gtsC2xCS0tR4aj3hyVm1s2NSnj8b1kgLWhR3oHUfMt2WOBXUznlGWp82piuzoXbKH5Jt2EP0HMVX9oLHH4ljrPVFX5Q+x16DyccsZJz2vGK5GKFq8L+WeaIBmpY0hc/klTAPE/Agc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732285690; c=relaxed/simple;
	bh=Ff+UZyO/JMj9DISe2UePaOTQblPds44n39t8KwMbeqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyZ91s5Ps1WPGkE1XXCFA0LGnDRTF3UGr5iX9NSPRK5gHgdQyrz4OjHZFCveoPXRPCBa7VgMaY3yd7hewX+UAQ+irVJsOHGleV1KkoxRrarV2C7Kwv3M2oEqzLXbhdnIbyXddikADRedGXbcYZqQVQ2Cqp+1eEkFcv8PZAHeSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MtKeHHIm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rhbD7aIj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MtKeHHIm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rhbD7aIj"
Date: Fri, 22 Nov 2024 15:28:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732285686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g/PQb43MX+EV+Rlm4+ty7y06eu8hbzBoZm6Y4VLtEv4=;
	b=MtKeHHIm9VHY92ZpQyya0e1vdNmhTlkQmeTDwV+gUV4O+yfCNqZhOqz65jZjyrg1ZdbBAp
	AuJuotoiPLUV5KBKOa5Dj8ye3BZL/+4Sdu/l3aqtHipY5q19Q+7nZXEgIujAcL1ihKPzGu
	Ui3QHUlxM8FYla1Pohuin4+QMQsG7TRdD8vhKOVe4GyjNYyYoGJS4s/DvSKsuNL9MNtpLb
	8eYvG1gGRRnpkbroL7l6l/HRON58cPe5ATF8gUTzItd8hRSy6+FATfjMMJurPPUQGBmkR8
	9E1+bBvhkmw7J/y2medn3/+yX7x6EF54eeyW8pVQ3yNn+4JiFrK9wIM65DeQlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732285686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g/PQb43MX+EV+Rlm4+ty7y06eu8hbzBoZm6Y4VLtEv4=;
	b=rhbD7aIjM0vCtRns4Qvm6CwnmwS9g1he5tgJiJ14gdH4gbPbh27lHt99SZhPsuAoncrEST
	d9UwfJha20VDQaDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [RFC PATCH v3 5/9] futex: Track the futex hash bucket.
Message-ID: <20241122142804.7tGirPjt@linutronix.de>
References: <20241115172035.795842-6-bigeasy@linutronix.de>
 <202411221706.c9d399d3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202411221706.c9d399d3-lkp@intel.com>

On 2024-11-22 18:08:03 [+0800], kernel test robot wrote:
> Hello,
Hi,

> kernel test robot noticed "WARNING:at_lib/rcuref.c:#rcuref_put_slowpath" on:
> 
> commit: 85bef61dcb6b15e3f68893e8bb8178f38ef4e58d ("[RFC PATCH v3 5/9] futex: Track the futex hash bucket.")
> url: https://github.com/intel-lab-lkp/linux/commits/Sebastian-Andrzej-Siewior/futex-Create-helper-function-to-initialize-a-hash-slot/20241116-230708
> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 3b49a347d751553b1d1be69c8619ae2e85fdc28d
> patch link: https://lore.kernel.org/all/20241115172035.795842-6-bigeasy@linutronix.de/
> patch subject: [RFC PATCH v3 5/9] futex: Track the futex hash bucket.

thank you for the report. There is a missing init which has been made
visible by CONFIG_BASE_SMALL.

Sebastian
