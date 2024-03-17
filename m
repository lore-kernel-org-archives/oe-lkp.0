Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECB0A2A
	for <oe-lkp@lists.linux.dev>; Sun, 17 Mar 2024 20:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710707812; cv=none; b=V7Cc4UX/Zl21vSQ85Hw+ulf7A9yY4XDH67NVIaxEI4ON2XCzGc3JuFcUmP9j349JMFMzkQAZB6mkaVmL0VaxvFelpn9ikkAT69Q8a4hmT7LmJSBkZocuHZVbsjUXXNCxvs89SD/W+TcFj4Zp0MHKlMjZrv60HySanctXwknhOQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710707812; c=relaxed/simple;
	bh=Mf2qW8qx1VFkY6exzuZ/MhBPqsKo8S6DE2T7Zs6/dsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbbSLYc+q/Xoi602wGCywWAMHyZE7+zcLXBD+Kn8toR/l07f0Q/GJPGTSH7df9EyKV83Rgn6wvW2bHhknCBFSf671SFwOzjyOkKj6UDX6j6+c+FwV33VK3azaaTemPvivfUj07AW0X2nyOfhecZTCUAxU+hetQ/DdIoU+ygTdE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A530668C7B; Sun, 17 Mar 2024 21:36:45 +0100 (CET)
Date: Sun, 17 Mar 2024 21:36:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-kernel@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
	Max Gurtovoy <mgurtovoy@nvidia.com>, linux-nvme@lists.infradead.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linus:master] [nvme]  63dfa10043:  fsmark.files_per_sec 6.4%
 improvement
Message-ID: <20240317203645.GB5975@lst.de>
References: <202403151552.e3809b61-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403151552.e3809b61-oliver.sang@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Mar 15, 2024 at 04:21:13PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 6.4% improvement of fsmark.files_per_sec on:
> 
> 
> commit: 63dfa1004322d596417f23da43cdc43cf6298c71 ("nvme: move NVME_QUIRK_DEALLOCATE_ZEROES out of nvme_config_discard")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> testcase: fsmark
> test machine: 96 threads 2 sockets Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz (Cascade Lake) with 128G memory
> parameters:

That is kinda odd and unexpected.  Is this system using one of the old
Intel SSDs that this quirk is actually used for?

