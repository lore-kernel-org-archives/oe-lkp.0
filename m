Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463B21170E
	for <oe-lkp@lists.linux.dev>; Fri,  1 Dec 2023 04:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="Yi44Mdno"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2eHCtyGFeHq/1tIF1Jd0bNN81hKLOiwuQegOxUiD9H8=; b=Yi44Mdno5Jfc8Un+WKQBaikx++
	SyMfPnZ927vBHrPWV1pQXZ+RQ+G3DvHKjM+M9/+HDph0ZlKXQqonkZ0jciPBH6ntkt4aIMz6Cr11s
	gb/DGtSJJ5EQxE8vcUjmGf+ylvDAWZDHvMfl4qcdakuvmVLutud/JHD1d+eEwvCJRdSdVImS5kv1w
	qsE0IwrHGwwnqnKoG7nt6LastrGAx61KMGgwDh22eRm1Hlx7hT1oII5GyFbev3zs/RdnKlrmKm5F3
	b/iuJKV9Bw60H6+lm9vr8O15+F66DeL3bERw7X3YxXXxr7k3uJVhxNbQIlu1AmFf7jvc0m+nTTB5J
	gRZ6/+Kw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r8uqd-005gh0-1X;
	Fri, 01 Dec 2023 04:09:51 +0000
Date: Fri, 1 Dec 2023 04:09:51 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>, linux-doc@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [viro-vfs:work.dcache2] [__dentry_kill()]  1b738f196e:
 stress-ng.sysinfo.ops_per_sec -27.2% regression
Message-ID: <20231201040951.GO38156@ZenIV>
References: <202311300906.1f989fa8-oliver.sang@intel.com>
 <20231130075535.GN38156@ZenIV>
 <ZWlBNSblpWghkJyW@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWlBNSblpWghkJyW@xsang-OptiPlex-9020>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Fri, Dec 01, 2023 at 10:13:09AM +0800, Oliver Sang wrote:

> > Very interesting...  Out of curiosity, what effect would the following
> > have on top of 1b738f196e?
> 
> I applied the patch upon 1b738f196e (as below fec356fd0c), but seems less
> useful.

I would be rather surprised if it fixed anything; it's just that 1b738f196e
changes two things - locking rules for __dentry_kill() and, in some cases,
the order of dentry eviction in shrink_dentry_list().  That delta on top of
it restores the original order in shrink_dentry_list(), leaving pretty much
the changes in lock_for_kill()/dput()/__dentry_kill().

Interesting...  Looks like there are serious changes in context switch
frequencies, but I don't see where could that have come from...
