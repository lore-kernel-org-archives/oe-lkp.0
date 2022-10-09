Content-Type: multipart/mixed; boundary="===============5443672119611182988=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [blk] 8c5035dfbb: fio.read_iops -10.6% regression
Date: Sun, 09 Oct 2022 13:47:29 +0800
Message-ID: <de2cc259-727a-3707-6738-1c5ab41075a2@intel.com>
In-Reply-To: <d5279fc2-38b3-6d20-4404-604d5c7277e2@huaweicloud.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5443672119611182988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kuai,

On 10/8/22 16:00, Yu Kuai wrote:
> Hi,
> =

> =E5=9C=A8 2022/10/08 10:50, kernel test robot =E5=86=99=E9=81=93:
>> Greeting,
>>
>> FYI, we noticed a -10.6% regression of fio.read_iops due to commit:
> =

> I don't know how this is working but I'm *sure* this commit won't affect
> performance. Please take a look at the commit, only wbt initialization
> is touched, which is done while creating the device:
> =

> device_add_disk
> =C2=A0blk_register_queue
> =C2=A0 wbt_enable_default
> =C2=A0=C2=A0 wbt_init
> =

> And io path is the same with or without this commit.
> =

> By the way, wbt should only work for write.
Some information here:
It looks like the line
    wbt_set_write_cache(q, test_bit(QUEUE_FLAG_WC, &q->queue_flags));
matters.

If move only this line to original position based on 8c5035dfbb,
the regression is gone.

If move only this line before ret =3D rq_qos_add() (just like your patch
did, but only with this line) based on 8c5035dfbb, the regression can
be reproduced.


Regards
Yin, Fengwei

> =

> Thanks,
> Kuai
>>
>> commit: 8c5035dfbb9475b67c82b3fdb7351236525bf52b ("blk-wbt: call rq_qos_=
add() after wb_normal is initialized")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: fio-basic
>> on test machine: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CP=
U @ 2.30GHz (Cascade Lake) with 192G memory
>> with following parameters:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0runtime: 300s
>> =C2=A0=C2=A0=C2=A0=C2=A0nr_task: 8t
>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1SSD
>> =C2=A0=C2=A0=C2=A0=C2=A0fs: btrfs
>> =C2=A0=C2=A0=C2=A0=C2=A0rw: randread
>> =C2=A0=C2=A0=C2=A0=C2=A0bs: 2M
>> =C2=A0=C2=A0=C2=A0=C2=A0ioengine: sync
>> =C2=A0=C2=A0=C2=A0=C2=A0test_size: 256g
>> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
>>
>> test-description: Fio is a tool that will spawn a number of threads or p=
rocesses doing a particular type of I/O action as specified by the user.
>> test-url: https://github.com/axboe/fio
>>
>>
>> Details are as below:
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/run=
time/rw/tbox_group/test_size/testcase:
>> =C2=A0=C2=A0 2M/gcc-11/performance/1SSD/btrfs/sync/x86_64-rhel-8.3/8t/de=
bian-11.1-x86_64-20220510.cgz/300s/randread/lkp-csl-2ap4/256g/fio-basic
>>
>> commit:
>> =C2=A0=C2=A0 f7de4886fe ("rnbd-srv: remove struct rnbd_dev")
>> =C2=A0=C2=A0 8c5035dfbb ("blk-wbt: call rq_qos_add() after wb_normal is =
initialized")
>>
>> f7de4886fe8f008a 8c5035dfbb9475b67c82b3fdb73
>> ---------------- ---------------------------
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=
=A0=C2=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %st=
ddev
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1106%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 80%=
=C2=A0 fio.latency_20ms%
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1 33%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 12%=
=C2=A0 fio.latency_4ms%
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2508=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -10.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=
243=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fio.read_bw_MBps
>> =C2=A0=C2=A0=C2=A0 6717440=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +17.6%=C2=A0=C2=A0=C2=A0 7897088=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 fio.read_clat_90%_us
>> =C2=A0=C2=A0=C2=A0 6892202=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +19.0%=C2=A0=C2=A0=C2=A0 8202922=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 fio.read_clat_95%_us
>> =C2=A0=C2=A0=C2=A0 7602176 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +18.4=
%=C2=A0=C2=A0=C2=A0 9000277 =C2=B1=C2=A0 3%=C2=A0 fio.read_clat_99%_us
>> =C2=A0=C2=A0=C2=A0 6374238=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +11.8%=C2=A0=C2=A0=C2=A0 7127450=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 fio.read_clat_mean_us
>> =C2=A0=C2=A0=C2=A0=C2=A0 363825 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +74.9=
%=C2=A0=C2=A0=C2=A0=C2=A0 636378 =C2=B1=C2=A0 5%=C2=A0 fio.read_clat_stddev
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1254=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -10.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=
121=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fio.read_iops
>> =C2=A0=C2=A0=C2=A0=C2=A0 104.97=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.8%=C2=A0=C2=A0=C2=A0=C2=A0 117.32=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 fio.time.elapsed_time
>> =C2=A0=C2=A0=C2=A0=C2=A0 104.97=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.8%=C2=A0=C2=A0=C2=A0=C2=A0 117.32=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 fio.time.elapsed_time.max
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13731=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +5.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14498 =
=C2=B1=C2=A0 4%=C2=A0 fio.time.maximum_resident_set_size
>> =C2=A0=C2=A0=C2=A0=C2=A0 116.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.2%=C2=A0=C2=A0=C2=A0=C2=A0 106.50=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fio.time.percent_of_cpu_this_job_got
>> =C2=A0 1.998e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +11.4%=C2=A0 2.226e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu=
idle..time
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.27 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +4.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.42=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iostat.cpu.iowait
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.49 =C2=B1 68%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -2.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.38 =C2=B1152%=
=C2=A0 perf-profile.children.cycles-pp.number
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.49 =C2=B1 68%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -2.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.98 =C2=B1175%=
=C2=A0 perf-profile.self.cycles-pp.number
>> =C2=A0=C2=A0=C2=A0=C2=A0 557763=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +5.4%=C2=A0=C2=A0=C2=A0=C2=A0 587781=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.pgfault
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25488=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 26274=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.pgreuse
>> =C2=A0=C2=A0=C2=A0 2459048=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -10.1%=C2=A0=C2=A0=C2=A0 2209482=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 vmstat.io.bi
>> =C2=A0=C2=A0=C2=A0=C2=A0 184649 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 =
-10.4%=C2=A0=C2=A0=C2=A0=C2=A0 165526 =C2=B1=C2=A0 7%=C2=A0 vmstat.system.cs
>> =C2=A0=C2=A0=C2=A0=C2=A0 111733 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0 +61.8=
%=C2=A0=C2=A0=C2=A0=C2=A0 180770 =C2=B1 21%=C2=A0 numa-meminfo.node0.AnonPa=
ges
>> =C2=A0=C2=A0=C2=A0=C2=A0 113221 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0 +60.2=
%=C2=A0=C2=A0=C2=A0=C2=A0 181416 =C2=B1 21%=C2=A0 numa-meminfo.node0.Inacti=
ve(anon)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11301 =C2=B1 24%=C2=A0=C2=A0=C2=A0 +164.5=
%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 29888 =C2=B1117%=C2=A0 numa-meminfo.node2.A=
ctive(file)
>> =C2=A0=C2=A0=C2=A0=C2=A0 104911 =C2=B1 39%=C2=A0=C2=A0=C2=A0=C2=A0 -80.5=
%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20456 =C2=B1100%=C2=A0 numa-meminfo.node3.A=
nonHugePages
>> =C2=A0=C2=A0=C2=A0=C2=A0 131666 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0 -67.9=
%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42297 =C2=B1 82%=C2=A0 numa-meminfo.node3.A=
nonPages
>> =C2=A0=C2=A0=C2=A0=C2=A0 132698 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0 -67.5=
%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43158 =C2=B1 81%=C2=A0 numa-meminfo.node3.I=
nactive(anon)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27934 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0 =
+61.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 45196 =C2=B1 21%=C2=A0 numa-vmstat.nod=
e0.nr_anon_pages
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28306 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0 =
+60.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 45358 =C2=B1 21%=C2=A0 numa-vmstat.nod=
e0.nr_inactive_anon
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28305 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0 =
+60.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 45357 =C2=B1 21%=C2=A0 numa-vmstat.nod=
e0.nr_zone_inactive_anon
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6291 =C2=B1 24%=C2=A0=C2=A0=C2=A0=
=C2=A0 +68.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10567 =C2=B1 26%=C2=A0 numa-vms=
tat.node2.workingset_nodes
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32925 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0 =
-67.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10571 =C2=B1 82%=C2=A0 numa-vmstat.nod=
e3.nr_anon_pages
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33182 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0 =
-67.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10786 =C2=B1 81%=C2=A0 numa-vmstat.nod=
e3.nr_inactive_anon
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33182 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0 =
-67.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10786 =C2=B1 81%=C2=A0 numa-vmstat.nod=
e3.nr_zone_inactive_anon
>> =C2=A0=C2=A0=C2=A0=C2=A0 161.78 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 =
-28.2%=C2=A0=C2=A0=C2=A0=C2=A0 116.10 =C2=B1 30%=C2=A0 sched_debug.cfs_rq:/=
.runnable_avg.avg
>> =C2=A0=C2=A0=C2=A0=C2=A0 161.46 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 =
-28.2%=C2=A0=C2=A0=C2=A0=C2=A0 115.85 =C2=B1 30%=C2=A0 sched_debug.cfs_rq:/=
.util_avg.avg
>> =C2=A0=C2=A0=C2=A0=C2=A0 426382=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.0%=C2=A0=C2=A0=C2=A0=C2=A0 473345 =C2=B1=C2=A0 6%=
=C2=A0 sched_debug.cpu.clock.avg
>> =C2=A0=C2=A0=C2=A0=C2=A0 426394=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.0%=C2=A0=C2=A0=C2=A0=C2=A0 473357 =C2=B1=C2=A0 6%=
=C2=A0 sched_debug.cpu.clock.max
>> =C2=A0=C2=A0=C2=A0=C2=A0 426370=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.0%=C2=A0=C2=A0=C2=A0=C2=A0 473331 =C2=B1=C2=A0 6%=
=C2=A0 sched_debug.cpu.clock.min
>> =C2=A0=C2=A0=C2=A0=C2=A0 426139=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +10.9%=C2=A0=C2=A0=C2=A0=C2=A0 472586 =C2=B1=C2=A0 6%=
=C2=A0 sched_debug.cpu.clock_task.avg
>> =C2=A0=C2=A0=C2=A0=C2=A0 426368=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.0%=C2=A0=C2=A0=C2=A0=C2=A0 473130 =C2=B1=C2=A0 6%=
=C2=A0 sched_debug.cpu.clock_task.max
>> =C2=A0=C2=A0=C2=A0=C2=A0 416196=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.1%=C2=A0=C2=A0=C2=A0=C2=A0 462228 =C2=B1=C2=A0 6%=
=C2=A0 sched_debug.cpu.clock_task.min
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1156 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=
=A0=C2=A0 -10.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1031 =C2=B1=C2=A0 6%=
=C2=A0 sched_debug.cpu.curr->pid.stddev
>> =C2=A0=C2=A0=C2=A0=C2=A0 426372=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.0%=C2=A0=C2=A0=C2=A0=C2=A0 473334 =C2=B1=C2=A0 6%=
=C2=A0 sched_debug.cpu_clk
>> =C2=A0=C2=A0=C2=A0=C2=A0 425355=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.0%=C2=A0=C2=A0=C2=A0=C2=A0 472318 =C2=B1=C2=A0 6%=
=C2=A0 sched_debug.ktime
>> =C2=A0=C2=A0=C2=A0=C2=A0 426826=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.0%=C2=A0=C2=A0=C2=A0=C2=A0 473787 =C2=B1=C2=A0 6%=
=C2=A0 sched_debug.sched_clk
>> =C2=A0 1.263e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -7.9%=C2=A0 1.164e+09 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.branch=
-instructions
>> =C2=A0=C2=A0=C2=A0=C2=A0 190886 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 =
-10.8%=C2=A0=C2=A0=C2=A0=C2=A0 170290 =C2=B1=C2=A0 7%=C2=A0 perf-stat.i.con=
text-switches
>> =C2=A0 1.979e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -8.8%=C2=A0 1.804e+09 =C2=B1=C2=A0 2%=C2=A0 perf-stat.i.dTLB-l=
oads
>> =C2=A0 8.998e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -8.2%=C2=A0 8.257e+08 =C2=B1=C2=A0 2%=C2=A0 perf-stat.i.dTLB-s=
tores
>> =C2=A0 6.455e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -8.0%=C2=A0 5.938e+09 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.instru=
ctions
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21.78=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19.95=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.i.metric.M/sec
>> =C2=A0=C2=A0=C2=A0 7045315 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -14.0=
%=C2=A0=C2=A0=C2=A0 6057863 =C2=B1=C2=A0 6%=C2=A0 perf-stat.i.node-load-mis=
ses
>> =C2=A0=C2=A0=C2=A0 2658563 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -21.9=
%=C2=A0=C2=A0=C2=A0 2077647 =C2=B1 12%=C2=A0 perf-stat.i.node-loads
>> =C2=A0=C2=A0=C2=A0=C2=A0 414822 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 =
-12.9%=C2=A0=C2=A0=C2=A0=C2=A0 361455 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.nod=
e-store-misses
>> =C2=A0 1.251e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -7.8%=C2=A0 1.154e+09 =C2=B1=C2=A0 3%=C2=A0 perf-stat.ps.branc=
h-instructions
>> =C2=A0=C2=A0=C2=A0=C2=A0 189082 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 =
-10.7%=C2=A0=C2=A0=C2=A0=C2=A0 168849 =C2=B1=C2=A0 7%=C2=A0 perf-stat.ps.co=
ntext-switches
>> =C2=A0=C2=A0 1.96e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -8.8%=C2=A0 1.789e+09 =C2=B1=C2=A0 2%=C2=A0 perf-stat.ps.dT=
LB-loads
>> =C2=A0 8.912e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -8.1%=C2=A0 8.187e+08 =C2=B1=C2=A0 2%=C2=A0 perf-stat.ps.dTLB-=
stores
>> =C2=A0 6.393e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -7.9%=C2=A0 5.888e+09 =C2=B1=C2=A0 3%=C2=A0 perf-stat.ps.instr=
uctions
>> =C2=A0=C2=A0=C2=A0 6978485 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -13.9=
%=C2=A0=C2=A0=C2=A0 6006510 =C2=B1=C2=A0 6%=C2=A0 perf-stat.ps.node-load-mi=
sses
>> =C2=A0=C2=A0=C2=A0 2633627 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -21.8=
%=C2=A0=C2=A0=C2=A0 2060033 =C2=B1 12%=C2=A0 perf-stat.ps.node-loads
>> =C2=A0=C2=A0=C2=A0=C2=A0 410822 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 =
-12.8%=C2=A0=C2=A0=C2=A0=C2=A0 358289 =C2=B1=C2=A0 3%=C2=A0 perf-stat.ps.no=
de-store-misses
>>
>>
>> If you fix the issue, kindly add following tag
>> | Reported-by: kernel test robot <yujie.liu@intel.com>
>> | Link: https://lore.kernel.org/r/202210081045.77ddf59b-yujie.liu(a)inte=
l.com
>>
>>
>> To reproduce:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://githu=
b.com/intel/lkp-tests.git
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp install jo=
b.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # job fi=
le is attached in this email
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp split-job --com=
patible job.yaml # generate the yaml file for lkp run
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp run genera=
ted-yaml-file
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across any fa=
ilure that blocks the test,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~/.lkp =
and /lkp dir to run from a clean state.
>>
>>
>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>>
>>
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============5443672119611182988==--

