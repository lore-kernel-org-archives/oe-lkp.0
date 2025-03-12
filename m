Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBAAF9D6
	for <oe-lkp@lists.linux.dev>; Wed, 12 Mar 2025 05:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741756922; cv=none; b=JjnIiYQT6cekvdYHKH4uIn8t8OPjLJTLs6OK5r6T3BzJZ/0WVWEdrlV9K1qqSIWHX3hj2ZtV7s+JcdmzyBzqEVrP9f79jd3XpnD7YXOPe/ym3r4rd4FeERfDWgT2DPpjZcYPrXTRZSFeQWf2w/9ZQVjTRwKQw21GVpcLd1lKAwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741756922; c=relaxed/simple;
	bh=+UarTk2Wmk4BKhE4e0mZGuUq+ZHoPat8GnsIvaErEiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuw6TEcydnJS78vgWdBfwExgrV2NZEfxsBsRcC4RxYOhb4tmNL1qDZytKNV41oRASu19WpnZ6AWQ54+XR+nb9DxDg9ROv3339gGX9wuz++tZabWafXJE9w/1ZMejrd7BSQCNb0ducjZH6D9vQyqka56uB68a8aMpsOSQ27xfnCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id BFAD568AA6; Wed, 12 Mar 2025 06:21:55 +0100 (CET)
Date: Wed, 12 Mar 2025 06:21:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: liwang@redhat.com, brauner@kernel.org, hare@suse.de,
	willy@infradead.org, david@fromorbit.com, djwong@kernel.org,
	kbusch@kernel.org, john.g.garry@oracle.com, hch@lst.de,
	ritesh.list@gmail.com, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, ltp@lists.linux.it, lkp@intel.com,
	oliver.sang@intel.com, oe-lkp@lists.linux.dev, gost.dev@samsung.com,
	p.raghav@samsung.com, da.gomez@samsung.com, kernel@pankajraghav.com
Subject: Re: [PATCH] block: add BLK_FEAT_LBS to check for PAGE_SIZE limit
Message-ID: <20250312052155.GA11864@lst.de>
References: <20250312050028.1784117-1-mcgrof@kernel.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312050028.1784117-1-mcgrof@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Mar 11, 2025 at 10:00:28PM -0700, Luis Chamberlain wrote:
> We should take time to validate each block driver before enabling
> support for larger logical block sizes, so that those that didn't
> have support stay that way and don't need modifications.
> 
> Li Wang reported this as a regression on LTP via:
> 
> testcases/kernel/syscalls/ioctl/ioctl_loop06
> 
> Which uses the loopback driver to enable larger logical block sizes
> first with LOOP_CONFIGURE and then LOOP_SET_BLOCK_SIZE. While
> I see no reason why the loopback block driver can't support
> larger logical block sizes than PAGE_SIZE, leave this validation
> step as a secondary effort for each block driver.

This doesn't really make sense.  We don't want a flag that caps driver
controlled values at a arbitrary value (and then not used it at all in
the patch).

If you need extra per-driver validatation, do it in the driver.
