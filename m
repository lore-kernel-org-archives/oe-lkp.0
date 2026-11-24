Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506950;
	b=fiSmhEpxROqRg0O8ylnkLuVeEVEoyZXjzLhTFul6cqdOstsA5el6mBltOc2/o4mFQsNC
	 crOZko9+T9CXxHl+yUi6A04x0bnw212bO3LxgD4VZbL6WVFquwenGFJD8gMhShhg8nm6f
	 ergDUeOPGeiWbnlp1B8aMPnpxCiQlQMAMzZ0DJPiyjXODnHIM2xj+WvlfVfXJkMRFS1M/
	 i57stKXSgejrCyGUm5mQ8c27/W+N1RwW5JUBLnEvBg1Rb/1MBCTl2q2Rs5Tip7QFtsWec
	 s8ASAW5lr2QTJx32dgtfRqpVVTSet6nds+phTO5pWiPOadAhwLvrPfrNfLZEa9ps3NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506950;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=gjwuNHA4P9N1/0IofpdTJnqxIQb4Kyq6KeXElNI7D/Q=;
	b=BIYN8Zfacu6TjgLU2F83PRNA38IeEDgYcBEpq8WA94h2JLaZb7U/8fXrwU6Kcfc0dDk1
	 q2wB2SOyYD2CNK6uIzWjsZAJxjyXquCn3S+lYG29r5GGZzmPYPd8h7pq1NO9Q5/Ifvuw2
	 Hs0IOxrWdw6Kugu5nrC/LY2S63x1sjViN5v2LbP8Ly0NVtxwCYtex4nzO3YsDmVt9AEXI
	 j+Rk2p2k4gB3Iwy5a9+bP2NFExx4MEIJuKi0hES7gxkmKP7+i8pnu3JlcXfzkfLV5s7Kx
	 V2Ckq1ioT3hnNaqADo7UVTqoRQ70q6CMH7J/jOc9dpBsZK4PjPb5u7/JYgpAbuBdK3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ENX2sjX3;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B3606A31E
	for <oe-lkp@lists.linux.dev>; Tue, 24 Nov 2026 07:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D4B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ENX2sjX3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795506950; x=1827042950;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sTWIz2U9ScWbO18XLlSCi2Jn4fF8raEhY9dQ9U2eUrU=;
  b=ENX2sjX3tTP6Sp23krDf0yBz9Kv0U54IUqn6Ha2SWdTv+YOAGrdkA1dS
   ZNayx3Z6v/D7Z4OfeatWPCWwvlbGxJBFRylYmzNRpFdZWaMc7TTQZMJSy
   YWyqojg96TxAmkaCmybPsfpFWwlTJFN7v5Dn2kdo6KF0RDLnV/WezInmA
   CO7DVDsOsEcqOxmPZkzOqUBIDuz4wfsQAsY7yywTHlEEw2v9g1B73D/9B
   SHwns4tnQe0k3hfIqjvjldbPO1uAXEoOP5rc1lKUyuZlORu+MWSpu21c0
   3ewGjsY9djg3PQZMTtWhCu6QET613iqqwsmxqovVuVCokBC9i7v2XHdxr
   A==;
X-CSE-ConnectionGUID: qR4NqLiUTwKe9eqiizXdjQ==
X-CSE-MsgGUID: RuggDDe2RHKGv2pYUmg4mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4418954"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4418954"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:41:38 -0800
X-CSE-ConnectionGUID: yyFtVKlCQxiJWZhDEEcNEg==
X-CSE-MsgGUID: d2wDGEqvQMeoofYajKgXlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11479259"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:41:36 -0800
Date: Tue, 24 Nov 2026 15:41:32 +0800
From: kernel test robot <yi1.lai@intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>, yi1.lai@intel.com
Subject: [tip:locking/core] [locking/osq]  72c440a4e2:
 will-it-scale.per_thread_ops 40.8% regression
Message-ID: <202611240845.904e8444-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello,

kernel test robot noticed a 40.8% regression of will-it-scale.per_thread_ops on:

commit: 72c440a4e225879063809c3d0bcdd7e6544069fe ("locking/osq: Save the CPU number for 'prev', not the node address")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/core

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_task: 100%
	mode: thread
	test: mmap1
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611240845.904e8444-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261124/202611240845.904e8444-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/thread/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/mmap1/will-it-scale

commit: 
  649dd02795 ("locking/osq: Make osq_link_next() use smp_store_release()")
  72c440a4e2 ("locking/osq: Save the CPU number for 'prev', not the node address")

649dd027958996a1 72c440a4e225879063809c3d0bc 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     87444 ±  2%     -40.8%      51808        will-it-scale.192.threads
     27.64 ±  2%    +251.6%      97.18        will-it-scale.192.threads_idle
    455.00 ±  2%     -40.8%     269.33        will-it-scale.per_thread_ops
     87444 ±  2%     -40.8%      51808        will-it-scale.workload


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


