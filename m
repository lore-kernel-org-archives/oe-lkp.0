Content-Type: multipart/mixed; boundary="===============0085049454127921034=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] 43993977ba: +88% OOM possibility
Date: Mon, 02 Nov 2015 16:55:15 +0800
Message-ID: <87twp4232k.fsf@yhuang-dev.intel.com>
In-Reply-To: <20151102074542.GC630@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0085049454127921034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Michal Hocko <mhocko@kernel.org> writes:

> On Mon 02-11-15 07:20:37, Huang, Ying wrote:
>> Michal Hocko <mhocko@kernel.org> writes:
>> =

>> > On Fri 30-10-15 16:21:40, Huang, Ying wrote:
>> >> Michal Hocko <mhocko@kernel.org> writes:
>> >> =

>> >> > On Wed 28-10-15 13:36:02, kernel test robot wrote:
>> >> >> FYI, we noticed the below changes on
>> >> >> =

>> >> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t master
>> >> >> commit 43993977baecd838d66ccabc7f682342fc6ff635 ("mm, page_alloc:
>> >> >> distinguish between being unable to sleep, unwilling to sleep and
>> >> >> avoiding waking kswapd")
>> >> >> =

>> >> >> We found the OOM possibility increased 88% in a virtual machine wi=
th 1G memory.
>> >> >
>> >> > Could you provide dmesg output from this test?
>> >> =

>> >> Sure, Attached.
>> >
>> > I can only see a single allocation failure warning:
>> > kworker/u4:1: page allocation failure: order:0, mode:0x2204000
>> >
>> > This is obviously a non sleeping allocation with ___GFP_KSWAPD_RECLAIM
>> > set. ___GFP_HIGH (aka access to memory reserves) is not required so a
>> > failure of such an allocation is something to be expected.
>> >
>> > [ 2294.616369] Workqueue: btrfs-submit btrfs_submit_helper
>> > [ 2294.616369]  0000000000000000 ffff88000d38f5e0 ffffffff8173f84c 000=
0000000000000
>> > [ 2294.616369]  ffff88000d38f678 ffffffff811abaee 00000000ffffffff 000=
000010038f618
>> > [ 2294.616369]  ffff8800584e4148 00000000ffffffff ffff8800584e2f00 000=
0000000000001
>> > [ 2294.616369] Call Trace:
>> > [ 2294.616369]  [<ffffffff8173f84c>] dump_stack+0x4b/0x63
>> > [ 2294.616369]  [<ffffffff811abaee>] warn_alloc_failed+0x125/0x13d
>> > [ 2294.616369]  [<ffffffff811aecce>] __alloc_pages_nodemask+0x7c9/0x915
>> > [ 2294.616369]  [<ffffffff811ecc7b>] kmem_getpages+0x91/0x155
>> > [ 2294.616369]  [<ffffffff811eef0d>] fallback_alloc+0x1cc/0x24c
>> > [ 2294.616369]  [<ffffffff811eed32>] ____cache_alloc_node+0x151/0x160
>> > [ 2294.616369]  [<ffffffff811ef1ed>] __kmalloc+0xb0/0x134
>> > [ 2294.616369]  [<ffffffff8105d7a5>] ? sched_clock+0x9/0xb
>> > [ 2294.616369]  [<ffffffff8187d929>] ? virtqueue_add+0x78/0x37f
>> > [ 2294.616369]  [<ffffffff8187d929>] virtqueue_add+0x78/0x37f
>> > [ 2294.616369]  [<ffffffff81114f72>] ? __lock_acquire+0x751/0xf55
>> > [ 2294.616369]  [<ffffffff8187dca6>] virtqueue_add_sgs+0x76/0x85
>> >
>> > The patch you are referring shouldn't make any change in this path
>> > because alloc_indirect which I expect is the allocation failing here
>> > does:
>> > gfp &=3D ~(__GFP_HIGHMEM | __GFP_HIGH)
>> >
>> > and that came in via b92b1b89a33c ("virtio: force vring descriptors to
>> > be allocated from lowmem").
>> >
>> > Are there more failed allocations during the test? The subject would
>> > suggest so.
>> =

>> We done 24 tests for the commit and 24 tests for its parent.  There is
>> no OOM in any test for the parent commit, but there are OOM in 21 tests
>> for this commit.  This is what I want to say in the subject.  Sorry for
>> confusing.
>
> It would be interesting to see all the page allocation failure warnings
> (if they are different). Maybe other callers have relied on GFP_ATOMIC
> and access to memory reserves. The above path is not this case though.

I take a look at all dmesgs, and found the backtrace for page allocation
failure is same for all.  Is it possible that this commit cause more
memory were allocated or kept in memory so that more OOM were triggered?

Best Regards,
Huang, Ying

--===============0085049454127921034==--

