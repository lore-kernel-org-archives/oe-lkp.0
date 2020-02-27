Content-Type: multipart/mixed; boundary="===============0106906250836730411=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [sched/numa] f6183ef98b: phoronix-test-suite.aom-av1.0.frames_per_second -25.0% regression
Date: Thu, 27 Feb 2020 09:06:40 +0000
Message-ID: <20200227090640.GF3818@techsingularity.net>
In-Reply-To: <f3353fb7-381f-0c8a-b4cf-87d039debe2c@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0106906250836730411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2020 at 01:25:27PM +0800, Rong Chen wrote:
> =

> =

> On 2/26/20 4:33 PM, Mel Gorman wrote:
> > On Wed, Feb 26, 2020 at 09:03:26AM +0100, Vincent Guittot wrote:
> > > Hi Rong,
> > > =

> > > On Wed, 26 Feb 2020 at 02:33, kernel test robot <rong.a.chen@intel.=
com> wrote:
> > > > Greeting,
> > > > =

> > > > FYI, we noticed a -25.0% regression of phoronix-test-suite.aom-av1.=
0.frames_per_second due to commit:
> > > > =

> > > > =

> > > > commit: f6183ef98bba39a5de563d4ab4bc889ff2b600d7 ("sched/numa: repl=
ace runnable_load_avg by load_avg")
> > > > https://git.kernel.org/cgit/linux/kernel/git/mel/linux.git sched-lb=
numa-rewrite-v2r6
> > > The following patches in the branch recover the perf regression. Do
> > > you see regression on the whole branch ?
> > > =

> > If not, include "sched/fair: fix statistics for find_idlest_group" on t=
op,
> > particularly if the workload is configured to use threads >=3D nr_cpus.
> > =

> =

> Hi Gorman,
> =

> The regression is still exist on commit "sched/fair: fix statistics for
> find_idlest_group".
> =

> $ git log --oneline -2 db79824c2038adc60526970552242420386ed5e2
> db79824c2038a sched/fair: fix statistics for find_idlest_group()
> b92430cf87ebb sched/numa: Stop an exhastive search if a reasonable swap
> candidate or idle CPU is found
> =


I failed to notice that you're testing v2 of the patch series and
this is severely out of date -- the branch doesn't even exist on
git.kernel.org any more. It was v6 that was ultimately picked up but
even if I push the branch I tested, it's unique as it's a rebased
tip/sched/core.  I think it's better to check what's currently in
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core.
Commit a0f03b617c3b2644d3d47bf7d9e60aed01bd5b10 is the latest version
that is aiming for the next merge window but note that it's missing
"sched/fair: fix statistics for find_idlest_group".

-- =

Mel Gorman
SUSE Labs
--===============0106906250836730411==--

