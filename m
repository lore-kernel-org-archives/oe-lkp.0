Content-Type: multipart/mixed; boundary="===============4956886440762031702=="
MIME-Version: 1.0
From: Chen Yu <yu.chen.surf@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched/pelt] 2d02fa8cc2: stress-ng.pipeherd.ops_per_sec -9.7% regression
Date: Thu, 31 Mar 2022 22:19:30 +0800
Message-ID: <CADjb_WT0fcP2QBjYpsCAJEcVYWKNw1rQ6XZNz33i+KCbD8jB-A@mail.gmail.com>
In-Reply-To: <20220204141941.GE4077@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4956886440762031702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

On Wed, Feb 9, 2022 at 1:17 PM kernel test robot <oliver.sang@intel.com> =
wrote:
>
>
>
> Greeting,
>
> FYI, we noticed a -9.7% regression of stress-ng.pipeherd.ops_per_sec due =
to commit:
>
>
> commit: 2d02fa8cc21a93da35cfba462bf8ab87bf2db651 ("sched/pelt: Relax the =
sync of load_sum with load_avg")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: stress-ng
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU=
 @ 2.60GHz with 128G memory
> with following parameters:
>
>         nr_threads: 100%
>         testtime: 60s
>         class: memory
>         test: pipeherd
>         cpufreq_governor: performance
>         ucode: 0xd000280
>
This week we have re-run the test result and it seems that this
regression is still there.
As we are evaluating whether this report is valid or if the
downgrading is expected, appreciated
if you could give suggestion on further steps:

1.  If I understand correctly,
2d02fa8cc21a93da35cfba462bf8ab87bf2db651 ("sched/pelt: Relax the sync
of load_sum with load_avg")
     fixed the calculating of  load_sum.  Before this patch  the
contribution part would be 'skipped' and caused the load_sum
     to be lower than expected.
2. If above is true, after this patch, the load_sum becomes higher. Is
there a scenario that higher load_sum added to 1 cfs_rq brings
    more imbalance between this group and other sched_group, thus
brings more task migration/wake up? (because in below perf result,
    it seems that, with this patch applied, there are slightly more
take wake up)
3.  Consider the 9.7% downgrading is not that high,  do you think if
lkp team should continue track this issue or just close it
    as documented?

Best,
Yu
>
> commit:
>   95246d1ec8 ("sched/pelt: Relax the sync of runnable_sum with runnable_a=
vg")
>   2d02fa8cc2 ("sched/pelt: Relax the sync of load_sum with load_avg")
>
> 95246d1ec80b8d19 2d02fa8cc21a93da35cfba462bf
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       0.21           +11.0%       0.24 =C4=85  2%  stress-ng.pipeherd.con=
text_switches_per_bogo_op
>  3.869e+09            -9.7%  3.494e+09        stress-ng.pipeherd.ops
>   64412021            -9.7%   58171101        stress-ng.pipeherd.ops_per_=
sec
>     442.37            -7.2%     410.54        stress-ng.time.user_time
>       5.49 =C4=85  2%      -0.5        4.94 =C4=85  4%  mpstat.cpu.all.us=
r%
>      80705 =C4=85  7%     +26.7%     102266 =C4=85 17%  numa-meminfo.node=
1.Active
>      80705 =C4=85  7%     +26.7%     102266 =C4=85 17%  numa-meminfo.node=
1.Active(anon)
>      12324 =C4=85  3%     -22.1%       9603 =C4=85 25%  softirqs.CPU106.R=
CU
>      12703 =C4=85  4%     -23.1%       9769 =C4=85 24%  softirqs.CPU27.RCU
>      15.96            +1.0       16.95        perf-profile.calltrace.cycl=
es-pp.prepare_to_wait_event.pipe_read.new_sync_read.vfs_read.ksys_read
>       6.67            +1.0        7.68 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autoremove_wak=
e_function.__wake_up_common
>       6.77            +1.0        7.79 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_=
up_common.__wake_up_common_lock
>      14.46            +1.0       15.48 =C4=85  2%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_event.pipe_read.new_sync_=
read.vfs_read
>      13.73            +1.1       14.79 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_=
to_wait_event.pipe_read.new_sync_read
>      26.95            +1.4       28.34        perf-profile.calltrace.cycl=
es-pp.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write.ksys_write
>      25.85            +1.5       27.32        perf-profile.calltrace.cycl=
es-pp.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_write.vfs_=
write
>      25.18            +1.5       26.69        perf-profile.calltrace.cycl=
es-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_=
write.new_sync_write
>      24.61            +1.5       26.14        perf-profile.calltrace.cycl=
es-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_co=
mmon_lock.pipe_write
--===============4956886440762031702==--

