Content-Type: multipart/mixed; boundary="===============4174903002607351109=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [page cache] eb797a8ee0: vm-scalability.throughput -16.5% regression
Date: Tue, 26 Feb 2019 16:17:18 +0800
Message-ID: <875zt7t14h.fsf@yhuang-dev.intel.com>
In-Reply-To: <20181114141713.GA25731@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4174903002607351109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Matthew Wilcox <willy@infradead.org> writes:

> On Wed, Nov 14, 2018 at 05:22:42PM +0800, kernel test robot wrote:
>> FYI, we noticed a -16.5% regression of vm-scalability.throughput due to =
commit:
>> commit: eb797a8ee0ab4cd03df556980ce7bf167cadaa50 ("page cache: Rearrange=
 address_space")
>> =

>> in testcase: vm-scalability
>> on test machine: 80 threads Skylake with 64G memory
>> with following parameters:
>> =

>> 	runtime: 300s
>> 	test: small-allocs
>> 	cpufreq_governor: performance
>
> Thanks for the report.  I am surprised by it, because I can't see what
> could have caused this.  On a 64-bit system (which your test is using),
> here's the effect of that patch:
>
> gfp_mask moves from being with private_lock up into a hole adjacent
> to i_mmap_writable.
> wb_err moves from the end of the array up to be with private_lock.
> address_space shrinks by 8 bytes.
>
> Hmm.  Might the shrinking be the problem?  Something in struct inode is
> now split across two cachelines, or is no longer in the same cacheline
> as something else?

It appears that the shrinking causes the regression.  To verify that, I
write a debug patch as follow.  And it recovers the regression.

"
modified   include/linux/fs.h
@@ -437,6 +437,7 @@ struct address_space {
 	spinlock_t		private_lock;
 	struct list_head	private_list;
 	void			*private_data;
+	int			pad0;
 } __attribute__((aligned(sizeof(long)))) __randomize_layout;
 	/*
 	 * On most architectures that alignment is already the case; but
"

Which recovers the size of struct address_space.  And the following
patch by itself recovers the size of struct inode, and it recovers the
regression too.

"
modified   include/linux/fs.h
@@ -704,6 +703,7 @@ struct inode {
 #endif
 =

 	void			*i_private; /* fs or device private pointer */
+	long			i_dbg_pad;
 } __randomize_layout;
 =

 static inline unsigned int i_blocksize(const struct inode *node)
"

That is, the regression is related with the size of struct inode.  Take
a look at how struct inode is allocated, I found it is allocated via
slab and without any alignment requirement.  After the first bad commit,
the sizeof(struct inode) is changed from 592 to 584, so the cache line
alignment of some inode are changed, which causes the regression.  To
further dig which causes the regression, I make the struct inode/struct
address_space allocation aligned with the cache line, add some pads to
struct address_space, and check the performance difference.  It is found
that if the last 8 or 16 bytes of address_space->i_mmap_rwsem are put in
a separate cache with other fields of address_space->i_mmap_rwsem, the
regression could be recovered.  The layout of struct rw_semphore is as
follow.

struct rw_semaphore {
	atomic_long_t              count;                /*     0     8 */
	struct list_head           wait_list;            /*     8    16 */
	raw_spinlock_t             wait_lock;            /*    24     4 */
	struct optimistic_spin_queue osq;                /*    28     4 */
	struct task_struct *       owner;                /*    32     8 */

	/* size: 40, cachelines: 1, members: 5 */
	/* last cacheline: 40 bytes */
};

This means, we need to put rw_semphore->owner at a different cache line
of other rw_semphore fields to recover the regression.

Back to the regression report.  Most of CPU time is spent for
rw_semphore spinning during the test,

     89.08            +0.7       89.79        perf-profile.self.cycles-pp.o=
sq_lock
      1.02            -0.1        0.89        perf-profile.self.cycles-pp.r=
wsem_spin_on_owner

So the cache line layout of struct rw_semphore could have big influence
for the test.  And during spinning, the lock holder will update
address_space->i_mmap and address_space->i_mmap_rwsem.count, while the
spinning CPU will keep reading address_space->i_mmap_rwsem.owner, this
will cause cache ping-pong, then cause the regression.  The parent
commit happens to have the right cache line layout, while the first bad
commit doesn't.

As for fixing.  Should we care about the cache line alignment of struct
inode?  Or its size is considered more important because there may be a
huge number of struct inode in the system?

Best Regards,
Huang, Ying

> I'm at Plumbers this week, so I don't have much time to investigate,
> but this regression is very important to me and I shall dig into this
> when I can.  It's OK to revert this commit in the meantime; nothing
> depends on it yet.
>
>> In addition to that, the commit also has significant impact on the follo=
wing tests:
>> =

>> | testcase: change | unixbench: unixbench.score 20.9% improvement       =
                  |
>
> Huh.  If we had to choose, would a 20.9% improvement in unixbench be more
> important than a 16.5% penalty to will-it-scale?

--===============4174903002607351109==--

