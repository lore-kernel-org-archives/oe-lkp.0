Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481247;
	b=D4IYaRD0mPhhEHav7LQINU2jRrtdafKFxULjTu75XxRhcSg62bp9dIEoGyqnLbXjqHIg
	 2ClHYu5SDUXdEOlcGQJeg9Hi4oMLb4DpdROlSTkEP4GeLLJB0RsKEXsheYSkR9d1XCgdy
	 ForuzUH0Sc1EoQ6Kxa6Cjygj1xBSXUq5J03A6y2tbJPURi1EAgWWyXFQW0GdZ83H96GzT
	 urejCGiwKpo1nucCqqY5n3cEFCFPsRnG2STvQ2nZcLy7lNbyqHIe38XLD8jAVrFvk44Zw
	 FN0NdRDhnwmskiBBvrKNuG1pfWhBucc0v4GAXZPpiz1QnmpBBsGb5H2BPyfYkE5AlvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481247;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=PrXLJDelmAFq+PcVWJ3SeAWURdxR8J8op5bluDTDVvQ=;
	b=aAJ7R1swEJcZbCgi2PaeacJHjT/FA1zKecdjG5JoOkHAfwOugmPi2JXgtq1CFFQlHJgz
	 VxMkCG18oOToEstPojmoN6unLK7CdCMBiNRCm6xA3hiQm3LtfkPU7x6Z5/WNO12FxsT3I
	 M5JI5IVZzPMHJjtY7XKYFbu+KIyoN95GhsbFDd0rn2b7vLW0r3DZQAjZ9TxpOfr+K9NBD
	 hNCc71xSAFSMcrt6uLVY65aavQ5zyCO1+8stmf6ocrz6A5EtlR9WwAxCg8rbhgcyQiNbB
	 y/mnMXt8wArmQz8SLTRcrsH9GN6UEuJT2IE8p6PRAnd7eeB6InG8XY8G/O0AzxvEd6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dQc1Hi6e;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jObzmXEO;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91FD606A319
	for <oe-lkp@lists.linux.dev>; Tue, 20 Oct 2026 07:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91FD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dQc1Hi6e;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jObzmXEO
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792481239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PrXLJDelmAFq+PcVWJ3SeAWURdxR8J8op5bluDTDVvQ=;
	b=dQc1Hi6es9MiShPw48ttjleBfYDKGVRpIczwS40hi4EKL6pMgk5c/J+pvFzYNPpTysTSlw
	2y8pFYOnLkH/PR0qZzcTMblbZf9fdtg3BX08BFqbxv9UTQrioQuRfFq535winL9Hy5r+PK
	bEAJp2iEj1w6IQC6Jhi8PcgSNHwQnYXISdlXDnK3ALYd+gjE2DdtyGnLl9UPda6KXjOZ2J
	eUaX3yKjDp4gmabpaDECueh6uDemDr5cN8H6VYSaQtp12VgGaVBh0dQ3DFS2khKEZ8lm7j
	/DGpe6D9WWGcEffwvQQ8DGEPD6vKALMuhbamyz23s3JmIPDzqMzkfnNQtrTOTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792481239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PrXLJDelmAFq+PcVWJ3SeAWURdxR8J8op5bluDTDVvQ=;
	b=jObzmXEOva41jsNlTGca7FnmJXurCT47U0D9II8/YuC5vTPHN08PaC7SYYOc8JBEAfl56/
	p4uUjeMwO92C3aCQ==
To: kernel test robot <yi1.lai@intel.com>, Petr Mladek <pmladek@suse.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-serial@vger.kernel.org, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [linux-next:master] [serial]  d353934702:
 BUG:kernel_reboot-without-warning_in_test_stage
In-Reply-To: <atcLdg5RvEMnkzvJ@ly-workstation>
References: <202608061008.48a1e76e-lkp@intel.com>
 <87ecek1c8d.fsf@jogness.linutronix.de> <arPQwKbl7wM6IM3x@pathway.suse.cz>
 <atcLdg5RvEMnkzvJ@ly-workstation>
Date: Tue, 20 Oct 2026 09:33:18 +0206
Message-ID: <87fqy0de7d.fsf@jogness.linutronix.de>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-20, kernel test robot <yi1.lai@intel.com> wrote:
> Applied this fix on top of the commit d353934702. The
> kernel_reboot-without-warning issue cannot be reproduced.

Thank for testing.

Note that the 7.3 release includes commit d8e5fc300229 ("nbcon/reboot:
Switch NBCON consoles into the emergency mode in emergency_restart()"),
which also fixes the issue.

John
