Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCBD2F2376
	for <oe-lkp@lists.linux.dev>; Wed, 16 Jul 2025 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661374; cv=none; b=U6vwwhlbR0kHwaLO+gGCmAjtwA5huGjo2UNRJi7SxDduN1bCLHdn7iZwddHqMvAOQoZcbQ2vgt5lG4ce8GtS+oDyEz/jtAcpgKjIJsQPD3Cm75giH7FxHc5HWOqSrrNg0R+GO7TF/4Y2on5m2BgmXBQcfeA9JeAGOgjxfNDHTeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661374; c=relaxed/simple;
	bh=mh4QN/pQI8kv3T84L7WPM6VYt2X8kdwZCZyulfwsxss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8oT54IBQ1516oPZsaZpDc2+rSCCFSi7CR33Mu9wY/xxJuFZhKcIlAaCb2CtGuTNA8UF7Z9xpGp7ESqaFL3oG3f6dmZdMCx5NgdBus9RWdxKhLCzjM0glTE8LdSqZAvPtrbxZ0PVojCRTWWE3J3Ar7XGEm2OLQOuKptm0B4YUbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=hiy6i1Fn; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="hiy6i1Fn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QcNL6cD8KQj1v/iL+HcqTkKaCpbv0HKfajEd5M3kwPk=; b=hiy6i1FnXYMWk02NJ7l1xLyPSy
	b7shScuOn+gkERtxYratiyycSCkll2yGG0EzorTQNa0pO4/jHXWhb2mPs5F3mB9iYRmM+bzELuqE8
	HMLS8mtPMopIvAkIl/E2o/81QdHMNK3tOezVwYmTbBALi9Daf+hFD3MUQaMn78Yw3ETclBQUsXzL9
	ARTxy4dqCZniuv8DzmlvL6KLb2llwuQ7qoIp5ayOtGYLL1XlSXVvc5gyXnSIqUP6kRMMhtQnjNQuq
	JDvD3pwC1f7NNWmtJ4/06AztUp2OKnEW95iJLdbV9tSMxsmomTr7atftAst59oZ+4H2sHPlPqlEIh
	pGtvZS5g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzHj-00000008eIQ-0ho4;
	Wed, 16 Jul 2025 10:22:47 +0000
Date: Wed, 16 Jul 2025 11:22:47 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	xudong.hao@intel.com
Subject: Re: [linux-next:master] [vmscan]  a7694ff11a:
 kernel-selftests.kvm.access_tracking_perf_test.fail
Message-ID: <20250716102247.GB2580412@ZenIV>
References: <202507160818.49e37313-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507160818.49e37313-lkp@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Jul 16, 2025 at 03:54:05PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "kernel-selftests.kvm.access_tracking_perf_test.fail" on:
> 
> commit: a7694ff11aa9d97d0f690351a964544849e5158d ("vmscan: don't bother with debugfs_real_fops()")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 0be23810e32e6d0a17df7c0ebad895ba2c210fc4]

Argh...  See https://lore.kernel.org/all/20250704040720.GP1880847@ZenIV/

Sorry, hadn't checked if the updated variant got picked ;-/
