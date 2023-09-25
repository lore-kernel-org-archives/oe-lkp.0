Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36730D535
	for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 06:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZEtob3dGWmUdqYtxdIcAqD3Cg5IGSwmOErJgUcN7P4Q=; b=r5Zsc+NPr3ICwg8Qw5tsVRBvaI
	D7yJCMPGjNuPCWghaWw7nJ9YcnVHVxaW3JUqlpHlXZYt61VXGT52Yq7rhgK0IL8ds3pEV/ncblpew
	Ycom4vnQ9a2aNJ1qRba91BLkLqneG/vIbEGLaEOoN+IzXQgdPBXFd9wzPE2mJLU9oGrgydkOortA4
	hRg4II9S6S870VBFg5K0RfbgESl3SxTj1+39wOBBiSGY5GnywXpL41z8+CM3xtIvTK/bg8bucFE/Z
	rmf5JoJQ/RhiihJgMe8wd0Y35IEUaTK1jyt2VDIMnJmf9ysKVLtVKARfgG8VzRDCciuKM+dcX21YB
	8CgQBGPQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qkfIi-00HWdD-Q6; Mon, 25 Sep 2023 06:42:36 +0000
Date: Mon, 25 Sep 2023 07:42:36 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Reuben Hawkins <reubenhwk@gmail.com>
Cc: Amir Goldstein <amir73il@gmail.com>,
	kernel test robot <oliver.sang@intel.com>, brauner@kernel.org,
	Cyril Hrubis <chrubis@suse.cz>, mszeredi@redhat.com, lkp@intel.com,
	linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk,
	oe-lkp@lists.linux.dev, ltp@lists.linux.it, Jan Kara <jack@suse.cz>
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
Message-ID: <ZREr3M32aIPfdem7@casper.infradead.org>
References: <CAOQ4uxjnCdAeWe3W4mp=DwgL49Vwp_FVx4S_V33A3-JLtzJb-g@mail.gmail.com>
 <ZQ75JynY8Y2DqaHD@casper.infradead.org>
 <CAOQ4uxjOGqWFdS4rU8u9TuLMLJafqMUsQUD3ToY3L9bOsfGibg@mail.gmail.com>
 <CAD_8n+SNKww4VwLRsBdOg+aBc7pNzZhmW9TPcj9472_MjGhWyg@mail.gmail.com>
 <CAOQ4uxjM8YTA9DjT5nYW1RBZReLjtLV6ZS3LNOOrgCRQcR2F9A@mail.gmail.com>
 <CAOQ4uxjmyfKmOxP0MZQPfu8PL3KjLeC=HwgEACo21MJg-6rD7g@mail.gmail.com>
 <ZRBHSACF5NdZoQwx@casper.infradead.org>
 <CAOQ4uxjmoY_Pu_JiY9U1TAa=Tz1Mta3aH=wwn192GOfRuvLJQw@mail.gmail.com>
 <ZRCwjGSF//WUPohL@casper.infradead.org>
 <CAD_8n+SBo4EaU4-u+DaEFq3Bgii+vX0JobsqJV-4m+JjY9wq8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD_8n+SBo4EaU4-u+DaEFq3Bgii+vX0JobsqJV-4m+JjY9wq8w@mail.gmail.com>

On Sun, Sep 24, 2023 at 11:35:48PM -0500, Reuben Hawkins wrote:
> The v2 patch does NOT return ESPIPE on a socket.  It succeeds.
> 
> readahead01.c:54: TINFO: test_invalid_fd pipe
> readahead01.c:56: TFAIL: readahead(fd[0], 0, getpagesize()) expected
> EINVAL: ESPIPE (29)
> readahead01.c:60: TINFO: test_invalid_fd socket
> readahead01.c:62: TFAIL: readahead(fd[0], 0, getpagesize()) succeeded
> <-------here

Thanks!  I am of the view that this is wrong (although probably
harmless).  I suspect what happens is that we take the
'bdi == &noop_backing_dev_info' condition in generic_fadvise()
(since I don't see anywhere in net/ setting f_op->fadvise) and so
return 0 without doing any work.

The correct solution is probably your v2, combined with:

        inode = file_inode(file);
-       if (S_ISFIFO(inode->i_mode))
+       if (S_ISFIFO(inode->i_mode) || S_ISSOCK(inode->i_mode))
                return -ESPIPE;

in generic_fadvise(), but that then changes the return value from
posix_fadvise(), as I outlined in my previous email.  And I'm OK with
that, because I think it's what POSIX intended.  Amir may well disagree
;-)
