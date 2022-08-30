Content-Type: multipart/mixed; boundary="===============1648400526055447491=="
MIME-Version: 1.0
From: Yujie Liu <yujie.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] ca6dee6b79: fxmark.ssd_btrfs_MWRM_72_bufferedio.works/sec -8.4% regression
Date: Tue, 30 Aug 2022 14:32:10 +0800
Message-ID: <4b5d1c96-44c5-e8bb-01d8-9f9c72621d0d@intel.com>
In-Reply-To: <eb352106-5a3c-63fe-2409-494cf0a31bfc@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1648400526055447491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Filipe,

We noticed that this case was reported when the patch was in linux-next.
Thanks for your comment that it is an expected result due to heavy rename.

https://lore.kernel.org/all/Ysb4T7Z8hKgdvPRk(a)xsang-OptiPlex-9020/

This report is due to the patch being merged into mainline, if it is still
the same case, please ignore this duplicate report. Sorry for the inconveni=
ence.

--
Thanks,
Yujie

On 8/30/2022 11:17, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -8.4% regression of fxmark.ssd_btrfs_MWRM_72_bufferedio=
.works/sec due to commit:
> =

> =

> commit: ca6dee6b7946794fa340a7290ca399a50b61705f ("btrfs: balance btree d=
irty pages and delayed items after a rename")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: fxmark
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU=
 @ 2.60GHz (Ice Lake) with 128G memory
> with following parameters:
> =

>  =C2=A0=C2=A0=C2=A0=C2=A0disk: 1SSD
>  =C2=A0=C2=A0=C2=A0=C2=A0media: ssd
>  =C2=A0=C2=A0=C2=A0=C2=A0test: MWRM
>  =C2=A0=C2=A0=C2=A0=C2=A0fstype: btrfs
>  =C2=A0=C2=A0=C2=A0=C2=A0directio: bufferedio
>  =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
>  =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0xd000363
> =

> test-description: FxMark is a filesystem benchmark that test multicore sc=
alability.
> test-url: https://github.com/sslab-gatech/fxmark
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_=
group/test/testcase/ucode:
>  =C2=A0 gcc-11/performance/bufferedio/1SSD/btrfs/x86_64-rhel-8.3/ssd/debi=
an-11.1-x86_64-20220510.cgz/lkp-icl-2sp5/MWRM/fxmark/0xd000363
> =

> commit:
>  =C2=A0 b8bea09a45 ("btrfs: add trace event for submitted RAID56 bio")
>  =C2=A0 ca6dee6b79 ("btrfs: balance btree dirty pages and delayed items a=
fter a rename")
> =

> b8bea09a456fc31a ca6dee6b7946794fa340a7290ca
> ---------------- ---------------------------
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
>  =C2=A0=C2=A0 1821853=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -13.9%=C2=A0=C2=A0=C2=A0 1568247 =C2=B1=C2=A0 3%=C2=A0 fxmark.ssd=
_btrfs_MWRM_36_bufferedio.works
>  =C2=A0=C2=A0=C2=A0=C2=A0 36436=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -13.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31362 =C2=B1=C2=A0 =
3%=C2=A0 fxmark.ssd_btrfs_MWRM_36_bufferedio.works/sec
>  =C2=A0=C2=A0 1675102=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -14.0%=C2=A0=C2=A0=C2=A0 1439994 =C2=B1=C2=A0 7%=C2=A0 fxmark.ssd=
_btrfs_MWRM_54_bufferedio.works
>  =C2=A0=C2=A0=C2=A0=C2=A0 33497=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -14.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28796 =C2=B1=C2=A0 =
7%=C2=A0 fxmark.ssd_btrfs_MWRM_54_bufferedio.works/sec
>  =C2=A0=C2=A0 1572332=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -8.4%=C2=A0=C2=A0=C2=A0 1440600 =C2=B1=C2=A0 6%=C2=A0 fxmar=
k.ssd_btrfs_MWRM_72_bufferedio.works
>  =C2=A0=C2=A0=C2=A0=C2=A0 31445=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -8.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28809 =C2=B1=
=C2=A0 6%=C2=A0 fxmark.ssd_btrfs_MWRM_72_bufferedio.works/sec
>  =C2=A0=C2=A0=C2=A0 356010=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +80.0%=C2=A0=C2=A0=C2=A0=C2=A0 640832=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fxmark.time.involuntary_context_switches
>  =C2=A0=C2=A0=C2=A0=C2=A0 68.50=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -24.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 52.00=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fxmark.time.percent_of_cpu_this_job_got
>  =C2=A0=C2=A0=C2=A0 630.47=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -24.0%=C2=A0=C2=A0=C2=A0=C2=A0 479.23=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fxmark.time.system_time
>  =C2=A01.335e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +49.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 cpuidle..time
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1045 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=
=A0 +11.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1168=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 uptime.idle
>  =C2=A0=C2=A0=C2=A0=C2=A0 31.54=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +50.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 47.37=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iostat.cpu.idle
>  =C2=A0=C2=A0=C2=A0=C2=A0 64.16=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -24.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 48.29=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iostat.cpu.system
>  =C2=A0=C2=A0=C2=A0=C2=A0 31.17=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +50.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46.83=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmstat.cpu.id
>  =C2=A0=C2=A0=C2=A0=C2=A0 12.83 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -=
55.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.67 =C2=B1=C2=A0 8%=C2=A0 vmstat=
.procs.r
>  =C2=A0=C2=A0=C2=A0=C2=A0 32.13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +15.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 47.95=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mpstat.cpu.all.idle%
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.47 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53 =C2=B1=C2=A0 =
3%=C2=A0 mpstat.cpu.all.iowait%
>  =C2=A0=C2=A0=C2=A0=C2=A0 63.37=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -16.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 47.31=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mpstat.cpu.all.sys%
>  =C2=A0=C2=A0=C2=A0=C2=A0 10.04 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +=
13.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.39 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i=
.metric.K/sec
>  =C2=A0=C2=A0=C2=A0 869.81 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -16.2%=C2=
=A0=C2=A0=C2=A0=C2=A0 728.74 =C2=B1 15%=C2=A0 perf-stat.i.node-loads
>  =C2=A0=C2=A0=C2=A0 871.23 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -16.2%=C2=
=A0=C2=A0=C2=A0=C2=A0 730.49 =C2=B1 15%=C2=A0 perf-stat.ps.node-loads
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3004 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=
=A0 -52.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1440 =C2=B1=C2=A0 6%=C2=A0 n=
uma-meminfo.node0.Active(anon)
>  =C2=A0=C2=A0 1218568=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -10.8%=C2=A0=C2=A0=C2=A0 1086453=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 numa-meminfo.node0.Inactive
>  =C2=A0=C2=A0=C2=A0 351812 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -29.0%=
=C2=A0=C2=A0=C2=A0=C2=A0 249640 =C2=B1 12%=C2=A0 numa-meminfo.node0.Inactiv=
e(anon)
>  =C2=A0=C2=A0=C2=A0 120150=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -79.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24861 =C2=B1=C2=A0 3%=
=C2=A0 numa-meminfo.node0.Shmem
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3489 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=
=A0 -45.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1919 =C2=B1=C2=A0 2%=C2=A0 m=
eminfo.Active(anon)
>  =C2=A0=C2=A0=C2=A0 492107=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -19.0%=C2=A0=C2=A0=C2=A0=C2=A0 398809=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 meminfo.Committed_AS
>  =C2=A0=C2=A0=C2=A0 382253=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -24.6%=C2=A0=C2=A0=C2=A0=C2=A0 288151=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 meminfo.Inactive(anon)
>  =C2=A0=C2=A0=C2=A0 124727=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -76.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28886 =C2=B1=C2=A0 2%=
=C2=A0 meminfo.Shmem
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2050 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=
=A0 -10.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1834 =C2=B1=C2=A0 5%=C2=A0 m=
eminfo.Writeback
>  =C2=A0=C2=A0=C2=A0 750.83 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 -52.1%=
=C2=A0=C2=A0=C2=A0=C2=A0 360.00 =C2=B1=C2=A0 6%=C2=A0 numa-vmstat.node0.nr_=
active_anon
>  =C2=A0=C2=A0=C2=A0=C2=A0 87951 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -=
29.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 62408 =C2=B1 12%=C2=A0 numa-vmstat.node=
0.nr_inactive_anon
>  =C2=A0=C2=A0=C2=A0=C2=A0 30038=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -79.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6216 =C2=B1=
=C2=A0 3%=C2=A0 numa-vmstat.node0.nr_shmem
>  =C2=A0=C2=A0=C2=A0 750.83 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 -52.1%=
=C2=A0=C2=A0=C2=A0=C2=A0 360.00 =C2=B1=C2=A0 6%=C2=A0 numa-vmstat.node0.nr_=
zone_active_anon
>  =C2=A0=C2=A0=C2=A0=C2=A0 87951 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -=
29.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 62408 =C2=B1 12%=C2=A0 numa-vmstat.node=
0.nr_zone_inactive_anon
>  =C2=A0=C2=A0 7554028 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -71.2%=C2=
=A0=C2=A0=C2=A0 2174126 =C2=B1=C2=A0 5%=C2=A0 sched_debug.cfs_rq:/.min_vrun=
time.avg
>  =C2=A0=C2=A0 7640393 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -70.5%=C2=
=A0=C2=A0=C2=A0 2254050 =C2=B1=C2=A0 5%=C2=A0 sched_debug.cfs_rq:/.min_vrun=
time.max
>  =C2=A0=C2=A0 7291209 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -73.6%=C2=
=A0=C2=A0=C2=A0 1926973 =C2=B1=C2=A0 5%=C2=A0 sched_debug.cfs_rq:/.min_vrun=
time.min
>  =C2=A0=C2=A0=C2=A0 873.62 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -19.2%=
=C2=A0=C2=A0=C2=A0=C2=A0 705.68 =C2=B1 10%=C2=A0 sched_debug.cfs_rq:/.runna=
ble_avg.avg
>  =C2=A0=C2=A0=C2=A0 790.32 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -21.4%=
=C2=A0=C2=A0=C2=A0=C2=A0 621.34 =C2=B1 12%=C2=A0 sched_debug.cfs_rq:/.runna=
ble_avg.min
>  =C2=A0=C2=A0=C2=A0 747.11 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -22.7%=
=C2=A0=C2=A0=C2=A0=C2=A0 577.37 =C2=B1=C2=A0 3%=C2=A0 sched_debug.cfs_rq:/.=
util_avg.avg
>  =C2=A0=C2=A0=C2=A0 670.92 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -25.2%=
=C2=A0=C2=A0=C2=A0=C2=A0 501.70 =C2=B1=C2=A0 2%=C2=A0 sched_debug.cfs_rq:/.=
util_avg.min
>  =C2=A0=C2=A0=C2=A0 409.44 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -35.1%=
=C2=A0=C2=A0=C2=A0=C2=A0 265.80 =C2=B1 21%=C2=A0 sched_debug.cfs_rq:/.util_=
est_enqueued.avg
>  =C2=A0=C2=A0=C2=A0 789.44 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -20.1%=
=C2=A0=C2=A0=C2=A0=C2=A0 630.53 =C2=B1=C2=A0 5%=C2=A0 sched_debug.cfs_rq:/.=
util_est_enqueued.max
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -=
67.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1 22%=C2=A0 sched_debug=
.cpu.next_balance.stddev
>  =C2=A0=C2=A0=C2=A0 872.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 -45.0%=
=C2=A0=C2=A0=C2=A0=C2=A0 479.83 =C2=B1=C2=A0 2%=C2=A0 proc-vmstat.nr_active=
_anon
>  =C2=A0=C2=A0 1801345=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -1.7%=C2=A0=C2=A0=C2=A0 1771330=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 proc-vmstat.nr_file_pages
>  =C2=A0=C2=A0=C2=A0=C2=A0 95550=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -24.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72037=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_inactive_anon
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8752=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -3.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 84=
26=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_mapped
>  =C2=A0=C2=A0=C2=A0=C2=A0 31169=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -76.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7221 =C2=B1=
=C2=A0 2%=C2=A0 proc-vmstat.nr_shmem
>  =C2=A0=C2=A0=C2=A0 872.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 -45.0%=
=C2=A0=C2=A0=C2=A0=C2=A0 479.83 =C2=B1=C2=A0 2%=C2=A0 proc-vmstat.nr_zone_a=
ctive_anon
>  =C2=A0=C2=A0=C2=A0=C2=A0 95550=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -24.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72037=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_zone_inactive_anon
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9553 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -=
16.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7950 =C2=B1=C2=A0 3%=C2=A0 proc-v=
mstat.numa_hint_faults
>  =C2=A0 18886391=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -3.6%=C2=A0=C2=A0 18207624=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 proc-vmstat.numa_hit
>  =C2=A0 18770999=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -3.6%=C2=A0=C2=A0 18091363=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 proc-vmstat.numa_local
>  =C2=A0=C2=A0 7398756=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -4.0%=C2=A0=C2=A0=C2=A0 7105675=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 proc-vmstat.pgactivate
>  =C2=A0 18885154=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -3.6%=C2=A0=C2=A0 18206666=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 proc-vmstat.pgalloc_normal
>  =C2=A0=C2=A0 7248262=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -4.3%=C2=A0=C2=A0=C2=A0 6933915 =C2=B1=C2=A0 2%=C2=A0 proc-=
vmstat.pgdeactivate
>  =C2=A0 18894473=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -3.4%=C2=A0=C2=A0 18243898=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 proc-vmstat.pgfree
>  =C2=A0=C2=A0 7829962=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -3.0%=C2=A0=C2=A0=C2=A0 7596447 =C2=B1=C2=A0 2%=C2=A0 proc-=
vmstat.pgrotated
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <yujie.liu@intel.com>
> =

> =

> To reproduce:
> =

>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://github.com/=
intel/lkp-tests.git
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp install job.yaml=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # job file is =
attached in this email
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp split-job --compatibl=
e job.yaml # generate the yaml file for lkp run
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp run generated-ya=
ml-file
> =

>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across any failure =
that blocks the test,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~/.lkp and /l=
kp dir to run from a clean state.
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> #regzbot introduced: ca6dee6b79
> =

> =

> =

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============1648400526055447491==--

