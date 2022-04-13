Content-Type: multipart/mixed; boundary="===============5223846055030672788=="
MIME-Version: 1.0
From: Liang, Kan <kan.liang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [perf vendor events] 3f5f0df7bf: perf-sanity-tests.perf_all_metrics_test.fail
Date: Wed, 13 Apr 2022 12:37:24 -0400
Message-ID: <85eed89f-e4a8-2887-a0b3-579704304357@linux.intel.com>
In-Reply-To: <CAP-5=fXGqODZYGu781qjEEVtGFpCQJ=dCXi5shYOAbBSt5wQkw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5223846055030672788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 4/13/2022 12:03 PM, Ian Rogers wrote:
> 3) Weak group doesn't fall back to no group:

That's because the group validation code doesn't take pinned events, =

such as the NMI watchdog, into account.

I proposed a kernel patch to fix it, but it's rejected. It should be =

hard to find a generic way to fix it from the kernel side.
https://lore.kernel.org/lkml/1565977750-76693-1-git-send-email-kan.liang(a)=
linux.intel.com/

Maybe we can workaround it from the perf tool side?
For example, for each weak group with cycles event and NMI watchdog is =

enabled, add an extra cycles event when opening the group. If the open =

fails with the extra cycles event, fall back to no group. After the =

extra cycles event check, remove the extra cycles.

What do you think?

Thanks,
Kan
> $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_=
INST_RETIRED.NOT_TAKEN,BR_INST_RETIRED.CONDITIONAL,CPU_CLK_UNHALTED.THREAD}=
:W'
> -a sleep 1
> =

>   Performance counter stats for 'system wide':
> =

>       <not counted>      BR_INST_RETIRED.NEAR_CALL
>                 (0.00%)
>       <not counted>      BR_INST_RETIRED.NEAR_TAKEN
>                  (0.00%)
>       <not counted>      BR_INST_RETIRED.NOT_TAKEN
>                 (0.00%)
>       <not counted>      BR_INST_RETIRED.CONDITIONAL
>                   (0.00%)
>       <not counted>      CPU_CLK_UNHALTED.THREAD
>                 (0.00%)
> =

>         1.001690318 seconds time elapsed
> =

> Some events weren't counted. Try disabling the NMI watchdog:
> echo 0 > /proc/sys/kernel/nmi_watchdog
> perf stat ...
> echo 1 > /proc/sys/kernel/nmi_watchdog
--===============5223846055030672788==--

