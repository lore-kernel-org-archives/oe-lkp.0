Content-Type: multipart/mixed; boundary="===============0469826752685159813=="
MIME-Version: 1.0
From: Jirka Hladky <jhladky@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Thu, 31 Jul 2014 18:39:05 +0200
Message-ID: <53DA7129.7020100@redhat.com>
In-Reply-To: <20140731162702.GZ19379@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0469826752685159813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/31/2014 06:27 PM, Peter Zijlstra wrote:
> On Thu, Jul 31, 2014 at 06:16:26PM +0200, Jirka Hladky wrote:
>> On 07/31/2014 05:57 PM, Peter Zijlstra wrote:
>>> On Thu, Jul 31, 2014 at 12:42:41PM +0200, Peter Zijlstra wrote:
>>>> On Tue, Jul 29, 2014 at 02:39:40AM -0400, Rik van Riel wrote:
>>>>> On Tue, 29 Jul 2014 13:24:05 +0800
>>>>> Aaron Lu <aaron.lu@intel.com> wrote:
>>>>>
>>>>>> FYI, we noticed the below changes on
>>>>>>
>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git ma=
ster
>>>>>> commit a43455a1d572daf7b730fe12eb747d1e17411365 ("sched/numa: Ensure=
 task_numa_migrate() checks the preferred node")
>>>>>>
>>>>>> ebe06187bf2aec1  a43455a1d572daf7b730fe12e
>>>>>> ---------------  -------------------------
>>>>>>       94500 ~ 3%    +115.6%     203711 ~ 6%  ivb42/hackbench/50%-thr=
eads-pipe
>>>>>>       67745 ~ 4%     +64.1%     111174 ~ 5%  lkp-snb01/hackbench/50%=
-threads-socket
>>>>>>      162245 ~ 3%     +94.1%     314885 ~ 6%  TOTAL proc-vmstat.numa_=
hint_faults_local
>>>>> Hi Aaron,
>>>>>
>>>>> Jirka Hladky has reported a regression with that changeset as
>>>>> well, and I have already spent some time debugging the issue.
>>>> Let me see if I can still find my SPECjbb2005 copy to see what that
>>>> does.
>>> Jirka, what kind of setup were you seeing SPECjbb regressions?
>>>
>>> I'm not seeing any on 2 sockets with a single SPECjbb instance, I'll go
>>> check one instance per socket now.
>>>
>>>
>> Peter, I'm seeing regressions for
>>
>> SINGLE SPECjbb instance for number of warehouses being the same as total
>> number of cores in the box.
>>
>> Example: 4 NUMA node box, each CPU has 6 cores =3D> biggest regression i=
s for
>> 24 warehouses.
> IVB-EP: 2 node, 10 cores, 2 thread per core:
>
> tip/master+origin/master:
>
>       Warehouses               Thrput
>                4               196781
>                8               358064
>               12               511318
>               16               589251
>               20               656123
>               24               710789
>               28               765426
>               32               787059
>               36               777899
>             * 40               748568
>                                      =

> Throughput      18258
>
>       Warehouses               Thrput
>                4               201598
>                8               363470
>               12               512968
>               16               584289
>               20               605299
>               24               720142
>               28               776066
>               32               791263
>               36               776965
>             * 40               760572
>                                      =

> Throughput      18551
>
>
> tip/master+origin/master-a43455a1d57
>
>                     SPEC scores
>       Warehouses               Thrput
>                4               198667
>                8               362481
>               12               503344
>               16               582602
>               20               647688
>               24               731639
>               28               786135
>               32               794124
>               36               774567
>             * 40               757559
>                                      =

> Throughput      18477
>
>
> Given that there's fairly large variance between the two runs with the
> commit in, I'm not sure I can say there's a problem here.
>
> The one run without the patch is more or less between the two runs with
> the patch.
>
> And doing this many runs takes ages, so I'm not tempted to either make
> the runs longer or do more of them.
>
> Lemme try on a 4 node box though, who knows.

IVB-EP: 2 node, 10 cores, 2 thread per core
=3D> on such system, I run only 20 warenhouses as maximum. (number of =

nodes * number of PHYSICAL cores)

The kernels you have tested shows following results:
656123/605299/647688


I'm doing 3 iterations (3 runs) to get some statistics. To speed up the =

test significantly please do the run with 20 warehouses only
(or in general with #warehouses =3D=3D  number of nodes * number of PHYSICA=
L =

cores)

Jirka

--===============0469826752685159813==--

