Content-Type: multipart/mixed; boundary="===============1566837686098491697=="
MIME-Version: 1.0
From: Vladimir Davydov <vdavydov@parallels.com>
To: lkp@lists.01.org
Subject: Re: [tip:sched/core] sched/balancing: Fix cfs_rq-> task_h_load calculation
Date: Mon, 30 Sep 2013 12:14:03 +0400
Message-ID: <524932CB.6040904@parallels.com>
In-Reply-To: <20130929094714.GM24743@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1566837686098491697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/29/2013 01:47 PM, Yuanhan Liu wrote:
> On Fri, Sep 20, 2013 at 06:46:59AM -0700, tip-bot for Vladimir Davydov wr=
ote:
>> Commit-ID:  7e3115ef5149fc502e3a2e80719dba54a8e7409d
>> Gitweb:http://git.kernel.org/tip/7e3115ef5149fc502e3a2e80719dba54a8e7409d
>> Author:     Vladimir Davydov<vdavydov@parallels.com>
>> AuthorDate: Sat, 14 Sep 2013 19:39:46 +0400
>> Committer:  Ingo Molnar<mingo@kernel.org>
>> CommitDate: Fri, 20 Sep 2013 11:59:39 +0200
>>
>> sched/balancing: Fix cfs_rq->task_h_load calculation
>>
>> Patch a003a2 (sched: Consider runnable load average in move_tasks())
>> sets all top-level cfs_rqs' h_load to rq->avg.load_avg_contrib, which is
>> always 0. This mistype leads to all tasks having weight 0 when load
>> balancing in a cpu-cgroup enabled setup. There obviously should be sum
>> of weights of all runnable tasks there instead. Fix it.
> Hi Vladimir,
>
> FYI, Here we found a 17% netperf regression by this patch. Here are some
> changed stats between this commit 7e3115ef5149fc502e3a2e80719dba54a8e7409d
> and it's parent(3029ede39373c368f402a76896600d85a4f7121b)

Hello,

Could you please report the following info:

1) the test machine cpu topology (i.e. output of =

/sys/devices/system/cpu/cpu*/{thread_siblings_list,core_siblings_list})
2) kernel config you used during the test
3) the output of /sys/kernel/debug/sched_features (debugfs mounted).
4) netperf server/client options
5) did you place netserver into a separate cpu cgroup?

Thanks.

--===============1566837686098491697==--

