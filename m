Content-Type: multipart/mixed; boundary="===============5140423124308256852=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] ef4eebad9c: fxmark.hdd_ext4_no_jnl_MWCL_1_bufferedio.works/sec -9.8% regression
Date: Wed, 03 Mar 2021 10:56:51 +0800
Message-ID: <20210303025651.GA2708@xsang-OptiPlex-9020>
In-Reply-To: <7879534D-1CEB-42C6-A740-5D48EDAF9C63@dilger.ca>
List-Id: <oe-lkp.lists.linux.dev>

--===============5140423124308256852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Thanks a lot for feedbacks and great suggestions! We will investigate furth=
er
to refine our reports. Also please check below inlines and kindly give us m=
ore
ideas if you have :) Thanks again.

On Thu, Feb 25, 2021 at 08:22:41PM -0700, Andreas Dilger wrote:
> On Feb 14, 2021, at 7:09 AM, kernel test robot <oliver.sang@intel.com> =
wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed a -9.8% regression of fxmark.hdd_ext4_no_jnl_MWCL_1_buf=
feredio.works/sec due to commit:
> > =

> > =

> > commit: ef4eebad9c018a972a470b7b41e68bc981b31d00 ("ext4: improve cr 0 /=
 cr 1 group scanning")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git Harshad=
-Shirwadkar/ext4-drop-s_mb_bal_lock-and-convert-protected-fields-to-atomic/=
20210210-054647
> =

> Hello Oliver and Intel team,
> thanks for your regression report.  It is definitely very useful to have
> such a service running against patches before they are landed.
> =

> I'd like to make a couple of suggestions on how these emails could be
> more useful to the developers and others who see such reports.
> - it would be good to positively identify the source of the patch.  In
>   several parts of this email it references the git hash ef4eebad9c,
>   but (AFAICS) this hash is only relevant in your local repository.
>   While reviewing this result, we were not totally positive which
>   version of the "ext4: improve cr 0 / cr 1 group scanning" patch was
>   being tested, since there more than one version of this patch was
>   sent to the list.  Including the original Message-Id from the email
>   (I believe <20210209202857.4185846-5-harshadshirwadkar@gmail.com> in
>   this case) would make it more obvious.

Sorry about this, the confustion caused by one bug recently, which was
fixed now, so if we regenerate the report, patch will be shown like below:

commit: ef4eebad9c018a972a470b7b41e68bc981b31d00 ("[PATCH v2 4/5] ext4: imp=
rove cr 0 / cr 1 group scanning")
url: https://github.com/0day-ci/linux/commits/Harshad-Shirwadkar/ext4-drop-=
s_mb_bal_lock-and-convert-protected-fields-to-atomic/20210210-054647
base: https://git.kernel.org/cgit/linux/kernel/git/tytso/ext4.git dev

is it good enough for you? generally speaking, we monitor different
mailing list daily and fetch patches, then we will push them to the
https://github.com/0day-ci/linux/ in form of new branches. Then if
we found a problem (sometimes also a performance improvment), we will
send out report which contains the exact github url pointing to the
commit where we found the problem.

regarding Message-Id you mentioned, we use 'In_reply-To' approach, such
like in original report mail header:
"In-Reply-To: <20210209202857.4185846-5-harshadshirwadkar@gmail.com>"
not sure if you find the report as a direct reply to your original
"[PATCH v2 4/5] ext4: improve cr 0 / cr 1 group scanning" mail?


> - the subject of the email is unrelated to the original patch, so it
>   is more difficult to tie this report to the original patch, and it
>   does not sort or thread together in the mail reader or archive.  I
>   would recommend to make the subject match the original patch email
>   "Re: [PATCH v2 4/5] ext4: improve cr 0 / cr 1 group scanning" and add
>   "References: <20210209202857.4185846-5-harshadshirwadkar@gmail.com>"
>   in the header so it threads together in the inbox and archives, and
>   "fxmark.hdd_ext4_no_jnl_MWCL_1_bufferedio.works/sec -9.8% regression"
>   as the first line in the body.

maybe this is hard part for us now, since pretty number of our tools
reply on this style. and we also want a uniform style of our reports in
our mailing list: https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org/

but I guess if "In-Reply-To" works, it could at least supply some direct
link between our report and the original patch?

> - while it is clear from the subject that there is a 9.8% regression
>   in a test case, it isn't totally clear what this test case is, nor
>   what is actually being measured (what is "works/sec", and does this
>   patch add "doesn't work/sec"? :-).

this is due to another problem that we missed descriptions for some tests,
in this case, it's fxmark (https://github.com/sslab-gatech/fxmark)

we acutally don't create our own tests, instead, we utilize some upstream
Micro Benchmark as our testsuite. Normally we assume patch authors know
their patch's impact and either familiar with related Micro Benchmark
or could check the tool through the link we supplied in the report and get
familar with it pretty quickly since it should be on the similar domain.

but here, sorry, we missed for fxmark. Thanks a lot for pointing this out
and we will do some improvements.

> - it would be useful to add a URL in every such email pointing to a
>   general overview page like "So your patch got an email from the
>   Intel Kernel Test Robot" that explains what this means (maybe with
>   some nice stats showing how many patches Intel is testing, how many
>   tests are run on the systems you have, and generally showing what a
>   good job you are doing), along with a general explanation of how to
>   interpret the results in the email.

Thanks for the suggestion!
currently we still tend to maintain our project based on mailing list,
such like this report is in
https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org/
(BTW, we have another one dedicated for kbuild issues:
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org/)

we have some webpage having some basic introduction of the project, such
like,
https://01.org/lkp
https://01.org/blogs/2018/0-day-ci-test
but we don't maintain them well and kind of out-of-date.
we also have some wikipages on https://github.com/intel/lkp-tests/wiki
but maybe not in detail enough.

seems a definate improvement space for us :) but maybe need more time
and efforts.

> - it would be even more useful to have a link to a specific page that
>   explains what each test is doing (fxmark MWCL I guess) and what the
>   specific regression is ("works/sec" doesn't really mean anything
>   to me, and I have no idea what MWCL_1, _2, _36, _45 are).  Maybe
>   this is already available somewhere, but having a link makes it much
>   easier to find.

as I mentioned above, we are utilizing public Micro Benchmarks. maybe it's
better for us just supplying the link (with some brief description) since
it would be hard for us to maintain our own pages sync with all 80+
Micro Benchmarks we used :) anyway, you have a good point, and we will
investigate if there is a way to avoid the confusion you pointed out.

> - the performance comparison itself is a bit confusing, as it isn't
>   clear what "fail:runs" actually means.  It _looks_ like the "before"
>   patch (a932b2b78) had as many test failures as the "after" patch,
>   both "0 of 4" or "1 of 4" test runs, which doesn't explain the
>   5%/10%/4%/9% reproduction%.

sorry for the part you mentioned:
a932b2b7885865bd ef4eebad9c018a972a470b7b41e
---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          0:4            5%           0:4     perf-profile.children.cycles-=
pp.error_return
          1:4           10%           1:4     perf-profile.children.cycles-=
pp.error_entry
           :4            4%           0:4     perf-profile.self.cycles-pp.e=
rror_return
          1:4            9%           1:4     perf-profile.self.cycles-pp.e=
rror_entry
         %stddev     %change         %stddev
             \          |                \  =

    315979            -9.8%     284922        fxmark.hdd_ext4_no_jnl_MWCL_1=
_bufferedio.works

while running tests, we also enable some monitors such like perf-stat,
iostat... and many others.
our tools still have some problems that capture some output as suspicous
problem like above perf-profile.***, and other problems which calculate
those confusing percentages. we will refine our tool to avoid these nonsense
informations.

> - the graphs at the end are (I guess) performance metrics vs. different
>   commit hashes during git bisect to find the broken patch (?), but the
>   x-axis isn't labelled, so it is hard to know.  There is a bit of a
>   legend, showing "[*] bisect-good sample" and "[O] bisect-bad sample"
>   but there are no '*' on the graphs, only 'O' and '+' so it is hard
>   to know how to interpret them.

I should admit these graphs hard to read, and you actually got most part of
it:) right, those dots, either 'O' or '+' stands for the value when tests
on different Bad or Good commits along the bisection. and the purpose of
graphs is to show how Bad commits differentiate with Good commits regarding
a metrics. If they distinguish enough (like in this case), we have a high
confidence that our bisection is valid, but if they look mixed like 'O' '+'
intersect with each other in some part of the graphs, there would be some
doubt of the whole bisection. We used them as some supplemental data since
on previous table we just supply the comparison between two commits ('broke=
n'
commit though not always really broke something vs its parent)

also our tools are lack of enough maintain in this part recently so there a=
re
'*' vs '+' problem and other issues such like in some graphs some data not
show totally. we will investigate this further.

> =

> Thanks in any case for your work on this.  My email is only intended
> to help us get the most value and understanding of the effort that
> you and the many hard-working Xeon Phi cores are doing on our behalf.

Thanks again and all your inputs are so valueable to us!

> =

> Cheers, Andreas
> =

> > in testcase: fxmark
> > on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz w=
ith 80G memory
> > with following parameters:
> > =

> > 	disk: 1HDD
> > 	media: hdd
> > 	test: MWCL
> > 	fstype: ext4_no_jnl
> > 	directio: bufferedio
> > 	cpufreq_governor: performance
> > 	ucode: 0x11
> > =

> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > Details are as below:
> > -----------------------------------------------------------------------=
--------------------------->
> > =

> > =

> > To reproduce:
> > =

> >        git clone https://github.com/intel/lkp-tests.git
> >        cd lkp-tests
> >        bin/lkp install                job.yaml  # job file is attached =
in this email
> >        bin/lkp split-job --compatible job.yaml
> >        bin/lkp run                    compatible-job.yaml
> > =

> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbo=
x_group/test/testcase/ucode:
> >  gcc-9/performance/bufferedio/1HDD/ext4_no_jnl/x86_64-rhel-8.3/hdd/debi=
an-10.4-x86_64-20200603.cgz/lkp-knm01/MWCL/fxmark/0x11
> > =

> > commit:
> >  a932b2b788 ("ext4: add MB_NUM_ORDERS macro")
> >  ef4eebad9c ("ext4: improve cr 0 / cr 1 group scanning")
> > =

> > a932b2b7885865bd ef4eebad9c018a972a470b7b41e
> > ---------------- ---------------------------
> >       fail:runs  %reproduction    fail:runs
> >           |             |             |
> >          0:4            5%           0:4     perf-profile.children.cycl=
es-pp.error_return
> >          1:4           10%           1:4     perf-profile.children.cycl=
es-pp.error_entry
> >           :4            4%           0:4     perf-profile.self.cycles-p=
p.error_return
> >          1:4            9%           1:4     perf-profile.self.cycles-p=
p.error_entry
> >         %stddev     %change         %stddev
> >             \          |                \
> >    315979            -9.8%     284922        fxmark.hdd_ext4_no_jnl_MWC=
L_1_bufferedio.works
> >     10532            -9.8%       9497        fxmark.hdd_ext4_no_jnl_MWC=
L_1_bufferedio.works/sec
> >      0.01 =C2=B1100%  +38150.0%       1.91 =C2=B1 11%  fxmark.hdd_ext4_=
no_jnl_MWCL_2_bufferedio.iowait_sec
> >      0.01 =C2=B1100%  +38189.0%       3.16 =C2=B1 11%  fxmark.hdd_ext4_=
no_jnl_MWCL_2_bufferedio.iowait_util
> >      5.33 =C2=B1 17%     +22.5%       6.52 =C2=B1  4%  fxmark.hdd_ext4_=
no_jnl_MWCL_36_bufferedio.idle_sec
> >      0.49 =C2=B1 16%     +22.2%       0.60 =C2=B1  4%  fxmark.hdd_ext4_=
no_jnl_MWCL_36_bufferedio.idle_util
> >      6.50 =C2=B1  9%     -21.6%       5.09 =C2=B1  8%  fxmark.hdd_ext4_=
no_jnl_MWCL_45_bufferedio.idle_sec
> >      0.48 =C2=B1  9%     -22.6%       0.37 =C2=B1 10%  fxmark.hdd_ext4_=
no_jnl_MWCL_45_bufferedio.idle_util
> >      0.00 =C2=B1173%  +75800.0%       1.90 =C2=B1 22%  fxmark.hdd_ext4_=
no_jnl_MWCL_4_bufferedio.iowait_sec
> >      0.00 =C2=B1173%  +75915.1%       1.57 =C2=B1 22%  fxmark.hdd_ext4_=
no_jnl_MWCL_4_bufferedio.iowait_util
> >      0.52 =C2=B1  6%     -11.1%       0.46 =C2=B1  4%  fxmark.hdd_ext4_=
no_jnl_MWCL_54_bufferedio.softirq_util
> >      1090            +3.2%       1124        fxmark.time.elapsed_time
> >      1090            +3.2%       1124        fxmark.time.elapsed_time.m=
ax
> >     65107            -5.9%      61260        fxmark.time.involuntary_co=
ntext_switches
> >     69.50            -5.8%      65.50        fxmark.time.percent_of_cpu=
_this_job_got
> >     28.28            -4.1%      27.11 =C2=B1  2%  fxmark.time.user_time
> >      5.50 =C2=B1  3%      +2.8        8.26 =C2=B1  4%  mpstat.cpu.all.i=
owait%
> >     58.50            -2.6%      57.00        vmstat.cpu.id
> >     38021            -6.2%      35647        vmstat.io.bo
> >     85553            -4.1%      82045        vmstat.system.in
> >     58.98            -2.7%      57.37        iostat.cpu.idle
> >      5.57 =C2=B1  4%     +49.8%       8.34 =C2=B1  4%  iostat.cpu.iowait
> >     30.35            -3.1%      29.41        iostat.cpu.system
> >      2.81            -5.3%       2.66        iostat.cpu.user
> >    711278           +15.3%     820380        meminfo.Dirty
> >   7003710            -9.0%    6376219        meminfo.KReclaimable
> >      1840 =C2=B1 12%     +21.4%       2233        meminfo.Mlocked
> >   7003710            -9.0%    6376219        meminfo.SReclaimable
> >    710759           +15.4%     820265        numa-meminfo.node0.Dirty
> >   6994361            -9.0%    6365487        numa-meminfo.node0.KReclai=
mable
> >      1053 =C2=B1 12%     +21.6%       1281        numa-meminfo.node0.Ml=
ocked
> >   6994361            -9.0%    6365487        numa-meminfo.node0.SReclai=
mable
> >    177664           +15.5%     205237        numa-vmstat.node0.nr_dirty
> >    262.75 =C2=B1 12%     +21.9%     320.25        numa-vmstat.node0.nr_=
mlock
> >   1751239            -9.0%    1594254        numa-vmstat.node0.nr_slab_=
reclaimable
> >    178395           +15.4%     205952        numa-vmstat.node0.nr_zone_=
write_pending
> >      2244 =C2=B1 68%     -82.7%     387.72 =C2=B1 15%  sched_debug.cfs_=
rq:/.load_avg.max
> >    309.86 =C2=B1 59%     -72.6%      84.98 =C2=B1 14%  sched_debug.cfs_=
rq:/.load_avg.stddev
> >    385204 =C2=B1  8%     -35.5%     248625 =C2=B1  6%  sched_debug.cfs_=
rq:/.min_vruntime.stddev
> >   -681107           -51.9%    -327811        sched_debug.cfs_rq:/.sprea=
d0.min
> >    385220 =C2=B1  8%     -35.5%     248625 =C2=B1  6%  sched_debug.cfs_=
rq:/.spread0.stddev
> >     10.05 =C2=B1 51%    +506.0%      60.92 =C2=B1 32%  sched_debug.cfs_=
rq:/.util_est_enqueued.min
> >    125.29 =C2=B1 14%     -18.5%     102.09 =C2=B1  7%  sched_debug.cfs_=
rq:/.util_est_enqueued.stddev
> >     24.34 =C2=B1  8%     -21.6%      19.08 =C2=B1  2%  sched_debug.cpu.=
clock.stddev
> >     61783 =C2=B1  8%     +33.0%      82157 =C2=B1  7%  sched_debug.cpu.=
nr_switches.avg
> >     35702 =C2=B1  8%     +55.3%      55461 =C2=B1 11%  sched_debug.cpu.=
nr_switches.min
> >      7989 =C2=B1 25%     +87.6%      14991 =C2=B1 24%  softirqs.CPU1.BL=
OCK
> >    123512 =C2=B1  3%      -7.6%     114086 =C2=B1  2%  softirqs.CPU21.R=
CU
> >    122473 =C2=B1  3%      -6.6%     114426 =C2=B1  2%  softirqs.CPU25.R=
CU
> >     66489 =C2=B1  5%     -11.7%      58718 =C2=B1  5%  softirqs.CPU29.S=
CHED
> >     99247 =C2=B1  3%      -8.6%      90723 =C2=B1  5%  softirqs.CPU33.R=
CU
> >     56394 =C2=B1  3%     -13.5%      48805 =C2=B1  5%  softirqs.CPU36.S=
CHED
> >     43799 =C2=B1  4%     -12.9%      38133 =C2=B1  4%  softirqs.CPU45.S=
CHED
> >     44447 =C2=B1  4%     -12.0%      39128 =C2=B1  5%  softirqs.CPU51.S=
CHED
> >    169512 =C2=B1  3%     -11.3%     150299 =C2=B1  3%  softirqs.CPU6.RCU
> >     33198 =C2=B1  5%     -14.9%      28240 =C2=B1 11%  softirqs.CPU60.S=
CHED
> >    147310 =C2=B1  6%      -9.0%     134107 =C2=B1  2%  softirqs.CPU9.RCU
> >      0.04 =C2=B1  6%      -0.0        0.03 =C2=B1 14%  perf-stat.i.bran=
ch-miss-rate%
> >    326874 =C2=B1  8%     -15.0%     277893 =C2=B1 12%  perf-stat.i.bran=
ch-misses
> >     41754            -4.6%      39817        perf-stat.i.cpu-clock
> >     85.39            -2.9%      82.87        perf-stat.i.cpu-migrations
> >      0.38 =C2=B1 10%     -16.2%       0.32 =C2=B1 11%  perf-stat.i.inst=
ructions-per-iTLB-miss
> >      0.00 =C2=B1 11%     -17.2%       0.00 =C2=B1 11%  perf-stat.i.ipc
> >      1.06 =C2=B1  3%      -7.8%       0.98        perf-stat.i.major-fau=
lts
> >      0.35            +4.1%       0.37        perf-stat.i.metric.K/sec
> >     41754            -4.6%      39817        perf-stat.i.task-clock
> >    348107 =C2=B1  7%     -14.8%     296451 =C2=B1 12%  perf-stat.ps.bra=
nch-misses
> >     41967            -4.6%      40020        perf-stat.ps.cpu-clock
> >     85.62            -2.9%      83.09        perf-stat.ps.cpu-migrations
> >      1.05 =C2=B1  3%      -7.7%       0.97        perf-stat.ps.major-fa=
ults
> >     41967            -4.6%      40020        perf-stat.ps.task-clock
> >      0.11 =C2=B1  8%     -33.2%       0.07 =C2=B1 28%  perf-sched.sch_d=
elay.avg.ms.io_schedule.rq_qos_wait.wbt_wait.__rq_qos_throttle
> >      0.02 =C2=B1  9%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.kthreadd.ret_from_fork
> >      0.28 =C2=B1 83%     -86.7%       0.04 =C2=B1 33%  perf-sched.sch_d=
elay.avg.ms.preempt_schedule_common._cond_resched.mempool_alloc.bio_alloc_b=
ioset.submit_bh_wbc
> >      0.01 =C2=B1 11%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.schedule_preempt_disabled.kthread.ret_from_fork
> >      0.06 =C2=B1 19%     -28.4%       0.04 =C2=B1  8%  perf-sched.sch_d=
elay.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
> >      0.01 =C2=B1100%    +141.3%       0.03 =C2=B1  8%  perf-sched.sch_d=
elay.avg.ms.schedule_timeout.wait_for_completion.__flush_work.lru_add_drain=
_all
> >      0.06 =C2=B1 10%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.schedule_timeout.wait_for_completion_killable.__kthread_create_on_no=
de.kthread_create_on_node
> >      0.35 =C2=B1113%     -79.7%       0.07 =C2=B1 40%  perf-sched.sch_d=
elay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_sysc=
all_64
> >      2.77 =C2=B1 40%     -46.4%       1.49 =C2=B1 53%  perf-sched.sch_d=
elay.max.ms.io_schedule.rq_qos_wait.wbt_wait.__rq_qos_throttle
> >      0.03 =C2=B1 21%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.kthreadd.ret_from_fork
> >      0.01 =C2=B1 11%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.schedule_preempt_disabled.kthread.ret_from_fork
> >      0.06 =C2=B1 13%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.schedule_timeout.wait_for_completion_killable.__kthread_create_on_no=
de.kthread_create_on_node
> >    139.75 =C2=B1  7%     -13.4%     121.00 =C2=B1  3%  perf-sched.wait_=
and_delay.count.preempt_schedule_common._cond_resched.shrink_dentry_list.pr=
une_dcache_sb.super_cache_scan
> >      8210 =C2=B1 10%     -26.3%       6048 =C2=B1 12%  perf-sched.wait_=
and_delay.max.ms.worker_thread.kthread.ret_from_fork
> >     88.37 =C2=B1 15%     -18.2%      72.31 =C2=B1 11%  perf-sched.wait_=
time.avg.ms.preempt_schedule_common._cond_resched.mempool_alloc.bio_alloc_b=
ioset.submit_bh_wbc
> >     79.45 =C2=B1109%    +329.8%     341.45 =C2=B1 42%  perf-sched.wait_=
time.avg.ms.preempt_schedule_common._cond_resched.mutex_lock.drm_gem_shmem_=
vunmap.mgag200_handle_damage
> >    129.91 =C2=B1  2%     +52.5%     198.10 =C2=B1 48%  perf-sched.wait_=
time.max.ms.preempt_schedule_common._cond_resched.submit_bio_checks.submit_=
bio_noacct.submit_bio
> >    130.18 =C2=B1  3%     +72.5%     224.52 =C2=B1 51%  perf-sched.wait_=
time.max.ms.preempt_schedule_common._cond_resched.write_cache_pages.generic=
_writepages.do_writepages
> >      8210 =C2=B1 10%     -26.3%       6048 =C2=B1 12%  perf-sched.wait_=
time.max.ms.worker_thread.kthread.ret_from_fork
> >    639.00            -4.1%     613.00        proc-vmstat.nr_active_anon
> >    109230            -4.7%     104085        proc-vmstat.nr_active_file
> >   9734223            -3.3%    9414937        proc-vmstat.nr_dirtied
> >    178266           +15.5%     205864        proc-vmstat.nr_dirty
> >    460.75 =C2=B1 12%     +21.4%     559.50        proc-vmstat.nr_mlock
> >   1758100            -8.9%    1601542        proc-vmstat.nr_slab_reclai=
mable
> >     68945            -3.0%      66853        proc-vmstat.nr_slab_unrecl=
aimable
> >   9734223            -3.3%    9414937        proc-vmstat.nr_written
> >    639.00            -4.1%     613.00        proc-vmstat.nr_zone_active=
_anon
> >    109230            -4.7%     104085        proc-vmstat.nr_zone_active=
_file
> >    179007           +15.4%     206596        proc-vmstat.nr_zone_write_=
pending
> >  24225927            -2.2%   23703313        proc-vmstat.numa_hit
> >  24225924            -2.2%   23703311        proc-vmstat.numa_local
> >  47793203            -3.0%   46353511        proc-vmstat.pgalloc_normal
> >   4923908           +11.4%    5485129        proc-vmstat.pgdeactivate
> >   3348086            +2.3%    3425886        proc-vmstat.pgfault
> >  47786479            -3.0%   46346216        proc-vmstat.pgfree
> >  41377300            -3.3%   40023642        proc-vmstat.pgpgout
> >    264776            +2.5%     271513        proc-vmstat.pgreuse
> >   4916073           +11.4%    5477332        proc-vmstat.pgrotated
> > 1.779e+08            -2.8%  1.729e+08        proc-vmstat.slabs_scanned
> >   9334464            +2.8%    9594624        proc-vmstat.unevictable_pg=
s_scanned
> >    662.25 =C2=B1  8%     -15.7%     558.50 =C2=B1  6%  slabinfo.Acpi-Pa=
rse.active_objs
> >   3972051            -9.0%    3616212        slabinfo.dentry.active_objs
> >    189593            -8.9%     172660        slabinfo.dentry.active_sla=
bs
> >   3981471            -8.9%    3625865        slabinfo.dentry.num_objs
> >    189593            -8.9%     172660        slabinfo.dentry.num_slabs
> >      3665          +602.8%      25759        slabinfo.ext4_extent_statu=
s.active_objs
> >     39.75          +558.5%     261.75        slabinfo.ext4_extent_statu=
s.active_slabs
> >      4090          +554.0%      26752        slabinfo.ext4_extent_statu=
s.num_objs
> >     39.75          +558.5%     261.75        slabinfo.ext4_extent_statu=
s.num_slabs
> >      4203 =C2=B1  3%    -100.0%       0.00        slabinfo.ext4_groupin=
fo_4k.active_objs
> >      4254 =C2=B1  2%    -100.0%       0.00        slabinfo.ext4_groupin=
fo_4k.num_objs
> >   5178202            -9.1%    4707049        slabinfo.ext4_inode_cache.=
active_objs
> >    191816            -9.1%     174364        slabinfo.ext4_inode_cache.=
active_slabs
> >   5179060            -9.1%    4707847        slabinfo.ext4_inode_cache.=
num_objs
> >    191816            -9.1%     174364        slabinfo.ext4_inode_cache.=
num_slabs
> >      1133 =C2=B1  5%     -14.9%     965.00 =C2=B1 11%  slabinfo.kmalloc=
-rcl-96.num_objs
> >     20676           +24.1%      25662        slabinfo.radix_tree_node.a=
ctive_objs
> >      1642           +14.8%       1885        slabinfo.radix_tree_node.a=
ctive_slabs
> >     23002           +14.8%      26403        slabinfo.radix_tree_node.n=
um_objs
> >      1642           +14.8%       1885        slabinfo.radix_tree_node.n=
um_slabs
> >      1069 =C2=B1  7%     +16.6%       1246 =C2=B1  6%  slabinfo.skbuff_=
fclone_cache.active_objs
> >      1250 =C2=B1  5%     +15.8%       1448 =C2=B1  6%  slabinfo.skbuff_=
fclone_cache.num_objs
> >      3019          +122.2%       6710        interrupts.CPU0.180:IR-PCI=
-MSI.512000-edge.ahci[0000:00:1f.2]
> >     14733 =C2=B1 10%    +135.6%      34711 =C2=B1 39%  interrupts.CPU1.=
180:IR-PCI-MSI.512000-edge.ahci[0000:00:1f.2]
> >     74.25 =C2=B1 41%    +328.6%     318.25 =C2=B1 54%  interrupts.CPU1.=
37:IR-PCI-MSI.4194305-edge.eth0-TxRx-0
> >      4354 =C2=B1 25%     +29.9%       5655 =C2=B1 13%  interrupts.CPU11=
.CAL:Function_call_interrupts
> >      1283           +25.2%       1607 =C2=B1 29%  interrupts.CPU127.CAL=
:Function_call_interrupts
> >     10568 =C2=B1 28%     +34.3%      14193 =C2=B1 15%  interrupts.CPU2.=
CAL:Function_call_interrupts
> >    985.00 =C2=B1 22%    +130.9%       2274 =C2=B1 42%  interrupts.CPU2.=
RES:Rescheduling_interrupts
> >    263.25 =C2=B1  4%     +24.5%     327.75 =C2=B1 20%  interrupts.CPU2.=
TLB:TLB_shootdowns
> >    312.00 =C2=B1 72%     -50.9%     153.25 =C2=B1 22%  interrupts.CPU20=
.NMI:Non-maskable_interrupts
> >    312.00 =C2=B1 72%     -50.9%     153.25 =C2=B1 22%  interrupts.CPU20=
.PMI:Performance_monitoring_interrupts
> >      4243 =C2=B1 10%     +45.5%       6172 =C2=B1  5%  interrupts.CPU22=
.CAL:Function_call_interrupts
> >      3434 =C2=B1 20%     +58.2%       5433 =C2=B1 35%  interrupts.CPU25=
.CAL:Function_call_interrupts
> >    491.25 =C2=B1 29%     -55.7%     217.75 =C2=B1 35%  interrupts.CPU27=
.NMI:Non-maskable_interrupts
> >    491.25 =C2=B1 29%     -55.7%     217.75 =C2=B1 35%  interrupts.CPU27=
.PMI:Performance_monitoring_interrupts
> >    390.50 =C2=B1 40%     -46.4%     209.50 =C2=B1  9%  interrupts.CPU29=
.RES:Rescheduling_interrupts
> >    189.50 =C2=B1 11%     +23.9%     234.75 =C2=B1  5%  interrupts.CPU3.=
TLB:TLB_shootdowns
> >    234.75 =C2=B1 32%     -39.8%     141.25 =C2=B1 29%  interrupts.CPU30=
.NMI:Non-maskable_interrupts
> >    234.75 =C2=B1 32%     -39.8%     141.25 =C2=B1 29%  interrupts.CPU30=
.PMI:Performance_monitoring_interrupts
> >    639.50 =C2=B1 65%     -53.0%     300.75 =C2=B1 26%  interrupts.CPU30=
.RES:Rescheduling_interrupts
> >    371.50 =C2=B1 24%     -32.5%     250.75 =C2=B1  8%  interrupts.CPU34=
.RES:Rescheduling_interrupts
> >    246.00 =C2=B1 23%     -32.5%     166.00 =C2=B1  7%  interrupts.CPU37=
.RES:Rescheduling_interrupts
> >    550.25 =C2=B1 11%     +91.9%       1055 =C2=B1 28%  interrupts.CPU4.=
RES:Rescheduling_interrupts
> >    165.75 =C2=B1 20%    +108.1%     345.00 =C2=B1 47%  interrupts.CPU47=
.NMI:Non-maskable_interrupts
> >    165.75 =C2=B1 20%    +108.1%     345.00 =C2=B1 47%  interrupts.CPU47=
.PMI:Performance_monitoring_interrupts
> >      2914 =C2=B1 10%     +50.3%       4380 =C2=B1 23%  interrupts.CPU48=
.CAL:Function_call_interrupts
> >      6123 =C2=B1  9%     +43.8%       8808 =C2=B1 18%  interrupts.CPU5.=
CAL:Function_call_interrupts
> >    146.25 =C2=B1 10%    +185.0%     416.75 =C2=B1 30%  interrupts.CPU5.=
NMI:Non-maskable_interrupts
> >    146.25 =C2=B1 10%    +185.0%     416.75 =C2=B1 30%  interrupts.CPU5.=
PMI:Performance_monitoring_interrupts
> >    477.50 =C2=B1 62%     -70.2%     142.50 =C2=B1 22%  interrupts.CPU6.=
NMI:Non-maskable_interrupts
> >    477.50 =C2=B1 62%     -70.2%     142.50 =C2=B1 22%  interrupts.CPU6.=
PMI:Performance_monitoring_interrupts
> >    580.00 =C2=B1 27%    +127.7%       1320 =C2=B1 42%  interrupts.CPU6.=
RES:Rescheduling_interrupts
> >    479.50 =C2=B1 35%     -56.8%     207.25 =C2=B1 62%  interrupts.CPU62=
.NMI:Non-maskable_interrupts
> >    479.50 =C2=B1 35%     -56.8%     207.25 =C2=B1 62%  interrupts.CPU62=
.PMI:Performance_monitoring_interrupts
> >      1816 =C2=B1 14%     +35.6%       2463 =C2=B1 29%  interrupts.CPU65=
.CAL:Function_call_interrupts
> >    142.25 =C2=B1100%     -66.3%      48.00 =C2=B1 10%  interrupts.CPU66=
.RES:Rescheduling_interrupts
> >    459.50 =C2=B1 10%     +42.2%     653.50 =C2=B1 16%  interrupts.CPU7.=
RES:Rescheduling_interrupts
> >      1282           +32.5%       1699 =C2=B1 27%  interrupts.CPU97.CAL:=
Function_call_interrupts
> >      1301 =C2=B1  2%     +26.9%       1650 =C2=B1 28%  interrupts.CPU98=
.CAL:Function_call_interrupts
> >     12.78 =C2=B1  2%      -1.9       10.92 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.ret_from_fork
> >     12.78 =C2=B1  2%      -1.9       10.92 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.kthread.ret_from_fork
> >      4.48 =C2=B1  6%      -1.6        2.90 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
> >      4.55 =C2=B1  6%      -1.6        2.98 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.worker_thread.kthread.ret_from_fork
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.write_cache_pages.generic_writepages.do_writepages.__write=
back_single_inode.writeback_sb_inodes
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.wb_workfn.process_one_work.worker_thread.kthread.ret_from_=
fork
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.wb_writeback.wb_workfn.process_one_work.worker_thread.kthr=
ead
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.__writeback_inodes_wb.wb_writeback.wb_workfn.process_one_w=
ork.worker_thread
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.writeback_sb_inodes.__writeback_inodes_wb.wb_writeback.wb_=
workfn.process_one_work
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.__writeback_single_inode.writeback_sb_inodes.__writeback_i=
nodes_wb.wb_writeback.wb_workfn
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.do_writepages.__writeback_single_inode.writeback_sb_inodes=
.__writeback_inodes_wb.wb_writeback
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.generic_writepages.do_writepages.__writeback_single_inode.=
writeback_sb_inodes.__writeback_inodes_wb
> >      3.07 =C2=B1  8%      -1.3        1.80 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.__writepage.write_cache_pages.generic_writepages.do_writep=
ages.__writeback_single_inode
> >      2.98 =C2=B1  8%      -1.2        1.75 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.__block_write_full_page.__writepage.write_cache_pages.gene=
ric_writepages.do_writepages
> >      2.06 =C2=B1  8%      -0.9        1.20 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.submit_bh_wbc.__block_write_full_page.__writepage.write_ca=
che_pages.generic_writepages
> >     14.52 =C2=B1  2%      -0.6       13.89        perf-profile.calltrac=
e.cycles-pp.shrink_dentry_list.prune_dcache_sb.super_cache_scan.do_shrink_s=
lab.shrink_slab
> >     16.80            -0.6       16.21        perf-profile.calltrace.cyc=
les-pp.prune_dcache_sb.super_cache_scan.do_shrink_slab.shrink_slab.drop_sla=
b_node
> >      1.34 =C2=B1  9%      -0.6        0.78 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.submit_bio.submit_bh_wbc.__block_write_full_page.__writepa=
ge.write_cache_pages
> >      1.29 =C2=B1 10%      -0.5        0.77 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.submit_bio_noacct.submit_bio.submit_bh_wbc.__block_write_f=
ull_page.__writepage
> >      0.94 =C2=B1  7%      -0.5        0.48 =C2=B1 59%  perf-profile.cal=
ltrace.cycles-pp.end_bio_bh_io_sync.blk_update_request.scsi_end_request.scs=
i_io_completion.blk_done_softirq
> >      1.23 =C2=B1  7%      -0.4        0.81 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.blk_done_softirq.__softirqentry_text_start.run_ksoftirqd.s=
mpboot_thread_fn.kthread
> >      1.21 =C2=B1  7%      -0.4        0.81 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.scsi_io_completion.blk_done_softirq.__softirqentry_text_st=
art.run_ksoftirqd.smpboot_thread_fn
> >      1.21 =C2=B1  7%      -0.4        0.81 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.scsi_end_request.scsi_io_completion.blk_done_softirq.__sof=
tirqentry_text_start.run_ksoftirqd
> >      1.17 =C2=B1  7%      -0.4        0.77 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.blk_update_request.scsi_end_request.scsi_io_completion.blk=
_done_softirq.__softirqentry_text_start
> >      2.99 =C2=B1  2%      -0.2        2.79 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__d_drop.__dentry_kill.shrink_dentry_list.prune_dcache_sb.=
super_cache_scan
> >      2.93 =C2=B1  2%      -0.2        2.73 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.___d_drop.__d_drop.__dentry_kill.shrink_dentry_list.prune_=
dcache_sb
> >      2.30            -0.1        2.18 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.shrink_lock_dentry.shrink_dentry_list.prune_dcache_sb.super_cac=
he_scan.do_shrink_slab
> >      1.18 =C2=B1  4%      -0.1        1.09 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.rcu_cblist_dequeue.rcu_do_batch.rcu_core.__softirqentry_te=
xt_start.run_ksoftirqd
> >      0.56 =C2=B1  6%      +0.1        0.70 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.__remove_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.__=
sysvec_apic_timer_interrupt.asm_call_sysvec_on_stack
> >      0.58 =C2=B1  4%      +0.1        0.73 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.ext4_discard_preallocations.ext4_clear_inode.ext4_evict_in=
ode.evict.dispose_list
> >      0.79 =C2=B1  4%      +0.2        0.95 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.rcu_sched_clock_irq.update_process_times.tick_sched_handle=
.tick_sched_timer.__hrtimer_run_queues
> >      5.57            +0.3        5.88 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.evict.dispose_list.prune_icache_sb.super_cache_scan.do_shrink_s=
lab
> >      7.17            +0.4        7.55 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.dispose_list.prune_icache_sb.super_cache_scan.do_shrink_slab.sh=
rink_slab
> >      8.87            +0.5        9.33 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.prune_icache_sb.super_cache_scan.do_shrink_slab.shrink_slab.dro=
p_slab_node
> >      5.66 =C2=B1  2%      +0.5        6.16 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__=
sysvec_apic_timer_interrupt.asm_call_sysvec_on_stack
> >      0.00            +0.6        0.57 =C2=B1  9%  perf-profile.calltrac=
e.cycles-pp.timerqueue_del.__remove_hrtimer.__hrtimer_run_queues.hrtimer_in=
terrupt.__sysvec_apic_timer_interrupt
> >      8.54 =C2=B1  2%      +0.9        9.47 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer=
_interrupt.asm_call_sysvec_on_stack.sysvec_apic_timer_interrupt
> >     26.26            +1.1       27.37 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_ent=
er.do_idle.cpu_startup_entry
> >     24.24 =C2=B1  2%      +1.1       25.38 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrup=
t.cpuidle_enter_state.cpuidle_enter.do_idle
> >     14.93 =C2=B1  2%      +1.3       16.23 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.__sysvec_apic_timer_interrupt.asm_call_sysvec_on_stack.sys=
vec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> >     14.28 =C2=B1  2%      +1.4       15.63 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.asm_call_s=
ysvec_on_stack.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> >     15.05 =C2=B1  2%      +1.4       16.42 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.asm_call_sysvec_on_stack.sysvec_apic_timer_interrupt.asm_s=
ysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> >     53.89 =C2=B1  2%      +2.1       56.02        perf-profile.calltrac=
e.cycles-pp.secondary_startup_64_no_verify
> >     53.09 =C2=B1  2%      +2.2       55.29        perf-profile.calltrac=
e.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_=
no_verify
> >     42.65 =C2=B1  2%      +2.2       44.86        perf-profile.calltrac=
e.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.sta=
rt_secondary
> >     43.61 =C2=B1  2%      +2.2       45.83        perf-profile.calltrac=
e.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.seconda=
ry_startup_64_no_verify
> >     53.16 =C2=B1  2%      +2.2       55.40        perf-profile.calltrac=
e.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
> >     53.16 =C2=B1  2%      +2.2       55.40        perf-profile.calltrac=
e.cycles-pp.start_secondary.secondary_startup_64_no_verify
> >     12.81 =C2=B1  2%      -1.9       10.94 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.ret_from_fork
> >     12.78 =C2=B1  2%      -1.9       10.92 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.kthread
> >      4.48 =C2=B1  6%      -1.6        2.90 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.process_one_work
> >      4.55 =C2=B1  6%      -1.6        2.98 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.worker_thread
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.wb_workfn
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.wb_writeback
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__writeback_inodes_wb
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.writeback_sb_inodes
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__writeback_single_inode
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.do_writepages
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.generic_writepages
> >      3.70 =C2=B1  7%      -1.5        2.19 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.write_cache_pages
> >      3.07 =C2=B1  8%      -1.3        1.80 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__writepage
> >      2.98 =C2=B1  8%      -1.2        1.75 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__block_write_full_page
> >      2.06 =C2=B1  8%      -0.9        1.20 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.submit_bh_wbc
> >      1.78 =C2=B1  6%      -0.6        1.13 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.blk_done_softirq
> >      1.76 =C2=B1  6%      -0.6        1.11 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.scsi_io_completion
> >      1.76 =C2=B1  6%      -0.6        1.11 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.scsi_end_request
> >     14.55 =C2=B1  2%      -0.6       13.92        perf-profile.children=
.cycles-pp.shrink_dentry_list
> >      1.68 =C2=B1  7%      -0.6        1.07 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.blk_update_request
> >     16.80            -0.6       16.21        perf-profile.children.cycl=
es-pp.prune_dcache_sb
> >      1.34 =C2=B1 10%      -0.6        0.78 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.submit_bio
> >      1.29 =C2=B1 10%      -0.5        0.77 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.submit_bio_noacct
> >      1.35 =C2=B1  7%      -0.5        0.84 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.end_bio_bh_io_sync
> >      0.97 =C2=B1  8%      -0.3        0.62 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.end_page_writeback
> >      0.79 =C2=B1  6%      -0.3        0.49 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.blk_mq_submit_bio
> >      0.67 =C2=B1 12%      -0.3        0.40 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.__test_set_page_writeback
> >      0.57 =C2=B1  8%      -0.2        0.35 =C2=B1 30%  perf-profile.chi=
ldren.cycles-pp.sysvec_call_function_single
> >      0.57 =C2=B1  8%      -0.2        0.35 =C2=B1 31%  perf-profile.chi=
ldren.cycles-pp.asm_sysvec_call_function_single
> >      3.01 =C2=B1  2%      -0.2        2.80 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__d_drop
> >      0.55 =C2=B1 10%      -0.2        0.34 =C2=B1 21%  perf-profile.chi=
ldren.cycles-pp.test_clear_page_writeback
> >      2.94 =C2=B1  2%      -0.2        2.75 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.___d_drop
> >      0.42 =C2=B1  8%      -0.2        0.23 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.bio_alloc_bioset
> >      0.40 =C2=B1 16%      -0.2        0.23 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.submit_bio_checks
> >      0.51 =C2=B1 12%      -0.2        0.36 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.kmem_cache_alloc
> >      0.32 =C2=B1 12%      -0.1        0.17 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.mempool_alloc
> >      0.32 =C2=B1  6%      -0.1        0.18 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.clear_page_dirty_for_io
> >      0.38 =C2=B1  8%      -0.1        0.25 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.rotate_reclaimable_page
> >      2.31            -0.1        2.19 =C2=B1  3%  perf-profile.children=
.cycles-pp.shrink_lock_dentry
> >      0.45 =C2=B1 11%      -0.1        0.33 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.try_to_wake_up
> >      0.28 =C2=B1 18%      -0.1        0.16 =C2=B1 27%  perf-profile.chi=
ldren.cycles-pp.end_buffer_async_write
> >      0.28 =C2=B1  7%      -0.1        0.18 =C2=B1 21%  perf-profile.chi=
ldren.cycles-pp.blk_attempt_plug_merge
> >      0.19 =C2=B1 15%      -0.1        0.09 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.percpu_counter_add_batch
> >      0.16 =C2=B1 16%      -0.1        0.08 =C2=B1 68%  perf-profile.chi=
ldren.cycles-pp.__slab_alloc
> >      0.29 =C2=B1 11%      -0.1        0.21 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.pagevec_lru_move_fn
> >      0.21 =C2=B1 21%      -0.1        0.13 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.open64
> >      0.28 =C2=B1 14%      -0.1        0.20 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.perf_trace_sched_wakeup_template
> >      0.15 =C2=B1 19%      -0.1        0.07 =C2=B1 71%  perf-profile.chi=
ldren.cycles-pp.fscrypt_drop_inode
> >      0.17 =C2=B1 13%      -0.1        0.10 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.bio_attempt_back_merge
> >      0.15 =C2=B1 15%      -0.1        0.07 =C2=B1 67%  perf-profile.chi=
ldren.cycles-pp.___slab_alloc
> >      0.24 =C2=B1 14%      -0.1        0.16 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.pagevec_move_tail_fn
> >      0.14 =C2=B1 21%      -0.1        0.07 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.blk_throtl_bio
> >      0.21 =C2=B1 14%      -0.1        0.15 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.blk_mq_dispatch_rq_list
> >      0.10 =C2=B1 14%      -0.1        0.04 =C2=B1101%  perf-profile.chi=
ldren.cycles-pp.allocate_slab
> >      0.12 =C2=B1 25%      -0.1        0.06 =C2=B1 26%  perf-profile.chi=
ldren.cycles-pp.__mod_lruvec_state
> >      0.20 =C2=B1 13%      -0.1        0.15 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.scsi_queue_rq
> >      0.10 =C2=B1 25%      -0.1        0.05 =C2=B1 62%  perf-profile.chi=
ldren.cycles-pp.__close_nocancel
> >      0.08 =C2=B1 15%      -0.1        0.03 =C2=B1100%  perf-profile.chi=
ldren.cycles-pp.__split_vma
> >      0.17 =C2=B1  8%      -0.1        0.12 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.can_stop_idle_tick
> >      0.15 =C2=B1 19%      -0.0        0.11 =C2=B1 28%  perf-profile.chi=
ldren.cycles-pp.get_page_from_freelist
> >      0.09 =C2=B1 20%      -0.0        0.05 =C2=B1 62%  perf-profile.chi=
ldren.cycles-pp.__vm_munmap
> >      0.15 =C2=B1 10%      -0.0        0.11 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.schedule_timeout
> >      0.14 =C2=B1 13%      -0.0        0.10 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.call_timer_fn
> >      0.09 =C2=B1 13%      -0.0        0.05 =C2=B1 58%  perf-profile.chi=
ldren.cycles-pp.enqueue_entity
> >      0.23 =C2=B1  7%      -0.0        0.20 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.rcu_segcblist_enqueue
> >      0.23 =C2=B1  6%      -0.0        0.20 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.rcu_gp_kthread
> >      0.17 =C2=B1  9%      -0.0        0.14 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.tick_nohz_idle_got_tick
> >      0.10 =C2=B1  8%      -0.0        0.08 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.enqueue_task_fair
> >      0.04 =C2=B1 60%      +0.0        0.08 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.rcu_irq_enter
> >      0.06 =C2=B1 11%      +0.0        0.10 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.arch_cpu_idle_exit
> >      0.14 =C2=B1  7%      +0.0        0.19 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.update_dl_rq_load_avg
> >      0.07 =C2=B1 58%      +0.1        0.12 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.delay_tsc
> >      0.44 =C2=B1  5%      +0.1        0.49 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.truncate_inode_pages_final
> >      0.18 =C2=B1 26%      +0.1        0.23 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.update_ts_time_stats
> >      0.00            +0.1        0.07 =C2=B1 17%  perf-profile.children=
.cycles-pp.perf_iterate_sb
> >      0.11 =C2=B1 17%      +0.1        0.19 =C2=B1 21%  perf-profile.chi=
ldren.cycles-pp.tick_program_event
> >      0.17 =C2=B1 17%      +0.1        0.24 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.cpuidle_not_available
> >      0.46 =C2=B1  6%      +0.1        0.54 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__x86_retpoline_rax
> >      0.02 =C2=B1173%      +0.1        0.11 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.cpuidle_get_cpu_driver
> >      0.80 =C2=B1  4%      +0.1        0.90 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp._raw_spin_unlock_irqrestore
> >      0.58 =C2=B1 10%      +0.1        0.71 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.enqueue_hrtimer
> >      1.74            +0.1        1.87 =C2=B1  4%  perf-profile.children=
.cycles-pp.__list_del_entry_valid
> >      0.45 =C2=B1 12%      +0.1        0.59 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.timerqueue_add
> >      0.59 =C2=B1  4%      +0.1        0.73 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.ext4_discard_preallocations
> >      0.87 =C2=B1  6%      +0.2        1.02 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.rcu_sched_clock_irq
> >      0.53 =C2=B1  6%      +0.2        0.71 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.timerqueue_del
> >      0.66 =C2=B1  9%      +0.2        0.84 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__remove_hrtimer
> >      0.26 =C2=B1 35%      +0.2        0.45 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.timekeeping_max_deferment
> >      7.18            +0.4        7.55 =C2=B1  2%  perf-profile.children=
.cycles-pp.dispose_list
> >      5.14            +0.4        5.53 =C2=B1  3%  perf-profile.children=
.cycles-pp.kmem_cache_free
> >      8.87            +0.5        9.33 =C2=B1  2%  perf-profile.children=
.cycles-pp.prune_icache_sb
> >     10.50 =C2=B1  2%      +1.7       12.19 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.__hrtimer_run_queues
> >     44.20 =C2=B1  2%      +2.1       46.30        perf-profile.children=
.cycles-pp.cpuidle_enter
> >     16.58 =C2=B1  2%      +2.1       18.70 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.hrtimer_interrupt
> >     53.89 =C2=B1  2%      +2.1       56.02        perf-profile.children=
.cycles-pp.secondary_startup_64_no_verify
> >     53.89 =C2=B1  2%      +2.1       56.02        perf-profile.children=
.cycles-pp.cpu_startup_entry
> >     53.89 =C2=B1  2%      +2.1       56.02        perf-profile.children=
.cycles-pp.do_idle
> >     44.06 =C2=B1  2%      +2.2       46.23        perf-profile.children=
.cycles-pp.cpuidle_enter_state
> >     28.19 =C2=B1  2%      +2.2       30.37 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.sysvec_apic_timer_interrupt
> >     17.26            +2.2       19.47 =C2=B1  7%  perf-profile.children=
.cycles-pp.__sysvec_apic_timer_interrupt
> >     53.16 =C2=B1  2%      +2.2       55.40        perf-profile.children=
.cycles-pp.start_secondary
> >     29.75 =C2=B1  2%      +2.3       32.02 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.asm_sysvec_apic_timer_interrupt
> >      2.56 =C2=B1  2%      -0.3        2.25 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.___d_drop
> >      0.77 =C2=B1  6%      -0.2        0.59 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.tick_nohz_next_event
> >      0.12 =C2=B1 23%      -0.1        0.04 =C2=B1101%  perf-profile.sel=
f.cycles-pp.fscrypt_drop_inode
> >      0.16 =C2=B1 10%      -0.1        0.08 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.percpu_counter_add_batch
> >      0.15 =C2=B1 22%      -0.1        0.09 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.__test_set_page_writeback
> >      0.09 =C2=B1 14%      -0.1        0.03 =C2=B1100%  perf-profile.sel=
f.cycles-pp.clear_page_dirty_for_io
> >      0.17 =C2=B1  8%      -0.1        0.11 =C2=B1 21%  perf-profile.sel=
f.cycles-pp.__block_write_full_page
> >      0.19 =C2=B1 21%      -0.1        0.13 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.kmem_cache_alloc
> >      0.19 =C2=B1  5%      -0.1        0.14 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.cpuidle_governor_latency_req
> >      0.12 =C2=B1  7%      -0.1        0.07 =C2=B1 62%  perf-profile.sel=
f.cycles-pp.cpuidle_enter
> >      0.10 =C2=B1 14%      -0.1        0.05 =C2=B1 60%  perf-profile.sel=
f.cycles-pp.end_bio_bh_io_sync
> >      0.17 =C2=B1  8%      -0.1        0.12 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.can_stop_idle_tick
> >      0.23 =C2=B1  7%      -0.0        0.19 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.rcu_segcblist_enqueue
> >      0.08 =C2=B1 23%      -0.0        0.04 =C2=B1 63%  perf-profile.sel=
f.cycles-pp.find_get_pages_range_tag
> >      0.08 =C2=B1  6%      -0.0        0.04 =C2=B1 59%  perf-profile.sel=
f.cycles-pp.__d_drop
> >      0.09 =C2=B1 13%      +0.0        0.12 =C2=B1 15%  perf-profile.sel=
f.cycles-pp.__x86_indirect_thunk_rax
> >      0.10 =C2=B1 10%      +0.0        0.14 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.tick_sched_handle
> >      0.36 =C2=B1  5%      +0.0        0.40 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.__x86_retpoline_rax
> >      0.09 =C2=B1 27%      +0.0        0.13 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.tick_nohz_tick_stopped
> >      0.16 =C2=B1  7%      +0.1        0.21 =C2=B1 16%  perf-profile.sel=
f.cycles-pp.timerqueue_del
> >      0.07 =C2=B1 58%      +0.1        0.12 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.delay_tsc
> >      0.01 =C2=B1173%      +0.1        0.07 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.arch_cpu_idle_exit
> >      0.18 =C2=B1 10%      +0.1        0.23 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.update_blocked_averages
> >      0.13 =C2=B1  8%      +0.1        0.19 =C2=B1 16%  perf-profile.sel=
f.cycles-pp.update_dl_rq_load_avg
> >      0.11 =C2=B1 15%      +0.1        0.18 =C2=B1 22%  perf-profile.sel=
f.cycles-pp.tick_program_event
> >      0.00            +0.1        0.07 =C2=B1 17%  perf-profile.self.cyc=
les-pp.rcu_irq_enter
> >      0.19 =C2=B1  5%      +0.1        0.26 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.__hrtimer_get_next_event
> >      0.10 =C2=B1 27%      +0.1        0.17 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.update_ts_time_stats
> >      0.27 =C2=B1  6%      +0.1        0.34 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.__sysvec_apic_timer_interrupt
> >      0.16 =C2=B1 19%      +0.1        0.24 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.cpuidle_not_available
> >      0.40 =C2=B1  6%      +0.1        0.48 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.ext4_discard_preallocations
> >      0.02 =C2=B1173%      +0.1        0.10 =C2=B1 22%  perf-profile.sel=
f.cycles-pp.cpuidle_get_cpu_driver
> >      0.33 =C2=B1 11%      +0.1        0.42 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.rb_erase
> >      0.20 =C2=B1 16%      +0.1        0.29 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.timerqueue_add
> >      0.18 =C2=B1  8%      +0.1        0.28 =C2=B1 18%  perf-profile.sel=
f.cycles-pp.irq_exit_rcu
> >      0.71 =C2=B1  5%      +0.1        0.84 =C2=B1  2%  perf-profile.sel=
f.cycles-pp._raw_spin_unlock_irqrestore
> >      0.67 =C2=B1  8%      +0.2        0.84 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.rcu_sched_clock_irq
> >      0.25 =C2=B1 36%      +0.2        0.45 =C2=B1 18%  perf-profile.sel=
f.cycles-pp.timekeeping_max_deferment
> > =

> > =

> > =

> >                 fxmark.hdd_ext4_no_jnl_MWCL_2_bufferedio.works_sec
> > =

> >  23000 +---------------------------------------------------------------=
----+
> >        |.+..+      +..+.+.+..+.+..+.+..+.+.+..+.+..+.+..+.+.+..+.+..+.+=
..+.|
> >  22500 |-+                                                             =
    |
> >  22000 |-+                                                             =
    |
> >        |                                                               =
    |
> >  21500 |-+                                                             =
    |
> >        |           O  O           O        O  O      O  O        O     =
    |
> >  21000 |-+              O    O O    O  O O      O  O      O O  O       =
    |
> >        |                  O                                            =
    |
> >  20500 |-+                                                             =
    |
> >  20000 |-+                                                             =
    |
> >        |                                                               =
    |
> >  19500 |-+  O    O                                                     =
    |
> >        | O    O                                                        =
    |
> >  19000 +---------------------------------------------------------------=
----+
> > =

> > =

> >                fxmark.hdd_ext4_no_jnl_MWCL_2_bufferedio.iowait_sec
> > =

> >  2.5 +-----------------------------------------------------------------=
----+
> >      |                         O                                       =
    |
> >      |       O            O O            O          O            O     =
    |
> >    2 |-+                               O         O         O           =
    |
> >      |  O                         O O                         O    O   =
    |
> >      |         O  O  O O                    O O       O  O             =
    |
> >  1.5 |-+  O                                                            =
    |
> >      |                                                                 =
    |
> >    1 |-+                                                               =
    |
> >      |                                                                 =
    |
> >      |                                                                 =
    |
> >  0.5 |-+                                                               =
    |
> >      |                                                                 =
    |
> >      |                                                                 =
    |
> >    0 +-----------------------------------------------------------------=
----+
> > =

> > =

> >               fxmark.hdd_ext4_no_jnl_MWCL_2_bufferedio.iowait_util
> > =

> >    4 +-----------------------------------------------------------------=
----+
> >      |                    O O  O                                 O     =
    |
> >  3.5 |-+     O                         O O       O  O      O           =
    |
> >    3 |-+                                                               =
    |
> >      |  O            O            O O                         O    O   =
    |
> >  2.5 |-+  O    O  O    O                    O O       O  O             =
    |
> >      |                                                                 =
    |
> >    2 |-+                                                               =
    |
> >      |                                                                 =
    |
> >  1.5 |-+                                                               =
    |
> >    1 |-+                                                               =
    |
> >      |                                                                 =
    |
> >  0.5 |-+                                                               =
    |
> >      |                                                                 =
    |
> >    0 +-----------------------------------------------------------------=
----+
> > =

> > =

> >                   fxmark.hdd_ext4_no_jnl_MWCL_1_bufferedio.works
> > =

> >  320000 +--------------------------------------------------------------=
----+
> >         |. .. +  .+.+.+..    .+.+.+..+.+..+.+.+..+.+.+..+.  .+.+.+..+.+=
..+.|
> >  310000 |-+    +.        +.+.                             +.           =
    |
> >         |                                                              =
    |
> >  300000 |-+                                                            =
    |
> >         |                                                              =
    |
> >  290000 |-+              O        O           O         O              =
    |
> >         |           O O    O  O O      O  O O    O O O    O  O   O     =
    |
> >  280000 |-+                          O                         O       =
    |
> >         |                                                              =
    |
> >  270000 |-+                                                            =
    |
> >         |    O                                                         =
    |
> >  260000 |-O    O  O                                                    =
    |
> >         |                                                              =
    |
> >  250000 +--------------------------------------------------------------=
----+
> > =

> > =

> >                 fxmark.hdd_ext4_no_jnl_MWCL_1_bufferedio.works_sec
> > =

> >  10800 +---------------------------------------------------------------=
----+
> >  10600 |-+  +        .+                           .+.  .+   +..        =
    |
> >        |. .. +  .+.+.  + .+..+.+..+.+..+.+.+..+.+.   +.  + +   +.+..+.+=
..+.|
> >  10400 |-+    +.        +                                 +            =
    |
> >  10200 |-+                                                             =
    |
> >  10000 |-+                                                             =
    |
> >   9800 |-+                                                             =
    |
> >        |                O         O                                    =
    |
> >   9600 |-+                   O           O O  O    O O  O O O    O     =
    |
> >   9400 |-+         O  O   O    O    O  O        O              O       =
    |
> >   9200 |-+                                                             =
    |
> >   9000 |-+                                                             =
    |
> >        |                                                               =
    |
> >   8800 |-O  O O                                                        =
    |
> >   8600 +---------------------------------------------------------------=
----+
> > =

> > =

> > [*] bisect-good sample
> > [O] bisect-bad  sample
> > =

> > =

> > =

> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are pr=
ovided
> > for informational purposes only. Any difference in system hardware or s=
oftware
> > design or configuration may affect actual performance.
> > =

> > =

> > Thanks,
> > Oliver Sang
> > =

> > <config-5.11.0-rc6-00009-gef4eebad9c01><job-script.txt><job.yaml><repro=
duce.txt>
> =

> =

> Cheers, Andreas
> =

> =

> =

> =

> =



--===============5140423124308256852==--

