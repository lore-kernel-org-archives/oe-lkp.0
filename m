Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8528A6121
	for <oe-lkp@lists.linux.dev>; Wed, 14 Dec 2022 12:02:38 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id x11so6404763ljh.7
        for <oe-lkp@lists.linux.dev>; Wed, 14 Dec 2022 04:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4NAGef5mpK/XbuHGrtzJS0zI0UQGDSqXJ/sI3StH8Pg=;
        b=KJYw1rceBzoNsDgfbCRYUChxUV4OY9B2zKfQRtbAe8kvOGYwzf5JEuMPa3/qVqDbZG
         cYjhYZXN6dbEXlV1j5xu2vxmxmMBiYrQ2CNO+6mnhfF6kXbX8g8NuAz00PrhUmt+ey5p
         g09P1ZZsYBR/QGO6RAgdAoTcI6UUzdWHHvrCFY7rQh4VFQCq8wq8gIXcT1rbd3YkwG+g
         MmNELUuXdiKYf/DwY2TxtqGfgnLCI9tuh7NxpbLi76CyouVXgRdOu5WB+ti8/hi00DJM
         AfPP2nyxnGkmrFwI2DxJP/jw3NrJLAQXacfzYT2jYQcJVJqK97ZBNl8Ncb4heF911zZu
         uIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NAGef5mpK/XbuHGrtzJS0zI0UQGDSqXJ/sI3StH8Pg=;
        b=QGnEL4YXYkQa9Em0bfzrGpYLf4VG0UQxZMgw3JegtJG4JoGDb/G/9kcvO8h1iMEmEN
         BL/K2bOXCjSmICrqPpGi+yY9oL5G+3OK2+XJm3drtkk7cwJN2DwAzdo5ytYl/K21Vyfu
         6/fIRiF/miyXrUyMZN4ozlLT0vQ5ZrHZPW9/gWsABZSiCJj/F3Xy3V+p5XjI1gmOfOzB
         XOI+X3bgwx/5vG9CFpalXbowW+pJyPBOOeMgvoYpm2MRvETILtcKHKgvl17jUX3qpcjw
         jSqFM/aE4SmNqWB8DtHI+3G5pa/xQtTZf3j41z2dkPhTM8gGkh6LUxoNqgwBHdDhhIqH
         mCIA==
X-Gm-Message-State: ANoB5plZDCwpojGSlBlq5PQPzPi+DPBeX02rxPlHA8doCGAz60uW5riR
	WAWZEzVUhZziyw9IVAFaSH7lN/LBlM9D436rjec=
X-Google-Smtp-Source: AA0mqf6NQPYwChBBWS6sgRBy487g8mK6msqO3t9a73tolktOThr5Tz59imiqYYRBiWygPpkGQfI4FUDPXq9MJ+SXWBM=
X-Received: by 2002:a05:651c:2042:b0:27a:3cf0:6edc with SMTP id
 t2-20020a05651c204200b0027a3cf06edcmr1481846ljo.475.1671019356251; Wed, 14
 Dec 2022 04:02:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221212003711.24977-10-laoar.shao@gmail.com> <202212141512.469bca4-yujie.liu@intel.com>
In-Reply-To: <202212141512.469bca4-yujie.liu@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 14 Dec 2022 20:01:59 +0800
Message-ID: <CALOAHbA27JAf3JBpYfyQR+C88MJ5rWEJ9MAL-X-YqLSW2OQqYA@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 9/9] bpf: Use active vm to account bpf map
 memory usage
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com, songliubraving@fb.com, 
	yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com, 
	haoluo@google.com, jolsa@kernel.org, tj@kernel.org, dennis@kernel.org, 
	cl@linux.com, akpm@linux-foundation.org, penberg@kernel.org, 
	rientjes@google.com, iamjoonsoo.kim@lge.com, vbabka@suse.cz, 
	roman.gushchin@linux.dev, 42.hyeyoo@gmail.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 14, 2022 at 4:48 PM kernel test robot <yujie.liu@intel.com> wrote:
>
> Greeting,
>
> FYI, we noticed WARNING:suspicious_RCU_usage due to commit (built with gcc-11):
>
> commit: 8f13ff79ed924e23a36eb5c610ce48998ed69fd5 ("[RFC PATCH bpf-next 9/9] bpf: Use active vm to account bpf map memory usage")
> url: https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/mm-bpf-Add-BPF-into-proc-meminfo/20221212-083842
> base: https://git.kernel.org/cgit/linux/kernel/git/bpf/bpf-next.git master
> patch link: https://lore.kernel.org/all/20221212003711.24977-10-laoar.shao@gmail.com/
> patch subject: [RFC PATCH bpf-next 9/9] bpf: Use active vm to account bpf map memory usage
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
>
>
> [   31.975760][    T1] WARNING: suspicious RCU usage
> [   31.976682][    T1] 6.1.0-rc7-01609-g8f13ff79ed92 #5 Not tainted
> [   31.977802][    T1] -----------------------------
> [   31.978710][    T1] include/linux/rcupdate.h:376 Illegal context switch in RCU read-side critical section!
> [   31.980465][    T1]
> [   31.980465][    T1] other info that might help us debug this:
> [   31.980465][    T1]
> [   31.982355][    T1]
> [   31.982355][    T1] rcu_scheduler_active = 2, debug_locks = 1
> [   31.983818][    T1] 1 lock held by swapper/0/1:
> [ 31.984695][ T1] #0: ffffffff853269a0 (rcu_read_lock){....}-{1:2}, at: page_ext_get (??:?)
> [   31.986346][    T1]
> [   31.986346][    T1] stack backtrace:
> [   31.987467][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.0-rc7-01609-g8f13ff79ed92 #5
> [   31.989054][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [   31.990880][    T1] Call Trace:
> [   31.991554][    T1]  <TASK>
> [ 31.992173][ T1] dump_stack_lvl (??:?)
> [ 31.993034][ T1] __might_resched (??:?)
> [ 31.993970][ T1] __kmem_cache_alloc_node (??:?)
> [ 31.994993][ T1] ? active_vm_slab_add (??:?)
> [ 31.995976][ T1] ? active_vm_slab_add (??:?)
> [ 31.996918][ T1] __kmalloc_node (??:?)
> [ 31.997789][ T1] active_vm_slab_add (??:?)
> [ 31.998727][ T1] ? kasan_unpoison (??:?)
> [ 31.999615][ T1] __kmem_cache_alloc_node (??:?)
> [ 32.000615][ T1] ? __bpf_map_area_alloc (syscall.c:?)
> [ 32.001599][ T1] ? __bpf_map_area_alloc (syscall.c:?)
> [ 32.002575][ T1] __kmalloc_node (??:?)
> [ 32.003439][ T1] __bpf_map_area_alloc (syscall.c:?)
> [ 32.004417][ T1] array_map_alloc (arraymap.c:?)
> [ 32.005326][ T1] map_create (syscall.c:?)
> [ 32.006173][ T1] __sys_bpf (syscall.c:?)
> [ 32.006988][ T1] ? link_create (syscall.c:?)
> [ 32.007873][ T1] ? lock_downgrade (lockdep.c:?)
> [ 32.008790][ T1] kern_sys_bpf (??:?)
> [ 32.009636][ T1] ? bpf_sys_bpf (??:?)
> [ 32.010469][ T1] ? trace_hardirqs_on (??:?)
> [ 32.011395][ T1] ? _raw_spin_unlock_irqrestore (??:?)
> [ 32.012432][ T1] ? __stack_depot_save (??:?)
> [ 32.013391][ T1] skel_map_create+0xba/0xeb
> [ 32.014423][ T1] ? skel_map_update_elem+0xe3/0xe3
> [ 32.015527][ T1] ? kasan_save_stack (??:?)
> [ 32.016422][ T1] ? kasan_set_track (??:?)
> [ 32.017308][ T1] ? __kasan_kmalloc (??:?)
> [ 32.018233][ T1] ? kernel_init (main.c:?)
> [ 32.019090][ T1] ? lock_acquire (??:?)
> [ 32.019968][ T1] ? find_held_lock (lockdep.c:?)
> [ 32.020858][ T1] ? __kmem_cache_alloc_node (??:?)
> [ 32.021875][ T1] bpf_load_and_run+0x93/0x3f5
> [ 32.022920][ T1] ? skel_map_create+0xeb/0xeb
> [ 32.023959][ T1] ? lock_downgrade (lockdep.c:?)
> [ 32.024885][ T1] ? __kmem_cache_alloc_node (??:?)
> [ 32.025919][ T1] ? load_skel (bpf_preload_kern.c:?)
> [ 32.026767][ T1] ? rcu_read_lock_sched_held (??:?)
> [ 32.027781][ T1] ? __kmalloc_node (??:?)
> [ 32.030065][ T1] load_skel (bpf_preload_kern.c:?)
> [ 32.030869][ T1] ? bpf_load_and_run+0x3f5/0x3f5
> [ 32.031963][ T1] ? kvm_clock_get_cycles (kvmclock.c:?)
> [ 32.032914][ T1] ? btf_vmlinux_init (bpf_preload_kern.c:?)
> [ 32.033801][ T1] load (bpf_preload_kern.c:?)
> [ 32.034501][ T1] ? btf_vmlinux_init (bpf_preload_kern.c:?)
> [ 32.035407][ T1] do_one_initcall (??:?)
> [ 32.036266][ T1] ? trace_event_raw_event_initcall_level (??:?)
> [ 32.037446][ T1] ? parse_one (??:?)
> [ 32.038320][ T1] ? __kmem_cache_alloc_node (??:?)
> [ 32.039369][ T1] do_initcalls (main.c:?)
> [ 32.040314][ T1] kernel_init_freeable (main.c:?)
> [ 32.041304][ T1] ? console_on_rootfs (main.c:?)
> [ 32.042213][ T1] ? usleep_range_state (??:?)
> [ 32.043197][ T1] ? rest_init (main.c:?)
> [ 32.044036][ T1] ? rest_init (main.c:?)
> [ 32.044879][ T1] kernel_init (main.c:?)
> [ 32.045715][ T1] ret_from_fork (??:?)
> [   32.046587][    T1]  </TASK>
> [   32.047273][    T1] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:274
> [   32.048966][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
> [   32.050596][    T1] preempt_count: 1, expected: 0
> [   32.051521][    T1] 1 lock held by swapper/0/1:
> [ 32.052424][ T1] #0: ffffffff853269a0 (rcu_read_lock){....}-{1:2}, at: page_ext_get (??:?)
> [   32.054113][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.0-rc7-01609-g8f13ff79ed92 #5
> [   32.055686][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [   32.057527][    T1] Call Trace:
> [   32.058191][    T1]  <TASK>
> [ 32.058803][ T1] dump_stack_lvl (??:?)
> [ 32.059668][ T1] __might_resched.cold (core.c:?)
> [ 32.060638][ T1] __kmem_cache_alloc_node (??:?)
> [ 32.061654][ T1] ? active_vm_slab_add (??:?)
> [ 32.062615][ T1] ? active_vm_slab_add (??:?)
> [ 32.063557][ T1] __kmalloc_node (??:?)
> [ 32.064421][ T1] active_vm_slab_add (??:?)
> [ 32.065373][ T1] ? kasan_unpoison (??:?)
> [ 32.066294][ T1] __kmem_cache_alloc_node (??:?)
> [ 32.067294][ T1] ? __bpf_map_area_alloc (syscall.c:?)
> [ 32.068314][ T1] ? __bpf_map_area_alloc (syscall.c:?)
> [ 32.069306][ T1] __kmalloc_node (??:?)
> [ 32.070215][ T1] __bpf_map_area_alloc (syscall.c:?)
> [ 32.071210][ T1] array_map_alloc (arraymap.c:?)
> [ 32.072134][ T1] map_create (syscall.c:?)
> [ 32.072972][ T1] __sys_bpf (syscall.c:?)
> [ 32.073810][ T1] ? link_create (syscall.c:?)
> [ 32.074693][ T1] ? lock_downgrade (lockdep.c:?)
> [ 32.075609][ T1] kern_sys_bpf (??:?)
> [ 32.076455][ T1] ? bpf_sys_bpf (??:?)
> [ 32.077295][ T1] ? trace_hardirqs_on (??:?)
> [ 32.078232][ T1] ? _raw_spin_unlock_irqrestore (??:?)
> [ 32.079288][ T1] ? __stack_depot_save (??:?)
> [ 32.080258][ T1] skel_map_create+0xba/0xeb
> [ 32.081264][ T1] ? skel_map_update_elem+0xe3/0xe3
> [ 32.082356][ T1] ? kasan_save_stack (??:?)
> [ 32.083234][ T1] ? kasan_set_track (??:?)
> [ 32.084107][ T1] ? __kasan_kmalloc (??:?)
> [ 32.085024][ T1] ? kernel_init (main.c:?)
> [ 32.085901][ T1] ? lock_acquire (??:?)
> [ 32.086784][ T1] ? find_held_lock (lockdep.c:?)
> [ 32.087674][ T1] ? __kmem_cache_alloc_node (??:?)
> [ 32.088715][ T1] bpf_load_and_run+0x93/0x3f5
> [ 32.090649][ T1] ? skel_map_create+0xeb/0xeb
> [ 32.091749][ T1] ? lock_downgrade (lockdep.c:?)
> [ 32.092728][ T1] ? __kmem_cache_alloc_node (??:?)
> [ 32.093794][ T1] ? load_skel (bpf_preload_kern.c:?)
> [ 32.094612][ T1] ? rcu_read_lock_sched_held (??:?)
> [ 32.095606][ T1] ? __kmalloc_node (??:?)
> [ 32.096490][ T1] load_skel (bpf_preload_kern.c:?)
> [ 32.097314][ T1] ? bpf_load_and_run+0x3f5/0x3f5
> [ 32.098412][ T1] ? kvm_clock_get_cycles (kvmclock.c:?)
> [ 32.099362][ T1] ? btf_vmlinux_init (bpf_preload_kern.c:?)
> [ 32.100271][ T1] load (bpf_preload_kern.c:?)
> [ 32.100966][ T1] ? btf_vmlinux_init (bpf_preload_kern.c:?)
> [ 32.101872][ T1] do_one_initcall (??:?)
> [ 32.102719][ T1] ? trace_event_raw_event_initcall_level (??:?)
> [ 32.103859][ T1] ? parse_one (??:?)
> [ 32.104645][ T1] ? __kmem_cache_alloc_node (??:?)
> [ 32.105625][ T1] do_initcalls (main.c:?)
> [ 32.106438][ T1] kernel_init_freeable (main.c:?)
> [ 32.107333][ T1] ? console_on_rootfs (main.c:?)
> [ 32.108213][ T1] ? usleep_range_state (??:?)
> [ 32.109175][ T1] ? rest_init (main.c:?)
> [ 32.110000][ T1] ? rest_init (main.c:?)
> [ 32.110836][ T1] kernel_init (main.c:?)
> [ 32.111633][ T1] ret_from_fork (??:?)
> [   32.112419][    T1]  </TASK>
> [ 32.144051][ T1] initcall load+0x0/0x4a returned 0 after 169883 usecs
>
>
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202212141512.469bca4-yujie.liu@intel.com
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-6.1.0-rc7-01609-g8f13ff79ed92 .config
>         make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
>         make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
>         cd <mod-install-dir>
>         find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>

Many thanks for the report. Should add GFP_ATOMIC to fix it. I missed
the rcu_read_lock() in page_ext_get().

-- 
Regards
Yafang
