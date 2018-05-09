Content-Type: multipart/mixed; boundary="===============7121976808986480449=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] e27be240df: will-it-scale.per_process_ops -27.2% regression
Date: Wed, 09 May 2018 23:02:21 +0800
Message-ID: <20180509150221.GA4848@intel.com>
In-Reply-To: <20180509023211.GB10016@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7121976808986480449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 09, 2018 at 10:32:11AM +0800, Aaron Lu wrote:
> On Tue, May 08, 2018 at 01:26:40PM -0400, Johannes Weiner wrote:
> > Hello,
> > =

> > On Tue, May 08, 2018 at 01:34:51PM +0800, kernel test robot wrote:
> > > FYI, we noticed a -27.2% regression of will-it-scale.per_process_ops =
due to commit:
> > > =

> > > =

> > > commit: e27be240df53f1a20c659168e722b5d9f16cc7f4 ("mm: memcg: make su=
re memory.events is uptodate when waking pollers")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > =

> > > in testcase: will-it-scale
> > > on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz=
 with 128G memory
> > > with following parameters:
> > > =

> > > 	nr_task: 100%
> > > 	mode: process
> > > 	test: page_fault3
> > > 	cpufreq_governor: performance
> > > =

> > > test-description: Will It Scale takes a testcase and runs it from 1 t=
hrough to n parallel copies to see if the testcase will scale. It builds bo=
th a process and threads based test in order to see any differences between=
 the two.
> > > test-url: https://github.com/antonblanchard/will-it-scale
> > =

> > This is surprising. Do you run these tests in a memory cgroup with a
> > limit set? Can you dump that cgroup's memory.events after the run?
> =

> There is no cgroup related setup so yes, this is surprising.
> But the result is quite stable, I have just confirmed on another
> Haswell-EP machine.
> =

> perf shows increased cycles spent for lock_page_memcg and
> unlock_page_memcg, maybe this can shed some light. Full profile for this
> commit and its parent are attached.
> =

> I have also attached dmesg for both commits in case they are useful,
> please feel free to let me know if you need any other information. We
> also collected a ton of other information during the run like
> /proc/vmstat, /proc/meminfo, /proc/interrupt etc.

Test on Broadwell-EP also showed 35% regression, here are a list of
functions that take more CPU cycles with this commit according to perf:

a38c015f3156895b e27be240df53f1a20c659168e7                                =
                                                    =

---------------- --------------------------                                =
                                                    =

         %stddev     %change         %stddev
             \          |                \
  58033709           -35.0%   37727244        will-it-scale.workload
... ...
      3.82            +6.1        9.97        perf-profile.self.cycles-pp.h=
andle_mm_fault
      3.19            +6.2        9.37        perf-profile.self.cycles-pp.p=
age_remove_rmap
      0.25            +6.5        6.71        perf-profile.self.cycles-pp._=
_unlock_page_memcg
      3.63            +7.5       11.15        perf-profile.self.cycles-pp.p=
age_add_file_rmap
      0.60            +8.1        8.70        perf-profile.self.cycles-pp.l=
ock_page_memcg

--===============7121976808986480449==--

