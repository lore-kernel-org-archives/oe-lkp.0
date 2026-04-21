Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D151334B19A
	for <oe-lkp@lists.linux.dev>; Tue, 21 Apr 2026 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776774992; cv=none; b=X3o7Qse5Jglrq7AGiyIcodV5m5EahSSDHa1i4LhSdXiubvxMTFAW25tdIESybgQ1JL13AxpoxShLZMNq92JkiMReB61ri1nFuBLWg/f7s5GT6abOWcss4CeAPWynH9BviQ+rci7l+QcLgg7A2K6Jv9j3ekQ02hl0TZrLu4ij2OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776774992; c=relaxed/simple;
	bh=BSiDn09rjFq5ifAiTvIN+6ZbscY0qgSB9S54jEELWB0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKSx3vY5kvQO9FbpzfQC0ICHUNAIBytq68uKpVIDbCh/pV6+PjxdFr21aWbWXqvfPDsViTjfL54iNTUJh686504yJkYoig0Bzp35GkodcyixRiBnpylOahBHQDJ+NF2UgQhkGMK139wJaPw2azKLniTIEoth1iDLQcTgquKO5xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2PjvCI8; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2PjvCI8"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38cc8708d76so35416671fa.3
        for <oe-lkp@lists.linux.dev>; Tue, 21 Apr 2026 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776774989; x=1777379789; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K2umFNIY/BLyJ91U8ESVwZ5+480SIvdek4DpKYYkBZU=;
        b=O2PjvCI8/Fl6bRz2o9dJR3tYYwZvWnk7HZC366CIRQkQ8bjA37usOsYdSjwIuL84Un
         x3d0gNVbGfz+8mac384NgdkYFXE9Ej1UySjruutwvP3WDQb6qf4uOXDLqMEaBQGWJj9J
         EEQSPSotQm24eA7LDcYWUv9zgImIV1OaQI2ZZfSfOtDzsm1ri5lFSkD9OPVgR3sWiaUg
         zVxCQvtUcTIgTcaERhtfGdDWYOY/pvf0HrOAoY+nXMZ7ZaM17EfgiqD5ptwv4aNol1Z/
         dQ6osGnxIzNvuiTEGVeWBdBv0Dk/rdkEhRUF4QEVcu37Nh/CsHXkZByXb/ZOCgy5p7tA
         SD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776774989; x=1777379789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2umFNIY/BLyJ91U8ESVwZ5+480SIvdek4DpKYYkBZU=;
        b=r+csxw9sxkNKn+Z3rXSSSmQKRJr8HJBIizTFdHUs1XU3o6J5AbJrBLyf8N9jroesMH
         I3+tvKBzAVU9h8WAOf9Tq+Imh/fQ6SC1mrzYLMPjXJYnNd2tnGkqoTysEdg/FaMmhgiU
         ZDOuGruou6SuyOGnuvvpFfiURiwoBiLRqnMI73bVvoqS7ZCJzsIhRD4RLUx7WHQWuSTN
         IbIfAw0ioBUgorusiG6epHCivTWmQkmLQTkjcAVH/M98Tvc1QfCHGrR419ou+PIQ/yZv
         fmRCLOL5oOuv/yqfWMESyWL2Ldf6vOJ4LG7xWujLSzgZZ7NNSE0iIKPhIX/KTS2InQcQ
         xkjw==
X-Forwarded-Encrypted: i=1; AFNElJ/GYwtNEVYyBdxPpTY0lG4l/apP9q/Z+JBwnbE6DObNoPlJp1Wx1isB4dUhKgoQGc05UXVRatY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCJ0G/OmVnr0EsWkdSLUqg2by2pxFN4RHIbnLRH6CWr1OA5Ji3
	NTbkYdZGOaqz/lWrx77ruf4+dZRhXfIjmQkKSteD86gW3xpey5YFocKQ
X-Gm-Gg: AeBDieu2ksbaGUQU4HdFBTmxP0AUxwXPevwuo0N8RBbH/+hdzmO1M9UcLCPAZs2hZRj
	4m/70f6eqwEjxw34So7CvkvBSnO4iR0gP6WuPPqFgDFfmbI95Rj6AmgjrsdIWBWq0SSNzGUOoEX
	FphdhoQ/HcuuZdCvsr+XDf4T3r1zM6aY6k4W3o99KpBgkNfBTCaW/aZQfocc+k9LrkfTqUwQ5WB
	iwl+Jhg/Se3J8ehDGubpnSke5AiI9sRaUGZUDlIkuHHvwKxwwpkcheOZrt799uIodeBmzVSmAY5
	5mwJLd/epCVKFDNzPrOuFNUqDSnPy0VU3G0LrqGhzUbnCv1SpLekHpfJgrA6Kdu7A/4+x3Ku6lt
	x6wQ4pSCnAkGrO6rfW4QW2ai6+3SjSK0+mxM/nXKyFg8OS0TSjwN1NZHFcUR0f7KiBbnI8qvvMN
	6Xh8Ven8GeGw==
X-Received: by 2002:ac2:5b05:0:b0:5a4:175d:21a with SMTP id 2adb3069b0e04-5a4175d0239mr4423230e87.2.1776774988560;
        Tue, 21 Apr 2026 05:36:28 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm30395521fa.26.2026.04.21.05.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:36:28 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 21 Apr 2026 14:36:26 +0200
To: Thomas Graf <tgraf@suug.ch>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Uladzislau Rezki <urezki@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [linus:master] [mm]  c6307674ed:
 BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
Message-ID: <aedvSnhOGM_mauYP@milan>
References: <202604211323.fac1b29e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604211323.fac1b29e-lkp@intel.com>

Hello, Thomas, Herbert Xu!

> 
> kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c" on:
> 
> commit: c6307674ed82c0c57d6e1e3408e84ac449ab8e94 ("mm: kvmalloc: add non-blocking support for vmalloc")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linus/master      40286d6379aacfcc053253ef78dc78b09addffda]
> [test failed on linux-next/master 936c21068d7ade00325e40d82bfd2f3f29d9f659]
> 
> in testcase: kunit
> version: 
> with following parameters:
> 
> 	group: group-01
> 
> 
> 
> config: x86_64-rhel-9.4-kunit
> compiler: gcc-14
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202604211323.fac1b29e-lkp@intel.com
> 
> 
> 
> [  149.217862][ T4054] BUG: sleeping function called from invalid context at mm/vmalloc.c:3435
> [  149.226291][ T4054] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 4054, name: rhashtable_thra
> [  149.235634][ T4054] preempt_count: 0, expected: 0
> [  149.240353][ T4054] RCU nest depth: 1, expected: 0
> [  149.245166][ T4054] CPU: 1 UID: 0 PID: 4054 Comm: rhashtable_thra Tainted: G S  B            N  6.18.0-rc5-00047-gc6307674ed82 #1 PREEMPT(voluntary)
> [  149.245176][ T4054] Tainted: [S]=CPU_OUT_OF_SPEC, [B]=BAD_PAGE, [N]=TEST
> [  149.245178][ T4054] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
> [  149.245181][ T4054] Call Trace:
> [  149.245185][ T4054]  <TASK>
> [  149.245189][ T4054]  dump_stack_lvl (lib/dump_stack.c:122)
> [  149.245200][ T4054]  __might_resched.cold (kernel/sched/core.c:8928)
> [  149.245209][ T4054]  vfree (include/linux/kernel.h:61 mm/vmalloc.c:3435)
> [  149.245215][ T4054]  rhashtable_try_insert (lib/rhashtable.c:476 lib/rhashtable.c:635)
> [  149.245223][ T4054]  ? sysvec_apic_timer_interrupt (arch/x86/include/asm/hardirq.h:78 (discriminator 2) arch/x86/kernel/apic/apic.c:1052 (discriminator 2))
> [  149.245229][ T4054]  ? sysvec_apic_timer_interrupt (arch/x86/include/asm/hardirq.h:78 (discriminator 2) arch/x86/kernel/apic/apic.c:1052 (discriminator 2))
> [  149.245235][ T4054]  ? __pfx_rhashtable_try_insert (lib/rhashtable.c:592)
> [  149.245242][ T4054]  rhashtable_insert_slow (lib/rhashtable.c:648)
> [  149.245247][ T4054] insert_retry+0x257/0x630 test_rhashtable
> [  149.245260][ T4054] threadfunc (lib/test_rhashtable.c:633) test_rhashtable
> [  149.245269][ T4054]  ? try_to_wake_up (kernel/sched/core.c:4297)
> [  149.245275][ T4054]  ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:107 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:2170 (discriminator 4) include/linux/atomic/atomic-instrumented.h:1302 (discriminator 4) include/asm-generic/qspinlock.h:111 (discriminator 4) include/linux/spinlock.h:187 (discriminator 4) include/linux/spinlock_api_smp.h:111 (discriminator 4) kernel/locking/spinlock.c:162 (discriminator 4))
> [  149.245281][ T4054]  ? __pfx_threadfunc (lib/test_rhashtable.c:618) test_rhashtable
> [  149.245289][ T4054]  ? __pfx_autoremove_wake_function (kernel/sched/wait.c:402)
> [  149.245295][ T4054]  ? __kthread_parkme (arch/x86/include/asm/bitops.h:202 (discriminator 1) arch/x86/include/asm/bitops.h:232 (discriminator 1) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 1) kernel/kthread.c:290 (discriminator 1))
> [  149.245301][ T4054]  ? __pfx_threadfunc (lib/test_rhashtable.c:618) test_rhashtable
> [  149.245309][ T4054]  ? __pfx_threadfunc (lib/test_rhashtable.c:618) test_rhashtable
> [  149.245317][ T4054]  kthread (kernel/kthread.c:463)
> [  149.245322][ T4054]  ? __pfx_kthread (kernel/kthread.c:412)
> [  149.245326][ T4054]  ? __pfx__raw_spin_lock_irq (kernel/locking/spinlock.c:169)
> [  149.245331][ T4054]  ? __pfx_kthread (kernel/kthread.c:412)
> [  149.245335][ T4054]  ? __pfx_kthread (kernel/kthread.c:412)
> [  149.245339][ T4054]  ret_from_fork (arch/x86/kernel/process.c:164)
> [  149.245344][ T4054]  ? __pfx_kthread (kernel/kthread.c:412)
> [  149.245348][ T4054]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
> [  149.245356][ T4054]  </TASK>
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260421/202604211323.fac1b29e-lkp@intel.com
> 
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
<snip>
diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index 6074ed5f66f3..a892766dcedd 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -473,7 +473,7 @@ static int rhashtable_insert_rehash(struct rhashtable *ht,
 
 	err = rhashtable_rehash_attach(ht, tbl, new_tbl);
 	if (err) {
-		bucket_table_free(new_tbl);
+		call_rcu(&new_tbl->rcu, bucket_table_free_rcu);
 		if (err == -EEXIST)
 			err = 0;
 	} else
<snip>

Could you please check? The problem here is

rcu_read_lock()
    rhashtable_insert_rehash()
        vfree();
rcu_read_unlokc();

we can just defer freeing via call_rcu().

--
Uladzislau Rezki
