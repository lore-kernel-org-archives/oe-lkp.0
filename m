Content-Type: multipart/mixed; boundary="===============6392486640228849090=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mutex] 871a6bb4916: -1.8% will-it-scale.per_process_ops, -98.3% will-it-scale.time.voluntary_context_switches, +209.6% will-it-scale.time.involuntary_context_switches
Date: Mon, 16 Feb 2015 16:17:51 +0100
Message-ID: <20150216151751.GE5029@twins.programming.kicks-ass.net>
In-Reply-To: <1423986414.5538.8.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6392486640228849090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2015 at 03:46:54PM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/co=
re
> commit 871a6bb4916fef3123b6ff749b0dc82680fb0d2a ("mutex: In mutex_spin_on=
_owner(), return true when owner changes")
> =

> =

> testbox/testcase/testparams: wsm/will-it-scale/performance-writeseek3
> =

> e07e0d4cb0c4bfe8  871a6bb4916fef3123b6ff749b  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>   24972759 =C2=B1  2%     -98.3%     417134 =C2=B1  9%  will-it-scale.tim=
e.voluntary_context_switches
>       2223 =C2=B1 49%    +209.6%       6884 =C2=B1 10%  will-it-scale.tim=
e.involuntary_context_switches
>        542 =C2=B1 32%     +91.3%       1037 =C2=B1  0%  will-it-scale.tim=
e.system_time
>        186 =C2=B1 30%     +86.3%        347 =C2=B1  0%  will-it-scale.tim=
e.percent_of_cpu_this_job_got
>      26.11 =C2=B1  5%     -22.7%      20.18 =C2=B1  2%  will-it-scale.tim=
e.user_time
>       0.09 =C2=B1  1%     -18.2%       0.07 =C2=B1  1%  will-it-scale.sca=
lability
>     783528 =C2=B1  0%      -1.8%     769550 =C2=B1  0%  will-it-scale.per=
_process_ops

>      12.27 =C2=B1 10%    +492.7%      72.73 =C2=B1  1%  perf-profile.cpu-=
cycles.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.generic_file_=
write_iter.new_sync_write
>       3.22 =C2=B1 26%   +1718.0%      58.50 =C2=B1  1%  perf-profile.cpu-=
cycles.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.gene=
ric_file_write_iter


Do you have the results for more/different performance tests for this
commit?

Jason mentioned seeing +5% on one (fserver).

So if, for multiple tests, we see an avg improvement, we might trade
that for this one regression.

If otoh we see a net negative, we'll have to go do something about this.


--===============6392486640228849090==--

