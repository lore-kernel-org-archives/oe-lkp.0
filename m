Content-Type: multipart/mixed; boundary="===============1763435374893793261=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 3484b2de949: -46.2% aim7.jobs-per-min
Date: Sat, 28 Feb 2015 15:30:04 +0800
Message-ID: <1425108604.10337.84.camel@linux.intel.com>
In-Reply-To: <20150228014642.GG3087@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1763435374893793261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 2015-02-28 at 01:46 +0000, Mel Gorman wrote:
> On Fri, Feb 27, 2015 at 03:21:36PM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > commit 3484b2de9499df23c4604a513b36f96326ae81ad ("mm: rearrange zone fi=
elds into read-only, page alloc, statistics and page reclaim lines")
> > =

> > The perf cpu-cycles for spinlock (zone->lock) increased a lot.  I suspe=
ct there are some cache ping-pong or false sharing.
> > =

> =

> Are you sure about this result? I ran similar tests here and found that
> there was a major regression introduced near there but it was commit
> 05b843012335 ("mm: memcontrol: use root_mem_cgroup res_counter") that
> cause the problem and it was later reverted.  On local tests on a 4-node
> machine, commit 3484b2de9499df23c4604a513b36f96326ae81ad was within 1%
> of the previous commit and well within the noise.

After applying the below debug patch, the performance regression
restored.  So I think we can root cause this regression to be cache line
alignment related issue?

If my understanding were correct, after the 3484b2de94, lock and low
address area free_area are in the same cache line, so that the cache
line of the lock and the low address area of free_area will be switched
between MESI "E" and "S" state because it is written in one CPU (page
allocating with free_area) and frequently read (spinning on lock) in
another CPU.

Best Regards,
Huang, Ying

---
 include/linux/mmzone.h |    2 ++
 1 file changed, 2 insertions(+)

--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -468,6 +468,8 @@ struct zone {
 	/* Write-intensive fields used from the page allocator */
 	spinlock_t		lock;
 =

+	ZONE_PADDING(_pad_xx_)
+
 	/* free areas of different sizes */
 	struct free_area	free_area[MAX_ORDER];
 =




--===============1763435374893793261==--

