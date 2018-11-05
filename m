Content-Type: multipart/mixed; boundary="===============2195530421319280434=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm] 9bc8039e71: will-it-scale.per_thread_ops -64.1% regression
Date: Mon, 05 Nov 2018 21:09:24 +0100
Message-ID: <f901e346-6203-371d-a39a-ed9231187570@suse.cz>
In-Reply-To: <CAHk-=wi8BNNTp+Xt4ROz1TqGgFT-c6-Hmmc9yW0B6p2FTFwJTg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2195530421319280434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/5/18 6:50 PM, Linus Torvalds wrote:
> On Sun, Nov 4, 2018 at 9:08 PM kernel test robot <rong.a.chen@intel.com=
> wrote:
>>
>> FYI, we noticed a -64.1% regression of will-it-scale.per_thread_ops
>> due to commit 9bc8039e715d ("mm: brk: downgrade mmap_sem to read when
>> shrinking")
> =

> Ugh. That looks pretty bad.
> =

>> in testcase: will-it-scale
>> on test machine: 8 threads Ivy Bridge with 16G memory
>> with following parameters:
>>
>>         nr_task: 100%
>>         mode: thread
>>         test: brk1
>>         ucode: 0x20
>>         cpufreq_governor: performance
> =

> The reason seems to be way more scheduler time due to lots more
> context switches:
> =

>>   34925294 =C2=B1 18%    +270.3%  1.293e+08 =C2=B1  4%  will-it-scale.ti=
me.voluntary_context_switches

And what about this:

      0.83 =C2=B1 27%     +25.9       26.75 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.star=
t_secondary
      1.09 =C2=B1 32%     +30.9       31.97 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_secondary=
.secondary_startup_64
      1.62 =C2=B1 36%     +44.4       46.01 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
      1.63 =C2=B1 36%     +44.5       46.18 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
      1.63 =C2=B1 36%     +44.6       46.21 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.start_secondary.secondary_startup_64
      1.73 =C2=B1 29%     +51.1       52.86 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.secondary_startup_64

And the graphs showing less user/kernel time and less "percent_of_cpu_this_=
job_got"...

I didn't spot an obvious mistake in the patch itself, so it looks
like some bad interaction between scheduler and the mmap downgrade?
 =

> Yang Shi, would you mind taking a look at what's going on?
> =

>               Linus
> =



--===============2195530421319280434==--

