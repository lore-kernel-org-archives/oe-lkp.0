Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB73C34
	for <oe-lkp@lists.linux.dev>; Thu, 26 Oct 2023 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XaHi+uAM"
Message-ID: <1337caea-b960-4333-8b05-f4cd1ce43f61@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1698306123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+hK+2XRhpNxoWQMBfulkd9d572t9/Nu/kVeNaeZC2E=;
	b=XaHi+uAMWa+zMJ+n6pv86Jc8DxBT4jNrqZ1e0SwkHouV4y2lzTPwc5anUcy9fj8P9gZaXx
	91Ka8j7ryHNsTBjtPCNyBIBtNpKmkgnyD8mxn6iTv3uxHQIZkAnpd6irtJr43z4u/Um07F
	D4d6BljJvloYc3R09PE6tXaGaf6paLM=
Date: Thu, 26 Oct 2023 15:41:15 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v3 6/7] slub: Delay freezing of partial slabs
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
 akpm@linux-foundation.org, vbabka@suse.cz, roman.gushchin@linux.dev,
 42.hyeyoo@gmail.com, linux-kernel@vger.kernel.org,
 Chengming Zhou <zhouchengming@bytedance.com>
References: <202310261032.b4590eb0-oliver.sang@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <202310261032.b4590eb0-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2023/10/26 13:49, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_mm/slub.c:#___slab_alloc" on:
> 
> commit: b34342e2732b0dc92b29d6807c5314e2e5e0c27c ("[RFC PATCH v3 6/7] slub: Delay freezing of partial slabs")
> url: https://github.com/intel-lab-lkp/linux/commits/chengming-zhou-linux-dev/slub-Keep-track-of-whether-slub-is-on-the-per-node-partial-list/20231024-173519
> base: git://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.git for-next
> patch link: https://lore.kernel.org/all/20231024093345.3676493-7-chengming.zhou@linux.dev/
> patch subject: [RFC PATCH v3 6/7] slub: Delay freezing of partial slabs
> 
> in testcase: rcutorture
> version: 
> with following parameters:
> 
> 	runtime: 300s
> 	test: default
> 	torture_type: rcu
> 
> 
> 
> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +------------------------------------------------+------------+------------+
> |                                                | e87d1d9973 | b34342e273 |
> +------------------------------------------------+------------+------------+
> | boot_successes                                 | 15         | 0          |
> | boot_failures                                  | 0          | 15         |
> | WARNING:at_mm/slub.c:#___slab_alloc            | 0          | 15         |
> | RIP:___slab_alloc                              | 0          | 15         |
> +------------------------------------------------+------------+------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202310261032.b4590eb0-oliver.sang@intel.com
> 
> 
> [    4.907500][    T1] ------------[ cut here ]------------
> [ 4.908232][ T1] WARNING: CPU: 0 PID: 1 at mm/slub.c:577 ___slab_alloc (mm/slub.c:577 mm/slub.c:3033 mm/slub.c:3205) 
> [    4.909242][    T1] Modules linked in:
> [    4.909739][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc5-00013-gb34342e2732b #1
> [ 4.910746][ T1] RIP: 0010:___slab_alloc (mm/slub.c:577 mm/slub.c:3033 mm/slub.c:3205) 

The warning is triggered by "lockdep_assert_irqs_disabled()" in __slab_update_freelist(),
which is called in the new introduced freeze_slab().

We should fix it by using "slab_update_freelist()" in freeze_slab() instead, which will
disable the interrupts correctly.

Thanks!
