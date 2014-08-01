Content-Type: multipart/mixed; boundary="===============3422308503796106837=="
MIME-Version: 1.0
From: Davidlohr Bueso <davidlohr@hp.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Thu, 31 Jul 2014 17:18:32 -0700
Message-ID: <1406852312.27982.6.camel@buesod1.americas.hpqcorp.net>
In-Reply-To: <20140731104241.GA9918@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3422308503796106837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2014-07-31 at 12:42 +0200, Peter Zijlstra wrote:
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

It also seems to be the case on a 8-socket 80 core DL980:

tip/master baseline:
67276 169.590 [sec]
82400 188.406 [sec]
87827 201.122 [sec]
96659 228.243 [sec]
83180 192.422 [sec]

tip/master + a43455a1d57 reverted
36686 170.373 [sec]
52670 187.904 [sec]
55723 203.597 [sec]
41780 174.354 [sec]
36070 173.179 [sec]

Runtimes are pretty much all over the place, cannot really say if it's
gotten slower or faster. However, on avg, we nearly double the amount of
hint local faults with the commit in question.

After adding the proposed fix (NUMA_SCALE/8 variant), it goes down
again, closer to without a43455a1d57"

tip/master + patch
50591 175.272 [sec]
57858 191.969 [sec]
77564 215.429 [sec]
50613 179.384 [sec]
61673 201.694 [sec]

> Let me see if I can still find my SPECjbb2005 copy to see what that
> does.

I'll try to dig it up as well.


--===============3422308503796106837==--

