Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD75013700
	for <oe-lkp@lists.linux.dev>; Fri, 14 Jul 2023 11:52:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 01A3B2215C;
	Fri, 14 Jul 2023 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1689335573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8KDV1nJ5Jz4wRDhIKmz6NBTzJCSWRm0jEnj5bKK8jms=;
	b=RaI2ovdDvUPrEZfWKhoWhNZo8wczuah4soS9qZNmjNs4m77GOOhIkliWi0AW6JeIY2bpTl
	sS1XdU5o65Y83yhWiMvQHDPuT8pXn8OAcj/xhWpT2sCettpHZpXHdcAwUxw32zO95FET5+
	a7afrjnmliXMK10v/s4xRw7EosrSLdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1689335573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8KDV1nJ5Jz4wRDhIKmz6NBTzJCSWRm0jEnj5bKK8jms=;
	b=Xwjlf4wtU20I149ib7jAHqHYtFJHRAEQ7KLGUG/IqQ27Glob67oL5W1MoWY3aYVfy9nRQk
	tVWwL8O32q1ldDBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DBF04138F8;
	Fri, 14 Jul 2023 11:52:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id vwKmNRQ3sWT7PwAAMHmgww
	(envelope-from <chrubis@suse.cz>); Fri, 14 Jul 2023 11:52:52 +0000
Date: Fri, 14 Jul 2023 13:53:58 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Ilya Dryomov <idryomov@gmail.com>,
	Miklos Szeredi <mszeredi@redhat.com>, Chao Yu <chao@kernel.org>,
	oe-lkp@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Xiubo Li <xiubli@redhat.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	ltp@lists.linux.it, lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>,
	Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [LTP] [linus:master] [iomap] 219580eea1: ltp.writev07.fail
Message-ID: <ZLE3Vh5yHq_floF7@yuki>
References: <202307132107.2ce4ea2f-oliver.sang@intel.com>
 <20230713150923.GA28246@lst.de>
 <ZLAZn_SBmoIFG5F5@yuki>
 <CAASaF6xbgSf+X+SF8wLjFrsMA4=XxHti0SXDZQP1ZqdGYp4aUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAASaF6xbgSf+X+SF8wLjFrsMA4=XxHti0SXDZQP1ZqdGYp4aUQ@mail.gmail.com>

Hi!
> > > I can't reproduce this on current mainline.  Is this a robust failure
> > > or flapping test?  Especiall as the FAIL conditions look rather
> > > unrelated.
> 
> It's consistently reproducible for me on xfs with HEAD at:
> eb26cbb1a754 ("Merge tag 'platform-drivers-x86-v6.5-2' of
> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86")

Should be fixed by https://lore.kernel.org/linux-fsdevel/20230714085124.548920-1-hch@lst.de/T/#t

-- 
Cyril Hrubis
chrubis@suse.cz
