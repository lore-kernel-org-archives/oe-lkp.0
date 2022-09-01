Content-Type: multipart/mixed; boundary="===============7293590603081752955=="
MIME-Version: 1.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: lkp@lists.01.org
Subject: Re: [btrfs] ca6dee6b79: fxmark.ssd_btrfs_MWRM_72_bufferedio.works/sec -8.4% regression #forregzbot
Date: Thu, 01 Sep 2022 14:29:41 +0200
Message-ID: <c4a244e0-1be3-9be9-a56f-6dfb0c5c5d88@leemhuis.info>
In-Reply-To: <CAL3q7H78qPSp4O=ZrCCNFwX+6L4gZgn-A5q3VydvhTfkVDEUDQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7293590603081752955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 30.08.22 12:21, Filipe Manana wrote:
> On Tue, Aug 30, 2022 at 7:58 AM Yujie Liu <yujie.liu@intel.com> wrote:
>>
>> We noticed that this case was reported when the patch was in linux-next.
>> Thanks for your comment that it is an expected result due to heavy renam=
e.
>>
>> https://lore.kernel.org/all/Ysb4T7Z8hKgdvPRk(a)xsang-OptiPlex-9020/
>>
>> This report is due to the patch being merged into mainline, if it is sti=
ll
>> the same case, please ignore this duplicate report. Sorry for the inconv=
enience.
> =

> Yes, it's the same.

In that case:

#regzbot invalid: kinda expected, as explained in
https://lore.kernel.org/all/Ysb4T7Z8hKgdvPRk(a)xsang-OptiPlex-9020/

>> On 8/30/2022 11:17, kernel test robot wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -8.4% regression of fxmark.ssd_btrfs_MWRM_72_buffered=
io.works/sec due to commit:
>>>
>>>
>>> commit: ca6dee6b7946794fa340a7290ca399a50b61705f ("btrfs: balance btree=
 dirty pages and delayed items after a rename")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>
>>> in testcase: fxmark
>>> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 C=
PU @ 2.60GHz (Ice Lake) with 128G memory
>>> with following parameters:
>>>
>>>      disk: 1SSD
>>>      media: ssd
>>>      test: MWRM
>>>      fstype: btrfs
>>>      directio: bufferedio
>>>      cpufreq_governor: performance
>>>      ucode: 0xd000363
>>>
>>> test-description: FxMark is a filesystem benchmark that test multicore =
scalability.
>>> test-url: https://github.com/sslab-gatech/fxmark
>>>
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbo=
x_group/test/testcase/ucode:
>>>    gcc-11/performance/bufferedio/1SSD/btrfs/x86_64-rhel-8.3/ssd/debian-=
11.1-x86_64-20220510.cgz/lkp-icl-2sp5/MWRM/fxmark/0xd000363
>>>
>>> commit:
>>>    b8bea09a45 ("btrfs: add trace event for submitted RAID56 bio")
>>>    ca6dee6b79 ("btrfs: balance btree dirty pages and delayed items afte=
r a rename")
>>>
>>> b8bea09a456fc31a ca6dee6b7946794fa340a7290ca
>>> ---------------- ---------------------------
>>>           %stddev     %change         %stddev
>>>               \          |                \
>>>     1821853           -13.9%    1568247 =C2=B1  3%  fxmark.ssd_btrfs_MW=
RM_36_bufferedio.works
>>>       36436           -13.9%      31362 =C2=B1  3%  fxmark.ssd_btrfs_MW=
RM_36_bufferedio.works/sec
>>>     1675102           -14.0%    1439994 =C2=B1  7%  fxmark.ssd_btrfs_MW=
RM_54_bufferedio.works
>>>       33497           -14.0%      28796 =C2=B1  7%  fxmark.ssd_btrfs_MW=
RM_54_bufferedio.works/sec
>>>     1572332            -8.4%    1440600 =C2=B1  6%  fxmark.ssd_btrfs_MW=
RM_72_bufferedio.works
>>>       31445            -8.4%      28809 =C2=B1  6%  fxmark.ssd_btrfs_MW=
RM_72_bufferedio.works/sec
>>>      356010           +80.0%     640832        fxmark.time.involuntary_=
context_switches
>>>       68.50           -24.1%      52.00        fxmark.time.percent_of_c=
pu_this_job_got
>>>      630.47           -24.0%     479.23        fxmark.time.system_time
>>>   1.335e+10           +49.8%      2e+10        cpuidle..time
>>>        1045 =C2=B1  4%     +11.8%       1168        uptime.idle
>>>       31.54           +50.2%      47.37        iostat.cpu.idle
>>>       64.16           -24.7%      48.29        iostat.cpu.system
>>>       31.17           +50.3%      46.83        vmstat.cpu.id
>>>       12.83 =C2=B1  5%     -55.8%       5.67 =C2=B1  8%  vmstat.procs.r
>>>       32.13           +15.8       47.95        mpstat.cpu.all.idle%
>>>        0.47 =C2=B1  7%      +0.1        0.53 =C2=B1  3%  mpstat.cpu.all=
.iowait%
>>>       63.37           -16.1       47.31        mpstat.cpu.all.sys%
>>>       10.04 =C2=B1  3%     +13.5%      11.39 =C2=B1  3%  perf-stat.i.me=
tric.K/sec
>>>      869.81 =C2=B1 10%     -16.2%     728.74 =C2=B1 15%  perf-stat.i.no=
de-loads
>>>      871.23 =C2=B1 10%     -16.2%     730.49 =C2=B1 15%  perf-stat.ps.n=
ode-loads
>>>        3004 =C2=B1  8%     -52.1%       1440 =C2=B1  6%  numa-meminfo.n=
ode0.Active(anon)
>>>     1218568           -10.8%    1086453        numa-meminfo.node0.Inact=
ive
>>>      351812 =C2=B1  3%     -29.0%     249640 =C2=B1 12%  numa-meminfo.n=
ode0.Inactive(anon)
>>>      120150           -79.3%      24861 =C2=B1  3%  numa-meminfo.node0.=
Shmem
>>>        3489 =C2=B1  8%     -45.0%       1919 =C2=B1  2%  meminfo.Active=
(anon)
>>>      492107           -19.0%     398809        meminfo.Committed_AS
>>>      382253           -24.6%     288151        meminfo.Inactive(anon)
>>>      124727           -76.8%      28886 =C2=B1  2%  meminfo.Shmem
>>>        2050 =C2=B1  4%     -10.5%       1834 =C2=B1  5%  meminfo.Writeb=
ack
>>>      750.83 =C2=B1  8%     -52.1%     360.00 =C2=B1  6%  numa-vmstat.no=
de0.nr_active_anon
>>>       87951 =C2=B1  3%     -29.0%      62408 =C2=B1 12%  numa-vmstat.no=
de0.nr_inactive_anon
>>>       30038           -79.3%       6216 =C2=B1  3%  numa-vmstat.node0.n=
r_shmem
>>>      750.83 =C2=B1  8%     -52.1%     360.00 =C2=B1  6%  numa-vmstat.no=
de0.nr_zone_active_anon
>>>       87951 =C2=B1  3%     -29.0%      62408 =C2=B1 12%  numa-vmstat.no=
de0.nr_zone_inactive_anon
>>>     7554028 =C2=B1  3%     -71.2%    2174126 =C2=B1  5%  sched_debug.cf=
s_rq:/.min_vruntime.avg
>>>     7640393 =C2=B1  3%     -70.5%    2254050 =C2=B1  5%  sched_debug.cf=
s_rq:/.min_vruntime.max
>>>     7291209 =C2=B1  3%     -73.6%    1926973 =C2=B1  5%  sched_debug.cf=
s_rq:/.min_vruntime.min
>>>      873.62 =C2=B1  7%     -19.2%     705.68 =C2=B1 10%  sched_debug.cf=
s_rq:/.runnable_avg.avg
>>>      790.32 =C2=B1  7%     -21.4%     621.34 =C2=B1 12%  sched_debug.cf=
s_rq:/.runnable_avg.min
>>>      747.11 =C2=B1  3%     -22.7%     577.37 =C2=B1  3%  sched_debug.cf=
s_rq:/.util_avg.avg
>>>      670.92 =C2=B1  5%     -25.2%     501.70 =C2=B1  2%  sched_debug.cf=
s_rq:/.util_avg.min
>>>      409.44 =C2=B1  9%     -35.1%     265.80 =C2=B1 21%  sched_debug.cf=
s_rq:/.util_est_enqueued.avg
>>>      789.44 =C2=B1  3%     -20.1%     630.53 =C2=B1  5%  sched_debug.cf=
s_rq:/.util_est_enqueued.max
>>>        0.00 =C2=B1 13%     -67.3%       0.00 =C2=B1 22%  sched_debug.cp=
u.next_balance.stddev
>>>      872.67 =C2=B1  8%     -45.0%     479.83 =C2=B1  2%  proc-vmstat.nr=
_active_anon
>>>     1801345            -1.7%    1771330        proc-vmstat.nr_file_pages
>>>       95550           -24.6%      72037        proc-vmstat.nr_inactive_=
anon
>>>        8752            -3.7%       8426        proc-vmstat.nr_mapped
>>>       31169           -76.8%       7221 =C2=B1  2%  proc-vmstat.nr_shmem
>>>      872.67 =C2=B1  8%     -45.0%     479.83 =C2=B1  2%  proc-vmstat.nr=
_zone_active_anon
>>>       95550           -24.6%      72037        proc-vmstat.nr_zone_inac=
tive_anon
>>>        9553 =C2=B1 10%     -16.8%       7950 =C2=B1  3%  proc-vmstat.nu=
ma_hint_faults
>>>    18886391            -3.6%   18207624        proc-vmstat.numa_hit
>>>    18770999            -3.6%   18091363        proc-vmstat.numa_local
>>>     7398756            -4.0%    7105675        proc-vmstat.pgactivate
>>>    18885154            -3.6%   18206666        proc-vmstat.pgalloc_norm=
al
>>>     7248262            -4.3%    6933915 =C2=B1  2%  proc-vmstat.pgdeact=
ivate
>>>    18894473            -3.4%   18243898        proc-vmstat.pgfree
>>>     7829962            -3.0%    7596447 =C2=B1  2%  proc-vmstat.pgrotat=
ed
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <yujie.liu@intel.com>
>>>
>>>
>>> To reproduce:
>>>
>>>          git clone https://github.com/intel/lkp-tests.git
>>>          cd lkp-tests
>>>          sudo bin/lkp install job.yaml           # job file is attached=
 in this email
>>>          bin/lkp split-job --compatible job.yaml # generate the yaml fi=
le for lkp run
>>>          sudo bin/lkp run generated-yaml-file
>>>
>>>          # if come across any failure that blocks the test,
>>>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>>>
>>>
>>> Disclaimer:
>>> Results have been estimated based on internal Intel analysis and are pr=
ovided
>>> for informational purposes only. Any difference in system hardware or s=
oftware
>>> design or configuration may affect actual performance.
>>>
>>>
>>> #regzbot introduced: ca6dee6b79
>>>
>>>
>>>
>>> _______________________________________________
>>> LKP mailing list -- lkp(a)lists.01.org
>>> To unsubscribe send an email to lkp-leave(a)lists.01.org
> =

>=20
--===============7293590603081752955==--

