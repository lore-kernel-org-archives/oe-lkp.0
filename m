Content-Type: multipart/mixed; boundary="===============1981072403421988590=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung@kernel.org>
To: lkp@lists.01.org
Subject: Re: [perf vendor events] 3f5f0df7bf: perf-sanity-tests.perf_all_metrics_test.fail
Date: Thu, 14 Apr 2022 15:58:52 -0700
Message-ID: <CAM9d7cic6AhJGrNF7wmyowUBpp0mPu8TdiVebL4XXcotFtLUuQ@mail.gmail.com>
In-Reply-To: <f020f05e-0e54-cc59-0666-810cf3a4fd14@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1981072403421988590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kan,

On Thu, Apr 14, 2022 at 12:06 PM Liang, Kan <kan.liang@linux.intel.com> w=
rote:
>
>
>
> On 4/14/2022 12:09 PM, Ian Rogers wrote:
> > ```
> > $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,B=
R_INST_RETIRED.NOT_TAKEN,cycles,cycles}:W'
> > -a sleep 1
> >   Performance counter stats for 'system wide':
> >
> >       <not counted>      BR_INST_RETIRED.NEAR_CALL
> >                 (0.00%)
> >       <not counted>      BR_INST_RETIRED.NEAR_TAKEN
> >                  (0.00%)
> >       <not counted>      BR_INST_RETIRED.NOT_TAKEN
> >                 (0.00%)
> >       <not counted>      cycles
> >                 (0.00%)
> >       <not counted>      cycles
> >                 (0.00%)
> >
> >         1.005599088 seconds time elapsed
> >
> > Some events weren't counted. Try disabling the NMI watchdog:
> >          echo 0 > /proc/sys/kernel/nmi_watchdog
> >          perf stat ...
> >          echo 1 > /proc/sys/kernel/nmi_watchdog
> > The events in group usually have to be from the same PMU. Try
> > reorganizing the group.
> > ```
> >
> > If we add two extra cycles or the original group is smaller then it is =
"fixed":
> > ```
> > $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,B=
R_INST_RETIRED.NOT_TAKEN,cycles}:W'
> > -a sleep 1
> >
> >   Performance counter stats for 'system wide':
> >
> >          20,378,789      BR_INST_RETIRED.NEAR_CALL
> >         168,420,963      BR_INST_RETIRED.NEAR_TAKEN
> >          96,330,608      BR_INST_RETIRED.NOT_TAKEN
> >       1,652,230,042      cycles
> >
> >         1.008757590 seconds time elapsed
> >
> > $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,B=
R_INST_RETIRED.NOT_TAKEN,cycles,cycles,cycles}:W'
> > -a sleep 1
> >
> >   Performance counter stats for 'system wide':
> >
> >          37,696,638      BR_INST_RETIRED.NEAR_CALL
> >                 (66.62%)
> >         298,535,151      BR_INST_RETIRED.NEAR_TAKEN
> >                  (66.63%)
> >         297,011,663      BR_INST_RETIRED.NOT_TAKEN
> >                 (66.63%)
> >       3,155,711,474      cycles
> >                 (66.65%)
> >       3,194,919,959      cycles
> >                 (66.74%)
> >       3,126,664,102      cycles
> >                 (66.72%)
> >
> >         1.006237962 seconds time elapsed
> > ```
> >
> > So the extra cycles is needed to fix weak groups when the nmi watchdog
> > is enabled and the group is an architecture dependent size.
>
> Yes, the size of the group depends on the architecture, but perf tool
> doesn't need to know the HW details. For this case, perf tool just sends
> the request with an extra cycles event in the group and lets kernel decid=
e.

I prefer doing this in the kernel even if it'd be incomplete.
For the NMI watchdog, is it possible to check if it's enabled
at the moment, and set the fake_cpuc->idxmsk to prevent
scheduling events in validate_group()?

Thanks,
Namhyung
--===============1981072403421988590==--

