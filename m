Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B5C49F82
	for <oe-lkp@lists.linux.dev>; Wed,  6 Dec 2023 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="iXqyrWov"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8B0zV/poM1+6RJnq4neUyRen0Ru3/1wbuZ2eoYNBfro=; b=iXqyrWovcaJI4ejYTmnN+QfbAm
	pEHqcq06ZKFzvmFLBja3d23RsUGzH0WlpOGUBccZexn/yR5DVlx6AsqE6DbV9p9VIcupY/IO9OEVC
	LCUbY1gCHFZ909YVwK/lrLgFXSWeN/3zrntg59dxHBiWDoY2+Vcl7CGqPWH+hz6oBn4DbGwmGZm+9
	lL3U70Kffa+lNfpTAzEwq0WduF6i7kXrqPkUvNZP6cF/f/tlNlmT2KyccIv6ZdD+BO3ZzLVRG5FrT
	hXsPO6mV+6U+Oba77zrERqBFaRiINg9LqCMV1SKikLlCdbQ+5yBZ4Pm8w6vN2BWe3MUo3nCdNsRd4
	nzxIa9TA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvPK-007qni-0e;
	Wed, 06 Dec 2023 17:09:58 +0000
Date: Wed, 6 Dec 2023 17:09:58 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>, linux-doc@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [viro-vfs:work.dcache2] [__dentry_kill()] 1b738f196e:
 stress-ng.sysinfo.ops_per_sec -27.2% regression
Message-ID: <20231206170958.GP1674809@ZenIV>
References: <20231201065602.GP38156@ZenIV>
 <20231201200446.GA1431056@ZenIV>
 <ZW3WKV9ut7aFteKS@xsang-OptiPlex-9020>
 <20231204195321.GA1674809@ZenIV>
 <ZW/fDxjXbU9CU0uz@xsang-OptiPlex-9020>
 <20231206054946.GM1674809@ZenIV>
 <ZXCLgJLy2b5LvfvS@xsang-OptiPlex-9020>
 <20231206161509.GN1674809@ZenIV>
 <20231206163010.445vjwmfwwvv65su@f>
 <CAGudoHF-eXYYYStBWEGzgP8RGXG2+ER4ogdtndkgLWSaboQQwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGudoHF-eXYYYStBWEGzgP8RGXG2+ER4ogdtndkgLWSaboQQwA@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Dec 06, 2023 at 05:42:34PM +0100, Mateusz Guzik wrote:

> That is to say your patchset is probably an improvement, but this
> benchmark uses kernfs which is a total crapper, with code like this in
> kernfs_iop_permission:
> 
>         root = kernfs_root(kn);
> 
>         down_read(&root->kernfs_iattr_rwsem);
>         kernfs_refresh_inode(kn, inode);
>         ret = generic_permission(&nop_mnt_idmap, inode, mask);
>         up_read(&root->kernfs_iattr_rwsem);
> 
> 
> Maybe there is an easy way to dodge this, off hand I don't see one.

At a guess - seqcount on kernfs nodes, bumped on metadata changes
and a seqretry loop, not that this was the only problem with kernfs
scalability.

That might account for sysinfo side, but not the unixbench - no kernfs
locks mentioned there.  OTOH, we might be hitting the wall on
->i_rwsem with what it's doing...
