Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9DD1F949
	for <oe-lkp@lists.linux.dev>; Tue,  8 Apr 2025 02:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744078396; cv=none; b=U4/Fsrsr+WiW+HyN6d8ExuEMF/gEW4Hd8HJI7g1AAsrHYpH5Ktlg8c3+/VSowQ/p+3vBo/JDsYVZ6xFYjSpS4OE7Un5tMBWo1CqWg4gw1vMwyMjgsdW93WNYwRgmmHDcfgiOqofWWMbt+4NEXVeJEwYCXBLDPDTHenIm+VmuAHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744078396; c=relaxed/simple;
	bh=9j44GVZXTsxQbV1gLmy2/Nifp26hHhQw0Oj1EkUngWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGOxrWnPzmMrOsX/VhuUZ9XzmrOmSKIZKIEr65V/lML19aWCOsoIxXOh+A8ETCMvwIc2w4A9BUTQoSYHxEEJ5FFU8LCC1pA/7diQfPsN81CVFNAHqjvQM+ZcpGfSlaR11/R0KkLgDJz2NuKm7HQQ0aCn1hHOR3qiLF1lJ7c5W4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fcpj69G5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fcpj69G5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744078395; x=1775614395;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9j44GVZXTsxQbV1gLmy2/Nifp26hHhQw0Oj1EkUngWk=;
  b=Fcpj69G5+y7y61mmY49kHLhHCJ6Tngoqcdt+xyklZiroa+6JdwMy2C2o
   B9eOLG4zZdAckbdfVthmvK2O2PTfao/oMANIJqKxfalvLK8+bV2ZrWPyT
   0u+QyZChjGBhinL6oqifcLwtKXSJTupa6gNWZLM4ls3r/bVFMMabMZUV9
   Bsh//5e3hVDQ31yTrZRg5kd0bjptBVn7hESXEdQw9erxnTyRISC4QsM3j
   yUTJjjADFE/yvkr1/OTIbfangQT8qE7C0eWTfYgG/omTECrQP9JSknAbJ
   g8ikTweYBVC+hcBWvteDfJynfnVW3anC6GiW5zURhK+vc+//yATGA528i
   A==;
X-CSE-ConnectionGUID: sJC1CS3wQGGp9vaJUVO2Vg==
X-CSE-MsgGUID: nSypmdEPS66dR8G9l2l1sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56472618"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="56472618"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:13:13 -0700
X-CSE-ConnectionGUID: KnRmpdJGTeC2IFq3rDHTbQ==
X-CSE-MsgGUID: eK45jMtEQOuNMuBhEszB6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="127999199"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.128]) ([10.124.245.128])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:13:11 -0700
Message-ID: <418fff05-a0d9-4ead-b344-7b0b7fdb7f7f@linux.intel.com>
Date: Tue, 8 Apr 2025 10:13:07 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [perf/x86] 88ec7eedbb: kvm-unit-tests.pmu_lbr.fail
To: "Liang, Kan" <kan.liang@linux.intel.com>,
 kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org
References: <202504071232.3c2fa7d5-lkp@intel.com>
 <f872c998-c076-4e09-8f7d-1ad29a065d4a@linux.intel.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <f872c998-c076-4e09-8f7d-1ad29a065d4a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/7/2025 10:38 PM, Liang, Kan wrote:
>
> On 2025-04-07 1:07 a.m., kernel test robot wrote:
>>
>> Hello,
>>
>> kernel test robot noticed "kvm-unit-tests.pmu_lbr.fail" on:
>>
>> commit: 88ec7eedbbd21cad38707620ad6c48a4e9a87c18 ("perf/x86: Fix low freqency setting issue")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> [test failed on linus/master      0a87d6bb6fd274cde3bf217a821153714374198f]
>> [test failed on linux-next/master fefb886b1344e222b3218f3c0165b0fd770e8b88]
>>
>> in testcase: kvm-unit-tests
>> version: kvm-unit-tests-x86_64-69574079-1_20250322
>> with following parameters:
> The one line patch only impacts the perf record.
> But the test case is for LBR on KVM. The case directly access the
> IA32_DEBUGCTLMSR to enable/disable LBRs. There is nothing related.
> It is probably a false alarm.
>
> + Dapeng
>
> Could you please take a look at the qemu test case?

Sure. I would investigate it later.


>
> Thanks,
> Kan>
>> config: x86_64-rhel-9.4-func
>> compiler: gcc-12
>> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 8G memory
>>
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: https://lore.kernel.org/oe-lkp/202504071232.3c2fa7d5-lkp@intel.com
>>
>>
>> ...
>> [32mPASS[0m pmu (143 tests, 14 skipped)
>> [31mFAIL[0m pmu_lbr (2 tests, 1 unexpected failures)   <---
>> [33mSKIP[0m pmu_pebs (1 tests, 1 skipped)
>> ...
>>
>>
>> one log is attached.
>>
>>
>> The kernel config and materials to reproduce are available at:
>> https://download.01.org/0day-ci/archive/20250407/202504071232.3c2fa7d5-lkp@intel.com
>>
>>
>>
