Content-Type: multipart/mixed; boundary="===============5652422076791094154=="
MIME-Version: 1.0
From: Chen Yu <yu.chen.surf@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] ddb3b1126f: hackbench.throughput -25.9% regression
Date: Sat, 02 Apr 2022 02:04:09 +0800
Message-ID: <CADjb_WQsTkdbwrvtzWwjt2O_jiuQTx+=Xy=yMPbAwKPmFDX-0w@mail.gmail.com>
In-Reply-To: <7aa67fedb4b6dc9126bc59ee993fa18d0e472475.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5652422076791094154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 11:42 AM Tim Chen <tim.c.chen@linux.intel.com> wr=
ote:
>
> On Wed, 2022-03-30 at 17:46 +0800, kernel test robot wrote:
> >
> > Greeting,
> >
> > FYI, we noticed a -25.9% regression of hackbench.throughput due to comm=
it:
> >
>
> Will try to check the regression seen.
>
Double check  that the regression could be reproduced on top of the
latest sched/core branch:
parent ("sched/fair: Don't rely on ->exec_start for migration")
fbc  ("sched/fair: Simple runqueue order on migrate")

parent                                fbc
91107           -40.8%      53897        hackbench.throughput

and it is consistent with lkp's original report that the  context
switch count is much higher with patch applied:
9591919          +510.3%   58534937
hackbench.time.involuntary_context_switches
36451523          +281.5%  1.391e+08
hackbench.time.voluntary_context_switches

Considering that this patch  'raises' the priority of the migrated
task, by giving it the cfs_rq->min_vruntime,
it is possible that the migrated task would preempt the current
running task more easily.

0.00           +12.2       12.21
perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do_a=
ctivate.try_to_wake_up.autoremove_wake_function
and the patched version has  spent more time on enqueue_entity(),
which might be caused by setting sched entity hierarchy from leaf to
root,
which was mentioned in another thread.

-- =

Thanks,
Chenyu
--===============5652422076791094154==--

