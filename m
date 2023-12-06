Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85583FE3B
	for <oe-lkp@lists.linux.dev>; Wed,  6 Dec 2023 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="X6DS6PPs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5dmrx+kXgIEA9YxPOQGb71TyZLHanbUoyqAA5xUszMY=; b=X6DS6PPse8auvYOXoLvcQYPwlX
	j9pFaOyxqtA28eM2a4fye5mmpf7GapqvoG92FLEJDHZmEb56IHpadnV2cNEuWFXIIQ2yjWe1Tta9A
	Bt/mYkcLOXFmNnczrTRwoNoBChSTK6ZMlGXwQx1Cc7XNICU9HDPUCr65saHDK6xhDomZHF6hI9SrZ
	PgyiCczP4/gbDXD3e0ms8nUOBDYNMBdStFgu5R5e8RiX8Xj8likf4YQZb24PLu1m3sdYxHiXjZXur
	fRrKLdfi8mJQLqxcNCJ3ASY0243nCcXc9mlMr/xPZS16ll35aZwcW6JXomMgKWvXUd0wYVfT3Nn8P
	JX6RyBJQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rAv1N-007qBx-2E;
	Wed, 06 Dec 2023 16:45:13 +0000
Date: Wed, 6 Dec 2023 16:45:13 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>, linux-doc@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [viro-vfs:work.dcache2] [__dentry_kill()]  1b738f196e:
 stress-ng.sysinfo.ops_per_sec -27.2% regression
Message-ID: <20231206164513.GO1674809@ZenIV>
References: <20231201040951.GO38156@ZenIV>
 <20231201065602.GP38156@ZenIV>
 <20231201200446.GA1431056@ZenIV>
 <ZW3WKV9ut7aFteKS@xsang-OptiPlex-9020>
 <20231204195321.GA1674809@ZenIV>
 <ZW/fDxjXbU9CU0uz@xsang-OptiPlex-9020>
 <20231206054946.GM1674809@ZenIV>
 <ZXCLgJLy2b5LvfvS@xsang-OptiPlex-9020>
 <20231206161509.GN1674809@ZenIV>
 <20231206163010.445vjwmfwwvv65su@f>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206163010.445vjwmfwwvv65su@f>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Dec 06, 2023 at 05:30:10PM +0100, Mateusz Guzik wrote:

> > What the hell is going on?  Was ->d_lock on parent serving as a throttle and reducing
> > the access rate to something badly contended down the road?  I don't see anything
> > of that sort in the profile changes, though...

> Not an outlandish claim would be that after you stopped taking one of
> them, spinning went down and more traffic was put on locks which *can*
> put their consumers off cpu (and which *do* do it in this test).

That's about the only guess I've got (see above), but if that's the case, which lock would
that be?

> All that said I think it would help if these reports started including
> off cpu time (along with bt) at least for spawned threads.
