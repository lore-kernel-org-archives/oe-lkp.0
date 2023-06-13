Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB9C136A
	for <oe-lkp@lists.linux.dev>; Tue, 13 Jun 2023 20:12:19 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686686575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VU+jdwZmPTfrzjd0/enC6H7nGe+HOQcMgB70lKmwgx8=;
	b=xXZ3mEPUjx0rIWDf1HLke99wDvwrPU/fzV1dV4B5kjMm3THv8UNCXcUsB1JviLZjpnPLt4
	YmPyiiJrNPlwLJo0LGBNLoJmwzEQU+GwHSztWm7V63and3MhZmNLjxXIG+wOeWX1rWH8tL
	XdFfB4O8tLN8c9z1orXgJVn8Oke/wVe8TPg1taBTmwz+creWCAQG5nVXvM2vGdVwZ8DirK
	IxjUHg55kcIsgV1Lvq/R5V8jGk1qdHllZgzpHYAtixIkrDNujs75zdK/rN67f9KkDZsccB
	KrVmjCem05zAFPTtDBJIkZeCltBKLzrv/48I8yHT6uC4X+ckwIhaEcqw3eNoOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686686575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VU+jdwZmPTfrzjd0/enC6H7nGe+HOQcMgB70lKmwgx8=;
	b=KSHFsO3FSu9JU+HUS6u0Dd/DRLV+DN+4FhugBE07I9DENvDmJZBLW8i9e15oxPc0d/mWsG
	tGkRo6F19HtPJ3Cw==
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, oliver.sang@intel.com, Anna-Maria
 Behnsen <anna-maria@linutronix.de>
Subject: Re: [tglx-devel:timers/pushpull] [timer]  8812eeb818:
 kernel-selftests.net.pmtu.sh.ipv6_cleanup_of_cached_exceptions_-_nexthop_objects.fail
In-Reply-To: <202306132111.c5d146bf-oliver.sang@intel.com>
References: <202306132111.c5d146bf-oliver.sang@intel.com>
Date: Tue, 13 Jun 2023 22:02:54 +0200
Message-ID: <87fs6v5dw1.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 13 2023 at 22:23, kernel test robot wrote:
> kind of hard for us to connect the code change with the test failure, so we
> run it more times, the issue doesn't always happen on this commit, but with
> a not small rate. at the same time, parent keeps clean.

Weird. We'll have look.

Thanks,

        tglx
