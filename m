Content-Type: multipart/mixed; boundary="===============4893808810718688753=="
MIME-Version: 1.0
From: Dave Chinner <dchinner@redhat.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 6df693ed7b: aim7.jobs-per-min -15.7% regression
Date: Sun, 15 Aug 2021 09:28:35 +1000
Message-ID: <20210814232835.GD2959@rh>
In-Reply-To: <20210809064248.GB5761@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4893808810718688753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 02:42:48PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -15.7% regression of aim7.jobs-per-min due to commit:
> =

> =

> commit: 6df693ed7ba9ec03cafc38d5064de376a11243e2 ("xfs: per-cpu deferred =
inode inactivation queues")
> https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git xfs-5.1=
5-merge
> =

> =

> in testcase: aim7
> on test machine: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2=
.10GHz with 128G memory
> with following parameters:
> =

> 	disk: 4BRD_12G
> 	md: RAID1
> 	fs: xfs
> 	test: disk_wrt
> 	load: 3000
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> test-description: AIM7 is a traditional UNIX system level benchmark suite=
 which is used to test and measure the performance of multiuser system.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/

.....

> commit: =

>   52cba078c8 ("xfs: detach dquots from inode if we don't need to inactiva=
te it")
>   6df693ed7b ("xfs: per-cpu deferred inode inactivation queues")
> =

> 52cba078c8b4b003 6df693ed7ba9ec03cafc38d5064 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     539418           -15.7%     454630        aim7.jobs-per-min
>      33.57           +18.5%      39.79        aim7.time.elapsed_time
>      33.57           +18.5%      39.79        aim7.time.elapsed_time.max
>       2056 =C2=B1  7%    +779.6%      18087 =C2=B1  2%  aim7.time.involun=
tary_context_switches
>     673.92 =C2=B1  4%     +29.2%     870.54 =C2=B1  2%  aim7.time.system_=
time
>     912022           -34.2%     599694        aim7.time.voluntary_context=
_switches

OK, performance went down, system time went up massively. I'm
betting the improvement made something else fast enough to trigger
spinning lock breakdown somewhere in the kernel...

>       0.01 =C2=B1223%      +0.9        0.93 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       0.01 =C2=B1223%      +0.9        0.93 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.kthread
>      67.40 =C2=B1  5%      +8.7       76.14 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>      67.02 =C2=B1  5%      +8.8       75.81 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>       2.02 =C2=B1  3%     +15.4       17.42 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.creat64
>       1.99 =C2=B1  4%     +15.4       17.40 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.do_sys_open
>       1.99 =C2=B1  3%     +15.4       17.40 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.do_sys_openat2
>       1.96 =C2=B1  4%     +15.4       17.38 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.path_openat
>       1.96 =C2=B1  3%     +15.4       17.38 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.do_filp_open
>       2.23 =C2=B1  6%     +15.6       17.82 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.unlink
>       2.18 =C2=B1  6%     +15.6       17.78 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.do_unlinkat
>       0.66 =C2=B1 19%     +30.7       31.40 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.osq_lock
>       2.34 =C2=B1  8%     +31.0       33.33 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.rwsem_down_write_slowpath

Well, looky there. Lots of new rwsem lock contention.

....

>       1.54 =C2=B1  3%      +0.2        1.74        perf-profile.self.cycl=
es-pp.rwsem_spin_on_owner
>       0.66 =C2=B1 19%     +30.6       31.21 =C2=B1  2%  perf-profile.self=
.cycles-pp.osq_lock

Yup, we now have catastrophic spin-on-onwer breakdown of a rwsem.

IOWs, what this commit has done is put pressure on a rwsem in a
different way, and on this specific machine configuration on this
specific workload, it results in the rwsem breaking down into
catastrophic spin-on-owner contention. This looks like a rwsem bug,
not a bug in the XFS code.

Given that this is showing up in the open and unlink paths, this
is likely the parent directory inode lock being contended due to
concurrent modifications in the same directory.

That correlates with the change that the deferred inactivation
brings to unlink worklaods - the unlink() syscall does about a third
of the work it used to, so results in locking the directory inode
*much* more frequently with only very short pauses in userspace to
make the next unlink() call.

Because of the way the worker threads are CPU bound and all the XFS
objects involved in repeated directory ops will stay CPU affine, the
unlink() syscall is likely to run hot and not block until the queue
limits are hit and it is forced to throttle and let the worker run
to drain the queue.

Now, rwsems are *supposed to be sleeping locks*. In which case, we
should switch away on contention and let the CPU be used for some
other useful work until we are granted the lock. But, no, spinning
on exclusive locks makes some other benchmark go faster, so now on
this benchmark burn *30% of 88 CPUs* spinning on rwsems across this
benchmark.

So this regression is caused by an rwsem bug. XFS is, as usual, just
the messenger for iproblems arising from the misbehaviour of rwsems.

Try turning off rwsem spin-on-owner behaviour and see what
difference that makes to performance...

Cheers,

Dave.

-- =

Dave Chinner
dchinner(a)redhat.com

--===============4893808810718688753==--

