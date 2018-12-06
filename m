Content-Type: multipart/mixed; boundary="===============2142497653886069881=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [patch v2 for-4.20] mm, thp: restore node-local hugepage allocations
Date: Thu, 06 Dec 2018 12:59:17 +0800
Message-ID: <20181206045917.GG23332@shao2-debian>
In-Reply-To: <alpine.DEB.2.21.1812051445390.35948@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2142497653886069881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2018 at 02:46:50PM -0800, David Rientjes wrote:
> This is a full revert of ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for
> MADV_HUGEPAGE mappings") and a partial revert of 89c83fb539f9 ("mm, thp:
> consolidate THP gfp handling into alloc_hugepage_direct_gfpmask").
> =

> By not setting __GFP_THISNODE, applications can allocate remote hugepages
> when the local node is fragmented or low on memory when either the thp
> defrag setting is "always" or the vma has been madvised with
> MADV_HUGEPAGE.
> =

> Remote access to hugepages often has much higher latency than local pages
> of the native page size.  On Haswell, ac5b2c18911f was shown to have a
> 13.9% access regression after this commit for binaries that remap their
> text segment to be backed by transparent hugepages.
> =

> The intent of ac5b2c18911f is to address an issue where a local node is
> low on memory or fragmented such that a hugepage cannot be allocated.  In
> every scenario where this was described as a fix, there is abundant and
> unfragmented remote memory available to allocate from, even with a greater
> access latency.
> =

> If remote memory is also low or fragmented, not setting __GFP_THISNODE was
> also measured on Haswell to have a 40% regression in allocation latency.
> =

> Restore __GFP_THISNODE for thp allocations.
> =

> Fixes: ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for MADV_HUGEPAGE map=
pings")
> Fixes: 89c83fb539f9 ("mm, thp: consolidate THP gfp handling into alloc_hu=
gepage_direct_gfpmask")
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  include/linux/mempolicy.h |  2 --
>  mm/huge_memory.c          | 42 +++++++++++++++------------------------
>  mm/mempolicy.c            |  2 +-
>  3 files changed, 17 insertions(+), 29 deletions(-)
> =

> diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
> --- a/include/linux/mempolicy.h
> +++ b/include/linux/mempolicy.h
> @@ -139,8 +139,6 @@ struct mempolicy *mpol_shared_policy_lookup(struct sh=
ared_policy *sp,
>  struct mempolicy *get_task_policy(struct task_struct *p);
>  struct mempolicy *__get_vma_policy(struct vm_area_struct *vma,
>  		unsigned long addr);
> -struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
> -						unsigned long addr);
>  bool vma_policy_mof(struct vm_area_struct *vma);
>  =

>  extern void numa_default_policy(void);
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -632,37 +632,27 @@ static vm_fault_t __do_huge_pmd_anonymous_page(stru=
ct vm_fault *vmf,
>  static inline gfp_t alloc_hugepage_direct_gfpmask(struct vm_area_struct =
*vma, unsigned long addr)
>  {
>  	const bool vma_madvised =3D !!(vma->vm_flags & VM_HUGEPAGE);
> -	gfp_t this_node =3D 0;
> -
> -#ifdef CONFIG_NUMA
> -	struct mempolicy *pol;
> -	/*
> -	 * __GFP_THISNODE is used only when __GFP_DIRECT_RECLAIM is not
> -	 * specified, to express a general desire to stay on the current
> -	 * node for optimistic allocation attempts. If the defrag mode
> -	 * and/or madvise hint requires the direct reclaim then we prefer
> -	 * to fallback to other node rather than node reclaim because that
> -	 * can lead to excessive reclaim even though there is free memory
> -	 * on other nodes. We expect that NUMA preferences are specified
> -	 * by memory policies.
> -	 */
> -	pol =3D get_vma_policy(vma, addr);
> -	if (pol->mode !=3D MPOL_BIND)
> -		this_node =3D __GFP_THISNODE;
> -	mpol_cond_put(pol);
> -#endif
> +	const gfp_t gfp_mask =3D GFP_TRANSHUGE_LIGHT | __GFP_THISNODE;
>  =

> +	/* Always do synchronous compaction */
>  	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG, &transparent_huge=
page_flags))
> -		return GFP_TRANSHUGE | (vma_madvised ? 0 : __GFP_NORETRY);
> +		return GFP_TRANSHUGE | __GFP_THISNODE |
> +		       (vma_madvised ? 0 : __GFP_NORETRY);
> +
> +	/* Kick kcompactd and fail quickly */
>  	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG, &transparent_huge=
page_flags))
> -		return GFP_TRANSHUGE_LIGHT | __GFP_KSWAPD_RECLAIM | this_node;
> +		return gfp_mask | __GFP_KSWAPD_RECLAIM;
> +
> +	/* Synchronous compaction if madvised, otherwise kick kcompactd */
>  	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG, &transpar=
ent_hugepage_flags))
> -		return GFP_TRANSHUGE_LIGHT | (vma_madvised ? __GFP_DIRECT_RECLAIM :
> -							     __GFP_KSWAPD_RECLAIM | this_node);
> +		return gfp_mask | (vma_madvised ? __GFP_DIRECT_RECLAIM :
> +						  __GFP_KSWAPD_RECLAIM);
> +
> +	/* Only do synchronous compaction if madvised */
>  	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG, &transparent_hu=
gepage_flags))
> -		return GFP_TRANSHUGE_LIGHT | (vma_madvised ? __GFP_DIRECT_RECLAIM :
> -							     this_node);
> -	return GFP_TRANSHUGE_LIGHT | this_node;
> +		return gfp_mask | (vma_madvised ? __GFP_DIRECT_RECLAIM : 0);
> +
> +	return gfp_mask;
>  }
>  =

>  /* Caller must hold page table lock. */
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -1662,7 +1662,7 @@ struct mempolicy *__get_vma_policy(struct vm_area_s=
truct *vma,
>   * freeing by another task.  It is the caller's responsibility to free t=
he
>   * extra reference for shared policies.
>   */
> -struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
> +static struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
>  						unsigned long addr)
>  {
>  	struct mempolicy *pol =3D __get_vma_policy(vma, addr);
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

Hi,

FYI, we noticed no regression of vm-scalability.throughput between the two =
commits.

tests: 1
testcase/path_params/tbox_group/run: vm-scalability/300-always-always-32-1-=
swap-w-seq-ucode=3D0x3d-performance/lkp-hsw-ep4

commit: =

  94e297c50b ("include/linux/notifier.h: SRCU: fix ctags")
  2f0799a0ff ("mm, thp: restore node-local hugepage allocations")

94e297c50b529f5d  2f0799a0ffc033bf3cc82d5032  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

    425945 =C2=B1  9%        36%     578453 =C2=B1 18%  vm-scalability.time=
.minor_page_faults
       322                         313        vm-scalability.time.user_time
    905482 =C2=B1  5%        20%    1087102 =C2=B1  9%  perf-stat.page-faul=
ts
    901474 =C2=B1  5%        20%    1081707 =C2=B1  9%  perf-stat.minor-fau=
lts
    425945 =C2=B1  9%        36%     578453 =C2=B1 18%  time.minor_page_fau=
lts
       322                         313        time.user_time
      6792 =C2=B1  5%       -10%       6097        vmstat.system.cs
   1625177 =C2=B1  4%       -11%    1446045        vmstat.swap.so
   1625189 =C2=B1  4%       -11%    1446055        vmstat.io.bo
    171516 =C2=B1  5%       -24%     131111 =C2=B1 24%  vmstat.system.in
    157193 =C2=B1 15%        46%     230011 =C2=B1 20%  proc-vmstat.pgactiv=
ate
    559397 =C2=B1  8%        45%     809533 =C2=B1 12%  proc-vmstat.pgscan_=
direct
    207042 =C2=B1  8%        43%     295574 =C2=B1 10%  proc-vmstat.pgsteal=
_direct
   5852284 =C2=B1 12%        42%    8294341 =C2=B1 20%  proc-vmstat.slabs_s=
canned
    211428 =C2=B1  6%        39%     293175 =C2=B1  6%  proc-vmstat.pgrefill
    135763 =C2=B1  9%        39%     188155 =C2=B1  3%  proc-vmstat.nr_vmsc=
an_write
    220023 =C2=B1  5%        38%     303404 =C2=B1  6%  proc-vmstat.nr_writ=
ten
    219051 =C2=B1  5%        38%     301549 =C2=B1  6%  proc-vmstat.pgrotat=
ed
      1018 =C2=B1 10%        36%       1383 =C2=B1  4%  proc-vmstat.nr_zone=
_write_pending
      1017 =C2=B1 10%        36%       1379 =C2=B1  4%  proc-vmstat.nr_writ=
eback
    919059 =C2=B1  4%        20%    1102507 =C2=B1  9%  proc-vmstat.pgfault
   1108142 =C2=B1  9%        16%    1285859 =C2=B1  5%  proc-vmstat.numa_lo=
cal
   1122389 =C2=B1  9%        16%    1302063 =C2=B1  5%  proc-vmstat.numa_hit
    715724              -5%     682381 =C2=B1  4%  proc-vmstat.nr_file_pages
      5784 =C2=B1  6%        -5%       5482 =C2=B1  7%  proc-vmstat.nr_mapp=
ed
    266928             -16%     223157        proc-vmstat.nr_zone_unevictab=
le
    266928             -16%     223157        proc-vmstat.nr_unevictable
         0            4e+05     428930 =C2=B1139%  latency_stats.avg.io_sch=
edule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fault._=
_do_page_fault.do_page_fault.page_fault.copy_user_generic_unrolled._copy_to=
_user.do_syslog.kmsg_read
     11973 =C2=B1 70%      3e+05     298302 =C2=B1 83%  latency_stats.avg.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.copy_user_enhanced_fast_string=
._copy_to_user.do_syslog.kmsg_read
     17650 =C2=B1 35%      2e+05     265410 =C2=B1 84%  latency_stats.avg.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.strnlen_user.copy_strings.__do=
_execve_file.__x64_sys_execve
      9801 =C2=B1 42%      5e+04      61121 =C2=B1112%  latency_stats.avg.i=
o_schedule.__lock_page.__lock_page_or_retry.do_swap_page.__handle_mm_fault.=
handle_mm_fault.__get_user_pages.get_user_pages_remote.__access_remote_vm.p=
roc_pid_cmdline_read.__vfs_read.vfs_read
         0            3e+04      25998 =C2=B1141%  latency_stats.avg.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
         0            6e+03       6202 =C2=B1141%  latency_stats.avg.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.read_swap_cache_async.swap_cluster_readahead=
.shmem_swapin.shmem_getpage_gfp.shmem_fault
         0            5e+03       5457 =C2=B1141%  latency_stats.avg.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.swapin_readahead.do_swap_page.__handle_mm_fa=
ult.handle_mm_fault.__get_user_pages
      4585 =C2=B1173%     -5e+03          0        latency_stats.avg.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.swap_cluster_readahead.shmem_swapin.shmem_ge=
tpage_gfp.shmem_fault.__do_fault
      6229 =C2=B1173%     -6e+03          0        latency_stats.avg.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.read_swap_cache_async.swap_cluster_readahead=
.shmem_swapin.shmem_getpage_gfp.shmem_write_begin
     37391 =C2=B1173%     -4e+04          0        latency_stats.avg.io_sch=
edule.wait_on_page_bit.shmem_getpage_gfp.shmem_fault.__do_fault.__handle_mm=
_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     52525 =C2=B1100%     -5e+04          0        latency_stats.avg.msleep=
.shrink_inactive_list.shrink_node_memcg.shrink_node.do_try_to_free_pages.tr=
y_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodemask.do_huge_pmd_a=
nonymous_page.__handle_mm_fault.handle_mm_fault.__do_page_fault
    141825 =C2=B1172%     -1e+05        590 =C2=B1126%  latency_stats.avg.i=
o_schedule.__lock_page.shmem_getpage_gfp.shmem_file_read_iter.__vfs_read.vf=
s_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
    240110 =C2=B1124%     -2e+05       2543 =C2=B1141%  latency_stats.avg.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.copy_user_generic_unrolled._co=
py_to_user.perf_read.__vfs_read
    272115 =C2=B1171%     -3e+05       6043 =C2=B1 71%  latency_stats.avg.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.copy_user_generic_unrolled.cor=
e_sys_select.kern_select.__x64_sys_select
    538363 =C2=B1 77%     -4e+05     136003 =C2=B1 68%  latency_stats.avg.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.copy_user_enhanced_fast_string=
.copyout._copy_to_iter.skb_copy_datagram_iter
     23857 =C2=B1 26%      1e+06    1035782 =C2=B1 71%  latency_stats.max.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.strnlen_user.copy_strings.__do=
_execve_file.__x64_sys_execve
     11973 =C2=B1 70%      8e+05     778555 =C2=B1 70%  latency_stats.max.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.copy_user_enhanced_fast_string=
._copy_to_user.do_syslog.kmsg_read
         0            4e+05     428930 =C2=B1139%  latency_stats.max.io_sch=
edule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fault._=
_do_page_fault.do_page_fault.page_fault.copy_user_generic_unrolled._copy_to=
_user.do_syslog.kmsg_read
         0            3e+04      25998 =C2=B1141%  latency_stats.max.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
         0            8e+03       7916 =C2=B1141%  latency_stats.max.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.read_swap_cache_async.swap_cluster_readahead=
.shmem_swapin.shmem_getpage_gfp.shmem_fault
         0            7e+03       6751 =C2=B1141%  latency_stats.max.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.swapin_readahead.do_swap_page.__handle_mm_fa=
ult.handle_mm_fault.__get_user_pages
      4585 =C2=B1173%     -5e+03          0        latency_stats.max.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.swap_cluster_readahead.shmem_swapin.shmem_ge=
tpage_gfp.shmem_fault.__do_fault
      6229 =C2=B1173%     -6e+03          0        latency_stats.max.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.read_swap_cache_async.swap_cluster_readahead=
.shmem_swapin.shmem_getpage_gfp.shmem_write_begin
      7425 =C2=B1117%     -7e+03         68 =C2=B1  7%  latency_stats.max.s=
mp_call_on_cpu.lockup_detector_reconfigure.proc_watchdog_common.proc_sys_ca=
ll_handler.__vfs_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
     52680 =C2=B1100%     -5e+04          0        latency_stats.max.msleep=
.shrink_inactive_list.shrink_node_memcg.shrink_node.do_try_to_free_pages.tr=
y_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodemask.do_huge_pmd_a=
nonymous_page.__handle_mm_fault.handle_mm_fault.__do_page_fault
    107626 =C2=B1173%     -1e+05          0        latency_stats.max.io_sch=
edule.wait_on_page_bit.shmem_getpage_gfp.shmem_fault.__do_fault.__handle_mm=
_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
    272938 =C2=B1170%     -3e+05      16767 =C2=B1 71%  latency_stats.max.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.copy_user_generic_unrolled.cor=
e_sys_select.kern_select.__x64_sys_select
    284952 =C2=B1170%     -3e+05        592 =C2=B1125%  latency_stats.max.i=
o_schedule.__lock_page.shmem_getpage_gfp.shmem_file_read_iter.__vfs_read.vf=
s_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
    357768 =C2=B1136%     -4e+05       2543 =C2=B1141%  latency_stats.max.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.copy_user_generic_unrolled._co=
py_to_user.perf_read.__vfs_read
   1155510 =C2=B1 48%      9e+06    9751594 =C2=B1110%  latency_stats.sum.i=
o_schedule.__lock_page.__lock_page_or_retry.do_swap_page.__handle_mm_fault.=
handle_mm_fault.__get_user_pages.get_user_pages_remote.__access_remote_vm.p=
roc_pid_cmdline_read.__vfs_read.vfs_read
   4573026 =C2=B1 77%      8e+06   12847407 =C2=B1122%  latency_stats.sum.i=
o_schedule.wait_on_page_bit.shmem_getpage_gfp.shmem_write_begin.generic_per=
form_write.__generic_file_write_iter.generic_file_write_iter.__vfs_write.vf=
s_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     48641 =C2=B1 48%      2e+06    2342957 =C2=B1 71%  latency_stats.sum.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.strnlen_user.copy_strings.__do=
_execve_file.__x64_sys_execve
     11973 =C2=B1 70%      8e+05     788601 =C2=B1 70%  latency_stats.sum.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.copy_user_enhanced_fast_string=
._copy_to_user.do_syslog.kmsg_read
         0            4e+05     428930 =C2=B1139%  latency_stats.sum.io_sch=
edule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fault._=
_do_page_fault.do_page_fault.page_fault.copy_user_generic_unrolled._copy_to=
_user.do_syslog.kmsg_read
         0            4e+04      38202 =C2=B1141%  latency_stats.sum.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.swapin_readahead.do_swap_page.__handle_mm_fa=
ult.handle_mm_fault.__get_user_pages
         0            3e+04      25998 =C2=B1141%  latency_stats.sum.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
         0            2e+04      18607 =C2=B1141%  latency_stats.sum.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.read_swap_cache_async.swap_cluster_readahead=
.shmem_swapin.shmem_getpage_gfp.shmem_fault
      4585 =C2=B1173%     -5e+03          0        latency_stats.sum.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.swap_cluster_readahead.shmem_swapin.shmem_ge=
tpage_gfp.shmem_fault.__do_fault
      8048 =C2=B1 99%     -5e+03       3141 =C2=B1 60%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_access.nfs_do_access.nfs_permission.inode_permission.link_pat=
h_walk.path_lookupat.filename_lookup
      6229 =C2=B1173%     -6e+03          0        latency_stats.sum.io_sch=
edule.blk_mq_get_tag.blk_mq_get_request.blk_mq_make_request.generic_make_re=
quest.submit_bio.swap_readpage.read_swap_cache_async.swap_cluster_readahead=
.shmem_swapin.shmem_getpage_gfp.shmem_write_begin
     10774 =C2=B1 82%     -7e+03       3648 =C2=B1  5%  latency_stats.sum.s=
mp_call_on_cpu.lockup_detector_reconfigure.proc_watchdog_common.proc_sys_ca=
ll_handler.__vfs_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
    112174 =C2=B1173%     -1e+05          0        latency_stats.sum.io_sch=
edule.wait_on_page_bit.shmem_getpage_gfp.shmem_fault.__do_fault.__handle_mm=
_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
    157878 =C2=B1137%     -2e+05          0        latency_stats.sum.msleep=
.shrink_inactive_list.shrink_node_memcg.shrink_node.do_try_to_free_pages.tr=
y_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodemask.do_huge_pmd_a=
nonymous_page.__handle_mm_fault.handle_mm_fault.__do_page_fault
    275908 =C2=B1168%     -3e+05      18129 =C2=B1 71%  latency_stats.sum.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.copy_user_generic_unrolled.cor=
e_sys_select.kern_select.__x64_sys_select
    285059 =C2=B1170%     -3e+05        633 =C2=B1113%  latency_stats.sum.i=
o_schedule.__lock_page.shmem_getpage_gfp.shmem_file_read_iter.__vfs_read.vf=
s_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
    427767 =C2=B1141%     -4e+05       2543 =C2=B1141%  latency_stats.sum.i=
o_schedule.__lock_page_or_retry.do_swap_page.__handle_mm_fault.handle_mm_fa=
ult.__do_page_fault.do_page_fault.page_fault.copy_user_generic_unrolled._co=
py_to_user.perf_read.__vfs_read

Best Regards,
Rong Chen

--===============2142497653886069881==--

