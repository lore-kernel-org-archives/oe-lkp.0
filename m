Content-Type: multipart/mixed; boundary="===============1898878193283089389=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] d0164adc89: -100.0% fsmark.app_overhead
Date: Wed, 02 Dec 2015 13:00:46 +0100
Message-ID: <20151202120046.GE25284@dhcp22.suse.cz>
In-Reply-To: <20151202110009.GA2015@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1898878193283089389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 02-12-15 11:00:09, Mel Gorman wrote:
> On Mon, Nov 30, 2015 at 10:14:24AM +0800, Huang, Ying wrote:
> > > There is no reference to OOM possibility in the email that I can see.=
 Can
> > > you give examples of the OOM messages that shows the problem sites? I=
t was
> > > suspected that there may be some callers that were accidentally depen=
ding
> > > on access to emergency reserves. If so, either they need to be fixed =
(if
> > > the case is extremely rare) or a small reserve will have to be created
> > > for callers that are not high priority but still cannot reclaim.
> > >
> > > Note that I'm travelling a lot over the next two weeks so I'll be slo=
w to
> > > respond but I will get to it.
> > =

> > Here is the kernel log,  the full dmesg is attached too.  The OOM
> > occurs during fsmark testing.
> > =

> > Best Regards,
> > Huang, Ying
> > =

> > [   31.453514] kworker/u4:0: page allocation failure: order:0, mode:0x2=
200000
> > [   31.463570] CPU: 0 PID: 6 Comm: kworker/u4:0 Not tainted 4.3.0-08056=
-gd0164ad #1
> > [   31.466115] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS Debian-1.8.2-1 04/01/2014
> > [   31.477146] Workqueue: writeback wb_workfn (flush-253:0)
> > [   31.481450]  0000000000000000 ffff880035ac75e8 ffffffff8140a142 0000=
000002200000
> > [   31.492582]  ffff880035ac7670 ffffffff8117117b ffff880037586b28 ffff=
880000000040
> > [   31.507631]  ffff88003523b270 0000000000000040 ffff880035abc800 ffff=
ffff00000000
> =

> This is an allocation failure and is not a triggering of the OOM killer so
> the severity is reduced but it still looks like a bug in the driver. Look=
ing
> at the history and the discussion, it appears to me that __GFP_HIGH was
> cleared from the allocation site by accident. I strongly suspect that Will
> Deacon thought __GFP_HIGH was related to highmem instead of being related
> to high priority.  Will, can you review the following patch please? Ying,
> can you test please?

I have posted basically the same patch
http://lkml.kernel.org/r/1448980369-27130-1-git-send-email-mhocko(a)kernel.=
org

I didn't mention this allocation failure because I am not sure it is
really related.

> ---8<---
> virtio: allow vring descriptor allocations to use high-priority reserves
> =

> Commit b92b1b89a33c ("virtio: force vring descriptors to be allocated
> from lowmem") prevented the inappropriate use of highmem pages but it
> also masked out __GFP_HIGH. __GFP_HIGH is used for GFP_ATOMIC allocation
> requests to grant access to a small emergency reserve. It's intended for
> user by callers that have no alternative.
> =

> Ying Huang reported the following page allocation failure warning after
> commit d0164adc89f6 ("mm, page_alloc: distinguish between being unable to
> sleep, unwilling to sleep and avoiding waking kswapd")
> =

>     kworker/u4:0: page allocation failure: order:0, mode:0x2200000
>     CPU: 0 PID: 6 Comm: kworker/u4:0 Not tainted 4.3.0-08056-gd0164ad #1
>     Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Debian-1.=
8.2-1 04/01/2014
>     Workqueue: writeback wb_workfn (flush-253:0)
>      0000000000000000 ffff880035ac75e8 ffffffff8140a142 0000000002200000
>      ffff880035ac7670 ffffffff8117117b ffff880037586b28 ffff880000000040
>      ffff88003523b270 0000000000000040 ffff880035abc800 ffffffff00000000
>     Call Trace:
>      [<ffffffff8140a142>] dump_stack+0x4b/0x69
>      [<ffffffff8117117b>] warn_alloc_failed+0xdb/0x140
>      [<ffffffff81174ec4>] __alloc_pages_nodemask+0x874/0xa60
>      [<ffffffff811bcb62>] alloc_pages_current+0x92/0x120
>      [<ffffffff811c73e4>] new_slab+0x3d4/0x480
>      [<ffffffff811c7c36>] __slab_alloc+0x376/0x470
>      [<ffffffff814e0ced>] ? alloc_indirect+0x1d/0x50
>      [<ffffffff81338221>] ? xfs_submit_ioend_bio+0x31/0x40
>      [<ffffffff814e0ced>] ? alloc_indirect+0x1d/0x50
>      [<ffffffff811c8e8d>] __kmalloc+0x20d/0x260
>      [<ffffffff814e0ced>] alloc_indirect+0x1d/0x50
>      [<ffffffff814e0fec>] virtqueue_add_sgs+0x2cc/0x3a0
>      [<ffffffff81573a30>] __virtblk_add_req+0xb0/0x1f0
>      [<ffffffff8117a121>] ? pagevec_lookup_tag+0x21/0x30
>      [<ffffffff813e5d72>] ? blk_rq_map_sg+0x1e2/0x4f0
>      [<ffffffff81573c82>] virtio_queue_rq+0x112/0x280
>      [<ffffffff813e9de7>] __blk_mq_run_hw_queue+0x1d7/0x370
>      [<ffffffff813e9bef>] blk_mq_run_hw_queue+0x9f/0xc0
>      [<ffffffff813eb10a>] blk_mq_insert_requests+0xfa/0x1a0
>      [<ffffffff813ebdb3>] blk_mq_flush_plug_list+0x123/0x140
>      [<ffffffff813e1777>] blk_flush_plug_list+0xa7/0x200
>      [<ffffffff813e1c49>] blk_finish_plug+0x29/0x40
>      [<ffffffff81215f85>] wb_writeback+0x185/0x2c0
>      [<ffffffff812166a5>] wb_workfn+0xf5/0x390
>      [<ffffffff81091297>] process_one_work+0x157/0x420
>      [<ffffffff81091ef9>] worker_thread+0x69/0x4a0
>      [<ffffffff81091e90>] ? rescuer_thread+0x380/0x380
>      [<ffffffff8109746f>] kthread+0xef/0x110
>      [<ffffffff81097380>] ? kthread_park+0x60/0x60
>      [<ffffffff818bce8f>] ret_from_fork+0x3f/0x70
>      [<ffffffff81097380>] ? kthread_park+0x60/0x60
> =

> Commit d0164adc89f6 ("mm, page_alloc: distinguish between being unable to
> sleep, unwilling to sleep and avoiding waking kswapd") is stricter about
> reserves. It distinguishes between callers that are high-priority with
> access to emergency reserves and callers that simply do not want to sleep
> and have recovery options. The reported allocation failure is truly atomic
> with no recovery options that appears to have cleared __GFP_HIGH by mista=
ke
> for reasons that are unrelated to highmem. This patch restores the flag.
> =

> Signed-off-by: Mel Gorman <mgorman@techsingularity.net>
> ---
>  drivers/virtio/virtio_ring.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 096b857e7b75..f9e119e6df18 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -107,9 +107,10 @@ static struct vring_desc *alloc_indirect(struct virt=
queue *_vq,
>  	/*
>  	 * We require lowmem mappings for the descriptors because
>  	 * otherwise virt_to_phys will give us bogus addresses in the
> -	 * virtqueue.
> +	 * virtqueue. Access to high-priority reserves is preserved
> +	 * if originally requested by GFP_ATOMIC.
>  	 */
> -	gfp &=3D ~(__GFP_HIGHMEM | __GFP_HIGH);
> +	gfp &=3D ~__GFP_HIGHMEM;
>  =

>  	desc =3D kmalloc(total_sg * sizeof(struct vring_desc), gfp);
>  	if (!desc)

-- =

Michal Hocko
SUSE Labs

--===============1898878193283089389==--

