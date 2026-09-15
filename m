Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070504749C2
	for <oe-lkp@lists.linux.dev>; Tue, 15 Sep 2026 09:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464452; cv=none; b=aNu6Gfds8QUA2wIfGcmQOabsA1okIHEJ4Hu/8l4P3R3K6VcngMZxrCKbBpdNWtSzVKdJDPAEGIv3zqNRpYKz+8Um2yButwSptjMwsRFfEbcIR7/0I/YxerYkjfeF2sWoFczw52zMog0nQfZXKA+p6YGcz1T8C35NvvHYXfJpA2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464452; c=relaxed/simple;
	bh=x+eyIyEzSdFsHO1HbxvzND/RvTKlc10jXwlNKPbFjCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BdI+Cdu9ljWXHmpg6XwGDayjeZYZmLUwU7F8cn9EPO4WBJnBJtLz2ah3HU9LjV9gqgZVRUv/D7AiYv1Nsj99PvKI4mcpB+RQ9nqpSzhhSRo8GoLReTBclA21tgvrpBSkPyTCuVAWozpDm8AwEl+jfagxBjfU8fjAgLnNU+UnSx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVB3Pe7u; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVB3Pe7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789464450; x=1821000450;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=x+eyIyEzSdFsHO1HbxvzND/RvTKlc10jXwlNKPbFjCw=;
  b=KVB3Pe7ud02QKh7Bb3hlMyhrwuB66ozDeMwIRC0WuSLScGlinw0szSeb
   O30GQmscawckZAF+Vds8wUW2anim5QvKCaSCkWk9FxHP58iQrK1zU81VB
   mFTQmJ/V0CI4QPUPJrT/HQB1w8weWTZqRvJkW0/rxQJ8ccdiPmV+2pQvI
   4NR5F/TDcdBuXfqoC2UJgxyc7k/zvU6+Vo9kgxWC9DiZSF/45UbI3vCkX
   AFiXdh+R7tmYvyTC8Xi2FPSlD0VWsPBFzXMcJH/01IvQOhYmbHpkoT2Ug
   QEgdYdNvzVuW0b0dlIjnxFeFHrEKNc22ThWC/RrYuY7QSoGSMF0zs5lzC
   Q==;
X-CSE-ConnectionGUID: oX4lm+/FTAiaPweQMEsY2g==
X-CSE-MsgGUID: xNA2yvZrR2y6b8Dvf68qMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89582086"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89582086"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 02:27:29 -0700
X-CSE-ConnectionGUID: lKVfQTv4T9qAH4uvOL7s9g==
X-CSE-MsgGUID: RMK+x1vjQhG6CgOUfFqr+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272425434"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.239]) ([10.124.241.239])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 02:27:28 -0700
Message-ID: <f86f4040-4766-456f-8bc1-371f2f3fad3d@linux.intel.com>
Date: Tue, 15 Sep 2026 17:27:25 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [perf/core] 166f10836a:
 perf-sanity-tests.Object_code_reading.fail
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org
References: <202609151503.cb02f753-lkp@intel.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <202609151503.cb02f753-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks, this looks the same issue with
https://lore.kernel.org/oe-lkp/202607091054.7c96d6c6-lkp@intel.com/.

To avoid the kernel address leakage, perf clears the kernel address to 0 if
only user space SAMPLE_IP is required.

The proper fix could need to refine the test case and filter out these 0 IP
addresses. The fix is in progress and would be posted later.


On 9/15/2026 3:45 PM, kernel test robot wrote:
>
> Hello,
>
> kernel test robot noticed "perf-sanity-tests.Object_code_reading.fail" on:
>
> commit: 166f10836a653dfa280d4335603b52f685b8b1ef ("perf/core: Fix kernel register info leak via hardware skid") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linux-next/master 68142f986ff04b2b70b31db00f719bf690f64a9a]
>
> in testcase: perf-sanity-tests
> with following parameters:
>
> 	perf_compiler: gcc
> 	group: group-00
>
> config: x86_64-rhel-9.4-bpf
> compiler: gcc-14
> test machine: 20 threads 1 sockets (Commet Lake) with 16G memory
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202609151503.cb02f753-lkp@intel.com
>
>
> 2026-09-14 10:03:47 sudo ASAN_OPTIONS=fast_unwind_on_malloc=0 /usr/src/linux-perf-x86_64-rhel-9.4-bpf-166f10836a653dfa280d4335603b52f685b8b1ef/tools/perf/perf test 23 -v
>  23: Object code reading                                 : Running (1 active)
> ---- start ----
> ...
> Reading object code for memory address: 0x7f6d46bf44de File is: /usr/lib/x86_64-linux-gnu/libc.so.6
> Already tested /usr/lib/x86_64-linux-gnu/libc.so.6 @ 0xff4de - skipping Reading object code for memory address: 0x7f6d46bf44de File is: /usr/lib/x86_64-linux-gnu/libc.so.6
> Already tested /usr/lib/x86_64-linux-gnu/libc.so.6 @ 0xff4de - skipping Reading object code for memory address: 0 thread__find_map failed
> ---- end(-1) ----
>  23: Object code reading                                 : FAILED!
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260915/202609151503.cb02f753-lkp@intel.com
>
> This defect was originally reported on the perf/core branch (see https://lore.kernel.org/oe-lkp/202607091054.7c96d6c6-lkp@intel.com/). Since the culprit patch has now been merged into the mainline kernel, we have re-submitted the report to ensure proper tracking.
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
