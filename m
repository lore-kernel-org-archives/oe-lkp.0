Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF577C
	for <oe-lkp@lists.linux.dev>; Tue, 24 Jan 2023 13:10:20 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8301167373; Tue, 24 Jan 2023 14:10:10 +0100 (CET)
Date: Tue, 24 Jan 2023 14:10:10 +0100
From: Christoph Hellwig <hch@lst.de>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [hch-misc:btrfs-bio-split] [btrfs]  b7c9bcdc17:
 BUG:KASAN:use-after-free_in__blk_bios_map_sg
Message-ID: <20230124131010.GA23384@lst.de>
References: <202301171441.da2e9d11-oliver.sang@intel.com> <20230117082042.GA19116@lst.de> <Y8adDdqXX6ptkU7X@xsang-OptiPlex-9020> <20230119151044.GA28290@lst.de> <Y8/UJODqtDfOqPGw@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8/UJODqtDfOqPGw@xsang-OptiPlex-9020>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jan 24, 2023 at 08:50:44PM +0800, Oliver Sang wrote:
> hi, Christoph Hellwig,
> 
> sorry for late, we are in holidays now.


Oh right, happy new year!

> made a test upon
>   9ed690478287 (btrfs-bio-split) iomap: remove IOMAP_F_ZONE_APPEND
> several days ago, I just checked the results, found the issue gone.
> 
> however, I noticed the branch update again,
>   e304306c2534 (btrfs-bio-split) iomap: remove IOMAP_F_ZONE_APPEND

This is fixes typos in the commit log, not need to retest.

Thanks a lot!
