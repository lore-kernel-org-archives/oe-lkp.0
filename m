Content-Type: multipart/mixed; boundary="===============2591244582779118643=="
MIME-Version: 1.0
From: Paul Turner <pjt@google.com>
To: lkp@lists.01.org
Subject: Re: [tip:sched/core] sched/balancing: Fix cfs_rq-> task_h_load calculation
Date: Mon, 30 Sep 2013 19:32:15 -0700
Message-ID: <CAPM31RK+Pj1tUO4Do3gU_Qe2m4SS=A4kSo_6Jto16+s9=-hQbA@mail.gmail.com>
In-Reply-To: <20131001022238.GN24743@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2591244582779118643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2013 at 7:22 PM, Yuanhan Liu
<yuanhan.liu@linux.intel.com> wrote:
> On Mon, Sep 30, 2013 at 12:14:03PM +0400, Vladimir Davydov wrote:
>> On 09/29/2013 01:47 PM, Yuanhan Liu wrote:
>> >On Fri, Sep 20, 2013 at 06:46:59AM -0700, tip-bot for Vladimir Davydov =
wrote:
>> >>Commit-ID:  7e3115ef5149fc502e3a2e80719dba54a8e7409d
>> >>Gitweb:http://git.kernel.org/tip/7e3115ef5149fc502e3a2e80719dba54a8e74=
09d
>> >>Author:     Vladimir Davydov<vdavydov@parallels.com>
>> >>AuthorDate: Sat, 14 Sep 2013 19:39:46 +0400
>> >>Committer:  Ingo Molnar<mingo@kernel.org>
>> >>CommitDate: Fri, 20 Sep 2013 11:59:39 +0200
>> >>
>> >>sched/balancing: Fix cfs_rq->task_h_load calculation
>> >>
>> >>Patch a003a2 (sched: Consider runnable load average in move_tasks())
>> >>sets all top-level cfs_rqs' h_load to rq->avg.load_avg_contrib, which =
is
>> >>always 0. This mistype leads to all tasks having weight 0 when load
>> >>balancing in a cpu-cgroup enabled setup. There obviously should be sum
>> >>of weights of all runnable tasks there instead. Fix it.
>> >Hi Vladimir,
>> >
>> >FYI, Here we found a 17% netperf regression by this patch. Here are some
>> >changed stats between this commit 7e3115ef5149fc502e3a2e80719dba54a8e74=
09d
>> >and it's parent(3029ede39373c368f402a76896600d85a4f7121b)
>>
>> Hello,
>>
>> Could you please report the following info:
>
> Hi Vladimir,
>
> This regression was first found at a 2-core 32 CPU Sandybridge server
> with 64G memory. However, I can't ssh to it now and we are off work
> this week due to holiday. So, sorry, email response may be delayed.
>
> Then I found this regression exists at another atom micro server as
> well. And the following machine and testcase specific info are all from i=
t.
>
> And to not make old data confuse you, here I also update the changed
> stats and corresponding text plot as well in attachment.
>>
>> 1) the test machine cpu topology (i.e. output of /sys/devices/system/cpu=
/cpu*/{thread_siblings_list,core_siblings_list})
>
> # grep . /sys/devices/system/cpu/cpu*/topology/{thread_siblings_list,core=
_siblings_list}
> /sys/devices/system/cpu/cpu0/topology/thread_siblings_list:0-1
> /sys/devices/system/cpu/cpu1/topology/thread_siblings_list:0-1
> /sys/devices/system/cpu/cpu2/topology/thread_siblings_list:2-3
> /sys/devices/system/cpu/cpu3/topology/thread_siblings_list:2-3
> /sys/devices/system/cpu/cpu0/topology/core_siblings_list:0-3
> /sys/devices/system/cpu/cpu1/topology/core_siblings_list:0-3
> /sys/devices/system/cpu/cpu2/topology/core_siblings_list:0-3
> /sys/devices/system/cpu/cpu3/topology/core_siblings_list:0-3
>

>> 2) kernel config you used during the test
>
> Attached.
>
>> 3) the output of /sys/kernel/debug/sched_features (debugfs mounted).
>
> # cat /sys/kernel/debug/sched_features
> GENTLE_FAIR_SLEEPERS START_DEBIT NO_NEXT_BUDDY LAST_BUDDY CACHE_HOT_BUDDY
> WAKEUP_PREEMPTION ARCH_POWER NO_HRTICK NO_DOUBLE_TICK LB_BIAS NONTASK_POW=
ER
> TTWU_QUEUE NO_FORCE_SD_OVERLAP RT_RUNTIME_SHARE NO_LB_MIN NO_NUMA NO_NUMA=
_FORCE
>
>> 4) netperf server/client options
>
> Here is our testscript we used:
>     #!/bin/bash
>     # - test
>
>     # start netserver
>     netserver
>
>     sleep 1
>
>     for i in $(seq $nr_threads)
>     do
>             netperf -t $test -c -C -l $runtime &
>     done
>
> Where,
>   $test is TCP_SENDFILE,
>   $nr_threads is 8, two times of nr cpu
>   $runtime is 120s
>
>> 5) did you place netserver into a separate cpu cgroup?
>
> Nope.
>


If this is causing a regression I think it actually calls into
question the original series that included a003a25b227d59d.  This
patch only makes h_load not be a nonsense value.

--===============2591244582779118643==--

