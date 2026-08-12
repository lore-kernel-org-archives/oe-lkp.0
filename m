Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE2E3346BE
	for <oe-lkp@lists.linux.dev>; Wed, 12 Aug 2026 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539474; cv=none; b=Tw36q8v1aAoGVh3a+MWo3/gyu47omZVKR85TV8/3Z13SbYfSkyGUpHYYYNDAQiicQdf3jmzKWbjm1rBo6X0gWDLrAmo21XI+90vzmwp2F/HonYXjwhoe556VT0fRWxYmyiViuV8syT2ZUCB7FOHxSLN5FRfbVoIHl7Eg78Ytmrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539474; c=relaxed/simple;
	bh=dAaq27bG1xoJR0GZbjdsKyHko5Bbb/ApRKzkUInf38Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rv7+HYEU0oGfeQ1rQd7ROdAlSvY1EAUsKxxI7KeUXwj4AnvFGZE6J5K+iZ6MQ5w38XcZvSrR9L2pFTPpCpAjsAR7EzadrADqyvVJXEQ00Gv8OIm38JthicoauL05+F7crYeMZ+QHYJZoowrfzpcr3zeWvQzpby+OMi9SCf092BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJq0L39m; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJq0L39m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786539471; x=1818075471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dAaq27bG1xoJR0GZbjdsKyHko5Bbb/ApRKzkUInf38Q=;
  b=AJq0L39mqwHSqOfeJrxhbCn7r6Amv/JYBEd7BdVbYDMSjkFrNy7RVTrW
   kNM4WcRnK5sixtvTvlDw14WoMmU0ppstWM5O5Lk/cJVSAjQux6QFFuEKu
   zn60bP21fPDoOKadH2HkOqK3WBp5edA5cCF0d2TVd/Lwj8t7b3iiIP2QW
   k+YEuIt6G1o6Ll1tnG4fbN5pxZAhO/ymrBp9kw2CQ7yyuzZfIZeDsTEG/
   Z5Pe010gGW3815/EVmXfBKJhR0+NrkNU/cUK1Kq0NXd7avDNGokxB/kRj
   rDdJimaMgVSlAhKvypNtECAfXEt8xuUP1+0ER4vmANO3r7IWH+Wlqi9Y4
   w==;
X-CSE-ConnectionGUID: /zMRHt4HSDKJA93z+LCHiQ==
X-CSE-MsgGUID: bfYnPf8uTbyXpdeIW37PBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86052307"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86052307"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 05:57:48 -0700
X-CSE-ConnectionGUID: boqzykYPTJOqaFEAF2goIQ==
X-CSE-MsgGUID: /FkBDvrTTL2A0vI043o8xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="259813861"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 05:57:45 -0700
Date: Wed, 12 Aug 2026 20:57:42 +0800
From: kernel test bot <yi1.lai@intel.com>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, kbusch@kernel.org, hch@lst.de,
	hare@suse.de, sagi@grimberg.me, chaitanyak@nvidia.com,
	gjoyce@linux.ibm.com
Subject: Re:
Message-ID: <anxtxmmGcYq7uUOt@ly-workstation>
References: <20260727151652.3660476-1-nilay@linux.ibm.com>
 <20260727151652.3660476-3-nilay@linux.ibm.com>
 <202608111002.8c383e35-lkp@intel.com>
 <7c68c535-8ae0-4a93-a5ee-5012edcf529b@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c68c535-8ae0-4a93-a5ee-5012edcf529b@linux.ibm.com>

On Wed, Aug 12, 2026 at 05:19:56PM +0530, Nilay Shroff wrote:
> On 8/11/26 2:06 PM, kernel test robot wrote:
> > 
> > Hello,
> > 
> > kernel test robot noticed "blktests.nvme/048.fail" on:
> > 
> > commit: 657b4cd151e042afc228615869b2a6876b91b8fc ("[PATCH v2 2/4] nvme-tcp: limit I/O queue count based on NIC queue count")
> > url: https://github.com/intel-lab-lkp/linux/commits/Nilay-Shroff/net-add-helper-for-device-lookup-by-destination-address/20260731-154725
> > patch link: https://lore.kernel.org/all/20260727151652.3660476-3-nilay@linux.ibm.com/
> > patch subject: [PATCH v2 2/4] nvme-tcp: limit I/O queue count based on NIC queue count
> > 
> > in testcase: blktests
> > version: blktests-x86_64-72a6349-1_20260804
> > with following parameters:
> > 
> > 	disk: 1SSD
> > 	test: nvme-group-02
> > 	nvme_trtype: tcp
> > 
> > 
> > 
> > config: x86_64-rhel-9.4-func
> > compiler: gcc-14
> > test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G memory
> > 
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > 
> > 
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <yi1.lai@intel.com>
> > | Closes:
> > | https://lore.kernel.org/oe-lkp/202608111002.8c383e35-lkp@intel.com
> > 
> > 
> > nvme/048 (tr=tcp) (Test queue count changes on reconnect)
> >      runtime  4.358s  ...
> > nvme/048 (tr=tcp) (Test queue count changes on reconnect)    [failed]
> >      runtime  4.358s  ...  7.340s
> >      --- tests/nvme/048.out	2026-08-04 23:49:51.000000000 +0000
> >      +++ /mnt/nvme-group-02/nodev_tr_tcp/nvme/048.out.bad	2026-08-06 06:04:55.281322408 +0000
> >      @@ -1,2 +1,4 @@
> >       Running nvme/048
> >      +expected queue count 3 not set
> >      +FAIL
> >       Test complete
> > 
> Thanks for the report!
> 
> This requires changes in blktests nvme/048. So once this change/commit
> is merged upstream, I'd send another patch to update the test.
> 
> On another note, you may want to check your automation script which sends
> auto-email. I see the email subject line is empty.
> 

Thanks for the kind reminder. Will adjust it.

> Thanks,
> --Nilay
