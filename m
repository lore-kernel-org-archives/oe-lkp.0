Content-Type: multipart/mixed; boundary="===============5847650858553916475=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 02 Sep 2016 09:32:58 +1000
Message-ID: <20160901233258.GF30056@dastard>
In-Reply-To: <20160819150834.GP8119@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5847650858553916475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2016 at 04:08:34PM +0100, Mel Gorman wrote:
> On Thu, Aug 18, 2016 at 05:11:11PM +1000, Dave Chinner wrote:
> > On Thu, Aug 18, 2016 at 01:45:17AM +0100, Mel Gorman wrote:
> > > On Wed, Aug 17, 2016 at 04:49:07PM +0100, Mel Gorman wrote:
> > > > > Yes, we could try to batch the locking like DaveC already suggest=
ed
> > > > > (ie we could move the locking to the caller, and then make
> > > > > shrink_page_list() just try to keep the lock held for a few pages=
 if
> > > > > the mapping doesn't change), and that might result in fewer crazy
> > > > > cacheline ping-pongs overall. But that feels like exactly the wro=
ng
> > > > > kind of workaround.
> > > > > =

> > > > =

> > > > Even if such batching was implemented, it would be very specific to=
 the
> > > > case of a single large file filling LRUs on multiple nodes.
> > > > =

> > > =

> > > The latest Jason Bourne movie was sufficiently bad that I spent time
> > > thinking how the tree_lock could be batched during reclaim. It's not
> > > straight-forward but this prototype did not blow up on UMA and may be
> > > worth considering if Dave can test either approach has a positive imp=
act.
> > =

> > SO, I just did a couple of tests. I'll call the two patches "sleepy"
> > for the contention backoff patch and "bourney" for the Jason Bourne
> > inspired batching patch. This is an average of 3 runs, overwriting
> > a 47GB file on a machine with 16GB RAM:
> > =

> > 		IO throughput	wall time __pv_queued_spin_lock_slowpath
> > vanilla		470MB/s		1m42s		25-30%
> > sleepy		295MB/s		2m43s		<1%
> > bourney		425MB/s		1m53s		25-30%
> > =

> =

> This is another blunt-force patch that

Sorry for taking so long to get back to this - had a bunch of other
stuff to do (e.g. XFS metadata CRCs have found their first compiler
bug) and haven't had to time test this.

The blunt force approach seems to work ok:

		IO throughput	wall time __pv_queued_spin_lock_slowpath
vanilla		470MB/s		1m42s		25-30%
sleepy		295MB/s		2m43s		<1%
bourney		425MB/s		1m53s		25-30%
blunt		470MB/s		1m41s		~2%

Performance is pretty much the same as teh vanilla kernel - maybe
a little bit faster if we consider median rather than mean results.

A snapshot profile from 'perf top -U' looks like:

  11.31%  [kernel]  [k] copy_user_generic_string
   3.59%  [kernel]  [k] get_page_from_freelist
   3.22%  [kernel]  [k] __raw_callee_save___pv_queued_spin_unlock
   2.80%  [kernel]  [k] __block_commit_write.isra.29
   2.14%  [kernel]  [k] __pv_queued_spin_lock_slowpath
   1.99%  [kernel]  [k] _raw_spin_lock
   1.98%  [kernel]  [k] wake_all_kswapds
   1.92%  [kernel]  [k] _raw_spin_lock_irqsave
   1.90%  [kernel]  [k] node_dirty_ok
   1.69%  [kernel]  [k] __wake_up_bit
   1.57%  [kernel]  [k] ___might_sleep
   1.49%  [kernel]  [k] __might_sleep
   1.24%  [kernel]  [k] __radix_tree_lookup
   1.18%  [kernel]  [k] kmem_cache_alloc
   1.13%  [kernel]  [k] update_fast_ctr
   1.11%  [kernel]  [k] radix_tree_tag_set
   1.08%  [kernel]  [k] clear_page_dirty_for_io
   1.06%  [kernel]  [k] down_write
   1.06%  [kernel]  [k] up_write
   1.01%  [kernel]  [k] unlock_page
   0.99%  [kernel]  [k] xfs_log_commit_cil
   0.97%  [kernel]  [k] __inc_node_state
   0.95%  [kernel]  [k] __memset
   0.89%  [kernel]  [k] xfs_do_writepage
   0.89%  [kernel]  [k] __list_del_entry
   0.87%  [kernel]  [k] __vfs_write
   0.85%  [kernel]  [k] xfs_inode_item_format
   0.84%  [kernel]  [k] shrink_page_list
   0.82%  [kernel]  [k] kmem_cache_free
   0.79%  [kernel]  [k] radix_tree_tag_clear
   0.78%  [kernel]  [k] _raw_spin_lock_irq
   0.77%  [kernel]  [k] _raw_spin_unlock_irqrestore
   0.76%  [kernel]  [k] node_page_state
   0.72%  [kernel]  [k] xfs_count_page_state
   0.68%  [kernel]  [k] xfs_file_aio_write_checks
   0.65%  [kernel]  [k] wakeup_kswapd

There's still a lot of time in locking, but it's no longer obviously
being spent by spinning contention. We seem to be spending a lot of
time trying to wake kswapds now - the context switch rate of the
workload is only 400-500/s, so there aren't a lot of sleeps and
wakeups actually occurring....

Regardless, throughput and locking behvaiour seems to be a lot
better than the other patches...

Cheers,

Dave.
-- =

Dave Chinner
david@fromorbit.com

--===============5847650858553916475==--

