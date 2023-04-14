Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4547C
	for <oe-lkp@lists.linux.dev>; Fri, 14 Apr 2023 05:25:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C1D2368AA6; Fri, 14 Apr 2023 07:24:58 +0200 (CEST)
Date: Fri, 14 Apr 2023 07:24:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <yujie.liu@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-kernel@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Anand Jain <anand.jain@oracle.com>, linux-btrfs@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linus:master] [btrfs] 4ae2edf12d: fio.write_iops -11.9%
 regression
Message-ID: <20230414052458.GA11616@lst.de>
References: <202304140917.9e9f5c1-yujie.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202304140917.9e9f5c1-yujie.liu@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Apr 14, 2023 at 10:01:51AM +0800, kernel test robot wrote:
> Hello,
> 
> kernel test robot noticed a -11.9% regression of fio.write_iops on:
> 
> commit: 4ae2edf12d49fdbaea2dfda0bb2ec06501bd3493 ("btrfs: simplify parameters of btrfs_lookup_bio_sums")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Can you revalidate this?  The patch is purely a parameter passing
cleanup, so a large reduction in IOPS looks very suspicious.

