Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B001F63E8
	for <oe-lkp@lists.linux.dev>; Mon,  7 Apr 2025 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036739; cv=none; b=e3n289x5acTASTWSlAGo6kR+98lWzmWVpnH+TXxFO/bnDlcyljyaKx/PKJaK9QYjz+IbVrnrCXYGgbGzUMJjvUk9ByEUIWxjzCEHBQk9g5DciqvjGZJ+AeMjIfIsuCkTrZqfS0GurlqFoDH+KA6YJdG5tC7H3NntvU72xqRlKJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036739; c=relaxed/simple;
	bh=v0CkWDkwF9G6LUp8uQSKwk1DnyOq5vA/pKSgSCmoEmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pWPlF1Xg+xCAZWJDtiqsjdhskHmzjT7bsVIqi3nqsfdbhwPZ1fJFwcl/xEBtuohJlPlsM32eG+HD060w8Nk276v0PF1Ginbmqxn9glYKAKN+B6bVJldoRZz4aup4qJrEISjYi6pc5wuM1IY6M3gVEJshmUbG/byJZ3iD7Eo0jV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlBkOwui; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlBkOwui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744036737; x=1775572737;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v0CkWDkwF9G6LUp8uQSKwk1DnyOq5vA/pKSgSCmoEmQ=;
  b=BlBkOwuicBYvi5J8rKtzpghkrOGuq7P4WsOBsCFj6SP0McE3PsfJGCuc
   I4PjdpdeM0A21xjSA75+FGvJLnA/TQtsZ7+Ox15vEaJwzpai658JuY73N
   WKpXtqDAF2Xm0fo9sIV+QzXRRMF1sjO2wVk9GpenaOM7fsaYM0TtiV0CL
   ncY1wh5hbk0Khy01+b1yn8o/frTXBTLQC4tyqqSGCgDFB1LXgmYbyXmbf
   2d+bylC0HSS9jYEZ6WkY6Zl1rmPHdyhY5majSXeS/brJpP+JSpweKA/jX
   f1chs2eszW7QtqX2A+sJvd9rQ2rz7JEH7iDtDHCBwrtn6qTJU8Xt0AkzN
   A==;
X-CSE-ConnectionGUID: A12r4jz3ReuHk/RTvkltdw==
X-CSE-MsgGUID: q95gQ60kTvyuYup1PNQB0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45317021"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45317021"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 07:38:57 -0700
X-CSE-ConnectionGUID: Gm/frhL9SNWGIx0q/Dk7nA==
X-CSE-MsgGUID: iuYdIwZ3SeGfplcDZKcLUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127727480"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 07:38:56 -0700
Received: from [10.246.136.14] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id F01AA20B5736;
	Mon,  7 Apr 2025 07:38:54 -0700 (PDT)
Message-ID: <f872c998-c076-4e09-8f7d-1ad29a065d4a@linux.intel.com>
Date: Mon, 7 Apr 2025 10:38:53 -0400
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [perf/x86] 88ec7eedbb: kvm-unit-tests.pmu_lbr.fail
To: kernel test robot <oliver.sang@intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org
References: <202504071232.3c2fa7d5-lkp@intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <202504071232.3c2fa7d5-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-04-07 1:07 a.m., kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "kvm-unit-tests.pmu_lbr.fail" on:
> 
> commit: 88ec7eedbbd21cad38707620ad6c48a4e9a87c18 ("perf/x86: Fix low freqency setting issue")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linus/master      0a87d6bb6fd274cde3bf217a821153714374198f]
> [test failed on linux-next/master fefb886b1344e222b3218f3c0165b0fd770e8b88]
> 
> in testcase: kvm-unit-tests
> version: kvm-unit-tests-x86_64-69574079-1_20250322
> with following parameters:

The one line patch only impacts the perf record.
But the test case is for LBR on KVM. The case directly access the
IA32_DEBUGCTLMSR to enable/disable LBRs. There is nothing related.
It is probably a false alarm.

+ Dapeng

Could you please take a look at the qemu test case?

Thanks,
Kan>
> 
> config: x86_64-rhel-9.4-func
> compiler: gcc-12
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 8G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202504071232.3c2fa7d5-lkp@intel.com
> 
> 
> ...
> [32mPASS[0m pmu (143 tests, 14 skipped)
> [31mFAIL[0m pmu_lbr (2 tests, 1 unexpected failures)   <---
> [33mSKIP[0m pmu_pebs (1 tests, 1 skipped)
> ...
> 
> 
> one log is attached.
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250407/202504071232.3c2fa7d5-lkp@intel.com
> 
> 
> 

