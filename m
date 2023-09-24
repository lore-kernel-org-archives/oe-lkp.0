Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B29654
	for <oe-lkp@lists.linux.dev>; Sun, 24 Sep 2023 10:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4142CC433C8;
	Sun, 24 Sep 2023 10:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695551440;
	bh=4b+v0jL8cZPOJtS/KSdvZ2Dmw74ePGjMhmS5Bo2Dw7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YvwodIrvH7IcGWXoRIjZwmKnnRMspG5tGG0lUoYcj2fq+kBkZqBWrtI1o141seFWT
	 oASXn3EyjLIvrwfD5PSpb4R3QwCj4r165mE/7EQb5bBwOJd7zftVtaF4QTYcp+R0zq
	 mVh6ur0SyWJzUDfPSjlgnqIlWTWqXgimEDW+/p0Z03JD6apa4b+64xv5C3Lib4202u
	 zqXe8qfkv7Ip1cZQ48cm5FlJjSUZntiu6xFcO6t7xvpp0tDqvNnrKvKRl27o6kmY3I
	 SIINivz5TwNZqdHkJQp/e4sFPBIhG4BFgT35W0lb9CpgOBrMp4LdwTZMPw2ZaJGHWd
	 Q/xEO667Tgfow==
Date: Sun, 24 Sep 2023 12:30:30 +0200
From: Christian Brauner <brauner@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Reuben Hawkins <reubenhwk@gmail.com>, amir73il@gmail.com,
	chrubis@suse.cz, mszeredi@redhat.com, lkp@intel.com,
	linux-fsdevel@vger.kernel.org, oliver.sang@intel.com,
	viro@zeniv.linux.org.uk, oe-lkp@lists.linux.dev, ltp@lists.linux.it,
	Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v3] vfs: fix readahead(2) on block devices
Message-ID: <20230924-umliegenden-qualifizieren-4d670d00e775@brauner>
References: <20230924050846.2263-1-reubenhwk@gmail.com>
 <ZQ/hGr+o61X1mik9@casper.infradead.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZQ/hGr+o61X1mik9@casper.infradead.org>

> This ad-hoc approach to testing syscalls is probably not the best idea.
> Have the LTP considered a more thorough approach where we have a central
> iterator that returns a file descriptor of various types (the ones listed
> above, plus block devices, and regular files), and individual syscall
> testcases can express whether this syscall should pass/fail for each type
> of fd?  That would give us one central place to add new fd types, and we
> wouldn't be relying on syzbot to try fds at random until something fails.
> 
> Or something.  I'm not an expert on the LTP or testing in general; it
> just feels like we could do better here.

I honestly would love to see such tests all go into xfstests. IOW,
general VFS and fs-specific tests should be in one location. That's why
I added src/vfs/ under xfstests. Having to run multiple test-suites for
one subsystem isn't ideal. I mean, I'm doing it but I don't love it...
