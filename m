Content-Type: multipart/mixed; boundary="===============2926082314190581479=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Wed, 08 Jun 2016 15:21:56 +0800
Message-ID: <87a8iw5enf.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160606095136.GA79951@black.fi.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2926082314190581479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> writes:

> On Mon, Jun 06, 2016 at 10:27:24AM +0800, kernel test robot wrote:
>> =

>> FYI, we noticed a -6.3% regression of unixbench.score due to commit:
>> =

>> commit 5c0a85fad949212b3e059692deecdeed74ae7ec7 ("mm: make faultaround p=
roduce old ptes")
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> =

>> in testcase: unixbench
>> on test machine: lituya: 16 threads Haswell High-end Desktop (i7-5960X 3=
.0G) with 16G memory
>> with following parameters: cpufreq_governor=3Dperformance/nr_task=3D1/te=
st=3Dshell8
>> =

>> =

>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>> =

>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcas=
e:
>>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lituya/=
shell8/unixbench
>> =

>> commit: =

>>   4b50bcc7eda4d3cc9e3f2a0aa60e590fedf728c5
>>   5c0a85fad949212b3e059692deecdeed74ae7ec7
>> =

>> 4b50bcc7eda4d3cc 5c0a85fad949212b3e059692de =

>> ---------------- -------------------------- =

>>        fail:runs  %reproduction    fail:runs
>>            |             |             |    =

>>           3:4          -75%            :4     kmsg.DHCP/BOOTP:Reply_not_=
for_us,op[#]xid[#]
>>          %stddev     %change         %stddev
>>              \          |                \  =

>>      14321 .  0%      -6.3%      13425 .  0%  unixbench.score
>>    1996897 .  0%      -6.1%    1874635 .  0%  unixbench.time.involuntary=
_context_switches
>>  1.721e+08 .  0%      -6.2%  1.613e+08 .  0%  unixbench.time.minor_page_=
faults
>>     758.65 .  0%      -3.0%     735.86 .  0%  unixbench.time.system_time
>>     387.66 .  0%      +5.4%     408.49 .  0%  unixbench.time.user_time
>>    5950278 .  0%      -6.2%    5583456 .  0%  unixbench.time.voluntary_c=
ontext_switches
>
> That's weird.
>
> I don't understand why the change would reduce number or minor faults.
> It should stay the same on x86-64. Rise of user_time is puzzling too.

unixbench runs in fixed time mode.  That is, the total time to run
unixbench is fixed, but the work done varies.  So the minor_page_faults
change may reflect only the work done.

> Hm. Is reproducible? Across reboot?

Yes.  LKP will run every benchmark after reboot via kexec.  We run 3
times for both the commit and its parent.  The result is quite stable.
You can find the standard deviation in percent is near 0 across
different runs.  Here is another comparison with profile data.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/debug-setup/kconfig/nr_task/rootfs/tbox_group/tes=
t/testcase:
  gcc-4.9/performance/profile/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/li=
tuya/shell8/unixbench

commit: =

  4b50bcc7eda4d3cc9e3f2a0aa60e590fedf728c5
  5c0a85fad949212b3e059692deecdeed74ae7ec7

4b50bcc7eda4d3cc 5c0a85fad949212b3e059692de =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     14056 =C2=B1  0%      -6.3%      13172 =C2=B1  0%  unixbench.score
   6464046 =C2=B1  0%      -6.1%    6071922 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
 5.555e+08 =C2=B1  0%      -6.2%  5.211e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
      2537 =C2=B1  0%      -3.2%       2455 =C2=B1  0%  unixbench.time.syst=
em_time
      1284 =C2=B1  0%      +5.8%       1359 =C2=B1  0%  unixbench.time.user=
_time
  19192611 =C2=B1  0%      -6.2%   18010830 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
   7709931 =C2=B1  0%     -11.0%    6860574 =C2=B1  0%  cpuidle.C1-HSW.usage
      6900 =C2=B1  1%     -43.9%       3871 =C2=B1  0%  proc-vmstat.nr_acti=
ve_file
     40813 =C2=B1  1%     -77.9%       9015 =C2=B1114%  softirqs.NET_RX
    111331 =C2=B1  1%     -13.3%      96503 =C2=B1  0%  meminfo.Active
     27603 =C2=B1  1%     -43.9%      15486 =C2=B1  0%  meminfo.Active(file)
     93169 =C2=B1  0%      -5.8%      87766 =C2=B1  0%  vmstat.system.cs
     19768 =C2=B1  0%      -1.7%      19437 =C2=B1  0%  vmstat.system.in
      6.22 =C2=B1  0%     +10.3%       6.86 =C2=B1  0%  turbostat.CPU%c3
      0.02 =C2=B1 20%     -85.7%       0.00 =C2=B1141%  turbostat.Pkg%pc3
     68.99 =C2=B1  0%      -1.7%      67.84 =C2=B1  0%  turbostat.PkgWatt
      1.38 =C2=B1  5%     -42.0%       0.80 =C2=B1  5%  perf-profile.cycles=
-pp.page_remove_rmap.unmap_page_range.unmap_single_vma.unmap_vmas.exit_mmap
      0.83 =C2=B1  4%     +28.8%       1.07 =C2=B1 21%  perf-profile.cycles=
-pp.release_pages.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_m=
mu.exit_mmap
      1.55 =C2=B1  3%     -10.6%       1.38 =C2=B1  2%  perf-profile.cycles=
-pp.unmap_single_vma.unmap_vmas.exit_mmap.mmput.flush_old_exec
      1.59 =C2=B1  3%      -9.8%       1.44 =C2=B1  3%  perf-profile.cycles=
-pp.unmap_vmas.exit_mmap.mmput.flush_old_exec.load_elf_binary
    389.00 =C2=B1  0%     +32.1%     514.00 =C2=B1  8%  slabinfo.file_lock_=
cache.active_objs
    389.00 =C2=B1  0%     +32.1%     514.00 =C2=B1  8%  slabinfo.file_lock_=
cache.num_objs
      7075 =C2=B1  3%     -17.7%       5823 =C2=B1  7%  slabinfo.pid.active=
_objs
      7075 =C2=B1  3%     -17.7%       5823 =C2=B1  7%  slabinfo.pid.num_ob=
js
      0.67 =C2=B1 34%     +86.4%       1.24 =C2=B1 30%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
     -9013 =C2=B1 -1%     +14.4%     -10315 =C2=B1 -9%  sched_debug.cfs_rq:=
/.spread0.avg
     83127 =C2=B1  5%     +16.9%      97163 =C2=B1  8%  sched_debug.cpu.avg=
_idle.min
     17777 =C2=B1 16%     +66.6%      29608 =C2=B1 22%  sched_debug.cpu.cur=
r->pid.avg
     50223 =C2=B1 10%     +49.3%      74974 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.max
     22281 =C2=B1 13%     +51.8%      33816 =C2=B1  6%  sched_debug.cpu.cur=
r->pid.stddev
    251.79 =C2=B1  5%     -13.8%     217.15 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.max
   -261.12 =C2=B1 -2%     -13.4%    -226.03 =C2=B1 -1%  sched_debug.cpu.nr_=
uninterruptible.min
    221.14 =C2=B1  3%     -14.7%     188.60 =C2=B1  1%  sched_debug.cpu.nr_=
uninterruptible.stddev
  1.94e+11 =C2=B1  0%      -5.8%  1.827e+11 =C2=B1  0%  perf-stat.L1-dcache=
-load-misses
 3.496e+12 =C2=B1  0%      -6.5%  3.268e+12 =C2=B1  0%  perf-stat.L1-dcache=
-loads
 2.262e+12 =C2=B1  1%      -5.5%  2.137e+12 =C2=B1  0%  perf-stat.L1-dcache=
-stores
 9.711e+10 =C2=B1  0%      -3.7%  9.353e+10 =C2=B1  0%  perf-stat.L1-icache=
-load-misses
 8.051e+08 =C2=B1  0%      -8.8%  7.343e+08 =C2=B1  1%  perf-stat.LLC-load-=
misses
 7.184e+10 =C2=B1  1%      -5.6%   6.78e+10 =C2=B1  0%  perf-stat.LLC-loads
 5.867e+08 =C2=B1  2%      -7.0%  5.456e+08 =C2=B1  0%  perf-stat.LLC-store=
-misses
 1.524e+10 =C2=B1  1%      -5.6%  1.438e+10 =C2=B1  0%  perf-stat.LLC-stores
 2.711e+12 =C2=B1  0%      -6.3%  2.539e+12 =C2=B1  0%  perf-stat.branch-in=
structions
 5.948e+10 =C2=B1  0%      -3.9%  5.715e+10 =C2=B1  0%  perf-stat.branch-lo=
ad-misses
 2.715e+12 =C2=B1  0%      -6.4%  2.542e+12 =C2=B1  0%  perf-stat.branch-lo=
ads
 5.947e+10 =C2=B1  0%      -3.9%  5.713e+10 =C2=B1  0%  perf-stat.branch-mi=
sses
 1.448e+09 =C2=B1  0%      -9.3%  1.313e+09 =C2=B1  1%  perf-stat.cache-mis=
ses
 1.931e+11 =C2=B1  0%      -5.8%  1.818e+11 =C2=B1  0%  perf-stat.cache-ref=
erences
  58882705 =C2=B1  0%      -5.8%   55467522 =C2=B1  0%  perf-stat.context-s=
witches
  17037466 =C2=B1  0%      -6.1%   15999111 =C2=B1  0%  perf-stat.cpu-migra=
tions
 6.732e+09 =C2=B1  1%     +90.7%  1.284e+10 =C2=B1  0%  perf-stat.dTLB-load=
-misses
 3.474e+12 =C2=B1  0%      -6.6%  3.245e+12 =C2=B1  0%  perf-stat.dTLB-loads
 1.215e+09 =C2=B1  0%      -5.5%  1.149e+09 =C2=B1  0%  perf-stat.dTLB-stor=
e-misses
 2.286e+12 =C2=B1  0%      -5.8%  2.153e+12 =C2=B1  0%  perf-stat.dTLB-stor=
es
 3.511e+09 =C2=B1  0%     +20.4%  4.226e+09 =C2=B1  0%  perf-stat.iTLB-load=
-misses
 2.317e+09 =C2=B1  0%      -6.8%   2.16e+09 =C2=B1  0%  perf-stat.iTLB-loads
 1.343e+13 =C2=B1  0%      -6.0%  1.263e+13 =C2=B1  0%  perf-stat.instructi=
ons
 5.504e+08 =C2=B1  0%      -6.2%  5.163e+08 =C2=B1  0%  perf-stat.minor-fau=
lts
  8.09e+08 =C2=B1  1%      -9.0%   7.36e+08 =C2=B1  1%  perf-stat.node-loads
 5.932e+08 =C2=B1  0%      -8.7%  5.417e+08 =C2=B1  1%  perf-stat.node-stor=
es
 5.504e+08 =C2=B1  0%      -6.2%  5.163e+08 =C2=B1  0%  perf-stat.page-faul=
ts

Best Regards,
Huang, Ying

--===============2926082314190581479==--

