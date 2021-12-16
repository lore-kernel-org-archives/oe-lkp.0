Content-Type: multipart/mixed; boundary="===============1954435923270102687=="
MIME-Version: 1.0
From: Muchun Song <songmuchun@bytedance.com>
To: lkp@lists.01.org
Subject: Re: [External] [mm] 86cda95957: BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
Date: Thu, 16 Dec 2021 22:56:36 +0800
Message-ID: <CAMZfGtVgmudUJWtmA68h3fVD3ThHP_Rq70Dj7h7hGx74ZCUFcQ@mail.gmail.com>
In-Reply-To: <20211216130102.GE10708@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1954435923270102687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 9:01 PM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 86cda9595796e709c444b93df1f27a2343c5fa06 ("[PATCH v4 11/17] mm: l=
ist_lru: allocate list_lru_one only when needed")
> url: https://github.com/0day-ci/linux/commits/Muchun-Song/Optimize-list-l=
ru-memory-consumption/20211214-010208
> base: https://git.kernel.org/cgit/linux/kernel/git/jaegeuk/f2fs.git dev-t=
est
> patch link: https://lore.kernel.org/linux-fsdevel/20211213165342.74704-12=
-songmuchun(a)bytedance.com
>
> in testcase: xfstests
> version: xfstests-x86_64-972d710-1_20211215
> with following parameters:
>
>         disk: 4HDD
>         fs: xfs
>         test: xfs-reflink-25
>         ucode: 0x28
>
> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>
>
> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790 v3 @ 3.60G=
Hz with 6G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> erial console /d[   14.815233][  T356] BUG: sleeping function called from=
 invalid context at include/linux/sched/mm.h:230
> [   14.827152][  T356] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, =
pid: 356, name: useradd
> [   14.835607][  T356] preempt_count: 1, expected: 0
> [   14.840274][  T356] CPU: 4 PID: 356 Comm: useradd Not tainted 5.16.0-r=
c1-00032-g86cda9595796 #1
> ev/ttyS0
> [   14.848903][  T356] Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIO=
S A11 04/01/2015
> [   14.857606][  T356] Call Trace:
> [   14.860732][  T356]  <TASK>
> [ 14.863515][ T356] dump_stack_lvl (lib/dump_stack.c:107)
> [ 14.867859][ T356] __might_resched.cold (kernel/sched/core.c:9543 kernel=
/sched/core.c:9496)
> [ 14.872889][ T356] ? memcg_list_lru_alloc (include/linux/slab.h:598 mm/l=
ist_lru.c:354 mm/list_lru.c:586)
> [ 14.878083][ T356] __kmalloc (include/linux/sched/mm.h:230 mm/slab.h:509=
 mm/slub.c:3148 mm/slub.c:3242 mm/slub.c:4433)
> [ 14.882177][ T356] ? is_bpf_text_address (arch/x86/include/asm/preempt.h=
:85 include/linux/rcupdate.h:73 include/linux/rcupdate.h:720 kernel/bpf/cor=
e.c:717)
> [ 14.887129][ T356] memcg_list_lru_alloc (include/linux/slab.h:598 mm/lis=
t_lru.c:354 mm/list_lru.c:586)
> [ 14.892166][ T356] ? xas_alloc (lib/xarray.c:374)
> [ 14.896421][ T356] kmem_cache_alloc_lru (include/linux/cgroup.h:403 mm/s=
lab.h:295 mm/slab.h:514 mm/slub.c:3148 mm/slub.c:3242 mm/slub.c:3249 mm/slu=
b.c:3266)
> [ 14.901367][ T356] xas_alloc (lib/xarray.c:374)

Thanks for reporting this. It was caused when rebasing the code.
Will fix.
--===============1954435923270102687==--

