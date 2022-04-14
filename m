Content-Type: multipart/mixed; boundary="===============4004357066416607800=="
MIME-Version: 1.0
From: Liang, Kan <kan.liang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [perf vendor events] 3f5f0df7bf: perf-sanity-tests.perf_all_metrics_test.fail
Date: Thu, 14 Apr 2022 15:06:43 -0400
Message-ID: <f020f05e-0e54-cc59-0666-810cf3a4fd14@linux.intel.com>
In-Reply-To: <CAP-5=fX+Hqf5xYTCqBXNCz5-ZPaZ7ChNUgoRyH1+JhiAqj79nQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4004357066416607800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 4/14/2022 12:09 PM, Ian Rogers wrote:
> On Wed, Apr 13, 2022 at 11:17 AM Liang, Kan <kan.liang@linux.intel.com>=
 wrote:
>>
>>
>>
>> On 4/13/2022 1:09 PM, Ian Rogers wrote:
>>> On Wed, Apr 13, 2022 at 9:37 AM Liang, Kan <kan.liang@linux.intel.com=
> wrote:
>>>>
>>>>
>>>>
>>>> On 4/13/2022 12:03 PM, Ian Rogers wrote:
>>>>> 3) Weak group doesn't fall back to no group:
>>>>
>>>> That's because the group validation code doesn't take pinned events,
>>>> such as the NMI watchdog, into account.
>>>>
>>>> I proposed a kernel patch to fix it, but it's rejected. It should be
>>>> hard to find a generic way to fix it from the kernel side.
>>>> https://lore.kernel.org/lkml/1565977750-76693-1-git-send-email-kan.lia=
ng(a)linux.intel.com/
>>>>
>>>> Maybe we can workaround it from the perf tool side?
>>>> For example, for each weak group with cycles event and NMI watchdog is
>>>> enabled, add an extra cycles event when opening the group. If the open
>>>> fails with the extra cycles event, fall back to no group. After the
>>>> extra cycles event check, remove the extra cycles.
>>>>
>>>> What do you think?
>>>
>>> Thanks Kan, it is a shame the kernel support is lacking here. I'm not
>>> sure what you are proposing for the perf tool to do. So:
>>>
>>>> for each weak group with cycles event and NMI watchdog
>>>
>>> Okay, let's try Branching_Overhead as mentioned in this report - but
>>> the event is CPU_CLK_UNHALTED.THREAD here :-/
>>>
>>>> add an extra cycles event when opening the group
>>>
>>> So the perf_event_open doesn't fail here for me:
>>> $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,B=
R_INST_RETIRED.NOT_TAKEN,BR_INST_RETIRED.CONDITIONAL,CPU_CLK_UNHALTED.THREA=
D},cycles'
>>> -a sleep 1
>>>
>>
>> No, I mean modifying the perf tool code and add an extra cycles in the
>> weak group.
>>
>> Here is a very initial POC patch, which should prove the idea.
> =

> So I was unaware of this behavior, great find! However, it seems
> difficult to exploit. Here is the extra cycles "fixing" a weak group:
> ```
> $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_=
INST_RETIRED.NOT_TAKEN,BR_INST_RETIRED.CONDITIONAL,cycles,cycles}:W'
> -a sleep 1
> =

>   Performance counter stats for 'system wide':
> =

>          18,782,301      BR_INST_RETIRED.NEAR_CALL
>                 (66.64%)
>         153,325,072      BR_INST_RETIRED.NEAR_TAKEN
>                  (66.64%)
>          75,443,263      BR_INST_RETIRED.NOT_TAKEN
>                 (66.64%)
>         156,568,769      BR_INST_RETIRED.CONDITIONAL
>                   (66.66%)
>       1,870,812,571      cycles
>                 (66.72%)
>       1,890,508,326      cycles
>                 (66.70%)
> =

>         1.006371081 seconds time elapsed
> ```
> =

> But if the original group has 1 less counter we will fail with the
> duplicate cycles:

I should use close() instead of evsel__close() in the POC, since I =

didn't use the evsel__open() to open the extra cycles event. =

evsel->core.fd is always NULL. evsel__close() doesn't close the extra =

cycles event.

Please apply the below change to the POC patch.

                 if (fd < 0) {
                         evlist__reset_weak_group(evsel_list, counter, =

false);
                         second_pass =3D true;
                 } else {
+                      close(fd);
-                      evsel__close(evsel);
                 }


[kan(a)kanliang-dev perf]$ sudo ./perf stat -e =

'{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_INST_RETIRED.NOT_=
TAKEN,CPU_CLK_UNHALTED.THREAD}:W' =

-C0 sleep 1

  Performance counter stats for 'CPU(s) 0':

            570,963      BR_INST_RETIRED.NEAR_CALL
          2,271,463      BR_INST_RETIRED.NEAR_TAKEN
          1,942,059      BR_INST_RETIRED.NOT_TAKEN
         19,938,075      CPU_CLK_UNHALTED.THREAD

        1.002352851 seconds time elapsed

[kan(a)kanliang-dev perf]$ sudo ./perf stat -e =

'{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_INST_RETIRED.NOT_=
TAKEN,BR_INST_RETIRED.CONDITIONAL,CPU_CLK_UNHALTED.THREAD}:W' =

-C0 sleep 1

  Performance counter stats for 'CPU(s) 0':

            563,096      BR_INST_RETIRED.NEAR_CALL =

                       (79.95%)
          2,077,100      BR_INST_RETIRED.NEAR_TAKEN =

                       (79.97%)
          1,602,897      BR_INST_RETIRED.NOT_TAKEN =

                       (80.05%)
          2,332,397      BR_INST_RETIRED.CONDITIONAL =

                       (80.05%)
         19,255,825      CPU_CLK_UNHALTED.THREAD =

                       (79.99%)

        1.002250279 seconds time elapsed

[kan@kanliang-dev perf]$ sudo ./perf stat -e =

'{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_INST_RETIRED.NOT_=
TAKEN,BR_INST_RETIRED.CONDITIONAL,CPU_CLK_UNHALTED.THREAD,cycles}:W' =

-C0 sleep 1

  Performance counter stats for 'CPU(s) 0':

            633,648      BR_INST_RETIRED.NEAR_CALL =

                       (66.67%)
          2,376,309      BR_INST_RETIRED.NEAR_TAKEN =

                       (66.68%)
          1,380,715      BR_INST_RETIRED.NOT_TAKEN =

                       (66.68%)
          2,064,048      BR_INST_RETIRED.CONDITIONAL =

                       (66.68%)
         19,493,096      CPU_CLK_UNHALTED.THREAD =

                       (66.66%)
         19,396,279      cycles =

                       (66.64%)

        1.002327588 seconds time elapsed




> ```
> $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_=
INST_RETIRED.NOT_TAKEN,cycles,cycles}:W'
> -a sleep 1
>   Performance counter stats for 'system wide':
> =

>       <not counted>      BR_INST_RETIRED.NEAR_CALL
>                 (0.00%)
>       <not counted>      BR_INST_RETIRED.NEAR_TAKEN
>                  (0.00%)
>       <not counted>      BR_INST_RETIRED.NOT_TAKEN
>                 (0.00%)
>       <not counted>      cycles
>                 (0.00%)
>       <not counted>      cycles
>                 (0.00%)
> =

>         1.005599088 seconds time elapsed
> =

> Some events weren't counted. Try disabling the NMI watchdog:
>          echo 0 > /proc/sys/kernel/nmi_watchdog
>          perf stat ...
>          echo 1 > /proc/sys/kernel/nmi_watchdog
> The events in group usually have to be from the same PMU. Try
> reorganizing the group.
> ```
> =

> If we add two extra cycles or the original group is smaller then it is "f=
ixed":
> ```
> $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_=
INST_RETIRED.NOT_TAKEN,cycles}:W'
> -a sleep 1
> =

>   Performance counter stats for 'system wide':
> =

>          20,378,789      BR_INST_RETIRED.NEAR_CALL
>         168,420,963      BR_INST_RETIRED.NEAR_TAKEN
>          96,330,608      BR_INST_RETIRED.NOT_TAKEN
>       1,652,230,042      cycles
> =

>         1.008757590 seconds time elapsed
> =

> $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_=
INST_RETIRED.NOT_TAKEN,cycles,cycles,cycles}:W'
> -a sleep 1
> =

>   Performance counter stats for 'system wide':
> =

>          37,696,638      BR_INST_RETIRED.NEAR_CALL
>                 (66.62%)
>         298,535,151      BR_INST_RETIRED.NEAR_TAKEN
>                  (66.63%)
>         297,011,663      BR_INST_RETIRED.NOT_TAKEN
>                 (66.63%)
>       3,155,711,474      cycles
>                 (66.65%)
>       3,194,919,959      cycles
>                 (66.74%)
>       3,126,664,102      cycles
>                 (66.72%)
> =

>         1.006237962 seconds time elapsed
> ```
> =

> So the extra cycles is needed to fix weak groups when the nmi watchdog
> is enabled and the group is an architecture dependent size.

Yes, the size of the group depends on the architecture, but perf tool =

doesn't need to know the HW details. For this case, perf tool just sends =

the request with an extra cycles event in the group and lets kernel decide.


Thanks,
Kan
> =

> Thanks,
> Ian
> =

>> diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
>> index b7fe88beb584..782c3d7f1b32 100644
>> --- a/tools/perf/builtin-stat.c
>> +++ b/tools/perf/builtin-stat.c
>> @@ -71,7 +71,9 @@
>>    #include "util/bpf_counter.h"
>>    #include "util/iostat.h"
>>    #include "util/pmu-hybrid.h"
>> +#include "util/util.h"
>>    #include "asm/bug.h"
>> +#include "perf-sys.h"
>>
>>    #include <linux/time64.h>
>>    #include <linux/zalloc.h>
>> @@ -777,6 +779,8 @@ static enum counter_recovery
>> stat_handle_error(struct evsel *counter)
>>          return COUNTER_FATAL;
>>    }
>>
>> +#define FD(e, x, y) (*(int *)xyarray__entry(e->core.fd, x, y))
>> +
>>    static int __run_perf_stat(int argc, const char **argv, int run_idx)
>>    {
>>          int interval =3D stat_config.interval;
>> @@ -793,6 +797,7 @@ static int __run_perf_stat(int argc, const char
>> **argv, int run_idx)
>>          struct affinity saved_affinity, *affinity =3D NULL;
>>          int err;
>>          bool second_pass =3D false;
>> +       bool has_cycles =3D false;
>>
>>          if (forks) {
>>                  if (evlist__prepare_workload(evsel_list, &target, argv,=
 is_pipe,
>> workload_exec_failed_signal) < 0) {
>> @@ -821,6 +826,8 @@ static int __run_perf_stat(int argc, const char
>> **argv, int run_idx)
>>          evlist__for_each_cpu(evlist_cpu_itr, evsel_list, affinity) {
>>                  counter =3D evlist_cpu_itr.evsel;
>>
>> +               if (counter->core.attr.config =3D=3D 0x3c)
>> +                       has_cycles =3D true;
>>                  /*
>>                   * bperf calls evsel__open_per_cpu() in bperf__load(), =
so
>>                   * no need to call it again here.
>> @@ -867,6 +874,24 @@ static int __run_perf_stat(int argc, const char
>> **argv, int run_idx)
>>                  counter->supported =3D true;
>>          }
>>
>> +       //make it model specific. need to move to a better place
>> +       if (counter->supported && !second_pass && has_cycles &&
>> counter->weak_group && sysctl__nmi_watchdog_enabled()) {
>> +               struct evsel *leader =3D evsel__leader(counter);
>> +               int group_fd =3D FD(leader, 0, 0);
>> +               struct evsel *evsel;
>> +               int fd;
>> +
>> +               evsel =3D evsel__new_cycles(0, PERF_TYPE_HARDWARE,
>> PERF_COUNT_HW_CPU_CYCLES);
>> +               fd =3D sys_perf_event_open(&evsel->core.attr, -1, 0, gro=
up_fd, 0x8);
>> +
>> +               if (fd < 0) {
>> +                       evlist__reset_weak_group(evsel_list, counter, fa=
lse);
>> +                       second_pass =3D true;
>> +               } else {
>> +                       evsel__close(evsel);
>> +               }
>> +       }
>> +
>>          if (second_pass) {
>>                  /*
>>                   * Now redo all the weak group after closing them,
>>
>> With the above patch,
>>
>> $ sudo ./perf stat -e
>> '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_INST_RETIRED.N=
OT_TAKEN,BR_INST_RETIRED.CONDITIONAL,CPU_CLK_UNHALTED.THREAD}:W'
>> -C0 sleep 1
>>
>>    Performance counter stats for 'CPU(s) 0':
>>
>>              913,369      BR_INST_RETIRED.NEAR_CALL
>>                         (79.95%)
>>            3,648,433      BR_INST_RETIRED.NEAR_TAKEN
>>                         (80.00%)
>>            2,481,976      BR_INST_RETIRED.NOT_TAKEN
>>                         (80.05%)
>>            3,696,298      BR_INST_RETIRED.CONDITIONAL
>>                         (80.04%)
>>           27,792,053      CPU_CLK_UNHALTED.THREAD
>>                         (79.96%)
>>
>>          1.002224709 seconds time elapsed
>>
>>
>> Thanks,
>> Kan
--===============4004357066416607800==--

