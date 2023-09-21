Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F2B20E7
	for <oe-lkp@lists.linux.dev>; Thu, 21 Sep 2023 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695310603; x=1726846603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uzDkfWXeowTfu3zdB2+xHFSe333dlATcO9CRMMxZdao=;
  b=NMewOcL1Vfldc5ACR3xm8WqrUqdZwrxFHTAUfA5idUWy68lJHZ3RKPNE
   AXtxj4STDD7jdysWUffAnKGSULzoiBuV27MgjDGm0/M6ugDELPRK79G83
   E2oG7SAT99oQkKlK50e0e5Bi9x3K1Ci5ZMq3qRilx7HZoWeBerdyTnsD2
   Yfv52bG5pC8o/ube6GEe2lbH3PhrOxvsHf+yCMahqqua8up5uxrjD7txx
   Dyqa/RsVFreMdveqwnMB5R2hfVbjlo9KrT0ar6ifiShLTIvqLBK8HAvyr
   p9C6lQARVdBKTc0jhV//waWIo5JG/UdN/QDbVCXEUvcyltWTiBIrfoIeG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="411497383"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="411497383"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 08:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="862522382"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="862522382"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 08:36:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qjLjK-0000000Gwxq-22aH;
	Thu, 21 Sep 2023 18:36:38 +0300
Date: Thu, 21 Sep 2023 18:36:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v1 1/6] params: Use sysfs_emit() to instead of scnprintf()
Message-ID: <ZQxjBkFZV5T6BELA@smile.fi.intel.com>
References: <20230912150551.401537-1-andriy.shevchenko@linux.intel.com>
 <202309211632.67e4c1e0-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309211632.67e4c1e0-oliver.sang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 21, 2023 at 09:34:13PM +0800, kernel test robot wrote:
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_fs/sysfs/file.c:#sysfs_emit" on:
> 
> commit: d4004295e5502a1eb3e361e97ea4dd1686046af6 ("[PATCH v1 1/6] params: Use sysfs_emit() to instead of scnprintf()")
> url: https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/params-Introduce-the-param_unknown_fn-type/20230912-231033
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> patch link: https://lore.kernel.org/all/20230912150551.401537-1-andriy.shevchenko@linux.intel.com/
> patch subject: [PATCH v1 1/6] params: Use sysfs_emit() to instead of scnprintf()
> 
> in testcase: trinity
> version: trinity-i386-abe9de86-1_20230429
> with following parameters:
> 
> 	runtime: 300s
> 	group: group-04
> 	nr_groups: 5


> what we observed is this issue doesn't always happen. we run the test upon
> this commit almost 500 times, it happened 42 times.
> however, the parent keeps clean.
> 
>         v6.6-rc1 d4004295e5502a1eb3e361e97ea
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :497          8%          42:496   dmesg.EIP:sysfs_emit
>            :497          8%          42:496   dmesg.WARNING:at_fs/sysfs/file.c:#sysfs_emit

Cool! I will check this, thank you for the report.

-- 
With Best Regards,
Andy Shevchenko


