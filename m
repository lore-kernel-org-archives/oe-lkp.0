Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA786156CF
	for <oe-lkp@lists.linux.dev>; Mon, 13 Nov 2023 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="FH4tdHPp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n0dF/KImuUfqO+ho6H93rcChliDgFQwB8pT5k26MKJ0=; b=FH4tdHPp873Yaht9X5famvrhgm
	6b1WarI1B+f3wDpw3YZxAUFaZFYM7yVKOh8pKJju8LXcJ2bBCrqqrYDFnzelaiwuMCw8tllcIKecd
	mWRUWFLNfnFERxU9FM3NPDID25acb03o/3Ye0DtC5mMApOLU/6ScpMrTUZS6iXaviO5lYLBrvQSdX
	687xd+Ib93z2JBS0ouUReSbx+h/DDUUzpmQGeOtyr/y07Omjq9AUxmI9WhQLbxnrM5vPcCZs/51+q
	8Sx9DJeSynsOtxd5hSgvotyxN1yjaLIIHnsNYBTEoaL8cDc3MlzM0lRLLZ1Pa0n+ZNIzJCkEVOisT
	EBEKfEvw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Ry6-00FALE-2V;
	Mon, 13 Nov 2023 08:06:50 +0000
Date: Mon, 13 Nov 2023 08:06:50 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [viro-vfs:work.dcache2] [__dentry_kill()] 01b17d53ce:
 WARNING:possible_recursive_locking_detected
Message-ID: <20231113080650.GQ1957730@ZenIV>
References: <202311131520.ff2c101e-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311131520.ff2c101e-oliver.sang@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Nov 13, 2023 at 03:59:04PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "WARNING:possible_recursive_locking_detected" on:
> 
> commit: 01b17d53ce197777be701269395edba2fe27069a ("__dentry_kill(): new locking scheme")
> https://git.kernel.org/cgit/linux/kernel/git/viro/vfs.git work.dcache2

*shrug*

False positive, and yes, it needs the spin_lock_nested() when taking
->d_lock on victim after having just acquired it on the parent.
