Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043F2233727
	for <oe-lkp@lists.linux.dev>; Mon, 20 Oct 2025 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954496; cv=none; b=rPYWgUEAiwkruDcL4Sau20F+s8xgn73OWtokgmZ/7XGTGTo/aP+1Syr2+bRR02BYXoOOsaTZQIa9TpcT6j7Jh9ipj14tLgBZoVgod8CruoF7mxaROY4hrrMgDyQtEjSzZeAgkFMyzZQW9g7SVAT897O9fA9B+5gu+XRU8agHPFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954496; c=relaxed/simple;
	bh=4H0XHowcWHq+DU5xJnk0XZQicGIQDAh8pWA4/2dAZaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVIOMrNSLkYijyar6cJkj5BjL1kHbBFiMWWVkqPfsOaTCamerdDFLWYnrJtAq9Amhs7TcAh2Qf4LDGt7rF2/NEDzRlMFR9vY63q72OvWAuC6TLzflmPx/0Tx3aVbNMSYNhMMTJUgNrxsLkMQNZFoe2bF+I9wmLkvCbRHEmXRuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJ04DR5b; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJ04DR5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760954495; x=1792490495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4H0XHowcWHq+DU5xJnk0XZQicGIQDAh8pWA4/2dAZaA=;
  b=cJ04DR5bQGQN3CJQLrA6ZJb1xWioGDq4UZJmQwW5a0PwrzjAWowPqwV4
   ArmTDcYo1n2S6gxFFoNMk0W6yLIvHVNsIUG90luy2iwREir8hvDMXRKeQ
   fHo25sG4C66SyXsBC7EkgIxXFM3STtbyLZggYvPN1NNjGZCQ1+/+63tar
   q/weTwwymi4A33uiMhNyz1eGLuw91UqEhqNwGinhBoQwtMv/ntwLo52+Q
   eOpWWdp0p/7HUIskjfvm1kSO0dKj09D+TunCLdzZ13Gdesr/oxrK5ZNUn
   CGYmVE2CNfcV8AcxyJQoUZJN4v/I9iNaa95nCJ+sxaczsfwmL2ZqZKrYi
   A==;
X-CSE-ConnectionGUID: ISVqmqqMR1mPIGD9LnoFpw==
X-CSE-MsgGUID: Nvwjl35kTGWgsfVaO5/V8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62275959"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="62275959"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 03:01:34 -0700
X-CSE-ConnectionGUID: tgiP9a8ITt2p8q9FlSGlYQ==
X-CSE-MsgGUID: iSe+NxidSZOHYbuboL82qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183775390"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.6])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 03:01:27 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vAmhd-00000001Gle-41E3;
	Mon, 20 Oct 2025 13:01:21 +0300
Date: Mon, 20 Oct 2025 13:01:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Szuying Chen <chensiying21@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Szuying Chen <Chloe_Chen@asmedia.com.tw>,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	dan.j.williams@intel.com, gourry@gourry.net, jhubbard@nvidia.com,
	akinobu.mita@gmail.com, sumanthk@linux.ibm.com,
	peterz@infradead.org, huang.ying.caritas@gmail.com,
	Andrew_Su@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
	Ed_Huang@asmedia.com.tw, Cindy1_Hsu@asmedia.com.tw,
	Jesse1_Chang@asmedia.com.tw, Richard_Hsu@asmedia.com.tw
Subject: Re: [PATCH] kernel: resourse: Add conditional handling for ACPI
 device
Message-ID: <aPYIcfMOml2Gujh1@ashevche-desk.local>
References: <20251017023531.5616-1-Chloe_Chen@asmedia.com.tw>
 <202510201616.6e6b62a1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510201616.6e6b62a1-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 20, 2025 at 04:46:04PM +0800, kernel test robot wrote:
> 
> kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h" on:
> 
> commit: 871e73eea694be4705a5e3ebc9119e6c76c7b246 ("[PATCH] kernel: resourse: Add conditional handling for ACPI device")
> url: https://github.com/intel-lab-lkp/linux/commits/Szuying-Chen/kernel-resourse-Add-conditional-handling-for-ACPI-device/20251017-103749
> base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
> patch link: https://lore.kernel.org/all/20251017023531.5616-1-Chloe_Chen@asmedia.com.tw/
> patch subject: [PATCH] kernel: resourse: Add conditional handling for ACPI device
> 
> in testcase: boot
> 
> config: i386-randconfig-141-20251019
> compiler: gcc-14
> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

> +-------------------------------------------------------------------------------+------------+------------+
> |                                                                               | 4d30e94233 | 871e73eea6 |
> +-------------------------------------------------------------------------------+------------+------------+
> | BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h | 0          | 12         |
> +-------------------------------------------------------------------------------+------------+------------+

Thanks, absolutely NAK to the patch based on this report and my previous comment.

-- 
With Best Regards,
Andy Shevchenko


