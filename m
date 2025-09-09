Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C14E340D9D
	for <oe-lkp@lists.linux.dev>; Tue,  9 Sep 2025 18:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757442345; cv=none; b=m5ZpvhXaQLOCJmfRMnnRrDvsIsrvF7P0v6pXSSaSMbydocdTe8UjVT0Q1y69OULCdRWdGnCjUEMISDGnWKkABwO4HZitAZLHAxfVjEc5Nsdo/6Hkhp+7p2l+tTFowkLhvngO7HOlmi/z3a0yRa9bHIofJTZZ5Z7saPBXt7iw2pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757442345; c=relaxed/simple;
	bh=eIKNDNgLFIalF+4+PviUC9PxDiakQCAY4E+2iTrbCMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnoNGtYHx1pUwh7NWAuMiffxoqi/Y8cZNNndV9MIvKv4684bM35iqW1Yw8WGdG29sHmopcQ2ppnZf5n/bSD0vSWaqD/6jkij+F7pHhbE5IwZxreBXnhISS/3aJx/5ZdukF9qDw77E0bzM7srrHgTNy5dKX2h4P2LK5SwlhQYBAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=u+zMQtbw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="u+zMQtbw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iTP+sQ/v8yOX9RD5/7FdnosJ/QlZJStJ/0fY9+7nICU=; b=u+zMQtbwe0gVNxDjV/04MycN3T
	OaZU+37vDdSWvllRylXLQ9f9EKgymHjaDq9x1RVqQloTesY95uYG63LW0m8nUj//S8r+9RqLerhc6
	YuGCfyQrWRflCYRkiH/uvZYPW9Zg8QKjn/glUJuD0Xo8vl4wMzFcXOtFAgJf8WkIy46bJyJC4VRyf
	ay7tyWLaQdEdzv5ZNlV/dzx/vJwyhaxXsCGW12lpaInXMBf99D5XjKYXeeFWHNzKh0Hs8+/yA/gjh
	XHSjB936bZdD+AfTXEwzle9/D4ZIRFwIpzIZezWNeTISTkLqd431Yy2cse/3aXiUd2m1GanNbp7h7
	AvgyKGdg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw32C-0000000CMVI-3QRW;
	Tue, 09 Sep 2025 18:25:40 +0000
Date: Tue, 9 Sep 2025 19:25:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [willy-pagecache:slab-future] [slab]  d7a6fafee0: RIP:__ksize
Message-ID: <aMBxJL8hCfeKvyPS@casper.infradead.org>
References: <202509022248.dbe9cc08-lkp@intel.com>
 <aLgp9QKJ8EMbBR3T@casper.infradead.org>
 <aLhFYcQtJYSWzxKw@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLhFYcQtJYSWzxKw@xsang-OptiPlex-9020>

On Wed, Sep 03, 2025 at 09:40:49PM +0800, Oliver Sang wrote:
> > Hi.  Do you have a log for this configuration without this patchset?
> > I believe it should hit this warning:
> 
> do you mean the dmesg from parent commit?
> (attach one as dmesg-c5bbf49e67ff44.xz which seems quite clean)
> 
> or a dmesg from below commit
> 
> 3cace99d63192a (tag: next-20250829,
> 
> which seems the base of this branch?
> 
> 6259b37f692a4f (willy-pagecache/slab-future) mm: Remove redundant test in validate_page_before_insert()
> 20f8e938ae667d slab: Remove references to folios from virt_to_slab()
> ...
> ab89f51ec71be2 slab: Remove unnecessary test from alloc_debug_processing()
> 3cace99d63192a (tag: next-20250829,
> 
> 
> but we didn't capure WARNING from 3cace99d63192a, but a random issue as below
> (dmesg is attached as dmesg-3cace99d63192a.xz)

Ah, the bug was not what I thought it was.  Thank you for providing the
reproducer; it was very useful.
