Content-Type: multipart/mixed; boundary="===============4192624324304537521=="
MIME-Version: 1.0
From: Ian Rogers <irogers@google.com>
To: lkp@lists.01.org
Subject: Re: [perf vendor events] 3f5f0df7bf: perf-sanity-tests.perf_all_metrics_test.fail
Date: Wed, 13 Apr 2022 10:09:15 -0700
Message-ID: <CAP-5=fXj+WT3ExNo-fL4d9b_Wm5swnKaCWd67rU85Q=QFg5KUw@mail.gmail.com>
In-Reply-To: <85eed89f-e4a8-2887-a0b3-579704304357@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4192624324304537521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2022 at 9:37 AM Liang, Kan <kan.liang@linux.intel.com> wr=
ote:
>
>
>
> On 4/13/2022 12:03 PM, Ian Rogers wrote:
> > 3) Weak group doesn't fall back to no group:
>
> That's because the group validation code doesn't take pinned events,
> such as the NMI watchdog, into account.
>
> I proposed a kernel patch to fix it, but it's rejected. It should be
> hard to find a generic way to fix it from the kernel side.
> https://lore.kernel.org/lkml/1565977750-76693-1-git-send-email-kan.liang(=
a)linux.intel.com/
>
> Maybe we can workaround it from the perf tool side?
> For example, for each weak group with cycles event and NMI watchdog is
> enabled, add an extra cycles event when opening the group. If the open
> fails with the extra cycles event, fall back to no group. After the
> extra cycles event check, remove the extra cycles.
>
> What do you think?

Thanks Kan, it is a shame the kernel support is lacking here. I'm not
sure what you are proposing for the perf tool to do. So:

> for each weak group with cycles event and NMI watchdog

Okay, let's try Branching_Overhead as mentioned in this report - but
the event is CPU_CLK_UNHALTED.THREAD here :-/

> add an extra cycles event when opening the group

So the perf_event_open doesn't fail here for me:
$ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,BR_IN=
ST_RETIRED.NOT_TAKEN,BR_INST_RETIRED.CONDITIONAL,CPU_CLK_UNHALTED.THREAD},c=
ycles'
-a sleep 1

 Performance counter stats for 'system wide':

     <not counted>      BR_INST_RETIRED.NEAR_CALL
               (0.00%)
     <not counted>      BR_INST_RETIRED.NEAR_TAKEN
                (0.00%)
     <not counted>      BR_INST_RETIRED.NOT_TAKEN
               (0.00%)
     <not counted>      BR_INST_RETIRED.CONDITIONAL
                 (0.00%)
     <not counted>      CPU_CLK_UNHALTED.THREAD
               (0.00%)
     4,071,908,022      cycles
               (49.97%)

       0.998134717 seconds time elapsed

Some events weren't counted. Try disabling the NMI watchdog:
echo 0 > /proc/sys/kernel/nmi_watchdog
perf stat ...
echo 1 > /proc/sys/kernel/nmi_watchdog
The events in group usually have to be from the same PMU. Try
reorganizing the group.

I'm not sure what the cycles event is achieving here, but it seems the
behavior will need a kernel change. I think I'm misunderstanding your
proposal :-)

Thanks,
Ian

> Thanks,
> Kan
> > $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,B=
R_INST_RETIRED.NOT_TAKEN,BR_INST_RETIRED.CONDITIONAL,CPU_CLK_UNHALTED.THREA=
D}:W'
> > -a sleep 1
> >
> >   Performance counter stats for 'system wide':
> >
> >       <not counted>      BR_INST_RETIRED.NEAR_CALL
> >                 (0.00%)
> >       <not counted>      BR_INST_RETIRED.NEAR_TAKEN
> >                  (0.00%)
> >       <not counted>      BR_INST_RETIRED.NOT_TAKEN
> >                 (0.00%)
> >       <not counted>      BR_INST_RETIRED.CONDITIONAL
> >                   (0.00%)
> >       <not counted>      CPU_CLK_UNHALTED.THREAD
> >                 (0.00%)
> >
> >         1.001690318 seconds time elapsed
> >
> > Some events weren't counted. Try disabling the NMI watchdog:
> > echo 0 > /proc/sys/kernel/nmi_watchdog
> > perf stat ...
> > echo 1 > /proc/sys/kernel/nmi_watchdog
--===============4192624324304537521==--

