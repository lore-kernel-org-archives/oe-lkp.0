Content-Type: multipart/mixed; boundary="===============2006479644612971775=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] d0164adc89: -100.0% fsmark.app_overhead
Date: Mon, 30 Nov 2015 10:14:24 +0800
Message-ID: <87h9k4kzcv.fsf@yhuang-dev.intel.com>
In-Reply-To: <20151127100647.GH14880@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2006479644612971775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mel Gorman <mgorman@techsingularity.net> writes:

> On Fri, Nov 27, 2015 at 09:14:52AM +0800, Huang, Ying wrote:
>> Hi, Mel,
>> =

>> Mel Gorman <mgorman@techsingularity.net> writes:
>> =

>> > On Thu, Nov 26, 2015 at 08:56:12AM +0800, kernel test robot wrote:
>> >> FYI, we noticed the below changes on
>> >> =

>> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ma=
ster
>> >> commit d0164adc89f6bb374d304ffcc375c6d2652fe67d ("mm, page_alloc:
>> >> distinguish between being unable to sleep, unwilling to sleep and
>> >> avoiding waking kswapd")
>> >> =

>> >> Note: the testing machine is a virtual machine with only 1G memory.
>> >> =

>> >
>> > I'm not actually seeing any problem here. Is this a positive report or
>> > am I missing something obvious?
>> =

>> Sorry the email subject is generated automatically and I forget to
>> change it to some meaningful stuff before sending out.  From the testing
>> result, we found the commit make the OOM possibility increased from 0%
>> to 100% on this machine with small memory.  I also added proc-vmstat
>> information data too to help diagnose it.
>> =

>
> There is no reference to OOM possibility in the email that I can see. Can
> you give examples of the OOM messages that shows the problem sites? It was
> suspected that there may be some callers that were accidentally depending
> on access to emergency reserves. If so, either they need to be fixed (if
> the case is extremely rare) or a small reserve will have to be created
> for callers that are not high priority but still cannot reclaim.
>
> Note that I'm travelling a lot over the next two weeks so I'll be slow to
> respond but I will get to it.

Here is the kernel log,  the full dmesg is attached too.  The OOM
occurs during fsmark testing.

Best Regards,
Huang, Ying

[   31.453514] kworker/u4:0: page allocation failure: order:0, mode:0x22000=
00
[   31.463570] CPU: 0 PID: 6 Comm: kworker/u4:0 Not tainted 4.3.0-08056-gd0=
164ad #1
[   31.466115] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Debian-1.8.2-1 04/01/2014
[   31.477146] Workqueue: writeback wb_workfn (flush-253:0)
[   31.481450]  0000000000000000 ffff880035ac75e8 ffffffff8140a142 00000000=
02200000
[   31.492582]  ffff880035ac7670 ffffffff8117117b ffff880037586b28 ffff8800=
00000040
[   31.507631]  ffff88003523b270 0000000000000040 ffff880035abc800 ffffffff=
00000000
[   31.510568] Call Trace:
[   31.511828]  [<ffffffff8140a142>] dump_stack+0x4b/0x69
[   31.513391]  [<ffffffff8117117b>] warn_alloc_failed+0xdb/0x140
[   31.523163]  [<ffffffff81174ec4>] __alloc_pages_nodemask+0x874/0xa60
[   31.524949]  [<ffffffff811bcb62>] alloc_pages_current+0x92/0x120
[   31.526659]  [<ffffffff811c73e4>] new_slab+0x3d4/0x480
[   31.536134]  [<ffffffff811c7c36>] __slab_alloc+0x376/0x470
[   31.537541]  [<ffffffff814e0ced>] ? alloc_indirect+0x1d/0x50
[   31.543268]  [<ffffffff81338221>] ? xfs_submit_ioend_bio+0x31/0x40
[   31.545104]  [<ffffffff814e0ced>] ? alloc_indirect+0x1d/0x50
[   31.546982]  [<ffffffff811c8e8d>] __kmalloc+0x20d/0x260
[   31.548334]  [<ffffffff814e0ced>] alloc_indirect+0x1d/0x50
[   31.549805]  [<ffffffff814e0fec>] virtqueue_add_sgs+0x2cc/0x3a0
[   31.555396]  [<ffffffff81573a30>] __virtblk_add_req+0xb0/0x1f0
[   31.556846]  [<ffffffff8117a121>] ? pagevec_lookup_tag+0x21/0x30
[   31.558318]  [<ffffffff813e5d72>] ? blk_rq_map_sg+0x1e2/0x4f0
[   31.563880]  [<ffffffff81573c82>] virtio_queue_rq+0x112/0x280
[   31.565307]  [<ffffffff813e9de7>] __blk_mq_run_hw_queue+0x1d7/0x370
[   31.571005]  [<ffffffff813e9bef>] blk_mq_run_hw_queue+0x9f/0xc0
[   31.572472]  [<ffffffff813eb10a>] blk_mq_insert_requests+0xfa/0x1a0
[   31.573982]  [<ffffffff813ebdb3>] blk_mq_flush_plug_list+0x123/0x140
[   31.583686]  [<ffffffff813e1777>] blk_flush_plug_list+0xa7/0x200
[   31.585138]  [<ffffffff813e1c49>] blk_finish_plug+0x29/0x40
[   31.586542]  [<ffffffff81215f85>] wb_writeback+0x185/0x2c0
[   31.592429]  [<ffffffff812166a5>] wb_workfn+0xf5/0x390
[   31.594037]  [<ffffffff81091297>] process_one_work+0x157/0x420
[   31.599804]  [<ffffffff81091ef9>] worker_thread+0x69/0x4a0
[   31.601484]  [<ffffffff81091e90>] ? rescuer_thread+0x380/0x380
[   31.611368]  [<ffffffff8109746f>] kthread+0xef/0x110
[   31.612953]  [<ffffffff81097380>] ? kthread_park+0x60/0x60
[   31.619418]  [<ffffffff818bce8f>] ret_from_fork+0x3f/0x70
[   31.621221]  [<ffffffff81097380>] ? kthread_park+0x60/0x60
[   31.635226] Mem-Info:
[   31.636569] active_anon:4942 inactive_anon:1643 isolated_anon:0
[   31.636569]  active_file:23196 inactive_file:110131 isolated_file:251
[   31.636569]  unevictable:92329 dirty:2865 writeback:1925 unstable:0
[   31.636569]  slab_reclaimable:10588 slab_unreclaimable:3390
[   31.636569]  mapped:2848 shmem:1687 pagetables:876 bounce:0
[   31.636569]  free:1932 free_pcp:218 free_cma:0
[   31.667096] Node 0 DMA free:3948kB min:60kB low:72kB high:88kB active_an=
on:264kB inactive_anon:128kB active_file:1544kB inactive_file:5296kB unevic=
table:3136kB isolated(anon):0kB isolated(file):236kB present:15992kB manage=
d:15908kB mlocked:0kB dirty:0kB writeback:0kB mapped:440kB shmem:128kB slab=
_reclaimable:588kB slab_unreclaimable:304kB kernel_stack:112kB pagetables:8=
0kB unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB writeba=
ck_tmp:0kB pages_scanned:3376 all_unreclaimable? no
[   31.708140] lowmem_reserve[]: 0 972 972 972
[   31.710104] Node 0 DMA32 free:3780kB min:3824kB low:4780kB high:5736kB a=
ctive_anon:19504kB inactive_anon:6444kB active_file:91240kB inactive_file:4=
35228kB unevictable:366180kB isolated(anon):0kB isolated(file):768kB presen=
t:1032064kB managed:997532kB mlocked:0kB dirty:11460kB writeback:7700kB map=
ped:10952kB shmem:6620kB slab_reclaimable:41764kB slab_unreclaimable:13256k=
B kernel_stack:2752kB pagetables:3424kB unstable:0kB bounce:0kB free_pcp:87=
2kB local_pcp:232kB free_cma:0kB writeback_tmp:0kB pages_scanned:140404 all=
_unreclaimable? no
[   31.743737] lowmem_reserve[]: 0 0 0 0
[   31.745320] Node 0 DMA: 7*4kB (UME) 2*8kB (UM) 2*16kB (ME) 1*32kB (E) 0*=
64kB 2*128kB (ME) 2*256kB (ME) 2*512kB (UM) 2*1024kB (ME) 0*2048kB 0*4096kB=
 =3D 3948kB
[   31.757513] Node 0 DMA32: 1*4kB (U) 0*8kB 4*16kB (UME) 3*32kB (UE) 3*64k=
B (UM) 1*128kB (U) 1*256kB (U) 0*512kB 3*1024kB (UME) 0*2048kB 0*4096kB =3D=
 3812kB
[   31.766470] Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=
=3D0 hugepages_size=3D2048kB
[   31.772953] 227608 total pagecache pages
[   31.774127] 0 pages in swap cache
[   31.775428] Swap cache stats: add 0, delete 0, find 0/0
[   31.776785] Free swap  =3D 0kB
[   31.777799] Total swap =3D 0kB
[   31.779569] 262014 pages RAM
[   31.780584] 0 pages HighMem/MovableOnly
[   31.781744] 8654 pages reserved
[   31.790944] 0 pages hwpoisoned
[   31.792008] SLUB: Unable to allocate memory on node -1 (gfp=3D0x2080000)
[   31.793537]   cache: kmalloc-128, object size: 128, buffer size: 128, de=
fault order: 0, min order: 0
[   31.796088]   node 0: slabs: 27, objs: 864, free: 0


--===============2006479644612971775==
Content-Type: application/x-xz
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

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
a2axxGf7AgAAAAAEWVo=
--===============2006479644612971775==--

