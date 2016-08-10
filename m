Content-Type: multipart/mixed; boundary="===============8773853068653826325=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 10 Aug 2016 11:24:16 -0700
Message-ID: <CA+55aFyJaT3ufm7kfU=PGi0YtHzBEYYLxcA+PUrka8uQ3=5+bg@mail.gmail.com>
In-Reply-To: <20160809143359.GA11220@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8773853068653826325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2016 at 7:33 AM, kernel test robot <xiaolong.ye@intel.com>=
 wrote:
>
> FYI, we noticed a -13.6% regression of aim7.jobs-per-min due to commit:
> 68a9f5e7007c ("xfs: implement iomap based buffered write path")
>
> in testcase: aim7
> on test machine: 48 threads Ivytown Ivy Bridge-EP with 64G memory
> with following parameters:
>
>         disk: 1BRD_48G
>         fs: xfs
>         test: disk_wrt
>         load: 3000
>         cpufreq_governor: performance

Christop, Dave, was this expected?

>From looking at the numbers, it looks like much more IO going on (and
this less CPU load)..

>      37.23 =C2=B1  0%     +15.6%      43.04 =C2=B1  0%  aim7.time.elapsed=
_time
>      37.23 =C2=B1  0%     +15.6%      43.04 =C2=B1  0%  aim7.time.elapsed=
_time.max
>       6424 =C2=B1  1%     +31.3%       8432 =C2=B1  1%  aim7.time.involun=
tary_context_switches>       4003 =C2=B1  0%     +28.1%       5129 =C2=B1  =
1%  proc-vmstat.nr_active_file
>     979.25 =C2=B1  0%     +63.7%       1602 =C2=B1  1%  proc-vmstat.pgact=
ivate
>       4699 =C2=B1  3%    +162.6%      12340 =C2=B1 73%  proc-vmstat.pgpgo=
ut
>      50.23 =C2=B1 19%     -27.3%      36.50 =C2=B1 17%  sched_debug.cpu.c=
pu_load[1].avg
>     466.50 =C2=B1 29%     -51.8%     225.00 =C2=B1 73%  sched_debug.cpu.c=
pu_load[1].max
>      77.78 =C2=B1 33%     -50.6%      38.40 =C2=B1 57%  sched_debug.cpu.c=
pu_load[1].stddev
>     300.50 =C2=B1 33%     -52.9%     141.50 =C2=B1 48%  sched_debug.cpu.c=
pu_load[2].max
>       1836 =C2=B1 10%     +65.5%       3039 =C2=B1  8%  slabinfo.scsi_dat=
a_buffer.active_objs
>       1836 =C2=B1 10%     +65.5%       3039 =C2=B1  8%  slabinfo.scsi_dat=
a_buffer.num_objs
>     431.75 =C2=B1 10%     +65.6%     715.00 =C2=B1  8%  slabinfo.xfs_efd_=
item.active_objs
>     431.75 =C2=B1 10%     +65.6%     715.00 =C2=B1  8%  slabinfo.xfs_efd_=
item.num_objs

but what do I know. Those profiles from the robot are pretty hard to
make sense of.

            Linus

--===============8773853068653826325==--

