Content-Type: multipart/mixed; boundary="===============9159351268553134870=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/vmstat] 6cdb18ad98: -8.5% will-it-scale.per_thread_ops
Date: Thu, 21 Jan 2016 14:47:28 +0800
Message-ID: <8737tro2db.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160107112301.GE4062@osiris>
List-Id: <oe-lkp.lists.linux.dev>

--===============9159351268553134870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Heiko Carstens <heiko.carstens@de.ibm.com> writes:

> On Wed, Jan 06, 2016 at 11:20:55AM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> commit 6cdb18ad98a49f7e9b95d538a0614cde827404b8 ("mm/vmstat: fix overflo=
w in mod_zone_page_state()")
>> =

>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/ivb42/pre=
ad1/will-it-scale
>> =

>> commit: =

>>   cc28d6d80f6ab494b10f0e2ec949eacd610f66e3
>>   6cdb18ad98a49f7e9b95d538a0614cde827404b8
>> =

>> cc28d6d80f6ab494 6cdb18ad98a49f7e9b95d538a0 =

>> ---------------- -------------------------- =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>    2733943 .  0%      -8.5%    2502129 .  0%  will-it-scale.per_thread_o=
ps
>>       3410 .  0%      -2.0%       3343 .  0%  will-it-scale.time.system_=
time
>>     340.08 .  0%     +19.7%     406.99 .  0%  will-it-scale.time.user_ti=
me
>>   69882822 .  2%     -24.3%   52926191 .  5%  cpuidle.C1-IVT.time
>>     340.08 .  0%     +19.7%     406.99 .  0%  time.user_time
>>     491.25 .  6%     -17.7%     404.25 .  7%  numa-vmstat.node0.nr_alloc=
_batch
>>       2799 . 20%     -36.6%       1776 .  0%  numa-vmstat.node0.nr_mapped
>>     630.00 .140%    +244.4%       2169 .  1%  numa-vmstat.node1.nr_inact=
ive_anon
>
> Hmm... this is odd. I did review all callers of mod_zone_page_state() and
> couldn't find anything obvious that would go wrong after the int -> long
> change.
>
> I also tried the "pread1_threads" test case from
> https://github.com/antonblanchard/will-it-scale.git
>
> However the results seem to vary a lot after a reboot(!), at least on s39=
0.
>
> So I'm not sure if this is really a regression.

Most part of the regression is restored for v4.4.  But because the changes =
are
like "V", it is hard to bisect.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase:
  gcc-4.9/performance/x86_64-rhel/thread/24/debian-x86_64-2015-02-07.cgz/iv=
b42/pread1/will-it-scale

commit: =

  cc28d6d80f6ab494b10f0e2ec949eacd610f66e3
  6cdb18ad98a49f7e9b95d538a0614cde827404b8
  v4.4

cc28d6d80f6ab494 6cdb18ad98a49f7e9b95d538a0                       v4.4 =

---------------- -------------------------- -------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

   3083436 =C2=B1  0%      -9.6%    2788374 =C2=B1  0%      -3.7%    297013=
0 =C2=B1  0%  will-it-scale.per_thread_ops
      6447 =C2=B1  0%      -2.2%       6308 =C2=B1  0%      -0.3%       642=
5 =C2=B1  0%  will-it-scale.time.system_time
    776.90 =C2=B1  0%     +17.9%     915.71 =C2=B1  0%      +2.9%     799.1=
2 =C2=B1  0%  will-it-scale.time.user_time
    316177 =C2=B1  4%      -4.6%     301616 =C2=B1  3%     -10.3%     28356=
3 =C2=B1  3%  softirqs.RCU
    776.90 =C2=B1  0%     +17.9%     915.71 =C2=B1  0%      +2.9%     799.1=
2 =C2=B1  0%  time.user_time
    777.33 =C2=B1  7%     +20.8%     938.67 =C2=B1  7%      +7.5%     836.0=
0 =C2=B1  8%  slabinfo.blkdev_requests.active_objs
    777.33 =C2=B1  7%     +20.8%     938.67 =C2=B1  7%      +7.5%     836.0=
0 =C2=B1  8%  slabinfo.blkdev_requests.num_objs
  74313962 =C2=B1 44%     -16.5%   62053062 =C2=B1 41%     -49.9%   3724696=
7 =C2=B1  8%  cpuidle.C1-IVT.time
  43381614 =C2=B1 79%     +24.4%   53966568 =C2=B1111%    +123.9%   9713579=
1 =C2=B1 33%  cpuidle.C1E-IVT.time
     97.67 =C2=B1 36%     +95.2%     190.67 =C2=B1 63%    +122.5%     217.3=
3 =C2=B1 41%  cpuidle.C3-IVT.usage
   3679437 =C2=B1 69%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  latency_stats.avg.nfs_wait_on_request.nfs_updatepage.nfs_writ=
e_end.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
   5177475 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  latency_stats.max.nfs_wait_on_request.nfs_updatepage.nfs_writ=
e_end.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
  11726393 =C2=B1112%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  latency_stats.sum.nfs_wait_on_request.nfs_updatepage.nfs_writ=
e_end.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
    178.07 =C2=B1  0%      -1.3%     175.79 =C2=B1  0%      -0.8%     176.6=
2 =C2=B1  0%  turbostat.CorWatt
      0.20 =C2=B1  2%     -16.9%       0.16 =C2=B1 18%     -11.9%       0.1=
7 =C2=B1 17%  turbostat.Pkg%pc6
    207.38 =C2=B1  0%      -1.1%     205.13 =C2=B1  0%      -0.7%     205.9=
9 =C2=B1  0%  turbostat.PkgWatt
      6889 =C2=B1 33%     -49.2%       3497 =C2=B1 86%     -19.4%       555=
2 =C2=B1 27%  numa-vmstat.node0.nr_active_anon
    483.33 =C2=B1 29%     -32.3%     327.00 =C2=B1 48%      +0.1%     483.6=
7 =C2=B1 29%  numa-vmstat.node0.nr_page_table_pages
     27536 =C2=B1 96%     +10.9%      30535 =C2=B1 78%    +148.5%      6841=
8 =C2=B1  2%  numa-vmstat.node0.numa_other
    214.00 =C2=B1 11%     +18.1%     252.67 =C2=B1  4%      +2.8%     220.0=
0 =C2=B1  9%  numa-vmstat.node1.nr_kernel_stack
    370.67 =C2=B1 38%     +42.0%     526.33 =C2=B1 30%      -0.2%     370.0=
0 =C2=B1 39%  numa-vmstat.node1.nr_page_table_pages
     61177 =C2=B1 43%      -5.2%      57976 =C2=B1 41%     -66.3%      2064=
4 =C2=B1 10%  numa-vmstat.node1.numa_other
     78172 =C2=B1 13%     -16.1%      65573 =C2=B1 18%      -5.8%      7362=
6 =C2=B1  9%  numa-meminfo.node0.Active
     27560 =C2=B1 33%     -49.2%      14006 =C2=B1 86%     -19.4%      2220=
3 =C2=B1 27%  numa-meminfo.node0.Active(anon)
      3891 =C2=B1 58%     -38.1%       2407 =C2=B1100%     -58.8%       160=
4 =C2=B1110%  numa-meminfo.node0.AnonHugePages
      1934 =C2=B1 29%     -32.3%       1309 =C2=B1 48%      +0.1%       193=
6 =C2=B1 29%  numa-meminfo.node0.PageTables
     63139 =C2=B1 17%     +19.8%      75670 =C2=B1 16%      +6.0%      6693=
7 =C2=B1 10%  numa-meminfo.node1.Active
      3432 =C2=B1 11%     +18.0%       4049 =C2=B1  4%      +2.8%       352=
7 =C2=B1  9%  numa-meminfo.node1.KernelStack
      1483 =C2=B1 38%     +42.0%       2106 =C2=B1 30%      -0.2%       148=
1 =C2=B1 39%  numa-meminfo.node1.PageTables
      1.47 =C2=B1  1%     -11.8%       1.30 =C2=B1  2%      -7.0%       1.3=
7 =C2=B1  3%  perf-profile.cycles-pp.___might_sleep.__might_sleep.find_lock=
_entry.shmem_getpage_gfp.shmem_file_read_iter
      2.00 =C2=B1  2%     -11.3%       1.78 =C2=B1  2%      -7.2%       1.8=
6 =C2=B1  2%  perf-profile.cycles-pp.__might_sleep.find_lock_entry.shmem_ge=
tpage_gfp.shmem_file_read_iter.__vfs_read
      2.30 =C2=B1  4%     +33.6%       3.07 =C2=B1  0%      -1.9%       2.2=
6 =C2=B1  1%  perf-profile.cycles-pp.atime_needs_update.touch_atime.shmem_f=
ile_read_iter.__vfs_read.vfs_read
      1.05 =C2=B1  1%     -27.7%       0.76 =C2=B1  1%      -8.0%       0.9=
6 =C2=B1  0%  perf-profile.cycles-pp.current_fs_time.atime_needs_update.tou=
ch_atime.shmem_file_read_iter.__vfs_read
      2.21 =C2=B1  3%     -11.9%       1.94 =C2=B1  2%      -9.4%       2.0=
0 =C2=B1  0%  perf-profile.cycles-pp.fput.entry_SYSCALL_64_fastpath
      0.78 =C2=B1  2%     +38.5%       1.08 =C2=B1  2%     +23.1%       0.9=
6 =C2=B1  3%  perf-profile.cycles-pp.fsnotify.vfs_read.sys_pread64.entry_SY=
SCALL_64_fastpath
      2.87 =C2=B1  7%     +42.6%       4.09 =C2=B1  1%      -0.3%       2.8=
6 =C2=B1  2%  perf-profile.cycles-pp.touch_atime.shmem_file_read_iter.__vfs=
_read.vfs_read.sys_pread64
      6.68 =C2=B1  2%      -7.3%       6.19 =C2=B1  1%      -6.7%       6.2=
3 =C2=B1  1%  perf-profile.cycles-pp.unlock_page.shmem_file_read_iter.__vfs=
_read.vfs_read.sys_pread64


Best Regards,
Huang, Ying

--===============9159351268553134870==--

