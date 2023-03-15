Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4032563
	for <oe-lkp@lists.linux.dev>; Wed, 15 Mar 2023 07:58:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B287168AA6; Wed, 15 Mar 2023 08:58:16 +0100 (CET)
Date: Wed, 15 Mar 2023 08:58:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <yujie.liu@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Keith Busch <kbusch@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Jens Axboe <axboe@kernel.dk>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	linux-fsdevel@vger.kernel.org, ying.huang@intel.com,
	feng.tang@intel.com, zhengjun.xing@linux.intel.com,
	fengwei.yin@intel.com
Subject: Re: [linus:master] [mpage] 7d28631786: fio.write_iops 27.8%
 improvement
Message-ID: <20230315075816.GA32694@lst.de>
References: <202303101630.ef282023-yujie.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303101630.ef282023-yujie.liu@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

I think this simply accounts for the I/Os now that were skipped
when using the bdev_read/write path before.
