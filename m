Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8CC17D8A2
	for <oe-lkp@lists.linux.dev>; Thu, 30 May 2024 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717075692; cv=none; b=CtDOQ5r2wxQ0jJlg+0UgTWiZBdbQUxZEZFN2joX2AsB2D1MzLFi5BDpPmP5GtJkorabQA7qJuCKWJD9Vyb1bn6YiQjPn33hnNxkg3kyItWnSzGxz80m5aSKVxsZv+ZJE0JxQXl4aYjvOOTPQZQYCRM3K/OnZX9DeP/qIfOCUa7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717075692; c=relaxed/simple;
	bh=eWSnlBom5TRdrvo9VIAuUKdNUj8lV9sgJSxSIr9na5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNmcwwVojF1wWgh7+uiUUjhqBwsIfMhzEOUI9zwfpZPgHDStUoQTKDkymfd8bk67AC8Laod5915WYJAXXACinWTqKIAeXjuM6etb+0+6GZtC+ff7Fa8MEE216bKQ2yDu6crymhQNbUvZtC7wdF3Crf3ny1w2nYMGcUGdgvihDxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiQlhVKS; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiQlhVKS"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-24cbb2b71b4so478935fac.2
        for <oe-lkp@lists.linux.dev>; Thu, 30 May 2024 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717075689; x=1717680489; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swB6sWpyLeZm0arDjHjng51n2+4b1NGNCTE4VxMgWfI=;
        b=jiQlhVKSB573iVfexk6O7nHNFPrVH+ITHAtP0cgUdaxEwIQ2qJQPgF+/h12aTSrAye
         yrO6oVXL3EwZ2Uy44NghNHTbechodr924w1ANptYwaMemPuskoEzdwF2EONK7iimIxK7
         B4jA6wQWFgvlZ3NFxCTSab/+dD5HKyX/zK3WttR5fxb9K+YfMTdOHGyjtfw5TglufOWu
         yMeS+gywB6Lm0JzavLuHEGv++azoE5jCwYI3n8em3W/X03I5LDK/fKJehgwRbaq63Go9
         Fut5bzf5tVtpkR2FMpnf4zcP4mCT4AJcyLv7+hZjmiL9LkDjlbvWGdIBqWa1i3OdsTG2
         9Yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717075689; x=1717680489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swB6sWpyLeZm0arDjHjng51n2+4b1NGNCTE4VxMgWfI=;
        b=AvfSPWGRQ6Mt59o6K5T3uQ82SeYiR4T2toZC9bXyzoDQ7KaiTvcHrWTAMtHBRf8Nxh
         KLTp8Z+olbecO1byDz/FwdVakBFHUgK7zqL4C78P6I2VrU2DTlX/0Oz6z09mipxrr0qa
         lM/fsFkFpKQhZyLiLHZni48uETSPPfWQPvW3fEu5JB8WB6o47Nq7+rhpWqcWZPA3U7PB
         T4kEUH4sbWyouM+gH0jWkqkShrIPaa+2iv+dciyKUmfNxc2yj2Jf+nZWsKghmlYAOd9i
         JHL2RINtJztizQpzn0zYcu2ikzvzNcYonmbU75+HfUmnMTOLn7K7Eke+thEfzJkTaTrh
         4Okw==
X-Gm-Message-State: AOJu0YxAX+GnzazybBGked1AdgSCu03VbLVOn4D5IjQpzYYzzsM0i4ok
	OkwzKSIsNepYjDDd0dG5c1PlhzwTDpb0+uycqdtd3JivDUXBcpmCPIS05Y4E53IgcvT+LvIxxXS
	IMzssoQa7aR6CdyuNC1MO+97zxGLeZlEM
X-Google-Smtp-Source: AGHT+IE0OxlLo2RbVOTs9Dp0AONPX83XwT3Vgf/ll3VmVbK0vfCxOHUjBVESAviR/SVGSoD/kob1HFeaF4128O0ZKfM=
X-Received: by 2002:a05:6870:65a1:b0:24c:b878:b515 with SMTP id
 586e51a60fabf-25060e59f6bmr2123549fac.49.1717075689197; Thu, 30 May 2024
 06:28:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405231056.66ecbb94-oliver.sang@intel.com>
In-Reply-To: <202405231056.66ecbb94-oliver.sang@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 30 May 2024 16:27:57 +0300
Message-ID: <CAOQ4uxjGE0cwmacsxSjAkh3otYB0_XRbC1b5i_1iS=iLeEyXqg@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fs] 8829cb6189: stress-ng.fault.ops_per_sec
 -2.3% regression
To: kernel test robot <oliver.sang@intel.com>, Jan Kara <jack@suse.cz>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 5:59=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -2.3% regression of stress-ng.fault.ops_per_s=
ec on:
>
>
> commit: 8829cb6189b7a6b5283b9ffc870df13c085f1cd6 ("fs: hold s_write_srcu =
for pre-modify permission events on write")
> https://github.com/amir73il/linux sb_write_barrier
>
> testcase: stress-ng
> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10G=
Hz (Ice Lake) with 256G memory
> parameters:
>
>         nr_threads: 100%
>         testtime: 60s
>         test: fault
>         cpufreq_governor: performance
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202405231056.66ecbb94-oliver.san=
g@intel.com
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240523/202405231056.66ecbb94-ol=
iver.sang@intel.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testc=
ase/testtime:
>   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/l=
kp-icl-2sp9/fault/stress-ng/60s
>
> commit:
>   3f7a9d8157 ("fs: add srcu variants for mnt_{want,drop}_write() helpers"=
)
>   8829cb6189 ("fs: hold s_write_srcu for pre-modify permission events on =
write")
>
> 3f7a9d815783aeff 8829cb6189b7a6b5283b9ffc870
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6           17%           1:6     dmesg.RIP:native_queued_spi=
n_lock_slowpath
>            :6           17%           1:6     dmesg.RIP:setup_pebs_adapti=
ve_sample_data
>            :6           17%           1:6     dmesg.WARNING:at_arch/x86/e=
vents/intel/ds.c:#setup_pebs_adaptive_sample_data
>          %stddev     %change         %stddev
>              \          |                \
>     155.51 =C4=85 12%     +23.3%     191.81 =C4=85 13%  sched_debug.cfs_r=
q:/.util_est.stddev
>       5270 =C4=85141%    +378.6%      25225 =C4=85 79%  sched_debug.cpu.m=
ax_idle_balance_cost.stddev
>       0.63 =C4=85  2%      -0.0        0.59        perf-stat.i.branch-mis=
s-rate%
>       2.61 =C4=85  2%      +3.5%       2.70        perf-stat.i.cpi
>       0.40 =C4=85  5%      -5.2%       0.38        perf-stat.i.ipc
>      53250            -2.3%      52032        stress-ng.fault.minor_page_=
faults_per_sec
>   51143720            -2.3%   49967689        stress-ng.fault.ops
>     852394            -2.3%     832793        stress-ng.fault.ops_per_sec
>  2.046e+08            -2.3%  1.999e+08        stress-ng.time.minor_page_f=
aults
>  1.157e+08            -2.2%  1.132e+08        proc-vmstat.numa_hit
>  1.157e+08            -2.2%  1.131e+08        proc-vmstat.numa_local
>   51220291            -2.4%   49995156        proc-vmstat.pgactivate
>  1.377e+08            -2.1%  1.349e+08        proc-vmstat.pgalloc_normal
>  2.053e+08            -2.4%  2.003e+08        proc-vmstat.pgfault
>  1.368e+08            -2.2%  1.338e+08        proc-vmstat.pgfree
>   51073893            -2.4%   49869748        proc-vmstat.unevictable_pgs=
_culled
>      24.17 =C4=85  2%      -1.7       22.46 =C4=85  2%  perf-profile.call=
trace.cycles-pp.__madvise
>      23.20 =C4=85  2%      -1.7       21.52 =C4=85  2%  perf-profile.call=
trace.cycles-pp.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64=
_after_hwframe.__madvise
>      23.33 =C4=85  2%      -1.7       21.65 =C4=85  2%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.__madvise
>      23.24 =C4=85  2%      -1.7       21.55 =C4=85  2%  perf-profile.call=
trace.cycles-pp.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.__madvise
>      23.31 =C4=85  2%      -1.7       21.62 =C4=85  2%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
>      22.51 =C4=85  2%      -1.7       20.83 =C4=85  2%  perf-profile.call=
trace.cycles-pp.madvise_vma_behavior.do_madvise.__x64_sys_madvise.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
>      18.38 =C4=85  3%      -1.5       16.87 =C4=85  2%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batc=
h_move_lru.lru_add_drain_cpu.lru_add_drain
>      18.12 =C4=85  3%      -1.5       16.62 =C4=85  2%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.fol=
io_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu
>      17.63            -1.2       16.39        perf-profile.calltrace.cycl=
es-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munma=
p
>      17.36            -1.2       16.14        perf-profile.calltrace.cycl=
es-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_sys=
call_64
>      17.61            -1.2       16.38        perf-profile.calltrace.cycl=
es-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.__munmap
>      17.48            -1.2       16.25        perf-profile.calltrace.cycl=
es-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
>      15.64 =C4=85  2%      -1.2       14.49        perf-profile.calltrace=
.cycles-pp.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64=
_sys_munmap
>      15.03 =C4=85  2%      -1.1       13.91 =C4=85  2%  perf-profile.call=
trace.cycles-pp.zap_page_range_single.madvise_vma_behavior.do_madvise.__x64=
_sys_madvise.do_syscall_64
>      13.49 =C4=85  3%      -1.1       12.38 =C4=85  2%  perf-profile.call=
trace.cycles-pp.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.zap_pa=
ge_range_single.madvise_vma_behavior
>      13.51 =C4=85  3%      -1.1       12.41 =C4=85  2%  perf-profile.call=
trace.cycles-pp.lru_add_drain.zap_page_range_single.madvise_vma_behavior.do=
_madvise.__x64_sys_madvise
>      13.51 =C4=85  3%      -1.1       12.41 =C4=85  2%  perf-profile.call=
trace.cycles-pp.lru_add_drain_cpu.lru_add_drain.zap_page_range_single.madvi=
se_vma_behavior.do_madvise
>      12.53 =C4=85  3%      -1.0       11.50 =C4=85  2%  perf-profile.call=
trace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drai=
n_cpu.lru_add_drain.zap_page_range_single
>      36.55            -1.0       35.54        perf-profile.calltrace.cycl=
es-pp.__munmap
>      36.27            -1.0       35.27        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.__munmap
>      36.26            -1.0       35.26        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
>      12.06 =C4=85  2%      -1.0       11.08 =C4=85  2%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.fol=
io_lruvec_lock_irqsave.__page_cache_release.folios_put_refs
>       7.33            -0.6        6.72 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.tlb_finish_mmu.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__=
vm_munmap
>       7.10 =C4=85  2%      -0.6        6.49 =C4=85  2%  perf-profile.call=
trace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tl=
b_finish_mmu.unmap_region.do_vmi_align_munmap
>       7.11 =C4=85  2%      -0.6        6.50 =C4=85  2%  perf-profile.call=
trace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_finish_mmu.unmap_region.=
do_vmi_align_munmap.do_vmi_munmap
>       7.02 =C4=85  2%      -0.6        6.42 =C4=85  2%  perf-profile.call=
trace.cycles-pp.lru_add_drain.free_pages_and_swap_cache.__tlb_batch_free_en=
coded_pages.tlb_finish_mmu.unmap_region
>       7.01 =C4=85  2%      -0.6        6.40 =C4=85  2%  perf-profile.call=
trace.cycles-pp.folio_batch_move_lru.lru_add_drain.free_pages_and_swap_cach=
e.__tlb_batch_free_encoded_pages.tlb_finish_mmu
>       6.99 =C4=85  3%      -0.6        6.42 =C4=85  2%  perf-profile.call=
trace.cycles-pp.__walk_page_range.walk_page_range.madvise_pageout.madvise_v=
ma_behavior.do_madvise
>       7.38 =C4=85  2%      -0.6        6.82 =C4=85  2%  perf-profile.call=
trace.cycles-pp.madvise_pageout.madvise_vma_behavior.do_madvise.__x64_sys_m=
advise.do_syscall_64
>       6.94 =C4=85  3%      -0.6        6.38 =C4=85  2%  perf-profile.call=
trace.cycles-pp.walk_p4d_range.walk_pgd_range.__walk_page_range.walk_page_r=
ange.madvise_pageout
>       6.29 =C4=85  2%      -0.6        5.73 =C4=85  2%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batc=
h_move_lru.lru_add_drain.free_pages_and_swap_cache
>       6.97 =C4=85  2%      -0.6        6.41 =C4=85  2%  perf-profile.call=
trace.cycles-pp.walk_pgd_range.__walk_page_range.walk_page_range.madvise_pa=
geout.madvise_vma_behavior
>       6.38 =C4=85  2%      -0.6        5.82 =C4=85  2%  perf-profile.call=
trace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drai=
n.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
>       6.16 =C4=85  2%      -0.6        5.60 =C4=85  2%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.fol=
io_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain
>       6.92 =C4=85  3%      -0.6        6.36 =C4=85  2%  perf-profile.call=
trace.cycles-pp.walk_pud_range.walk_p4d_range.walk_pgd_range.__walk_page_ra=
nge.walk_page_range
>       7.10 =C4=85  2%      -0.6        6.54 =C4=85  2%  perf-profile.call=
trace.cycles-pp.walk_page_range.madvise_pageout.madvise_vma_behavior.do_mad=
vise.__x64_sys_madvise
>       6.90 =C4=85  3%      -0.6        6.34 =C4=85  2%  perf-profile.call=
trace.cycles-pp.walk_pmd_range.walk_pud_range.walk_p4d_range.walk_pgd_range=
.__walk_page_range
>       6.88 =C4=85  3%      -0.6        6.32 =C4=85  2%  perf-profile.call=
trace.cycles-pp.madvise_cold_or_pageout_pte_range.walk_pmd_range.walk_pud_r=
ange.walk_p4d_range.walk_pgd_range
>       6.97            -0.6        6.42        perf-profile.calltrace.cycl=
es-pp.folios_put_refs.shmem_undo_range.shmem_evict_inode.evict.__dentry_kil=
l
>       6.54 =C4=85  3%      -0.5        5.99 =C4=85  2%  perf-profile.call=
trace.cycles-pp.folio_isolate_lru.madvise_cold_or_pageout_pte_range.walk_pm=
d_range.walk_pud_range.walk_p4d_range
>       7.84            -0.5        7.29        perf-profile.calltrace.cycl=
es-pp.shmem_evict_inode.evict.__dentry_kill.dput.__fput
>       7.72            -0.5        7.17        perf-profile.calltrace.cycl=
es-pp.shmem_undo_range.shmem_evict_inode.evict.__dentry_kill.dput
>       6.27 =C4=85  3%      -0.5        5.75 =C4=85  2%  perf-profile.call=
trace.cycles-pp.folio_lruvec_lock_irq.folio_isolate_lru.madvise_cold_or_pag=
eout_pte_range.walk_pmd_range.walk_pud_range
>       6.17 =C4=85  3%      -0.5        5.65 =C4=85  2%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irq.folio_lruvec_lock_irq.folio_isolate_lru.=
madvise_cold_or_pageout_pte_range.walk_pmd_range
>       6.09 =C4=85  3%      -0.5        5.57 =C4=85  2%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.folio_l=
ruvec_lock_irq.folio_isolate_lru.madvise_cold_or_pageout_pte_range
>       6.42            -0.5        5.90        perf-profile.calltrace.cycl=
es-pp.__page_cache_release.folios_put_refs.shmem_undo_range.shmem_evict_ino=
de.evict
>       6.58 =C4=85  3%      -0.5        6.07 =C4=85  2%  perf-profile.call=
trace.cycles-pp.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.unmap_=
region.do_vmi_align_munmap
>       6.25            -0.5        5.73 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.s=
hmem_undo_range.shmem_evict_inode
>       6.62 =C4=85  2%      -0.5        6.10 =C4=85  2%  perf-profile.call=
trace.cycles-pp.lru_add_drain_cpu.lru_add_drain.unmap_region.do_vmi_align_m=
unmap.do_vmi_munmap
>       6.62 =C4=85  3%      -0.5        6.11 =C4=85  2%  perf-profile.call=
trace.cycles-pp.lru_add_drain.unmap_region.do_vmi_align_munmap.do_vmi_munma=
p.__vm_munmap
>       6.18            -0.5        5.66 =C4=85  2%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_re=
lease.folios_put_refs.shmem_undo_range
>       6.16 =C4=85  3%      -0.5        5.67 =C4=85  2%  perf-profile.call=
trace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drai=
n_cpu.lru_add_drain.unmap_region
>       6.14 =C4=85  2%      -0.5        5.68        perf-profile.calltrace=
.cycles-pp.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.t=
runcate_inode_pages_range.evict
>       6.07 =C4=85  2%      -0.5        5.60 =C4=85  2%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cac=
he_release.folios_put_refs.truncate_inode_pages_range
>       3.43 =C4=85  2%      -0.3        3.17        perf-profile.calltrace=
.cycles-pp.folios_put_refs.truncate_inode_pages_range.evict.__dentry_kill.d=
put
>       3.75 =C4=85  2%      -0.2        3.50        perf-profile.calltrace=
.cycles-pp.truncate_inode_pages_range.evict.__dentry_kill.dput.__fput
>       3.41 =C4=85  2%      -0.2        3.17        perf-profile.calltrace=
.cycles-pp.folios_put_refs.truncate_inode_pages_range.evict.do_unlinkat.__x=
64_sys_unlink
>       3.14 =C4=85  3%      -0.2        2.91        perf-profile.calltrace=
.cycles-pp.__page_cache_release.folios_put_refs.truncate_inode_pages_range.=
evict.__dentry_kill
>       3.74 =C4=85  2%      -0.2        3.50        perf-profile.calltrace=
.cycles-pp.truncate_inode_pages_range.evict.do_unlinkat.__x64_sys_unlink.do=
_syscall_64
>       3.13 =C4=85  2%      -0.2        2.91        perf-profile.calltrace=
.cycles-pp.__page_cache_release.folios_put_refs.truncate_inode_pages_range.=
evict.do_unlinkat
>       0.51            -0.2        0.33 =C4=85 70%  perf-profile.calltrace=
.cycles-pp.sync_regs.asm_exc_page_fault.stress_fault
>       5.64            -0.1        5.50        perf-profile.calltrace.cycl=
es-pp.stress_fault
>       4.70            -0.1        4.60        perf-profile.calltrace.cycl=
es-pp.asm_exc_page_fault.stress_fault
>       4.16            -0.1        4.07        perf-profile.calltrace.cycl=
es-pp.exc_page_fault.asm_exc_page_fault.stress_fault
>       4.12            -0.1        4.03        perf-profile.calltrace.cycl=
es-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_fault
>       3.59            -0.1        3.52        perf-profile.calltrace.cycl=
es-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.=
stress_fault
>       2.13            -0.1        2.08        perf-profile.calltrace.cycl=
es-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>       0.92            -0.0        0.88        perf-profile.calltrace.cycl=
es-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_=
write.__x64_sys_pwrite64
>       0.71            -0.0        0.67        perf-profile.calltrace.cycl=
es-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_=
file_write_iter.vfs_write
>       1.13            -0.0        1.09        perf-profile.calltrace.cycl=
es-pp.generic_perform_write.generic_file_write_iter.vfs_write.__x64_sys_pwr=
ite64.do_syscall_64
>       0.81            -0.0        0.79        perf-profile.calltrace.cycl=
es-pp.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_fault.__do_fault.=
do_read_fault
>       0.75            -0.0        0.73        perf-profile.calltrace.cycl=
es-pp.alloc_inode.new_inode.__shmem_get_inode.__shmem_file_setup.shmem_zero=
_setup
>       0.60            -0.0        0.58        perf-profile.calltrace.cycl=
es-pp.perf_event_mmap_event.perf_event_mmap.mmap_region.do_mmap.vm_mmap_pgo=
ff
>      18.59            +0.2       18.83        perf-profile.calltrace.cycl=
es-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.__munmap
>      18.33            +0.2       18.58        perf-profile.calltrace.cycl=
es-pp.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe.__munmap
>      17.29            +0.3       17.54        perf-profile.calltrace.cycl=
es-pp.dput.__fput.task_work_run.syscall_exit_to_user_mode.do_syscall_64
>      18.08            +0.3       18.34        perf-profile.calltrace.cycl=
es-pp.__fput.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>      17.19            +0.3       17.45        perf-profile.calltrace.cycl=
es-pp.__dentry_kill.dput.__fput.task_work_run.syscall_exit_to_user_mode
>       1.96            +0.3        2.23        perf-profile.calltrace.cycl=
es-pp.__libc_pwrite
>       1.84            +0.3        2.12        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
>       1.85            +0.3        2.13        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.__libc_pwrite
>       1.82            +0.3        2.10        perf-profile.calltrace.cycl=
es-pp.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lib=
c_pwrite
>       1.78            +0.3        2.06        perf-profile.calltrace.cycl=
es-pp.vfs_write.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.__libc_pwrite
>      15.98            +0.3       16.27        perf-profile.calltrace.cycl=
es-pp.evict.__dentry_kill.dput.__fput.task_work_run
>       8.24            +0.9        9.15 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
>       8.24            +0.9        9.16 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
>       8.36            +0.9        9.27 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.unlink
>       8.04            +0.9        8.96 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.unlink
>       8.20            +0.9        9.13 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.un=
link
>       5.36            +1.0        6.37 =C4=85  3%  perf-profile.calltrace=
.cycles-pp.evict.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
>       3.64 =C4=85  6%      +1.0        4.68 =C4=85  3%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.evict.__den=
try_kill.dput
>       3.88 =C4=85  6%      +1.1        4.94 =C4=85  2%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.evict.__dentry_kill.dput.__fput
>       1.35 =C4=85 11%      +1.2        2.52 =C4=85 10%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.evict.do_un=
linkat.__x64_sys_unlink
>       1.42 =C4=85 10%      +1.2        2.62 =C4=85 10%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.evict.do_unlinkat.__x64_sys_unlink.do_syscal=
l_64
>       8.34 =C4=85  5%      +2.3       10.62 =C4=85  6%  perf-profile.call=
trace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.open64
>       8.36 =C4=85  5%      +2.3       10.64 =C4=85  6%  perf-profile.call=
trace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.open64
>       8.53 =C4=85  5%      +2.3       10.81 =C4=85  6%  perf-profile.call=
trace.cycles-pp.open64
>       8.39 =C4=85  5%      +2.3       10.67 =C4=85  6%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
>       8.40 =C4=85  5%      +2.3       10.68 =C4=85  6%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
>       8.01 =C4=85  5%      +2.3       10.30 =C4=85  6%  perf-profile.call=
trace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
>       7.98 =C4=85  5%      +2.3       10.27 =C4=85  6%  perf-profile.call=
trace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do=
_syscall_64
>       2.87 =C4=85 10%      +2.3        5.19 =C4=85 11%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.new_inode.r=
amfs_get_inode.ramfs_mknod
>       5.99 =C4=85  6%      +2.3        8.32 =C4=85  7%  perf-profile.call=
trace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2._=
_x64_sys_openat
>       4.04 =C4=85  7%      +2.3        6.38 =C4=85  9%  perf-profile.call=
trace.cycles-pp.new_inode.ramfs_get_inode.ramfs_mknod.lookup_open.open_last=
_lookups
>       3.06 =C4=85  9%      +2.4        5.44 =C4=85 11%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.new_inode.ramfs_get_inode.ramfs_mknod.lookup=
_open
>       5.53 =C4=85  6%      +2.4        7.91 =C4=85  8%  perf-profile.call=
trace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_s=
ys_openat2
>       4.53 =C4=85  7%      +2.4        6.92 =C4=85  9%  perf-profile.call=
trace.cycles-pp.ramfs_mknod.lookup_open.open_last_lookups.path_openat.do_fi=
lp_open
>       4.39 =C4=85  7%      +2.4        6.79 =C4=85  9%  perf-profile.call=
trace.cycles-pp.ramfs_get_inode.ramfs_mknod.lookup_open.open_last_lookups.p=
ath_openat
>      37.47 =C4=85  2%      -3.1       34.42 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.folio_lruvec_lock_irqsave
>      36.99 =C4=85  2%      -3.0       33.94 =C4=85  2%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>      27.20 =C4=85  2%      -2.2       24.96 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.lru_add_drain
>      27.10 =C4=85  2%      -2.2       24.88 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.folio_batch_move_lru
>      24.23 =C4=85  2%      -1.7       22.52 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.__madvise
>      23.22 =C4=85  2%      -1.7       21.53 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.do_madvise
>      23.24 =C4=85  2%      -1.7       21.56 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.__x64_sys_madvise
>      22.52 =C4=85  2%      -1.7       20.84 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.madvise_vma_behavior
>      20.19 =C4=85  3%      -1.6       18.56 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.lru_add_drain_cpu
>      17.60            -1.2       16.37        perf-profile.children.cycle=
s-pp.do_vmi_munmap
>      17.63            -1.2       16.40        perf-profile.children.cycle=
s-pp.__x64_sys_munmap
>      17.62            -1.2       16.39        perf-profile.children.cycle=
s-pp.__vm_munmap
>      17.38            -1.2       16.16        perf-profile.children.cycle=
s-pp.do_vmi_align_munmap
>      15.65 =C4=85  2%      -1.2       14.50        perf-profile.children.=
cycles-pp.unmap_region
>      15.04 =C4=85  2%      -1.1       13.91 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.zap_page_range_single
>      14.24 =C4=85  2%      -1.1       13.19        perf-profile.children.=
cycles-pp.folios_put_refs
>      36.59            -1.0       35.58        perf-profile.children.cycle=
s-pp.__munmap
>      12.71 =C4=85  2%      -1.0       11.72        perf-profile.children.=
cycles-pp.__page_cache_release
>       7.75            -0.6        7.13        perf-profile.children.cycle=
s-pp.tlb_finish_mmu
>       7.33 =C4=85  2%      -0.6        6.72 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.free_pages_and_swap_cache
>       7.44            -0.6        6.82        perf-profile.children.cycle=
s-pp.__tlb_batch_free_encoded_pages
>       7.39 =C4=85  2%      -0.6        6.83 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.madvise_pageout
>       6.95 =C4=85  3%      -0.6        6.38 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.walk_p4d_range
>       7.10 =C4=85  2%      -0.6        6.54 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.walk_page_range
>       6.98 =C4=85  2%      -0.6        6.42 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.walk_pgd_range
>       6.99 =C4=85  3%      -0.6        6.43 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.__walk_page_range
>       6.92 =C4=85  3%      -0.6        6.36 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.walk_pud_range
>       6.88 =C4=85  3%      -0.6        6.32 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.madvise_cold_or_pageout_pte_range
>       6.90 =C4=85  3%      -0.6        6.34 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.walk_pmd_range
>       6.55 =C4=85  3%      -0.6        6.00 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.folio_isolate_lru
>       7.84            -0.5        7.30        perf-profile.children.cycle=
s-pp.shmem_evict_inode
>       7.73            -0.5        7.18        perf-profile.children.cycle=
s-pp.shmem_undo_range
>       6.28 =C4=85  3%      -0.5        5.75 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.folio_lruvec_lock_irq
>       6.30 =C4=85  3%      -0.5        5.78 =C4=85  2%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irq
>       7.50 =C4=85  2%      -0.5        7.02        perf-profile.children.=
cycles-pp.truncate_inode_pages_range
>       6.62            -0.2        6.47        perf-profile.children.cycle=
s-pp.stress_fault
>       5.72            -0.1        5.60        perf-profile.children.cycle=
s-pp.asm_exc_page_fault
>       2.28            -0.1        2.15        perf-profile.children.cycle=
s-pp.__do_softirq
>       2.26            -0.1        2.14        perf-profile.children.cycle=
s-pp.rcu_do_batch
>       2.26            -0.1        2.15        perf-profile.children.cycle=
s-pp.rcu_core
>       2.12            -0.1        2.01        perf-profile.children.cycle=
s-pp.irq_exit_rcu
>       2.00            -0.1        1.91        perf-profile.children.cycle=
s-pp.kmem_cache_free
>       0.25 =C4=85  2%      -0.1        0.16 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.vfs_fallocate
>       2.34            -0.1        2.25        perf-profile.children.cycle=
s-pp.asm_sysvec_apic_timer_interrupt
>       4.17            -0.1        4.08        perf-profile.children.cycle=
s-pp.exc_page_fault
>       2.32            -0.1        2.23        perf-profile.children.cycle=
s-pp.sysvec_apic_timer_interrupt
>       0.29 =C4=85  2%      -0.1        0.20        perf-profile.children.=
cycles-pp.__x64_sys_fallocate
>       4.14            -0.1        4.05        perf-profile.children.cycle=
s-pp.do_user_addr_fault
>       0.42 =C4=85  3%      -0.1        0.34 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.posix_fallocate64
>       3.60            -0.1        3.53        perf-profile.children.cycle=
s-pp.handle_mm_fault
>       1.70 =C4=85  2%      -0.1        1.63        perf-profile.children.=
cycles-pp.alloc_inode
>       2.96            -0.1        2.90        perf-profile.children.cycle=
s-pp.do_fault
>       0.17 =C4=85  3%      -0.1        0.11 =C4=85  3%  perf-profile.chil=
dren.cycles-pp.rw_verify_area
>       1.03            -0.0        0.99        perf-profile.children.cycle=
s-pp.__slab_free
>       0.92            -0.0        0.88        perf-profile.children.cycle=
s-pp.simple_write_begin
>       0.64 =C4=85  2%      -0.0        0.59        perf-profile.children.=
cycles-pp.inode_init_always
>       1.16            -0.0        1.12        perf-profile.children.cycle=
s-pp.generic_perform_write
>       0.46 =C4=85  3%      -0.0        0.42 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.mnt_want_write
>       0.84            -0.0        0.80        perf-profile.children.cycle=
s-pp.__filemap_get_folio
>       1.12            -0.0        1.08        perf-profile.children.cycle=
s-pp.perf_event_mmap
>       1.08            -0.0        1.05        perf-profile.children.cycle=
s-pp.perf_event_mmap_event
>       0.15            -0.0        0.12 =C4=85  3%  perf-profile.children.=
cycles-pp.__fsnotify_parent
>       0.23 =C4=85  3%      -0.0        0.20 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.may_open
>       0.58            -0.0        0.55        perf-profile.children.cycle=
s-pp.mas_prev_slot
>       0.28            -0.0        0.26 =C4=85  4%  perf-profile.children.=
cycles-pp.__count_memcg_events
>       0.45 =C4=85  2%      -0.0        0.42 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.filemap_add_folio
>       0.18 =C4=85  2%      -0.0        0.15 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.security_inode_alloc
>       0.57            -0.0        0.54        perf-profile.children.cycle=
s-pp.__cond_resched
>       0.26            -0.0        0.24 =C4=85  2%  perf-profile.children.=
cycles-pp.percpu_counter_add_batch
>       0.68            -0.0        0.66        perf-profile.children.cycle=
s-pp.flush_tlb_mm_range
>       0.32 =C4=85  2%      -0.0        0.30        perf-profile.children.=
cycles-pp.generic_file_mmap
>       0.14 =C4=85  3%      -0.0        0.12 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_commit_charge
>       0.31 =C4=85  2%      -0.0        0.29 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.touch_atime
>       0.50 =C4=85  2%      -0.0        0.48        perf-profile.children.=
cycles-pp.mas_rev_awalk
>       0.32            -0.0        0.30 =C4=85  2%  perf-profile.children.=
cycles-pp.alloc_pages_mpol
>       0.22 =C4=85  2%      -0.0        0.20 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.shmem_alloc_folio
>       0.17 =C4=85  2%      -0.0        0.16 =C4=85  3%  perf-profile.chil=
dren.cycles-pp.fsnotify
>       0.12 =C4=85  4%      -0.0        0.10 =C4=85  3%  perf-profile.chil=
dren.cycles-pp.blk_finish_plug
>       0.42            -0.0        0.40        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64
>       0.17 =C4=85  2%      -0.0        0.15 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.folio_alloc
>       0.31            -0.0        0.30        perf-profile.children.cycle=
s-pp.mas_ascend
>       0.18 =C4=85  2%      -0.0        0.17        perf-profile.children.=
cycles-pp.fsnotify_grab_connector
>       0.10 =C4=85  4%      -0.0        0.08 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.kfree
>       0.19 =C4=85  2%      -0.0        0.18        perf-profile.children.=
cycles-pp.xas_start
>       0.64            -0.0        0.62        perf-profile.children.cycle=
s-pp.lru_add_fn
>       0.09 =C4=85  4%      -0.0        0.08        perf-profile.children.=
cycles-pp.prepend_path
>       0.14 =C4=85  3%      -0.0        0.12 =C4=85  3%  perf-profile.chil=
dren.cycles-pp.simple_getattr
>       0.20 =C4=85  2%      -0.0        0.19 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.fsnotify_destroy_marks
>       0.06 =C4=85  6%      +0.0        0.08 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.get_mem_cgroup_from_mm
>       0.08 =C4=85  9%      +0.0        0.10 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.security_current_getsecid_subj
>       0.10 =C4=85  7%      +0.0        0.12        perf-profile.children.=
cycles-pp.security_file_post_open
>       0.09 =C4=85  6%      +0.0        0.12 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.ima_file_check
>       0.02 =C4=85 99%      +0.0        0.06        perf-profile.children.=
cycles-pp.__x64_sys_fcntl
>       0.55 =C4=85  2%      +0.1        0.62 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.inode_wait_for_writeback
>      91.01            +0.2       91.25        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>      18.74            +0.2       18.98        perf-profile.children.cycle=
s-pp.syscall_exit_to_user_mode
>      90.84            +0.2       91.08        perf-profile.children.cycle=
s-pp.do_syscall_64
>       0.00            +0.2        0.24 =C4=85  3%  perf-profile.children.=
cycles-pp.file_start_write_area
>      18.34            +0.2       18.59        perf-profile.children.cycle=
s-pp.task_work_run
>      17.46            +0.3       17.72        perf-profile.children.cycle=
s-pp.dput
>      17.25            +0.3       17.50        perf-profile.children.cycle=
s-pp.__dentry_kill
>      18.09            +0.3       18.35        perf-profile.children.cycle=
s-pp.__fput
>       1.98            +0.3        2.25        perf-profile.children.cycle=
s-pp.__libc_pwrite
>       1.82            +0.3        2.10        perf-profile.children.cycle=
s-pp.vfs_write
>       1.82            +0.3        2.10        perf-profile.children.cycle=
s-pp.__x64_sys_pwrite64
>       8.38            +0.9        9.29 =C4=85  2%  perf-profile.children.=
cycles-pp.unlink
>       8.21            +0.9        9.13 =C4=85  2%  perf-profile.children.=
cycles-pp.__x64_sys_unlink
>       8.04            +0.9        8.96 =C4=85  2%  perf-profile.children.=
cycles-pp.do_unlinkat
>      21.35            +1.3       22.65        perf-profile.children.cycle=
s-pp.evict
>       8.11 =C4=85  5%      +2.0       10.10 =C4=85  3%  perf-profile.chil=
dren.cycles-pp.new_inode
>       8.36 =C4=85  5%      +2.3       10.64 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.do_sys_openat2
>       8.37 =C4=85  5%      +2.3       10.65 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.__x64_sys_openat
>       8.55 =C4=85  5%      +2.3       10.83 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.open64
>       7.99 =C4=85  5%      +2.3       10.28 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.path_openat
>       8.02 =C4=85  5%      +2.3       10.31 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.do_filp_open
>       6.00 =C4=85  6%      +2.3        8.33 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.open_last_lookups
>       5.54 =C4=85  6%      +2.4        7.92 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.lookup_open
>       4.54 =C4=85  7%      +2.4        6.93 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.ramfs_mknod
>       4.40 =C4=85  7%      +2.4        6.79 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.ramfs_get_inode
>      12.62 =C4=85  6%      +4.4       16.99 =C4=85  4%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock

I am scratching my head to figure out why these functions are affected by
the regressing commit, which as far as I can see only adds
if (READ_ONCE(sb->s_write_srcu)) test in write helpers,
which should always be false.

The only thing I can think of is that s_write_srcu on the same cache line a=
s
s_inode_*_lock, which impacts performance of acquiring those spinlocks,
but this explanation seems far-fetched.

Anyway, I tried moving sb->s_write_srcu next to s_fsnotify_info and other
read-mostly sb members to see if it makes any difference.
Also rebased branch on v6.10-rc1:

* 1d15ffdc12d2 - (sb_write_barrier) fanotify: introduce FAN_MARK_SYNC flag
* 5029c0cbd085 - fanotify: activate sb write barriers for pre-modify
event watchers
* fda0270c803d - fs: hold s_write_srcu for pre-modify permission
events on aio write
* e34d0ca5cdfd - fs: hold s_write_srcu for pre-modify permission events on =
write
* afdd0701bfb7 - fs: add srcu variants for mnt_{want,drop}_write() helpers
* 61d0f429d8bf - fs: implement 'vfs write barriers'

Oliver,

Can you please re-test?

Thanks,
Amir.
