Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F1E37DE89
	for <oe-lkp@lists.linux.dev>; Tue, 11 Aug 2026 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786437398; cv=none; b=Rz1fNtgI3V+Uc215LdKpmKZrK1lzUjUjNntKeP5gZZQi9iPd6S9RjHkhPPuagJ5caWmTi1BSf8N/mdXSo/dqbSEJlACEkoV4hHA//zqdwTrosA8xkG1VrMjm6IwGDWLradIjApGzvKpR8idZ4nhtm4DPMhMfm/v04qlPW1Ry1Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786437398; c=relaxed/simple;
	bh=V8AGqC13MoG7LGJbPFJU5XFjZ49Q6pLYFoW2lRih2FY=;
	h=Date:From:To:Cc:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IXNQKpDSMMkwC1xLJjKf+CaF/9qrCVPjRDQp039rBUKW42Mnue56vevsRcLYAR1JKtWC8dtSkv77ci7hWK13muRpNKC7cvzm/IIEHj6Aihx9KnOIiu4ReHw7BvGjWSpJ08VJRdHbBvs6PkUI/keZF0xUI75n5fSvEkjz+ca/xPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGeb2rNQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGeb2rNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786437394; x=1817973394;
  h=date:from:to:cc:message-id:references:mime-version:
   in-reply-to;
  bh=V8AGqC13MoG7LGJbPFJU5XFjZ49Q6pLYFoW2lRih2FY=;
  b=FGeb2rNQ5WjGsySVhcuuIh2lH4TmUf2GVRS40lYDAMG25KLSP2AIY+El
   Bo8hHr5BmcjEJg3FMRfSVkf1YqS40KkdIPSXeemJDB+gJG7T5/tZZwoZh
   LLFIS1XxyLHucf20zxi7gb0CfiVrof9MTZM5K628Si3M1vnxd674l6b7I
   h+VX+G1LEYPdv0HycKYxq+TTkagbePlUC7ukZIHDw4LSgafMjEOleTXWH
   esE/0ia2hS8X4aW2DfGEiCdSUffMGLg6qEJYmQrz1PViJnHtRft6Ch79i
   hQ2glxREHeudjx3dL8kgYWvhss+Udk/9inOMRfn4jDN6ihUSGhIh3R6Mv
   w==;
X-CSE-ConnectionGUID: FUyuHjmkQyy4lhHM4J2QEg==
X-CSE-MsgGUID: aaLNiLtxTl+uSRkSI0b9Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86974068"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="86974068"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 01:36:33 -0700
X-CSE-ConnectionGUID: zpb9TVeIQ22FMTfC+ur5Ag==
X-CSE-MsgGUID: iFWpG8cHRaGCQHnnMqg7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="259427015"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 01:36:30 -0700
Date: Tue, 11 Aug 2026 16:36:27 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, kbusch@kernel.org, hch@lst.de,
	hare@suse.de, sagi@grimberg.me, chaitanyak@nvidia.com,
	gjoyce@linux.ibm.com, Nilay Shroff <nilay@linux.ibm.com>
Message-ID: <202608111002.8c383e35-lkp@intel.com>
References: <20260727151652.3660476-1-nilay@linux.ibm.com>
 <20260727151652.3660476-3-nilay@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727151652.3660476-3-nilay@linux.ibm.com>


Hello,

kernel test robot noticed "blktests.nvme/048.fail" on:

commit: 657b4cd151e042afc228615869b2a6876b91b8fc ("[PATCH v2 2/4] nvme-tcp: limit I/O queue count based on NIC queue count")
url: https://github.com/intel-lab-lkp/linux/commits/Nilay-Shroff/net-add-helper-for-device-lookup-by-destination-address/20260731-154725
patch link: https://lore.kernel.org/all/20260727151652.3660476-3-nilay@linux.ibm.com/
patch subject: [PATCH v2 2/4] nvme-tcp: limit I/O queue count based on NIC queue count

in testcase: blktests
version: blktests-x86_64-72a6349-1_20260804
with following parameters:

	disk: 1SSD
	test: nvme-group-02
	nvme_trtype: tcp



config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: 
| https://lore.kernel.org/oe-lkp/202608111002.8c383e35-lkp@intel.com


nvme/048 (tr=tcp) (Test queue count changes on reconnect)   
    runtime  4.358s  ...
nvme/048 (tr=tcp) (Test queue count changes on reconnect)    [failed]
    runtime  4.358s  ...  7.340s
    --- tests/nvme/048.out	2026-08-04 23:49:51.000000000 +0000
    +++ /mnt/nvme-group-02/nodev_tr_tcp/nvme/048.out.bad	2026-08-06 06:04:55.281322408 +0000
    @@ -1,2 +1,4 @@
     Running nvme/048
    +expected queue count 3 not set
    +FAIL
     Test complete



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260811/202608111002.8c383e35-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


