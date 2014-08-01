Content-Type: multipart/mixed; boundary="===============5575998658684996775=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Fri, 01 Aug 2014 10:03:30 +0800
Message-ID: <20140801020330.GA30211@aaronlu.sh.intel.com>
In-Reply-To: <20140731104241.GA9918@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5575998658684996775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 12:42:41PM +0200, Peter Zijlstra wrote:
> On Tue, Jul 29, 2014 at 02:39:40AM -0400, Rik van Riel wrote:
> > On Tue, 29 Jul 2014 13:24:05 +0800
> > Aaron Lu <aaron.lu@intel.com> wrote:
> > =

> > > FYI, we noticed the below changes on
> > > =

> > > git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mas=
ter
> > > commit a43455a1d572daf7b730fe12eb747d1e17411365 ("sched/numa: Ensure =
task_numa_migrate() checks the preferred node")
> > > =

> > > ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

> > > ---------------  -------------------------  =

> > >      94500 ~ 3%    +115.6%     203711 ~ 6%  ivb42/hackbench/50%-threa=
ds-pipe
> > >      67745 ~ 4%     +64.1%     111174 ~ 5%  lkp-snb01/hackbench/50%-t=
hreads-socket
> > >     162245 ~ 3%     +94.1%     314885 ~ 6%  TOTAL proc-vmstat.numa_hi=
nt_faults_local
> > =

> > Hi Aaron,
> > =

> > Jirka Hladky has reported a regression with that changeset as
> > well, and I have already spent some time debugging the issue.
> =

> So assuming those numbers above are the difference in

Yes, they are.

It means, for commit ebe06187bf2aec1, the number for
num_hint_local_faults is 94500 for ivb42 machine and 67745 for lkp-snb01
machine. The 3%, 4% following that number means the deviation of the
different runs to their average(we usually run it multiple times to
phase out possible sharp values). We should probably remove that
percentage, as they cause confusion if no detailed explanation and may
not mean much to the commit author and others(if the deviation is big
enough, we should simply drop that result).

The percentage in the middle is the change between the two commits.

Another thing is the meaning of the numbers, it doesn't seem that
evident they are for proc-vmstat.numa_hint_faults_local. Maybe something
like this is better?

ebe06187bf2aec1  a43455a1d572daf7b730fe12e  proc-vmstat.numa_hint_faults_lo=
cal
---------------  -------------------------  -----------------------------
     94500         +115.6%     203711       ivb42/hackbench/50%-threads-pipe
     67745          +64.1%     111174       lkp-snb01/hackbench/50%-threads=
-socket
    162245          +94.1%     314885       TOTAL =


Regards,
Aaron

> numa_hint_local_faults, the report is actually a significant
> _improvement_, not a regression.
> =

> On my IVB-EP I get similar numbers; using:
> =

>   PRE=3D`grep numa_hint_faults_local /proc/vmstat | cut -d' ' -f2`
>   perf bench sched messaging -g 24 -t -p -l 60000
>   POST=3D`grep numa_hint_faults_local /proc/vmstat | cut -d' ' -f2`
>   echo $((POST-PRE))
> =

> =

> tip/mater+origin/master		tip/master+origin/master-a43455a1d57
> =

> local	total                   local	total
> faults  time                    faults  time
> =

> 19971	51.384                  10104	50.838
> 17193	50.564                  9116	50.208
> 13435	49.057                  8332	51.344
> 23794	50.795                  9954	51.364
> 20255	49.463                  9598	51.258
> =

> 18929.6	50.2526                 9420.8	51.0024
> 3863.61	0.96                    717.78	0.49
> =

> So that patch improves both local faults and runtime. Its good (even
> though for the runtime we're still inside stdev overlap, so ideally I'd
> do more runs).
> =

> =

> Now I also did a run with the proposed patch, NUMA_SCALE/8 variant, and
> that slightly reduces both again:
> =

> tip/master+origin/master+patch
> =

> local	total
> faults  time
> =

> 21296	50.541
> 12771	50.54
> 13872	52.224
> 23352	50.85
> 16516	50.705
> =

> 17561.4	50.972
> 4613.32	0.71
> =

> So for hackbench a43455a1d57 is good and the proposed patch is making
> things worse.
> =

> Let me see if I can still find my SPECjbb2005 copy to see what that
> does.



--===============5575998658684996775==--

