Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95364C2C5
	for <oe-lkp@lists.linux.dev>; Mon, 17 Apr 2023 04:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1/d1KrR13aPuKkfnJcYIPRTTtHdfQb9/Y61SVwpj/6w=; b=lcrc0NGx3B1pqEPtUY354kRKI4
	w4L9WYnf4kuWbIrMPrxv8Mcu76n5Jb83exOjuM/a3GIAW8tyK93MNXsnWc9RIzPaIUvQ5AvFgP+0i
	4rMd3WIlfuNj+HAgRt8AznJcmYqw5wpg70ee1gZMVKaEQyAvZYCuSoDuEwO9QJOhoeuzEzhR7kQsY
	tIAoVIj0FvnSYDvPyo01LW45QInvf/jr9hEJTJPO5FEK6g47hOaj6omw0hPGZhuHB7T4eCvnsiiMs
	ge92ySpXdkiDUqRfuZ2OdKY+qquiCMDzbrQsI4GivwM5IPdYwCYGkOZZN+lRhyptmmG8E1bA5Kg+m
	J3axQtXw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1poGC5-00AvcK-3B; Mon, 17 Apr 2023 04:10:21 +0000
Date: Mon, 17 Apr 2023 05:10:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Hannes Reinecke <hare@suse.de>, oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-fsdevel@vger.kernel.org, Pankaj Raghav <p.raghav@samsung.com>,
	linux-kernel@vger.kernel.org, mcgrof@kernel.org
Subject: Re: [PATCH] mm/filemap: allocate folios according to the blocksize
Message-ID: <ZDzGrbXBUuITlxwI@casper.infradead.org>
References: <20230414134908.103932-1-hare@suse.de>
 <202304170945.28aa41a0-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202304170945.28aa41a0-oliver.sang@intel.com>

On Mon, Apr 17, 2023 at 10:18:37AM +0800, kernel test robot wrote:
> commit: 3f1c33c25c31221a7a27d302ce6aac8e9b71edbb ("[PATCH] mm/filemap: allocate folios according to the blocksize")

> [ 96.797305][ T3511] WARNING: CPU: 3 PID: 3511 at include/linux/pagemap.h:344 split_huge_page_to_list (include/linux/pagemap.h:344 mm/huge_memory.c:2767) 

Oh, funny.  That's:

        WARN_ON_ONCE(mapping_large_folio_support(mapping) == 0);

so it's found a large folio in a mapping which doesn't claim to support
large folios.  This is a good warning; thank you, bot!

> [   96.994758][ T3511] Call Trace:
> [   96.997888][ T3511]  <TASK>
> [ 97.016651][ T3511] truncate_inode_partial_folio (mm/truncate.c:243) 
> [ 97.022376][ T3511] truncate_inode_pages_range (mm/truncate.c:380) 
> [ 97.090958][ T3511] truncate_pagecache (mm/truncate.c:744) 
> [ 97.095638][ T3511] smb3_simple_falloc+0xcbf/0x1840 cifs

Ah, it's coming from smb/cifs.  I bet it's set i_blkbits to something
large.  Looks like we need to do something like I suggested to set the
minimum folio size in the mapping, rather than basing it on
mapping->host->i_blkbits.

