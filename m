Content-Type: multipart/mixed; boundary="===============6270258366177146953=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched] 143e1e28cb4: +17.9% aim7.jobs-per-min, -9.7% hackbench.throughput
Date: Sun, 10 Aug 2014 18:54:13 +0800
Message-ID: <20140810105413.GA29451@localhost>
In-Reply-To: <20140810075915.GR9918@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6270258366177146953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2014 at 09:59:15AM +0200, Peter Zijlstra wrote:
> On Sun, Aug 10, 2014 at 12:41:27PM +0800, Fengguang Wu wrote:
> > Hi Vincent,
> > =

> > FYI, we noticed some performance ups/downs on
> > =

> > commit 143e1e28cb40bed836b0a06567208bd7347c9672 ("sched: Rework sched_d=
omain topology definition")
> > =

> >     128529 =C2=B1 1%     +17.9%     151594 =C2=B1 0%  brickland1/aim7/6=
000-page_test
> >      76064 =C2=B1 3%     -32.2%      51572 =C2=B1 6%  brickland1/aim7/6=
000-page_test
> >   59366697 =C2=B1 3%     -46.1%   32017187 =C2=B1 7%  brickland1/aim7/6=
000-page_test
> >       2561 =C2=B1 7%     -42.9%       1463 =C2=B1 9%  brickland1/aim7/6=
000-page_test
> >       9926 =C2=B1 2%     -43.8%       5577 =C2=B1 4%  brickland1/aim7/6=
000-page_test
> >      19542 =C2=B1 9%     -38.3%      12057 =C2=B1 4%  brickland1/aim7/6=
000-page_test
> >     993654 =C2=B1 2%     -19.9%     795962 =C2=B1 3%  brickland1/aim7/6=
000-page_test
> =

> etc..
> =

> how does one read that? afaict its a random number generator..

The "brickland1/aim7/6000-page_test" is the test case part.

The "TOTAL XXX" is the metric part. One test run may generate lots of
metrics, reflecting different aspect of the system dynamics.

This view may be easier to read, by grouping the metrics by test case.

test case: brickland1/aim7/6000-page_test

    128529 =C2=B1 1%     +17.9%     151594 =C2=B1 0%  TOTAL aim7.jobs-per-m=
in
    582269 =C2=B114%     -55.6%     258617 =C2=B116%  TOTAL softirqs.SCHED
  59366697 =C2=B1 3%     -46.1%   32017187 =C2=B1 7%  TOTAL cpuidle.C1-IVT.=
time
     54543 =C2=B111%     -37.2%      34252 =C2=B116%  TOTAL cpuidle.C1-IVT.=
usage
      2561 =C2=B1 7%     -42.9%       1463 =C2=B1 9%  TOTAL numa-numastat.n=
ode2.other_node
      9926 =C2=B1 2%     -43.8%       5577 =C2=B1 4%  TOTAL proc-vmstat.num=
a_other
      2627 =C2=B112%     -49.1%       1337 =C2=B112%  TOTAL numa-numastat.n=
ode1.other_node
     19542 =C2=B1 9%     -38.3%      12057 =C2=B1 4%  TOTAL cpuidle.C1E-IVT=
.usage
      2455 =C2=B110%     -41.0%       1448 =C2=B1 9%  TOTAL numa-numastat.n=
ode0.other_node
    471304 =C2=B111%     -31.4%     323251 =C2=B1 8%  TOTAL numa-vmstat.nod=
e1.nr_anon_pages
      2281 =C2=B112%     -41.8%       1327 =C2=B116%  TOTAL numa-numastat.n=
ode3.other_node
   1903446 =C2=B111%     -30.7%    1318156 =C2=B1 7%  TOTAL numa-meminfo.no=
de1.AnonPages
    518274 =C2=B111%     -30.4%     360742 =C2=B1 8%  TOTAL numa-vmstat.nod=
e1.nr_active_anon
   2097138 =C2=B110%     -30.0%    1469003 =C2=B1 8%  TOTAL numa-meminfo.no=
de1.Active(anon)
  49527464 =C2=B1 6%     -32.4%   33488833 =C2=B1 4%  TOTAL cpuidle.C1E-IVT=
.time
   2118206 =C2=B110%     -29.7%    1488874 =C2=B1 7%  TOTAL numa-meminfo.no=
de1.Active
     76064 =C2=B1 3%     -32.2%      51572 =C2=B1 6%  TOTAL cpuidle.C6-IVT.=
usage
    188938 =C2=B133%     -41.3%     110966 =C2=B116%  TOTAL numa-meminfo.no=
de2.PageTables
     47262 =C2=B135%     -42.3%      27273 =C2=B116%  TOTAL numa-vmstat.nod=
e2.nr_page_table_pages
   1944687 =C2=B110%     -25.8%    1443923 =C2=B116%  TOTAL numa-meminfo.no=
de3.Active(anon)
   1754763 =C2=B111%     -26.6%    1288713 =C2=B116%  TOTAL numa-meminfo.no=
de3.AnonPages
   1964722 =C2=B110%     -25.5%    1464696 =C2=B116%  TOTAL numa-meminfo.no=
de3.Active
    432109 =C2=B1 9%     -26.2%     318886 =C2=B114%  TOTAL numa-vmstat.nod=
e3.nr_anon_pages
    479527 =C2=B1 9%     -25.3%     358029 =C2=B114%  TOTAL numa-vmstat.nod=
e3.nr_active_anon
    463719 =C2=B1 8%     -24.7%     349388 =C2=B1 7%  TOTAL numa-vmstat.nod=
e0.nr_anon_pages
   3157742 =C2=B116%     -26.5%    2320253 =C2=B110%  TOTAL numa-meminfo.no=
de1.MemUsed
   7303589 =C2=B1 2%     -24.8%    5495829 =C2=B1 3%  TOTAL meminfo.AnonPag=
es
   8064024 =C2=B1 2%     -24.0%    6132677 =C2=B1 3%  TOTAL meminfo.Active(=
anon)
    511455 =C2=B1 8%     -23.9%     389447 =C2=B1 7%  TOTAL numa-vmstat.nod=
e0.nr_active_anon
   1818612 =C2=B1 2%     -24.9%    1365670 =C2=B1 3%  TOTAL proc-vmstat.nr_=
anon_pages
   2007155 =C2=B1 2%     -24.3%    1518688 =C2=B1 3%  TOTAL proc-vmstat.nr_=
active_anon
   8145316 =C2=B1 2%     -23.7%    6213832 =C2=B1 3%  TOTAL meminfo.Active
   1850230 =C2=B1 8%     -24.1%    1405061 =C2=B1 8%  TOTAL numa-meminfo.no=
de0.AnonPages
 6.567e+11 =C2=B1 3%     -21.4%   5.16e+11 =C2=B1 4%  TOTAL meminfo.Committ=
ed_AS
   2044097 =C2=B1 7%     -23.5%    1562809 =C2=B1 8%  TOTAL numa-meminfo.no=
de0.Active(anon)
   2064106 =C2=B1 7%     -23.3%    1582792 =C2=B1 8%  TOTAL numa-meminfo.no=
de0.Active
    235358 =C2=B1 5%     -19.8%     188793 =C2=B1 3%  TOTAL proc-vmstat.pgm=
igrate_success
    235358 =C2=B1 5%     -19.8%     188793 =C2=B1 3%  TOTAL proc-vmstat.num=
a_pages_migrated
    433235 =C2=B1 4%     -18.1%     354845 =C2=B1 5%  TOTAL numa-vmstat.nod=
e2.nr_anon_pages
    198747 =C2=B123%     -28.0%     143034 =C2=B1 3%  TOTAL proc-vmstat.nr_=
page_table_pages
      3187 =C2=B1 5%     -18.5%       2599 =C2=B1 6%  TOTAL numa-vmstat.nod=
e0.numa_other
    796281 =C2=B123%     -27.7%     575352 =C2=B1 3%  TOTAL meminfo.PageTab=
les
   1395062 =C2=B1 6%     -19.0%    1130108 =C2=B1 3%  TOTAL proc-vmstat.num=
a_hint_faults
    477037 =C2=B1 4%     -17.2%     394983 =C2=B1 5%  TOTAL numa-vmstat.nod=
e2.nr_active_anon
      2829 =C2=B110%     +18.7%       3357 =C2=B1 3%  TOTAL numa-vmstat.nod=
e2.nr_alloc_batch
    993654 =C2=B1 2%     -19.9%     795962 =C2=B1 3%  TOTAL softirqs.RCU
      2706 =C2=B1 4%     +26.1%       3411 =C2=B1 5%  TOTAL numa-vmstat.nod=
e1.nr_alloc_batch
   2725835 =C2=B1 4%     -17.5%    2247537 =C2=B1 4%  TOTAL numa-meminfo.no=
de2.MemUsed
    393637 =C2=B1 6%     -15.3%     333296 =C2=B1 2%  TOTAL proc-vmstat.num=
a_hint_faults_local
      2.82 =C2=B1 3%     +21.9%       3.43 =C2=B1 4%  TOTAL turbostat.%pc2
      4.40 =C2=B1 2%     +22.0%       5.37 =C2=B1 4%  TOTAL turbostat.%c6
   1742111 =C2=B1 4%     -16.9%    1447181 =C2=B1 5%  TOTAL numa-meminfo.no=
de2.AnonPages
  15865125 =C2=B1 1%     -15.0%   13485882 =C2=B1 1%  TOTAL softirqs.TIMER
   1923000 =C2=B1 4%     -16.4%    1608509 =C2=B1 5%  TOTAL numa-meminfo.no=
de2.Active(anon)
   1943185 =C2=B1 4%     -16.2%    1629057 =C2=B1 5%  TOTAL numa-meminfo.no=
de2.Active
      3077 =C2=B1 1%     +14.5%       3523 =C2=B1 0%  TOTAL proc-vmstat.pga=
ctivate
       329 =C2=B1 1%     -13.3%        285 =C2=B1 0%  TOTAL uptime.boot
     13158 =C2=B113%     -14.4%      11261 =C2=B1 4%  TOTAL numa-meminfo.no=
de3.SReclaimable
      3289 =C2=B113%     -14.4%       2815 =C2=B1 4%  TOTAL numa-vmstat.nod=
e3.nr_slab_reclaimable
   3150464 =C2=B1 2%     -24.2%    2387551 =C2=B1 3%  TOTAL time.voluntary_=
context_switches
       281 =C2=B1 1%     -15.1%        238 =C2=B1 0%  TOTAL time.elapsed_ti=
me
     29294 =C2=B1 1%     -14.3%      25093 =C2=B1 0%  TOTAL time.system_time
   4529818 =C2=B1 1%      -8.8%    4129398 =C2=B1 1%  TOTAL time.involuntar=
y_context_switches
     15.75 =C2=B1 1%      -3.4%      15.21 =C2=B1 0%  TOTAL turbostat.RAM_W
     10655 =C2=B1 0%      +1.4%      10802 =C2=B1 0%  TOTAL time.percent_of=
_cpu_this_job_got

Thanks,
Fengguang

--===============6270258366177146953==--

