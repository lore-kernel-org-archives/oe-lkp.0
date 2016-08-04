Content-Type: multipart/mixed; boundary="===============4156983813165005889=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] e210bffd39: perf-stat.cpu-migrations -36.0% decrease
Date: Thu, 04 Aug 2016 21:57:59 +0800
Message-ID: <20160804135759.GA9114@yexl-desktop>
In-Reply-To: <20160804090124.GK6879@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4156983813165005889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/04, Peter Zijlstra wrote:
>On Thu, Aug 04, 2016 at 01:24:23PM +0800, kernel test robot wrote:
>> =

>> FYI, we noticed perf-stat.cpu-migrations -36.0% decrease due to commit:
>> =

>> commit e210bffd39d01b649c94b820c28ff112673266dd ("sched/fair: Fix and op=
timize the fork() path")
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> =

>> in testcase: unixbench
>> on test machine: 16 threads Broadwell-DE with 8G memory
>> with following parameters:
>> =

>> 	runtime: 300s
>> 	nr_task: 1
>> 	test: shell8
>> 	cpufreq_governor: performance
>> =

>> =

>
>Urgh, I so hate these reports. They're near useless :/
>
>It took me 3 readings to realize it was the unixbench testcase (why
>isn't that in the subject!?). But then I still haven't found the primary

Will add test name in subject in later performance reports.

>performance metric. Does the test improve, degrade or not change
>overall?
>
Sorry, I should have described it more clearly, the primary performance
metric of unixbench is not changed, while perf-stat.cpu-migrations has a
-36.0% decrease which should improve cache locality.

We'd expect such stats changes report would help the developer to
evaluate impacts of his patch, anyway, we'll make it more clear that
it's just a FYI report, not some regression report. =


Thanks,
Xiaolong

>

--===============4156983813165005889==--

