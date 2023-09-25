Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E9D5677
	for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 12:39:18 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20230925123909epoutp02d5dbdbb351277864a04569e264da15b6~IJKS1UMsK2289722897epoutp020
	for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 12:39:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20230925123909epoutp02d5dbdbb351277864a04569e264da15b6~IJKS1UMsK2289722897epoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1695645549;
	bh=cw6ncaOPFNDhLVeHkoV/5VBI1jMswK6CIAPHPVv3ct8=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=FnATibx5+AnkclcaQ3mnVWrDc6SGoywMX8z4BMbVXm0LjplO9pXR3lrADMXxlhvE0
	 7bVCzL4RiDBf+k9Zq3oHcTNPKi1le81utQshcsBVNkr0qD282p2YDJGZLVSQa2ghbB
	 dKri9R2BUACkY//zdnxsPquI2g1aToZIDGCte7cw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20230925123908epcas1p3237a35d6ba2ed28d684ad4fbbd1cf491~IJKRlMKE71034310343epcas1p3H;
	Mon, 25 Sep 2023 12:39:08 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.226]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4RvMrC4D1Rz4x9Pw; Mon, 25 Sep
	2023 12:39:07 +0000 (GMT)
X-AuditID: b6c32a33-4e9ff700000021d1-83-65117f6b29dc
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F0.9F.08657.B6F71156; Mon, 25 Sep 2023 21:39:07 +0900 (KST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: Re: [linux-next:master] [maple_tree]  2041864a22:
 BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
Reply-To: jason.sim@samsung.com
Sender: Jaeseon Sim <jason.sim@samsung.com>
From: Jaeseon Sim <jason.sim@samsung.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: kernel test robot <oliver.sang@intel.com>, "oe-lkp@lists.linux.dev"
	<oe-lkp@lists.linux.dev>, "lkp@intel.com" <lkp@intel.com>, Linux Memory
	Management List <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, Peng
	Zhang <zhangpeng.00@bytedance.com>, Suren Baghdasaryan <surenb@google.com>,
	"maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <202309242123.7ebe65b5-oliver.sang@intel.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230925123907epcms1p82db5bc72fa25e390986f2e195a58b362@epcms1p8>
Date: Mon, 25 Sep 2023 21:39:07 +0900
X-CMS-MailID: 20230925123907epcms1p82db5bc72fa25e390986f2e195a58b362
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmvm52vWCqwckVChZz1q9hs9je8IDd
	4t6a/6wWr5ofsVlsWNnAZHFto7XFgk9/WSwmX1rAZvH7xxw2i6d//jI7cHn8O7GGzWPBplKP
	zSu0PBbvecnksenTJHaPEzN+s3hsXlLv8WLzTEaPj09vsQRwRmXbZKQmpqQWKaTmJeenZOal
	2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gCdqaRQlphTChQKSCwuVtK3synKLy1J
	VcjILy6xVUotSMkpMCvQK07MLS7NS9fLSy2xMjQwMDIFKkzIznj7tI294IxKxf3VlxgbGKfJ
	dzFyckgImEh0vPvH1sXIxSEksINR4uLe9SxdjBwcvAKCEn93CIPEhQW6GCUuXXrEDtIgJCAv
	cXZLAyOILSygLXFq5UVmEJtNQFOi68IWsBoRAX2J253fmUGamQUWM0u8PPqIGWIbr8SM9qcs
	ELa0xPblW8EGcQpYSVybeRYqLipxc/Vbdhj7/bH5jBC2iETrvbNQcwQlHvzcDRWXkjjTtgSq
	t1hi/ZrrTBB2jcTRJ/uh4uYSDW9XsoHYvAK+EnsXfwSLswioSvz/ch1qpovExB39YHFmoCe3
	v53DDAoIZqDH1u/ShyhRlNj5ey4jRAmfxLuvPawwb+2Y9wRqrbLEx28XGEFaJQQkJSbsMocI
	e0is7LkPDedGRonzN++xT2BUmIUI6llIFs9CWLyAkXkVo1hqQXFuemqyYYEhPHaT83M3MYKT
	rJbxDsbL8//pHWJk4mA8xCjBwawkwvvrGV+qEG9KYmVValF+fFFpTmrxIUZToJcnMkuJJucD
	03xeSbyhiaWBiZmRiYWxpbGZkjiv4oTZKUIC6YklqdmpqQWpRTB9TBycUg1MqpzxFywntP5p
	XxYRu/eIA9Py41Fb+Vut27Q1Lxk4VvZMuDPd9eYkjvnvPMympi6p7t7BpGxy6Mqq2OtxxgtK
	1GOjjL6u9pj+rz911ZRKxvt2d9Y6p73+/ZNLqaGD3yJp9sJsq0+z9k08aKYuED7tpvmCID79
	u+EN+ycv5OvrMeRSTQ7dssE+mvVvlc+VL5NuXNtmIeDEZjs9Q3YG54Ed+7Uby2bV7pn4xdXd
	r6Z3w44Lh3VvtJ1bkj/zy/G29x8/2exhr1OflT7ziOj/0xbtdz7y++k/urfstZLNFpM9BXrr
	PeZ+2vgoVazmUZFOtSW3+S8hYePD1nFWF6ZMmHAxqbHv7jZZ0WlcNbxWuxLZlFiKMxINtZiL
	ihMBhXJIvjsEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230924135059epcas1p4c0595d07a7d50da7a877a0af696d9c78
References: <202309242123.7ebe65b5-oliver.sang@intel.com>
	<CGME20230924135059epcas1p4c0595d07a7d50da7a877a0af696d9c78@epcms1p8>

> Hello,
> 
> kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h" on:
> 
> commit: 2041864a22d4f4e900d0a3def4985432a21d8e6d ("maple_tree: use mas_node_count_gfp() in mas_expected_entries()")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 940fcc189c51032dd0282cbee4497542c982ac59]
> 
> in testcase: boot
> 
> compiler: gcc-9
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202309242123.7ebe65b5-oliver.sang@intel.com
> 
> 
> [  113.582828][    T1] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:306
> [  113.583602][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
> [  113.584246][    T1] preempt_count: 1, expected: 0
> [  113.584613][    T1] RCU nest depth: 0, expected: 0 
> [  113.584983][    T1] 1 lock held by swapper/0/1:
> [ 113.585344][ T1] #0: ffffc9000001fc10 (&mt->ma_lock){+.+.}-{2:2}, at: check_forking+0x1e0/0x5c0 
Dear Liam,

mas_expected_entries() in check_forking() tried to sleep while holding spinlock, and panic occurred.
I think mas_expected_entries() in lib/test_maple_tree.c need to be modified to align with commit 2041864a22d4f. 
Do you have any idea for it? or Could you give some guide?

Thanks
Jaeseon
 
> [  113.586160][    T1] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G                TN 6.6.0-rc2-00018-g2041864a22d4 #1
> [  113.586924][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [  113.587701][    T1] Call Trace:
> [  113.587949][    T1]  <TASK>
> [ 113.588172][ T1] dump_stack_lvl (lib/dump_stack.c:107) 
> [ 113.588540][ T1] dump_stack (lib/dump_stack.c:114) 
> [ 113.588668][ T1] __might_resched (kernel/sched/core.c:10188) 
> [ 113.588668][ T1] __might_sleep (kernel/sched/core.c:10117 (discriminator 17)) 
> [ 113.588668][ T1] kmem_cache_alloc (include/linux/kernel.h:112 include/linux/sched/mm.h:306 mm/slab.h:709 mm/slub.c:3460 mm/slub.c:3486 mm/slub.c:3493 mm/slub.c:3502) 
> [ 113.588668][ T1] ? mas_alloc_nodes (lib/maple_tree.c:160 lib/maple_tree.c:1249) 
> [ 113.588668][ T1] mas_alloc_nodes (lib/maple_tree.c:160 lib/maple_tree.c:1249) 
> [ 113.588668][ T1] mas_node_count_gfp (lib/maple_tree.c:1331) 
> [ 113.588668][ T1] mas_expected_entries (lib/maple_tree.c:5580) 
> [ 113.588668][ T1] check_forking+0x205/0x5c0 
> [ 113.588668][ T1] ? check_mas_store_gfp+0x580/0x580 
> [ 113.588668][ T1] ? mt_destroy_walk (lib/maple_tree.c:5273) 
> [ 113.588668][ T1] ? mtree_destroy (lib/maple_tree.c:6392) 
> [ 113.588668][ T1] ? lock_downgrade (kernel/locking/lockdep.c:5761) 
> [ 113.588668][ T1] ? __raw_spin_lock_init (kernel/locking/spinlock_debug.c:26) 
> [ 113.588668][ T1] maple_tree_seed (lib/test_maple_tree.c:3584) 
> [ 113.588668][ T1] ? check_empty_area_window+0x3000/0x3000 
> [ 113.588668][ T1] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:63 (discriminator 22)) 
> [ 113.588668][ T1] ? write_comp_data (kernel/kcov.c:236) 
> [ 113.588668][ T1] ? check_empty_area_window+0x3000/0x3000 
> [ 113.588668][ T1] do_one_initcall (init/main.c:1232) 
> [ 113.588668][ T1] ? trace_event_raw_event_initcall_level (init/main.c:1223) 
> [ 113.588668][ T1] ? parameq (kernel/params.c:171) 
> [ 113.588668][ T1] ? __kasan_kmalloc (mm/kasan/common.c:384) 
> [ 113.588668][ T1] kernel_init_freeable (init/main.c:1293 init/main.c:1310 init/main.c:1329 init/main.c:1547) 
> [ 113.588668][ T1] ? rest_init (init/main.c:1429) 
> [ 113.588668][ T1] kernel_init (init/main.c:1439) 
> [ 113.588668][ T1] ? rest_init (init/main.c:1429) 
> [ 113.588668][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
> [ 113.588668][ T1] ? rest_init (init/main.c:1429) 
> [ 113.588668][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312) 
> [  113.588668][    T1]  </TASK>
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20230924/202309242123.7ebe65b5-oliver.sang@intel.com
> 
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://protect2.fireeye.com/v1/url?k=cc5f4a3e-add45f07-cc5ec171-000babffae10-d841b249634d3b66&q=1&e=af92f0ae-c873-480a-8f2b-9d5c35053b67&u=https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests%2Fwiki
