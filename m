Content-Type: multipart/mixed; boundary="===============2795330286922005571=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] f6183ef98b: phoronix-test-suite.aom-av1.0.frames_per_second -25.0% regression
Date: Thu, 05 Mar 2020 10:58:22 +0800
Message-ID: <20200305025822.GH5972@shao2-debian>
In-Reply-To: <20200227090640.GF3818@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2795330286922005571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2020 at 09:06:40AM +0000, Mel Gorman wrote:
> On Thu, Feb 27, 2020 at 01:25:27PM +0800, Rong Chen wrote:
> > =

> > =

> > On 2/26/20 4:33 PM, Mel Gorman wrote:
> > > On Wed, Feb 26, 2020 at 09:03:26AM +0100, Vincent Guittot wrote:
> > > > Hi Rong,
> > > > =

> > > > On Wed, 26 Feb 2020 at 02:33, kernel test robot <rong.a.chen@inte=
l.com> wrote:
> > > > > Greeting,
> > > > > =

> > > > > FYI, we noticed a -25.0% regression of phoronix-test-suite.aom-av=
1.0.frames_per_second due to commit:
> > > > > =

> > > > > =

> > > > > commit: f6183ef98bba39a5de563d4ab4bc889ff2b600d7 ("sched/numa: re=
place runnable_load_avg by load_avg")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/mel/linux.git sched-=
lbnuma-rewrite-v2r6
> > > > The following patches in the branch recover the perf regression. Do
> > > > you see regression on the whole branch ?
> > > > =

> > > If not, include "sched/fair: fix statistics for find_idlest_group" on=
 top,
> > > particularly if the workload is configured to use threads >=3D nr_cpu=
s.
> > > =

> > =

> > Hi Gorman,
> > =

> > The regression is still exist on commit "sched/fair: fix statistics for
> > find_idlest_group".
> > =

> > $ git log --oneline -2 db79824c2038adc60526970552242420386ed5e2
> > db79824c2038a sched/fair: fix statistics for find_idlest_group()
> > b92430cf87ebb sched/numa: Stop an exhastive search if a reasonable swap
> > candidate or idle CPU is found
> > =

> =

> I failed to notice that you're testing v2 of the patch series and
> this is severely out of date -- the branch doesn't even exist on
> git.kernel.org any more. It was v6 that was ultimately picked up but
> even if I push the branch I tested, it's unique as it's a rebased
> tip/sched/core.  I think it's better to check what's currently in
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core.
> Commit a0f03b617c3b2644d3d47bf7d9e60aed01bd5b10 is the latest version
> that is aiming for the next merge window but note that it's missing
> "sched/fair: fix statistics for find_idlest_group".
> =

> -- =

> Mel Gorman
> SUSE Labs

Hi,

I tested on branch tip/sched/core, the regression is still there.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/debian-x86_64-phoronix/lkp-nhm-2ep1/aom=
-av1-1.2.0/phoronix-test-suite/0x1d

commit: =

  6d4d22468dae3d8757af9f8b81b848a76ef4409d ("sched/fair: Reorder enqueue/de=
queue_task_fair path")
  6499b1b2dd1b8d404a16b9fbbf1af6b9b3c1d83d ("sched/numa: Replace runnable_l=
oad_avg by load_avg")
  253e2b69ef8fda4d9345ff496b12058faaeeff6b ("sched/fair: fix statistics for=
 find_idlest_group()")

6d4d22468dae3d87 6499b1b2dd1b8d404a16b9fbbf1 253e2b69ef8fda4d9345ff496b1 =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

      0.04           -25.0%       0.03           -25.0%       0.03        p=
horonix-test-suite.aom-av1.0.frames_per_second

Best Regards,
Rong Chen
--===============2795330286922005571==--

