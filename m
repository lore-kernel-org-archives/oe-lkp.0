Content-Type: multipart/mixed; boundary="===============3202883922123506537=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 09:08:40 +1000
Message-ID: <20160810230840.GS16044@dastard>
In-Reply-To: <CA+55aFyJaT3ufm7kfU=PGi0YtHzBEYYLxcA+PUrka8uQ3=5+bg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3202883922123506537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 11:24:16AM -0700, Linus Torvalds wrote:
> On Tue, Aug 9, 2016 at 7:33 AM, kernel test robot <xiaolong.ye@intel.co=
m> wrote:
> >
> > FYI, we noticed a -13.6% regression of aim7.jobs-per-min due to commit:
> > 68a9f5e7007c ("xfs: implement iomap based buffered write path")
> >
> > in testcase: aim7
> > on test machine: 48 threads Ivytown Ivy Bridge-EP with 64G memory
> > with following parameters:
> >
> >         disk: 1BRD_48G
> >         fs: xfs
> >         test: disk_wrt
> >         load: 3000
> >         cpufreq_governor: performance
> =

> Christop, Dave, was this expected?

No. I would have expected the performance to go the other way -
there is less overhead in the write() path now than there was
previously, and all my numbers go the other way (5-10%
improvements) in throughput.


> From looking at the numbers, it looks like much more IO going on (and
> this less CPU load)..

I read the numbers the other way, but to me the numbers do not
indicate anything about IO load.

> >      37.23 =C2=B1  0%     +15.6%      43.04 =C2=B1  0%  aim7.time.elaps=
ed_time
> >      37.23 =C2=B1  0%     +15.6%      43.04 =C2=B1  0%  aim7.time.elaps=
ed_time.max
> >       6424 =C2=B1  1%     +31.3%       8432 =C2=B1  1%  aim7.time.invol=
untary_context_switches
> >       4003 =C2=B1  0%     +28.1%       5129 =C2=B1  1%  proc-vmstat.nr_=
active_file
> >     979.25 =C2=B1  0%     +63.7%       1602 =C2=B1  1%  proc-vmstat.pga=
ctivate
> >       4699 =C2=B1  3%    +162.6%      12340 =C2=B1 73%  proc-vmstat.pgp=
gout
> >      50.23 =C2=B1 19%     -27.3%      36.50 =C2=B1 17%  sched_debug.cpu=
.cpu_load[1].avg
> >     466.50 =C2=B1 29%     -51.8%     225.00 =C2=B1 73%  sched_debug.cpu=
.cpu_load[1].max
> >      77.78 =C2=B1 33%     -50.6%      38.40 =C2=B1 57%  sched_debug.cpu=
.cpu_load[1].stddev
> >     300.50 =C2=B1 33%     -52.9%     141.50 =C2=B1 48%  sched_debug.cpu=
.cpu_load[2].max
> >       1836 =C2=B1 10%     +65.5%       3039 =C2=B1  8%  slabinfo.scsi_d=
ata_buffer.active_objs
> >       1836 =C2=B1 10%     +65.5%       3039 =C2=B1  8%  slabinfo.scsi_d=
ata_buffer.num_objs
> >     431.75 =C2=B1 10%     +65.6%     715.00 =C2=B1  8%  slabinfo.xfs_ef=
d_item.active_objs
> >     431.75 =C2=B1 10%     +65.6%     715.00 =C2=B1  8%  slabinfo.xfs_ef=
d_item.num_objs
> =

> but what do I know. Those profiles from the robot are pretty hard to
> make sense of.

Yup, I can't infer anything from most of the stats present. The only
thing that stood out is that there's clearly a significant reduction
in context switches:

	429058 =C2=B1  0%     -20.0%     343371 =C2=B1  0% aim7.time.voluntary_con=
text_switches
	....
	972882 =C2=B1  0%     -17.4%     803990 =C2=B1  0% perf-stat.context-switc=
hes

and a significant increase in system CPU time:

	376.31 =C2=B1  0%     +28.5%     483.48 =C2=B1  0%  aim7.time.system_time
	....
	1.452e+12 =C2=B1  6%     +29.5%  1.879e+12 =C2=B1  4% perf-stat.instructio=
ns
        42168 =C2=B1 16%     +27.5%      53751 =C2=B1  6% perf-stat.instruc=
tions-per-iTLB-miss


It looks to me like the extra system time is running more loops
in the same code footprint, not because we are executing a bigger
or different footprint of code.

That, to me, says there's a change in lock contention behaviour in
the workload (which we know aim7 is good at exposing). i.e. the
iomap change shifted contention from a sleeping lock to a spinning
lock, or maybe we now trigger optimistic spinning behaviour on a
lock we previously didn't spin on at all.

We really need instruction level perf profiles to understand
this - I don't have a machine with this many cpu cores available
locally, so I'm not sure I'm going to be able to make any progress
tracking it down in the short term. Maybe the lkp team has more
in-depth cpu usage profiles they can share?

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============3202883922123506537==--

