Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F084E0B69
	for <oe-lkp@lists.linux.dev>; Fri,  9 Oct 2026 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552516; cv=none; b=m0FLDwI4wRobfgnS+S0mTSDgqgUqXYcJp/Zt3Rt9Dlwqf0okWvjD9hoBkQEVJIJYKu5DP4So9frxl5Gt58+lhdLJCC5EFIPcPzXLvamxjvQCypgXonX/H319BJW9uu9Wbpm8PKgxpsFFwOZhQd6yNqvB+Pw2rLIWb0kuq1fpUZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552516; c=relaxed/simple;
	bh=y630XFwaVq8fqyb4CaFWQ5+Z6Dk7Xz9k+6pLUlhvk7Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=go+Swb2Qd4OtVloPkXGa0k3YqonlQfieLUjhP+y1YSGOmZU9p9fLpN2oMGQ8+RJN/ps5II6MWQ5XvtgQ8ehuc4VqX4JX617CUI+pc/RYNtMMUMQSz4zctL0PK87mwK22YtouquhlXINNxVnqeolRG9VUvcz9p7YcpI0IwPK0aRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AfWrqWv/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aQ/pDhQi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AfWrqWv/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aQ/pDhQi"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791552510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y630XFwaVq8fqyb4CaFWQ5+Z6Dk7Xz9k+6pLUlhvk7Y=;
	b=AfWrqWv/kn1V+yxFZkeyw+4kzga2Jzjxiu9Eb7MeWcC8SZ2EY+mtXAylyNebAksZZJMD/y
	udP4Ox/j5HME0NrDCc5TJw8M9q/SgeEUvC4XDF+SZvUDHPuc/ry66fdRqlOJ/+j50gAgdp
	+d04cuAQv9uWhQTs8Asc6v6T+IfcN/ffj11vLEf+UrFJRZg4GDcDdLTbe77tqmfgBo4SZz
	URrf3nrGDuevnmpAW/eLdL+zrhOj6TlkJzd4TrCiX2t3ELOqigLeJudDTx9dFtNL/O0f9y
	CQT+QY65CUiL40AoA3VqlMvNlLPjODgYKST2xtEXeUBUlGFTpH4b6OQbhQwS7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791552510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y630XFwaVq8fqyb4CaFWQ5+Z6Dk7Xz9k+6pLUlhvk7Y=;
	b=aQ/pDhQibbn93TFWmghqfNViH1ueOCkPYWijtlSSg+8AAYxVPmFzK1kGzB5DqKzH2BwJfN
	HWB5FsBgsXM1arAw==
To: Petr Mladek <pmladek@suse.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Oleg
 Nesterov <oleg@redhat.com>, Christian Brauner <brauner@kernel.org>,
 oe-lkp@lists.linux.dev, lkp@intel.com, linux-serial@vger.kernel.org,
 oliver.sang@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nbcon/reboot: Flush nbcon consoles synchronously on reboot
In-Reply-To: <asiu8orjDvRJMKuX@pathway.suse.cz>
References: <20261008150852.8286-1-pmladek@suse.com>
 <20261009065152.udyfFRHx@linutronix.de> <asiu8orjDvRJMKuX@pathway.suse.cz>
Date: Fri, 09 Oct 2026 15:34:30 +0206
Message-ID: <87qzhzxatd.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-09, Petr Mladek <pmladek@suse.com> wrote:
> Anyway, IMHO, we should switch to NBCON_PRIO_EMERGENCY for the post-running
> states and flush the pending messages immediately. It is more
> reliable. It is easy to find the locations when system_state() is set.
> And all follow-up printk() calls will try the direct flush so that
> they won't rely on an explicit flush.

We need to be careful about abusing CPU state in order to get certain
functionality. We already have things in place to gracefully switch to
atomic after shutting down the printing kthreads.

I will not have a chance to seriously look at this until I get back next
week. But at a quick glance, it looks like a roll of duct tape.

John
