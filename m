Content-Type: multipart/mixed; boundary="===============6677255393473261057=="
MIME-Version: 1.0
From: Jirka Hladky <jhladky@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Fri, 01 Aug 2014 23:30:34 +0200
Message-ID: <53DC06FA.8030104@redhat.com>
In-Reply-To: <1406926000.16021.6.camel@buesod1.americas.hpqcorp.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6677255393473261057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/01/2014 10:46 PM, Davidlohr Bueso wrote:
> On Thu, 2014-07-31 at 18:16 +0200, Jirka Hladky wrote:
>> Peter, I'm seeing regressions for
>>
>> SINGLE SPECjbb instance for number of warehouses being the same as total
>> number of cores in the box.
>>
>> Example: 4 NUMA node box, each CPU has 6 cores =3D> biggest regression is
>> for 24 warehouses.
> By looking at your graph, that's around a 10% difference.
>
> So I'm not seeing anywhere near as bad a regression on a 80-core box.
> Testing single with 80 warehouses, I get:
>
> tip/master baseline:
> 677476.36 bops
> 705826.70 bops
> 704870.87 bops
> 681741.20 bops
> 707014.59 bops
>
> Avg: 695385.94 bops
>
> tip/master + patch (NUMA_SCALE/8 variant):
> 698242.66 bops
> 693873.18 bops
> 707852.28 bops
> 691785.96 bops
> 747206.03 bopsthis
>
> Avg: 707792.022 bops
>
> So both these are pretty similar, however, when reverting, on avg we
> increase the amount of bops a mere ~4%:
>
> tip/master + reverted:
> 778416.02 bops
> 702602.62 bops
> 712557.32 bops
> 713982.90 bops
> 783300.36 bops
>
> Avg: 738171.84 bops
>
> Are there perhaps any special specjbb options you are using?
>

I see the regression only on this box. It has 4 "Ivy Bridge-EX" Xeon =

E7-4890 v2 CPUs.

http://ark.intel.com/products/75251
http://en.wikipedia.org/wiki/List_of_Intel_Xeon_microprocessors#.22Ivy_Brid=
ge-EX.22_.2822_nm.29_Expandable_2

Please rerun the test on box with Ivy Bridge CPUs. It seems that older =

CPU generations are not affected.

Thanks
Jirka



--===============6677255393473261057==--

