Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C773A30F81F
	for <oe-lkp@lists.linux.dev>; Thu, 28 Aug 2025 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756391664; cv=none; b=d9EF3Nblg/Xo1tL93OIt/bvnGAZ4mauRAfWd0GMXtqC8Ewy7nKIXVW3iQ+ekGLvDQDVdKUVHOmaIkYiGxgWPKXV4waftqFcMvNqqRn2+SCSqnO9Tr/exJc/jZsfQSsgkh4DGyOA5HjWiXksqZJShNmYOMXnHkAdc4Y9iC37Cpiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756391664; c=relaxed/simple;
	bh=AugeI6+ziOCwr9Df6fzxmSacZoIPicP3QCTXwXZuWAM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FJu/c9smE4VbKl1vS/6KiCqnSoLbaba7X+QeUiEMRkjQKR9Ly3tR5rHee65EQR5RlvvFJs2QHiKRsvGCAxTnxz7uY9zvbEVVp5FvXc5AXAAQzlUrbVWwSn45HsGCWfICAkkhTohXMP8lqsXVZTD+73WFrqWhwQSdcypRyjJBvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 9D38357855;
	Thu, 28 Aug 2025 14:34:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 944D32000E;
	Thu, 28 Aug 2025 14:34:13 +0000 (UTC)
Date: Thu, 28 Aug 2025 10:34:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, oe-lkp@lists.linux.dev, kernel
 test robot <oliver.sang@intel.com>, lkp@intel.com, Menglong Dong
 <dongml2@chinatelecom.cn>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [tracing] dfe0d675df:
 WARNING:suspicious_RCU_usage
Message-ID: <20250828103433.1498f8a7@gandalf.local.home>
In-Reply-To: <CADxym3aHUDGahE1S2LzaDZA4vZP637txcMzQR3_r1U00GikEUA@mail.gmail.com>
References: <202508281655.54c87330-lkp@intel.com>
	<CADxym3aHUDGahE1S2LzaDZA4vZP637txcMzQR3_r1U00GikEUA@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ahbtabrr5y9y7eoyyyxjjhgzdeie95as
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 944D32000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18M9Z1qc+/JGkwBdv/P8HI02lfqXlwoh3o=
X-HE-Tag: 1756391653-237669
X-HE-Meta: U2FsdGVkX18Z08jeiwfzhl9wzzBjpYaCscixD6Ujj0Usn5sSYw8XS70FdLMq/6cqP198xPLmk3tsGA4BKBs8VmoOHnOXB4N2/82x7B7bRzRMINtPVXeZdcNhtRVdT8kRmMq3Dl95Qe7e7g/Z+eQ58E8w+HnzH1utgUzrtZXj0D6m+T0WV1mDVrjEYH4b/+CoE7LdLpT4IofYPI1kKOazQgwMPTLRIVuNl++kQ6/qH8ja6xzHxNpq5qQDKJLmcQvkRsaxfjEI8b9ZFTzLFsGCYMgO9//ac2sPG/AHsk316xr0HQ0ogAb8RW4Hg8AIIk/KzoW0QB78cglbHgnqD2oQQdkY8xXOCebV

On Thu, 28 Aug 2025 17:09:35 +0800
Menglong Dong <menglong8.dong@gmail.com> wrote:

> > [  354.955971][ T4652]  dump_stack_lvl+0x7c/0x90
> > [  354.955978][ T4652]  lockdep_rcu_suspicious+0x14f/0x1c0
> > [  354.955987][ T4652]  __rhashtable_lookup+0x1e0/0x260  
> 
> rcu_read_lock() is not needed in fprobe_entry, but
> rcu_dereference_check() is used in rhltable_lookup(), which
> causes this warning.

Why is rcu_read_lock() not needed in fprobe_entry()?

-- Steve

> 
> Adding rcu_read_lock() here is able to suppress this warning.
> Maybe we need only rcu_lock_acquire(&rcu_lock_map) here,
> but it's not a common usage. What do you think, Masami?

