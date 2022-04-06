Content-Type: multipart/mixed; boundary="===============6175531646168808603=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [NUMA Balancing] e39bb6be9f: will-it-scale.per_thread_ops 64.4% improvement
Date: Wed, 06 Apr 2022 09:41:47 +0800
Message-ID: <20220406014147.GA64277@shbuild999.sh.intel.com>
In-Reply-To: <20220402085005.GC32311@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6175531646168808603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 02, 2022 at 04:50:05PM +0800, Feng Tang wrote:
> Hi Linus,
> =

> On Fri, Apr 01, 2022 at 09:35:24AM -0700, Linus Torvalds wrote:
> > On Fri, Apr 1, 2022 at 2:42 AM kernel test robot <oliver.sang@intel.c=
om> wrote:
> > >
> > > FYI, we noticed a 64.4% improvement of will-it-scale.per_thread_ops d=
ue to commit:
> > > e39bb6be9f2b ("NUMA Balancing: add page promotion counter")
> > =

> > That looks odd and unlikely.
> > =

> > That commit only modifies some page counting statistics. Sure, it
> > could be another cache layout thing, and maybe it's due to the subtle
> > change in how NUMA_PAGE_MIGRATE gets counted, but it still looks a bit
> > odd.
> =

> We did a quick check about cache stuff by disabling HW cache prefetch
> completely (writing 0xf to MSR 0x1a4), and the performance change
> is almost gone:
> =

>   ee97347fe058d020     e39bb6be9f2b39a6dbaeff48436 =

>   ----------------     --------------------------- =

>     134793            -1.4%     132867        will-it-scale.per_thread_ops
> =

> The test box is a Cascadelake machine with 4 nodes, and the similar trend
> is found on a 2 nodes machine, that the commit has 55% improvement with
> HW cache prefetch enabled, and has less than 1% change when disabled.
> =

> Though we still cannot pin-point the exact place affected.
 =

We did more tests and debugs, and here are some updates:

* For the HW cache prefetcher, we narrowed down it to be related with
  'L2 cache prefetcher', and not the 'L2 adjacent cache line prefetcher'.
  We can't find any documents about the detail of the prefetcher, which
  make it hard to analyze how the performance is affected

* Debug shows the change is related with the struct 'mem_cgroup''s size
  change, that with commit ee97347fe058d020, its size is 4096, which turns
  to 4160 with commit e39bb6be9f2b3.
  - commit e39bb6be9f2b adds one counter 'PGPROMOTE_SUCCESS' and some
    code change, if we remove the code change and leave the counter,
    the 60% improvement remains.
  - revert e39bb6be9f2b, and only add 16 bytes padding inside 'mem_cgroup',
    the 60% change also remains. Debug patch is as below:

	diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
	index a68dce3873fcc..2bd56fb2e5b5f 100644
	--- a/include/linux/memcontrol.h
	+++ b/include/linux/memcontrol.h
	@@ -303,6 +303,8 @@ struct mem_cgroup {
		/* memory.stat */
		struct memcg_vmstats	vmstats;
	 =

	+	unsigned long padding[2];
	+
		/* memory.events */
		atomic_long_t		memory_events[MEMCG_NR_MEMORY_EVENTS];

Thanks,
Feng

> Also per our experience, the patch changing vm statistics can easily
> trigger strange performance bumps for micro-benchmarks like will-it-scale,
> stress-ng etc.
> =

> Thanks,
> Feng
> =

> =

> >                Linus
--===============6175531646168808603==--

