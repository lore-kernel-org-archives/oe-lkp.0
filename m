Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25B515AD90
	for <oe-lkp@lists.linux.dev>; Wed, 24 Jul 2024 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721832274; cv=none; b=kTeDs5BijqDy3rkh9hUgS8OqcI2WpM7Wrv+imSp39JL/AMwkQLv52pOtAVS9pmjmgBieM8GPI2PBn8Zl+x3P/RmKBZl4r7WxfioPpNBAPZx5Km9HhjjoFpGJ+ojr6j4SAqiAbUdjPJi1aWygV8LFIgWl4D2vO9OeXS2n2co90HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721832274; c=relaxed/simple;
	bh=2W+X7rReYYHDwotbpEc9K6VqaJNHm7qzM6slsS4Qs3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubBGuMVzYj+FUtrgxaSnoDET1HbMmbnNLCUFq+UXJZ91CWb0huXdB/bpHNvmrltEO0TnRQA3z/Lj7r1tDa0ddPMk0FtCJHbbz1sMtL9YWEGAuYLOOvklH0RNsYGBlrGeH39SAU7tJevZLYD7p8sglm1QEic0drprhSu1Fh+8TYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3411C68CFE; Wed, 24 Jul 2024 16:44:22 +0200 (CEST)
Date: Wed, 24 Jul 2024 16:44:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Anna Schumaker <Anna.Schumaker@netapp.com>,
	Christoph Hellwig <hch@lst.de>,
	Shaun Tancheff <shaun.tancheff@hpe.com>,
	Sagi Grimberg <sagi@grimberg.me>, linux-fsdevel@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linus:master] [filemap]  9aac777aaf:
 phoronix-test-suite.iozone.1MB.512MB.WritePerformance.mb_s -14.0%
 regression
Message-ID: <20240724144422.GA13505@lst.de>
References: <202407242232.9109947e-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407242232.9109947e-oliver.sang@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jul 24, 2024 at 10:40:33PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a -14.0% regression of phoronix-test-suite.iozone.1MB.512MB.WritePerformance.mb_s on:
> 
> 
> commit: 9aac777aaf9459786bc8463e6cbfc7e7e1abd1f9 ("filemap: Convert generic_perform_write() to support large folios")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

This is really weird as it shouldn't make a different for file systems
not using large folios.  What file system is this test run with?

