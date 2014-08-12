Content-Type: multipart/mixed; boundary="===============0272452783057557490=="
MIME-Version: 1.0
From: kodiak furr <boxerspam1@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched] 143e1e28cb4: +17.9% aim7.jobs-per-min, -9.7% hackbench.throughput
Date: Tue, 12 Aug 2014 09:57:28 -0500
Message-ID: <53ea2b9a.a7d7b60a.4971.ffffda2c@mx.google.com>
In-Reply-To: <20140811012340.GA6593@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============0272452783057557490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

.

Sent using Boxer

On Aug 10, 2014 8:23 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
>
> On Sun, Aug 10, 2014 at 05:05:03PM +0200, Peter Zijlstra wrote: =

> > On Sun, Aug 10, 2014 at 06:54:13PM +0800, Fengguang Wu wrote: =

> > > The "brickland1/aim7/6000-page_test" is the test case part. =

> > > =

> > > The "TOTAL XXX" is the metric part. One test run may generate lots of =

> > > metrics, reflecting different aspect of the system dynamics. =

> > > =

> > > This view may be easier to read, by grouping the metrics by test case=
. =

> > =

> > Right, at least that makes more sense. =

> > =

> > > test case: brickland1/aim7/6000-page_test =

> > =

> > Ok, so next question, what is a brickland? I suspect its a machine of =

> > sorts, seeing how some others had wsm in that part of the test. Now I =

> > know what a westmere is, but I've never heard of a brickland. =

>
> As Ingo says, it's the "Brickland" platform with "Ivy Bridge-EX" CPU. =

>
> Sorry this part can be improved -- I'll add description of the test =

> boxes in future reports. =

>
> > Please describe the machine, this is a topology patch, so we need to =

> > know the topology of the affected machines. =

>
> Here they are. If you need more (or less) information (now and future), =

> please let me know. =

>
> brickland1: Brickland Ivy Bridge-EX =

> Memory: 128G =

>
> brickland3: Brickland Ivy Bridge-EX =

> Memory: 512G =

> Architecture:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_6=
4 =

> CPU op-mode(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32-bit, 64-bit =

> Byte Order:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Little Endian =

> CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 120 =

> On-line CPU(s) list:=C2=A0=C2=A0 0-119 =

> Thread(s) per core:=C2=A0=C2=A0=C2=A0 2 =

> Core(s) per socket:=C2=A0=C2=A0=C2=A0 15 =

> Socket(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 4 =

> NUMA node(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 =

> Vendor ID:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GenuineIntel =

> CPU family:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 6 =

> Model:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 62 =

> Stepping:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 7 =

> CPU MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 3192.875 =

> BogoMIPS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 5593.49 =

> Virtualization:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VT-x =

> L1d cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K =

> L1i cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K =

> L2 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 256K =

> L3 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 38400K =

> NUMA node0 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 0-14,60-74 =

> NUMA node1 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 15-29,75-89 =

> NUMA node2 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 30-44,90-104 =

> NUMA node3 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 45-59,105-119 =

>
> lkp-snb01: Sandy Bridge-EP =

> Memory: 32G =

> Architecture:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_6=
4 =

> CPU op-mode(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32-bit, 64-bit =

> Byte Order:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Little Endian =

> CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 32 =

> On-line CPU(s) list:=C2=A0=C2=A0 0-31 =

> Thread(s) per core:=C2=A0=C2=A0=C2=A0 2 =

> Core(s) per socket:=C2=A0=C2=A0=C2=A0 8 =

> Socket(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 2 =

> NUMA node(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 =

> Vendor ID:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GenuineIntel =

> CPU family:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 6 =

> Model:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 45 =

> Stepping:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 6 =

> CPU MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 3498.820 =

> BogoMIPS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 5391.31 =

> Virtualization:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VT-x =

> L1d cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K =

> L1i cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K =

> L2 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 256K =

> L3 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 20480K =

> NUMA node0 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 0-7,16-23 =

> NUMA node1 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 8-15,24-31 =

>
> wsm: Westmere =

> Memory: 6G =

> Architecture:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_6=
4 =

> CPU op-mode(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32-bit, 64-bit =

> Byte Order:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Little Endian =

> CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 12 =

> On-line CPU(s) list:=C2=A0=C2=A0 0-11 =

> Thread(s) per core:=C2=A0=C2=A0=C2=A0 2 =

> Core(s) per socket:=C2=A0=C2=A0=C2=A0 6 =

> Socket(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1 =

> NUMA node(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 =

> Vendor ID:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GenuineIntel =

> CPU family:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 6 =

> Model:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 44 =

> Stepping:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 2 =

> CPU MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 3458.000 =

> BogoMIPS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 6756.46 =

> Virtualization:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VT-x =

> L1d cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K =

> L1i cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K =

> L2 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 256K =

> L3 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 12288K =

> NUMA node0 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 0-11 =

>
> lkp-nex04: Nehalem-EX =

> Memory: 256G =

> Architecture:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_6=
4 =

> CPU op-mode(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32-bit, 64-bit =

> Byte Order:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Little Endian =

> CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 64 =

> On-line CPU(s) list:=C2=A0=C2=A0 0-63 =

> Thread(s) per core:=C2=A0=C2=A0=C2=A0 2 =

> Core(s) per socket:=C2=A0=C2=A0=C2=A0 8 =

> Socket(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 4 =

> NUMA node(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 =

> Vendor ID:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GenuineIntel =

> CPU family:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 6 =

> Model:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46 =

> Stepping:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 6 =

> CPU MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2262.000 =

> BogoMIPS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 4521.30 =

> Virtualization:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VT-x =

> L1d cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K =

> L1i cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K =

> L2 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 256K =

> L3 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 24576K =

> NUMA node0 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 0-7,32-39 =

> NUMA node1 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 8-15,40-47 =

> NUMA node2 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 16-23,48-55 =

> NUMA node3 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 24-31,56-63 =

>
> nhm4: Nehalem =

> Memory: 4G =

> Architecture:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_6=
4 =

> CPU op-mode(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32-bit, 64-bit =

> Byte Order:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Little Endian =

> CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 8 =

> On-line CPU(s) list:=C2=A0=C2=A0 0-7 =

> Thread(s) per core:=C2=A0=C2=A0=C2=A0 2 =

> Core(s) per socket:=C2=A0=C2=A0=C2=A0 4 =

> Socket(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1 =

> NUMA node(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 =

> Vendor ID:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GenuineIntel =

> CPU family:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 6 =

> Model:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 26 =

> Stepping:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 4 =

> CPU MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 3193.000 =

> BogoMIPS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 6400.40 =

> Virtualization:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VT-x =

> L1d cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K =

> L1i cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K =

> L2 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 256K =

> L3 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 8192K =

> NUMA node0 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 0-7 =

>
> Thanks, =

> Fengguang =

> -- =

> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n =

> the body of a message to majordomo(a)vger.kernel.org =

> More majordomo info at=C2=A0 http://vger.kernel.org/majordomo-info.html =

> Please read the FAQ at=C2=A0 http://www.tux.org/lkml/=20

--===============0272452783057557490==--

