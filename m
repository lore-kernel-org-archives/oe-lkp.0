Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E14A19F137;
	Fri, 19 Dec 2025 23:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766187476; cv=none; b=bwFXYX1LQ2XWqoeEecJj7TTe4yBE4V+PeXB40rhXLzjYnLkVUM+x50VVPYeDDJLxeSzuX1h2esDS3bH73w4F7QeAnAfEeOeMcAX/y1cea7clMzoIkM9PQkOBAJ0DvXR3BY4GdmetUbonD6rll9HiF4JJdqt00t2Zxa+ge90av38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766187476; c=relaxed/simple;
	bh=a2mE4kTYj24K4sJLZJUc/P6K7hmjoaPpH/iReic98Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDbHOZvUObetLDQuFKJNQNJINC7Fxdp/S6lwudYt2ssWnxkPJegAjxTGcnGd0voCQ3/lyz1gBVs9UR3qyo023NpPl3MbprpsU0k68VxeEDUl+tmbV9usOVBA6GSZKdBCytjlAEnUnBQoBW0X/QanbwKiFJ6jNtg6w87Ak5QBrDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ooGrO/n+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ooGrO/n+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7iDiFa9C6BbQmq3eA90hwy/boYCk4vo9zcd1KlfWLIg=; b=ooGrO/n+PKzaq+plXioglWkC5B
	f0enapG8j3yHDRAH/dXfpWR92EkbWh/zKrKUI3itCreuFQhjay6EbjHMGRDlCbqk1m4fMAm+qec96
	MsDQon4BD32uHjjhXV1HgZN/TCDLSCDnIdIyzjJXsxx8IG5fX74Y7NQX+WzW2cNOrdHYdDKJjrSNT
	+jwmKsfrfve+jyGRqIeMdI5khflMH67fBlNHQXXtkpTRU8jbzlcGJCYMs3aby7Q85lLknTf/yzDvZ
	Ku4RC2HFpriodsYWXOMIOmx0sCX7XI240JFlw8vAmYVoHJSatdbZQ/6wnya+fe2k54TMFyVWJW8lu
	cZFd6qvQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWk2e-00000008JKw-0QQW;
	Fri, 19 Dec 2025 23:37:48 +0000
Date: Fri, 19 Dec 2025 23:37:47 +0000
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Vishal Moola <vishal.moola@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	Mel Gorman <mgorman@techsingularity.net>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [linus:master] [mm/vmalloc]  a061578043:
 BUG:spinlock_trylock_failure_on_UP_on_CPU
Message-ID: <aUXhy1Jyv7_GccIp@casper.infradead.org>
References: <202512101320.e2f2dd6f-lkp@intel.com>
 <aUW05pyc9nZkvY-1@casper.infradead.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUW05pyc9nZkvY-1@casper.infradead.org>

On Fri, Dec 19, 2025 at 08:26:14PM +0000, Matthew Wilcox wrote:
> Now, as I recall, we are very much doing this on purpose.  We decided
> not to disable interrupts at this point for improved interrupt
> latency, accepting the possibility that we'd occasionally fail
> the trylock.  Except on UP that's now an assertion failure.

This is stupid and wrong.  If we have CONFIG_SMP=n and
CONFIG_DEBUG_SPINLOCK=n, then trylock always succeeds.  And we'll end
up corrupting the data structure protected by the lock.  So the warning
is real, and we need to fix this.

With my distro hat on, I do not give two hoots.  We don't ship a nosmp
kernel.  I suspect all other distros (except maybe something targetting
m68k?) are in the same boat.
