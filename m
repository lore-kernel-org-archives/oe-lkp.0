Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0772C134DD
	for <oe-lkp@lists.linux.dev>; Thu,  7 Sep 2023 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sahHJLKR0gWO9Jqax0jGwZPymMk13SUDsr+vxvyDSGA=; b=dkb/6rWNqrXYRUMddXEfr1CqJk
	Y3HHMLPQy4pvnLiyZXDgFB/qcuYBtnpn77lW8AMT1c2SlOs2rLvpb8cOqxt/Vd/vcle9nJr7YJplI
	vJDG+fD2Wi+oFfZ8kTLSyqDRn9bPmEhYytPdi9oacg5WBsOJmpKaUKHlgPIUOFPBw3rrT3Wq/OafK
	QGkVlVCZPCzq+i8m0J09VX6OYTJ1OB5MixvC44c6W+18ziWe1rHRDYWVZlbBonbyHIMSEaSwFq6wu
	dQj7gppadmAujDNyHQFi/WzN/UpHPi0BlV6WnV2E62wjkCD64ucOiZa7f5qbhL5Ns7keCln5Q2J6C
	+BBnjv9Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qeJYS-00CdbN-BT; Thu, 07 Sep 2023 18:16:36 +0000
Date: Thu, 7 Sep 2023 19:16:36 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Peng Zhang <zhangpeng.00@bytedance.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, maple-tree@lists.infradead.org, linux-mm@kvack.org,
	corbet@lwn.net, akpm@linux-foundation.org, brauner@kernel.org,
	surenb@google.com, michael.christie@oracle.com,
	peterz@infradead.org, mathieu.desnoyers@efficios.com,
	npiggin@gmail.com, avagin@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] maple_tree: Update check_forking() and
 bench_forking()
Message-ID: <ZPoThAU9zoW2q/YR@casper.infradead.org>
References: <202308312115.cad34fed-oliver.sang@intel.com>
 <0e9a87d9-410f-a906-e95c-976a141f24f0@bytedance.com>
 <20230907180301.lms4ihtwfuwj7bkb@revolver>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907180301.lms4ihtwfuwj7bkb@revolver>

On Thu, Sep 07, 2023 at 02:03:01PM -0400, Liam R. Howlett wrote:
> > >  WARNING: possible recursive locking detected
> > >  6.5.0-rc4-00632-g2730245bd6b1 #1 Tainted: G                TN
> > >  --------------------------------------------
> > >  swapper/1 is trying to acquire lock:
> > > ffffffff86485058 (&mt->ma_lock){+.+.}-{2:2}, at: check_forking (include/linux/spinlock.h:? lib/test_maple_tree.c:1854)
> > > 
> > >  but task is already holding lock:
> > >  ffff888110847a30 (&mt->ma_lock){+.+.}-{2:2}, at: check_forking (include/linux/spinlock.h:351 lib/test_maple_tree.c:1854)
> > Thanks for the test. I checked that these are two different locks, why
> > is this warning reported? Did I miss something?
> 
> I don't think you can nest spinlocks like this.  In my previous test I
> avoided nesting, but in your case we cannot avoid having both locks at
> the same time.
> 
> You can get around this by using an rwsemaphore, set the two trees as
> external and use down_write_nested(&lock2, SINGLE_DEPTH_NESTING) like
> the real fork.  Basically, switch the locking to exactly what fork does.

spin_lock_nested() exists.

You should probably both read through
Documentation/locking/lockdep-design.rst It's not the best user
documentation in the world, but it's what we have.
