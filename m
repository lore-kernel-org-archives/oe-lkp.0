Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCBA1FB2
	for <oe-lkp@lists.linux.dev>; Tue, 17 Jan 2023 08:20:52 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C150F68D06; Tue, 17 Jan 2023 09:20:42 +0100 (CET)
Date: Tue, 17 Jan 2023 09:20:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [hch-misc:btrfs-bio-split] [btrfs]  b7c9bcdc17:
 BUG:KASAN:use-after-free_in__blk_bios_map_sg
Message-ID: <20230117082042.GA19116@lst.de>
References: <202301171441.da2e9d11-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301171441.da2e9d11-oliver.sang@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jan 17, 2023 at 03:57:20PM +0800, kernel test robot wrote:
> 
> Greeting,
> 
> FYI, we noticed BUG:KASAN:use-after-free_in__blk_bios_map_sg due to commit (built with gcc-11):
> 
> commit: b7c9bcdc17f3d9a546470cca6dbf717254ca5291 ("btrfs: remove stripe boundary calculation for buffered I/O")

This seems like a really odd commit to hit such a bug.  How reliably
was the bisection?
