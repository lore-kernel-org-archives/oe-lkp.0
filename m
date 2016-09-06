Content-Type: multipart/mixed; boundary="===============7186292301198776649=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 06 Sep 2016 08:52:41 -0700
Message-ID: <871t0xc9fa.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <20160906153755.GD8119@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7186292301198776649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mel Gorman <mgorman@techsingularity.net> writes:

> On Fri, Sep 02, 2016 at 09:32:58AM +1000, Dave Chinner wrote:
>> On Fri, Aug 19, 2016 at 04:08:34PM +0100, Mel Gorman wrote:
>> > On Thu, Aug 18, 2016 at 05:11:11PM +1000, Dave Chinner wrote:
>> > > On Thu, Aug 18, 2016 at 01:45:17AM +0100, Mel Gorman wrote:
>> > > > On Wed, Aug 17, 2016 at 04:49:07PM +0100, Mel Gorman wrote:
>> > > > > > Yes, we could try to batch the locking like DaveC already sugg=
ested
>> > > > > > (ie we could move the locking to the caller, and then make
>> > > > > > shrink_page_list() just try to keep the lock held for a few pa=
ges if
>> > > > > > the mapping doesn't change), and that might result in fewer cr=
azy
>> > > > > > cacheline ping-pongs overall. But that feels like exactly the =
wrong
>> > > > > > kind of workaround.
>> > > > > > =

>> > > > > =

>> > > > > Even if such batching was implemented, it would be very specific=
 to the
>> > > > > case of a single large file filling LRUs on multiple nodes.
>> > > > > =

>> > > > =

>> > > > The latest Jason Bourne movie was sufficiently bad that I spent ti=
me
>> > > > thinking how the tree_lock could be batched during reclaim. It's n=
ot
>> > > > straight-forward but this prototype did not blow up on UMA and may=
 be
>> > > > worth considering if Dave can test either approach has a positive =
impact.
>> > > =

>> > > SO, I just did a couple of tests. I'll call the two patches "sleepy"
>> > > for the contention backoff patch and "bourney" for the Jason Bourne
>> > > inspired batching patch. This is an average of 3 runs, overwriting
>> > > a 47GB file on a machine with 16GB RAM:
>> > > =

>> > > 		IO throughput	wall time __pv_queued_spin_lock_slowpath
>> > > vanilla		470MB/s		1m42s		25-30%
>> > > sleepy		295MB/s		2m43s		<1%
>> > > bourney		425MB/s		1m53s		25-30%
>> > > =

>> > =

>> > This is another blunt-force patch that
>> =

>> Sorry for taking so long to get back to this - had a bunch of other
>> stuff to do (e.g. XFS metadata CRCs have found their first compiler
>> bug) and haven't had to time test this.
>> =

>
> No problem. Thanks for getting back to me.
>
>> The blunt force approach seems to work ok:
>> =

>
> Ok, good to know. Unfortunately I found that it's not a universal win. For
> the swapping-to-fast-storage case (simulated with ramdisk), the batching =
is
> a bigger gain *except* in the single threaded case. Stalling kswap in the
> "blunt force approach" severely regressed a streaming anonymous reader
> for all thread counts so it's not the right answer.
>
> I'm working on a series during spare time that tries to balance all the
> issues for either swapcache and filecache on different workloads but right
> now, the complexity is high and it's still "win some, lose some".
>
> As an aside for the LKP people using ramdisk for swap -- ramdisk considers
> itself to be rotational storage. It takes the paths that are optimised to
> minimise seeks but it's quite slow. When tree_lock contention is reduced,
> workload is dominated by scan_swap_map. It's a one-line fix and I have
> a patch for it but it only really matters if ramdisk is being used as a
> simulator for swapping to fast storage.

We (LKP people) use drivers/nvdimm/pmem.c instead of drivers/block/brd.c
as ramdisk.  Which considers itself to be non-rotational storage.

And we have a series to optimize other locks in the swap path too, for
example batching the swap space allocating and freeing, etc.  If your
solution to optimize batching removing pages from the swap cache can be
merged, that will help us much!

Best Regards,
Huang, Ying

--===============7186292301198776649==--

