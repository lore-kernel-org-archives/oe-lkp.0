Content-Type: multipart/mixed; boundary="===============0064705713818769384=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/gup] 57efa1fe59: will-it-scale.per_thread_ops -9.2% regression
Date: Fri, 04 Jun 2021 15:04:11 +0800
Message-ID: <20210604070411.GA8221@shbuild999.sh.intel.com>
In-Reply-To: <CAHk-=whTEC_GVYu=WfvUagNvHdoTALEDg8uqK3V6aMDwg2KMRA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0064705713818769384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Sorry for the late response.

On Mon, May 24, 2021 at 05:11:37PM -1000, Linus Torvalds wrote:
> On Mon, May 24, 2021 at 5:00 PM kernel test robot <oliver.sang@intel.co=
m> wrote:
> >
> > FYI, we noticed a -9.2% regression of will-it-scale.per_thread_ops due =
to commit:
> > commit: 57efa1fe5957694fa541c9062de0a127f0b9acb0 ("mm/gup: prevent gup_=
fast from racing with COW during fork")
> =

> Hmm. This looks like one of those "random fluctuations" things.
> =

> It would be good to hear if other test-cases also bisect to the same
> thing, but this report already says:
> =

> > In addition to that, the commit also has significant impact on the foll=
owing tests:
> >
> > +------------------+---------------------------------------------------=
------------------------------+
> > | testcase: change | will-it-scale: will-it-scale.per_thread_ops 3.7% i=
mprovement                    |
> =

> which does kind of reinforce that "this benchmark gives unstable numbers".
> =

> The perf data doesn't even mention any of the GUP paths, and on the
> pure fork path the biggest impact would be:
> =

>  (a) maybe "struct mm_struct" changed in size or had a different cache la=
yout

Yes, this seems to be the cause of the regression.

The test case is many thread are doing map/unmap at the same time,
so the process's rw_semaphore 'mmap_lock' is highly contended.

Before the patch (with 0day's kconfig), the mmap_lock is separated
into 2 cachelines, the 'count' is in one line, and the other members
sit in the next line, so it luckily avoid some cache bouncing. After
the patch, the 'mmap_lock' is pushed into one cacheline, which may
cause the regression.

Below is the pahole info:

- before the patch

	spinlock_t         page_table_lock;      /*   116     4 */
	struct rw_semaphore mmap_lock;           /*   120    40 */
	/* --- cacheline 2 boundary (128 bytes) was 32 bytes ago --- */
	struct list_head   mmlist;               /*   160    16 */
	long unsigned int  hiwater_rss;          /*   176     8 */

- after the patch

	spinlock_t         page_table_lock;      /*   124     4 */
	/* --- cacheline 2 boundary (128 bytes) --- */
	struct rw_semaphore mmap_lock;           /*   128    40 */
	struct list_head   mmlist;               /*   168    16 */
	long unsigned int  hiwater_rss;          /*   184     8 */

perf c2c log can also confirm this.

Thanks,
Feng

>  (b) two added (nonatomic) increment operations in the fork path due
> to the seqcount
> =

> and I'm not seeing what would cause that 9% change. Obviously cache
> placement has done it before.
> =

> If somebody else sees something that I'm missing, please holler. But
> I'll ignore this as "noise" otherwise.
> =

>             Linus
--===============0064705713818769384==--

