Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334D64315F
	for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 17:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086685; cv=none; b=klQ+cLzlnmOK5Dlm9L9jd12V5tSnNHSTOa/MmsT8ufk18CDbzk5excqsarYenzyUf/RsBcAcQmEFnoxfVhhfSbS6qCpm7BMvGbahDd3t4ht5TbUM3wnxD5dgnGLTOTQ3700nxg2+/PJvTS9WnTqtdcLfg4kfBad6TV4Pfr7mZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086685; c=relaxed/simple;
	bh=q7CIv043upJ6PAizi8nKRjJYO55XJMV+94dCRIUknXw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=t3vPI8t3xzDXOzAuMvSEHLbMVihQgJJE+qEjox7rvMPzUmtOvZto8dEfQZgQwMMG0+P2Z8j2cBOcOUdO4Fnr8kiQNsd/Id4LMIEB8nl7dyfa6A/zE9hC4Gk+njQxqmyJX0jKif6gbY/OjfZtl0riPEarZjh+kUxGuE8sVKa1KLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AfNU/faY; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AfNU/faY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f42992f608so8381782a91.0
        for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 09:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738086681; x=1738691481; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4T5T7d177timbhrWJrqPnfG2RISTo28IAiTUDaRBAVw=;
        b=AfNU/faYBzlukefFrhKaGzscEuN3wfbkAyroHW/XItrsujTMHH6s6M+cBBG0v2CX6P
         rmwqnWUyOA6FMEeBNRt/MhbxoYd8yBCkgEoJN9+HYsLKLblCP+gbuXm1ZTvJSGTWWa8T
         i/3UqAqxHg03HTTMsiRrvUVAswafrdjiqNc0h/LND07l/qFpn00539xjT7vJX5I+CkQx
         LepO7+QFvaEViTzxTLoNTIQ2s3kstvv2vqMYQQczGEzoFqExCP96ZW5RC8Z1GCu4jd6t
         ANuIZNppgj5/9v4Ff7HGQBCpFFjr3pBNiAUkIL4+JJgZsWVgTho/RA841vQMQICuiGEs
         E9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738086681; x=1738691481;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4T5T7d177timbhrWJrqPnfG2RISTo28IAiTUDaRBAVw=;
        b=ItlQw06uP2nbuTnAvB2V309i81hu8hV7OeKsjvIbvHP/BxGbfeZXsELEInQIijCFQz
         xteatXlDi+5ybxfLAxwAS34Te1x6sL5QxPrxiE6jY0ZxkssGx9ggOd7MXjZ52w5beWIW
         58z3pd6UrCol68oj1ILRR3vrgQBPzf+riGV6Bn4XJHaZtnBjDPOaIqdagGrnxTkS594y
         NHP+4SRMGu7rYphbuj39FSFjoqAALLlwdtWSSabpl8zeovaXMaueRAhqTWlUfANvsjQj
         j/P4/mAs0PxDmyeN7xw2EERZBM5wT0JPnkDfNFvgKeRcVmeSnaEKrIHthPlcCVrnY9JD
         xNqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkk4kvZe5lQCKDXUrYWAdohgwLd2/jRh+vjRPhmC9cte7w1uDWPQ9mycrMjgDc0Hpgef0PXDs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5wShQuof9TXe5RY/eHtGydU2GvI3Ng5+jIHzS9e7oRZbEEiUe
	AxiecmyEwApl3mdU6pBafOlSnJsjb2eqxrE5BB97VGPMwkcwcu48gCXFFUIPMEigV8IFeNLZzfe
	k
X-Gm-Gg: ASbGnctkjEcfiYRkjwc7p8GVMFZ+G2cKZp/1t/9PMkeISykCJy3tLFFc7PNfm/gNFx+
	5tAN7jGeG6HDN+et54U9KgnFlwMooUa1IjzJGp2+UX9ZbfOm8Xy/plky7xTu1k+RC5tY8p4rbUR
	6ITQAzbOAxPBdFCl3yJBQeVqLNA0k9EWcugGkymV2CMevih/bnCI4isGyX2o5i6nGxv1pI0Ke03
	+v9ov8he/sFUK6o3o0X40RULO+eH5ey8oQkyBgX73Ili6UIa0y2mR3FexOw9ccYU9vMMTXrKMq+
	Mk3Z3fs8NAlns6w65L2iO4m0D3YAZo4pYHdSVLYLFb2om//mpe/mELwj5PRIcfbSKbOhOJ+vJJz
	Fudihe1X0Ngf36wI=
X-Google-Smtp-Source: AGHT+IGq0im8XULYbmsOXVJujms6oqb3nZb1MADee1E/f509F71B3i6G02pOnddarjNnM+T9f83JJQ==
X-Received: by 2002:a17:90b:4d0e:b0:2ee:bf84:4fe8 with SMTP id 98e67ed59e1d1-2f782d69fc7mr8926596a91.30.1738086681411;
        Tue, 28 Jan 2025 09:51:21 -0800 (PST)
Received: from ?IPV6:240e:370:8b13:97f0:154c:a6ff:49c9:f239? ([240e:370:8b13:97f0:154c:a6ff:49c9:f239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffafa400sm9592864a91.36.2025.01.28.09.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 09:51:20 -0800 (PST)
Message-ID: <fdbcb6f8-caf7-48cb-810b-44ff8c75ae5b@bytedance.com>
Date: Wed, 29 Jan 2025 01:51:10 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
Content-Language: en-US
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Rik van Riel <riel@surriel.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Rientjes <rientjes@google.com>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
 Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Will Deacon <will@kernel.org>, Zach O'Keefe <zokeefe@google.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <202501281734.d408a35b-lkp@intel.com>
 <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
 <20250128113100.GB7145@noisy.programming.kicks-ass.net>
 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
 <20250128132847.GB505@noisy.programming.kicks-ass.net>
 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
 <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
In-Reply-To: <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2025/1/29 01:06, Qi Zheng wrote:
> Hi,
> 

[...]

> @[
> _raw_spin_unlock_irqrestore+5
> get_page_from_freelist+2014
> __alloc_frozen_pages_noprof+364
> alloc_pages_mpol+123
> alloc_pages_noprof+14
> pte_alloc_one+30
> __pte_alloc+42
> do_pte_missing+2499
> __handle_mm_fault+1862
> handle_mm_fault+195
> __get_user_pages+690
> populate_vma_page_range+127
> __mm_populate+159
> vm_mmap_pgoff+329
> do_syscall_64+98
> entry_SYSCALL_64_after_hwframe+118
> , stress-ng-mmapa]: 2443
> @[
> _raw_spin_unlock_irqrestore+5
> get_page_from_freelist+2014
> __alloc_frozen_pages_noprof+364
> alloc_pages_mpol+123
> alloc_pages_noprof+14
> get_free_pages_noprof+17
> __x64_sys_mincore+141
> do_syscall_64+98
> entry_SYSCALL_64_after_hwframe+118
> , stress-ng-mmapa]: 5184
> @[
> _raw_spin_unlock_irqrestore+5
> free_one_page+85
> tlb_remove_table_rcu+140
> rcu_do_batch+424
> rcu_core+401
> handle_softirqs+204
> irq_exit_rcu+208
> sysvec_apic_timer_interrupt+113
> asm_sysvec_apic_timer_interrupt+26
> _raw_spin_unlock_irqrestore+29
> get_page_from_freelist+2014
> __alloc_frozen_pages_noprof+364
> alloc_pages_mpol+123
> alloc_pages_noprof+14
> get_free_pages_noprof+17
> __x64_sys_mincore+141
> do_syscall_64+98
> entry_SYSCALL_64_after_hwframe+118
> , stress-ng-mmapa]: 5301
> @Error looking up stack id 4294967279 (pid -1): -1
> [, stress-ng-mmapa]: 53366
> 
> It seems to be related to CONFIG_MMU_GATHER_RCU_TABLE_FREE?

I did the following test and reproduced the same performance regression:

1) disable CONFIG_PT_RECLAIM

CONFIG_ARCH_SUPPORTS_PT_RECLAIM=y
# CONFIG_PT_RECLAIM is not set

2) apply Rik's patch #1 
(https://lore.kernel.org/lkml/20250123042447.2259648-2-riel@surriel.com/):

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 87198d957e2f1..17197d395976e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -277,7 +277,7 @@ config X86
         select HAVE_PCI
         select HAVE_PERF_REGS
         select HAVE_PERF_USER_STACK_DUMP
-       select MMU_GATHER_RCU_TABLE_FREE        if PARAVIRT
+       select MMU_GATHER_RCU_TABLE_FREE
         select MMU_GATHER_MERGE_VMAS
         select HAVE_POSIX_CPU_TIMERS_TASK_WORK
         select HAVE_REGS_AND_STACK_ACCESS_API
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 1ccaa3397a670..527f5605aa3e5 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -59,21 +59,6 @@ void __init native_pv_lock_init(void)
                 static_branch_enable(&virt_spin_lock_key);
  }

-#ifndef CONFIG_PT_RECLAIM
-static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-       struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-       pagetable_dtor(ptdesc);
-       tlb_remove_page(tlb, ptdesc_page(ptdesc));
-}
-#else
-static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-       tlb_remove_table(tlb, table);
-}
-#endif
-
  struct static_key paravirt_steal_enabled;
  struct static_key paravirt_steal_rq_enabled;

@@ -195,7 +180,7 @@ struct paravirt_patch_template pv_ops = {
         .mmu.flush_tlb_kernel   = native_flush_tlb_global,
         .mmu.flush_tlb_one_user = native_flush_tlb_one_user,
         .mmu.flush_tlb_multi    = native_flush_tlb_multi,
-       .mmu.tlb_remove_table   = native_tlb_remove_table,
+       .mmu.tlb_remove_table   = tlb_remove_table,

         .mmu.exit_mmap          = paravirt_nop,
         .mmu.notify_page_enc_status_changed     = paravirt_nop,
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 1fef5ad32d5a8..b1c1f72c1fd1b 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -18,25 +18,6 @@ EXPORT_SYMBOL(physical_mask);
  #define PGTABLE_HIGHMEM 0
  #endif

-#ifndef CONFIG_PARAVIRT
-#ifndef CONFIG_PT_RECLAIM
-static inline
-void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-       struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-       pagetable_dtor(ptdesc);
-       tlb_remove_page(tlb, ptdesc_page(ptdesc));
-}
-#else
-static inline
-void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-       tlb_remove_table(tlb, table);
-}
-#endif /* !CONFIG_PT_RECLAIM */
-#endif /* !CONFIG_PARAVIRT */
-
  gfp_t __userpte_alloc_gfp = GFP_PGTABLE_USER | PGTABLE_HIGHMEM;

  pgtable_t pte_alloc_one(struct mm_struct *mm)
@@ -64,7 +45,7 @@ early_param("userpte", setup_userpte);
  void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
  {
         paravirt_release_pte(page_to_pfn(pte));
-       paravirt_tlb_remove_table(tlb, page_ptdesc(pte));
+       tlb_remove_table(tlb, page_ptdesc(pte));
  }

  #if CONFIG_PGTABLE_LEVELS > 2
@@ -78,21 +59,21 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
  #ifdef CONFIG_X86_PAE
         tlb->need_flush_all = 1;
  #endif
-       paravirt_tlb_remove_table(tlb, virt_to_ptdesc(pmd));
+       tlb_remove_table(tlb, virt_to_ptdesc(pmd));
  }

  #if CONFIG_PGTABLE_LEVELS > 3
  void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
  {
         paravirt_release_pud(__pa(pud) >> PAGE_SHIFT);
-       paravirt_tlb_remove_table(tlb, virt_to_ptdesc(pud));
+       tlb_remove_table(tlb, virt_to_ptdesc(pud));
  }

  #if CONFIG_PGTABLE_LEVELS > 4
  void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
  {
         paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
-       paravirt_tlb_remove_table(tlb, virt_to_ptdesc(p4d));
+       tlb_remove_table(tlb, virt_to_ptdesc(p4d));
  }
  #endif /* CONFIG_PGTABLE_LEVELS > 4 */
  #endif /* CONFIG_PGTABLE_LEVELS > 3 */

Then do the following test:

stress-ng --timeout 60 --times --verify --metrics --no-rand-seed 
--mmapaddr 64

The test results are as follows:

root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmapaddr 64
stress-ng: info:  [870] dispatching hogs: 64 mmapaddr
stress-ng: info:  [870] successful run completed in 60.07s (1 min, 0.07 
secs)
stress-ng: info:  [870] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [870]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [870] mmapaddr       17841978     60.01    237.78 
1130.36    297306.42     13041.05
stress-ng: info:  [870] for a 60.07s run time:
stress-ng: info:  [870]    1441.79s available CPU time
stress-ng: info:  [870]     238.14s user time   ( 16.52%)
stress-ng: info:  [870]    1130.80s system time ( 78.43%)
stress-ng: info:  [870]    1368.94s total time  ( 94.95%)
stress-ng: info:  [870] load average: 57.42 21.77 7.97

The perf hotspots are as follows:

   15.59%  [kernel]  [k] _raw_spin_unlock_irqrestore
    9.14%  [kernel]  [k] clear_page_rep
    7.17%  [kernel]  [k] do_syscall_64
    3.69%  [kernel]  [k] _raw_spin_lock
    3.37%  [kernel]  [k] __slab_free
    2.06%  [kernel]  [k] rcu_cblist_dequeue
    2.01%  [kernel]  [k] flush_tlb_mm_range
    1.84%  [kernel]  [k] lruvec_stat_mod_folio.part.131
    1.79%  [kernel]  [k] get_page_from_freelist
    1.64%  [kernel]  [k] kmem_cache_alloc_noprof
    1.53%  [kernel]  [k] tlb_remove_table_rcu
    1.48%  [kernel]  [k] mtree_range_walk

The call stack is as follows:

@[
_raw_spin_unlock_irqrestore+5
free_one_page+85
rcu_do_batch+424
rcu_core+401
handle_softirqs+204
irq_exit_rcu+208
sysvec_apic_timer_interrupt+113
asm_sysvec_apic_timer_interrupt+26
_raw_spin_unlock_irqrestore+29
get_page_from_freelist+2014
__alloc_frozen_pages_noprof+364
alloc_pages_mpol+123
alloc_pages_noprof+14
pte_alloc_one+30
__pte_alloc+42
do_pte_missing+2493
__handle_mm_fault+1914
handle_mm_fault+195
__get_user_pages+690
populate_vma_page_range+127
__mm_populate+159
vm_mmap_pgoff+329
do_syscall_64+98
entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 1306
@[
_raw_spin_unlock_irqrestore+5
get_page_from_freelist+2014
__alloc_frozen_pages_noprof+364
alloc_pages_mpol+123
alloc_pages_noprof+14
pte_alloc_one+30
__pte_alloc+42
move_page_tables+2285
move_vma+472
__do_sys_mremap+1759
do_syscall_64+98
entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 1536
@[
_raw_spin_unlock_irqrestore+5
free_one_page+85
tlb_remove_table_rcu+140
rcu_do_batch+424
rcu_core+401
handle_softirqs+204
irq_exit_rcu+208
sysvec_apic_timer_interrupt+113
asm_sysvec_apic_timer_interrupt+26
_raw_spin_unlock_irqrestore+29
get_page_from_freelist+2014
__alloc_frozen_pages_noprof+364
alloc_pages_mpol+123
alloc_pages_noprof+14
get_free_pages_noprof+17
tlb_remove_table+82
free_pgd_range+655
free_pgtables+601
vms_clear_ptes.part.39+255
vms_complete_munmap_vmas+311
do_vmi_align_munmap+419
do_vmi_munmap+195
move_vma+802
__do_sys_mremap+1759
do_syscall_64+98
entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 1558
@[
_raw_spin_unlock_irqrestore+5
__hrtimer_run_queues+255
hrtimer_interrupt+258
__sysvec_apic_timer_interrupt+85
sysvec_apic_timer_interrupt+56
asm_sysvec_apic_timer_interrupt+26
, stress-ng-mmapa]: 1772
@[
_raw_spin_unlock_irqrestore+5
get_partial_node.part.102+378
___slab_alloc.part.103+1180
__slab_alloc.isra.104+34
kmem_cache_alloc_noprof+192
mas_alloc_nodes+358
mas_preallocate+151
__mmap_region+1883
do_mmap+1164
vm_mmap_pgoff+239
do_syscall_64+98
entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 2654
@[
_raw_spin_unlock_irqrestore+5
get_partial_node.part.102+378
___slab_alloc.part.103+1180
__slab_alloc.isra.104+34
kmem_cache_alloc_noprof+192
mas_alloc_nodes+358
mas_store_gfp+183
do_vmi_align_munmap+398
do_vmi_munmap+195
__vm_munmap+177
__x64_sys_munmap+27
do_syscall_64+98
entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 2810
@[
_raw_spin_unlock_irqrestore+5
free_one_page+85
tlb_remove_table_rcu+140
rcu_do_batch+424
rcu_core+401
handle_softirqs+204
irq_exit_rcu+208
sysvec_apic_timer_interrupt+113
asm_sysvec_apic_timer_interrupt+26
_raw_spin_unlock_irqrestore+29
get_page_from_freelist+2014
__alloc_frozen_pages_noprof+364
alloc_pages_mpol+123
alloc_pages_noprof+14
pte_alloc_one+30
__pte_alloc+42
do_pte_missing+2493
__handle_mm_fault+1914
handle_mm_fault+195
__get_user_pages+690
populate_vma_page_range+127
__mm_populate+159
vm_mmap_pgoff+329
do_syscall_64+98
entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 3044
@Error looking up stack id 4294967279 (pid -1): -1
[, stress-ng-mmapa]: 101654

Thanks!

