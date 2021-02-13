Content-Type: multipart/mixed; boundary="===============5903606321602041054=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [mm] 10befea91b: hackbench.throughput -62.4% regression
Date: Fri, 12 Feb 2021 17:22:54 -0800
Message-ID: <YCcp7pwzlQy15v5H@carbon.dhcp.thefacebook.com>
In-Reply-To: <8ce56447-b416-4750-eeb3-0d5bb92e007d@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5903606321602041054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2021 at 01:19:47PM +0800, Xing Zhengjun wrote:
> =

> =

> On 2/3/2021 10:49 AM, Roman Gushchin wrote:
> > On Tue, Feb 02, 2021 at 04:18:27PM +0800, Xing, Zhengjun wrote:
> > > On 1/14/2021 11:18 AM, Roman Gushchin wrote:
> > > > On Thu, Jan 14, 2021 at 10:51:51AM +0800, kernel test robot wrote:
> > > > > Greeting,
> > > > > =

> > > > > FYI, we noticed a -62.4% regression of hackbench.throughput due t=
o commit:
> > > > Hi!
> > > > =

> > > > Commit "mm: memcg/slab: optimize objcg stock draining" (currently o=
nly in the mm tree,
> > > > so no stable hash) should improve the hackbench regression.
> > > The commit has been merged into Linux mainline :
> > >  =C2=A03de7d4f25a7438f09fef4e71ef111f1805cd8e7c ("mm: memcg/slab: opt=
imize objcg
> > > stock draining")
> > > I test the regression still existed.
> > Hm, so in your setup it's about the same with and without this commit?
> > =

> > It's strange because I've received a letter stating a 45.2% improvement=
 recently:
> > https://lkml.org/lkml/2021/1/27/83
> =

> They are different test cases, 45.2% improvement test case run in "thread=
" mode, -62.4% regression test case run in "process" mode.
> From 286e04b8ed7a0427 to 3de7d4f25a7438f09fef4e71ef1 there are two regres=
sions for process mode :
> 1) 286e04b8ed7a0427 to 10befea91b61c4e2c2d1df06a2e  (-62.4% regression)
> 2) 10befea91b61c4e2c2d1df06a2e to d3921cb8be29ce5668c64e23ffd (-22.3% reg=
ression)
> =

> 3de7d4f25a7438f09fef4e71ef111f1805cd8e7c only fix the regression 2) , so =
the value of "hackbench.throughput" for 3de7d4f25a7438f09fef4e71ef1(71824) =
and 10befea91b61c4e2c2d1df06a2e (72220) is very closed.
> =

> Regression 1) still existed.

Hi!

I've looked into the regression, made a bisection and tried a couple of obv=
ious ideas.

The majority of regression comes from the kfree() path and the most expensi=
ve operation
is a reading of an objcg from an objcg vector on the release path. It seems=
 that it
happens from another cpu, or just long after the allocation, so it's almost=
 always
an expensive cache miss.

I've initially thought that zeroing is expensive and tried an option with n=
ot zeroing
the pointer until the next allocation which uses the same place (this appro=
ach brings
a penalty for non-accounted allocations). But it didn't help much.

Good news: some percentage of the regression can be mitigated by lowering t=
he accounting
accuracy. For example:
--
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index ed5cc78a8dbf..cca04571dadb 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -3261,7 +3261,7 @@ static void refill_obj_stock(struct obj_cgroup *objcg=
, unsigned int nr_bytes)
        }
        stock->nr_bytes +=3D nr_bytes;
 =

-       if (stock->nr_bytes > PAGE_SIZE)
+       if (stock->nr_bytes > 32 * PAGE_SIZE)
                drain_obj_stock(stock);
 =

        local_irq_restore(flags);

--

We also can try to play with putting the memcg pointer at the end of the ob=
ject (we discussed
such an option earlier), however it doesn't guarantee that it will be any h=
otter. In some cases
we can try to put the vector into the tail struct pages (Shakeel brought th=
is idea earlier),
but it's far from trivial.

As I said previously, because we've switched to a more precise per-object a=
ccounting, some
regression can be unavoidable. But real applications should not be affected=
 that hard,
because the cost of an allocation is still low. And there is always an opti=
on to disable
the kernel memory accounting.

I'll think more about what we can do here. Any ideas are welcome!

Thanks!


--===============5903606321602041054==--

