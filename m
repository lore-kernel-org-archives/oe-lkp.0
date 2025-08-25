Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875BA393DD0
	for <oe-lkp@lists.linux.dev>; Mon, 25 Aug 2025 10:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117634; cv=none; b=iYhUYnWAy5mFEvSnDoIk5D/ZgAhyEOYWEft7Tb2fs26gLklzYbe2+UwFZGFyMqNQxj5ueUPgTt2LOw7cDlWoQ/EDy35XHEZ6LLt3PX5Zy5egebyvnSLoEAbUmwWNKi7A06Z3yAt53cQxv+H49VwP0bPYKLOLEWEtkPEN6FiCiLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117634; c=relaxed/simple;
	bh=7eXQe0ppR67crwIxzEGbI8HTL2j+eg2UeV1vOND7m8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAm/rRFZ/pk6ztVyyTx2UjXEL+3hIxt5uIhmZLZWenRoMFTfVHNRslHMvEyfSTcMlxF+GTuW0a+tea+uOT9yp3/WaGHKFuLQWTOBvHIT84OkZbTh7SL9hauyr+O22QaSkUl1J1nD/wixDcVOP7ik95D4GnHoQQSjRgkWieOg+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbH6pmxm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbH6pmxm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27661C4CEED;
	Mon, 25 Aug 2025 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756117634;
	bh=7eXQe0ppR67crwIxzEGbI8HTL2j+eg2UeV1vOND7m8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KbH6pmxmwtV7AmRZ596tGKRt9t7M7lAxvdMbUw+oaoyUFMMA+EyQy05hGJ3g9WwsB
	 Z1eMAAN0hLLeLUvb6KAzpYAn5REKd9ruZ9Tp7F7miFd9NnlMKIGXs/OUUbWERoUDQn
	 aM7jJisqh7oNweuIFKK0Hpty4DmFY33T+XE2EIKeWWEBvYToPKgm2TpiWFGzodZPpc
	 ks1MXF09AJ75Wy9QWZhT7FsaHaZiB2GuBTTwLlwykW8ZvOVYcxMceKfewYi5waVo5Y
	 0cqenAwDmaLHn1YX3eGSdNdZn19a8DMMgJ68FVHFHIJDWIi4e0SmxzR+EZkFV5lmUG
	 QfFpG5ucwxINw==
Date: Mon, 25 Aug 2025 13:27:08 +0300
From: Mike Rapoport <rppt@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	David Hildenbrand <david@redhat.com>,
	Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm/mm_init]  8a523d9e6f:
 BUG:sleeping_function_called_from_invalid_context_at_mm/mm_init.c
Message-ID: <aKw6fG9eryVNmeEc@kernel.org>
References: <202508251443.f2d9f77f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508251443.f2d9f77f-lkp@intel.com>

Hi,

On Mon, Aug 25, 2025 at 03:01:12PM +0800, kernel test robot wrote:
> 
> Hello,
> 
> kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_mm/mm_init.c" on:
> 
> commit: 8a523d9e6f30349ad2f8c34d850483db905e976b ("mm/mm_init: use deferred_init_memmap_chunk() in deferred_grow_zone()")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 0f4c93f7eb861acab537dbe94441817a270537bf]
> 
> in testcase: blktests
> version: blktests-x86_64-34a7fc4-1_20250824
> with following parameters:
> 
> 	disk: 1SSD
> 	test: nvme-group-00
> 
> config: x86_64-rhel-9.4-func
> compiler: gcc-12
> test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory

This patch should fix it:


diff --git a/mm/mm_init.c b/mm/mm_init.c
index f907dc17387d..c26f33fdd32b 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2085,7 +2085,10 @@ deferred_init_memmap_chunk(unsigned long start_pfn, unsigned long end_pfn,
 			deferred_free_pages(spfn, chunk_end - spfn);
 
 			spfn = chunk_end;
-			cond_resched();
+			if (irqs_disabled())
+				touch_nmi_watchdog();
+			else
+				cond_resched();
 		}
 	}
 
 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202508251443.f2d9f77f-lkp@intel.com
> 
> 
> kern  :err   : [    9.708923] BUG: sleeping function called from invalid context at mm/mm_init.c:2153
> kern  :err   : [    9.709485] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
> kern  :err   : [    9.709485] preempt_count: 1, expected: 0
> kern  :err   : [    9.709485] RCU nest depth: 0, expected: 0
> kern  :warn  : [    9.709485] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc1-00003-g8a523d9e6f30 #1 PREEMPT(voluntary)
> kern  :warn  : [    9.709485] Hardware name: IEIT SYSTEMS NF5180-M8-A0-R0-00/NF5180-M8-A0-R0-00, BIOS 00.14.04 09/23/2024
> kern  :warn  : [    9.709485] Call Trace:
> kern  :warn  : [    9.709485]  <TASK>
> kern :warn : [    9.709485] dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1)) 
> kern :warn : [    9.709485] __might_resched (kernel/sched/core.c:8958) 
> kern :warn : [    9.709485] deferred_init_memmap_chunk (include/linux/sched.h:2070 mm/mm_init.c:2153) 
> kern :warn : [    9.709485] ? __pfx_deferred_init_memmap_chunk (mm/mm_init.c:2140) 
> kern :warn : [    9.709485] ? __pfx_try_to_claim_block (mm/page_alloc.c:2291) 
> kern :warn : [    9.709485] ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161) 
> kern :warn : [    9.709485] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162) 
> kern :warn : [    9.709485] ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161) 
> kern :warn : [    9.709485] ? rmqueue+0x8f7/0x29d0 
> kern :warn : [    9.709485] deferred_grow_zone (mm/mm_init.c:2286) 
> kern :warn : [    9.709485] get_page_from_freelist (mm/page_alloc.c:3824) 
> kern :warn : [    9.709485] __alloc_frozen_pages_noprof (mm/page_alloc.c:5148) 
> kern :warn : [    9.709485] ? __pfx___alloc_frozen_pages_noprof (mm/page_alloc.c:5114) 
> kern :warn : [    9.709485] ? __pfx_smp_call_function_many_cond (kernel/smp.c:784) 
> kern :warn : [    9.709485] __alloc_pages_noprof (mm/page_alloc.c:5182) 
> kern :warn : [    9.709485] dsalloc_pages (arch/x86/events/intel/ds.c:611) 
> kern :warn : [    9.709485] ? __asan_memset (mm/kasan/shadow.c:84) 
> kern :warn : [    9.709485] reserve_ds_buffers (arch/x86/events/intel/ds.c:631 arch/x86/events/intel/ds.c:789) 
> kern :warn : [    9.709485] x86_reserve_hardware (arch/x86/events/core.c:420 arch/x86/events/core.c:409) 
> kern :warn : [    9.709485] x86_pmu_event_init (arch/x86/events/core.c:673 arch/x86/events/core.c:2475) 
> kern :warn : [    9.709485] ? kmem_cache_alloc_node_noprof (arch/x86/include/asm/jump_label.h:46 include/linux/memcontrol.h:1714 mm/slub.c:2210 mm/slub.c:4190 mm/slub.c:4229 mm/slub.c:4281) 
> kern :warn : [    9.709485] perf_try_init_event (kernel/events/core.c:12581) 
> kern :warn : [    9.709485] perf_event_alloc (kernel/events/core.c:12680 kernel/events/core.c:12954) 
> kern :warn : [    9.709485] ? __pfx_watchdog_overflow_callback (kernel/watchdog_perf.c:107) 
> kern :warn : [    9.709485] perf_event_create_kernel_counter (kernel/events/core.c:13779 (discriminator 1)) 
> kern :warn : [    9.709485] hardlockup_detector_event_create (kernel/watchdog_perf.c:133 (discriminator 3)) 
> kern :warn : [    9.709485] watchdog_hardlockup_probe (kernel/watchdog_perf.c:267) 
> kern :warn : [    9.709485] lockup_detector_init (kernel/watchdog.c:1312) 
> kern :warn : [    9.709485] kernel_init_freeable (init/main.c:1571) 
> kern :warn : [    9.709485] ? __pfx_kernel_init (init/main.c:1461) 
> kern :warn : [    9.709485] kernel_init (init/main.c:1471) 
> kern :warn : [    9.709485] ? calculate_sigpending (kernel/signal.c:194) 
> kern :warn : [    9.709485] ? __pfx_kernel_init (init/main.c:1461) 
> kern :warn : [    9.709485] ret_from_fork (arch/x86/kernel/process.c:148) 
> kern :warn : [    9.709485] ? __pfx_kernel_init (init/main.c:1461) 
> kern :warn : [    9.709485] ret_from_fork_asm (arch/x86/entry/entry_64.S:258) 
> kern  :warn  : [    9.709485]  </TASK>
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250825/202508251443.f2d9f77f-lkp@intel.com
> 
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
Sincerely yours,
Mike.
