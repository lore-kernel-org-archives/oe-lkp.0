Content-Type: multipart/mixed; boundary="===============7294131136384065931=="
MIME-Version: 1.0
From: Chen Yu <yu.chen.surf@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched/pelt] 2d02fa8cc2: stress-ng.pipeherd.ops_per_sec -9.7% regression
Date: Sat, 02 Apr 2022 02:32:45 +0800
Message-ID: <CADjb_WQL7ZTSrThgFHtoF2apwwqio8wgwGYmCOq9LBfamo3D0Q@mail.gmail.com>
In-Reply-To: <CAKfTPtDFhORUyOfqr==ZrOSgBd8=vzvYgWMxw87bvq3pQmq7DQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7294131136384065931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 1, 2022 at 12:17 AM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Thu, 31 Mar 2022 at 16:19, Chen Yu <yu.chen.surf@gmail.com> wrote:
> >
> > Hi Vincent,
> >
> > On Wed, Feb 9, 2022 at 1:17 PM kernel test robot <oliver.sang@intel.c=
om> wrote:
> > >
> > >
> > >
> > > Greeting,
> > >
> > > FYI, we noticed a -9.7% regression of stress-ng.pipeherd.ops_per_sec =
due to commit:
> > >
> > >
> > > commit: 2d02fa8cc21a93da35cfba462bf8ab87bf2db651 ("sched/pelt: Relax =
the sync of load_sum with load_avg")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > >
> > > in testcase: stress-ng
> > > on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358=
 CPU @ 2.60GHz with 128G memory
> > > with following parameters:
> > >
> > >         nr_threads: 100%
> > >         testtime: 60s
> > >         class: memory
> > >         test: pipeherd
> > >         cpufreq_governor: performance
> > >         ucode: 0xd000280
> > >
> > This week we have re-run the test result and it seems that this
> > regression is still there.
> > As we are evaluating whether this report is valid or if the
> > downgrading is expected, appreciated
> > if you could give suggestion on further steps:
> >
> > 1.  If I understand correctly,
> > 2d02fa8cc21a93da35cfba462bf8ab87bf2db651 ("sched/pelt: Relax the sync
> > of load_sum with load_avg")
> >      fixed the calculating of  load_sum.  Before this patch  the
> > contribution part would be 'skipped' and caused the load_sum
> >      to be lower than expected.
>
> Yes, you understand it correctly
>
> > 2. If above is true, after this patch, the load_sum becomes higher. Is
> > there a scenario that higher load_sum added to 1 cfs_rq brings
> >     more imbalance between this group and other sched_group, thus
> > brings more task migration/wake up? (because in below perf result,
> >     it seems that, with this patch applied, there are slightly more
> > take wake up)
>
> This change should not impact load balance as it only does comparison
> and I expect the load increase to happen on all cfs rq.
> The only place that could be impacted, would be wake_affine_weight()
> because it removes task load from previous cfs rq load before
> comparing.
> The task's load was not impacted by the underestimate which means that
> the load of prev cfs  might be seen lower than current cfs after
> subtracting the task's load whereas both cfs rqs were similarly
> underestimated.
> Now the load of prev cfs rq is not underestimated and becomes
> comparable or slightly higher than the current cfs and the task
> migrate on current cfs instead of staying on prev one at wakeup
>
Could you please elaborate a little more on this scenario, since both curre=
nt
and previous cfs rqs were underestimated, how could previous cfs rq has
lower load than the current one before applying this patch?

Say, suppose the previous cfs rq has a load of L1, and current cfs rq has
a load of L2, the waken task has a load of h, then wake_affine_weight()
compares L1 - h  with L2 + h ,  when L1 < L2 + 2h, the task will remain on
previous CPU.  Since L1 and L2 were underestimated in the same scale,
I'm not quite sure how this patch would affect the choice between
prev and current CPU.
> One possible test would be to run the test with WA_WEIGHT features
> disable and check if there is still a difference
>
Yes, after disabling WA_WEIGHT, the performance came back.
The following score is the output of stress-ng.pipeherd.ops_per_sec

WA_WEIGHT                 yes                        no
-------------------
patched
        yes                      58069733.01          69940547.7*
        no                        64591593.69          73503396.9

-- =

Thanks,
Chenyu
--===============7294131136384065931==--

