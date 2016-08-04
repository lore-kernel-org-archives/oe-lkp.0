Content-Type: multipart/mixed; boundary="===============7917934916336272345=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] e210bffd39: perf-stat.cpu-migrations -36.0% decrease
Date: Thu, 04 Aug 2016 11:01:24 +0200
Message-ID: <20160804090124.GK6879@twins.programming.kicks-ass.net>
In-Reply-To: <20160804052423.GA26201@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7917934916336272345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2016 at 01:24:23PM +0800, kernel test robot wrote:
> =

> FYI, we noticed perf-stat.cpu-migrations -36.0% decrease due to commit:
> =

> commit e210bffd39d01b649c94b820c28ff112673266dd ("sched/fair: Fix and opt=
imize the fork() path")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: unixbench
> on test machine: 16 threads Broadwell-DE with 8G memory
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 1
> 	test: shell8
> 	cpufreq_governor: performance
> =

> =


Urgh, I so hate these reports. They're near useless :/

It took me 3 readings to realize it was the unixbench testcase (why
isn't that in the subject!?). But then I still haven't found the primary
performance metric. Does the test improve, degrade or not change
overall?



--===============7917934916336272345==--

