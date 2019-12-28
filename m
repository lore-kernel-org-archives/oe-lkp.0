Content-Type: multipart/mixed; boundary="===============7793214081928079228=="
MIME-Version: 1.0
From: Song Liu <songliubraving@fb.com>
To: lkp@lists.01.org
Subject: Re: ba0aa433ab ("perf: Sharing PMU counters across compatible .."): [ 286.496077] WARNING: CPU: 0 PID: 1137 at kernel/events/core.c:2260 event_sync_dup_count
Date: Sat, 28 Dec 2019 19:39:25 +0000
Message-ID: <0EDDC113-67E9-499A-951E-3E1E412BF16D@fb.com>
In-Reply-To: <20191220075424.GH2760@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7793214081928079228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Dec 19, 2019, at 11:54 PM, kernel test robot <lkp@intel.com> wrote:
> =

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/Song-Liu/perf-Sharing-PMU-counte=
rs-across-compatible-events/20191208-070529
> =

> commit ba0aa433aba487ef7e64f9e03076d212f478c838
> Author:     Song Liu <songliubraving@fb.com>
> AuthorDate: Fri Dec 6 16:24:47 2019 -0800
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Sun Dec 8 07:05:34 2019 +0800
> =

>    perf: Sharing PMU counters across compatible events

Thanks for the report. =


This is an earlier version of the patch. The latest version is
https://lkml.org/lkml/2019/12/17/904 =


Thanks,
Song

>    This patch tries to enable PMU sharing. When multiple perf_events are
>    counting the same metric, they can share the hardware PMU counter. We
>    call these events as "compatible events".
> =

>    The PMU sharing are limited to events within the same perf_event_conte=
xt
>    (ctx). When a event is installed or enabled, search the ctx for compat=
ible
>    events. This is implemented in perf_event_setup_dup(). One of these
>    compatible events are picked as the master (stored in event->dup_maste=
r).
>    Similarly, when the event is removed or disabled, perf_event_remove_du=
p()
>    is used to clean up sharing.
> =

>    A new state PERF_EVENT_STATE_ENABLED is introduced for the master even=
t.
>    This state is used when the slave event is ACTIVE, but the master event
>    is not.
> =

>    On the critical paths (add, del read), sharing PMU counters doesn't
>    increase the complexity. Helper functions event_pmu_[add|del|read]() a=
re
>    introduced to cover these cases. All these functions have O(1) time
>    complexity.
> =

>    Cc: Peter Zijlstra <peterz@infradead.org>
>    Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
>    Cc: Jiri Olsa <jolsa@kernel.org>
>    Cc: Alexey Budankov <alexey.budankov@linux.intel.com>
>    Cc: Namhyung Kim <namhyung@kernel.org>
>    Cc: Tejun Heo <tj@kernel.org>
>    Signed-off-by: Song Liu <songliubraving@fb.com>


--===============7793214081928079228==--

