Content-Type: multipart/mixed; boundary="===============2903892842967010320=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 09bc0443e9: will-it-scale.per_thread_ops -7.2% regression
Date: Tue, 11 May 2021 09:34:32 +0800
Message-ID: <116621a5-7af0-4dee-72f9-77b19ab968df@linux.intel.com>
In-Reply-To: <YJcazvhz2E5256m5@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2903892842967010320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

On 5/9/2021 7:12 AM, Andrea Arcangeli wrote:
> On Sat, May 08, 2021 at 10:58:34AM +0800, Xing Zhengjun wrote:
>> Hi Andrea,
>>
>>   =C2=A0=C2=A0=C2=A0 I re-test it more than 10 times, the regression sti=
ll exists.
> =

> Probably I didn't measure it because for me they may have always
> landed in the same cacheline even before the patch was applied.
> =

> Ouch btw looking at flush_tlb_pending I also noticed I forgot to revert
> 6ce64428d62026a10cb5d80138ff2f90cc21d367, that has to be added to the
> pile of SMP unscalable upstream code to be reverted on my tree to
> improve performance even more to the wp fault with uffd-wp.
> =

>>   =C2=A0=C2=A0=C2=A0 0d2285c62210(mm: gup: pack has_pinned in MMF_HAS_PI=
NNED) removed
>> "atomic_t has_pinned" from "struct mm_struct", it changed the "struct
>> mm_struct" cache line layout (please see in the attached pahole dumped
>> results), in its parent commit, "spinlock_t page_table_lock" and "struct
>> rw_semaphore mmap_lock" in two different cache line, but in
>> 0d2285c62210, they may in the same cache line, "mm_struct" is widely
>> used, it may have potential contention issue, so I apply the following
>> patch change the layout, retest the regression is gone (very small, -0.9=
%).
> =

> Agreed, the accidental cacheline alignment change is the only thing
> that could explain a performance difference, except it didn't make a
> difference for me.
> =

> I applied this, this should fix your issue and it is going to work
> without depending on .config options (see all fields before mmap_lock,
> they vary depending on config/arch).
> =

> I'm not really sure the problem is the page_table_lock even, it may be
> just false sharing on the fields at the top of the vma.
> =

> The best I recommend to try also in addition of the below is to move
> this line:
> =

> +		struct rw_semaphore mmap_lock ____cacheline_aligned_in_smp;
> =

> at the very end. so it gets 64 bytes alone and reduces all false
> sharing to zero. That cacheline is heavily heavily contended during
> the mmap test. so it may be worth wasting 64bytes per vma even...
> =

> The below wastes in average not more than 32 bytes.
> =

>>From 99a2452759bb5cfb2a77405d7db42968bf7e7509 Mon Sep 17 00:00:00 2001
> From: Andrea Arcangeli <aarcange@redhat.com>
> Date: Sat, 8 May 2021 18:54:34 -0400
> Subject: [PATCH 1/1] mm: cacheline alignment for page_table_lock and mmap=
_lock
> =

> It's important to keep the two fields in two different cachelines and
> this will enforce it.
> =

> The kernel test robot reported a per_thread_ops -7.2% regression for
> the will-it-scale mmap2 threaded testcase when the two fields
> accidentally landed in the same cacheline.
> =

> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
> ---
>   include/linux/mm_types.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 7fc7a3320ad9..714b4c3e2a7c 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -456,7 +456,7 @@ struct mm_struct {
>   		spinlock_t page_table_lock; /* Protects page tables and some
>   					     * counters
>   					     */
> -		struct rw_semaphore mmap_lock;
> +		struct rw_semaphore mmap_lock ____cacheline_aligned_in_smp;
>   =

>   		struct list_head mmlist; /* List of maybe swapped mm's.	These
>   					  * are globally strung together off
> =


I test the patch, the regression is gone and it gets +2.1% improvement.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/nr_task/mode/test/cpufreq_gover=
nor/ucode/debug-setup:
 =

lkp-csl-2sp9/will-it-scale/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/=
gcc-9/100%/thread/mmap2/performance/0x5003006/test

commit:
   cf379a4e0005ff9a4e734901aab9eeafe28c4eb6
   0d2285c622103f0314ced7485c3b5b43f870c2d3
   4e1291d70e101e7e1064ca814288a003171d75c7  (test patch)

cf379a4e0005ff9a 0d2285c622103f0314ced7485c3 4e1291d70e101e7e1064ca81428
---------------- --------------------------- ---------------------------
          %stddev     %change         %stddev     %change         %stddev
              \          |                \          |                \
     204106 =C2=B1  2%      -5.6%     192733            +2.1%     208489 =

    will-it-scale.88.threads
       3.13 =C2=B1  2%     +25.1%       3.91 =C2=B1  2%      -1.3%       3.=
08 =C2=B1 =

3%  will-it-scale.88.threads_idle
       2319 =C2=B1  2%      -5.6%       2189            +2.1%       2368 =

    will-it-scale.per_thread_ops
     204106 =C2=B1  2%      -5.6%     192733            +2.1%     208489 =

    will-it-scale.workload



-- =

Zhengjun Xing
--===============2903892842967010320==--

