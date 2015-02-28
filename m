Content-Type: multipart/mixed; boundary="===============1785443696738564599=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 3484b2de949: -46.2% aim7.jobs-per-min
Date: Sat, 28 Feb 2015 10:30:22 +0800
Message-ID: <1425090622.10337.67.camel@linux.intel.com>
In-Reply-To: <20150228014642.GG3087@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1785443696738564599==
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

I have double checked the result before sending out.

Do you do the test with same kernel config and test case/parameters
(aim7/page_test/load 6000)?

Best Regards,
Huang, Ying



--===============1785443696738564599==--

