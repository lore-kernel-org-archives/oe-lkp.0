Content-Type: multipart/mixed; boundary="===============3720551080524930240=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] e210bffd39: perf-stat.cpu-migrations -36.0% decrease
Date: Thu, 04 Aug 2016 11:05:07 +0200
Message-ID: <CAKfTPtCXf7ZJw2SH-3ogxJf4bOcnZj3i0hH4cHu_jmeEBdbV2Q@mail.gmail.com>
In-Reply-To: <20160804090124.GK6879@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3720551080524930240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4 August 2016 at 11:01, Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Aug 04, 2016 at 01:24:23PM +0800, kernel test robot wrote:
>>
>> FYI, we noticed perf-stat.cpu-migrations -36.0% decrease due to commit:
>>
>> commit e210bffd39d01b649c94b820c28ff112673266dd ("sched/fair: Fix and op=
timize the fork() path")
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: unixbench
>> on test machine: 16 threads Broadwell-DE with 8G memory
>> with following parameters:
>>
>>       runtime: 300s
>>       nr_task: 1
>>       test: shell8
>>       cpufreq_governor: performance
>>
>>
>
> Urgh, I so hate these reports. They're near useless :/
>
> It took me 3 readings to realize it was the unixbench testcase (why
> isn't that in the subject!?). But then I still haven't found the primary
> performance metric. Does the test improve, degrade or not change
> overall?

Yes, i have the same question

>
>

--===============3720551080524930240==--

