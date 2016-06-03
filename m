Content-Type: multipart/mixed; boundary="===============2552744878830651409=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [mm] 795ae7a0de: pixz.throughput -9.1% regression
Date: Fri, 03 Jun 2016 18:21:09 -0400
Message-ID: <20160603222109.GA12579@cmpxchg.org>
In-Reply-To: <20160602160706.GA24004@cmpxchg.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2552744878830651409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2016 at 12:07:06PM -0400, Johannes Weiner wrote:
> Hi,
> =

> On Thu, Jun 02, 2016 at 02:45:07PM +0800, kernel test robot wrote:
> > FYI, we noticed pixz.throughput -9.1% regression due to commit:
> > =

> > commit 795ae7a0de6b834a0cc202aa55c190ef81496665 ("mm: scale kswapd wate=
rmarks in proportion to memory")
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> > =

> > in testcase: pixz
> > on test machine: ivb43: 48 threads Ivytown Ivy Bridge-EP with 64G memor=
y with following parameters: cpufreq_governor=3Dperformance/nr_threads=3D10=
0%
> =

> Xiaolong, thanks for the report.
> =

> It looks like the regression stems from a change in NUMA placement:

Scratch that, I was misreading the test results. It's just fewer
allocations in general that happen during the fixed testing time.

I'm stumped by this report. All this patch does other than affect page
reclaim (which is not involved here) is increase the size of the round
robin batches in the fair zone allocator. That should *reduce* work in
the page allocator, if anything.

But I also keep failing to reproduce this - having tried it on the
third machine now - neither pixz nor will-it-scale/page_fault1 give me
that -8-9% regression:

4.5.0-02574-g3ed3a4f:
PIXZ-good.log:throughput: 39908733.604941994
PIXZ-good.log:throughput: 37067947.25049969
PIXZ-good.log:throughput: 38604938.39131216

4.5.0-02575-g795ae7a:
 PIXZ-bad.log:throughput: 39489120.87179377
 PIXZ-bad.log:throughput: 39307299.288432725
 PIXZ-bad.log:throughput: 38795994.3329781

Is this reliably reproducible with 3ed3a4f vs 795ae7a?

Could I ask you to retry the test with Linus's current head as well as
with 795ae7a reverted on top of it? (It's a clean revert.)

Thanks

--===============2552744878830651409==--

