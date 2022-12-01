Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB3B10F6
	for <oe-lkp@lists.linux.dev>; Thu,  1 Dec 2022 10:16:38 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E331A1FD63;
	Thu,  1 Dec 2022 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669889794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jR5csyqPRlj0sE4agPtfCNXgK7gme6BxDCQeVvGkkg=;
	b=Arxdm3h4gzmt1gTKhaLwG4RIVX3FDKwQeQEzMM1qMA3TQ+STnD9rulwoPW6U9A5FNAFzWO
	96knByfeGJDSX1ItF82uOYf7fdEfB0EDg3IGKcmbBKsKuEF9MOZ8CP6Mx7uPIUrxUyUuJ0
	bUvVIteBr9k3tk2DH2jFG+tdoXzSQ8k=
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D36DA13503;
	Thu,  1 Dec 2022 10:16:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA
	id bwbIMgJ/iGMbJwAAGKfGzw
	(envelope-from <mhocko@suse.com>); Thu, 01 Dec 2022 10:16:34 +0000
Date: Thu, 1 Dec 2022 11:16:34 +0100
From: Michal Hocko <mhocko@suse.com>
To: kernel test robot <yujie.liu@intel.com>
Cc: Shakeel Butt <shakeelb@google.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Andrew Morton <akpm@linux-foundation.org>,
	kernel test robot <oliver.sang@intel.com>,
	Soheil Hassas Yeganeh <soheil@google.com>,
	Feng Tang <feng.tang@intel.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Eric Dumazet <edumazet@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [linus:master] [memcg] 1813e51eec:
 kernel-selftests.cgroup.test_kmem.test_kmem_memcg_deletion.fail
Message-ID: <Y4h/AsTy97na/t5D@dhcp22.suse.cz>
References: <202212010958.c1053bd3-yujie.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212010958.c1053bd3-yujie.liu@intel.com>

On Thu 01-12-22 16:05:44, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed kernel-selftests.cgroup.test_kmem.test_kmem_memcg_deletion.fail due to commit (built with gcc-11):
> 
> commit: 1813e51eece0ad6f4aacaeb738e7cced46feb470 ("memcg: increase MEMCG_CHARGE_BATCH to 64")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linux-next/master 700e0cd3a5ce6a2cb90d9a2aab729b52f092a7d6]
> 
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-2ed09c3b-1_20221128
> with following parameters:
> 
> 	group: cgroup
> 
> test-description: The kernel contains a set of "self tests" under the tools/testing/selftests/ directory. These are intended to be small unit tests to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> 
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> # memory.current = 40161280
> # slab + anon + file + kernel_stack = 14478624
> # slab = 13453184
> # anon = 0
> # file = 0
> # kernel_stack = 0
> # pagetables = 0
> # percpu = 1025440
> # sock = 0
> # not ok 2 test_kmem_memcg_deletion  <--
> # ok 3 test_kmem_proc_kpagecgroup
> # ok 4 test_kmem_kernel_stacks
> # ok 5 test_kmem_dead_cgroups
> # ok 6 test_percpu_basic
> not ok 2 selftests: cgroup: test_kmem # exit=1

IIUC we need this
diff --git a/tools/testing/selftests/cgroup/test_kmem.c b/tools/testing/selftests/cgroup/test_kmem.c
index 22b31ebb3513..1d073e28254b 100644
--- a/tools/testing/selftests/cgroup/test_kmem.c
+++ b/tools/testing/selftests/cgroup/test_kmem.c
@@ -24,7 +24,7 @@
  * the maximum discrepancy between charge and vmstat entries is number
  * of cpus multiplied by 32 pages.
  */
-#define MAX_VMSTAT_ERROR (4096 * 32 * get_nprocs())
+#define MAX_VMSTAT_ERROR (4096 * 64 * get_nprocs())
 
 
 static int alloc_dcache(const char *cgroup, void *arg)

But honestly, I am rather dubious of tests like this one. Does it really
give us any useful testing coverage?
-- 
Michal Hocko
SUSE Labs
