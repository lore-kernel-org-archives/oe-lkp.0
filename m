Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520DA256A
	for <oe-lkp@lists.linux.dev>; Tue, 17 Jan 2023 13:31:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 03C1B67373; Tue, 17 Jan 2023 14:31:35 +0100 (CET)
Date: Tue, 17 Jan 2023 14:31:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [hch-misc:btrfs-bio-split] [btrfs]  b7c9bcdc17:
 BUG:KASAN:use-after-free_in__blk_bios_map_sg
Message-ID: <20230117133134.GA11095@lst.de>
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

On Tue, Jan 17, 2023 at 09:05:17PM +0800, Oliver Sang wrote:
> the issue doesn't always happen, but with a relatively high rate.
> and the parent doesn't show this issue.

Thanks.  I've been running the btrfs/16? checks in a loop on a KASAN
kernel for quite a bit but haven't hit it yet.

> we noticed the commit date is just recent, not sure if a porting commit?
> so just sent out the report FYI

This was recently rebased, yes.

Thanks for the report and the follow up!
