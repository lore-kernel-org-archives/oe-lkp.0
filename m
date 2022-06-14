Content-Type: multipart/mixed; boundary="===============6069081836307071450=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Tue, 14 Jun 2022 10:09:30 +0800
Message-ID: <20220614020930.GA31620@shbuild999.sh.intel.com>
In-Reply-To: <CAHk-=wiyjnKiCZyou+fHYi7tNh1FC-BYy_kubusd+jrkDRsExA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6069081836307071450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, May 13, 2022 at 02:49:53AM +0800, Linus Torvalds wrote:
> On Thu, May 12, 2022 at 11:06 AM Andrew Morton
> <akpm@linux-foundation.org> wrote:
> >
> > On Thu, 12 May 2022 10:42:09 -0700 Linus Torvalds <torvalds@linux-fou=
ndation.org> wrote:
> > >
> > > In a perfect world, somebody would fix the locking to just not have as
> > > much contention. But assuming that isn't an option, maybe somebody
> > > should just look at that 'struct zone' layout a bit more.
> >
> > (hopefully adds linux-mm to cc)
> =

> So I suspect the people who do re-layout would have to be the intel
> people who actually see the regression.
> =

> Because the exact rules are quite complicated, and currently the
> comments about the layout don't really help much.

We've re-run some cases which could trigger zone lock contention: =

page_fault1 and page_fault2 case of 'will-it-scale'. From the test
results:

* The commit a368ab67aa55 ("mm: move zone lock to a different cache
  line than order-0 free page lists") is still valid, that if we
  revert it, there will be 9% ~ 26% regression for different 2/4
  sockets machines (page_fault1 case)

* With a368ab67aa55 reverted that zone lock sits in the same cache
  line as free_area[0], we tested with 1-thread case (no contention),
  which showed no performance diff. Maybe in this microbenchmark,
  one cacheline or two cache lines doesn't matter much.

* For the higher order 'free_area[]' in same cacheline as lock problem,
  it's a valid concern, but we haven't found case in 0Day to expose the
  cache bouncing. Network uses order-3 frequently, but it sits in the
  middle of the free_area[] array, and has no interference with 'lock'

  Another thing is the 'flag' and the 'lock' are still in the same
  cacheline, and perf-c2c does catch some false sharing between them.

  So adding a padding between 'flag' and 'lock' should help the 2 cases  =

  above (except the 'adjacent cacheline prefetch' concern)

  @@ -634,6 +634,7 @@ struct zone {
	/* free areas of different sizes */
	struct free_area	free_area[MAX_ORDER];
		=

	/* zone flags, see below */
	unsigned long		flags;
	 =

  +	ZONE_PADDING(_pad4_)
	/* Primarily protects free_area */
	spinlock_t		lock;

  But this patch only shows some small(<=3D%3) improvement or even some
  regressions. We also tried putting aligned 'lock' in the start/end
  of structure 'zone', and the performance data is similar .

* While checking this, we found that the lruvec structure also has a
  similar layout pattern with similar false sharing (confirmed by
  perf c2c data)

   struct lruvec {
	struct list_head		lists[NR_LRU_LISTS];
	/* per lruvec lru_lock for memcg */
	spinlock_t			lru_lock;
	...
   }

   Anyway this should be put into anothe thread :)

> For example, the "Read-mostly fields" comment doesn't necessarily mean
> that the fields in question should be kept away from the lock.
> =

> Even if they are mostly read-only, if they are only read *under* the
> lock (because the lock still is what serializes them), then putting
> them in the same cacheline as the lock certainly won't hurt.
 =

I Agree. And for structure zone, IIUC, these read-mostly fields at the
start of the structure are mostly read outside the lock's protection,
like the '_watermark', 'lowmem_reserve', so current layout seems to be
fine. =


> And the same is actually true of things that are actively written to:
> if they are written to under the lock, being in the same cacheline as
> the lock can be a *good* thing, since then you have only one dirty
> cacheline.
> =

> It only becomes a problem when (a) the lock is contended (so you get
> the bouncing from other lockers trying to get it) _and_ (b) the
> writing is fairly intense (so you get active bouncing back-and-forth,
> not just one or two bounces).
> =

> And so to actually do any real analysis, you probably have to have
> multiple sockets, because without numbers to guide you to exactly
> _which_ writes are problematic, you're bound to get the heuristic
> wrong.
> =

> And to make the issue even murkier, this whole thread is mixing up two
> different regressions that may not have all that much in common (ie
> the subject line is about one thing, but then we have that whole
> page_fault1 process mode results, and it's not clear that they have
> anything really to do with each other - just different examples of
> cache sensitivity).
 =

In above tests, we only focused on the cache false sharing of the fields
of struct zone, and may likely have missed some of your concerns. Please
let us know if we went in wrong direction or want us to run some specific
tests (we do have difficulties in finding more real-world like cases
which can trigger the zone lock contentions than will-it-scale)

Thanks,
Feng

>                    Linus
--===============6069081836307071450==--

