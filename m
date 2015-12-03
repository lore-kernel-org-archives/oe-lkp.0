Content-Type: multipart/mixed; boundary="===============5769864348396661971=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] d0164adc89: -100.0% fsmark.app_overhead
Date: Thu, 03 Dec 2015 16:46:53 +0800
Message-ID: <87k2ovyl4y.fsf@yhuang-dev.intel.com>
In-Reply-To: <20151202144525.GC2015@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5769864348396661971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mel Gorman <mgorman@techsingularity.net> writes:

> On Wed, Dec 02, 2015 at 03:15:29PM +0100, Michal Hocko wrote:
>> > > I didn't mention this allocation failure because I am not sure it is
>> > > really related.
>> > > =

>> > =

>> > I'm fairly sure it is. The failure is an allocation site that cannot
>> > sleep but did not specify __GFP_HIGH.
>> =

>> yeah but this was the case even before your patch. As the caller used
>> GFP_ATOMIC then it got __GFP_ATOMIC after your patch so it still
>> managed to do ALLOC_HARDER. I would agree if this was an explicit
>> GFP_NOWAIT. Unless I am missing something your patch hasn't changed the
>> behavior for this particular allocation.
>> =

>
> You're right. I think it's this hunk that is the problem.
>
> @@ -1186,7 +1186,7 @@ static struct request *blk_mq_map_request(struct
> request_queue *q,
>                 ctx =3D blk_mq_get_ctx(q);
>                 hctx =3D q->mq_ops->map_queue(q, ctx->cpu);
>                 blk_mq_set_alloc_data(&alloc_data, q,
> -                               __GFP_WAIT|GFP_ATOMIC, false, ctx, hctx);
> +                               __GFP_WAIT|__GFP_HIGH, false, ctx, hctx);
>                 rq =3D __blk_mq_alloc_request(&alloc_data, rw);
>                 ctx =3D alloc_data.ctx;
>                 hctx =3D alloc_data.hctx;
>
> This specific path at this patch is not waking kswapd any more when it
> should. A series of allocations there could hit the watermarks and never =
wake
> kswapd and then be followed by an atomic allocation failure that woke ksw=
apd.
>
> This bug gets fixed later by the commit 71baba4b92dc ("mm, page_alloc:
> rename __GFP_WAIT to __GFP_RECLAIM") so it's not a bug in the current
> kernel. However, it happens to break bisection and would be caught if each
> individual commit was tested.
>
> Your __GFP_HIGH patch is still fine although not the direct fix for this
> specific problem. Commit 71baba4b92dc is.
>
> Ying, does the page allocation failure messages happen when the whole
> series is applied? i.e. is 4.4-rc3 ok?

There are allocation errors for 4.4-rc3 too. dmesg is attached.

[   54.970840] kworker/u4:0: page allocation failure: order:0, mode:0x22040=
00
[   54.973161] CPU: 1 PID: 6 Comm: kworker/u4:0 Not tainted 4.4.0-rc3 #1
[   54.975179] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Debian-1.8.2-1 04/01/2014
[   54.980562] Workqueue: writeback wb_workfn (flush-253:0)
[   54.982289]  0000000000000000 ffff880035ac7098 ffffffff81410ad2 00000000=
02204000
[   54.985438]  ffff880035ac7120 ffffffff811724cb ffff880037586b50 00000000=
00000040
[   54.988746]  0000000000000000 0000000000000040 ffffffff00ac70e0 ffffffff=
00000000
[   54.991669] Call Trace:
[   54.992754]  [<ffffffff81410ad2>] dump_stack+0x4b/0x69
[   54.994433]  [<ffffffff811724cb>] warn_alloc_failed+0xdb/0x140
[   54.996134]  [<ffffffff811762b9>] __alloc_pages_nodemask+0x949/0xb40
[   54.997846]  [<ffffffff811be2c2>] alloc_pages_current+0x92/0x120
[   54.999494]  [<ffffffff811c8bfc>] new_slab+0x3dc/0x480
[   55.001007]  [<ffffffff811c9421>] ___slab_alloc+0x351/0x440
[   55.002588]  [<ffffffff814e7fcd>] ? alloc_indirect+0x1d/0x50
[   55.004268]  [<ffffffff8132270f>] ? xfs_btree_insrec+0x47f/0x700
[   55.005926]  [<ffffffff813206e9>] ? xfs_btree_delrec+0x5a9/0x1380
[   55.007592]  [<ffffffff814e7fcd>] ? alloc_indirect+0x1d/0x50
[   55.009281]  [<ffffffff811c9530>] __slab_alloc+0x20/0x40
[   55.010827]  [<ffffffff811ca03d>] __kmalloc+0x20d/0x260
[   55.012367]  [<ffffffff814e7fcd>] alloc_indirect+0x1d/0x50
[   55.014040]  [<ffffffff814e82cc>] virtqueue_add_sgs+0x2cc/0x3a0
[   55.015683]  [<ffffffff8157b240>] __virtblk_add_req+0xb0/0x1f0
[   55.017300]  [<ffffffff81307944>] ? xfs_alloc_update_counters+0x44/0x50
[   55.019759]  [<ffffffff813ec524>] ? blk_rq_map_sg+0x1f4/0x510
[   55.021371]  [<ffffffff8157b492>] virtio_queue_rq+0x112/0x280
[   55.022978]  [<ffffffff813f0647>] __blk_mq_run_hw_queue+0x1d7/0x370
[   55.024674]  [<ffffffff813f044f>] blk_mq_run_hw_queue+0x9f/0xc0
[   55.026307]  [<ffffffff813f196a>] blk_mq_insert_requests+0xfa/0x1a0
[   55.028003]  [<ffffffff813f26b3>] blk_mq_flush_plug_list+0x123/0x140
[   55.029710]  [<ffffffff813e7c77>] blk_flush_plug_list+0xa7/0x200
[   55.031363]  [<ffffffff813f1bec>] blk_sq_make_request+0x1dc/0x3b0
[   55.033025]  [<ffffffff813e5b0c>] ? generic_make_request_checks+0x24c/0x=
530
[   55.034829]  [<ffffffff813e6341>] generic_make_request+0xf1/0x1e0
[   55.036508]  [<ffffffff813e6497>] submit_bio+0x67/0x150
[   55.038034]  [<ffffffff8133cd61>] xfs_submit_ioend_bio+0x31/0x40
[   55.039797]  [<ffffffff8133ce51>] xfs_submit_ioend+0xe1/0x120
[   55.041410]  [<ffffffff8133e183>] xfs_vm_writepage+0x2a3/0x630
[   55.043038]  [<ffffffff811771a3>] __writepage+0x13/0x30
[   55.044568]  [<ffffffff811794bc>] write_cache_pages+0x22c/0x4c0
[   55.046214]  [<ffffffff81177190>] ? wb_position_ratio+0x1f0/0x1f0
[   55.047888]  [<ffffffff81179793>] generic_writepages+0x43/0x60
[   55.049520]  [<ffffffff8133d54e>] xfs_vm_writepages+0x4e/0x60
[   55.051130]  [<ffffffff8117a49e>] do_writepages+0x1e/0x30
[   55.052694]  [<ffffffff81216b05>] __writeback_single_inode+0x45/0x2e0
[   55.054410]  [<ffffffff812172e1>] writeback_sb_inodes+0x271/0x4d0
[   55.056075]  [<ffffffff812175c9>] __writeback_inodes_wb+0x89/0xc0
[   55.057749]  [<ffffffff812178ea>] wb_writeback+0x23a/0x2c0
[   55.059312]  [<ffffffff8121806f>] wb_workfn+0x20f/0x390
[   55.060846]  [<ffffffff81091257>] process_one_work+0x157/0x420
[   55.062466]  [<ffffffff81091eb9>] worker_thread+0x69/0x4a0
[   55.064030]  [<ffffffff81091e50>] ? rescuer_thread+0x380/0x380
[   55.065655]  [<ffffffff8109741f>] kthread+0xef/0x110
[   55.067141]  [<ffffffff81097330>] ? kthread_park+0x60/0x60
[   55.068713]  [<ffffffff818c5f8f>] ret_from_fork+0x3f/0x70
[   55.070255]  [<ffffffff81097330>] ? kthread_park+0x60/0x60
[   55.071830] Mem-Info:
[   55.072889] active_anon:5024 inactive_anon:1642 isolated_anon:0
[   55.072889]  active_file:22984 inactive_file:106547 isolated_file:25
[   55.072889]  unevictable:93684 dirty:7732 writeback:13026 unstable:0
[   55.072889]  slab_reclaimable:13082 slab_unreclaimable:3604
[   55.072889]  mapped:2866 shmem:1687 pagetables:876 bounce:0
[   55.072889]  free:1931 free_pcp:45 free_cma:0
[   55.081979] Node 0 DMA free:3948kB min:60kB low:72kB high:88kB active_an=
on:328kB inactive_anon:124kB active_file:1680kB inactive_file:1704kB unevic=
table:6936kB isolated(anon):0kB isolated(file):0kB present:15992kB managed:=
15908kB mlocked:0kB dirty:52kB writeback:76kB mapped:440kB shmem:124kB slab=
_reclaimable:472kB slab_unreclaimable:232kB kernel_stack:80kB pagetables:84=
kB unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB writebac=
k_tmp:0kB pages_scanned:0 all_unreclaimable? no
[   55.093512] lowmem_reserve[]: 0 972 972 972
[   55.095362] Node 0 DMA32 free:3776kB min:3824kB low:4780kB high:5736kB a=
ctive_anon:19768kB inactive_anon:6444kB active_file:90256kB inactive_file:4=
24484kB unevictable:367800kB isolated(anon):0kB isolated(file):100kB presen=
t:1032064kB managed:997492kB mlocked:0kB dirty:30876kB writeback:52028kB ma=
pped:11024kB shmem:6624kB slab_reclaimable:51856kB slab_unreclaimable:14184=
kB kernel_stack:2864kB pagetables:3420kB unstable:0kB bounce:0kB free_pcp:1=
80kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:100 all_unr=
eclaimable? no
[   55.107443] lowmem_reserve[]: 0 0 0 0
[   55.109213] Node 0 DMA: 4*4kB (U) 3*8kB (UE) 2*16kB (UM) 1*32kB (E) 0*64=
kB 2*128kB (UM) 2*256kB (UM) 2*512kB (ME) 2*1024kB (ME) 0*2048kB 0*4096kB =
=3D 3944kB
[   55.114800] Node 0 DMA32: 90*4kB (UE) 13*8kB (UE) 10*16kB (UME) 7*32kB (=
UME) 46*64kB (ME) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 37=
92kB
[   55.120027] Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=
=3D0 hugepages_size=3D2048kB
[   55.122668] 224906 total pagecache pages
[   55.123990] 0 pages in swap cache
[   55.125207] Swap cache stats: add 0, delete 0, find 0/0
[   55.126738] Free swap  =3D 0kB
[   55.127890] Total swap =3D 0kB
[   55.129039] 262014 pages RAM
[   55.130190] 0 pages HighMem/MovableOnly
[   55.131495] 8664 pages reserved
[   55.132690] 0 pages hwpoisoned
[   55.133868] SLUB: Unable to allocate memory on node -1 (gfp=3D0x2080000)
[   55.135607]   cache: kmalloc-2048, object size: 2048, buffer size: 2048,=
 default order: 3, min order: 0
[   55.138454]   node 0: slabs: 22, objs: 352, free: 0

Best Regards,
Huang, Ying

--===============5769864348396661971==
Content-Type: application/x-xz
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

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
--===============5769864348396661971==--

