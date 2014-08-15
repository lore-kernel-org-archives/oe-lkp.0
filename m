Content-Type: multipart/mixed; boundary="===============4473304768088777478=="
MIME-Version: 1.0
From: Tim Chen <tim.c.chen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [fs/superblock] d23da150a37: -100% perf-profile.cpu-cycles._raw_spin_lock.put_super.super_cache_count.shrink_slab_node.shrink_slab
Date: Fri, 15 Aug 2014 08:48:59 -0700
Message-ID: <1408117739.4347.1.camel@schen9-DESK>
In-Reply-To: <20140815101431.GA22772@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4473304768088777478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2014-08-15 at 18:14 +0800, Fengguang Wu wrote:
> Hi Tim,
> =

> FYI, before this patch, there are 30.89% lock contention in
> put_super() <=3D super_cache_count() <=3D shrink_slab_node() path.
> Now it's completely avoided.

Thanks for the data.

Tim

> =

> commit d23da150a37c9fe3cc83dbaf71b3e37fd434ed52 ("fs/superblock: avoid lo=
cking counting inodes and dentries before reclaiming them")
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  testbox/testcase/testparams
> ---------------  -------------------------  ---------------------------
>      %stddev        %change               %stddev
>             \          |                 /
>          0           +Inf%          1 =C2=B1 0%  brickland3/vm-scalabilit=
y/300s-lru-file-readonce
>          0           +Inf%          1 =C2=B1 0%  TOTAL dmesg.page_allocat=
ion_failure:order:,mode
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    1378711 =C2=B1 3%    +481.5%    8016909 =C2=B110%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    1378711 =C2=B1 3%    +481.5%    8016909 =C2=B110%  TOTAL proc-vmstat.w=
orkingset_activate
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      30.89 =C2=B1 0%    -100.0%       0.00 =C2=B1 0%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      30.89 =C2=B1 0%    -100.0%       0.00 =C2=B1 0%  TOTAL perf-profile.=
cpu-cycles._raw_spin_lock.put_super.super_cache_count.shrink_slab_node.shri=
nk_slab
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     353010 =C2=B1 3%    +479.0%    2044012 =C2=B111%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     353010 =C2=B1 3%    +479.0%    2044012 =C2=B111%  TOTAL numa-vmstat.n=
ode3.workingset_activate
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     345473 =C2=B1 4%    +473.0%    1979528 =C2=B110%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     345473 =C2=B1 4%    +473.0%    1979528 =C2=B110%  TOTAL numa-vmstat.n=
ode0.workingset_activate
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    6098200 =C2=B1 3%    +415.0%   31406389 =C2=B1 9%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    6098200 =C2=B1 3%    +415.0%   31406389 =C2=B1 9%  TOTAL numa-vmstat.n=
ode0.workingset_refault
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       0.13 =C2=B112%    +764.6%       1.12 =C2=B111%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       0.13 =C2=B112%    +764.6%       1.12 =C2=B111%  TOTAL perf-profile.=
cpu-cycles._raw_spin_lock_irqsave.pagevec_lru_move_fn.lru_add_drain_cpu.lru=
_add_drain.shrink_inactive_list
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     349365 =C2=B1 3%    +488.3%    2055307 =C2=B110%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     349365 =C2=B1 3%    +488.3%    2055307 =C2=B110%  TOTAL numa-vmstat.n=
ode2.workingset_activate
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     350454 =C2=B1 5%    +484.8%    2049628 =C2=B110%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     350454 =C2=B1 5%    +484.8%    2049628 =C2=B110%  TOTAL numa-vmstat.n=
ode1.workingset_activate
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       0.22 =C2=B128%   +3068.8%       6.91 =C2=B114%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       0.22 =C2=B128%   +3068.8%       6.91 =C2=B114%  TOTAL perf-profile.=
cpu-cycles.osq_lock.__mutex_lock_slowpath.mutex_lock.rmap_walk.page_referen=
ced
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      30.80 =C2=B1 0%    -100.0%       0.00 =C2=B1 0%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      30.80 =C2=B1 0%    -100.0%       0.00 =C2=B1 0%  TOTAL perf-profile.=
cpu-cycles._raw_spin_lock.grab_super_passive.super_cache_count.shrink_slab_=
node.shrink_slab
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       0.00           +Inf%       2.08 =C2=B1 9%  brickland3/vm-scalabilit=
y/300s-lru-file-mmap-read-rand
>       0.00           +Inf%       2.08 =C2=B1 9%  TOTAL perf-profile.cpu-c=
ycles._raw_spin_lock.get_page_from_freelist.__alloc_pages_nodemask.alloc_pa=
ges_current.__page_cache_alloc
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       0.97 =C2=B1 6%    +588.3%       6.70 =C2=B112%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       0.97 =C2=B1 6%    +588.3%       6.70 =C2=B112%  TOTAL perf-profile.=
cpu-cycles._raw_spin_lock_irqsave.pagevec_lru_move_fn.__lru_cache_add.lru_c=
ache_add.add_to_page_cache_lru
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       0.31 =C2=B1 5%    +987.8%       3.39 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       0.31 =C2=B1 5%    +987.8%       3.39 =C2=B1 3%  TOTAL perf-profile.=
cpu-cycles.mutex_spin_on_owner.__mutex_lock_slowpath.mutex_lock.rmap_walk.p=
age_referenced
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      23033 =C2=B121%   +3750.5%     886892 =C2=B113%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      23033 =C2=B121%   +3750.5%     886892 =C2=B113%  TOTAL proc-vmstat.p=
gdeactivate
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      23485 =C2=B123%   +3692.8%     890775 =C2=B113%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      23485 =C2=B123%   +3692.8%     890775 =C2=B113%  TOTAL proc-vmstat.p=
grefill_dma32
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       6756 =C2=B1 6%    +495.5%      40232 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       6756 =C2=B1 6%    +495.5%      40232 =C2=B1 3%  TOTAL cpuidle.C3-IV=
T-4S.usage
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       3003 =C2=B1 4%    +556.7%      19725 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       3003 =C2=B1 4%    +556.7%      19725 =C2=B1 4%  TOTAL cpuidle.C1E-I=
VT-4S.usage
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       0.05 =C2=B110%   +4717.4%       2.22 =C2=B1 8%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       0.05 =C2=B110%   +4717.4%       2.22 =C2=B1 8%  TOTAL perf-profile.=
cpu-cycles.osq_lock.__mutex_lock_slowpath.mutex_lock.rmap_walk.try_to_unmap
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   21798872 =C2=B1 3%    +362.2%  1.008e+08 =C2=B1 9%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   21798872 =C2=B1 3%    +362.2%  1.008e+08 =C2=B1 9%  TOTAL proc-vmstat.w=
orkingset_refault
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    5235189 =C2=B1 3%    +350.5%   23583875 =C2=B1 9%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    5235189 =C2=B1 3%    +350.5%   23583875 =C2=B1 9%  TOTAL numa-vmstat.n=
ode1.workingset_refault
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    5326752 =C2=B1 3%    +343.0%   23595177 =C2=B1 9%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    5326752 =C2=B1 3%    +343.0%   23595177 =C2=B1 9%  TOTAL numa-vmstat.n=
ode2.workingset_refault
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    5413011 =C2=B1 3%    +333.4%   23460173 =C2=B1 9%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    5413011 =C2=B1 3%    +333.4%   23460173 =C2=B1 9%  TOTAL numa-vmstat.n=
ode3.workingset_refault
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       6435 =C2=B1 2%    +339.2%      28266 =C2=B1 6%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       6435 =C2=B1 2%    +339.2%      28266 =C2=B1 6%  TOTAL softirqs.HRTI=
MER
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       0.67 =C2=B1 4%    +318.5%       2.81 =C2=B111%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       0.67 =C2=B1 4%    +318.5%       2.81 =C2=B111%  TOTAL perf-profile.=
cpu-cycles.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_curren=
t.__page_cache_alloc.filemap_fault
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     638058 =C2=B1 1%    +273.8%    2384934 =C2=B1 6%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     638058 =C2=B1 1%    +273.8%    2384934 =C2=B1 6%  TOTAL proc-vmstat.a=
llocstall
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    4100281 =C2=B145%    +276.1%   15419165 =C2=B128%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    4100281 =C2=B145%    +276.1%   15419165 =C2=B128%  TOTAL cpuidle.C1E-I=
VT-4S.time
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   1.42e+08 =C2=B1 1%    +255.8%  5.053e+08 =C2=B1 6%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   1.42e+08 =C2=B1 1%    +255.8%  5.053e+08 =C2=B1 6%  TOTAL proc-vmstat.p=
gsteal_direct_normal
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       0.49 =C2=B1 0%    +239.3%       1.66 =C2=B112%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       0.49 =C2=B1 0%    +239.3%       1.66 =C2=B112%  TOTAL perf-profile.=
cpu-cycles.filemap_map_pages.do_read_fault.handle_mm_fault.__do_page_fault.=
do_page_fault
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       2.22 =C2=B1 1%    +255.8%       7.89 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       2.22 =C2=B1 1%    +255.8%       7.89 =C2=B1 4%  TOTAL perf-profile.=
cpu-cycles.generic_exec_single.smp_call_function_single.smp_call_function_m=
any.native_flush_tlb_others.flush_tlb_page
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       0.48 =C2=B1 1%    +233.9%       1.60 =C2=B112%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       0.48 =C2=B1 1%    +233.9%       1.60 =C2=B112%  TOTAL perf-profile.=
cpu-cycles.radix_tree_next_chunk.filemap_map_pages.do_read_fault.handle_mm_=
fault.__do_page_fault
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       0.44 =C2=B1 1%    +228.5%       1.45 =C2=B112%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       0.44 =C2=B1 1%    +228.5%       1.45 =C2=B112%  TOTAL perf-profile.=
cpu-cycles.page_fault.do_unit
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       0.43 =C2=B1 2%    +214.7%       1.37 =C2=B111%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       0.43 =C2=B1 2%    +214.7%       1.37 =C2=B111%  TOTAL perf-profile.=
cpu-cycles.__radix_tree_lookup.__delete_from_page_cache.__remove_mapping.sh=
rink_page_list.shrink_inactive_list
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   15191893 =C2=B1 1%    +216.4%   48063195 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   15191893 =C2=B1 1%    +216.4%   48063195 =C2=B1 5%  TOTAL proc-vmstat.p=
gsteal_direct_dma32
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   30484028 =C2=B1 1%    +213.0%   95400784 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   30484028 =C2=B1 1%    +213.0%   95400784 =C2=B1 5%  TOTAL proc-vmstat.p=
gscan_direct_dma32
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       1.13 =C2=B1 1%    +197.3%       3.35 =C2=B112%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       1.13 =C2=B1 1%    +197.3%       3.35 =C2=B112%  TOTAL perf-profile.=
cpu-cycles.memset.mpage_readpage.xfs_vm_readpage.filemap_fault.__do_fault
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   15698367 =C2=B1 1%    +209.2%   48532199 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   15698367 =C2=B1 1%    +209.2%   48532199 =C2=B1 5%  TOTAL proc-vmstat.p=
galloc_dma32
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   14731762 =C2=B142%    +111.9%   31214595 =C2=B110%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   14731762 =C2=B142%    +111.9%   31214595 =C2=B110%  TOTAL cpuidle.C3-IV=
T-4S.time
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       1557 =C2=B117%    +143.8%       3796 =C2=B110%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       1557 =C2=B117%    +143.8%       3796 =C2=B110%  TOTAL proc-vmstat.n=
uma_pages_migrated
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       1557 =C2=B117%    +145.3%       3819 =C2=B110%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       1557 =C2=B117%    +145.3%       3819 =C2=B110%  TOTAL proc-vmstat.p=
gmigrate_success
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    9551900 =C2=B1 2%    +135.6%   22506313 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    9551900 =C2=B1 2%    +135.6%   22506313 =C2=B1 3%  TOTAL numa-meminfo.=
node1.Active(file)
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    2381801 =C2=B1 2%    +136.2%    5625948 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    2381801 =C2=B1 2%    +136.2%    5625948 =C2=B1 3%  TOTAL numa-vmstat.n=
ode1.nr_active_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    9559152 =C2=B1 2%    +135.5%   22513393 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    9559152 =C2=B1 2%    +135.5%   22513393 =C2=B1 3%  TOTAL numa-meminfo.=
node1.Active
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    2371507 =C2=B1 3%    +135.6%    5587802 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    2371507 =C2=B1 3%    +135.6%    5587802 =C2=B1 5%  TOTAL numa-vmstat.n=
ode3.nr_active_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    9509093 =C2=B1 2%    +135.1%   22353738 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    9509093 =C2=B1 2%    +135.1%   22353738 =C2=B1 5%  TOTAL numa-meminfo.=
node3.Active(file)
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    9515768 =C2=B1 2%    +135.0%   22360020 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    9515768 =C2=B1 2%    +135.0%   22360020 =C2=B1 5%  TOTAL numa-meminfo.=
node3.Active
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   37889376 =C2=B1 1%    +136.3%   89540164 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   37889376 =C2=B1 1%    +136.3%   89540164 =C2=B1 4%  TOTAL meminfo.Activ=
e(file)
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   37923039 =C2=B1 1%    +136.2%   89573898 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   37923039 =C2=B1 1%    +136.2%   89573898 =C2=B1 4%  TOTAL meminfo.Active
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    9489467 =C2=B1 1%    +135.1%   22311931 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    9489467 =C2=B1 1%    +135.1%   22311931 =C2=B1 4%  TOTAL proc-vmstat.n=
r_active_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   4.84e+08 =C2=B1 0%    +136.1%  1.143e+09 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   4.84e+08 =C2=B1 0%    +136.1%  1.143e+09 =C2=B1 4%  TOTAL proc-vmstat.p=
gscan_direct_normal
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    2363828 =C2=B1 3%    +137.4%    5610797 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    2363828 =C2=B1 3%    +137.4%    5610797 =C2=B1 5%  TOTAL numa-vmstat.n=
ode2.nr_active_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    9479156 =C2=B1 3%    +136.8%   22444949 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    9479156 =C2=B1 3%    +136.8%   22444949 =C2=B1 5%  TOTAL numa-meminfo.=
node2.Active(file)
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    9490907 =C2=B1 3%    +136.6%   22457599 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    9490907 =C2=B1 3%    +136.6%   22457599 =C2=B1 5%  TOTAL numa-meminfo.=
node2.Active
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    9477456 =C2=B1 1%    +130.3%   21828160 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    9477456 =C2=B1 1%    +130.3%   21828160 =C2=B1 4%  TOTAL numa-meminfo.=
node0.Active(file)
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    9485441 =C2=B1 1%    +130.2%   21835827 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    9485441 =C2=B1 1%    +130.2%   21835827 =C2=B1 4%  TOTAL numa-meminfo.=
node0.Active
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    2363557 =C2=B1 1%    +130.9%    5456600 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    2363557 =C2=B1 1%    +130.9%    5456600 =C2=B1 4%  TOTAL numa-vmstat.n=
ode0.nr_active_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   18222456 =C2=B1 1%    +127.7%   41494854 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   18222456 =C2=B1 1%    +127.7%   41494854 =C2=B1 3%  TOTAL numa-vmstat.n=
ode0.numa_miss
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   18230068 =C2=B1 1%    +127.7%   41512391 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   18230068 =C2=B1 1%    +127.7%   41512391 =C2=B1 3%  TOTAL numa-vmstat.n=
ode0.numa_other
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    1714303 =C2=B1 1%    +125.7%    3869178 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    1714303 =C2=B1 1%    +125.7%    3869178 =C2=B1 4%  TOTAL cpuidle.C6-IV=
T-4S.usage
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   25647405 =C2=B1 1%    +120.5%   56558567 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   25647405 =C2=B1 1%    +120.5%   56558567 =C2=B1 4%  TOTAL numa-numastat=
.node0.numa_miss
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   25655314 =C2=B1 1%    +120.5%   56580339 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   25655314 =C2=B1 1%    +120.5%   56580339 =C2=B1 4%  TOTAL numa-numastat=
.node0.other_node
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     925208 =C2=B1 0%    +118.4%    2021110 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     925208 =C2=B1 0%    +118.4%    2021110 =C2=B1 3%  TOTAL softirqs.SCHED
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       5.57 =C2=B1 1%     -55.3%       2.49 =C2=B110%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       5.57 =C2=B1 1%     -55.3%       2.49 =C2=B110%  TOTAL perf-profile.=
cpu-cycles.read_hpet.ktime_get.sched_clock_tick.scheduler_tick.update_proce=
ss_times
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     937728 =C2=B1 2%    +106.0%    1931661 =C2=B1 7%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     937728 =C2=B1 2%    +106.0%    1931661 =C2=B1 7%  TOTAL cpuidle.C1-IV=
T-4S.usage
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   83713891 =C2=B1 1%     +96.0%  1.641e+08 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   83713891 =C2=B1 1%     +96.0%  1.641e+08 =C2=B1 5%  TOTAL numa-numastat=
.node0.numa_hit
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   83705982 =C2=B1 1%     +96.0%  1.641e+08 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   83705982 =C2=B1 1%     +96.0%  1.641e+08 =C2=B1 5%  TOTAL numa-numastat=
.node0.local_node
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>  1.178e+08 =C2=B1 1%     -51.1%   57568287 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>  1.178e+08 =C2=B1 1%     -51.1%   57568287 =C2=B1 4%  TOTAL proc-vmstat.p=
gsteal_kswapd_normal
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   81174799 =C2=B1 1%     +93.2%  1.568e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   81174799 =C2=B1 1%     +93.2%  1.568e+08 =C2=B1 4%  TOTAL numa-numastat=
.node1.numa_hit
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   81167270 =C2=B1 1%     +93.2%  1.568e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   81167270 =C2=B1 1%     +93.2%  1.568e+08 =C2=B1 4%  TOTAL numa-numastat=
.node1.local_node
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     121692 =C2=B1 2%     -50.0%      60864 =C2=B111%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     121692 =C2=B1 2%     -50.0%      60864 =C2=B111%  TOTAL proc-vmstat.p=
gsteal_kswapd_dma32
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>  3.287e+08 =C2=B1 1%     +91.3%  6.287e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>  3.287e+08 =C2=B1 1%     +91.3%  6.287e+08 =C2=B1 4%  TOTAL proc-vmstat.n=
uma_hit
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>  3.286e+08 =C2=B1 1%     +91.3%  6.286e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>  3.286e+08 =C2=B1 1%     +91.3%  6.286e+08 =C2=B1 4%  TOTAL proc-vmstat.n=
uma_local
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>        143 =C2=B1 7%     +97.1%        283 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>        143 =C2=B1 7%     +97.1%        283 =C2=B1 4%  TOTAL numa-vmstat.n=
ode3.nr_isolated_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   81583112 =C2=B1 1%     +90.0%   1.55e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   81583112 =C2=B1 1%     +90.0%   1.55e+08 =C2=B1 4%  TOTAL numa-numastat=
.node2.numa_hit
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   81574130 =C2=B1 1%     +90.0%   1.55e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   81574130 =C2=B1 1%     +90.0%   1.55e+08 =C2=B1 4%  TOTAL numa-numastat=
.node2.local_node
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>        138 =C2=B1 7%     +96.2%        272 =C2=B1 8%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>        138 =C2=B1 7%     +96.2%        272 =C2=B1 8%  TOTAL numa-vmstat.n=
ode2.nr_isolated_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>        144 =C2=B1 5%     +84.0%        266 =C2=B1 8%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>        144 =C2=B1 5%     +84.0%        266 =C2=B1 8%  TOTAL numa-vmstat.n=
ode1.nr_isolated_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   18704928 =C2=B1 2%     +85.6%   34712886 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   18704928 =C2=B1 2%     +85.6%   34712886 =C2=B1 4%  TOTAL proc-vmstat.p=
gactivate
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   82212848 =C2=B1 1%     +85.8%  1.528e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   82212848 =C2=B1 1%     +85.8%  1.528e+08 =C2=B1 4%  TOTAL numa-numastat=
.node3.local_node
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   82222740 =C2=B1 1%     +85.8%  1.528e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   82222740 =C2=B1 1%     +85.8%  1.528e+08 =C2=B1 4%  TOTAL numa-numastat=
.node3.numa_hit
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   67572794 =C2=B1 1%     +86.2%  1.258e+08 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   67572794 =C2=B1 1%     +86.2%  1.258e+08 =C2=B1 3%  TOTAL numa-vmstat.n=
ode0.numa_hit
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   67565189 =C2=B1 1%     +86.2%  1.258e+08 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   67565189 =C2=B1 1%     +86.2%  1.258e+08 =C2=B1 3%  TOTAL numa-vmstat.n=
ode0.numa_local
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>  4.014e+08 =C2=B1 1%     +83.6%  7.372e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>  4.014e+08 =C2=B1 1%     +83.6%  7.372e+08 =C2=B1 4%  TOTAL proc-vmstat.p=
gmajfault
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>  4.034e+08 =C2=B1 1%     +83.3%  7.393e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>  4.034e+08 =C2=B1 1%     +83.3%  7.393e+08 =C2=B1 4%  TOTAL proc-vmstat.p=
gfault
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>  4.077e+08 =C2=B1 1%     +82.4%  7.434e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>  4.077e+08 =C2=B1 1%     +82.4%  7.434e+08 =C2=B1 4%  TOTAL proc-vmstat.p=
gfree
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   66111896 =C2=B1 1%     +83.1%   1.21e+08 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   66111896 =C2=B1 1%     +83.1%   1.21e+08 =C2=B1 3%  TOTAL numa-vmstat.n=
ode1.numa_local
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   66199609 =C2=B1 1%     +83.0%  1.211e+08 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   66199609 =C2=B1 1%     +83.0%  1.211e+08 =C2=B1 3%  TOTAL numa-vmstat.n=
ode1.numa_hit
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   66447208 =C2=B1 0%     +80.2%  1.197e+08 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   66447208 =C2=B1 0%     +80.2%  1.197e+08 =C2=B1 3%  TOTAL numa-vmstat.n=
ode2.numa_local
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   66537837 =C2=B1 0%     +80.1%  1.198e+08 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   66537837 =C2=B1 0%     +80.1%  1.198e+08 =C2=B1 3%  TOTAL numa-vmstat.n=
ode2.numa_hit
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>  3.923e+08 =C2=B1 1%     +77.2%  6.951e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>  3.923e+08 =C2=B1 1%     +77.2%  6.951e+08 =C2=B1 4%  TOTAL proc-vmstat.p=
galloc_normal
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   13833920 =C2=B1 0%     +78.8%   24740644 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   13833920 =C2=B1 0%     +78.8%   24740644 =C2=B1 4%  TOTAL numa-vmstat.n=
ode3.numa_foreign
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   19704393 =C2=B1 1%     +73.7%   34217836 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   19704393 =C2=B1 1%     +73.7%   34217836 =C2=B1 5%  TOTAL numa-numastat=
.node3.numa_foreign
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   66916315 =C2=B1 0%     +76.7%  1.182e+08 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   66916315 =C2=B1 0%     +76.7%  1.182e+08 =C2=B1 3%  TOTAL numa-vmstat.n=
ode3.numa_local
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   67007415 =C2=B1 0%     +76.6%  1.183e+08 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   67007415 =C2=B1 0%     +76.6%  1.183e+08 =C2=B1 3%  TOTAL numa-vmstat.n=
ode3.numa_hit
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>        696 =C2=B1 1%     +77.5%       1236 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>        696 =C2=B1 1%     +77.5%       1236 =C2=B1 2%  TOTAL proc-vmstat.n=
r_isolated_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   14098303 =C2=B1 1%     +74.6%   24617729 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   14098303 =C2=B1 1%     +74.6%   24617729 =C2=B1 3%  TOTAL numa-vmstat.n=
ode2.numa_foreign
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     236544 =C2=B1 6%     -42.9%     135132 =C2=B116%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     236544 =C2=B1 6%     -42.9%     135132 =C2=B116%  TOTAL proc-vmstat.p=
gscan_kswapd_dma32
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   20127674 =C2=B1 1%     +69.2%   34066063 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   20127674 =C2=B1 1%     +69.2%   34066063 =C2=B1 4%  TOTAL numa-numastat=
.node2.numa_foreign
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   14018395 =C2=B1 1%     +69.4%   23746061 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   14018395 =C2=B1 1%     +69.4%   23746061 =C2=B1 3%  TOTAL numa-vmstat.n=
ode1.numa_foreign
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>        347 =C2=B121%     +56.9%        545 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>        347 =C2=B121%     +56.9%        545 =C2=B1 4%  TOTAL proc-vmstat.c=
ompact_stall
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   19980538 =C2=B1 1%     +64.7%   32902228 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   19980538 =C2=B1 1%     +64.7%   32902228 =C2=B1 4%  TOTAL numa-numastat=
.node1.numa_foreign
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     121479 =C2=B1 1%     +63.5%     198557 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     121479 =C2=B1 1%     +63.5%     198557 =C2=B1 2%  TOTAL proc-vmstat.n=
uma_pte_updates
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     121861 =C2=B1 1%     +63.3%     198961 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     121861 =C2=B1 1%     +63.3%     198961 =C2=B1 2%  TOTAL proc-vmstat.n=
uma_hint_faults
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>        235 =C2=B1 5%     +53.2%        360 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>        235 =C2=B1 5%     +53.2%        360 =C2=B1 4%  TOTAL numa-vmstat.n=
ode0.nr_isolated_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   1.44e+08 =C2=B1 1%     -37.9%   89449609 =C2=B1 8%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   1.44e+08 =C2=B1 1%     -37.9%   89449609 =C2=B1 8%  TOTAL proc-vmstat.p=
gscan_kswapd_normal
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   17263063 =C2=B1 1%     -33.0%   11570236 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   17263063 =C2=B1 1%     -33.0%   11570236 =C2=B1 2%  TOTAL numa-numastat=
.node0.numa_foreign
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   77109754 =C2=B1 1%     +46.3%  1.128e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   77109754 =C2=B1 1%     +46.3%  1.128e+08 =C2=B1 4%  TOTAL proc-vmstat.n=
uma_other
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   77075439 =C2=B1 1%     +46.3%  1.128e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   77075439 =C2=B1 1%     +46.3%  1.128e+08 =C2=B1 4%  TOTAL proc-vmstat.n=
uma_miss
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   77075670 =C2=B1 1%     +46.3%  1.128e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   77075670 =C2=B1 1%     +46.3%  1.128e+08 =C2=B1 4%  TOTAL proc-vmstat.n=
uma_foreign
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   12250018 =C2=B1 1%     -31.7%    8370867 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   12250018 =C2=B1 1%     -31.7%    8370867 =C2=B1 2%  TOTAL numa-vmstat.n=
ode0.numa_foreign
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      66767 =C2=B1 1%     +48.0%      98824 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      66767 =C2=B1 1%     +48.0%      98824 =C2=B1 3%  TOTAL proc-vmstat.n=
uma_hint_faults_local
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       4.66 =C2=B120%     -39.0%       2.84 =C2=B1 9%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       4.66 =C2=B120%     -39.0%       2.84 =C2=B1 9%  TOTAL perf-profile.=
cpu-cycles.read_hpet.ktime_get.tick_sched_timer.__run_hrtimer.hrtimer_inter=
rupt
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      14.69 =C2=B1 4%     +28.4%      18.86 =C2=B1 8%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      14.69 =C2=B1 4%     +28.4%      18.86 =C2=B1 8%  TOTAL turbostat.%c1
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   12057428 =C2=B1 2%     +21.1%   14598450 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   12057428 =C2=B1 2%     +21.1%   14598450 =C2=B1 3%  TOTAL numa-vmstat.n=
ode3.numa_miss
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   12148534 =C2=B1 2%     +21.0%   14699700 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   12148534 =C2=B1 2%     +21.0%   14699700 =C2=B1 3%  TOTAL numa-vmstat.n=
ode3.numa_other
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   91446137 =C2=B1 0%     -18.6%   74391543 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   91446137 =C2=B1 0%     -18.6%   74391543 =C2=B1 1%  TOTAL numa-meminfo.=
node2.Inactive(file)
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   91446165 =C2=B1 0%     -18.6%   74442893 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   91446165 =C2=B1 0%     -18.6%   74442893 =C2=B1 1%  TOTAL numa-meminfo.=
node2.Inactive
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   22784170 =C2=B1 0%     -18.3%   18605270 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   22784170 =C2=B1 0%     -18.3%   18605270 =C2=B1 1%  TOTAL numa-vmstat.n=
ode2.nr_inactive_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   90903185 =C2=B1 0%     -18.1%   74458868 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   90903185 =C2=B1 0%     -18.1%   74458868 =C2=B1 1%  TOTAL numa-meminfo.=
node3.Inactive
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   90903093 =C2=B1 0%     -18.1%   74458776 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   90903093 =C2=B1 0%     -18.1%   74458776 =C2=B1 1%  TOTAL numa-meminfo.=
node3.Inactive(file)
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   17298677 =C2=B1 1%     +19.1%   20599738 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   17298677 =C2=B1 1%     +19.1%   20599738 =C2=B1 4%  TOTAL numa-numastat=
.node3.other_node
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   90478657 =C2=B1 0%     -17.7%   74495766 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   90478657 =C2=B1 0%     -17.7%   74495766 =C2=B1 1%  TOTAL numa-meminfo.=
node0.Inactive(file)
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   90478751 =C2=B1 0%     -17.7%   74495812 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   90478751 =C2=B1 0%     -17.7%   74495812 =C2=B1 1%  TOTAL numa-meminfo.=
node0.Inactive
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   17288785 =C2=B1 1%     +19.0%   20575957 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   17288785 =C2=B1 1%     +19.0%   20575957 =C2=B1 4%  TOTAL numa-numastat=
.node3.numa_miss
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>  2.996e+09 =C2=B1 8%     +26.6%  3.793e+09 =C2=B113%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>  2.996e+09 =C2=B1 8%     +26.6%  3.793e+09 =C2=B113%  TOTAL cpuidle.C1-IV=
T-4S.time
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   91301268 =C2=B1 0%     -17.3%   75541000 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   91301268 =C2=B1 0%     -17.3%   75541000 =C2=B1 1%  TOTAL proc-vmstat.n=
r_inactive_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   22647815 =C2=B1 0%     -17.8%   18621395 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   22647815 =C2=B1 0%     -17.8%   18621395 =C2=B1 1%  TOTAL numa-vmstat.n=
ode3.nr_inactive_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   22543084 =C2=B1 0%     -17.3%   18632119 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   22543084 =C2=B1 0%     -17.3%   18632119 =C2=B1 1%  TOTAL numa-vmstat.n=
ode0.nr_inactive_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>  3.658e+08 =C2=B1 0%     -17.1%  3.032e+08 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>  3.658e+08 =C2=B1 0%     -17.1%  3.032e+08 =C2=B1 1%  TOTAL meminfo.Inact=
ive(file)
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   3.66e+08 =C2=B1 0%     -17.1%  3.034e+08 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   3.66e+08 =C2=B1 0%     -17.1%  3.034e+08 =C2=B1 1%  TOTAL meminfo.Inact=
ive
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   90508060 =C2=B1 1%     -16.6%   75454377 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   90508060 =C2=B1 1%     -16.6%   75454377 =C2=B1 1%  TOTAL numa-meminfo.=
node1.Inactive
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   90251228 =C2=B1 1%     -16.6%   75248835 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   90251228 =C2=B1 1%     -16.6%   75248835 =C2=B1 1%  TOTAL numa-meminfo.=
node1.Inactive(file)
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   22484654 =C2=B1 1%     -16.3%   18819835 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   22484654 =C2=B1 1%     -16.3%   18819835 =C2=B1 1%  TOTAL numa-vmstat.n=
ode1.nr_inactive_file
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      24602 =C2=B1 3%     +13.9%      28010 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      24602 =C2=B1 3%     +13.9%      28010 =C2=B1 2%  TOTAL slabinfo.kmal=
loc-256.active_objs
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   27691741 =C2=B1 2%     +13.9%   31533464 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   27691741 =C2=B1 2%     +13.9%   31533464 =C2=B1 1%  TOTAL numa-meminfo.=
node0.MemFree
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   16995799 =C2=B1 1%     +10.0%   18694828 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   16995799 =C2=B1 1%     +10.0%   18694828 =C2=B1 5%  TOTAL numa-numastat=
.node2.other_node
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   16986817 =C2=B1 1%      +9.9%   18672006 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   16986817 =C2=B1 1%      +9.9%   18672006 =C2=B1 5%  TOTAL numa-numastat=
.node2.numa_miss
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   12004947 =C2=B1 1%     +11.7%   13410696 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   12004947 =C2=B1 1%     +11.7%   13410696 =C2=B1 4%  TOTAL numa-vmstat.n=
ode2.numa_other
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   11914310 =C2=B1 1%     +11.7%   13310255 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   11914310 =C2=B1 1%     +11.7%   13310255 =C2=B1 4%  TOTAL numa-vmstat.n=
ode2.numa_miss
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      28036 =C2=B1 1%     +13.7%      31864 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      28036 =C2=B1 1%     +13.7%      31864 =C2=B1 1%  TOTAL uptime.idle
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    2265511 =C2=B1 1%     -11.0%    2017175 =C2=B1 3%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    2265511 =C2=B1 1%     -11.0%    2017175 =C2=B1 3%  TOTAL softirqs.RCU
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   27060069 =C2=B1 2%     +15.3%   31202315 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   27060069 =C2=B1 2%     +15.3%   31202315 =C2=B1 2%  TOTAL numa-meminfo.=
node2.MemFree
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      25443 =C2=B1 3%     +12.3%      28569 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      25443 =C2=B1 3%     +12.3%      28569 =C2=B1 2%  TOTAL slabinfo.kmal=
loc-256.num_objs
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   27523088 =C2=B1 1%     +13.7%   31287449 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   27523088 =C2=B1 1%     +13.7%   31287449 =C2=B1 2%  TOTAL numa-meminfo.=
node3.MemFree
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       2.59 =C2=B119%     -22.6%       2.01 =C2=B1 9%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       2.59 =C2=B119%     -22.6%       2.01 =C2=B1 9%  TOTAL perf-profile.=
cpu-cycles.read_hpet.ktime_get_update_offsets.hrtimer_interrupt.local_apic_=
timer_interrupt.smp_apic_timer_interrupt
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    6851919 =C2=B1 1%     +13.7%    7793404 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    6851919 =C2=B1 1%     +13.7%    7793404 =C2=B1 2%  TOTAL numa-vmstat.n=
ode2.nr_free_pages
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    7009134 =C2=B1 2%     +12.4%    7875367 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    7009134 =C2=B1 2%     +12.4%    7875367 =C2=B1 1%  TOTAL numa-vmstat.n=
ode0.nr_free_pages
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    6968105 =C2=B1 1%     +12.2%    7815447 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    6968105 =C2=B1 1%     +12.2%    7815447 =C2=B1 2%  TOTAL numa-vmstat.n=
ode3.nr_free_pages
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>   26969070 =C2=B1 0%     +11.4%   30046664 =C2=B1 0%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>   26969070 =C2=B1 0%     +11.4%   30046664 =C2=B1 0%  TOTAL proc-vmstat.n=
r_free_pages
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    1331143 =C2=B1 2%      -8.7%    1215441 =C2=B1 2%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    1331143 =C2=B1 2%      -8.7%    1215441 =C2=B1 2%  TOTAL numa-meminfo.=
node0.PageTables
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>  1.074e+08 =C2=B1 0%     +10.7%  1.188e+08 =C2=B1 0%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>  1.074e+08 =C2=B1 0%     +10.7%  1.188e+08 =C2=B1 0%  TOTAL meminfo.MemFr=
ee
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     507608 =C2=B1 0%    +317.1%    2117191 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     507608 =C2=B1 0%    +317.1%    2117191 =C2=B1 4%  TOTAL time.involunt=
ary_context_switches
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>    5533240 =C2=B1 2%    +222.4%   17841246 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>    5533240 =C2=B1 2%    +222.4%   17841246 =C2=B1 5%  TOTAL time.voluntar=
y_context_switches
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      28314 =C2=B1 1%    +205.1%      86397 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      28314 =C2=B1 1%    +205.1%      86397 =C2=B1 5%  TOTAL vmstat.system=
.cs
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>        135 =C2=B1 5%    +117.6%        294 =C2=B1 5%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>        135 =C2=B1 5%    +117.6%        294 =C2=B1 5%  TOTAL time.user_time
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>  4.014e+08 =C2=B1 1%     +83.6%  7.372e+08 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>  4.014e+08 =C2=B1 1%     +83.6%  7.372e+08 =C2=B1 4%  TOTAL time.major_pa=
ge_faults
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     616528 =C2=B1 1%     +77.7%    1095282 =C2=B1 4%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     616528 =C2=B1 1%     +77.7%    1095282 =C2=B1 4%  TOTAL vmstat.system=
.in
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>     237106 =C2=B1 0%     +32.5%     314186 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>     237106 =C2=B1 0%     +32.5%     314186 =C2=B1 1%  TOTAL time.minor_pa=
ge_faults
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      76.91 =C2=B1 0%     +10.3%      84.82 =C2=B1 1%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      76.91 =C2=B1 0%     +10.3%      84.82 =C2=B1 1%  TOTAL turbostat.RAM=
_W
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      59.02 =C2=B1 0%      -4.3%      56.47 =C2=B1 0%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      59.02 =C2=B1 0%      -4.3%      56.47 =C2=B1 0%  TOTAL turbostat.%c0
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>       6578 =C2=B1 0%      -3.7%       6333 =C2=B1 0%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>       6578 =C2=B1 0%      -3.7%       6333 =C2=B1 0%  TOTAL time.percent_=
of_cpu_this_job_got
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>        458 =C2=B1 0%      +3.4%        473 =C2=B1 0%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>        458 =C2=B1 0%      +3.4%        473 =C2=B1 0%  TOTAL time.elapsed_=
time
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>        387 =C2=B1 0%      +1.5%        393 =C2=B1 0%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>        387 =C2=B1 0%      +1.5%        393 =C2=B1 0%  TOTAL turbostat.Pkg=
_W
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>        316 =C2=B1 0%      +1.4%        321 =C2=B1 0%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>        316 =C2=B1 0%      +1.4%        321 =C2=B1 0%  TOTAL turbostat.Cor=
_W
> =

> 28f2cd4f6da24a1  d23da150a37c9fe3cc83dbaf7  =

> ---------------  -------------------------  =

>      29997 =C2=B1 0%      -1.0%      29708 =C2=B1 0%  brickland3/vm-scala=
bility/300s-lru-file-mmap-read-rand
>      29997 =C2=B1 0%      -1.0%      29708 =C2=B1 0%  TOTAL time.system_t=
ime
> =

> =

> =

> =

>                                time.major_page_faults
> =

>   1e+09 ++---------------------------------------------------------------=
---+
>         |             O OOO OO OO OOO OO OOO OO OO  OO O  OOO OO OO OO   =
   |
>   9e+08 ++                                         O    O                =
   |
>         |O O  O  OO                                                      =
   |
>   8e+08 O+  O  O   O O                                                   =
   |
>         |                                                                =
O OO
>   7e+08 ++                                                            O O=
   |
>         |                                                                =
   |
>   6e+08 ++                                                               =
   |
>         |                                                                =
   |
>   5e+08 ++                                                               =
   |
>         |          *.*                                                   =
   |
>   4e+08 **.**.**.**   *.***.**.**.***.**.*                               =
   |
>         |                                                                =
   |
>   3e+08 ++---------------------------------------------------------------=
---+
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> Thanks,
> Fengguang
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com


--===============4473304768088777478==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMSAoR05V
L0xpbnV4KQoKaVFJY0JBQUJBZ0FHQlFKVDdpdmxBQW9KRUtKbnRZcWkxcmhKUzhRUC9qYk91WGJn
Yno0aThFNUoremJubHZrWQpUeGEyWGw3L0Z4c1NqdGJzSzUvMFQvbXBWVmZJMGZuSnpkcDdKNXpJ
cTQzS2l4cUQyZWtkdU9BK2RSbS9KMjFsCmRVNW1JaWlwbkpyOUR0UG4wUFpVVFJueXpQc2NVVGZi
Nnh4R1k1K25vczNNcFZscVlxaDBrSUNUcDVFb0liSmUKaUtEQllPMG9BRCtPbTNZbHlHcFh6aW9n
d3BldzRkMkZFQXM3T3d4YXMxcjA5M1VQUjVBbTk3N0ZYZHZVU2lyRgpGc1lFc3pwRTExRkZVU3Zr
K2x6cEZoNHVuTGZHQ3NiTm8rbXJoMjdwbDRLTldBK0N1NW5sVFdROU04MEpBdlY1CkMzbHBPdEVK
Q0RsWkk4QWkvalhQTUxpSk9xTmlvTGY3Q2dkWWJWOU9MMldsdmdEd1hYdHRxa05Zb3dJR1p3RUUK
aVUwd0lGd0QzVVc3eG1ZNjltcFVMZGRMVWxvSHEvVDNsdXBEdGJuTllabnAvOVU0bXA4NU4zTWtU
d2t2RXIzYQpWdDRqRFJmbk8xYXg0aWVRTUNCREZjSnh1blo0M0NiZjFweGcrb2dFVVBnUWZwSDJi
YXJwQnpZVFlLaFRmTzFFCnh2NURVWHBOMkcwVmE3Q1N3aTkvZjBwenB6bWM1ZjVrZ05nUmwxcDdn
Ukxmd3dpTlJmSmlHKy82ZkFJaEhYRXoKTjJycExSMS82L3RpWktCMFYrYUw4aGlJSlpvWmpkT1NU
R2VuMndwSU5zRFRzNWJxaVFhWG55L2tFeHBpUjhLQgpZQ1BRakI0L3d4cUVYdDVaYTNKTEx3NUFq
OGxmVVpaY1VJQlcyWCs4T0JZbHlzL2Vkd1ltMkYzaU0vWmgxb0FuClNndHBjclVPUW9wdmUzS0da
RlhMCj1rUG4yCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============4473304768088777478==--

