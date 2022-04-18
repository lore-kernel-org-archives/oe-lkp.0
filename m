Content-Type: multipart/mixed; boundary="===============4922488482058858274=="
MIME-Version: 1.0
From: Liang, Kan <kan.liang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [perf vendor events] 3f5f0df7bf: perf-sanity-tests.perf_all_metrics_test.fail
Date: Mon, 18 Apr 2022 08:42:49 -0400
Message-ID: <fd562e7b-75f5-0db3-3677-89b052312083@linux.intel.com>
In-Reply-To: <CAM9d7cic6AhJGrNF7wmyowUBpp0mPu8TdiVebL4XXcotFtLUuQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4922488482058858274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 4/14/2022 6:58 PM, Namhyung Kim wrote:
> Hi Kan,
> =

> On Thu, Apr 14, 2022 at 12:06 PM Liang, Kan <kan.liang@linux.intel.com>=
 wrote:
>>
>>
>>
>> On 4/14/2022 12:09 PM, Ian Rogers wrote:
>>> ```
>>> $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,B=
R_INST_RETIRED.NOT_TAKEN,cycles,cycles}:W'
>>> -a sleep 1
>>>    Performance counter stats for 'system wide':
>>>
>>>        <not counted>      BR_INST_RETIRED.NEAR_CALL
>>>                  (0.00%)
>>>        <not counted>      BR_INST_RETIRED.NEAR_TAKEN
>>>                   (0.00%)
>>>        <not counted>      BR_INST_RETIRED.NOT_TAKEN
>>>                  (0.00%)
>>>        <not counted>      cycles
>>>                  (0.00%)
>>>        <not counted>      cycles
>>>                  (0.00%)
>>>
>>>          1.005599088 seconds time elapsed
>>>
>>> Some events weren't counted. Try disabling the NMI watchdog:
>>>           echo 0 > /proc/sys/kernel/nmi_watchdog
>>>           perf stat ...
>>>           echo 1 > /proc/sys/kernel/nmi_watchdog
>>> The events in group usually have to be from the same PMU. Try
>>> reorganizing the group.
>>> ```
>>>
>>> If we add two extra cycles or the original group is smaller then it is =
"fixed":
>>> ```
>>> $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,B=
R_INST_RETIRED.NOT_TAKEN,cycles}:W'
>>> -a sleep 1
>>>
>>>    Performance counter stats for 'system wide':
>>>
>>>           20,378,789      BR_INST_RETIRED.NEAR_CALL
>>>          168,420,963      BR_INST_RETIRED.NEAR_TAKEN
>>>           96,330,608      BR_INST_RETIRED.NOT_TAKEN
>>>        1,652,230,042      cycles
>>>
>>>          1.008757590 seconds time elapsed
>>>
>>> $ perf stat -e '{BR_INST_RETIRED.NEAR_CALL,BR_INST_RETIRED.NEAR_TAKEN,B=
R_INST_RETIRED.NOT_TAKEN,cycles,cycles,cycles}:W'
>>> -a sleep 1
>>>
>>>    Performance counter stats for 'system wide':
>>>
>>>           37,696,638      BR_INST_RETIRED.NEAR_CALL
>>>                  (66.62%)
>>>          298,535,151      BR_INST_RETIRED.NEAR_TAKEN
>>>                   (66.63%)
>>>          297,011,663      BR_INST_RETIRED.NOT_TAKEN
>>>                  (66.63%)
>>>        3,155,711,474      cycles
>>>                  (66.65%)
>>>        3,194,919,959      cycles
>>>                  (66.74%)
>>>        3,126,664,102      cycles
>>>                  (66.72%)
>>>
>>>          1.006237962 seconds time elapsed
>>> ```
>>>
>>> So the extra cycles is needed to fix weak groups when the nmi watchdog
>>> is enabled and the group is an architecture dependent size.
>>
>> Yes, the size of the group depends on the architecture, but perf tool
>> doesn't need to know the HW details. For this case, perf tool just sends
>> the request with an extra cycles event in the group and lets kernel deci=
de.
> =

> I prefer doing this in the kernel even if it'd be incomplete.

I tried a generic way to check all active pinned events from the kernel =

side, but it's rejected.
https://lore.kernel.org/lkml/1565977750-76693-1-git-send-email-kan.liang(a)=
linux.intel.com/

> For the NMI watchdog, is it possible to check if it's enabled
> at the moment, and set the fake_cpuc->idxmsk to prevent
> scheduling events in validate_group()?

I think it's possible to check the status of the NMI watchdog via =

nmi_watchdog_user_enabled. But I don't think we can simply change the =

fake_cpuc->idxmsk. Because the fake_cpuc->event_constraint points to the =

shared static event_constraint value, which should not be modified. What =

we can do is to apply the dynamic constraint flag for all the events. =

The kernel will create a copy of the constraint for each event. We can =

change the idxmsk of the copy.

No matter how we update the idxmsk. The critical path =

x86_schedule_events() has to be modified, which may slightly impact the =

performance I guess. Not sure whether it worth.

Another benefit to implement the fix in the perf tool is that the fix =

can be easily deployed on the stable env. It's much easier to upgrade =

the perf tool than the kernel, right?

Thanks,
Kan
--===============4922488482058858274==--

