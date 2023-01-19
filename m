Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411807485
	for <oe-lkp@lists.linux.dev>; Thu, 19 Jan 2023 15:10:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id EE56A68D08; Thu, 19 Jan 2023 16:10:44 +0100 (CET)
Date: Thu, 19 Jan 2023 16:10:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [hch-misc:btrfs-bio-split] [btrfs]  b7c9bcdc17:
 BUG:KASAN:use-after-free_in__blk_bios_map_sg
Message-ID: <20230119151044.GA28290@lst.de>
References: <202301171441.da2e9d11-oliver.sang@intel.com> <20230117082042.GA19116@lst.de> <Y8adDdqXX6ptkU7X@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8adDdqXX6ptkU7X@xsang-OptiPlex-9020>
User-Agent: Mutt/1.5.17 (2007-11-01)

Hi Oliver,

I've still not been able to reproduce the issue locally, but identified
a potential issue.  Any chance you could force a re-run of this test
group in the current hch-misc:btrfs-bio-split branch?

On Tue, Jan 17, 2023 at 09:05:17PM +0800, Oliver Sang wrote:
> hi, Christoph Hellwig,
> 
> On Tue, Jan 17, 2023 at 09:20:42AM +0100, Christoph Hellwig wrote:
> > On Tue, Jan 17, 2023 at 03:57:20PM +0800, kernel test robot wrote:
> > > 
> > > Greeting,
> > > 
> > > FYI, we noticed BUG:KASAN:use-after-free_in__blk_bios_map_sg due to commit (built with gcc-11):
> > > 
> > > commit: b7c9bcdc17f3d9a546470cca6dbf717254ca5291 ("btrfs: remove stripe boundary calculation for buffered I/O")
> > 
> > This seems like a really odd commit to hit such a bug.  How reliably
> > was the bisection?
> > 
> 
> the issue doesn't always happen, but with a relatively high rate.
> and the parent doesn't show this issue.
> 
> b45951da8e8f13e6 b7c9bcdc17f3d9a546470cca6db
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :20          80%          16:20    dmesg.BUG:KASAN:use-after-free_in__blk_bios_map_sg
> 
> BTW,
> we noticed the commit date is just recent, not sure if a porting commit?
> so just sent out the report FYI
> 
> commit b7c9bcdc17f3d9a546470cca6dbf717254ca5291
> Author:     Qu Wenruo <wqu@suse.com>
> AuthorDate: Tue Nov 30 17:21:58 2021 +0800
> Commit:     Christoph Hellwig <hch@lst.de>
> CommitDate: Thu Jan 12 15:01:55 2023 +0100
> 
>     btrfs: remove stripe boundary calculation for buffered I/O
---end quoted text---
