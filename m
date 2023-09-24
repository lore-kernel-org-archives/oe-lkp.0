Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11488DF64
	for <oe-lkp@lists.linux.dev>; Sun, 24 Sep 2023 21:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t0dWRs0AcgJslUYwJm+3ICfi/SDNmg7iKfq/0Kh1WAc=; b=hj/JQqXGV4LZ1Z56d6uW9HOEmC
	h2nSL/RQeHQdmbLgcsXYyTTIhfVpUfzo0RSpfO8Qy/0NaJMG5mUjzTQXFsRcpa2iHCgFB2OxKpjrf
	mEnjzJQUAfWuhgE/E6fYv1IYmk5xyimJpfVJnJzRrj4la+FwJFrZSJqMqV3oLI29NO6Ed42pxpVxk
	RGtSU8OgA6Fdn0hlSTypKCnmQBXDzEnOZAXEzOuAopSjNtIVXQ4l+zFIHGWdPTxzwXIQ7RBLEm5GE
	YwZl9gqhnzKo36mTX6VfjbwharVBeq53EXWAJVI5OWxPQwVTk7qIf8XPDeed+smEANcyzcxih4nzL
	JlLG2VSQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qkX5Y-00FGVf-Mo; Sun, 24 Sep 2023 21:56:28 +0000
Date: Sun, 24 Sep 2023 22:56:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>,
	Reuben Hawkins <reubenhwk@gmail.com>, brauner@kernel.org,
	Cyril Hrubis <chrubis@suse.cz>, mszeredi@redhat.com, lkp@intel.com,
	linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk,
	oe-lkp@lists.linux.dev, ltp@lists.linux.it, Jan Kara <jack@suse.cz>
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
Message-ID: <ZRCwjGSF//WUPohL@casper.infradead.org>
References: <ZQ1Z_JHMPE3hrzv5@yuki>
 <CAD_8n+ShV=HJuk5v-JeYU1f+MAq1nDz9GqVmbfK9NpNThRjzSg@mail.gmail.com>
 <CAOQ4uxjnCdAeWe3W4mp=DwgL49Vwp_FVx4S_V33A3-JLtzJb-g@mail.gmail.com>
 <ZQ75JynY8Y2DqaHD@casper.infradead.org>
 <CAOQ4uxjOGqWFdS4rU8u9TuLMLJafqMUsQUD3ToY3L9bOsfGibg@mail.gmail.com>
 <CAD_8n+SNKww4VwLRsBdOg+aBc7pNzZhmW9TPcj9472_MjGhWyg@mail.gmail.com>
 <CAOQ4uxjM8YTA9DjT5nYW1RBZReLjtLV6ZS3LNOOrgCRQcR2F9A@mail.gmail.com>
 <CAOQ4uxjmyfKmOxP0MZQPfu8PL3KjLeC=HwgEACo21MJg-6rD7g@mail.gmail.com>
 <ZRBHSACF5NdZoQwx@casper.infradead.org>
 <CAOQ4uxjmoY_Pu_JiY9U1TAa=Tz1Mta3aH=wwn192GOfRuvLJQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxjmoY_Pu_JiY9U1TAa=Tz1Mta3aH=wwn192GOfRuvLJQw@mail.gmail.com>

On Sun, Sep 24, 2023 at 06:32:30PM +0300, Amir Goldstein wrote:
> On Sun, Sep 24, 2023 at 5:27 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Sun, Sep 24, 2023 at 02:47:42PM +0300, Amir Goldstein wrote:
> > > Since you joined the discussion, you have the opportunity to agree or
> > > disagree with our decision to change readahead() to ESPIPE.
> > > Judging  by your citing of lseek and posix_fadvise standard,
> > > I assume that you will be on board?
> >
> > I'm fine with returning ESPIPE (it's like ENOTTY in a sense).  but
> > that's not what kbuild reported:
> 
> kbuild report is from v1 patch that was posted to the list
> this is not the patch (v2) that is applied to vfs.misc
> and has been in linux-next for a few days.

Ah!  I was confused.

> > I think that should
> > also return ESPIPE.  I think posix_fadvise() should return ESPIPE on a
> > socket too, but reporting bugs to the Austin Group seems quite painful.
> > Perhaps somebody has been through this process and can do that for us?
> 
> This is Reuben's first kernel patch.
> Let's agree that changing the standard of posix_fadvise() for socket is
> beyond the scope of his contribution :)

Thank you for shepherding his first contribution.  Unfortunately, this
is rather the way of it when you start to pick at something ... you find
more things that are broken.  It's rather unusual that this one turned
out to be "The POSIX spec has a defect" ;-)

But yes, I'm content with v2 if v2 does in fact return ESPIPE for
readahead() on a socket.  Let's wait to find out.  We can address the
POSIX defect later.
