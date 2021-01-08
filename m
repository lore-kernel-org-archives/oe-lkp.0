Content-Type: multipart/mixed; boundary="===============2021974569491563098=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Fri, 08 Jan 2021 14:13:53 +0800
Message-ID: <20210108061353.GA3437@xsang-OptiPlex-9020>
In-Reply-To: <CAHk-=wgQ5EEH3-GTK9KDB5mBmWjP25YHXC6_-V_KfWd0UTDTDQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2021974569491563098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 09:43:54AM -0800, Linus Torvalds wrote:
> On Thu, Jan 7, 2021 at 5:32 AM kernel test robot <oliver.sang@intel.com=
> wrote:
> >
> > FYI, we noticed a -5.8% regression of will-it-scale.per_thread_ops due =
to commit:
> =

> Ok, that's noticeable.
> =

> And:
> =

> > commit: d55564cfc222326e944893eff0c4118353e349ec ("x86: Make __put_user=
() generate an out-of-line call")
> =

> Yeah, that wasn't supposed to cause any performance regressions. No
> core code should use __put_user() so much.
> =

> But:
> =

> > | testcase: change | will-it-scale: will-it-scale.per_process_ops -7.3%=
 regression             |
> > | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2=
.30GHz with 192G memory |
> > | test parameters  | cpufreq_governor=3Dperformance                    =
                          |
> > |                  | mode=3Dprocess                                    =
                          |
> > |                  | nr_task=3D100%                                    =
                          |
> > |                  | test=3Dpoll2                                      =
                          |
> > |                  | ucode=3D0x16                                      =
                          |
> =

> Ok, it's poll(), and it's definitely the __put_user() there:
> =

> >       0.00            +1.8        1.77 =C4=85  3%  perf-profile.childre=
n.cycles-pp.__put_user_nocheck_2
> >       0.00            +1.6        1.64 =C4=85  3%  perf-profile.self.cy=
cles-pp.__put_user_nocheck_2
> =

> And in fact, it's that final "write back the 16-bit revents field" at the=
 end.
> =

> Which must have sucked before too, because it used to do a "stac/clac"
> for every word - but now it does it out of line.
> =

> The fix is to convert that loop to use "unsafe_put_user()" with the
> necessary accoutrements around it, and that should speed things up
> quite nicely. The (double) loop itself is actually just 14
> instructions, it's ridiculous how bad the code used to be, and how
> much better it is with the nice unsafe_put_user(). The whole double
> loop ends up being just
> =

>         lea    0x68(%rsp),%rsi
>         mov    %rcx,%rax
>   1:    mov    0x8(%rsi),%ecx
>         lea    0xc(%rsi),%rdx
>         test   %ecx,%ecx
>         je     3f
>         lea    (%rax,%rcx,8),%rdi
>   2:    movzwl 0x6(%rdx),%ecx
>         mov    %cx,0x6(%rax)
>         add    $0x8,%rax
>         add    $0x8,%rdx
>         cmp    %rdi,%rax
>         jne    2b
>   3:    mov    (%rsi),%rsi
>         test   %rsi,%rsi
>         jne    1b
> =

> with the attached patch.
> =

> Before, it would do the whole CLAC/STAC dance inside that loop for
> every entry (and with that commit d55564cfc22 it would be a function
> call, of course).
> =

> Can you verify that this fixes the regression (and in fact I'd expect
> it to improve that test-case)?

Hi Linus,

below is the result, the regression is fixed:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/thread/50%/debian-10.4-x86_64-20200603.=
cgz/lkp-ivb-2ep1/poll2/will-it-scale/0x42e

commit: =

  ea6f043fc9847e670b91dfbf1ef1cdff3451c152 ("x86: Make __get_user() generat=
e an out-of-line call")
  d55564cfc222326e944893eff0c4118353e349ec ("x86: Make __put_user() generat=
e an out-of-line call")
  51248db4caacc1b0b8dce788bc8b207a2e910c31 (your patch applied upon d55564c=
fc2)

ea6f043fc9847e67 d55564cfc222326e944893eff0c 51248db4caacc1b0b8dce788bc8 =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

   6600273            -5.8%    6218737            -0.2%    6585700        w=
ill-it-scale.24.threads
     49.29            -0.0%      49.28            -0.0%      49.27        w=
ill-it-scale.24.threads_idle
    275010            -5.8%     259113            -0.2%     274403        w=
ill-it-scale.per_thread_ops
    301.11            +0.0%     301.12            +0.0%     301.12        w=
ill-it-scale.time.elapsed_time
    301.11            +0.0%     301.12            +0.0%     301.12        w=
ill-it-scale.time.elapsed_time.max
      2.75 =C2=B1 15%     -18.2%       2.25 =C2=B1 19%     -27.3%       2.0=
0 =C2=B1 35%  will-it-scale.time.involuntary_context_switches
      0.00       +2.5e+101%       0.25 =C2=B1173% +2.5e+101%       0.25 =C2=
=B1173%  will-it-scale.time.major_page_faults
      9363            +0.1%       9377            -0.2%       9340        w=
ill-it-scale.time.maximum_resident_set_size
      6346            -0.1%       6341            +0.1%       6351        w=
ill-it-scale.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        w=
ill-it-scale.time.page_size
      0.03 =C2=B1 23%      -8.3%       0.03 =C2=B1 15%      +8.3%       0.0=
3 =C2=B1 13%  will-it-scale.time.system_time
      0.04 =C2=B1 11%     +13.3%       0.04 =C2=B1 10%     +13.3%       0.0=
4 =C2=B1 10%  will-it-scale.time.user_time
     78.75 =C2=B1  2%      +3.2%      81.25 =C2=B1  2%      +1.9%      80.2=
5        will-it-scale.time.voluntary_context_switches
   6600273            -5.8%    6218737            -0.2%    6585700        w=
ill-it-scale.workload
    325.58            +0.2%     326.18            -0.1%     325.24        u=
ptime.boot
      8095            +0.0%       8096            -0.1%       8089        u=
ptime.idle
     22.00            +1.6%      22.35            -0.5%      21.88        b=
oot-time.boot
     14.04            -0.5%      13.97            +0.0%      14.04        b=
oot-time.dhcp
    855.78 =C2=B1  2%      -0.9%     847.73            +0.8%     862.48 =C2=
=B1  2%  boot-time.idle
      0.46            -0.0%       0.46            -0.0%       0.46        b=
oot-time.smp_boot
     49.44            +0.0       49.46            -0.0       49.42        m=
pstat.cpu.all.idle%
      0.91            +0.0        0.93            +0.0        0.91        m=
pstat.cpu.all.irq%
      0.03 =C2=B1  5%      +0.0        0.03 =C2=B1  2%      -0.0        0.0=
3 =C2=B1  2%  mpstat.cpu.all.soft%
     43.51            +0.4       43.92            -0.0       43.48        m=
pstat.cpu.all.sys%
      6.12            -0.5        5.66 =C2=B1  2%      +0.0        6.16 =C2=
=B1  2%  mpstat.cpu.all.usr%
 1.358e+08 =C2=B1169%     +13.7%  1.545e+08 =C2=B1166%    +122.6%  3.023e+0=
8 =C2=B1 99%  cpuidle.C1.time
   1948771 =C2=B1165%      +4.3%    2033298 =C2=B1162%    +102.0%    393574=
4 =C2=B1 97%  cpuidle.C1.usage
 1.136e+09 =C2=B1 88%      +5.4%  1.197e+09 =C2=B1 64%     -67.1%  3.736e+0=
8 =C2=B1161%  cpuidle.C1E.time
   4064576 =C2=B1 90%     +42.0%    5773258 =C2=B1 57%     -52.0%    195100=
3 =C2=B1166%  cpuidle.C1E.usage
 5.904e+09 =C2=B1 14%      -1.3%  5.829e+09 =C2=B1  9%     +10.0%  6.496e+0=
9 =C2=B1  7%  cpuidle.C6.time
   8682751 =C2=B1 34%     -20.5%    6902053 =C2=B1  2%      +0.9%    876489=
4 =C2=B1 37%  cpuidle.C6.usage
      7857 =C2=B1 14%     +27.4%      10011 =C2=B1 32%    +173.6%      2150=
0 =C2=B1 58%  cpuidle.POLL.time
      4281 =C2=B1 19%      +9.6%       4694 =C2=B1 11%     +48.9%       637=
7 =C2=B1 22%  cpuidle.POLL.usage
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node0.interleave_hit
    299058 =C2=B1 18%      +4.0%     310887 =C2=B1 26%     +17.3%     35073=
3 =C2=B1  5%  numa-numastat.node0.local_node
    331642 =C2=B1 16%      -3.0%     321771 =C2=B1 28%     +13.0%     37477=
7 =C2=B1  5%  numa-numastat.node0.numa_hit
     32585 =C2=B1 35%     -66.6%      10886 =C2=B1107%     -26.2%      2404=
5 =C2=B1 54%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node1.interleave_hit
    401552 =C2=B1 13%      -2.5%     391705 =C2=B1 20%     -11.8%     35413=
5 =C2=B1  8%  numa-numastat.node1.local_node
    412619 =C2=B1 12%      +2.9%     424478 =C2=B1 21%      -9.4%     37375=
7 =C2=B1  7%  numa-numastat.node1.numa_hit
     11069 =C2=B1105%    +196.1%      32775 =C2=B1 35%     +77.3%      1962=
4 =C2=B1 66%  numa-numastat.node1.other_node
    301.11            +0.0%     301.12            +0.0%     301.12        t=
ime.elapsed_time
    301.11            +0.0%     301.12            +0.0%     301.12        t=
ime.elapsed_time.max
      2.75 =C2=B1 15%     -18.2%       2.25 =C2=B1 19%     -27.3%       2.0=
0 =C2=B1 35%  time.involuntary_context_switches
      0.00       +2.5e+101%       0.25 =C2=B1173% +2.5e+101%       0.25 =C2=
=B1173%  time.major_page_faults
      9363            +0.1%       9377            -0.2%       9340        t=
ime.maximum_resident_set_size
      6346            -0.1%       6341            +0.1%       6351        t=
ime.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        t=
ime.page_size
      0.03 =C2=B1 23%      -8.3%       0.03 =C2=B1 15%      +8.3%       0.0=
3 =C2=B1 13%  time.system_time
      0.04 =C2=B1 11%     +13.3%       0.04 =C2=B1 10%     +13.3%       0.0=
4 =C2=B1 10%  time.user_time
     78.75 =C2=B1  2%      +3.2%      81.25 =C2=B1  2%      +1.9%      80.2=
5        time.voluntary_context_switches
     49.00            +0.0%      49.00            +0.0%      49.00        v=
mstat.cpu.id
     44.00            +0.0%      44.00            -0.6%      43.75        v=
mstat.cpu.sy
      6.00           -12.5%       5.25 =C2=B1  8%      +0.0%       6.00    =
    vmstat.cpu.us
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.io.bi
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.io.bo
   1320991            -0.1%    1319289            +0.0%    1321094        v=
mstat.memory.cache
 1.131e+08            -0.0%  1.131e+08            +0.0%  1.131e+08        v=
mstat.memory.free
     23.75            -1.1%      23.50 =C2=B1  2%      -1.1%      23.50 =C2=
=B1  2%  vmstat.procs.r
      1444 =C2=B1  2%      -0.8%       1432 =C2=B1  2%      -2.7%       140=
6 =C2=B1  2%  vmstat.system.cs
     97445            -0.1%      97342            -0.1%      97327        v=
mstat.system.in
     66448 =C2=B1  2%      -2.7%      64632            +0.4%      66698    =
    meminfo.Active
     66448 =C2=B1  2%      -2.7%      64632            +0.4%      66698    =
    meminfo.Active(anon)
    161049            -0.5%     160308            +1.3%     163154        m=
eminfo.AnonHugePages
    243172            -0.3%     242331            +0.7%     244931        m=
eminfo.AnonPages
   1239608            -0.1%    1237751            +0.0%    1240036        m=
eminfo.Cached
    199940            +0.0%     199940            +0.0%     199940        m=
eminfo.CmaFree
    204800            +0.0%     204800            +0.0%     204800        m=
eminfo.CmaTotal
  57695224            +0.0%   57695224            +0.0%   57695224        m=
eminfo.CommitLimit
    581913            -0.4%     579726            +0.1%     582241        m=
eminfo.Committed_AS
 1.033e+08            -2.5%  1.007e+08            -0.5%  1.028e+08        m=
eminfo.DirectMap1G
  15760384 =C2=B1  7%     +16.7%   18393600 =C2=B1  9%      +3.2%   1626982=
4 =C2=B1 10%  meminfo.DirectMap2M
    412468 =C2=B1  6%      -2.9%     400692 =C2=B1  6%      +3.6%     42731=
6 =C2=B1  2%  meminfo.DirectMap4k
      2048            +0.0%       2048            +0.0%       2048        m=
eminfo.Hugepagesize
    256010            -0.3%     255199            +0.7%     257786        m=
eminfo.Inactive
    256010            -0.3%     255199            +0.7%     257786        m=
eminfo.Inactive(anon)
     81147            +0.3%      81354            -0.4%      80851        m=
eminfo.KReclaimable
     11619            +0.3%      11654            +0.2%      11641        m=
eminfo.KernelStack
     35049            +0.1%      35072            +0.1%      35074        m=
eminfo.Mapped
 1.126e+08            -0.0%  1.126e+08            +0.0%  1.126e+08        m=
eminfo.MemAvailable
 1.131e+08            -0.0%  1.131e+08            +0.0%  1.131e+08        m=
eminfo.MemFree
 1.154e+08            +0.0%  1.154e+08            +0.0%  1.154e+08        m=
eminfo.MemTotal
   2291983            +0.0%    2293053            -0.1%    2289056        m=
eminfo.Memused
    423.00 =C2=B1173%    -100.0%       0.00            -0.1%     422.50 =C2=
=B1173%  meminfo.Mlocked
      3112            -0.5%       3097            +0.4%       3126        m=
eminfo.PageTables
     84297            -0.6%      83769            -0.3%      84072        m=
eminfo.Percpu
     81147            +0.3%      81354            -0.4%      80851        m=
eminfo.SReclaimable
    109653 =C2=B1  2%      +2.8%     112763            -1.0%     108555    =
    meminfo.SUnreclaim
     79699            -2.3%      77838            +0.3%      79964        m=
eminfo.Shmem
    190801            +1.7%     194118            -0.7%     189407        m=
eminfo.Slab
   1159969            -0.0%    1159912            +0.0%    1160133        m=
eminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10        m=
eminfo.VmallocTotal
    139995            +0.7%     140967            -0.6%     139097        m=
eminfo.VmallocUsed
      8403            -0.2%       8383            -0.2%       8386        m=
eminfo.max_used_kB
     12434 =C2=B1135%     -78.0%       2729 =C2=B1 43%     +66.3%      2067=
3 =C2=B1 91%  numa-meminfo.node0.Active
     12434 =C2=B1135%     -78.0%       2729 =C2=B1 43%     +66.3%      2067=
3 =C2=B1 91%  numa-meminfo.node0.Active(anon)
     89160 =C2=B1 42%      -4.5%      85171 =C2=B1 47%      +8.4%      9662=
0 =C2=B1 30%  numa-meminfo.node0.AnonHugePages
    133903 =C2=B1 31%      -7.9%     123279 =C2=B1 34%      +0.6%     13466=
8 =C2=B1 25%  numa-meminfo.node0.AnonPages
    186998 =C2=B1 13%     -12.2%     164246 =C2=B1 14%     -12.2%     16411=
4 =C2=B1 21%  numa-meminfo.node0.AnonPages.max
    598480 =C2=B1  5%      -0.4%     596078 =C2=B1  2%      +0.5%     60168=
3 =C2=B1  3%  numa-meminfo.node0.FilePages
    143689 =C2=B1 29%      -9.1%     130556 =C2=B1 30%      -0.9%     14240=
1 =C2=B1 26%  numa-meminfo.node0.Inactive
    143689 =C2=B1 29%      -9.1%     130556 =C2=B1 30%      -0.9%     14240=
1 =C2=B1 26%  numa-meminfo.node0.Inactive(anon)
     40549 =C2=B1 10%      +9.9%      44562 =C2=B1  9%      -1.0%      4014=
0 =C2=B1 11%  numa-meminfo.node0.KReclaimable
      6122 =C2=B1  3%      +0.6%       6156            -0.3%       6105 =C2=
=B1  6%  numa-meminfo.node0.KernelStack
     18407 =C2=B1 12%      -6.6%      17183 =C2=B1 13%      -5.6%      1737=
9 =C2=B1 14%  numa-meminfo.node0.Mapped
  60608553            +0.0%   60617905            +0.0%   60622689        n=
uma-meminfo.node0.MemFree
  61766680            +0.0%   61766680            +0.0%   61766680        n=
uma-meminfo.node0.MemTotal
   1158125 =C2=B1  5%      -0.8%    1148774 =C2=B1  5%      -1.2%    114398=
9 =C2=B1  4%  numa-meminfo.node0.MemUsed
    181.25 =C2=B1173%    -100.0%       0.00            -0.1%     181.00 =C2=
=B1173%  numa-meminfo.node0.Mlocked
      1713 =C2=B1 23%      -4.2%       1641 =C2=B1 14%     -18.7%       139=
3 =C2=B1 18%  numa-meminfo.node0.PageTables
     40549 =C2=B1 10%      +9.9%      44562 =C2=B1  9%      -1.0%      4014=
0 =C2=B1 11%  numa-meminfo.node0.SReclaimable
     61898 =C2=B1  9%      -1.4%      61026 =C2=B1  4%     -12.9%      5390=
3 =C2=B1 14%  numa-meminfo.node0.SUnreclaim
     22383 =C2=B1 83%     -54.7%      10148 =C2=B1 45%     +27.6%      2856=
1 =C2=B1 69%  numa-meminfo.node0.Shmem
    102448 =C2=B1  9%      +3.1%     105589 =C2=B1  5%      -8.2%      9404=
3 =C2=B1 12%  numa-meminfo.node0.Slab
    576095 =C2=B1  3%      +1.7%     585929 =C2=B1  2%      -0.5%     57312=
1 =C2=B1  3%  numa-meminfo.node0.Unevictable
     54018 =C2=B1 32%     +14.5%      61874 =C2=B1  2%     -14.8%      4602=
8 =C2=B1 40%  numa-meminfo.node1.Active
     54018 =C2=B1 32%     +14.5%      61874 =C2=B1  2%     -14.8%      4602=
8 =C2=B1 40%  numa-meminfo.node1.Active(anon)
     71950 =C2=B1 53%      +4.4%      75136 =C2=B1 52%      -7.5%      6655=
1 =C2=B1 42%  numa-meminfo.node1.AnonHugePages
    109247 =C2=B1 38%      +9.0%     119046 =C2=B1 34%      +0.9%     11023=
8 =C2=B1 30%  numa-meminfo.node1.AnonPages
    176112 =C2=B1 16%      -5.2%     166983 =C2=B1 25%     -10.6%     15746=
8 =C2=B1 25%  numa-meminfo.node1.AnonPages.max
    641182 =C2=B1  4%      +0.1%     641688 =C2=B1  2%      -0.4%     63838=
7 =C2=B1  3%  numa-meminfo.node1.FilePages
    112352 =C2=B1 37%     +11.0%     124681 =C2=B1 31%      +2.7%     11538=
9 =C2=B1 32%  numa-meminfo.node1.Inactive
    112352 =C2=B1 37%     +11.0%     124681 =C2=B1 31%      +2.7%     11538=
9 =C2=B1 32%  numa-meminfo.node1.Inactive(anon)
     40602 =C2=B1  9%      -9.4%      36796 =C2=B1 11%      +0.3%      4071=
4 =C2=B1 12%  numa-meminfo.node1.KReclaimable
      5494 =C2=B1  3%      -0.0%       5493 =C2=B1  2%      +0.8%       553=
6 =C2=B1  8%  numa-meminfo.node1.KernelStack
     16511 =C2=B1 13%      +7.7%      17777 =C2=B1 13%      +6.3%      1755=
2 =C2=B1 13%  numa-meminfo.node1.Mapped
  52490363            -0.0%   52479733            -0.0%   52478847        n=
uma-meminfo.node1.MemFree
  53623768            +0.0%   53623768            +0.0%   53623768        n=
uma-meminfo.node1.MemTotal
   1133403 =C2=B1  5%      +0.9%    1144034 =C2=B1  5%      +1.0%    114491=
9 =C2=B1  4%  numa-meminfo.node1.MemUsed
    243.25 =C2=B1173%    -100.0%       0.00            -0.7%     241.50 =C2=
=B1173%  numa-meminfo.node1.Mlocked
      1394 =C2=B1 27%      +4.4%       1456 =C2=B1 17%     +24.5%       173=
5 =C2=B1 17%  numa-meminfo.node1.PageTables
     40602 =C2=B1  9%      -9.4%      36796 =C2=B1 11%      +0.3%      4071=
4 =C2=B1 12%  numa-meminfo.node1.SReclaimable
     47749 =C2=B1  8%      +8.3%      51732 =C2=B1  6%     +14.4%      5464=
7 =C2=B1 14%  numa-meminfo.node1.SUnreclaim
     57369 =C2=B1 33%     +18.0%      67705 =C2=B1  6%     -10.3%      5143=
6 =C2=B1 38%  numa-meminfo.node1.Shmem
     88352 =C2=B1  8%      +0.2%      88530 =C2=B1  7%      +7.9%      9536=
2 =C2=B1 13%  numa-meminfo.node1.Slab
    583873 =C2=B1  3%      -1.7%     573982 =C2=B1  2%      +0.5%     58701=
1 =C2=B1  2%  numa-meminfo.node1.Unevictable
      3116 =C2=B1136%     -78.1%     682.00 =C2=B1 43%     +66.4%       518=
3 =C2=B1 91%  numa-vmstat.node0.nr_active_anon
     33495 =C2=B1 31%      -8.0%      30822 =C2=B1 33%      +0.5%      3365=
7 =C2=B1 25%  numa-vmstat.node0.nr_anon_pages
     43.25 =C2=B1 42%      -4.6%      41.25 =C2=B1 47%      +8.1%      46.7=
5 =C2=B1 31%  numa-vmstat.node0.nr_anon_transparent_hugepages
    149625 =C2=B1  5%      -0.4%     149019 =C2=B1  2%      +0.5%     15043=
2 =C2=B1  3%  numa-vmstat.node0.nr_file_pages
  15152125            +0.0%   15154498            +0.0%   15155727        n=
uma-vmstat.node0.nr_free_pages
     35940 =C2=B1 29%      -9.2%      32642 =C2=B1 30%      -1.0%      3558=
7 =C2=B1 26%  numa-vmstat.node0.nr_inactive_anon
      0.00          -100.0%       0.00       +2.5e+101%       0.25 =C2=B117=
3%  numa-vmstat.node0.nr_isolated_anon
      6123 =C2=B1  3%      +0.6%       6159            -0.4%       6100 =C2=
=B1  6%  numa-vmstat.node0.nr_kernel_stack
      4637 =C2=B1 12%      -6.4%       4342 =C2=B1 14%      -5.1%       440=
0 =C2=B1 13%  numa-vmstat.node0.nr_mapped
     45.25 =C2=B1173%    -100.0%       0.00            -0.6%      45.00 =C2=
=B1173%  numa-vmstat.node0.nr_mlock
    428.00 =C2=B1 23%      -4.3%     409.50 =C2=B1 14%     -19.1%     346.2=
5 =C2=B1 18%  numa-vmstat.node0.nr_page_table_pages
      5601 =C2=B1 83%     -54.7%       2536 =C2=B1 45%     +27.7%       715=
2 =C2=B1 69%  numa-vmstat.node0.nr_shmem
     10136 =C2=B1 10%      +9.9%      11139 =C2=B1  9%      -1.0%      1003=
4 =C2=B1 11%  numa-vmstat.node0.nr_slab_reclaimable
     15474 =C2=B1  9%      -1.4%      15255 =C2=B1  4%     -12.9%      1347=
5 =C2=B1 14%  numa-vmstat.node0.nr_slab_unreclaimable
    144023 =C2=B1  3%      +1.7%     146481 =C2=B1  2%      -0.5%     14327=
9 =C2=B1  3%  numa-vmstat.node0.nr_unevictable
      3116 =C2=B1136%     -78.1%     682.00 =C2=B1 43%     +66.4%       518=
3 =C2=B1 91%  numa-vmstat.node0.nr_zone_active_anon
     35940 =C2=B1 29%      -9.2%      32642 =C2=B1 30%      -1.0%      3558=
7 =C2=B1 26%  numa-vmstat.node0.nr_zone_inactive_anon
    144023 =C2=B1  3%      +1.7%     146481 =C2=B1  2%      -0.5%     14327=
9 =C2=B1  3%  numa-vmstat.node0.nr_zone_unevictable
    631829 =C2=B1 10%      +4.4%     659357 =C2=B1 16%      -0.9%     62620=
3 =C2=B1 14%  numa-vmstat.node0.numa_hit
    157825            -0.1%     157714            -0.1%     157710        n=
uma-vmstat.node0.numa_interleave
    595789 =C2=B1 11%      -3.7%     573797 =C2=B1 19%      -5.6%     56265=
6 =C2=B1 19%  numa-vmstat.node0.numa_local
     36039 =C2=B1 29%    +137.4%      85559 =C2=B1 80%     +76.3%      6354=
6 =C2=B1 84%  numa-vmstat.node0.numa_other
     13546 =C2=B1 32%     +14.5%      15514 =C2=B1  2%     -14.8%      1154=
1 =C2=B1 40%  numa-vmstat.node1.nr_active_anon
     27281 =C2=B1 38%      +9.0%      29749 =C2=B1 34%      +1.0%      2755=
5 =C2=B1 30%  numa-vmstat.node1.nr_anon_pages
     34.75 =C2=B1 54%      +4.3%      36.25 =C2=B1 52%      -7.9%      32.0=
0 =C2=B1 42%  numa-vmstat.node1.nr_anon_transparent_hugepages
    160309 =C2=B1  4%      +0.1%     160444 =C2=B1  2%      -0.4%     15960=
6 =C2=B1  3%  numa-vmstat.node1.nr_file_pages
     49985            +0.0%      49985            +0.0%      49985        n=
uma-vmstat.node1.nr_free_cma
  13122613            -0.0%   13119939            -0.0%   13119764        n=
uma-vmstat.node1.nr_free_pages
     28029 =C2=B1 37%     +11.1%      31134 =C2=B1 31%      +2.8%      2881=
9 =C2=B1 32%  numa-vmstat.node1.nr_inactive_anon
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node1.nr_isolated_anon
      5494 =C2=B1  3%      +0.2%       5503 =C2=B1  2%      +0.8%       553=
6 =C2=B1  8%  numa-vmstat.node1.nr_kernel_stack
      4203 =C2=B1 13%      +7.3%       4511 =C2=B1 14%      +5.4%       443=
2 =C2=B1 13%  numa-vmstat.node1.nr_mapped
     60.75 =C2=B1173%    -100.0%       0.00            -0.8%      60.25 =C2=
=B1173%  numa-vmstat.node1.nr_mlock
    348.25 =C2=B1 26%      +5.1%     366.00 =C2=B1 17%     +24.4%     433.2=
5 =C2=B1 16%  numa-vmstat.node1.nr_page_table_pages
     14356 =C2=B1 33%     +18.1%      16948 =C2=B1  6%     -10.4%      1286=
8 =C2=B1 38%  numa-vmstat.node1.nr_shmem
     10149 =C2=B1  9%      -9.4%       9198 =C2=B1 11%      +0.3%      1017=
8 =C2=B1 12%  numa-vmstat.node1.nr_slab_reclaimable
     11936 =C2=B1  8%      +8.3%      12932 =C2=B1  6%     +14.4%      1366=
1 =C2=B1 14%  numa-vmstat.node1.nr_slab_unreclaimable
    145968 =C2=B1  3%      -1.7%     143495 =C2=B1  2%      +0.5%     14675=
2 =C2=B1  2%  numa-vmstat.node1.nr_unevictable
     13546 =C2=B1 32%     +14.5%      15514 =C2=B1  2%     -14.8%      1154=
1 =C2=B1 40%  numa-vmstat.node1.nr_zone_active_anon
     28029 =C2=B1 37%     +11.1%      31134 =C2=B1 31%      +2.8%      2881=
9 =C2=B1 32%  numa-vmstat.node1.nr_zone_inactive_anon
    145968 =C2=B1  3%      -1.7%     143495 =C2=B1  2%      +0.5%     14675=
2 =C2=B1  2%  numa-vmstat.node1.nr_zone_unevictable
    709902 =C2=B1  8%      -3.8%     682900 =C2=B1 16%      -0.3%     70771=
0 =C2=B1 13%  numa-vmstat.node1.numa_hit
    157965            +0.1%     158074            +0.1%     158101        n=
uma-vmstat.node1.numa_interleave
    537233 =C2=B1 11%      +4.3%     560075 =C2=B1 19%      +4.7%     56261=
3 =C2=B1 20%  numa-vmstat.node1.numa_local
    172668 =C2=B1  6%     -28.9%     122825 =C2=B1 56%     -16.0%     14509=
6 =C2=B1 37%  numa-vmstat.node1.numa_other
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.compact_isolated
     16632 =C2=B1  2%      -2.9%      16151            +0.3%      16676    =
    proc-vmstat.nr_active_anon
     60778            -0.3%      60583            +0.7%      61227        p=
roc-vmstat.nr_anon_pages
     78.25            -0.6%      77.75            +1.0%      79.00        p=
roc-vmstat.nr_anon_transparent_hugepages
   2809214            -0.0%    2809179            +0.0%    2809284        p=
roc-vmstat.nr_dirty_background_threshold
   5625298            -0.0%    5625229            +0.0%    5625438        p=
roc-vmstat.nr_dirty_threshold
    309918            -0.2%     309444            +0.0%     310025        p=
roc-vmstat.nr_file_pages
     49985            +0.0%      49985            +0.0%      49985        p=
roc-vmstat.nr_free_cma
  28274763            -0.0%   28274417            +0.0%   28275465        p=
roc-vmstat.nr_free_pages
     63983            -0.3%      63813            +0.7%      64456        p=
roc-vmstat.nr_inactive_anon
      0.25 =C2=B1173%      +0.0%       0.25 =C2=B1173%    -100.0%       0.0=
0        proc-vmstat.nr_isolated_anon
     11618            +0.4%      11666            +0.2%      11642        p=
roc-vmstat.nr_kernel_stack
      8834            +0.5%       8875            +0.3%       8860        p=
roc-vmstat.nr_mapped
    106.00 =C2=B1173%    -100.0%       0.00            -0.5%     105.50 =C2=
=B1173%  proc-vmstat.nr_mlock
    777.50            -0.4%     774.50            +0.5%     781.50        p=
roc-vmstat.nr_page_table_pages
     19941            -2.4%      19466            +0.3%      20007        p=
roc-vmstat.nr_shmem
     20287            +0.3%      20339            -0.4%      20213        p=
roc-vmstat.nr_slab_reclaimable
     27411 =C2=B1  2%      +2.8%      28189            -1.0%      27137    =
    proc-vmstat.nr_slab_unreclaimable
    289992            -0.0%     289977            +0.0%     290033        p=
roc-vmstat.nr_unevictable
     16632 =C2=B1  2%      -2.9%      16151            +0.3%      16676    =
    proc-vmstat.nr_zone_active_anon
     63983            -0.3%      63813            +0.7%      64456        p=
roc-vmstat.nr_zone_inactive_anon
    289992            -0.0%     289977            +0.0%     290033        p=
roc-vmstat.nr_zone_unevictable
     13701 =C2=B1 44%     +25.0%      17122 =C2=B1 56%     +23.3%      1689=
9 =C2=B1 68%  proc-vmstat.numa_hint_faults
      3617 =C2=B1 31%     +15.7%       4184 =C2=B1 45%     -19.1%       292=
4 =C2=B1 57%  proc-vmstat.numa_hint_faults_local
    773209            +0.2%     774447            +0.8%     779441        p=
roc-vmstat.numa_hit
    128.50 =C2=B1 18%      +8.6%     139.50 =C2=B1 27%      +6.8%     137.2=
5 =C2=B1 13%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.numa_interleave
    729544            +0.2%     730778            +0.9%     735763        p=
roc-vmstat.numa_local
     43665            +0.0%      43669            +0.0%      43678        p=
roc-vmstat.numa_other
     22735 =C2=B1 20%     -25.6%      16924 =C2=B1 63%     -24.1%      1725=
0 =C2=B1 67%  proc-vmstat.numa_pages_migrated
    102986 =C2=B1  8%     +20.5%     124067 =C2=B1 12%     +15.2%     11860=
2 =C2=B1 15%  proc-vmstat.numa_pte_updates
     24310 =C2=B1  2%      -2.4%      23729            -0.2%      24268    =
    proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgalloc_dma
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgalloc_dma32
    840269            -0.8%     833139            -0.5%     836309        p=
roc-vmstat.pgalloc_normal
    914293            +0.3%     917239            +0.2%     915801        p=
roc-vmstat.pgfault
    822698            -0.7%     816568            -0.6%     817626        p=
roc-vmstat.pgfree
     22735 =C2=B1 20%     -25.6%      16924 =C2=B1 63%     -24.1%      1725=
0 =C2=B1 67%  proc-vmstat.pgmigrate_success
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgpgin
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgpgout
     53809            +1.2%      54473 =C2=B1  2%      -1.1%      53219    =
    proc-vmstat.pgreuse
     96.25            +0.8%      97.00            +0.8%      97.00        p=
roc-vmstat.thp_collapse_alloc
      4.00            +0.0%       4.00            +0.0%       4.00        p=
roc-vmstat.thp_deferred_split_page
      6.00 =C2=B1 11%     -12.5%       5.25 =C2=B1  8%      +4.2%       6.2=
5 =C2=B1  6%  proc-vmstat.thp_fault_alloc
      4.00            +0.0%       4.00            +0.0%       4.00        p=
roc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.thp_zero_page_alloc
     31.50 =C2=B1120%     -66.7%      10.50 =C2=B1  4%      +2.4%      32.2=
5 =C2=B1115%  proc-vmstat.unevictable_pgs_culled
    146.50 =C2=B1173%    -100.0%       0.00            +0.0%     146.50 =C2=
=B1173%  proc-vmstat.unevictable_pgs_mlocked
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.unevictable_pgs_rescued
   1145664            -0.2%    1143168            +0.1%    1146432        p=
roc-vmstat.unevictable_pgs_scanned
      0.09 =C2=B1 21%      -6.0%       0.08 =C2=B1 17%     +14.1%       0.1=
0 =C2=B1 30%  perf-stat.i.MPKI
 2.349e+10            +4.2%  2.449e+10            -0.3%  2.342e+10        p=
erf-stat.i.branch-instructions
      0.21            -0.0        0.19            -0.0        0.21 =C2=B1  =
2%  perf-stat.i.branch-miss-rate%
  45979592            -6.1%   43181339            -0.5%   45737128        p=
erf-stat.i.branch-misses
      2.32 =C2=B1 19%      +0.1        2.46 =C2=B1  5%     +11.4       13.7=
5 =C2=B1140%  perf-stat.i.cache-miss-rate%
    218573 =C2=B1  7%      -3.6%     210638 =C2=B1  4%    +584.5%    149603=
7 =C2=B1146%  perf-stat.i.cache-misses
   7307239 =C2=B1 24%     -13.4%    6330199 =C2=B1  2%      +3.4%    755549=
2 =C2=B1 30%  perf-stat.i.cache-references
      1423 =C2=B1  3%      -1.0%       1408 =C2=B1  2%      -2.8%       138=
3 =C2=B1  2%  perf-stat.i.context-switches
      0.73            +1.0%       0.74            +2.8%       0.75        p=
erf-stat.i.cpi
     48003            -0.0%      48002            -0.0%      48001        p=
erf-stat.i.cpu-clock
  7.24e+10            -0.2%  7.227e+10            -0.1%  7.231e+10        p=
erf-stat.i.cpu-cycles
     50.77            -0.0%      50.76            -0.0%      50.76        p=
erf-stat.i.cpu-migrations
    611739 =C2=B1  3%      +2.3%     625658 =C2=B1  2%     -23.4%     46875=
0 =C2=B1 56%  perf-stat.i.cycles-between-cache-misses
      0.17 =C2=B1  5%      -0.0        0.17 =C2=B1  6%      +0.0        0.1=
8 =C2=B1  3%  perf-stat.i.dTLB-load-miss-rate%
  41247252 =C2=B1  5%      -2.9%   40056676 =C2=B1  6%      -2.3%   4028000=
4 =C2=B1  3%  perf-stat.i.dTLB-load-misses
  2.36e+10            -2.4%  2.304e+10            -3.3%  2.282e+10        p=
erf-stat.i.dTLB-loads
      0.10 =C2=B1  4%      -0.0        0.09            -0.0        0.10    =
    perf-stat.i.dTLB-store-miss-rate%
  14580547 =C2=B1  4%      -8.3%   13364460            -3.2%   14117340    =
    perf-stat.i.dTLB-store-misses
 1.432e+10            -0.3%  1.428e+10            -0.2%   1.43e+10        p=
erf-stat.i.dTLB-stores
     95.47            +0.2       95.64            +0.2       95.70        p=
erf-stat.i.iTLB-load-miss-rate%
   7364953            -5.1%    6985875            +0.7%    7419968        p=
erf-stat.i.iTLB-load-misses
    346056 =C2=B1  3%      -8.7%     315837            -4.5%     330589    =
    perf-stat.i.iTLB-loads
 9.903e+10            -1.1%  9.791e+10            -2.8%  9.624e+10        p=
erf-stat.i.instructions
     13434            +4.3%      14007            -3.5%      12964        p=
erf-stat.i.instructions-per-iTLB-miss
      1.37            -1.0%       1.35            -2.7%       1.33        p=
erf-stat.i.ipc
      0.45 =C2=B1 12%      -0.3%       0.45 =C2=B1 27%      -5.3%       0.4=
3 =C2=B1  6%  perf-stat.i.major-faults
      1.51            -0.2%       1.51            -0.1%       1.51        p=
erf-stat.i.metric.GHz
      1.06 =C2=B1  9%     +11.2%       1.17 =C2=B1  9%     -19.9%       0.8=
4 =C2=B1 48%  perf-stat.i.metric.K/sec
      1279            +0.6%       1287            -1.4%       1261        p=
erf-stat.i.metric.M/sec
      2920            +0.3%       2928            +0.2%       2925        p=
erf-stat.i.minor-faults
     46.34            +0.4       46.70            +0.8       47.17 =C2=B1  =
3%  perf-stat.i.node-load-miss-rate%
     75084 =C2=B1  5%      +0.8%      75722 =C2=B1  7%   +1167.6%     95173=
6 =C2=B1159%  perf-stat.i.node-load-misses
    106550 =C2=B1  3%      -4.9%     101296 =C2=B1  3%    +863.7%    102684=
8 =C2=B1145%  perf-stat.i.node-loads
     25.89 =C2=B1 22%      +6.2       32.12 =C2=B1 16%      +4.2       30.1=
2 =C2=B1 24%  perf-stat.i.node-store-miss-rate%
     32810 =C2=B1 17%     +20.5%      39528 =C2=B1 12%    +830.8%     30538=
8 =C2=B1154%  perf-stat.i.node-store-misses
     94127 =C2=B1  5%      -1.1%      93133 =C2=B1  2%    +429.9%     49882=
1 =C2=B1140%  perf-stat.i.node-stores
      2920            +0.3%       2929            +0.2%       2925        p=
erf-stat.i.page-faults
     48003            -0.0%      48002            -0.0%      48001        p=
erf-stat.i.task-clock
      0.07 =C2=B1 24%     -12.4%       0.06 =C2=B1  2%      +6.6%       0.0=
8 =C2=B1 30%  perf-stat.overall.MPKI
      0.20            -0.0        0.18            -0.0        0.20        p=
erf-stat.overall.branch-miss-rate%
      3.17 =C2=B1 22%      +0.2        3.34 =C2=B1  7%     +11.1       14.2=
9 =C2=B1129%  perf-stat.overall.cache-miss-rate%
      0.73            +1.0%       0.74            +2.8%       0.75        p=
erf-stat.overall.cpi
    332596 =C2=B1  7%      +3.2%     343294 =C2=B1  5%     -27.0%     24295=
0 =C2=B1 55%  perf-stat.overall.cycles-between-cache-misses
      0.17 =C2=B1  5%      -0.0        0.17 =C2=B1  6%      +0.0        0.1=
8 =C2=B1  3%  perf-stat.overall.dTLB-load-miss-rate%
      0.10 =C2=B1  4%      -0.0        0.09            -0.0        0.10    =
    perf-stat.overall.dTLB-store-miss-rate%
     95.51            +0.2       95.67            +0.2       95.73        p=
erf-stat.overall.iTLB-load-miss-rate%
     13447            +4.2%      14016            -3.5%      12971        p=
erf-stat.overall.instructions-per-iTLB-miss
      1.37            -1.0%       1.35            -2.7%       1.33        p=
erf-stat.overall.ipc
     41.32 =C2=B1  2%      +1.4       42.73 =C2=B1  2%      -2.2       39.1=
1 =C2=B1 27%  perf-stat.overall.node-load-miss-rate%
     25.76 =C2=B1 14%      +3.9       29.68 =C2=B1  7%      +3.6       29.4=
1 =C2=B1 21%  perf-stat.overall.node-store-miss-rate%
   4517015            +5.0%    4744020            -2.5%    4403195        p=
erf-stat.overall.path-length
 2.341e+10            +4.2%   2.44e+10            -0.3%  2.334e+10        p=
erf-stat.ps.branch-instructions
  45857713            -6.1%   43060109            -0.6%   45589839        p=
erf-stat.ps.branch-misses
    218128 =C2=B1  7%      -3.6%     210355 =C2=B1  4%    +583.6%    149107=
4 =C2=B1146%  perf-stat.ps.cache-misses
   7284852 =C2=B1 24%     -13.4%    6310703 =C2=B1  2%      +3.4%    752983=
2 =C2=B1 29%  perf-stat.ps.cache-references
      1418 =C2=B1  2%      -1.0%       1404 =C2=B1  2%      -2.8%       137=
8 =C2=B1  2%  perf-stat.ps.context-switches
     47839            +0.0%      47839            -0.0%      47838        p=
erf-stat.ps.cpu-clock
 7.216e+10            -0.2%  7.203e+10            -0.1%  7.206e+10        p=
erf-stat.ps.cpu-cycles
     50.61            +0.0%      50.63            -0.0%      50.60        p=
erf-stat.ps.cpu-migrations
  41104998 =C2=B1  5%      -2.9%   39920499 =C2=B1  6%      -2.3%   4014287=
0 =C2=B1  3%  perf-stat.ps.dTLB-load-misses
 2.352e+10            -2.4%  2.296e+10            -3.3%  2.274e+10        p=
erf-stat.ps.dTLB-loads
  14530174 =C2=B1  4%      -8.3%   13319056            -3.2%   14069255    =
    perf-stat.ps.dTLB-store-misses
 1.427e+10            -0.3%  1.423e+10            -0.2%  1.425e+10        p=
erf-stat.ps.dTLB-stores
   7339560            -5.1%    6961988            +0.7%    7394505        p=
erf-stat.ps.iTLB-load-misses
    344856 =C2=B1  3%      -8.7%     314759            -4.5%     329476    =
    perf-stat.ps.iTLB-loads
 9.869e+10            -1.1%  9.758e+10            -2.8%  9.592e+10        p=
erf-stat.ps.instructions
      0.45 =C2=B1 12%      -0.6%       0.45 =C2=B1 27%      -5.8%       0.4=
3 =C2=B1  6%  perf-stat.ps.major-faults
      2910            +0.3%       2919            +0.2%       2915        p=
erf-stat.ps.minor-faults
     74922 =C2=B1  4%      +1.1%      75756 =C2=B1  7%   +1165.9%     94847=
3 =C2=B1159%  perf-stat.ps.node-load-misses
    106317 =C2=B1  2%      -4.7%     101350 =C2=B1  3%    +863.0%    102382=
6 =C2=B1145%  perf-stat.ps.node-loads
     32700 =C2=B1 17%     +20.5%      39411 =C2=B1 12%    +830.7%     30434=
8 =C2=B1154%  perf-stat.ps.node-store-misses
     93806 =C2=B1  5%      -1.0%      92850          +429.9%     497064 =C2=
=B1140%  perf-stat.ps.node-stores
      2910            +0.3%       2919            +0.2%       2916        p=
erf-stat.ps.page-faults
     47839            +0.0%      47839            -0.0%      47838        p=
erf-stat.ps.task-clock
 2.981e+13            -1.0%   2.95e+13            -2.7%    2.9e+13        p=
erf-stat.total.instructions
      9.44 =C2=B1173%    +275.5%      35.44 =C2=B1112%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.MIN_vruntime.avg
    453.06 =C2=B1173%    +153.7%       1149 =C2=B1100%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        s=
ched_debug.cfs_rq:/.MIN_vruntime.min
     64.71 =C2=B1173%    +199.0%     193.50 =C2=B1103%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.MIN_vruntime.stddev
     23412 =C2=B1  9%      -1.8%      22980 =C2=B1  5%      -3.6%      2255=
9 =C2=B1  2%  sched_debug.cfs_rq:/.load.avg
    135906 =C2=B1 68%     -29.7%      95590 =C2=B1 90%     -68.7%      4252=
3 =C2=B1  2%  sched_debug.cfs_rq:/.load.max
     31541 =C2=B1 40%     -19.1%      25501 =C2=B1 47%     -40.8%      1866=
1        sched_debug.cfs_rq:/.load.stddev
     40.80 =C2=B1  9%      -6.9%      37.97 =C2=B1  7%     -22.5%      31.6=
1 =C2=B1  6%  sched_debug.cfs_rq:/.load_avg.avg
    263.97 =C2=B1 31%      +2.7%     271.00 =C2=B1 28%     -21.0%     208.5=
7 =C2=B1  9%  sched_debug.cfs_rq:/.load_avg.max
     71.12 =C2=B1 16%      -4.6%      67.86 =C2=B1 14%     -27.4%      51.6=
3 =C2=B1 12%  sched_debug.cfs_rq:/.load_avg.stddev
      9.44 =C2=B1173%    +275.5%      35.44 =C2=B1112%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.max_vruntime.avg
    453.06 =C2=B1173%    +153.7%       1149 =C2=B1100%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        s=
ched_debug.cfs_rq:/.max_vruntime.min
     64.71 =C2=B1173%    +199.0%     193.50 =C2=B1103%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.max_vruntime.stddev
   1790069 =C2=B1 14%      -2.4%    1746347 =C2=B1 10%      +9.7%    196364=
2 =C2=B1 10%  sched_debug.cfs_rq:/.min_vruntime.avg
   3324871 =C2=B1 10%      -5.5%    3141815 =C2=B1 10%      +5.5%    350647=
7 =C2=B1  9%  sched_debug.cfs_rq:/.min_vruntime.max
     10305 =C2=B1 12%      +9.2%      11251 =C2=B1  5%     +10.9%      1142=
9 =C2=B1 13%  sched_debug.cfs_rq:/.min_vruntime.min
   1553952 =C2=B1 10%      -4.4%    1484815 =C2=B1 11%      +4.1%    161842=
2 =C2=B1  9%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.54 =C2=B1  4%      +2.0%       0.55            +4.8%       0.57 =C2=
=B1  2%  sched_debug.cfs_rq:/.nr_running.avg
      1.05 =C2=B1  8%      +0.0%       1.05 =C2=B1  8%      -4.8%       1.0=
0        sched_debug.cfs_rq:/.nr_running.max
      0.49            -1.8%       0.48 =C2=B1  2%      -2.0%       0.48    =
    sched_debug.cfs_rq:/.nr_running.stddev
     11.54 =C2=B1 34%     -30.7%       8.00 =C2=B1 38%     -92.3%       0.8=
9 =C2=B1173%  sched_debug.cfs_rq:/.removed.load_avg.avg
    187.73 =C2=B1  9%      +2.7%     192.82 =C2=B1  6%     -77.3%      42.6=
7 =C2=B1173%  sched_debug.cfs_rq:/.removed.load_avg.max
     44.04 =C2=B1 18%     -14.7%      37.55 =C2=B1 20%     -86.2%       6.0=
9 =C2=B1173%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      3.41 =C2=B1 25%     -31.8%       2.32 =C2=B1 59%     -91.5%       0.2=
9 =C2=B1173%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
     80.41 =C2=B1 12%     -16.4%      67.22 =C2=B1 35%     -82.6%      13.9=
6 =C2=B1173%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     14.60 =C2=B1 17%     -23.4%      11.18 =C2=B1 41%     -86.3%       1.9=
9 =C2=B1173%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      3.41 =C2=B1 25%     -32.5%       2.30 =C2=B1 60%     -91.5%       0.2=
9 =C2=B1173%  sched_debug.cfs_rq:/.removed.util_avg.avg
     80.26 =C2=B1 13%     -17.4%      66.27 =C2=B1 38%     -82.6%      13.9=
6 =C2=B1173%  sched_debug.cfs_rq:/.removed.util_avg.max
     14.58 =C2=B1 18%     -24.2%      11.06 =C2=B1 42%     -86.3%       1.9=
9 =C2=B1173%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    573.84 =C2=B1  4%      +2.6%     588.54 =C2=B1  2%      +2.7%     589.4=
6        sched_debug.cfs_rq:/.runnable_avg.avg
      1080 =C2=B1  2%      +3.0%       1112 =C2=B1  3%      +1.7%       109=
8 =C2=B1  3%  sched_debug.cfs_rq:/.runnable_avg.max
    466.22            +0.4%     468.00            -0.6%     463.42        s=
ched_debug.cfs_rq:/.runnable_avg.stddev
   -693492          -110.5%      72532 =C2=B1315%     -17.7%    -570411    =
    sched_debug.cfs_rq:/.spread0.avg
    841329 =C2=B1116%     +74.5%    1468000 =C2=B1 20%     +15.6%     97241=
9 =C2=B1124%  sched_debug.cfs_rq:/.spread0.max
  -2473255           -32.8%   -1662566            +2.0%   -2522613        s=
ched_debug.cfs_rq:/.spread0.min
   1553954 =C2=B1 10%      -4.4%    1484816 =C2=B1 11%      +4.1%    161842=
5 =C2=B1  9%  sched_debug.cfs_rq:/.spread0.stddev
    573.35 =C2=B1  4%      +2.5%     587.65 =C2=B1  2%      +2.7%     588.9=
7        sched_debug.cfs_rq:/.util_avg.avg
      1078 =C2=B1  2%      +2.9%       1110 =C2=B1  3%      +1.7%       109=
7 =C2=B1  2%  sched_debug.cfs_rq:/.util_avg.max
    465.94            +0.4%     467.80            -0.5%     463.48        s=
ched_debug.cfs_rq:/.util_avg.stddev
    463.83 =C2=B1  6%      -8.5%     424.22 =C2=B1  8%      +2.6%     475.8=
1 =C2=B1  4%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1025            +0.0%       1025            -2.3%       1001 =C2=B1  =
4%  sched_debug.cfs_rq:/.util_est_enqueued.max
    444.77            -4.1%     426.39 =C2=B1  4%      -0.9%     440.91    =
    sched_debug.cfs_rq:/.util_est_enqueued.stddev
    788292 =C2=B1  2%      +3.4%     815300 =C2=B1  3%      +1.3%     79839=
8        sched_debug.cpu.avg_idle.avg
   1000000            +4.1%    1041499 =C2=B1  4%      +1.9%    1019410 =C2=
=B1  3%  sched_debug.cpu.avg_idle.max
    332075 =C2=B1 14%     -19.3%     268045 =C2=B1 32%     -31.1%     22863=
5 =C2=B1 28%  sched_debug.cpu.avg_idle.min
    183312 =C2=B1  6%      -5.4%     173435 =C2=B1 12%      +7.2%     19652=
3 =C2=B1  6%  sched_debug.cpu.avg_idle.stddev
    158355 =C2=B1  9%      -4.5%     151305 =C2=B1  8%      +4.5%     16555=
5 =C2=B1  7%  sched_debug.cpu.clock.avg
    158358 =C2=B1  9%      -4.5%     151307 =C2=B1  8%      +4.5%     16555=
7 =C2=B1  7%  sched_debug.cpu.clock.max
    158352 =C2=B1  9%      -4.5%     151302 =C2=B1  8%      +4.5%     16555=
2 =C2=B1  7%  sched_debug.cpu.clock.min
      1.49 =C2=B1  2%      +3.1%       1.54 =C2=B1  4%      +2.0%       1.5=
2 =C2=B1  2%  sched_debug.cpu.clock.stddev
    156877 =C2=B1  9%      -4.5%     149877 =C2=B1  8%      +4.5%     16400=
3 =C2=B1  7%  sched_debug.cpu.clock_task.avg
    157133 =C2=B1  9%      -4.4%     150160 =C2=B1  8%      +4.6%     16428=
9 =C2=B1  7%  sched_debug.cpu.clock_task.max
    152998 =C2=B1  9%      -4.5%     146134 =C2=B1  8%      +4.8%     16027=
3 =C2=B1  8%  sched_debug.cpu.clock_task.min
    646.41 =C2=B1  5%      -4.5%     617.05 =C2=B1  5%      -2.2%     632.0=
2 =C2=B1  7%  sched_debug.cpu.clock_task.stddev
      1081            -1.7%       1062 =C2=B1  2%      +1.1%       1092    =
    sched_debug.cpu.curr->pid.avg
      5344 =C2=B1  6%      -3.3%       5168 =C2=B1  6%      +3.5%       553=
2 =C2=B1  5%  sched_debug.cpu.curr->pid.max
      1186 =C2=B1  3%      -2.1%       1161 =C2=B1  2%      +1.1%       120=
0 =C2=B1  2%  sched_debug.cpu.curr->pid.stddev
    500307            +0.0%     500536            +0.3%     501946        s=
ched_debug.cpu.max_idle_balance_cost.avg
    514770 =C2=B1  4%      +2.1%     525762 =C2=B1  5%     +10.4%     56813=
0 =C2=B1 16%  sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000            +0.0%     500000        s=
ched_debug.cpu.max_idle_balance_cost.min
      2109 =C2=B1173%     +74.4%       3679 =C2=B1112%    +380.2%      1013=
0 =C2=B1139%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            -0.0%       4294            +0.0%       4294        s=
ched_debug.cpu.next_balance.avg
      4294            -0.0%       4294            +0.0%       4294        s=
ched_debug.cpu.next_balance.max
      4294            -0.0%       4294            +0.0%       4294        s=
ched_debug.cpu.next_balance.min
      0.00 =C2=B1 15%     +15.5%       0.00 =C2=B1 40%     +14.7%       0.0=
0 =C2=B1 30%  sched_debug.cpu.next_balance.stddev
      0.50            -1.6%       0.50            +0.5%       0.51        s=
ched_debug.cpu.nr_running.avg
      1.09 =C2=B1  8%      +5.3%       1.15 =C2=B1 14%      -8.4%       1.0=
0        sched_debug.cpu.nr_running.max
      0.50            -0.3%       0.50            -1.0%       0.49        s=
ched_debug.cpu.nr_running.stddev
      6162 =C2=B1  7%      -4.0%       5914 =C2=B1  6%      +1.1%       622=
9 =C2=B1  6%  sched_debug.cpu.nr_switches.avg
     36915 =C2=B1 13%      +5.5%      38950 =C2=B1  8%      +2.3%      3777=
5 =C2=B1 18%  sched_debug.cpu.nr_switches.max
      1264 =C2=B1  6%      -4.0%       1214 =C2=B1  5%      -0.7%       125=
5 =C2=B1 10%  sched_debug.cpu.nr_switches.min
      6813 =C2=B1  8%      -2.0%       6678 =C2=B1  3%      +0.2%       682=
7 =C2=B1 14%  sched_debug.cpu.nr_switches.stddev
      0.00 =C2=B1100%    -100.0%       0.00           -54.5%       0.00 =C2=
=B1173%  sched_debug.cpu.nr_uninterruptible.avg
     24.34 =C2=B1 36%     -29.3%      17.20 =C2=B1 26%     -33.2%      16.2=
5 =C2=B1 27%  sched_debug.cpu.nr_uninterruptible.max
    -13.54           -17.3%     -11.20           -20.6%     -10.75        s=
ched_debug.cpu.nr_uninterruptible.min
      6.34 =C2=B1 31%     -13.2%       5.50 =C2=B1 13%     -14.2%       5.4=
4 =C2=B1  9%  sched_debug.cpu.nr_uninterruptible.stddev
    158353 =C2=B1  9%      -4.5%     151302 =C2=B1  8%      +4.5%     16555=
2 =C2=B1  7%  sched_debug.cpu_clk
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            -0.0%  4.295e+09            +0.0%  4.295e+09        s=
ched_debug.jiffies
    157871 =C2=B1  9%      -4.5%     150820 =C2=B1  8%      +4.6%     16507=
1 =C2=B1  7%  sched_debug.ktime
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.avg
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.max
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.min
    158754 =C2=B1  9%      -4.4%     151712 =C2=B1  8%      +4.6%     16600=
2 =C2=B1  7%  sched_debug.sched_clk
      1.00            +0.0%       1.00            +0.0%       1.00        s=
ched_debug.sched_clock_stable()
   4139835            +0.0%    4139835            +0.0%    4139835        s=
ched_debug.sysctl_sched.sysctl_sched_features
     24.00            +0.0%      24.00            +0.0%      24.00        s=
ched_debug.sysctl_sched.sysctl_sched_latency
      3.00            +0.0%       3.00            +0.0%       3.00        s=
ched_debug.sysctl_sched.sysctl_sched_min_granularity
      1.00            +0.0%       1.00            +0.0%       1.00        s=
ched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      4.00            +0.0%       4.00            +0.0%       4.00        s=
ched_debug.sysctl_sched.sysctl_sched_wakeup_granularity
      0.01 =C2=B1  5%      +9.7%       0.01 =C2=B1  5%      +6.5%       0.0=
1 =C2=B1  5%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.01 =C2=B1  8%     +21.4%       0.01 =C2=B1  6%     +19.0%       0.0=
1 =C2=B1  3%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.devkmsg_read.vfs_read.ksys_read
      0.01            -3.1%       0.01 =C2=B1  5%      -3.1%       0.01 =C2=
=B1  5%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.=
do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep
      0.01 =C2=B1 22%      +7.0%       0.01 =C2=B1  4%      +2.3%       0.0=
1 =C2=B1 11%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.do_syslog.part.0
      0.01            +4.2%       0.01 =C2=B1  6%      +0.0%       0.01    =
    perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.do_ta=
sk_dead.do_exit.do_group_exit
      0.01            +6.3%       0.01 =C2=B1  5%      +3.1%       0.01 =C2=
=B1  5%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.=
do_wait.kernel_wait4.__do_sys_wait4
      0.00        +1.3e+99%       0.00 =C2=B1173%  +1.3e+99%       0.00 =C2=
=B1173%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.=
exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      0.00 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.exit_=
to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_inter=
rupt
      0.00        +2.5e+99%       0.00 =C2=B1173%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.exit_=
to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_si=
ngle
      0.01 =C2=B1 20%      -3.8%       0.01 =C2=B1 11%      -1.9%       0.0=
1 =C2=B1  7%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.futex_wait_queue_me.futex_wait.do_futex
      0.00 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.io_sc=
hedule.put_and_wait_on_page_locked.do_swap_page
      0.00            +0.0%       0.00            +0.0%       0.00        p=
erf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.pipe_read.=
new_sync_read.vfs_read
      0.00        +1.5e+99%       0.00 =C2=B1173%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.preem=
pt_schedule_common._cond_resched.dput
      0.00 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.preem=
pt_schedule_common._cond_resched.generic_file_buffered_read
      9.39 =C2=B1 57%     -77.9%       2.08 =C2=B1173%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.=
preempt_schedule_common._cond_resched.mutex_lock
      0.00          -100.0%       0.00        +2.5e+98%       0.00 =C2=B117=
3%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.preem=
pt_schedule_common._cond_resched.stop_one_cpu
      0.00          -100.0%       0.00        +1.3e+99%       0.00 =C2=B117=
3%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.preem=
pt_schedule_common._cond_resched.zap_pte_range
      0.00 =C2=B1 57%     +11.1%       0.01 =C2=B1 58%     +44.4%       0.0=
1 =C2=B1  7%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.rcu_gp_kthread.kthread.ret_from_fork
      0.01 =C2=B1  8%      +2.6%       0.01            +2.6%       0.01 =C2=
=B1  7%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.=
schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait
      0.00 =C2=B1 23%     +50.0%       0.00 =C2=B1 11%      +0.0%       0.0=
0 =C2=B1 23%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop
      0.01 =C2=B1 26%     -12.1%       0.01 =C2=B1  5%     -15.2%       0.0=
1        perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.=
schedule_timeout.kcompactd.kthread
      0.01 =C2=B1111%    -100.0%       0.00            -3.2%       0.01 =C2=
=B1 57%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.=
schedule_timeout.khugepaged.kthread
      0.01 =C2=B1 13%      -7.7%       0.01            +3.8%       0.01 =C2=
=B1 19%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.=
schedule_timeout.rcu_gp_kthread.kthread
      0.01 =C2=B1 68%     -41.3%       0.01 =C2=B1  6%     -28.3%       0.0=
1 =C2=B1 26%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.schedule_timeout.wait_for_completion.__flush_work
      0.02 =C2=B1  7%    +241.5%       0.06 =C2=B1117%      -3.1%       0.0=
2 =C2=B1 12%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.smpboot_thread_fn.kthread.ret_from_fork
      0.01            -8.3%       0.01 =C2=B1  9%      -8.3%       0.01 =C2=
=B1  9%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_start.=
wait_for_partner.fifo_open.do_dentry_open
      0.02 =C2=B1 50%     +53.1%       0.03 =C2=B1 46%     +97.5%       0.0=
4 =C2=B1  5%  perf-sched.sch_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.worker_thread.kthread.ret_from_fork
      0.01           +13.9%       0.01 =C2=B1 15%      +8.3%       0.01 =C2=
=B1  8%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.=
__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.02 =C2=B1 17%     +16.7%       0.02 =C2=B1  8%     +21.2%       0.0=
2 =C2=B1  6%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.devkmsg_read.vfs_read.ksys_read
      0.01 =C2=B1 32%     -14.3%       0.01 =C2=B1 39%     -26.8%       0.0=
1 =C2=B1 21%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep
      0.02 =C2=B1 34%      -7.6%       0.02 =C2=B1 18%     -24.1%       0.0=
1 =C2=B1 16%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.do_syslog.part.0
      0.02 =C2=B1 21%     +16.1%       0.03 =C2=B1 36%     -19.5%       0.0=
2 =C2=B1  4%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.do_task_dead.do_exit.do_group_exit
      0.04 =C2=B1  9%     -22.5%       0.03 =C2=B1 11%     -25.4%       0.0=
3 =C2=B1 18%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.do_wait.kernel_wait4.__do_sys_wait4
      0.00        +1.3e+99%       0.00 =C2=B1173%  +1.3e+99%       0.00 =C2=
=B1173%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.=
exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      0.00 =C2=B1102%     -58.3%       0.00 =C2=B1173%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.=
exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_=
interrupt
      0.00        +2.5e+99%       0.00 =C2=B1173%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.exit_=
to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_si=
ngle
      0.01 =C2=B1  5%      -1.7%       0.01 =C2=B1  5%      -3.4%       0.0=
1 =C2=B1  7%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_a=
fter_hwframe
      0.02 =C2=B1 30%      -7.6%       0.02 =C2=B1 10%      -3.8%       0.0=
2 =C2=B1 31%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.futex_wait_queue_me.futex_wait.do_futex
      0.00 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.io_sc=
hedule.put_and_wait_on_page_locked.do_swap_page
      0.03 =C2=B1  7%      -8.5%       0.03 =C2=B1  9%     -17.1%       0.0=
2 =C2=B1  8%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.pipe_read.new_sync_read.vfs_read
      0.00 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.preem=
pt_schedule_common._cond_resched.__kmalloc
      0.00        +1.5e+99%       0.00 =C2=B1173%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.preem=
pt_schedule_common._cond_resched.dput
      0.00 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.preem=
pt_schedule_common._cond_resched.generic_file_buffered_read
      9.39 =C2=B1 57%     -66.7%       3.13 =C2=B1173%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.=
preempt_schedule_common._cond_resched.mutex_lock
      0.02 =C2=B1  6%      +6.6%       0.02 =C2=B1 13%    +836.8%       0.1=
8 =C2=B1155%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.preempt_schedule_common._cond_resched.stop_one_cpu
      0.00          -100.0%       0.00        +1.3e+99%       0.00 =C2=B117=
3%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.preem=
pt_schedule_common._cond_resched.zap_pte_range
      0.01 =C2=B1 59%     +17.4%       0.01 =C2=B1 57%     +73.9%       0.0=
1 =C2=B1 30%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.rcu_gp_kthread.kthread.ret_from_fork
      0.03 =C2=B1 54%     -23.4%       0.02 =C2=B1 10%     -26.1%       0.0=
2 =C2=B1  8%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait
      0.02 =C2=B1 28%      -6.3%       0.01 =C2=B1 40%     -26.6%       0.0=
1 =C2=B1 12%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop
      0.06 =C2=B1137%     -81.6%       0.01 =C2=B1 20%     -81.1%       0.0=
1 =C2=B1 17%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.schedule_timeout.kcompactd.kthread
      0.01 =C2=B1111%    -100.0%       0.00            -3.2%       0.01 =C2=
=B1 57%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.=
schedule_timeout.khugepaged.kthread
      1.01 =C2=B1170%     -98.0%       0.02 =C2=B1  2%     +47.3%       1.4=
9 =C2=B1171%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.schedule_timeout.rcu_gp_kthread.kthread
      0.01 =C2=B1 68%     -41.3%       0.01 =C2=B1  6%     -28.3%       0.0=
1 =C2=B1 26%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.schedule_timeout.wait_for_completion.__flush_work
      6.55 =C2=B1 15%    +387.1%      31.90 =C2=B1131%      -9.4%       5.9=
3 =C2=B1 21%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.smpboot_thread_fn.kthread.ret_from_fork
      0.02 =C2=B1  4%      +5.9%       0.02 =C2=B1 13%      +4.4%       0.0=
2 =C2=B1 10%  perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_s=
tart.wait_for_partner.fifo_open.do_dentry_open
      6.19 =C2=B1 60%     +52.5%       9.44 =C2=B1 57%    +103.7%      12.6=
1        perf-sched.sch_delay.max.ms.__sched_text_start.__sched_text_start.=
worker_thread.kthread.ret_from_fork
      0.01           +43.7%       0.01 =C2=B1 52%      +0.0%       0.01 =C2=
=B1  8%  perf-sched.total_sch_delay.average.ms
     12.55          +183.1%      35.53 =C2=B1111%      +0.5%      12.61    =
    perf-sched.total_sch_delay.max.ms
    137.17            +0.3%     137.53            +0.1%     137.26        p=
erf-sched.total_wait_and_delay.average.ms
      7187            -1.3%       7091            -1.0%       7113 =C2=B1  =
2%  perf-sched.total_wait_and_delay.count.ms
      7525 =C2=B1  6%      -3.0%       7300            -4.6%       7178    =
    perf-sched.total_wait_and_delay.max.ms
    137.16            +0.3%     137.51            +0.1%     137.26        p=
erf-sched.total_wait_time.average.ms
      7525 =C2=B1  6%      -3.0%       7300            -4.6%       7178    =
    perf-sched.total_wait_time.max.ms
    899.70            -0.0%     899.70            -0.0%     899.70        p=
erf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_start.__x64=
_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe
    249.36            +0.9%     251.64            +0.0%     249.42 =C2=B1  =
4%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_start.=
devkmsg_read.vfs_read.ksys_read
    845.29 =C2=B1  2%      -0.8%     838.63 =C2=B1  3%      +1.4%     857.1=
9        perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep
    249.36            +0.9%     251.64            +0.0%     249.42 =C2=B1  =
4%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_start.=
do_syslog.part.0
    274.01 =C2=B1  5%      -2.5%     267.20            +0.8%     276.30    =
    perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_start.=
do_task_dead.do_exit.do_group_exit
      1.15            +1.0%       1.17            +0.5%       1.16        p=
erf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_start.do_wa=
it.kernel_wait4.__do_sys_wait4
      0.01 =C2=B1173%     -21.8%       0.01 =C2=B1173%    -100.0%       0.0=
0        perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_t=
imer_interrupt
      0.77 =C2=B1161%     -94.2%       0.04 =C2=B1 24%     -91.8%       0.0=
6 =C2=B1 35%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_t=
ext_start.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL=
_64_after_hwframe
      0.00       +2.4e+104%     236.10 =C2=B1173%    -100.0%       0.00    =
    perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_start.=
futex_wait_queue_me.futex_wait.do_futex
     68.87            -1.1%      68.10            -1.2%      68.03        p=
erf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_start.pipe_=
read.new_sync_read.vfs_read
      0.01 =C2=B1173%    -100.0%       0.00          +283.0%       0.04 =C2=
=B1173%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.preempt_schedule_common._cond_resched.__kmalloc
    328.68 =C2=B1173%    -100.0%       0.00          +455.7%       1826 =C2=
=B1173%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.preempt_schedule_common._cond_resched.generic_perform_write
     18.48 =C2=B1  2%      -2.3%      18.06            -1.7%      18.17    =
    perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_start.=
preempt_schedule_common._cond_resched.stop_one_cpu
      0.00          -100.0%       0.00       +1.4e+102%       1.37 =C2=B110=
0%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_start.=
rcu_gp_kthread.kthread.ret_from_fork
    246.58 =C2=B1 57%     +47.1%     362.61 =C2=B1 17%      +0.0%     246.6=
2 =C2=B1 57%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_t=
ext_start.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait
    536.32 =C2=B1 23%     +31.1%     703.02 =C2=B1  7%      -5.8%     505.0=
5 =C2=B1  4%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_t=
ext_start.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop
    478.79            +0.0%     478.79            -0.2%     477.79        p=
erf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_start.sched=
ule_timeout.kcompactd.kthread
      4.94 =C2=B1  5%      +2.1%       5.05 =C2=B1  6%      +3.1%       5.1=
0 =C2=B1  5%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_t=
ext_start.schedule_timeout.rcu_gp_kthread.kthread
    680.47 =C2=B1  2%      -0.0%     680.46 =C2=B1  2%      -0.5%     677.2=
1 =C2=B1  2%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_t=
ext_start.smpboot_thread_fn.kthread.ret_from_fork
      0.01            -8.3%       0.01 =C2=B1  9%      -8.3%       0.01 =C2=
=B1  9%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_text_s=
tart.wait_for_partner.fifo_open.do_dentry_open
    388.12 =C2=B1  6%      -2.6%     378.01 =C2=B1  4%      +1.9%     395.6=
0 =C2=B1  4%  perf-sched.wait_and_delay.avg.ms.__sched_text_start.__sched_t=
ext_start.worker_thread.kthread.ret_from_fork
     10.00            +0.0%      10.00            +0.0%      10.00        p=
erf-sched.wait_and_delay.count.__sched_text_start.__sched_text_start.__x64_=
sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.00            +0.0%       6.00            +0.0%       6.00        p=
erf-sched.wait_and_delay.count.__sched_text_start.__sched_text_start.devkms=
g_read.vfs_read.ksys_read
     21.00            +2.4%      21.50 =C2=B1  4%      +0.0%      21.00    =
    perf-sched.wait_and_delay.count.__sched_text_start.__sched_text_start.d=
o_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep
      6.00            +0.0%       6.00            +0.0%       6.00        p=
erf-sched.wait_and_delay.count.__sched_text_start.__sched_text_start.do_sys=
log.part.0
    247.00            +0.3%     247.75            +0.0%     247.00        p=
erf-sched.wait_and_delay.count.__sched_text_start.__sched_text_start.do_tas=
k_dead.do_exit.do_group_exit
    245.75            +0.3%     246.50            +0.1%     246.00        p=
erf-sched.wait_and_delay.count.__sched_text_start.__sched_text_start.do_wai=
t.kernel_wait4.__do_sys_wait4
      9.25 =C2=B1173%      -8.1%       8.50 =C2=B1173%    -100.0%       0.0=
0        perf-sched.wait_and_delay.count.__sched_text_start.__sched_text_st=
art.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_ti=
mer_interrupt
    336.50 =C2=B1  8%      -5.5%     318.00 =C2=B1 11%      +1.9%     342.7=
5 =C2=B1 12%  perf-sched.wait_and_delay.count.__sched_text_start.__sched_te=
xt_start.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_=
64_after_hwframe
      0.00       +1.8e+102%       1.75 =C2=B1173%    -100.0%       0.00    =
    perf-sched.wait_and_delay.count.__sched_text_start.__sched_text_start.f=
utex_wait_queue_me.futex_wait.do_futex
      2250            +1.0%       2272            +1.0%       2273        p=
erf-sched.wait_and_delay.count.__sched_text_start.__sched_text_start.pipe_r=
ead.new_sync_read.vfs_read
     10.25 =C2=B1173%    -100.0%       0.00            -9.8%       9.25 =C2=
=B1173%  perf-sched.wait_and_delay.count.__sched_text_start.__sched_text_st=
art.preempt_schedule_common._cond_resched.__kmalloc
      0.25 =C2=B1173%    -100.0%       0.00            +0.0%       0.25 =C2=
=B1173%  perf-sched.wait_and_delay.count.__sched_text_start.__sched_text_st=
art.preempt_schedule_common._cond_resched.generic_perform_write
    576.00            -2.0%     564.25 =C2=B1  3%      -2.9%     559.25 =C2=
=B1  3%  perf-sched.wait_and_delay.count.__sched_text_start.__sched_text_st=
art.preempt_schedule_common._cond_resched.stop_one_cpu
      0.00          -100.0%       0.00       +2.1e+103%      21.00 =C2=B110=
0%  perf-sched.wait_and_delay.count.__sched_text_start.__sched_text_start.r=
cu_gp_kthread.kthread.ret_from_fork
     26.25 =C2=B1 57%     +36.2%      35.75 =C2=B1  4%      +0.0%      26.2=
5 =C2=B1 57%  perf-sched.wait_and_delay.count.__sched_text_start.__sched_te=
xt_start.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait
     65.50 =C2=B1 17%     -28.2%      47.00 =C2=B1  6%      -2.7%      63.7=
5 =C2=B1 14%  perf-sched.wait_and_delay.count.__sched_text_start.__sched_te=
xt_start.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop
     40.00            +0.0%      40.00            -3.8%      38.50 =C2=B1  =
2%  perf-sched.wait_and_delay.count.__sched_text_start.__sched_text_start.s=
chedule_timeout.kcompactd.kthread
      2016 =C2=B1  5%      -2.0%       1975 =C2=B1  6%      -3.2%       195=
2 =C2=B1  6%  perf-sched.wait_and_delay.count.__sched_text_start.__sched_te=
xt_start.schedule_timeout.rcu_gp_kthread.kthread
    674.00            -1.9%     661.50 =C2=B1  3%      -2.4%     658.00 =C2=
=B1  2%  perf-sched.wait_and_delay.count.__sched_text_start.__sched_text_st=
art.smpboot_thread_fn.kthread.ret_from_fork
     72.00            +0.0%      72.00            +0.0%      72.00        p=
erf-sched.wait_and_delay.count.__sched_text_start.__sched_text_start.wait_f=
or_partner.fifo_open.do_dentry_open
    490.75 =C2=B1  4%      +0.7%     494.25 =C2=B1  3%      +0.8%     494.7=
5 =C2=B1  7%  perf-sched.wait_and_delay.count.__sched_text_start.__sched_te=
xt_start.worker_thread.kthread.ret_from_fork
    999.69            +0.0%     999.69            +0.0%     999.69        p=
erf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_start.__x64=
_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1355 =C2=B1  2%      +2.2%       1385            +0.7%       1365 =C2=
=B1  4%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_s=
tart.devkmsg_read.vfs_read.ksys_read
      1000            -0.0%       1000            -0.0%       1000        p=
erf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_start.do_na=
nosleep.hrtimer_nanosleep.__x64_sys_nanosleep
      1355 =C2=B1  2%      +2.2%       1385            +0.7%       1365 =C2=
=B1  4%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_s=
tart.do_syslog.part.0
      4344 =C2=B1 54%     -50.9%       2135 =C2=B1 20%      -9.5%       393=
0 =C2=B1 36%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_t=
ext_start.do_task_dead.do_exit.do_group_exit
     26.34            +1.3%      26.68            +0.2%      26.39        p=
erf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_start.do_wa=
it.kernel_wait4.__do_sys_wait4
      0.04 =C2=B1173%      -3.5%       0.03 =C2=B1173%    -100.0%       0.0=
0        perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_s=
tart.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_t=
imer_interrupt
    252.42 =C2=B1171%     -99.1%       2.23 =C2=B1158%     -98.0%       4.9=
5 =C2=B1 96%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_t=
ext_start.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL=
_64_after_hwframe
      0.00       +1.6e+105%       1621 =C2=B1173%    -100.0%       0.00    =
    perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_start.=
futex_wait_queue_me.futex_wait.do_futex
      1355 =C2=B1  2%      +2.2%       1385            +0.7%       1365 =C2=
=B1  4%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_s=
tart.pipe_read.new_sync_read.vfs_read
      0.04 =C2=B1173%    -100.0%       0.00         +2826.3%       1.11 =C2=
=B1173%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_s=
tart.preempt_schedule_common._cond_resched.__kmalloc
    328.68 =C2=B1173%    -100.0%       0.00          +455.7%       1826 =C2=
=B1173%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_s=
tart.preempt_schedule_common._cond_resched.generic_perform_write
      1532 =C2=B1 19%     -11.5%       1355 =C2=B1  7%     -11.0%       136=
3 =C2=B1  2%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_t=
ext_start.preempt_schedule_common._cond_resched.stop_one_cpu
      0.00          -100.0%       0.00       +2.5e+102%       2.50 =C2=B110=
0%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_start.=
rcu_gp_kthread.kthread.ret_from_fork
    750.37 =C2=B1 58%    +208.5%       2314 =C2=B1 94%      -0.6%     745.9=
2 =C2=B1 57%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_t=
ext_start.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait
      7175            +1.7%       7300            -6.9%       6683 =C2=B1 1=
1%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_start.=
schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop
    505.00            -0.0%     504.75            +0.0%     505.00        p=
erf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_text_start.sched=
ule_timeout.kcompactd.kthread
    164.76 =C2=B1 56%     -20.0%     131.76 =C2=B1 64%     -10.3%     147.7=
5 =C2=B1 57%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_t=
ext_start.schedule_timeout.rcu_gp_kthread.kthread
      1805 =C2=B1 70%      -1.2%       1784 =C2=B1 71%     +38.9%       250=
7 =C2=B1 59%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_t=
ext_start.smpboot_thread_fn.kthread.ret_from_fork
      0.02 =C2=B1  4%      +5.9%       0.02 =C2=B1 13%      +4.4%       0.0=
2 =C2=B1 10%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_t=
ext_start.wait_for_partner.fifo_open.do_dentry_open
      5407 =C2=B1 37%      -2.2%       5290 =C2=B1 18%     -23.7%       412=
4 =C2=B1 17%  perf-sched.wait_and_delay.max.ms.__sched_text_start.__sched_t=
ext_start.worker_thread.kthread.ret_from_fork
    899.69            -0.0%     899.69            -0.0%     899.69        p=
erf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.__x64_sys_=
pause.do_syscall_64.entry_SYSCALL_64_after_hwframe
    249.34            +0.9%     251.62            +0.0%     249.40 =C2=B1  =
4%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.devkm=
sg_read.vfs_read.ksys_read
    845.28 =C2=B1  2%      -0.8%     838.62 =C2=B1  3%      +1.4%     857.1=
9        perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.=
do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep
    249.35            +0.9%     251.63            +0.0%     249.41 =C2=B1  =
4%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.do_sy=
slog.part.0
    274.00 =C2=B1  5%      -2.5%     267.19            +0.8%     276.30    =
    perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.do_ta=
sk_dead.do_exit.do_group_exit
      1.15            +0.9%       1.16            +0.5%       1.15        p=
erf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.do_wait.ke=
rnel_wait4.__do_sys_wait4
      0.06 =C2=B1 27%     -13.4%       0.05 =C2=B1 27%      -0.8%       0.0=
6 =C2=B1 30%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_t=
imer_interrupt
      0.02 =C2=B1173%   +1818.2%       0.32 =C2=B1147%    +263.6%       0.0=
6 =C2=B1100%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_f=
unction_single
      0.01 =C2=B1173%    -100.0%       0.00           +17.4%       0.01 =C2=
=B1173%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.=
exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_irq_work
      0.04 =C2=B1 28%     -27.6%       0.03 =C2=B1 16%     -11.5%       0.0=
3 =C2=B1 24%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_resche=
dule_ipi
      0.77 =C2=B1161%     -94.2%       0.04 =C2=B1 24%     -91.8%       0.0=
6 =C2=B1 36%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_a=
fter_hwframe
     44.23 =C2=B1 25%    +504.5%     267.36 =C2=B1146%      -1.6%      43.5=
2 =C2=B1  6%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.futex_wait_queue_me.futex_wait.do_futex
      0.01 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.io_sc=
hedule.__lock_page_killable.filemap_fault
      0.01 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.io_sc=
hedule.put_and_wait_on_page_locked.do_swap_page
     68.87            -1.1%      68.10            -1.2%      68.03        p=
erf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.pipe_read.=
new_sync_read.vfs_read
      0.05 =C2=B1  6%      -8.0%       0.04 =C2=B1 25%     +59.6%       0.0=
7 =C2=B1 81%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.preempt_schedule_common._cond_resched.__kmalloc
    328.68 =C2=B1173%    -100.0%       0.00          +455.7%       1826 =C2=
=B1173%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.=
preempt_schedule_common._cond_resched.generic_perform_write
     18.48 =C2=B1  2%      -2.3%      18.06            -1.7%      18.17    =
    perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.preem=
pt_schedule_common._cond_resched.stop_one_cpu
      1.95 =C2=B1 60%      +7.9%       2.11 =C2=B1 60%     +32.5%       2.5=
9 =C2=B1 13%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.rcu_gp_kthread.kthread.ret_from_fork
    275.42 =C2=B1 33%     +31.7%     362.60 =C2=B1 17%      +1.0%     278.2=
2 =C2=B1 31%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait
    536.32 =C2=B1 23%     +31.1%     703.02 =C2=B1  7%      -5.8%     505.0=
4 =C2=B1  4%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop
    478.78            +0.0%     478.78            -0.2%     477.78        p=
erf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.schedule_t=
imeout.kcompactd.kthread
      0.01 =C2=B1 63%     -63.0%       0.01 =C2=B1 20%      +3.7%       0.0=
1 =C2=B1 37%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.schedule_timeout.khugepaged.kthread
      4.94 =C2=B1  5%      +2.1%       5.04 =C2=B1  6%      +3.1%       5.0=
9 =C2=B1  5%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.schedule_timeout.rcu_gp_kthread.kthread
      0.00        +4.3e+99%       0.00 =C2=B1173%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_start.sched=
ule_timeout.wait_for_completion.stop_one_cpu
    680.45 =C2=B1  2%      -0.0%     680.41 =C2=B1  2%      -0.5%     677.2=
0 =C2=B1  2%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.smpboot_thread_fn.kthread.ret_from_fork
    388.10 =C2=B1  6%      -2.6%     377.98 =C2=B1  4%      +1.9%     395.5=
6 =C2=B1  4%  perf-sched.wait_time.avg.ms.__sched_text_start.__sched_text_s=
tart.worker_thread.kthread.ret_from_fork
    999.68            +0.0%     999.68            -0.0%     999.68        p=
erf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.__x64_sys_=
pause.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1355 =C2=B1  2%      +2.2%       1385            +0.7%       1365 =C2=
=B1  4%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.=
devkmsg_read.vfs_read.ksys_read
      1000            +0.0%       1000            +0.0%       1000        p=
erf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.do_nanosle=
ep.hrtimer_nanosleep.__x64_sys_nanosleep
      1355 =C2=B1  2%      +2.2%       1385            +0.7%       1365 =C2=
=B1  4%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.=
do_syslog.part.0
      4344 =C2=B1 54%     -50.9%       2135 =C2=B1 20%      -9.5%       393=
0 =C2=B1 36%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.do_task_dead.do_exit.do_group_exit
     26.34            +1.3%      26.67            +0.2%      26.39        p=
erf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.do_wait.ke=
rnel_wait4.__do_sys_wait4
      0.17 =C2=B1 42%     -38.5%       0.11 =C2=B1 40%     -10.0%       0.1=
6 =C2=B1 52%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_t=
imer_interrupt
      0.02 =C2=B1173%   +1389.4%       0.32 =C2=B1147%    +184.7%       0.0=
6 =C2=B1100%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_f=
unction_single
      0.01 =C2=B1173%    -100.0%       0.00           +17.4%       0.01 =C2=
=B1173%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.=
exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_irq_work
      0.07 =C2=B1 61%     -31.8%       0.05 =C2=B1 18%     +78.2%       0.1=
2 =C2=B1105%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_resche=
dule_ipi
    252.41 =C2=B1171%     -99.1%       2.23 =C2=B1158%     -98.0%       4.9=
5 =C2=B1 96%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_a=
fter_hwframe
    101.51 =C2=B1 33%   +1564.4%       1689 =C2=B1163%      -5.9%      95.5=
6 =C2=B1  3%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.futex_wait_queue_me.futex_wait.do_futex
      0.01 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.io_sc=
hedule.__lock_page_killable.filemap_fault
      0.01 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.io_sc=
hedule.put_and_wait_on_page_locked.do_swap_page
      1355 =C2=B1  2%      +2.2%       1385            +0.7%       1365 =C2=
=B1  4%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.=
pipe_read.new_sync_read.vfs_read
      0.15 =C2=B1  7%      -1.8%       0.15 =C2=B1 54%    +673.4%       1.2=
0 =C2=B1156%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.preempt_schedule_common._cond_resched.__kmalloc
    328.68 =C2=B1173%    -100.0%       0.00          +455.7%       1826 =C2=
=B1173%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.=
preempt_schedule_common._cond_resched.generic_perform_write
      1531 =C2=B1 19%     -11.5%       1355 =C2=B1  7%     -11.0%       136=
3 =C2=B1  2%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.preempt_schedule_common._cond_resched.stop_one_cpu
      3.24 =C2=B1 59%     +15.5%       3.75 =C2=B1 57%     +46.1%       4.7=
4 =C2=B1  9%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.rcu_gp_kthread.kthread.ret_from_fork
    978.61 =C2=B1  6%    +136.5%       2314 =C2=B1 94%      -1.6%     962.7=
8 =C2=B1  7%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait
      7175            +1.7%       7300            -6.9%       6683 =C2=B1 1=
1%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.sched=
ule_hrtimeout_range_clock.poll_schedule_timeout.constprop
    504.99            -0.0%     504.74            +0.0%     504.99        p=
erf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.schedule_t=
imeout.kcompactd.kthread
      0.01 =C2=B1 63%     -63.0%       0.01 =C2=B1 20%      +3.7%       0.0=
1 =C2=B1 37%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.schedule_timeout.khugepaged.kthread
    164.75 =C2=B1 56%     -20.0%     131.75 =C2=B1 64%     -10.3%     147.7=
4 =C2=B1 57%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.schedule_timeout.rcu_gp_kthread.kthread
      0.00        +4.3e+99%       0.00 =C2=B1173%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_start.sched=
ule_timeout.wait_for_completion.stop_one_cpu
      1804 =C2=B1 70%      -1.2%       1784 =C2=B1 71%     +38.9%       250=
7 =C2=B1 59%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.smpboot_thread_fn.kthread.ret_from_fork
      5407 =C2=B1 37%      -2.2%       5290 =C2=B1 18%     -23.7%       412=
4 =C2=B1 17%  perf-sched.wait_time.max.ms.__sched_text_start.__sched_text_s=
tart.worker_thread.kthread.ret_from_fork
     28.50 =C2=B1 21%      -3.3       25.24 =C2=B1  7%      +0.2       28.7=
2 =C2=B1 24%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_st=
artup_entry.start_secondary.secondary_startup_64
     28.50 =C2=B1 21%      -3.3       25.24 =C2=B1  7%      +0.2       28.7=
2 =C2=B1 24%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_=
enter.do_idle.cpu_startup_entry.start_secondary
     28.51 =C2=B1 21%      -3.3       25.25 =C2=B1  7%      +0.2       28.7=
2 =C2=B1 24%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_seco=
ndary.secondary_startup_64
     28.51 =C2=B1 21%      -3.3       25.25 =C2=B1  7%      +0.2       28.7=
2 =C2=B1 24%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.st=
art_secondary.secondary_startup_64
     28.51 =C2=B1 21%      -3.3       25.25 =C2=B1  7%      +0.2       28.7=
2 =C2=B1 24%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_st=
artup_64
     28.68 =C2=B1 21%      -2.6       26.11 =C2=B1  5%      +0.3       29.0=
2 =C2=B1 23%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_sta=
te.cpuidle_enter.do_idle.cpu_startup_entry
     28.68 =C2=B1 21%      -2.6       26.12 =C2=B1  5%      +0.3       29.0=
3 =C2=B1 23%  perf-profile.calltrace.cycles-pp.secondary_startup_64
     26.78 =C2=B1  8%      -0.8       25.97            +0.1       26.88 =C2=
=B1  9%  perf-profile.calltrace.cycles-pp.__fget_light.do_sys_poll.__x64_sy=
s_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.07 =C2=B1  8%      -0.6       18.43 =C2=B1  2%      -0.2       18.8=
8 =C2=B1 10%  perf-profile.calltrace.cycles-pp.fput_many.do_sys_poll.__x64_=
sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
     22.53 =C2=B1  8%      -0.6       21.89 =C2=B1  2%      +0.1       22.6=
7 =C2=B1  8%  perf-profile.calltrace.cycles-pp.__fget_files.__fget_light.do=
_sys_poll.__x64_sys_poll.do_syscall_64
      1.92 =C2=B1  8%      -0.1        1.85 =C2=B1  2%      -0.1        1.8=
7 =C2=B1 11%  perf-profile.calltrace.cycles-pp.__entry_text_start.__poll
      1.71 =C2=B1  9%      -0.1        1.65 =C2=B1  3%      -0.0        1.7=
1 =C2=B1  8%  perf-profile.calltrace.cycles-pp.__fdget.do_sys_poll.__x64_sy=
s_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.69 =C2=B1  9%      -0.1        1.63 =C2=B1  3%      -0.0        1.6=
6 =C2=B1 11%  perf-profile.calltrace.cycles-pp.fput.do_sys_poll.__x64_sys_p=
oll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.24 =C2=B1  9%      -0.0        3.20 =C2=B1  3%      -0.0        3.2=
3 =C2=B1  9%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.en=
try_SYSCALL_64_after_hwframe.__poll
      2.86 =C2=B1  8%      -0.0        2.83            +0.0        2.89 =C2=
=B1 10%  perf-profile.calltrace.cycles-pp.testcase
      1.68 =C2=B1  9%      -0.0        1.66            -0.0        1.68 =C2=
=B1 12%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__poll
      1.04 =C2=B1  9%      -0.0        1.02 =C2=B1  4%      -0.0        1.0=
1 =C2=B1 11%  perf-profile.calltrace.cycles-pp.__check_object_size.do_sys_p=
oll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.67 =C2=B1 11%      -0.0        0.65 =C2=B1  3%      -0.0        0.6=
3 =C2=B1 10%  perf-profile.calltrace.cycles-pp.kfree.do_sys_poll.__x64_sys_=
poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.07 =C2=B1  7%      -0.0        1.06 =C2=B1  2%      -0.0        1.0=
7 =C2=B1  8%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_stri=
ng._copy_from_user.do_sys_poll.__x64_sys_poll.do_syscall_64
      1.44 =C2=B1  8%      -0.0        1.44 =C2=B1  2%      +0.0        1.4=
4 =C2=B1  9%  perf-profile.calltrace.cycles-pp._copy_from_user.do_sys_poll.=
__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.1        0.14 =C2=B117=
3%  perf-profile.calltrace.cycles-pp.__kmalloc.do_sys_poll.__x64_sys_poll.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.1        0.13 =C2=B1173%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.__virt_addr_valid.__check_object_size.=
do_sys_poll.__x64_sys_poll.do_syscall_64
      0.17 =C2=B1173%      +0.7        0.87 =C2=B1 66%      +0.1        0.3=
0 =C2=B1173%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_kern=
el.secondary_startup_64
      0.17 =C2=B1173%      +0.7        0.87 =C2=B1 66%      +0.1        0.3=
0 =C2=B1173%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.st=
art_kernel.secondary_startup_64
      0.17 =C2=B1173%      +0.7        0.87 =C2=B1 66%      +0.1        0.3=
0 =C2=B1173%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_st=
artup_entry.start_kernel.secondary_startup_64
      0.17 =C2=B1173%      +0.7        0.87 =C2=B1 66%      +0.1        0.3=
0 =C2=B1173%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_=
enter.do_idle.cpu_startup_entry.start_kernel
      0.17 =C2=B1173%      +0.7        0.87 =C2=B1 66%      +0.1        0.3=
0 =C2=B1173%  perf-profile.calltrace.cycles-pp.start_kernel.secondary_start=
up_64
      0.00            +1.0        0.98 =C2=B1  3%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.__put_user_nocheck_2.do_sys_poll.__x64=
_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
     67.78 =C2=B1  8%      +2.5       70.30 =C2=B1  2%      -0.4       67.4=
1 =C2=B1  9%  perf-profile.calltrace.cycles-pp.__poll
     63.81 =C2=B1  8%      +2.6       66.42 =C2=B1  2%      -0.3       63.5=
1 =C2=B1  9%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwfra=
me.__poll
     60.11 =C2=B1  8%      +2.7       62.76 =C2=B1  2%      -0.3       59.8=
0 =C2=B1  9%  perf-profile.calltrace.cycles-pp.__x64_sys_poll.do_syscall_64=
.entry_SYSCALL_64_after_hwframe.__poll
     60.37 =C2=B1  8%      +2.7       63.03 =C2=B1  2%      -0.3       60.0=
8 =C2=B1  9%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_=
64_after_hwframe.__poll
     58.02 =C2=B1  8%      +3.4       61.43 =C2=B1  2%      -0.2       57.7=
7 =C2=B1  9%  perf-profile.calltrace.cycles-pp.do_sys_poll.__x64_sys_poll.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe.__poll
     28.51 =C2=B1 21%      -3.3       25.25 =C2=B1  7%      +0.2       28.7=
2 =C2=B1 24%  perf-profile.children.cycles-pp.start_secondary
     28.68 =C2=B1 21%      -2.6       26.12 =C2=B1  5%      +0.4       29.0=
3 =C2=B1 23%  perf-profile.children.cycles-pp.cpuidle_enter
     28.68 =C2=B1 21%      -2.6       26.12 =C2=B1  5%      +0.4       29.0=
3 =C2=B1 23%  perf-profile.children.cycles-pp.cpuidle_enter_state
     28.68 =C2=B1 21%      -2.6       26.12 =C2=B1  5%      +0.3       29.0=
3 =C2=B1 23%  perf-profile.children.cycles-pp.secondary_startup_64
     28.68 =C2=B1 21%      -2.6       26.12 =C2=B1  5%      +0.3       29.0=
3 =C2=B1 23%  perf-profile.children.cycles-pp.cpu_startup_entry
     28.68 =C2=B1 21%      -2.6       26.12 =C2=B1  5%      +0.3       29.0=
3 =C2=B1 23%  perf-profile.children.cycles-pp.do_idle
     28.68 =C2=B1 21%      -2.6       26.12 =C2=B1  5%      +0.3       29.0=
2 =C2=B1 23%  perf-profile.children.cycles-pp.intel_idle
     25.94 =C2=B1  8%      -0.8       25.16            +0.1       26.04 =C2=
=B1  9%  perf-profile.children.cycles-pp.__fget_light
     22.54 =C2=B1  8%      -0.6       21.90 =C2=B1  2%      +0.1       22.6=
8 =C2=B1  8%  perf-profile.children.cycles-pp.__fget_files
     18.23 =C2=B1  8%      -0.6       17.61 =C2=B1  2%      -0.2       18.0=
5 =C2=B1 10%  perf-profile.children.cycles-pp.fput_many
      1.93 =C2=B1  8%      -0.1        1.86 =C2=B1  2%      -0.1        1.8=
8 =C2=B1 11%  perf-profile.children.cycles-pp.__entry_text_start
      1.70 =C2=B1  8%      -0.1        1.65            -0.0        1.70 =C2=
=B1  9%  perf-profile.children.cycles-pp.__fdget
      3.27 =C2=B1  9%      -0.0        3.22 =C2=B1  3%      -0.0        3.2=
5 =C2=B1  9%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.69 =C2=B1 10%      -0.0        1.65            -0.0        1.68 =C2=
=B1 11%  perf-profile.children.cycles-pp.fput
      0.67 =C2=B1 12%      -0.0        0.65 =C2=B1  2%      -0.0        0.6=
4 =C2=B1 11%  perf-profile.children.cycles-pp.kfree
      0.29 =C2=B1  4%      -0.0        0.27 =C2=B1  8%      +0.0        0.3=
0 =C2=B1 11%  perf-profile.children.cycles-pp.__check_heap_object
      1.89 =C2=B1  9%      -0.0        1.88            -0.0        1.88 =C2=
=B1 12%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.13 =C2=B1 10%      -0.0        0.11 =C2=B1  7%      -0.0        0.1=
1 =C2=B1 11%  perf-profile.children.cycles-pp.kmalloc_slab
      1.06 =C2=B1  9%      -0.0        1.05 =C2=B1  4%      -0.0        1.0=
5 =C2=B1 12%  perf-profile.children.cycles-pp.__check_object_size
      1.09 =C2=B1  8%      -0.0        1.08 =C2=B1  2%      +0.0        1.0=
9 =C2=B1  7%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      2.88 =C2=B1  8%      -0.0        2.87            +0.0        2.89 =C2=
=B1 10%  perf-profile.children.cycles-pp.testcase
      1.45 =C2=B1  8%      -0.0        1.45            +0.0        1.45 =C2=
=B1  9%  perf-profile.children.cycles-pp._copy_from_user
      0.16 =C2=B1  8%      -0.0        0.16 =C2=B1  5%      +0.0        0.1=
7 =C2=B1  2%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.06 =C2=B1  7%      -0.0        0.06 =C2=B1  9%      -0.0        0.0=
4 =C2=B1 58%  perf-profile.children.cycles-pp.__unwind_start
      0.04 =C2=B1 58%      +0.0        0.04 =C2=B1 58%      -0.0        0.0=
1 =C2=B1173%  perf-profile.children.cycles-pp.__x86_retpoline_rax
      0.01 =C2=B1173%      +0.0        0.01 =C2=B1173%      -0.0        0.0=
0        perf-profile.children.cycles-pp.perf_output_sample
      0.01 =C2=B1173%      +0.0        0.01 =C2=B1173%      +0.0        0.0=
3 =C2=B1100%  perf-profile.children.cycles-pp.poll_freewait
      0.00            +0.0        0.00            +0.0        0.01 =C2=B117=
3%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.04 =C2=B1 58%      +0.0        0.04 =C2=B1 58%      -0.0        0.0=
1 =C2=B1173%  perf-profile.children.cycles-pp.__get_user_nocheck_8
      0.39 =C2=B1 21%      +0.0        0.40 =C2=B1 20%      -0.1        0.3=
4 =C2=B1 13%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.05 =C2=B1 58%      +0.0        0.05            -0.0        0.04 =C2=
=B1 58%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.12 =C2=B1  9%      +0.0        0.12 =C2=B1  5%      +0.0        0.1=
2 =C2=B1 12%  perf-profile.children.cycles-pp.__might_sleep
      0.47 =C2=B1  8%      +0.0        0.47 =C2=B1  7%      +0.0        0.4=
7 =C2=B1 12%  perf-profile.children.cycles-pp.__kmalloc
      0.15 =C2=B1  4%      +0.0        0.15 =C2=B1  5%      -0.0        0.1=
2 =C2=B1 31%  perf-profile.children.cycles-pp.perf_callchain_kernel
      0.11            +0.0        0.11 =C2=B1  7%      -0.0        0.07 =C2=
=B1 58%  perf-profile.children.cycles-pp.unwind_next_frame
      0.07 =C2=B1 17%      +0.0        0.07 =C2=B1 14%      -0.0        0.0=
7 =C2=B1 25%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.27 =C2=B1 10%      +0.0        0.27 =C2=B1  4%      -0.0        0.2=
6 =C2=B1 11%  perf-profile.children.cycles-pp.__might_fault
      0.21 =C2=B1  6%      +0.0        0.22 =C2=B1  3%      -0.0        0.1=
7 =C2=B1 29%  perf-profile.children.cycles-pp.get_perf_callchain
      0.21 =C2=B1  6%      +0.0        0.22 =C2=B1  3%      -0.0        0.1=
7 =C2=B1 30%  perf-profile.children.cycles-pp.perf_callchain
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1  5%      -0.0        0.0=
7 =C2=B1  6%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1  5%      -0.0        0.0=
7 =C2=B1  6%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1  5%      -0.0        0.0=
7 =C2=B1  6%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1  5%      -0.0        0.0=
7 =C2=B1  6%  perf-profile.children.cycles-pp.irq_work_run
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1  5%      -0.0        0.0=
7 =C2=B1  6%  perf-profile.children.cycles-pp.irq_work_run_list
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1  5%      -0.0        0.0=
7 =C2=B1  6%  perf-profile.children.cycles-pp.irq_work_single
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1  5%      -0.0        0.0=
7 =C2=B1  6%  perf-profile.children.cycles-pp.printk
      0.10 =C2=B1  4%      +0.0        0.11 =C2=B1  8%      +0.0        0.1=
3 =C2=B1 12%  perf-profile.children.cycles-pp.___might_sleep
      0.29 =C2=B1  7%      +0.0        0.30 =C2=B1  5%      -0.1        0.2=
3 =C2=B1 28%  perf-profile.children.cycles-pp.perf_swevent_overflow
      0.29 =C2=B1  7%      +0.0        0.30 =C2=B1  5%      -0.1        0.2=
3 =C2=B1 28%  perf-profile.children.cycles-pp.__perf_event_overflow
      0.28 =C2=B1  8%      +0.0        0.29 =C2=B1  5%      -0.1        0.2=
3 =C2=B1 28%  perf-profile.children.cycles-pp.perf_event_output_forward
      0.01 =C2=B1173%      +0.0        0.03 =C2=B1100%      -0.0        0.0=
0        perf-profile.children.cycles-pp.ordered_events__queue
      0.00            +0.0        0.01 =C2=B1173%      +0.0        0.00    =
    perf-profile.children.cycles-pp.proc_reg_read
      0.00            +0.0        0.01 =C2=B1173%      +0.0        0.00    =
    perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.00            +0.0        0.01 =C2=B1173%      +0.0        0.01 =C2=
=B1173%  perf-profile.children.cycles-pp.poll_select_set_timeout
      0.00            +0.0        0.01 =C2=B1173%      +0.0        0.01 =C2=
=B1173%  perf-profile.children.cycles-pp._cond_resched
      0.23 =C2=B1  8%      +0.0        0.24 =C2=B1  5%      -0.0        0.1=
9 =C2=B1 29%  perf-profile.children.cycles-pp.perf_prepare_sample
      0.15 =C2=B1 12%      +0.0        0.17 =C2=B1  9%      -0.0        0.1=
5 =C2=B1 18%  perf-profile.children.cycles-pp.kthread
      0.15 =C2=B1 12%      +0.0        0.17 =C2=B1  9%      +0.0        0.1=
5 =C2=B1 16%  perf-profile.children.cycles-pp.ret_from_fork
      0.07 =C2=B1  6%      +0.0        0.08 =C2=B1  8%      +0.0        0.0=
7        perf-profile.children.cycles-pp.serial8250_console_putchar
      0.29 =C2=B1  7%      +0.0        0.31 =C2=B1  4%      -0.1        0.2=
4 =C2=B1 28%  perf-profile.children.cycles-pp.perf_tp_event
      0.15 =C2=B1 12%      +0.0        0.16 =C2=B1  9%      -0.0        0.1=
5 =C2=B1 15%  perf-profile.children.cycles-pp.process_one_work
      0.15 =C2=B1 12%      +0.0        0.16 =C2=B1  9%      -0.0        0.1=
5 =C2=B1 15%  perf-profile.children.cycles-pp.drm_fb_helper_dirty_work
      0.15 =C2=B1 10%      +0.0        0.16 =C2=B1 11%      +0.0        0.1=
5 =C2=B1 15%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.15 =C2=B1 10%      +0.0        0.16 =C2=B1 11%      +0.0        0.1=
5 =C2=B1 15%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.15 =C2=B1 10%      +0.0        0.16 =C2=B1 11%      +0.0        0.1=
5 =C2=B1 15%  perf-profile.children.cycles-pp.commit_tail
      0.15 =C2=B1 10%      +0.0        0.16 =C2=B1 11%      +0.0        0.1=
5 =C2=B1 15%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
      0.15 =C2=B1 10%      +0.0        0.16 =C2=B1 11%      +0.0        0.1=
5 =C2=B1 15%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_plan=
es
      0.15 =C2=B1 10%      +0.0        0.16 =C2=B1 11%      +0.0        0.1=
5 =C2=B1 15%  perf-profile.children.cycles-pp.mgag200_simple_display_pipe_u=
pdate
      0.15 =C2=B1 10%      +0.0        0.16 =C2=B1 11%      +0.0        0.1=
5 =C2=B1 15%  perf-profile.children.cycles-pp.mgag200_handle_damage
      0.07 =C2=B1  5%      +0.0        0.09 =C2=B1  9%      +0.0        0.0=
7 =C2=B1  5%  perf-profile.children.cycles-pp.vprintk_emit
      0.07 =C2=B1  5%      +0.0        0.09 =C2=B1  9%      +0.0        0.0=
7 =C2=B1  5%  perf-profile.children.cycles-pp.console_unlock
      0.07            +0.0        0.08 =C2=B1  5%      +0.0        0.07 =C2=
=B1  5%  perf-profile.children.cycles-pp.serial8250_console_write
      0.03 =C2=B1100%      +0.0        0.04 =C2=B1 58%      -0.0        0.0=
0        perf-profile.children.cycles-pp.machines__deliver_event
      0.03 =C2=B1100%      +0.0        0.04 =C2=B1 58%      -0.0        0.0=
0        perf-profile.children.cycles-pp.seq_read
      0.04 =C2=B1 59%      +0.0        0.06 =C2=B1 11%      -0.0        0.0=
3 =C2=B1100%  perf-profile.children.cycles-pp.perf_callchain_user
      0.01 =C2=B1173%      +0.0        0.03 =C2=B1100%      -0.0        0.0=
0        perf-profile.children.cycles-pp.__libc_read
      0.07 =C2=B1  6%      +0.0        0.08 =C2=B1 10%      +0.0        0.0=
7        perf-profile.children.cycles-pp.wait_for_xmitr
      0.03 =C2=B1100%      +0.0        0.04 =C2=B1 60%      -0.0        0.0=
2 =C2=B1173%  perf-profile.children.cycles-pp.exc_page_fault
      0.31 =C2=B1  7%      +0.0        0.33 =C2=B1  4%      -0.1        0.2=
6 =C2=B1 28%  perf-profile.children.cycles-pp.update_curr
      0.29 =C2=B1  6%      +0.0        0.31 =C2=B1  4%      -0.1        0.2=
4 =C2=B1 28%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.15 =C2=B1 12%      +0.0        0.17 =C2=B1  9%      +0.0        0.1=
5 =C2=B1 18%  perf-profile.children.cycles-pp.worker_thread
      0.14 =C2=B1  9%      +0.0        0.16 =C2=B1 11%      +0.0        0.1=
5 =C2=B1 15%  perf-profile.children.cycles-pp.drm_fb_memcpy_dstclip
      0.14 =C2=B1  9%      +0.0        0.16 =C2=B1 11%      +0.0        0.1=
5 =C2=B1 15%  perf-profile.children.cycles-pp.memcpy_toio
      0.07 =C2=B1  6%      +0.0        0.08 =C2=B1  5%      +0.0        0.0=
7        perf-profile.children.cycles-pp.uart_console_write
      0.03 =C2=B1100%      +0.0        0.04 =C2=B1 59%      -0.0        0.0=
1 =C2=B1173%  perf-profile.children.cycles-pp.ksys_read
      0.03 =C2=B1100%      +0.0        0.04 =C2=B1 59%      -0.0        0.0=
1 =C2=B1173%  perf-profile.children.cycles-pp.vfs_read
      0.35 =C2=B1  5%      +0.0        0.37 =C2=B1  4%      -0.1        0.2=
9 =C2=B1 28%  perf-profile.children.cycles-pp.task_tick_fair
      0.40 =C2=B1  6%      +0.0        0.42 =C2=B1  3%      -0.0        0.3=
5 =C2=B1 24%  perf-profile.children.cycles-pp.update_process_times
      0.41 =C2=B1  6%      +0.0        0.43 =C2=B1  3%      -0.0        0.3=
7 =C2=B1 24%  perf-profile.children.cycles-pp.tick_sched_timer
      0.12 =C2=B1 33%      +0.0        0.15 =C2=B1 24%      +0.0        0.1=
2 =C2=B1 21%  perf-profile.children.cycles-pp.__libc_start_main
      0.12 =C2=B1 33%      +0.0        0.15 =C2=B1 24%      +0.0        0.1=
2 =C2=B1 21%  perf-profile.children.cycles-pp.main
      0.12 =C2=B1 33%      +0.0        0.15 =C2=B1 24%      +0.0        0.1=
2 =C2=B1 21%  perf-profile.children.cycles-pp.run_builtin
      0.06 =C2=B1 63%      +0.0        0.08 =C2=B1 21%      +0.0        0.0=
7 =C2=B1 11%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.05 =C2=B1 61%      +0.0        0.07 =C2=B1 20%      +0.0        0.0=
7 =C2=B1  6%  perf-profile.children.cycles-pp.perf_session__process_user_ev=
ent
      0.40 =C2=B1  6%      +0.0        0.42 =C2=B1  2%      -0.0        0.3=
5 =C2=B1 24%  perf-profile.children.cycles-pp.tick_sched_handle
      0.11 =C2=B1  9%      +0.0        0.14 =C2=B1 12%      -0.0        0.1=
0 =C2=B1  8%  perf-profile.children.cycles-pp.poll(a)plt
      0.37 =C2=B1  6%      +0.0        0.40 =C2=B1  4%      -0.0        0.3=
2 =C2=B1 26%  perf-profile.children.cycles-pp.scheduler_tick
      0.46 =C2=B1  5%      +0.0        0.48 =C2=B1  2%      -0.0        0.4=
1 =C2=B1 21%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.00            +0.0        0.03 =C2=B1100%      +0.0        0.01 =C2=
=B1173%  perf-profile.children.cycles-pp.ksys_write
      0.00            +0.0        0.03 =C2=B1100%      +0.0        0.01 =C2=
=B1173%  perf-profile.children.cycles-pp.vfs_write
      0.00            +0.0        0.03 =C2=B1100%      +0.0        0.01 =C2=
=B1173%  perf-profile.children.cycles-pp.new_sync_write
      0.03 =C2=B1100%      +0.0        0.05 =C2=B1 58%      +0.0        0.0=
4 =C2=B1 59%  perf-profile.children.cycles-pp.check_stack_object
      0.12 =C2=B1 37%      +0.0        0.14 =C2=B1 23%      +0.0        0.1=
2 =C2=B1 25%  perf-profile.children.cycles-pp.cmd_sched
      0.10 =C2=B1 38%      +0.0        0.12 =C2=B1 20%      +0.0        0.1=
1 =C2=B1  7%  perf-profile.children.cycles-pp.process_simple
      0.11 =C2=B1 37%      +0.0        0.14 =C2=B1 21%      +0.0        0.1=
3 =C2=B1  6%  perf-profile.children.cycles-pp.record__finish_output
      0.11 =C2=B1 37%      +0.0        0.14 =C2=B1 21%      +0.0        0.1=
3 =C2=B1  6%  perf-profile.children.cycles-pp.perf_session__process_events
      0.06 =C2=B1 63%      +0.0        0.08 =C2=B1 23%      +0.0        0.0=
8 =C2=B1  5%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.01 =C2=B1173%      +0.0        0.04 =C2=B1 58%      +0.0        0.0=
1 =C2=B1173%  perf-profile.children.cycles-pp.io_serial_in
      0.53 =C2=B1  6%      +0.0        0.56 =C2=B1  3%      -0.0        0.4=
8 =C2=B1 19%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.52 =C2=B1  6%      +0.0        0.55 =C2=B1  2%      -0.1        0.4=
7 =C2=B1 19%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.12 =C2=B1 37%      +0.0        0.15 =C2=B1 22%      +0.0        0.1=
4 =C2=B1  6%  perf-profile.children.cycles-pp.cmd_record
      0.60 =C2=B1  6%      +0.0        0.64 =C2=B1  2%      -0.0        0.5=
6 =C2=B1 16%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interru=
pt
      0.55 =C2=B1  6%      +0.0        0.59 =C2=B1  3%      -0.0        0.5=
1 =C2=B1 17%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.53 =C2=B1  5%      +0.1        0.59 =C2=B1  2%      -0.0        0.5=
0 =C2=B1 16%  perf-profile.children.cycles-pp.asm_call_sysvec_on_stack
      0.17 =C2=B1173%      +0.7        0.87 =C2=B1 66%      +0.1        0.3=
0 =C2=B1173%  perf-profile.children.cycles-pp.start_kernel
      0.00            +1.8        1.77 =C2=B1  3%      +0.0        0.00    =
    perf-profile.children.cycles-pp.__put_user_nocheck_2
     68.01 =C2=B1  8%      +2.5       70.51 =C2=B1  2%      -0.4       67.6=
3 =C2=B1  9%  perf-profile.children.cycles-pp.__poll
     63.95 =C2=B1  8%      +2.6       66.58 =C2=B1  2%      -0.3       63.6=
4 =C2=B1  9%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     60.11 =C2=B1  8%      +2.7       62.79 =C2=B1  2%      -0.3       59.8=
3 =C2=B1  9%  perf-profile.children.cycles-pp.__x64_sys_poll
     59.75 =C2=B1  8%      +2.7       62.42 =C2=B1  2%      -0.3       59.4=
9 =C2=B1  9%  perf-profile.children.cycles-pp.do_sys_poll
     60.49 =C2=B1  8%      +2.7       63.18 =C2=B1  2%      -0.3       60.2=
0 =C2=B1  9%  perf-profile.children.cycles-pp.do_syscall_64
     28.68 =C2=B1 21%      -2.6       26.12 =C2=B1  5%      +0.3       29.0=
2 =C2=B1 23%  perf-profile.self.cycles-pp.intel_idle
     22.34 =C2=B1  8%      -0.7       21.67 =C2=B1  2%      +0.1       22.4=
9 =C2=B1  9%  perf-profile.self.cycles-pp.__fget_files
     17.23 =C2=B1  8%      -0.6       16.63 =C2=B1  2%      -0.2       17.0=
7 =C2=B1 10%  perf-profile.self.cycles-pp.fput_many
      2.54 =C2=B1  7%      -0.1        2.43 =C2=B1  2%      -0.0        2.5=
1 =C2=B1 11%  perf-profile.self.cycles-pp.__fget_light
      1.71 =C2=B1  8%      -0.1        1.66 =C2=B1  3%      -0.0        1.6=
7 =C2=B1 11%  perf-profile.self.cycles-pp.__entry_text_start
      3.23 =C2=B1  9%      -0.0        3.18 =C2=B1  3%      -0.0        3.2=
1 =C2=B1  9%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.45 =C2=B1  7%      -0.0        0.42            -0.0        0.44 =C2=
=B1  8%  perf-profile.self.cycles-pp.__poll
      0.84 =C2=B1  7%      -0.0        0.81 =C2=B1  2%      +0.0        0.8=
4 =C2=B1  9%  perf-profile.self.cycles-pp.__fdget
      0.28 =C2=B1  5%      -0.0        0.26 =C2=B1  7%      +0.0        0.2=
9 =C2=B1 12%  perf-profile.self.cycles-pp.__check_heap_object
      0.66 =C2=B1 12%      -0.0        0.64 =C2=B1  2%      -0.0        0.6=
3 =C2=B1 10%  perf-profile.self.cycles-pp.kfree
      0.85 =C2=B1 11%      -0.0        0.83 =C2=B1  3%      -0.0        0.8=
4 =C2=B1 12%  perf-profile.self.cycles-pp.fput
      1.88 =C2=B1 10%      -0.0        1.87            -0.0        1.88 =C2=
=B1 12%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.35 =C2=B1  6%      -0.0        0.34 =C2=B1  8%      +0.0        0.3=
7 =C2=B1 11%  perf-profile.self.cycles-pp.__check_object_size
      1.08 =C2=B1  8%      -0.0        1.07 =C2=B1  2%      +0.0        1.0=
8 =C2=B1  7%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.12 =C2=B1 11%      -0.0        0.11 =C2=B1  7%      -0.0        0.1=
0 =C2=B1 10%  perf-profile.self.cycles-pp.kmalloc_slab
      0.19 =C2=B1  8%      -0.0        0.19 =C2=B1  6%      +0.0        0.1=
9 =C2=B1  9%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.85 =C2=B1  8%      -0.0        2.85            +0.0        2.86 =C2=
=B1 10%  perf-profile.self.cycles-pp.testcase
      0.10 =C2=B1 11%      -0.0        0.10 =C2=B1  5%      +0.0        0.1=
0 =C2=B1 13%  perf-profile.self.cycles-pp._copy_from_user
      0.14 =C2=B1 10%      -0.0        0.14 =C2=B1  7%      +0.0        0.1=
5 =C2=B1  5%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.10 =C2=B1 11%      -0.0        0.10 =C2=B1 15%      -0.0        0.1=
0 =C2=B1  8%  perf-profile.self.cycles-pp.poll(a)plt
      0.03 =C2=B1100%      +0.0        0.03 =C2=B1100%      -0.0        0.0=
0        perf-profile.self.cycles-pp.unwind_next_frame
      0.13 =C2=B1 12%      +0.0        0.13 =C2=B1  6%      -0.0        0.1=
0 =C2=B1 14%  perf-profile.self.cycles-pp.__might_fault
      0.01 =C2=B1173%      +0.0        0.01 =C2=B1173%      -0.0        0.0=
0        perf-profile.self.cycles-pp.__x86_retpoline_rax
      0.07 =C2=B1 17%      +0.0        0.07            -0.0        0.07 =C2=
=B1 16%  perf-profile.self.cycles-pp.do_syscall_64
      0.38 =C2=B1 19%      +0.0        0.39 =C2=B1 21%      -0.1        0.3=
3 =C2=B1 13%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.11 =C2=B1  8%      +0.0        0.11 =C2=B1  4%      +0.0        0.1=
1 =C2=B1 12%  perf-profile.self.cycles-pp.__might_sleep
      0.30 =C2=B1 10%      +0.0        0.31            -0.0        0.29 =C2=
=B1 12%  perf-profile.self.cycles-pp.__x64_sys_poll
      0.11 =C2=B1 13%      +0.0        0.12 =C2=B1 12%      -0.0        0.1=
1 =C2=B1 19%  perf-profile.self.cycles-pp.memcpy_toio
      0.09 =C2=B1  4%      +0.0        0.10 =C2=B1  7%      +0.0        0.1=
2 =C2=B1 14%  perf-profile.self.cycles-pp.___might_sleep
      0.00            +0.0        0.01 =C2=B1173%      +0.0        0.00    =
    perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.00            +0.0        0.01 =C2=B1173%      +0.0        0.01 =C2=
=B1173%  perf-profile.self.cycles-pp.poll_select_set_timeout
      0.23 =C2=B1 11%      +0.0        0.25 =C2=B1 11%      +0.0        0.2=
5 =C2=B1 17%  perf-profile.self.cycles-pp.__kmalloc
      0.01 =C2=B1173%      +0.0        0.04 =C2=B1 58%      +0.0        0.0=
1 =C2=B1173%  perf-profile.self.cycles-pp.io_serial_in
      0.01 =C2=B1173%      +0.0        0.04 =C2=B1 59%      +0.0        0.0=
3 =C2=B1100%  perf-profile.self.cycles-pp.check_stack_object
      0.00            +1.6        1.64 =C2=B1  3%      +0.0        0.00    =
    perf-profile.self.cycles-pp.__put_user_nocheck_2
     11.79 =C2=B1  8%      +2.4       14.22 =C2=B1  2%      -0.1       11.6=
6 =C2=B1 10%  perf-profile.self.cycles-pp.do_sys_poll
    659.00 =C2=B1  2%      +0.3%     661.25 =C2=B1  2%      -0.3%     657.0=
0        softirqs.BLOCK
      0.25 =C2=B1173%   +3500.0%       9.00 =C2=B1110%   +7700.0%      19.5=
0 =C2=B1 81%  softirqs.CPU0.BLOCK
      2.25 =C2=B1 19%     -11.1%       2.00           -11.1%       2.00    =
    softirqs.CPU0.HI
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU0.NET_RX
      0.00          -100.0%       0.00       +2.5e+101%       0.25 =C2=B117=
3%  softirqs.CPU0.NET_TX
     19606 =C2=B1 19%     -22.7%      15159 =C2=B1 12%      +4.0%      2039=
8 =C2=B1 22%  softirqs.CPU0.RCU
     16113 =C2=B1 76%     +75.9%      28335 =C2=B1 19%     +23.1%      1983=
2 =C2=B1 62%  softirqs.CPU0.SCHED
     48.50            +0.0%      48.50            +0.0%      48.50        s=
oftirqs.CPU0.TASKLET
      2180 =C2=B1 29%     -17.6%       1796 =C2=B1 18%     +15.3%       251=
5 =C2=B1 29%  softirqs.CPU0.TIMER
      8.00 =C2=B1100%     +50.0%      12.00 =C2=B1137%     -15.6%       6.7=
5 =C2=B1164%  softirqs.CPU1.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU1.NET_RX
     14.25 =C2=B1100%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU1.NET_TX
     11740 =C2=B1 10%     +35.9%      15952 =C2=B1 20%      -2.1%      1148=
9 =C2=B1 19%  softirqs.CPU1.RCU
     37963 =C2=B1 15%     -63.0%      14034 =C2=B1109%     -15.6%      3203=
9 =C2=B1 30%  softirqs.CPU1.SCHED
      9.25 =C2=B1129%     -59.5%       3.75 =C2=B1113%     -78.4%       2.0=
0        softirqs.CPU1.TASKLET
      1202 =C2=B1 63%     -54.1%     552.00 =C2=B1102%      -2.9%       116=
8 =C2=B1 47%  softirqs.CPU1.TIMER
      0.00          -100.0%       0.00         +1e+103%      10.50 =C2=B117=
3%  softirqs.CPU10.BLOCK
     12033 =C2=B1 25%     +33.8%      16100 =C2=B1 22%     +27.5%      1534=
6 =C2=B1 22%  softirqs.CPU10.RCU
     32151 =C2=B1 50%     -57.5%      13671 =C2=B1116%     -49.9%      1610=
6 =C2=B1 91%  softirqs.CPU10.SCHED
      1344 =C2=B1 95%     -93.9%      81.75 =C2=B1 52%     -76.9%     310.5=
0 =C2=B1135%  softirqs.CPU10.TIMER
      0.25 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU11.BLOCK
      7.00 =C2=B1173%    -100.0%       0.00           -96.4%       0.25 =C2=
=B1173%  softirqs.CPU11.NET_TX
     16583 =C2=B1 22%     -18.8%      13470 =C2=B1 31%     -31.0%      1145=
0 =C2=B1 28%  softirqs.CPU11.RCU
     16016 =C2=B1 91%     +52.2%      24371 =C2=B1 61%     +93.6%      3100=
5 =C2=B1 50%  softirqs.CPU11.SCHED
      2.75 =C2=B1173%     -81.8%       0.50 =C2=B1173%     -45.5%       1.5=
0 =C2=B1110%  softirqs.CPU11.TASKLET
    427.75 =C2=B1 87%     -46.3%     229.75 =C2=B1 76%     +97.6%     845.2=
5 =C2=B1100%  softirqs.CPU11.TIMER
      0.00       +5.2e+102%       5.25 =C2=B1173%    -100.0%       0.00    =
    softirqs.CPU12.BLOCK
     11661 =C2=B1 13%      -1.5%      11484 =C2=B1 23%     +36.0%      1586=
5 =C2=B1 21%  softirqs.CPU12.RCU
     29650 =C2=B1 51%     -27.0%      21641 =C2=B1 84%     -52.4%      1411=
6 =C2=B1118%  softirqs.CPU12.SCHED
      0.50 =C2=B1173%    -100.0%       0.00          +250.0%       1.75 =C2=
=B1173%  softirqs.CPU12.TASKLET
      1023 =C2=B1 48%      +5.3%       1077 =C2=B1 85%     -60.3%     406.2=
5 =C2=B1144%  softirqs.CPU12.TIMER
      0.00       +8.3e+102%       8.25 =C2=B1145%   +6e+102%       6.00 =C2=
=B1173%  softirqs.CPU13.BLOCK
     12535 =C2=B1 20%      +2.9%      12904 =C2=B1 32%      +4.7%      1312=
1 =C2=B1 22%  softirqs.CPU13.RCU
     29105 =C2=B1 52%     -24.1%      22103 =C2=B1 87%     -22.4%      2257=
1 =C2=B1 80%  softirqs.CPU13.SCHED
      0.00          -100.0%       0.00       +6.5e+102%       6.50 =C2=B116=
4%  softirqs.CPU13.TASKLET
      2957 =C2=B1139%     -91.8%     241.50 =C2=B1 84%     -67.5%     961.5=
0 =C2=B1126%  softirqs.CPU13.TIMER
     21.25 =C2=B1111%     -89.4%       2.25 =C2=B1 79%     -27.1%      15.5=
0 =C2=B1173%  softirqs.CPU14.BLOCK
     10593 =C2=B1 15%     +11.3%      11786 =C2=B1 15%     +56.0%      1652=
5 =C2=B1 15%  softirqs.CPU14.RCU
     35229 =C2=B1 24%     -36.7%      22293 =C2=B1 80%     -71.8%       992=
0 =C2=B1 58%  softirqs.CPU14.SCHED
      2.00           +12.5%       2.25 =C2=B1 19%     +37.5%       2.75 =C2=
=B1 47%  softirqs.CPU14.TASKLET
    720.75 =C2=B1102%     +22.4%     882.50 =C2=B1 92%     -85.6%     103.5=
0 =C2=B1 67%  softirqs.CPU14.TIMER
      0.00          -100.0%       0.00       +3.5e+102%       3.50 =C2=B114=
2%  softirqs.CPU15.BLOCK
      0.00       +2.5e+101%       0.25 =C2=B1173%    -100.0%       0.00    =
    softirqs.CPU15.NET_TX
     16382 =C2=B1  7%     -13.5%      14178 =C2=B1 27%     -26.3%      1208=
0 =C2=B1 30%  softirqs.CPU15.RCU
      6104 =C2=B1 60%    +257.0%      21793 =C2=B1 80%    +421.3%      3182=
0 =C2=B1 52%  softirqs.CPU15.SCHED
      2.50 =C2=B1 34%    +250.0%       8.75 =C2=B1 89%     +30.0%       3.2=
5 =C2=B1 66%  softirqs.CPU15.TASKLET
     50.75 =C2=B1 81%   +1654.7%     890.50 =C2=B1 93%   +1292.1%     706.5=
0 =C2=B1105%  softirqs.CPU15.TIMER
      0.00          -100.0%       0.00       +2.5e+101%       0.25 =C2=B117=
3%  softirqs.CPU16.BLOCK
      0.00          -100.0%       0.00       +7.2e+102%       7.25 =C2=B117=
3%  softirqs.CPU16.NET_TX
     10898 =C2=B1  7%     +32.0%      14383 =C2=B1 30%     +42.6%      1554=
3 =C2=B1 31%  softirqs.CPU16.RCU
     41161 =C2=B1  4%     -47.4%      21631 =C2=B1 88%     -44.0%      2305=
4 =C2=B1 80%  softirqs.CPU16.SCHED
      2.00          +287.5%       7.75 =C2=B1128%      +0.0%       2.00    =
    softirqs.CPU16.TASKLET
    949.75 =C2=B1 66%     -83.9%     152.50 =C2=B1 90%      -6.8%     885.5=
0 =C2=B1140%  softirqs.CPU16.TIMER
     20.00 =C2=B1114%     -97.5%       0.50 =C2=B1173%    +177.5%      55.5=
0 =C2=B1 68%  softirqs.CPU17.BLOCK
     19417 =C2=B1  6%     -19.2%      15693 =C2=B1 24%     -34.0%      1280=
8 =C2=B1 27%  softirqs.CPU17.RCU
      3750 =C2=B1 30%    +244.3%      12912 =C2=B1121%    +758.7%      3220=
2 =C2=B1 49%  softirqs.CPU17.SCHED
      6.75 =C2=B1121%     -70.4%       2.00            -3.7%       6.50 =C2=
=B1 69%  softirqs.CPU17.TASKLET
     49.00 =C2=B1 36%   +1464.3%     766.50 =C2=B1149%    +969.4%     524.0=
0 =C2=B1 76%  softirqs.CPU17.TIMER
      0.00       +1.1e+103%      10.75 =C2=B1173% +2.5e+101%       0.25 =C2=
=B1173%  softirqs.CPU18.BLOCK
     13561 =C2=B1 22%     -11.1%      12056 =C2=B1 23%     +17.2%      1589=
1 =C2=B1 20%  softirqs.CPU18.RCU
     31989 =C2=B1 49%     -15.4%      27063 =C2=B1 57%     -51.1%      1565=
5 =C2=B1 89%  softirqs.CPU18.SCHED
      2.25 =C2=B1 19%     -11.1%       2.00           -11.1%       2.00    =
    softirqs.CPU18.TASKLET
    931.75 =C2=B1100%     -16.7%     776.25 =C2=B1117%     -89.8%      95.0=
0 =C2=B1 58%  softirqs.CPU18.TIMER
     77.75 =C2=B1 77%     -85.9%      11.00 =C2=B1173%     -89.7%       8.0=
0 =C2=B1173%  softirqs.CPU19.BLOCK
     19330 =C2=B1  6%     -22.5%      14978 =C2=B1 26%     -36.7%      1224=
1 =C2=B1 26%  softirqs.CPU19.RCU
      4492 =C2=B1  2%    +180.3%      12593 =C2=B1121%    +602.1%      3153=
7 =C2=B1 50%  softirqs.CPU19.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU19.TASKLET
     33.25 =C2=B1 29%   +2142.1%     745.50 =C2=B1150%   +2139.1%     744.5=
0 =C2=B1134%  softirqs.CPU19.TIMER
     27.00 =C2=B1 62%     -61.1%      10.50 =C2=B1173%     -99.1%       0.2=
5 =C2=B1173%  softirqs.CPU2.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU2.NET_RX
      7.50 =C2=B1165%    -100.0%       0.00            -3.3%       7.25 =C2=
=B1173%  softirqs.CPU2.NET_TX
     16086 =C2=B1 23%      +6.6%      17151 =C2=B1 18%      +0.6%      1618=
1 =C2=B1 21%  softirqs.CPU2.RCU
     13153 =C2=B1124%     -18.8%      10683 =C2=B1 94%     +12.0%      1473=
6 =C2=B1104%  softirqs.CPU2.SCHED
      1.50 =C2=B1 57%      +0.0%       1.50 =C2=B1 57%      +0.0%       1.5=
0 =C2=B1 57%  softirqs.CPU2.TASKLET
    130.25 =C2=B1 94%    +111.7%     275.75 =C2=B1 81%    +481.2%     757.0=
0 =C2=B1134%  softirqs.CPU2.TIMER
      5.25 =C2=B1140%     -90.5%       0.50 =C2=B1173%     -95.2%       0.2=
5 =C2=B1173%  softirqs.CPU20.BLOCK
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU20.NET_TX
     10942 =C2=B1  9%     +10.4%      12081 =C2=B1 24%     +39.4%      1525=
7 =C2=B1 30%  softirqs.CPU20.RCU
     40598 =C2=B1  4%     -26.0%      30053 =C2=B1 49%     -52.2%      1941=
7 =C2=B1 82%  softirqs.CPU20.SCHED
      2.00            +0.0%       2.00           +75.0%       3.50 =C2=B1 7=
4%  softirqs.CPU20.TASKLET
      1257 =C2=B1 85%      +3.3%       1298 =C2=B1111%     -84.9%     189.2=
5 =C2=B1 83%  softirqs.CPU20.TIMER
      2.75 =C2=B1152%    +845.5%      26.00 =C2=B1 99%    +218.2%       8.7=
5 =C2=B1173%  softirqs.CPU21.BLOCK
     17365 =C2=B1 23%     -12.9%      15119 =C2=B1 25%     -22.2%      1350=
4 =C2=B1 25%  softirqs.CPU21.RCU
     13980 =C2=B1117%      -7.4%      12938 =C2=B1115%     +20.6%      1685=
4 =C2=B1 89%  softirqs.CPU21.SCHED
      2.00            +0.0%       2.00          +262.5%       7.25 =C2=B112=
5%  softirqs.CPU21.TASKLET
    434.75 =C2=B1164%     -82.1%      78.00 =C2=B1 87%     +95.0%     847.7=
5 =C2=B1164%  softirqs.CPU21.TIMER
     16.25 =C2=B1 95%     -96.9%       0.50 =C2=B1173%     +86.2%      30.2=
5 =C2=B1173%  softirqs.CPU22.BLOCK
     10625 =C2=B1  7%      +7.6%      11434 =C2=B1 24%     +49.1%      1584=
4 =C2=B1 27%  softirqs.CPU22.RCU
     41026 =C2=B1  4%     -23.4%      31411 =C2=B1 49%     -66.9%      1356=
0 =C2=B1116%  softirqs.CPU22.SCHED
      1185 =C2=B1 82%     -12.6%       1036 =C2=B1 66%     -60.5%     467.5=
0 =C2=B1161%  softirqs.CPU22.TIMER
      6.00 =C2=B1154%    +629.2%      43.75 =C2=B1102%     -62.5%       2.2=
5 =C2=B1148%  softirqs.CPU23.BLOCK
      0.00          -100.0%       0.00       +7.2e+102%       7.25 =C2=B117=
3%  softirqs.CPU23.NET_TX
     18415 =C2=B1  7%     -10.0%      16569 =C2=B1 10%      -3.7%      1773=
2 =C2=B1 18%  softirqs.CPU23.RCU
      6500 =C2=B1 92%      +0.7%       6548 =C2=B1 84%     +43.5%       933=
0 =C2=B1 68%  softirqs.CPU23.SCHED
      0.75 =C2=B1173%    +200.0%       2.25 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU23.TASKLET
    179.00 =C2=B1130%     -59.2%      73.00 =C2=B1 33%     +17.2%     209.7=
5 =C2=B1 54%  softirqs.CPU23.TIMER
      9.00 =C2=B1173%     -66.7%       3.00 =C2=B1173%     +27.8%      11.5=
0 =C2=B1153%  softirqs.CPU24.BLOCK
     14188 =C2=B1 28%     +13.8%      16141 =C2=B1 15%      -7.8%      1308=
3 =C2=B1 15%  softirqs.CPU24.RCU
     23858 =C2=B1 65%     -23.4%      18277 =C2=B1 35%      +7.3%      2560=
9 =C2=B1 52%  softirqs.CPU24.SCHED
      0.00         +5e+101%       0.50 =C2=B1173%    -100.0%       0.00    =
    softirqs.CPU24.TASKLET
    373.75 =C2=B1 76%     -17.3%     309.00 =C2=B1 46%     -33.5%     248.5=
0 =C2=B1 79%  softirqs.CPU24.TIMER
      9.00 =C2=B1173%     -22.2%       7.00 =C2=B1102%     -97.2%       0.2=
5 =C2=B1173%  softirqs.CPU25.BLOCK
     17509 =C2=B1 16%     -24.9%      13148 =C2=B1 30%     -16.9%      1455=
4 =C2=B1 23%  softirqs.CPU25.RCU
      7246 =C2=B1 87%    +333.9%      31446 =C2=B1 49%     +73.5%      1257=
2 =C2=B1 73%  softirqs.CPU25.SCHED
      0.00       +2.3e+102%       2.25 =C2=B1173%    -100.0%       0.00    =
    softirqs.CPU25.TASKLET
    284.75 =C2=B1123%     -22.2%     221.50 =C2=B1 99%     -60.2%     113.2=
5 =C2=B1 57%  softirqs.CPU25.TIMER
     17.00 =C2=B1105%     -38.2%      10.50 =C2=B1173%     -38.2%      10.5=
0 =C2=B1173%  softirqs.CPU26.BLOCK
      1559 =C2=B1128%    +294.5%       6152 =C2=B1140%     -64.1%     560.2=
5 =C2=B1108%  softirqs.CPU26.NET_RX
      2.25 =C2=B1 19%     -11.1%       2.00 =C2=B1 35%     -44.4%       1.2=
5 =C2=B1103%  softirqs.CPU26.NET_TX
     10591 =C2=B1 13%     +18.1%      12510 =C2=B1 13%      +5.6%      1118=
3 =C2=B1 28%  softirqs.CPU26.RCU
     31383 =C2=B1 48%     +14.2%      35831 =C2=B1 31%      -4.9%      2986=
0 =C2=B1 54%  softirqs.CPU26.SCHED
      0.25 =C2=B1173%   +1500.0%       4.00 =C2=B1173%      +0.0%       0.2=
5 =C2=B1173%  softirqs.CPU26.TASKLET
    779.75 =C2=B1 67%     +20.6%     940.00 =C2=B1 71%    +210.9%       242=
4 =C2=B1110%  softirqs.CPU26.TIMER
      0.00       +1.7e+103%      16.50 =C2=B1107% +1.3e+103%      13.50 =C2=
=B1106%  softirqs.CPU27.BLOCK
      1248 =C2=B1 66%     -59.6%     503.75 =C2=B1 90%     -90.6%     117.2=
5 =C2=B1 32%  softirqs.CPU27.NET_RX
      1.25 =C2=B1 34%     +20.0%       1.50 =C2=B1 33%      +0.0%       1.2=
5 =C2=B1 34%  softirqs.CPU27.NET_TX
     16242 =C2=B1 25%     +15.9%      18820 =C2=B1 11%      -5.5%      1535=
3 =C2=B1 23%  softirqs.CPU27.RCU
     13927 =C2=B1120%     -67.0%       4593 =C2=B1  4%      -3.1%      1349=
1 =C2=B1123%  softirqs.CPU27.SCHED
      0.00          -100.0%       0.00       +6.3e+102%       6.25 =C2=B113=
8%  softirqs.CPU27.TASKLET
    301.00 =C2=B1156%     -61.7%     115.25 =C2=B1 54%     -67.3%      98.5=
0 =C2=B1 80%  softirqs.CPU27.TIMER
     15.75 =C2=B1 99%     -74.6%       4.00 =C2=B1173%     -74.6%       4.0=
0 =C2=B1173%  softirqs.CPU28.BLOCK
      1411 =C2=B1158%     +68.3%       2375 =C2=B1135%     -93.1%      98.0=
0 =C2=B1  8%  softirqs.CPU28.NET_RX
      1.50 =C2=B1 33%      +0.0%       1.50 =C2=B1 74%      +0.0%       1.5=
0 =C2=B1 33%  softirqs.CPU28.NET_TX
     12117 =C2=B1 12%      +5.6%      12790 =C2=B1 33%      +1.5%      1230=
2 =C2=B1 22%  softirqs.CPU28.RCU
     30678 =C2=B1 41%     -27.2%      22334 =C2=B1 83%      +3.3%      3168=
5 =C2=B1 49%  softirqs.CPU28.SCHED
     11.00 =C2=B1 98%     -86.4%       1.50 =C2=B1173%     -97.7%       0.2=
5 =C2=B1173%  softirqs.CPU28.TASKLET
      1518 =C2=B1 32%     -66.5%     509.00 =C2=B1124%     -76.5%     357.2=
5 =C2=B1 81%  softirqs.CPU28.TIMER
      0.00       +1.8e+103%      18.00 =C2=B1127% +5.5e+102%       5.50 =C2=
=B1173%  softirqs.CPU29.BLOCK
      3618 =C2=B1 98%     +22.9%       4447 =C2=B1100%     -59.0%       148=
1 =C2=B1 93%  softirqs.CPU29.NET_RX
      1.50 =C2=B1 57%     -16.7%       1.25 =C2=B1 66%     -16.7%       1.2=
5 =C2=B1 34%  softirqs.CPU29.NET_TX
     14512 =C2=B1 25%      -3.1%      14064 =C2=B1 22%     +11.7%      1620=
4 =C2=B1 20%  softirqs.CPU29.RCU
     21598 =C2=B1 83%     -36.1%      13811 =C2=B1115%     -36.6%      1369=
5 =C2=B1116%  softirqs.CPU29.SCHED
      0.25 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU29.TASKLET
    799.50 =C2=B1 89%     -65.4%     277.00 =C2=B1146%     -50.3%     397.0=
0 =C2=B1156%  softirqs.CPU29.TIMER
      6.50 =C2=B1173%      +0.0%       6.50 =C2=B1173%      +3.8%       6.7=
5 =C2=B1164%  softirqs.CPU3.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU3.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU3.NET_TX
     12734 =C2=B1 25%     -17.4%      10522 =C2=B1  9%      -1.2%      1257=
8 =C2=B1 27%  softirqs.CPU3.RCU
     31188 =C2=B1 49%     +22.6%      38228 =C2=B1  9%      -7.2%      2893=
0 =C2=B1 51%  softirqs.CPU3.SCHED
     10.00 =C2=B1138%     -80.0%       2.00           -85.0%       1.50 =C2=
=B1 57%  softirqs.CPU3.TASKLET
    193.50 =C2=B1 39%    +358.4%     887.00 =C2=B1 62%    +381.7%     932.0=
0 =C2=B1 80%  softirqs.CPU3.TIMER
      2.00 =C2=B1173%     -87.5%       0.25 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU30.BLOCK
      1152 =C2=B1 91%    +130.8%       2660 =C2=B1156%    +301.4%       462=
6 =C2=B1169%  softirqs.CPU30.NET_RX
      2.00 =C2=B1 35%     -37.5%       1.25 =C2=B1 34%     -50.0%       1.0=
0 =C2=B1 70%  softirqs.CPU30.NET_TX
     12397 =C2=B1 30%      +0.9%      12515 =C2=B1 34%     -20.1%       990=
7 =C2=B1 10%  softirqs.CPU30.RCU
     30522 =C2=B1 49%      +5.3%      32152 =C2=B1 50%     +31.8%      4022=
5 =C2=B1  2%  softirqs.CPU30.SCHED
      0.25 =C2=B1173%    +300.0%       1.00 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU30.TASKLET
      4575 =C2=B1111%     -78.2%     998.75 =C2=B1115%     -83.1%     774.0=
0 =C2=B1 34%  softirqs.CPU30.TIMER
     10.00 =C2=B1103%    -100.0%       0.00            -7.5%       9.25 =C2=
=B1167%  softirqs.CPU31.BLOCK
     96.75 =C2=B1  5%   +1466.7%       1515 =C2=B1161%    +381.9%     466.2=
5 =C2=B1 82%  softirqs.CPU31.NET_RX
      0.75 =C2=B1 57%    +100.0%       1.50 =C2=B1 33%    +133.3%       1.7=
5 =C2=B1 47%  softirqs.CPU31.NET_TX
     13605 =C2=B1 25%      -0.5%      13531 =C2=B1 32%     +14.6%      1558=
7 =C2=B1 23%  softirqs.CPU31.RCU
     23740 =C2=B1 81%      -5.7%      22393 =C2=B1 82%     -45.5%      1293=
0 =C2=B1116%  softirqs.CPU31.SCHED
      0.00       +1.8e+102%       1.75 =C2=B1173%    -100.0%       0.00    =
    softirqs.CPU31.TASKLET
    853.50 =C2=B1 97%    +106.2%       1759 =C2=B1116%     -37.9%     529.7=
5 =C2=B1143%  softirqs.CPU31.TIMER
      0.00       +2.5e+101%       0.25 =C2=B1173% +4.2e+102%       4.25 =C2=
=B1159%  softirqs.CPU32.BLOCK
      9242 =C2=B1136%     -91.0%     836.25 =C2=B1151%     -96.0%     367.0=
0 =C2=B1 84%  softirqs.CPU32.NET_RX
      1.25 =C2=B1 34%    +560.0%       8.25 =C2=B1152%     +60.0%       2.0=
0 =C2=B1 35%  softirqs.CPU32.NET_TX
     11900 =C2=B1 23%     -13.1%      10341 =C2=B1  9%     -17.9%       977=
4 =C2=B1  7%  softirqs.CPU32.RCU
     31651 =C2=B1 49%      +1.7%      32186 =C2=B1 49%     +16.3%      3682=
6 =C2=B1 15%  softirqs.CPU32.SCHED
      0.25 =C2=B1173%    -100.0%       0.00          +700.0%       2.00 =C2=
=B1173%  softirqs.CPU32.TASKLET
    436.50 =C2=B1 68%     +61.6%     705.50 =C2=B1 43%    +128.1%     995.5=
0 =C2=B1101%  softirqs.CPU32.TIMER
     10.75 =C2=B1167%    -100.0%       0.00           -95.3%       0.50 =C2=
=B1100%  softirqs.CPU33.BLOCK
    164.25 =C2=B1 54%    +434.1%     877.25 =C2=B1125%     +56.8%     257.5=
0 =C2=B1 96%  softirqs.CPU33.NET_RX
      1.00 =C2=B1 70%   +1550.0%      16.50 =C2=B1 85%     +25.0%       1.2=
5 =C2=B1 87%  softirqs.CPU33.NET_TX
     16312 =C2=B1 26%      +0.2%      16346 =C2=B1  5%     -10.2%      1464=
4 =C2=B1 19%  softirqs.CPU33.RCU
     14243 =C2=B1118%     -30.1%       9949 =C2=B1 88%      -5.9%      1339=
5 =C2=B1118%  softirqs.CPU33.SCHED
      0.00       +2.5e+101%       0.25 =C2=B1173%   +5e+102%       5.00 =C2=
=B1122%  softirqs.CPU33.TASKLET
    464.75 =C2=B1147%     +63.2%     758.50 =C2=B1110%      +5.6%     490.7=
5 =C2=B1134%  softirqs.CPU33.TIMER
      0.00       +2.5e+101%       0.25 =C2=B1173%    -100.0%       0.00    =
    softirqs.CPU34.BLOCK
      0.50 =C2=B1173%     -50.0%       0.25 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU34.NET_TX
     17840 =C2=B1 30%     -29.9%      12514 =C2=B1 32%     -39.7%      1074=
9 =C2=B1 15%  softirqs.CPU34.RCU
     12922 =C2=B1117%    +144.2%      31563 =C2=B1 51%    +102.4%      2615=
0 =C2=B1 61%  softirqs.CPU34.SCHED
      3.00 =C2=B1173%     -91.7%       0.25 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU34.TASKLET
    698.50 =C2=B1 83%     +22.9%     858.75 =C2=B1 50%    +571.9%       469=
3 =C2=B1159%  softirqs.CPU34.TIMER
      0.00         +9e+102%       9.00 =C2=B1173% +2.5e+101%       0.25 =C2=
=B1173%  softirqs.CPU35.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU35.NET_RX
      0.00          -100.0%       0.00         +7e+102%       7.00 =C2=B117=
3%  softirqs.CPU35.NET_TX
     13521 =C2=B1 26%     +19.4%      16139 =C2=B1 19%      +8.6%      1468=
6 =C2=B1 21%  softirqs.CPU35.RCU
     29371 =C2=B1 53%     -34.8%      19155 =C2=B1 80%     -55.3%      1312=
0 =C2=B1114%  softirqs.CPU35.SCHED
      2.25 =C2=B1 19%     +11.1%       2.50 =C2=B1 20%     +44.4%       3.2=
5 =C2=B1 50%  softirqs.CPU35.TASKLET
    874.75 =C2=B1101%     -30.8%     605.00 =C2=B1 99%     -75.3%     216.5=
0 =C2=B1152%  softirqs.CPU35.TIMER
      0.00       +1.2e+103%      11.50 =C2=B1173%   +1e+103%      10.00 =C2=
=B1103%  softirqs.CPU36.BLOCK
      0.00          -100.0%       0.00       +2.5e+101%       0.25 =C2=B117=
3%  softirqs.CPU36.NET_TX
     15561 =C2=B1 32%      -7.7%      14357 =C2=B1 25%     -27.8%      1124=
0 =C2=B1 10%  softirqs.CPU36.RCU
     16849 =C2=B1 93%     +33.6%      22508 =C2=B1 81%     +88.0%      3167=
2 =C2=B1 50%  softirqs.CPU36.SCHED
      6.25 =C2=B1173%    -100.0%       0.00           -16.0%       5.25 =C2=
=B1173%  softirqs.CPU36.TASKLET
    870.50 =C2=B1126%     -65.6%     299.25 =C2=B1120%     +61.6%       140=
7 =C2=B1132%  softirqs.CPU36.TIMER
      7.00 =C2=B1173%     -82.1%       1.25 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU37.BLOCK
     15273 =C2=B1 21%      +5.0%      16043 =C2=B1 13%      -1.7%      1501=
5 =C2=B1 32%  softirqs.CPU37.RCU
     16449 =C2=B1 99%     +38.9%      22850 =C2=B1 80%     +25.4%      2063=
0 =C2=B1 83%  softirqs.CPU37.SCHED
    453.00 =C2=B1 92%     +16.2%     526.25 =C2=B1116%      -9.2%     411.2=
5 =C2=B1142%  softirqs.CPU37.TIMER
      0.00         +3e+103%      30.25 =C2=B1132%    -100.0%       0.00    =
    softirqs.CPU38.BLOCK
      0.25 =C2=B1173%   +2700.0%       7.00 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU38.NET_TX
     19258 =C2=B1 10%     -22.4%      14941 =C2=B1 31%     -35.1%      1250=
6 =C2=B1 14%  softirqs.CPU38.RCU
      8721 =C2=B1 84%    +157.6%      22464 =C2=B1 78%    +310.3%      3578=
4 =C2=B1 17%  softirqs.CPU38.SCHED
      0.25 =C2=B1173%    -100.0%       0.00          +800.0%       2.25 =C2=
=B1173%  softirqs.CPU38.TASKLET
    174.50 =C2=B1145%    +431.7%     927.75 =C2=B1 95%    +414.0%     897.0=
0 =C2=B1 72%  softirqs.CPU38.TIMER
      0.50 =C2=B1173%   +2200.0%      11.50 =C2=B1173%   +2300.0%      12.0=
0 =C2=B1158%  softirqs.CPU39.BLOCK
     11520 =C2=B1 14%     +23.8%      14259 =C2=B1 18%     +48.6%      1712=
2 =C2=B1 25%  softirqs.CPU39.RCU
     39392 =C2=B1  7%     -43.3%      22330 =C2=B1 82%     -66.4%      1323=
8 =C2=B1121%  softirqs.CPU39.SCHED
      0.25 =C2=B1173%    +900.0%       2.50 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU39.TASKLET
      2005 =C2=B1142%     -89.6%     208.00 =C2=B1119%     -88.0%     239.7=
5 =C2=B1144%  softirqs.CPU39.TIMER
      4.25 =C2=B1159%     -17.6%       3.50 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU4.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU4.NET_RX
     18470 =C2=B1  6%     -23.5%      14128 =C2=B1 29%      -7.8%      1702=
5 =C2=B1 20%  softirqs.CPU4.RCU
      7406 =C2=B1 80%    +215.6%      23377 =C2=B1 80%     +63.7%      1212=
3 =C2=B1129%  softirqs.CPU4.SCHED
      4.50 =C2=B1 96%     -66.7%       1.50 =C2=B1 57%     -55.6%       2.0=
0        softirqs.CPU4.TASKLET
    450.75 =C2=B1103%      +8.6%     489.50 =C2=B1115%     -71.8%     127.2=
5 =C2=B1 88%  softirqs.CPU4.TIMER
     14.25 =C2=B1100%     -19.3%      11.50 =C2=B1173%     -96.5%       0.5=
0 =C2=B1173%  softirqs.CPU40.BLOCK
      0.00         +5e+101%       0.50 =C2=B1173%    -100.0%       0.00    =
    softirqs.CPU40.NET_TX
     19452 =C2=B1  6%     -28.5%      13915 =C2=B1 17%     -36.5%      1234=
5 =C2=B1 22%  softirqs.CPU40.RCU
      4314 =C2=B1  4%    +421.7%      22510 =C2=B1 80%    +415.8%      2225=
3 =C2=B1 83%  softirqs.CPU40.SCHED
      0.00       +1.2e+103%      11.50 =C2=B1100%   +5e+101%       0.50 =C2=
=B1100%  softirqs.CPU40.TASKLET
     85.75 =C2=B1 85%    +234.7%     287.00 =C2=B1 97%    +311.4%     352.7=
5 =C2=B1 91%  softirqs.CPU40.TIMER
      0.00          -100.0%       0.00       +1.2e+103%      12.00 =C2=B117=
3%  softirqs.CPU41.BLOCK
     10744 =C2=B1  6%      +7.8%      11578 =C2=B1 25%     +48.8%      1598=
5 =C2=B1 22%  softirqs.CPU41.RCU
     41796 =C2=B1  2%     -25.1%      31312 =C2=B1 49%     -68.4%      1320=
5 =C2=B1122%  softirqs.CPU41.SCHED
      0.50 =C2=B1173%   +1650.0%       8.75 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU41.TASKLET
      1374 =C2=B1139%     +54.2%       2119 =C2=B1144%     -89.5%     144.2=
5 =C2=B1142%  softirqs.CPU41.TIMER
      0.50 =C2=B1173%      +0.0%       0.50 =C2=B1173%   +8850.0%      44.7=
5 =C2=B1173%  softirqs.CPU42.BLOCK
     17680 =C2=B1 23%     -13.0%      15373 =C2=B1 18%     -17.2%      1464=
2 =C2=B1 28%  softirqs.CPU42.RCU
     13698 =C2=B1118%      -3.3%      13244 =C2=B1116%    +115.7%      2954=
1 =C2=B1 51%  softirqs.CPU42.SCHED
      0.50 =C2=B1173%    +250.0%       1.75 =C2=B1142%     -50.0%       0.2=
5 =C2=B1173%  softirqs.CPU42.TASKLET
    149.50 =C2=B1 93%    +163.5%     394.00 =C2=B1140%    +619.4%       107=
5 =C2=B1116%  softirqs.CPU42.TIMER
     28.00 =C2=B1100%     -98.2%       0.50 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU43.BLOCK
     10851 =C2=B1  6%      +5.2%      11412 =C2=B1 21%     +41.7%      1537=
5 =C2=B1 22%  softirqs.CPU43.RCU
     41192 =C2=B1  3%     -23.8%      31387 =C2=B1 48%     -67.1%      1353=
7 =C2=B1117%  softirqs.CPU43.SCHED
      1.00 =C2=B1173%     -75.0%       0.25 =C2=B1173%     -25.0%       0.7=
5 =C2=B1110%  softirqs.CPU43.TASKLET
    395.75 =C2=B1115%    +102.2%     800.25 =C2=B1 80%     -54.9%     178.5=
0 =C2=B1148%  softirqs.CPU43.TIMER
      0.50 =C2=B1173%    -100.0%       0.00         +1400.0%       7.50 =C2=
=B1158%  softirqs.CPU44.BLOCK
     20418 =C2=B1  9%     -23.0%      15721 =C2=B1 22%     -33.6%      1355=
2 =C2=B1 21%  softirqs.CPU44.RCU
      4067 =C2=B1 14%    +257.3%      14533 =C2=B1 99%    +528.1%      2554=
6 =C2=B1 59%  softirqs.CPU44.SCHED
      6.50 =C2=B1164%    -100.0%       0.00           -42.3%       3.75 =C2=
=B1131%  softirqs.CPU44.TASKLET
     53.50 =C2=B1 97%    +806.1%     484.75 =C2=B1120%   +1304.7%     751.5=
0 =C2=B1 97%  softirqs.CPU44.TIMER
     58.25 =C2=B1131%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU45.BLOCK
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU45.NET_TX
     13306 =C2=B1 36%     -11.2%      11817 =C2=B1 23%      +0.4%      1335=
9 =C2=B1 20%  softirqs.CPU45.RCU
     31880 =C2=B1 48%      -2.2%      31177 =C2=B1 49%      -8.3%      2922=
4 =C2=B1 52%  softirqs.CPU45.SCHED
      3.00 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU45.TASKLET
    689.00 =C2=B1 62%      -6.6%     643.25 =C2=B1 66%    +118.3%       150=
4 =C2=B1 84%  softirqs.CPU45.TIMER
      0.00       +1.1e+103%      10.75 =C2=B1173%    -100.0%       0.00    =
    softirqs.CPU46.BLOCK
     19591 =C2=B1  7%     -21.7%      15339 =C2=B1 25%     -37.7%      1220=
2 =C2=B1 26%  softirqs.CPU46.RCU
      4230 =C2=B1  2%    +182.5%      11951 =C2=B1135%    +642.2%      3140=
0 =C2=B1 50%  softirqs.CPU46.SCHED
      0.75 =C2=B1173%     -66.7%       0.25 =C2=B1173%    +633.3%       5.5=
0 =C2=B1173%  softirqs.CPU46.TASKLET
     23.25 =C2=B1 21%   +3022.6%     726.00 =C2=B1163%   +8469.9%       199=
2 =C2=B1 91%  softirqs.CPU46.TIMER
      0.00       +7.7e+103%      76.75 =C2=B1 71% +7.5e+102%       7.50 =C2=
=B1158%  softirqs.CPU47.BLOCK
     11180 =C2=B1 13%      +1.4%      11341 =C2=B1  8%      +8.5%      1212=
7 =C2=B1  9%  softirqs.CPU47.RCU
     37249 =C2=B1 13%      -1.5%      36683 =C2=B1 16%      -8.9%      3393=
2 =C2=B1 17%  softirqs.CPU47.SCHED
      0.00          -100.0%       0.00       +3.5e+102%       3.50 =C2=B115=
7%  softirqs.CPU47.TASKLET
      2282 =C2=B1107%     -74.1%     591.50 =C2=B1 50%     -39.1%       139=
0 =C2=B1 85%  softirqs.CPU47.TIMER
     10.75 =C2=B1167%    -100.0%       0.00           +72.1%      18.50 =C2=
=B1133%  softirqs.CPU5.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU5.NET_RX
      0.00          -100.0%       0.00       +2.5e+101%       0.25 =C2=B117=
3%  softirqs.CPU5.NET_TX
     14707 =C2=B1 30%     -17.6%      12117 =C2=B1 35%     -12.8%      1282=
8 =C2=B1 26%  softirqs.CPU5.RCU
     23434 =C2=B1 67%     +33.9%      31386 =C2=B1 52%     +33.9%      3137=
5 =C2=B1 50%  softirqs.CPU5.SCHED
      2.00            +0.0%       2.00           -25.0%       1.50 =C2=B1 5=
7%  softirqs.CPU5.TASKLET
    187.50 =C2=B1 71%   +1639.9%       3262 =C2=B1 93%     +81.1%     339.5=
0 =C2=B1 84%  softirqs.CPU5.TIMER
      0.00          -100.0%       0.00       +6.5e+102%       6.50 =C2=B117=
3%  softirqs.CPU6.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU6.NET_RX
      0.25 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU6.NET_TX
     16975 =C2=B1 24%      -5.9%      15965 =C2=B1 22%      +5.4%      1789=
0 =C2=B1  8%  softirqs.CPU6.RCU
     15049 =C2=B1105%      -8.9%      13717 =C2=B1113%     -73.0%       405=
8 =C2=B1  7%  softirqs.CPU6.SCHED
      2.00          +275.0%       7.50 =C2=B1127%     +25.0%       2.50 =C2=
=B1 34%  softirqs.CPU6.TASKLET
    208.75 =C2=B1102%    +253.3%     737.50 =C2=B1111%     +43.5%     299.5=
0 =C2=B1104%  softirqs.CPU6.TIMER
     43.50 =C2=B1173%     -79.3%       9.00 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU7.BLOCK
     14964 =C2=B1 34%      -7.2%      13880 =C2=B1 27%     -18.5%      1219=
9 =C2=B1 27%  softirqs.CPU7.RCU
     21843 =C2=B1 80%      +3.6%      22628 =C2=B1 80%     +44.3%      3153=
0 =C2=B1 49%  softirqs.CPU7.SCHED
    185.00 =C2=B1171%     -98.2%       3.25 =C2=B1 50%     -98.9%       2.0=
0        softirqs.CPU7.TASKLET
      1793 =C2=B1161%     -10.8%       1600 =C2=B1127%     -71.7%     507.7=
5 =C2=B1 85%  softirqs.CPU7.TIMER
    226.75 =C2=B1 62%     +20.0%     272.00 =C2=B1 23%     +34.1%     304.0=
0 =C2=B1 21%  softirqs.CPU8.BLOCK
     16497 =C2=B1 25%      -5.8%      15535 =C2=B1 28%      +4.0%      1716=
2 =C2=B1  8%  softirqs.CPU8.RCU
     13789 =C2=B1123%      +1.5%      14001 =C2=B1117%     -49.0%       703=
1 =C2=B1 90%  softirqs.CPU8.SCHED
    597.75 =C2=B1 55%     +30.7%     781.25           +31.3%     784.75    =
    softirqs.CPU8.TASKLET
    308.50 =C2=B1143%    +878.0%       3017 =C2=B1162%     -45.8%     167.2=
5 =C2=B1146%  softirqs.CPU8.TIMER
      0.00       +6.7e+102%       6.75 =C2=B1164%    -100.0%       0.00    =
    softirqs.CPU9.BLOCK
      0.25 =C2=B1173%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU9.HI
     13678 =C2=B1 27%      -5.9%      12876 =C2=B1 40%      -9.5%      1237=
7 =C2=B1 28%  softirqs.CPU9.RCU
     31545 =C2=B1 49%     +14.6%      36152 =C2=B1 25%      +1.2%      3191=
9 =C2=B1 50%  softirqs.CPU9.SCHED
     83.00            -0.9%      82.25            +0.9%      83.75 =C2=B1  =
2%  softirqs.CPU9.TASKLET
    439.50 =C2=B1 46%    +109.2%     919.25 =C2=B1 52%     -32.8%     295.5=
0 =C2=B1 49%  softirqs.CPU9.TIMER
      2.50 =C2=B1 20%     -20.0%       2.00           -20.0%       2.00    =
    softirqs.HI
     18503 =C2=B1 90%      +4.7%      19377 =C2=B1 42%     -56.8%       798=
4 =C2=B1 88%  softirqs.NET_RX
     43.25 =C2=B1  3%      -0.6%      43.00 =C2=B1  5%      +0.0%      43.2=
5 =C2=B1  4%  softirqs.NET_TX
    711396 =C2=B1  5%      -5.7%     670504 =C2=B1  4%      -4.9%     67686=
0 =C2=B1  6%  softirqs.RCU
   1074239 =C2=B1  4%      -0.4%    1070231            -0.4%    1070269    =
    softirqs.SCHED
      1005 =C2=B1  2%      -0.1%       1004            +0.3%       1008    =
    softirqs.TASKLET
     39167 =C2=B1  7%      -3.1%      37944 =C2=B1  7%      -7.8%      3610=
1 =C2=B1  5%  softirqs.TIMER
    133576            +0.0%     133629            +0.0%     133592        s=
labinfo.Acpi-Operand.active_objs
      2386            +0.0%       2386            +0.0%       2386        s=
labinfo.Acpi-Operand.active_slabs
    133624            +0.0%     133642            -0.0%     133619        s=
labinfo.Acpi-Operand.num_objs
      2386            +0.0%       2386            +0.0%       2386        s=
labinfo.Acpi-Operand.num_slabs
      1186 =C2=B1 10%      -3.1%       1149 =C2=B1 13%      -1.5%       116=
8 =C2=B1  9%  slabinfo.Acpi-Parse.active_objs
     16.25 =C2=B1 10%      -3.1%      15.75 =C2=B1 13%      -1.5%      16.0=
0 =C2=B1  9%  slabinfo.Acpi-Parse.active_slabs
      1186 =C2=B1 10%      -3.1%       1149 =C2=B1 13%      -1.5%       116=
8 =C2=B1  9%  slabinfo.Acpi-Parse.num_objs
     16.25 =C2=B1 10%      -3.1%      15.75 =C2=B1 13%      -1.5%      16.0=
0 =C2=B1  9%  slabinfo.Acpi-Parse.num_slabs
      2498            -0.0%       2497            -0.0%       2497        s=
labinfo.Acpi-State.active_objs
     48.50            -1.0%      48.00            -0.5%      48.25        s=
labinfo.Acpi-State.active_slabs
      2498            -0.0%       2497            -0.0%       2497        s=
labinfo.Acpi-State.num_objs
     48.50            -1.0%      48.00            -0.5%      48.25        s=
labinfo.Acpi-State.num_slabs
      1227 =C2=B1  6%      +3.4%       1269 =C2=B1  8%      +8.0%       132=
5 =C2=B1  7%  slabinfo.PING.active_objs
     38.00 =C2=B1  6%      +3.3%      39.25 =C2=B1  7%      +7.9%      41.0=
0 =C2=B1  7%  slabinfo.PING.active_slabs
      1227 =C2=B1  6%      +3.4%       1269 =C2=B1  8%      +8.0%       132=
5 =C2=B1  7%  slabinfo.PING.num_objs
     38.00 =C2=B1  6%      +3.3%      39.25 =C2=B1  7%      +7.9%      41.0=
0 =C2=B1  7%  slabinfo.PING.num_slabs
    352.00            +0.0%     352.00            +0.0%     352.00        s=
labinfo.RAW.active_objs
     11.00            +0.0%      11.00            +0.0%      11.00        s=
labinfo.RAW.active_slabs
    352.00            +0.0%     352.00            +0.0%     352.00        s=
labinfo.RAW.num_objs
     11.00            +0.0%      11.00            +0.0%      11.00        s=
labinfo.RAW.num_slabs
    182.00            +0.0%     182.00            +0.0%     182.00        s=
labinfo.RAWv6.active_objs
      7.00            +0.0%       7.00            +0.0%       7.00        s=
labinfo.RAWv6.active_slabs
    182.00            +0.0%     182.00            +0.0%     182.00        s=
labinfo.RAWv6.num_objs
      7.00            +0.0%       7.00            +0.0%       7.00        s=
labinfo.RAWv6.num_slabs
     42.00            -8.3%      38.50 =C2=B1 15%      +0.0%      42.00    =
    slabinfo.TCP.active_objs
      3.00            -8.3%       2.75 =C2=B1 15%      +0.0%       3.00    =
    slabinfo.TCP.active_slabs
     42.00            -8.3%      38.50 =C2=B1 15%      +0.0%      42.00    =
    slabinfo.TCP.num_objs
      3.00            -8.3%       2.75 =C2=B1 15%      +0.0%       3.00    =
    slabinfo.TCP.num_slabs
     22.75 =C2=B1 24%     +14.3%      26.00           +14.3%      26.00    =
    slabinfo.TCPv6.active_objs
      1.75 =C2=B1 24%     +14.3%       2.00           +14.3%       2.00    =
    slabinfo.TCPv6.active_slabs
     22.75 =C2=B1 24%     +14.3%      26.00           +14.3%      26.00    =
    slabinfo.TCPv6.num_objs
      1.75 =C2=B1 24%     +14.3%       2.00           +14.3%       2.00    =
    slabinfo.TCPv6.num_slabs
    126.75 =C2=B1 13%      -5.3%     120.00 =C2=B1 19%      +3.9%     131.7=
5 =C2=B1  2%  slabinfo.UDPv6.active_objs
      4.75 =C2=B1 17%      -5.3%       4.50 =C2=B1 24%      +5.3%       5.0=
0        slabinfo.UDPv6.active_slabs
    126.75 =C2=B1 13%      -5.3%     120.00 =C2=B1 19%      +3.9%     131.7=
5 =C2=B1  2%  slabinfo.UDPv6.num_objs
      4.75 =C2=B1 17%      -5.3%       4.50 =C2=B1 24%      +5.3%       5.0=
0        slabinfo.UDPv6.num_slabs
     16501 =C2=B1  2%      +1.3%      16720 =C2=B1  3%      +2.4%      1689=
1 =C2=B1  2%  slabinfo.anon_vma.active_objs
    357.75 =C2=B1  2%      +1.3%     362.50 =C2=B1  3%      +2.4%     366.2=
5 =C2=B1  2%  slabinfo.anon_vma.active_slabs
     16501 =C2=B1  2%      +1.3%      16720 =C2=B1  3%      +2.4%      1689=
1 =C2=B1  2%  slabinfo.anon_vma.num_objs
    357.75 =C2=B1  2%      +1.3%     362.50 =C2=B1  3%      +2.4%     366.2=
5 =C2=B1  2%  slabinfo.anon_vma.num_slabs
     37002 =C2=B1  3%      +0.0%      37002 =C2=B1  7%      +4.1%      3852=
8 =C2=B1  4%  slabinfo.anon_vma_chain.active_objs
    585.00 =C2=B1  3%      -0.8%     580.25 =C2=B1  7%      +2.8%     601.2=
5 =C2=B1  4%  slabinfo.anon_vma_chain.active_slabs
     37474 =C2=B1  3%      -0.8%      37175 =C2=B1  7%      +2.8%      3852=
8 =C2=B1  4%  slabinfo.anon_vma_chain.num_objs
    585.00 =C2=B1  3%      -0.8%     580.25 =C2=B1  7%      +2.8%     601.2=
5 =C2=B1  4%  slabinfo.anon_vma_chain.num_slabs
    409.50 =C2=B1  8%      -9.5%     370.50 =C2=B1 11%      -2.4%     399.7=
5 =C2=B1 14%  slabinfo.bdev_cache.active_objs
     10.50 =C2=B1  8%      -9.5%       9.50 =C2=B1 11%      -2.4%      10.2=
5 =C2=B1 14%  slabinfo.bdev_cache.active_slabs
    409.50 =C2=B1  8%      -9.5%     370.50 =C2=B1 11%      -2.4%     399.7=
5 =C2=B1 14%  slabinfo.bdev_cache.num_objs
     10.50 =C2=B1  8%      -9.5%       9.50 =C2=B1 11%      -2.4%      10.2=
5 =C2=B1 14%  slabinfo.bdev_cache.num_slabs
    108.00 =C2=B1 19%      -3.7%     104.00 =C2=B1  7%      -3.7%     104.0=
0 =C2=B1  7%  slabinfo.biovec-128.active_objs
      6.75 =C2=B1 19%      -3.7%       6.50 =C2=B1  7%      -3.7%       6.5=
0 =C2=B1  7%  slabinfo.biovec-128.active_slabs
    108.00 =C2=B1 19%      -3.7%     104.00 =C2=B1  7%      -3.7%     104.0=
0 =C2=B1  7%  slabinfo.biovec-128.num_objs
      6.75 =C2=B1 19%      -3.7%       6.50 =C2=B1  7%      -3.7%       6.5=
0 =C2=B1  7%  slabinfo.biovec-128.num_slabs
    280.00 =C2=B1  4%      -5.7%     264.00 =C2=B1 10%      +2.9%     288.0=
0 =C2=B1 17%  slabinfo.biovec-64.active_objs
      8.75 =C2=B1  4%      -5.7%       8.25 =C2=B1 10%      +2.9%       9.0=
0 =C2=B1 17%  slabinfo.biovec-64.active_slabs
    280.00 =C2=B1  4%      -5.7%     264.00 =C2=B1 10%      +2.9%     288.0=
0 =C2=B1 17%  slabinfo.biovec-64.num_objs
      8.75 =C2=B1  4%      -5.7%       8.25 =C2=B1 10%      +2.9%       9.0=
0 =C2=B1 17%  slabinfo.biovec-64.num_slabs
     84.00 =C2=B1  4%      +9.5%      92.00 =C2=B1  4%      -9.5%      76.0=
0 =C2=B1  5%  slabinfo.biovec-max.active_objs
     10.50 =C2=B1  4%      +9.5%      11.50 =C2=B1  4%      -9.5%       9.5=
0 =C2=B1  5%  slabinfo.biovec-max.active_slabs
     84.00 =C2=B1  4%      +9.5%      92.00 =C2=B1  4%      -9.5%      76.0=
0 =C2=B1  5%  slabinfo.biovec-max.num_objs
     10.50 =C2=B1  4%      +9.5%      11.50 =C2=B1  4%      -9.5%       9.5=
0 =C2=B1  5%  slabinfo.biovec-max.num_slabs
    477.75 =C2=B1  3%     -12.2%     419.25 =C2=B1  4%      -4.1%     458.2=
5 =C2=B1 11%  slabinfo.blkdev_ioc.active_objs
     12.25 =C2=B1  3%     -12.2%      10.75 =C2=B1  4%      -4.1%      11.7=
5 =C2=B1 11%  slabinfo.blkdev_ioc.active_slabs
    477.75 =C2=B1  3%     -12.2%     419.25 =C2=B1  4%      -4.1%     458.2=
5 =C2=B1 11%  slabinfo.blkdev_ioc.num_objs
     12.25 =C2=B1  3%     -12.2%      10.75 =C2=B1  4%      -4.1%      11.7=
5 =C2=B1 11%  slabinfo.blkdev_ioc.num_slabs
    136.50 =C2=B1 14%     +14.3%     156.00           -14.3%     117.00    =
    slabinfo.buffer_head.active_objs
      3.50 =C2=B1 14%     +14.3%       4.00           -14.3%       3.00    =
    slabinfo.buffer_head.active_slabs
    136.50 =C2=B1 14%     +14.3%     156.00           -14.3%     117.00    =
    slabinfo.buffer_head.num_objs
      3.50 =C2=B1 14%     +14.3%       4.00           -14.3%       3.00    =
    slabinfo.buffer_head.num_slabs
      2908 =C2=B1  2%      -1.4%       2866            +1.1%       2941 =C2=
=B1  2%  slabinfo.cred_jar.active_objs
     68.75 =C2=B1  2%      -1.1%      68.00            +1.5%      69.75 =C2=
=B1  2%  slabinfo.cred_jar.active_slabs
      2908 =C2=B1  2%      -1.4%       2866            +1.1%       2941 =C2=
=B1  2%  slabinfo.cred_jar.num_objs
     68.75 =C2=B1  2%      -1.1%      68.00            +1.5%      69.75 =C2=
=B1  2%  slabinfo.cred_jar.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.num_slabs
     93943            +0.7%      94600            -0.2%      93761        s=
labinfo.dentry.active_objs
      2258            +0.7%       2274            +0.2%       2261        s=
labinfo.dentry.active_slabs
     94861            +0.7%      95554            +0.2%      95025        s=
labinfo.dentry.num_objs
      2258            +0.7%       2274            +0.2%       2261        s=
labinfo.dentry.num_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.active_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.num_slabs
      1341 =C2=B1 11%      +2.5%       1374 =C2=B1 13%     -17.2%       111=
0 =C2=B1  8%  slabinfo.dmaengine-unmap-16.active_objs
     31.50 =C2=B1 12%      +2.4%      32.25 =C2=B1 14%     -17.5%      26.0=
0 =C2=B1  8%  slabinfo.dmaengine-unmap-16.active_slabs
      1341 =C2=B1 11%      +2.5%       1374 =C2=B1 13%     -17.2%       111=
0 =C2=B1  8%  slabinfo.dmaengine-unmap-16.num_objs
     31.50 =C2=B1 12%      +2.4%      32.25 =C2=B1 14%     -17.5%      26.0=
0 =C2=B1  8%  slabinfo.dmaengine-unmap-16.num_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.active_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.num_slabs
      2590 =C2=B1  2%      +0.9%       2613 =C2=B1  2%      -5.8%       243=
9 =C2=B1  3%  slabinfo.eventpoll_pwq.active_objs
     46.25 =C2=B1  2%      +0.5%      46.50 =C2=B1  3%      -5.9%      43.5=
0 =C2=B1  4%  slabinfo.eventpoll_pwq.active_slabs
      2590 =C2=B1  2%      +0.9%       2613 =C2=B1  2%      -5.8%       243=
9 =C2=B1  3%  slabinfo.eventpoll_pwq.num_objs
     46.25 =C2=B1  2%      +0.5%      46.50 =C2=B1  3%      -5.9%      43.5=
0 =C2=B1  4%  slabinfo.eventpoll_pwq.num_slabs
    781.00 =C2=B1 13%      -4.3%     747.50 =C2=B1 10%      -2.2%     764.0=
0 =C2=B1 18%  slabinfo.file_lock_cache.active_objs
     21.00 =C2=B1 13%      -4.8%      20.00 =C2=B1 11%      -3.6%      20.2=
5 =C2=B1 19%  slabinfo.file_lock_cache.active_slabs
    781.00 =C2=B1 13%      -4.3%     747.50 =C2=B1 10%      -2.2%     764.0=
0 =C2=B1 18%  slabinfo.file_lock_cache.num_objs
     21.00 =C2=B1 13%      -4.8%      20.00 =C2=B1 11%      -3.6%      20.2=
5 =C2=B1 19%  slabinfo.file_lock_cache.num_slabs
      2379            +1.3%       2410            +1.4%       2412        s=
labinfo.files_cache.active_objs
     51.00            +2.0%      52.00            +1.5%      51.75        s=
labinfo.files_cache.active_slabs
      2379            +1.3%       2410            +1.4%       2412        s=
labinfo.files_cache.num_objs
     51.00            +2.0%      52.00            +1.5%      51.75        s=
labinfo.files_cache.num_slabs
     24562 =C2=B1  4%     +10.3%      27098 =C2=B1  2%      +6.5%      2615=
4        slabinfo.filp.active_objs
    395.25 =C2=B1  4%     +10.0%     434.75            +5.8%     418.00    =
    slabinfo.filp.active_slabs
     25333 =C2=B1  4%     +10.0%      27863            +5.7%      26778    =
    slabinfo.filp.num_objs
    395.25 =C2=B1  4%     +10.0%     434.75            +5.8%     418.00    =
    slabinfo.filp.num_slabs
      2199 =C2=B1  8%     +12.1%       2464 =C2=B1 15%      -6.9%       204=
8 =C2=B1  4%  slabinfo.fsnotify_mark_connector.active_objs
     17.00 =C2=B1  7%     +13.2%      19.25 =C2=B1 15%      -5.9%      16.0=
0 =C2=B1  4%  slabinfo.fsnotify_mark_connector.active_slabs
      2199 =C2=B1  8%     +12.1%       2464 =C2=B1 15%      -6.9%       204=
8 =C2=B1  4%  slabinfo.fsnotify_mark_connector.num_objs
     17.00 =C2=B1  7%     +13.2%      19.25 =C2=B1 15%      -5.9%      16.0=
0 =C2=B1  4%  slabinfo.fsnotify_mark_connector.num_slabs
     19125            +0.3%      19188            -0.9%      18955        s=
labinfo.ftrace_event_field.active_objs
    225.00            +0.3%     225.75            -0.9%     223.00        s=
labinfo.ftrace_event_field.active_slabs
     19125            +0.3%      19188            -0.9%      18955        s=
labinfo.ftrace_event_field.num_objs
    225.00            +0.3%     225.75            -0.9%     223.00        s=
labinfo.ftrace_event_field.num_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.hugetlbfs_inode_cache.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.hugetlbfs_inode_cache.active_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.hugetlbfs_inode_cache.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.hugetlbfs_inode_cache.num_slabs
     71073            +0.4%      71363            -0.6%      70626        s=
labinfo.inode_cache.active_objs
      1319            +0.4%       1324            -0.6%       1311        s=
labinfo.inode_cache.active_slabs
     71263            +0.4%      71561            -0.6%      70827        s=
labinfo.inode_cache.num_objs
      1319            +0.4%       1324            -0.6%       1311        s=
labinfo.inode_cache.num_slabs
     44.00            +0.0%      44.00            +0.0%      44.00        s=
labinfo.ip6-frags.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.ip6-frags.active_slabs
     44.00            +0.0%      44.00            +0.0%      44.00        s=
labinfo.ip6-frags.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.ip6-frags.num_slabs
     55863            +0.5%      56160            -0.6%      55527        s=
labinfo.kernfs_node_cache.active_objs
    872.75            +0.5%     877.50            -0.6%     867.50        s=
labinfo.kernfs_node_cache.active_slabs
     55863            +0.5%      56160            -0.6%      55527        s=
labinfo.kernfs_node_cache.num_objs
    872.75            +0.5%     877.50            -0.6%     867.50        s=
labinfo.kernfs_node_cache.num_slabs
    944.25 =C2=B1 13%      +9.2%       1031 =C2=B1 16%      +4.8%     989.2=
5 =C2=B1 13%  slabinfo.khugepaged_mm_slot.active_objs
     25.50 =C2=B1 13%     +10.8%      28.25 =C2=B1 16%      +4.9%      26.7=
5 =C2=B1 13%  slabinfo.khugepaged_mm_slot.active_slabs
    944.25 =C2=B1 13%      +9.2%       1031 =C2=B1 16%      +4.8%     989.2=
5 =C2=B1 13%  slabinfo.khugepaged_mm_slot.num_objs
     25.50 =C2=B1 13%     +10.8%      28.25 =C2=B1 16%      +4.9%      26.7=
5 =C2=B1 13%  slabinfo.khugepaged_mm_slot.num_slabs
      4144            +0.3%       4158            -0.1%       4140        s=
labinfo.kmalloc-128.active_objs
     67.00 =C2=B1  2%      -1.5%      66.00            -1.5%      66.00 =C2=
=B1  2%  slabinfo.kmalloc-128.active_slabs
      4319 =C2=B1  3%      -1.4%       4258            -1.1%       4270 =C2=
=B1  2%  slabinfo.kmalloc-128.num_objs
     67.00 =C2=B1  2%      -1.5%      66.00            -1.5%      66.00 =C2=
=B1  2%  slabinfo.kmalloc-128.num_slabs
     18368            +1.0%      18560            +1.0%      18560        s=
labinfo.kmalloc-16.active_objs
     71.75            +1.0%      72.50            +1.0%      72.50        s=
labinfo.kmalloc-16.active_slabs
     18368            +1.0%      18560            +1.0%      18560        s=
labinfo.kmalloc-16.num_objs
     71.75            +1.0%      72.50            +1.0%      72.50        s=
labinfo.kmalloc-16.num_slabs
      2889            +0.5%       2904            +1.2%       2922        s=
labinfo.kmalloc-192.active_objs
     69.25            +1.1%      70.00            +2.2%      70.75        s=
labinfo.kmalloc-192.active_slabs
      2908            +1.1%       2940            +3.2%       3002        s=
labinfo.kmalloc-192.num_objs
     69.25            +1.1%      70.00            +2.2%      70.75        s=
labinfo.kmalloc-192.num_slabs
      3645 =C2=B1  4%      -0.0%       3645 =C2=B1  4%      -4.0%       350=
1        slabinfo.kmalloc-1k.active_objs
    116.50 =C2=B1  3%      -0.4%     116.00 =C2=B1  4%      -4.5%     111.2=
5 =C2=B1  2%  slabinfo.kmalloc-1k.active_slabs
      3753 =C2=B1  3%      -0.3%       3743 =C2=B1  4%      -4.7%       357=
5 =C2=B1  2%  slabinfo.kmalloc-1k.num_objs
    116.50 =C2=B1  3%      -0.4%     116.00 =C2=B1  4%      -4.5%     111.2=
5 =C2=B1  2%  slabinfo.kmalloc-1k.num_slabs
      5019            -0.4%       4998            -2.6%       4887        s=
labinfo.kmalloc-256.active_objs
     80.75            -0.3%      80.50 =C2=B1  2%      -2.8%      78.50    =
    slabinfo.kmalloc-256.active_slabs
      5168            -0.1%       5162 =C2=B1  2%      -2.8%       5024    =
    slabinfo.kmalloc-256.num_objs
     80.75            -0.3%      80.50 =C2=B1  2%      -2.8%      78.50    =
    slabinfo.kmalloc-256.num_slabs
      3820 =C2=B1  2%      -2.3%       3731 =C2=B1  2%      +2.0%       389=
8 =C2=B1  3%  slabinfo.kmalloc-2k.active_objs
    245.25 =C2=B1  2%      -1.7%     241.00            +2.1%     250.50 =C2=
=B1  3%  slabinfo.kmalloc-2k.active_slabs
      3927 =C2=B1  2%      -1.6%       3863            +2.1%       4010 =C2=
=B1  3%  slabinfo.kmalloc-2k.num_objs
    245.25 =C2=B1  2%      -1.7%     241.00            +2.1%     250.50 =C2=
=B1  3%  slabinfo.kmalloc-2k.num_slabs
     53633 =C2=B1  2%      +1.8%      54583 =C2=B1  3%      -0.7%      5326=
6 =C2=B1  3%  slabinfo.kmalloc-32.active_objs
    420.50            +2.3%     430.25 =C2=B1  3%      -0.5%     418.25 =C2=
=B1  3%  slabinfo.kmalloc-32.active_slabs
     53886 =C2=B1  2%      +2.2%      55081 =C2=B1  3%      -0.6%      5356=
7 =C2=B1  4%  slabinfo.kmalloc-32.num_objs
    420.50            +2.3%     430.25 =C2=B1  3%      -0.5%     418.25 =C2=
=B1  3%  slabinfo.kmalloc-32.num_slabs
      1286            +0.5%       1292            +0.3%       1289 =C2=B1  =
2%  slabinfo.kmalloc-4k.active_objs
    162.50            +0.8%     163.75            +0.3%     163.00 =C2=B1  =
2%  slabinfo.kmalloc-4k.active_slabs
      1307            +0.8%       1317            +0.3%       1311 =C2=B1  =
2%  slabinfo.kmalloc-4k.num_objs
    162.50            +0.8%     163.75            +0.3%     163.00 =C2=B1  =
2%  slabinfo.kmalloc-4k.num_slabs
     13867 =C2=B1  2%      +0.2%      13891 =C2=B1  3%      +5.1%      1456=
9 =C2=B1  4%  slabinfo.kmalloc-512.active_objs
    218.25            +0.0%     218.25 =C2=B1  3%      +5.4%     230.00 =C2=
=B1  4%  slabinfo.kmalloc-512.active_slabs
     13990            +0.1%      14009 =C2=B1  3%      +5.4%      14748 =C2=
=B1  4%  slabinfo.kmalloc-512.num_objs
    218.25            +0.0%     218.25 =C2=B1  3%      +5.4%     230.00 =C2=
=B1  4%  slabinfo.kmalloc-512.num_slabs
     34540            +1.5%      35051            -1.3%      34098        s=
labinfo.kmalloc-64.active_objs
    541.75            +1.3%     549.00            -1.3%     534.50        s=
labinfo.kmalloc-64.active_slabs
     34703            +1.2%      35136            -1.4%      34219        s=
labinfo.kmalloc-64.num_objs
    541.75            +1.3%     549.00            -1.3%     534.50        s=
labinfo.kmalloc-64.num_slabs
     27008 =C2=B1  2%      +0.9%      27264            -0.9%      26752    =
    slabinfo.kmalloc-8.active_objs
     52.75 =C2=B1  2%      +0.9%      53.25            -0.9%      52.25    =
    slabinfo.kmalloc-8.active_slabs
     27008 =C2=B1  2%      +0.9%      27264            -0.9%      26752    =
    slabinfo.kmalloc-8.num_objs
     52.75 =C2=B1  2%      +0.9%      53.25            -0.9%      52.25    =
    slabinfo.kmalloc-8.num_slabs
    344.00            +0.7%     346.25            +0.4%     345.25        s=
labinfo.kmalloc-8k.active_objs
     92.50            +0.5%      93.00            +0.3%      92.75        s=
labinfo.kmalloc-8k.active_slabs
    373.00            +0.5%     375.00            +0.3%     374.00        s=
labinfo.kmalloc-8k.num_objs
     92.50            +0.5%      93.00            +0.3%      92.75        s=
labinfo.kmalloc-8k.num_slabs
      6541 =C2=B1  3%      +4.1%       6806 =C2=B1  5%      +5.5%       690=
3 =C2=B1  3%  slabinfo.kmalloc-96.active_objs
    156.00 =C2=B1  2%      +4.0%     162.25 =C2=B1  5%      +6.1%     165.5=
0 =C2=B1  3%  slabinfo.kmalloc-96.active_slabs
      6571 =C2=B1  2%      +4.2%       6848 =C2=B1  5%      +6.0%       696=
7 =C2=B1  3%  slabinfo.kmalloc-96.num_objs
    156.00 =C2=B1  2%      +4.0%     162.25 =C2=B1  5%      +6.1%     165.5=
0 =C2=B1  3%  slabinfo.kmalloc-96.num_slabs
    592.00 =C2=B1 24%     +29.7%     768.00 =C2=B1 10%     +35.1%     800.0=
0 =C2=B1  8%  slabinfo.kmalloc-rcl-128.active_objs
      9.25 =C2=B1 24%     +29.7%      12.00 =C2=B1 10%     +35.1%      12.5=
0 =C2=B1  8%  slabinfo.kmalloc-rcl-128.active_slabs
    592.00 =C2=B1 24%     +29.7%     768.00 =C2=B1 10%     +35.1%     800.0=
0 =C2=B1  8%  slabinfo.kmalloc-rcl-128.num_objs
      9.25 =C2=B1 24%     +29.7%      12.00 =C2=B1 10%     +35.1%      12.5=
0 =C2=B1  8%  slabinfo.kmalloc-rcl-128.num_slabs
    420.00 =C2=B1 30%     +30.0%     546.00 =C2=B1  9%     +37.5%     577.5=
0 =C2=B1 10%  slabinfo.kmalloc-rcl-192.active_objs
     10.00 =C2=B1 30%     +30.0%      13.00 =C2=B1  9%     +37.5%      13.7=
5 =C2=B1 10%  slabinfo.kmalloc-rcl-192.active_slabs
    420.00 =C2=B1 30%     +30.0%     546.00 =C2=B1  9%     +37.5%     577.5=
0 =C2=B1 10%  slabinfo.kmalloc-rcl-192.num_objs
     10.00 =C2=B1 30%     +30.0%      13.00 =C2=B1  9%     +37.5%      13.7=
5 =C2=B1 10%  slabinfo.kmalloc-rcl-192.num_slabs
      2358 =C2=B1  7%      +1.2%       2386 =C2=B1  3%      -3.0%       228=
7 =C2=B1  7%  slabinfo.kmalloc-rcl-512.active_objs
     36.50 =C2=B1  8%      +0.7%      36.75 =C2=B1  2%      -4.1%      35.0=
0 =C2=B1  7%  slabinfo.kmalloc-rcl-512.active_slabs
      2373 =C2=B1  8%      +1.2%       2402 =C2=B1  2%      -3.6%       228=
7 =C2=B1  7%  slabinfo.kmalloc-rcl-512.num_objs
     36.50 =C2=B1  8%      +0.7%      36.75 =C2=B1  2%      -4.1%      35.0=
0 =C2=B1  7%  slabinfo.kmalloc-rcl-512.num_slabs
      5189 =C2=B1  4%      +5.4%       5468            +4.0%       5395 =C2=
=B1  4%  slabinfo.kmalloc-rcl-64.active_objs
     80.50 =C2=B1  5%      +5.9%      85.25            +4.0%      83.75 =C2=
=B1  4%  slabinfo.kmalloc-rcl-64.active_slabs
      5189 =C2=B1  4%      +6.1%       5506            +4.0%       5395 =C2=
=B1  4%  slabinfo.kmalloc-rcl-64.num_objs
     80.50 =C2=B1  5%      +5.9%      85.25            +4.0%      83.75 =C2=
=B1  4%  slabinfo.kmalloc-rcl-64.num_slabs
      1960 =C2=B1 12%      +7.7%       2110 =C2=B1  2%      +4.4%       204=
7 =C2=B1  6%  slabinfo.kmalloc-rcl-96.active_objs
     46.50 =C2=B1 12%      +8.1%      50.25 =C2=B1  2%      +4.8%      48.7=
5 =C2=B1  6%  slabinfo.kmalloc-rcl-96.active_slabs
      1960 =C2=B1 12%      +7.7%       2110 =C2=B1  2%      +4.4%       204=
7 =C2=B1  6%  slabinfo.kmalloc-rcl-96.num_objs
     46.50 =C2=B1 12%      +8.1%      50.25 =C2=B1  2%      +4.8%      48.7=
5 =C2=B1  6%  slabinfo.kmalloc-rcl-96.num_slabs
    720.00 =C2=B1 13%      +2.2%     736.00 =C2=B1  7%      -8.9%     656.0=
0 =C2=B1  8%  slabinfo.kmem_cache.active_objs
     11.25 =C2=B1 13%      +2.2%      11.50 =C2=B1  7%      -8.9%      10.2=
5 =C2=B1  8%  slabinfo.kmem_cache.active_slabs
    720.00 =C2=B1 13%      +2.2%     736.00 =C2=B1  7%      -8.9%     656.0=
0 =C2=B1  8%  slabinfo.kmem_cache.num_objs
     11.25 =C2=B1 13%      +2.2%      11.50 =C2=B1  7%      -8.9%      10.2=
5 =C2=B1  8%  slabinfo.kmem_cache.num_slabs
    872.00 =C2=B1 11%      +2.1%     890.00 =C2=B1  6%      -7.6%     806.0=
0 =C2=B1  6%  slabinfo.kmem_cache_node.active_objs
     14.25 =C2=B1 10%      +1.8%      14.50 =C2=B1  5%      -7.0%      13.2=
5 =C2=B1  6%  slabinfo.kmem_cache_node.active_slabs
    912.00 =C2=B1 10%      +1.8%     928.00 =C2=B1  5%      -7.0%     848.0=
0 =C2=B1  6%  slabinfo.kmem_cache_node.num_objs
     14.25 =C2=B1 10%      +1.8%      14.50 =C2=B1  5%      -7.0%      13.2=
5 =C2=B1  6%  slabinfo.kmem_cache_node.num_slabs
     11726 =C2=B1  5%      -3.0%      11379 =C2=B1  2%      -1.6%      1153=
7        slabinfo.lsm_file_cache.active_objs
     68.25 =C2=B1  5%      -2.9%      66.25 =C2=B1  2%      -1.8%      67.0=
0        slabinfo.lsm_file_cache.active_slabs
     11726 =C2=B1  5%      -3.0%      11379 =C2=B1  2%      -1.6%      1153=
7        slabinfo.lsm_file_cache.num_objs
     68.25 =C2=B1  5%      -2.9%      66.25 =C2=B1  2%      -1.8%      67.0=
0        slabinfo.lsm_file_cache.num_slabs
      1544            -1.0%       1530            +1.0%       1559        s=
labinfo.mm_struct.active_objs
     51.25            -0.5%      51.00            +1.0%      51.75        s=
labinfo.mm_struct.active_slabs
      1544            -1.0%       1530            +1.0%       1559        s=
labinfo.mm_struct.num_objs
     51.25            -0.5%      51.00            +1.0%      51.75        s=
labinfo.mm_struct.num_slabs
    764.50 =C2=B1  6%      +9.9%     840.50 =C2=B1  3%      -3.3%     739.0=
0 =C2=B1  7%  slabinfo.mnt_cache.active_objs
     14.50 =C2=B1  7%      +6.9%      15.50 =C2=B1  3%      -3.4%      14.0=
0 =C2=B1  5%  slabinfo.mnt_cache.active_slabs
    764.50 =C2=B1  6%      +9.9%     840.50 =C2=B1  3%      -3.3%     739.0=
0 =C2=B1  7%  slabinfo.mnt_cache.num_objs
     14.50 =C2=B1  7%      +6.9%      15.50 =C2=B1  3%      -3.4%      14.0=
0 =C2=B1  5%  slabinfo.mnt_cache.num_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.mqueue_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.mqueue_inode_cache.active_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.mqueue_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.mqueue_inode_cache.num_slabs
    386.00            -0.5%     384.00            -0.5%     384.00        s=
labinfo.names_cache.active_objs
     48.25            -0.5%      48.00            -0.5%      48.00        s=
labinfo.names_cache.active_slabs
    386.00            -0.5%     384.00            -0.5%     384.00        s=
labinfo.names_cache.num_objs
     48.25            -0.5%      48.00            -0.5%      48.00        s=
labinfo.names_cache.num_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        s=
labinfo.nfs_read_data.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.nfs_read_data.active_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        s=
labinfo.nfs_read_data.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.nfs_read_data.num_slabs
    248.00            +6.2%     263.50 =C2=B1 10%      +0.0%     248.00    =
    slabinfo.numa_policy.active_objs
      4.00            +6.2%       4.25 =C2=B1 10%      +0.0%       4.00    =
    slabinfo.numa_policy.active_slabs
    248.00            +6.2%     263.50 =C2=B1 10%      +0.0%     248.00    =
    slabinfo.numa_policy.num_objs
      4.00            +6.2%       4.25 =C2=B1 10%      +0.0%       4.00    =
    slabinfo.numa_policy.num_slabs
      4816            -1.7%       4733            -1.1%       4762        s=
labinfo.pde_opener.active_objs
     46.50            -1.6%      45.75 =C2=B1  2%      -1.1%      46.00 =C2=
=B1  2%  slabinfo.pde_opener.active_slabs
      4816            -1.7%       4733            -1.1%       4762        s=
labinfo.pde_opener.num_objs
     46.50            -1.6%      45.75 =C2=B1  2%      -1.1%      46.00 =C2=
=B1  2%  slabinfo.pde_opener.num_slabs
      3552            +0.0%       3552 =C2=B1  2%      -0.1%       3549    =
    slabinfo.pid.active_objs
     55.50            +0.0%      55.50 =C2=B1  2%      -0.9%      55.00 =C2=
=B1  2%  slabinfo.pid.active_slabs
      3552            +0.0%       3552 =C2=B1  2%      -0.1%       3549    =
    slabinfo.pid.num_objs
     55.50            +0.0%      55.50 =C2=B1  2%      -0.9%      55.00 =C2=
=B1  2%  slabinfo.pid.num_slabs
      2254 =C2=B1  4%      -2.4%       2200 =C2=B1  4%      +4.4%       235=
2 =C2=B1  7%  slabinfo.pool_workqueue.active_objs
     36.00 =C2=B1  3%      -4.2%      34.50 =C2=B1  4%      +0.7%      36.2=
5 =C2=B1  7%  slabinfo.pool_workqueue.active_slabs
      2315 =C2=B1  4%      -4.0%       2222 =C2=B1  5%      +1.8%       235=
6 =C2=B1  7%  slabinfo.pool_workqueue.num_objs
     36.00 =C2=B1  3%      -4.2%      34.50 =C2=B1  4%      +0.7%      36.2=
5 =C2=B1  7%  slabinfo.pool_workqueue.num_slabs
      1249            -1.7%       1228            -1.7%       1228        s=
labinfo.proc_dir_entry.active_objs
     29.75            -1.7%      29.25            -1.7%      29.25        s=
labinfo.proc_dir_entry.active_slabs
      1249            -1.7%       1228            -1.7%       1228        s=
labinfo.proc_dir_entry.num_objs
     29.75            -1.7%      29.25            -1.7%      29.25        s=
labinfo.proc_dir_entry.num_slabs
      8844 =C2=B1  2%      -2.4%       8631            -1.1%       8750 =C2=
=B1  2%  slabinfo.proc_inode_cache.active_objs
    185.50 =C2=B1  2%      -2.4%     181.00            -1.3%     183.00 =C2=
=B1  2%  slabinfo.proc_inode_cache.active_slabs
      8929 =C2=B1  2%      -2.3%       8724            -1.5%       8795 =C2=
=B1  2%  slabinfo.proc_inode_cache.num_objs
    185.50 =C2=B1  2%      -2.4%     181.00            -1.3%     183.00 =C2=
=B1  2%  slabinfo.proc_inode_cache.num_slabs
     18665            -0.3%      18600            -0.5%      18576        s=
labinfo.radix_tree_node.active_objs
    332.75            -0.4%     331.50            -0.5%     331.25        s=
labinfo.radix_tree_node.active_slabs
     18665            -0.3%      18600            -0.5%      18576        s=
labinfo.radix_tree_node.num_objs
    332.75            -0.4%     331.50            -0.5%     331.25        s=
labinfo.radix_tree_node.num_slabs
     33.75 =C2=B1 19%     +22.2%      41.25 =C2=B1 30%      +0.0%      33.7=
5 =C2=B1 19%  slabinfo.request_queue.active_objs
      2.25 =C2=B1 19%     +22.2%       2.75 =C2=B1 30%      +0.0%       2.2=
5 =C2=B1 19%  slabinfo.request_queue.active_slabs
     33.75 =C2=B1 19%     +22.2%      41.25 =C2=B1 30%      +0.0%      33.7=
5 =C2=B1 19%  slabinfo.request_queue.num_objs
      2.25 =C2=B1 19%     +22.2%       2.75 =C2=B1 30%      +0.0%       2.2=
5 =C2=B1 19%  slabinfo.request_queue.num_slabs
     51.00            +0.0%      51.00            +0.0%      51.00        s=
labinfo.rpc_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.rpc_inode_cache.active_slabs
     51.00            +0.0%      51.00            +0.0%      51.00        s=
labinfo.rpc_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.rpc_inode_cache.num_slabs
      1296 =C2=B1  2%      +1.2%       1312 =C2=B1  2%      +0.0%       129=
6 =C2=B1  2%  slabinfo.scsi_sense_cache.active_objs
     20.25 =C2=B1  2%      +1.2%      20.50 =C2=B1  2%      +0.0%      20.2=
5 =C2=B1  2%  slabinfo.scsi_sense_cache.active_slabs
      1296 =C2=B1  2%      +1.2%       1312 =C2=B1  2%      +0.0%       129=
6 =C2=B1  2%  slabinfo.scsi_sense_cache.num_objs
     20.25 =C2=B1  2%      +1.2%      20.50 =C2=B1  2%      +0.0%      20.2=
5 =C2=B1  2%  slabinfo.scsi_sense_cache.num_slabs
      3264            +0.0%       3264            +0.0%       3264        s=
labinfo.seq_file.active_objs
     48.00            +0.0%      48.00            +0.0%      48.00        s=
labinfo.seq_file.active_slabs
      3264            +0.0%       3264            +0.0%       3264        s=
labinfo.seq_file.num_objs
     48.00            +0.0%      48.00            +0.0%      48.00        s=
labinfo.seq_file.num_slabs
      5967            -0.1%       5958            -1.7%       5868        s=
labinfo.shmem_inode_cache.active_objs
    129.25 =C2=B1  2%      -0.2%     129.00            -1.7%     127.00    =
    slabinfo.shmem_inode_cache.active_slabs
      5967            -0.1%       5959            -1.7%       5868        s=
labinfo.shmem_inode_cache.num_objs
    129.25 =C2=B1  2%      -0.2%     129.00            -1.7%     127.00    =
    slabinfo.shmem_inode_cache.num_slabs
      1335 =C2=B1  3%      +1.1%       1349 =C2=B1  5%      -1.1%       132=
0        slabinfo.sighand_cache.active_objs
     91.50            +2.2%      93.50 =C2=B1  2%      +1.4%      92.75    =
    slabinfo.sighand_cache.active_slabs
      1372            +2.4%       1406 =C2=B1  3%      +1.9%       1398    =
    slabinfo.sighand_cache.num_objs
     91.50            +2.2%      93.50 =C2=B1  2%      +1.4%      92.75    =
    slabinfo.sighand_cache.num_slabs
      2064 =C2=B1  2%      +0.7%       2078            +0.6%       2077 =C2=
=B1  2%  slabinfo.signal_cache.active_objs
     73.25 =C2=B1  2%      +0.7%      73.75 =C2=B1  2%      +0.3%      73.5=
0 =C2=B1  2%  slabinfo.signal_cache.active_slabs
      2064 =C2=B1  2%      +0.7%       2078            +0.6%       2077 =C2=
=B1  2%  slabinfo.signal_cache.num_objs
     73.25 =C2=B1  2%      +0.7%      73.75 =C2=B1  2%      +0.3%      73.5=
0 =C2=B1  2%  slabinfo.signal_cache.num_slabs
    624.00 =C2=B1  4%      -7.7%     576.00            -2.6%     608.00 =C2=
=B1 11%  slabinfo.skbuff_fclone_cache.active_objs
      9.75 =C2=B1  4%      -7.7%       9.00            -2.6%       9.50 =C2=
=B1 11%  slabinfo.skbuff_fclone_cache.active_slabs
    624.00 =C2=B1  4%      -7.7%     576.00            -2.6%     608.00 =C2=
=B1 11%  slabinfo.skbuff_fclone_cache.num_objs
      9.75 =C2=B1  4%      -7.7%       9.00            -2.6%       9.50 =C2=
=B1 11%  slabinfo.skbuff_fclone_cache.num_slabs
      4080 =C2=B1 11%      -5.1%       3872 =C2=B1 10%      -5.9%       384=
0 =C2=B1  9%  slabinfo.skbuff_head_cache.active_objs
     65.75 =C2=B1  8%      -6.1%      61.75 =C2=B1  8%      -6.5%      61.5=
0 =C2=B1  8%  slabinfo.skbuff_head_cache.active_slabs
      4208 =C2=B1  8%      -6.1%       3952 =C2=B1  8%      -6.5%       393=
6 =C2=B1  8%  slabinfo.skbuff_head_cache.num_objs
     65.75 =C2=B1  8%      -6.1%      61.75 =C2=B1  8%      -6.5%      61.5=
0 =C2=B1  8%  slabinfo.skbuff_head_cache.num_slabs
      2210 =C2=B1  3%      +0.4%       2219 =C2=B1  5%      +2.1%       225=
7 =C2=B1  3%  slabinfo.sock_inode_cache.active_objs
     56.50 =C2=B1  3%      +0.4%      56.75 =C2=B1  5%      +1.3%      57.2=
5 =C2=B1  3%  slabinfo.sock_inode_cache.active_slabs
      2210 =C2=B1  3%      +0.4%       2219 =C2=B1  5%      +2.1%       225=
7 =C2=B1  3%  slabinfo.sock_inode_cache.num_objs
     56.50 =C2=B1  3%      +0.4%      56.75 =C2=B1  5%      +1.3%      57.2=
5 =C2=B1  3%  slabinfo.sock_inode_cache.num_slabs
      3186            +0.0%       3187 =C2=B1  2%      +2.3%       3261    =
    slabinfo.task_delay_info.active_objs
     62.00            +0.4%      62.25 =C2=B1  2%      +2.0%      63.25    =
    slabinfo.task_delay_info.active_slabs
      3186            +0.0%       3187 =C2=B1  2%      +2.3%       3261    =
    slabinfo.task_delay_info.num_objs
     62.00            +0.4%      62.25 =C2=B1  2%      +2.0%      63.25    =
    slabinfo.task_delay_info.num_slabs
    880.50 =C2=B1  5%      -4.9%     837.50 =C2=B1  9%     +10.2%     970.2=
5 =C2=B1  5%  slabinfo.task_group.active_objs
     20.50 =C2=B1  5%      -6.1%      19.25 =C2=B1  9%     +11.0%      22.7=
5 =C2=B1  4%  slabinfo.task_group.active_slabs
    880.50 =C2=B1  5%      -4.9%     837.50 =C2=B1  9%     +10.2%     970.2=
5 =C2=B1  5%  slabinfo.task_group.num_objs
     20.50 =C2=B1  5%      -6.1%      19.25 =C2=B1  9%     +11.0%      22.7=
5 =C2=B1  4%  slabinfo.task_group.num_slabs
    990.25            +2.3%       1013            +0.1%     991.50        s=
labinfo.task_struct.active_objs
    335.00            +2.2%     342.25            -0.1%     334.75        s=
labinfo.task_struct.active_slabs
      1006            +2.2%       1028            -0.1%       1004        s=
labinfo.task_struct.num_objs
    335.00            +2.2%     342.25            -0.1%     334.75        s=
labinfo.task_struct.num_slabs
     95.75 =C2=B1 13%      +0.3%      96.00 =C2=B1 13%      +7.6%     103.0=
0        slabinfo.taskstats.active_objs
      1.75 =C2=B1 24%      +0.0%       1.75 =C2=B1 24%     +14.3%       2.0=
0        slabinfo.taskstats.active_slabs
     95.75 =C2=B1 13%      +0.3%      96.00 =C2=B1 13%      +7.6%     103.0=
0        slabinfo.taskstats.num_objs
      1.75 =C2=B1 24%      +0.0%       1.75 =C2=B1 24%     +14.3%       2.0=
0        slabinfo.taskstats.num_slabs
      2917            +2.5%       2990 =C2=B1  2%      -1.1%       2886    =
    slabinfo.trace_event_file.active_objs
     63.25            +2.8%      65.00 =C2=B1  2%      -0.8%      62.75    =
    slabinfo.trace_event_file.active_slabs
      2917            +2.5%       2990 =C2=B1  2%      -1.1%       2886    =
    slabinfo.trace_event_file.num_objs
     63.25            +2.8%      65.00 =C2=B1  2%      -0.8%      62.75    =
    slabinfo.trace_event_file.num_slabs
     66.00            +0.0%      66.00            +0.0%      66.00        s=
labinfo.tw_sock_TCP.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.active_slabs
     66.00            +0.0%      66.00            +0.0%      66.00        s=
labinfo.tw_sock_TCP.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.num_slabs
     29767 =C2=B1  6%      -2.5%      29025 =C2=B1  7%      +7.4%      3196=
1 =C2=B1  5%  slabinfo.vm_area_struct.active_objs
    754.25 =C2=B1  6%      -2.6%     734.75 =C2=B1  7%      +7.3%     809.2=
5 =C2=B1  5%  slabinfo.vm_area_struct.active_slabs
     30191 =C2=B1  6%      -2.6%      29416 =C2=B1  7%      +7.3%      3238=
4 =C2=B1  5%  slabinfo.vm_area_struct.num_objs
    754.25 =C2=B1  6%      -2.6%     734.75 =C2=B1  7%      +7.3%     809.2=
5 =C2=B1  5%  slabinfo.vm_area_struct.num_slabs
      6253 =C2=B1  2%      +7.7%       6733            +1.2%       6330 =C2=
=B1  3%  slabinfo.vmap_area.active_objs
    101.25 =C2=B1  2%      +7.2%     108.50            +1.2%     102.50 =C2=
=B1  3%  slabinfo.vmap_area.active_slabs
      6509 =C2=B1  2%      +6.9%       6961            +1.3%       6596 =C2=
=B1  3%  slabinfo.vmap_area.num_objs
    101.25 =C2=B1  2%      +7.2%     108.50            +1.2%     102.50 =C2=
=B1  3%  slabinfo.vmap_area.num_slabs
     45.00 =C2=B1 34%     -20.0%      36.00            +0.0%      45.00 =C2=
=B1 34%  slabinfo.xfs_btree_cur.active_objs
      1.25 =C2=B1 34%     -20.0%       1.00            +0.0%       1.25 =C2=
=B1 34%  slabinfo.xfs_btree_cur.active_slabs
     45.00 =C2=B1 34%     -20.0%      36.00            +0.0%      45.00 =C2=
=B1 34%  slabinfo.xfs_btree_cur.num_objs
      1.25 =C2=B1 34%     -20.0%       1.00            +0.0%       1.25 =C2=
=B1 34%  slabinfo.xfs_btree_cur.num_slabs
    147.00 =C2=B1 24%      +0.0%     147.00 =C2=B1 14%     +14.3%     168.0=
0 =C2=B1 30%  slabinfo.xfs_buf.active_objs
      3.50 =C2=B1 24%      +0.0%       3.50 =C2=B1 14%     +14.3%       4.0=
0 =C2=B1 30%  slabinfo.xfs_buf.active_slabs
    147.00 =C2=B1 24%      +0.0%     147.00 =C2=B1 14%     +14.3%     168.0=
0 =C2=B1 30%  slabinfo.xfs_buf.num_objs
      3.50 =C2=B1 24%      +0.0%       3.50 =C2=B1 14%     +14.3%       4.0=
0 =C2=B1 30%  slabinfo.xfs_buf.num_slabs
     38.00            +0.0%      38.00            +0.0%      38.00        s=
labinfo.xfs_efi_item.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfs_efi_item.active_slabs
     38.00            +0.0%      38.00            +0.0%      38.00        s=
labinfo.xfs_efi_item.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfs_efi_item.num_slabs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.xfs_inode.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.xfs_inode.active_slabs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.xfs_inode.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.xfs_inode.num_slabs
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.0:IO-APIC.2-edge.timer
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.20:IO-APIC.20-fasteoi.ehci_hcd:usb2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.22:IO-APIC.22-fasteoi.ehci_hcd:usb1
      1776 =C2=B1 99%    +552.0%      11581 =C2=B1139%     -38.6%       109=
0 =C2=B1112%  interrupts.35:PCI-MSI.2621441-edge.eth0-TxRx-0
      2443 =C2=B1 67%     -59.8%     983.00 =C2=B1 92%     -91.7%     202.2=
5 =C2=B1 22%  interrupts.36:PCI-MSI.2621442-edge.eth0-TxRx-1
      2792 =C2=B1159%     +64.4%       4590 =C2=B1139%     -93.7%     175.0=
0 =C2=B1  5%  interrupts.37:PCI-MSI.2621443-edge.eth0-TxRx-2
      5994 =C2=B1 97%     +47.3%       8829 =C2=B1100%     -54.7%       271=
5 =C2=B1 94%  interrupts.38:PCI-MSI.2621444-edge.eth0-TxRx-3
      2001 =C2=B1 95%    +164.9%       5299 =C2=B1156%    +361.5%       923=
4 =C2=B1169%  interrupts.39:PCI-MSI.2621445-edge.eth0-TxRx-4
    179.25 =C2=B1  5%   +1577.8%       3007 =C2=B1162%    +404.3%     904.0=
0 =C2=B1 84%  interrupts.40:PCI-MSI.2621446-edge.eth0-TxRx-5
     18460 =C2=B1136%     -91.0%       1655 =C2=B1153%     -96.4%     666.7=
5 =C2=B1 82%  interrupts.41:PCI-MSI.2621447-edge.eth0-TxRx-6
    304.75 =C2=B1 56%    +447.1%       1667 =C2=B1133%     +61.5%     492.2=
5 =C2=B1101%  interrupts.42:PCI-MSI.2621448-edge.eth0-TxRx-7
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.44:PCI-MSI.2623489-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.45:PCI-MSI.2623490-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.46:PCI-MSI.2623491-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.47:PCI-MSI.2623492-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.48:PCI-MSI.2623493-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.49:PCI-MSI.2623494-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.4:IO-APIC.4-edge.ttyS0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.50:PCI-MSI.2623495-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.51:PCI-MSI.2623496-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.55:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.56:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.56:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.57:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.57:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.58:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.58:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.59:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.59:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.60:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.60:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.61:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.61:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.62:PCI-MSI.2097152-edge.isci-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.62:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.63:PCI-MSI.2097152-edge.isci-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.63:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.64:PCI-MSI.2097152-edge.isci-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.64:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.64:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.65:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.65:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.67:PCI-MSI.2097152-edge.isci-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.67:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.67:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.68:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.68:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.68:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.69:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.69:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.69:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.70:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.70:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.70:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.71:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.71:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.71:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.72:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.72:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.73:PCI-MSI.2097152-edge.isci-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.73:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.74:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.8:IO-APIC.8-edge.rtc0
     74767 =C2=B1  2%      +3.9%      77712 =C2=B1  4%      -5.3%      7082=
1 =C2=B1  2%  interrupts.CAL:Function_call_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.0:IO-APIC.2-edge.timer
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.45:PCI-MSI.2623490-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.55:PCI-MSI.67584-edge.ioat-msix
      1830 =C2=B1 19%     -36.4%       1163 =C2=B1 35%     -12.7%       159=
6 =C2=B1 33%  interrupts.CPU0.CAL:Function_call_interrupts
      0.75 =C2=B1 57%    +133.3%       1.75 =C2=B1116%     +66.7%       1.2=
5 =C2=B1 66%  interrupts.CPU0.IWI:IRQ_work_interrupts
    605311            +0.0%     605481            -0.0%     605082        i=
nterrupts.CPU0.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.MCP:Machine_check_polls
      3493 =C2=B1 33%     +10.9%       3873 =C2=B1 60%     +70.4%       595=
2 =C2=B1 41%  interrupts.CPU0.NMI:Non-maskable_interrupts
      3493 =C2=B1 33%     +10.9%       3873 =C2=B1 60%     +70.4%       595=
2 =C2=B1 41%  interrupts.CPU0.PMI:Performance_monitoring_interrupts
    174.50 =C2=B1 72%     -33.7%     115.75 =C2=B1 50%     +12.2%     195.7=
5 =C2=B1 45%  interrupts.CPU0.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.RTR:APIC_ICR_read_retries
    650.75 =C2=B1 20%     -32.7%     438.25 =C2=B1 24%     -26.5%     478.0=
0 =C2=B1 36%  interrupts.CPU0.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU1.46:PCI-MSI.2623491-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU1.56:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU1.56:PCI-MSI.69632-edge.ioat-msix
      2064 =C2=B1 40%     -16.4%       1725 =C2=B1 30%     -21.2%       162=
6 =C2=B1 40%  interrupts.CPU1.CAL:Function_call_interrupts
      0.25 =C2=B1173%    +400.0%       1.25 =C2=B1 66%    +600.0%       1.7=
5 =C2=B1116%  interrupts.CPU1.IWI:IRQ_work_interrupts
    605675            -0.0%     605668            -0.2%     604496        i=
nterrupts.CPU1.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU1.MCP:Machine_check_polls
      2892 =C2=B1 33%     +90.0%       5495 =C2=B1 51%      +3.3%       298=
7 =C2=B1 36%  interrupts.CPU1.NMI:Non-maskable_interrupts
      2892 =C2=B1 33%     +90.0%       5495 =C2=B1 51%      +3.3%       298=
7 =C2=B1 36%  interrupts.CPU1.PMI:Performance_monitoring_interrupts
     62.50 =C2=B1 71%    +160.0%     162.50 =C2=B1 59%     +57.6%      98.5=
0 =C2=B1 35%  interrupts.CPU1.RES:Rescheduling_interrupts
    131.00 =C2=B1172%    +331.9%     565.75 =C2=B1 57%     +73.7%     227.5=
0 =C2=B1 68%  interrupts.CPU1.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU10.8:IO-APIC.8-edge.rtc0
      1028 =C2=B1 26%     +22.1%       1256 =C2=B1 19%     +13.4%       116=
6 =C2=B1 17%  interrupts.CPU10.CAL:Function_call_interrupts
      0.50 =C2=B1173%    +150.0%       1.25 =C2=B1 66%    +100.0%       1.0=
0 =C2=B1 70%  interrupts.CPU10.IWI:IRQ_work_interrupts
    605197            +0.1%     605510            -0.0%     604935        i=
nterrupts.CPU10.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU10.MCP:Machine_check_polls
      3444 =C2=B1 82%     +72.3%       5935 =C2=B1 41%     +41.8%       488=
2 =C2=B1 41%  interrupts.CPU10.NMI:Non-maskable_interrupts
      3444 =C2=B1 82%     +72.3%       5935 =C2=B1 41%     +41.8%       488=
2 =C2=B1 41%  interrupts.CPU10.PMI:Performance_monitoring_interrupts
     98.25 =C2=B1124%     +61.8%     159.00 =C2=B1 65%     +75.8%     172.7=
5 =C2=B1 52%  interrupts.CPU10.RES:Rescheduling_interrupts
    184.75 =C2=B1172%    +201.8%     557.50 =C2=B1 58%     +75.8%     324.7=
5 =C2=B1 71%  interrupts.CPU10.TLB:TLB_shootdowns
      1231 =C2=B1 25%      -7.5%       1139 =C2=B1 23%     -25.9%     913.2=
5 =C2=B1 32%  interrupts.CPU11.CAL:Function_call_interrupts
      1.00 =C2=B1 70%     -50.0%       0.50 =C2=B1173%     -50.0%       0.5=
0 =C2=B1100%  interrupts.CPU11.IWI:IRQ_work_interrupts
    605410            -0.0%     605162            -0.1%     604665        i=
nterrupts.CPU11.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.MCP:Machine_check_polls
      4535 =C2=B1 54%     -13.0%       3946 =C2=B1 64%     -21.8%       354=
7 =C2=B1 44%  interrupts.CPU11.NMI:Non-maskable_interrupts
      4535 =C2=B1 54%     -13.0%       3946 =C2=B1 64%     -21.8%       354=
7 =C2=B1 44%  interrupts.CPU11.PMI:Performance_monitoring_interrupts
    151.00 =C2=B1 71%     -43.9%      84.75 =C2=B1 80%     -79.0%      31.7=
5 =C2=B1 60%  interrupts.CPU11.RES:Rescheduling_interrupts
    419.50 =C2=B1 79%     -42.9%     239.50 =C2=B1126%     -68.6%     131.7=
5 =C2=B1173%  interrupts.CPU11.TLB:TLB_shootdowns
      1257 =C2=B1 20%      -6.0%       1181 =C2=B1 28%      +3.1%       129=
7 =C2=B1 20%  interrupts.CPU12.CAL:Function_call_interrupts
      1.75 =C2=B1116%     -71.4%       0.50 =C2=B1100%     -28.6%       1.2=
5 =C2=B1 66%  interrupts.CPU12.IWI:IRQ_work_interrupts
    605545            +0.0%     605582            -0.1%     605127        i=
nterrupts.CPU12.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.MCP:Machine_check_polls
      4291 =C2=B1 54%     -33.6%       2847 =C2=B1 46%     +34.5%       577=
0 =C2=B1 46%  interrupts.CPU12.NMI:Non-maskable_interrupts
      4291 =C2=B1 54%     -33.6%       2847 =C2=B1 46%     +34.5%       577=
0 =C2=B1 46%  interrupts.CPU12.PMI:Performance_monitoring_interrupts
    106.00 =C2=B1103%     +28.3%     136.00 =C2=B1 84%     +79.5%     190.2=
5 =C2=B1 60%  interrupts.CPU12.RES:Rescheduling_interrupts
    394.50 =C2=B1 73%     -12.0%     347.25 =C2=B1100%     +14.2%     450.5=
0 =C2=B1 60%  interrupts.CPU12.TLB:TLB_shootdowns
      1656 =C2=B1 33%     +58.9%       2632 =C2=B1 84%     -28.0%       119=
2 =C2=B1 12%  interrupts.CPU13.CAL:Function_call_interrupts
      1.75 =C2=B1109%     -42.9%       1.00 =C2=B1100%     -57.1%       0.7=
5 =C2=B1110%  interrupts.CPU13.IWI:IRQ_work_interrupts
    605309            +0.1%     605621            -0.0%     605223        i=
nterrupts.CPU13.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.MCP:Machine_check_polls
      3998 =C2=B1 27%     +16.3%       4650 =C2=B1 67%      +4.8%       419=
0 =C2=B1 61%  interrupts.CPU13.NMI:Non-maskable_interrupts
      3998 =C2=B1 27%     +16.3%       4650 =C2=B1 67%      +4.8%       419=
0 =C2=B1 61%  interrupts.CPU13.PMI:Performance_monitoring_interrupts
    111.50 =C2=B1 48%     +27.8%     142.50 =C2=B1 83%     +26.9%     141.5=
0 =C2=B1 60%  interrupts.CPU13.RES:Rescheduling_interrupts
    314.75 =C2=B1101%     +30.7%     411.50 =C2=B1 81%     -16.8%     261.7=
5 =C2=B1 97%  interrupts.CPU13.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.63:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.64:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.65:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.66:PCI-MSI.67174400-edge.ioat-msix
    899.00 =C2=B1 25%     +51.4%       1361 =C2=B1 20%     +36.2%       122=
4 =C2=B1 17%  interrupts.CPU14.CAL:Function_call_interrupts
      0.50 =C2=B1173%     +50.0%       0.75 =C2=B1110%    +250.0%       1.7=
5 =C2=B1 24%  interrupts.CPU14.IWI:IRQ_work_interrupts
    604935            +0.1%     605707            +0.0%     605020        i=
nterrupts.CPU14.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.MCP:Machine_check_polls
      3066 =C2=B1 40%     +45.3%       4455 =C2=B1 52%    +102.7%       621=
5 =C2=B1 29%  interrupts.CPU14.NMI:Non-maskable_interrupts
      3066 =C2=B1 40%     +45.3%       4455 =C2=B1 52%    +102.7%       621=
5 =C2=B1 29%  interrupts.CPU14.PMI:Performance_monitoring_interrupts
     28.25 =C2=B1 24%    +248.7%      98.50 =C2=B1 60%    +550.4%     183.7=
5 =C2=B1 62%  interrupts.CPU14.RES:Rescheduling_interrupts
    431.25 =C2=B1156%      +3.8%     447.75 =C2=B1 65%     +13.3%     488.7=
5 =C2=B1 41%  interrupts.CPU14.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.65:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.66:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.67:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.68:PCI-MSI.67176448-edge.ioat-msix
      1443 =C2=B1  8%     -19.3%       1164 =C2=B1 22%     -31.5%     988.7=
5 =C2=B1  9%  interrupts.CPU15.CAL:Function_call_interrupts
      1.25 =C2=B1 34%     -40.0%       0.75 =C2=B1110%     -40.0%       0.7=
5 =C2=B1110%  interrupts.CPU15.IWI:IRQ_work_interrupts
    605278            -0.1%     604866            -0.0%     605052        i=
nterrupts.CPU15.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.MCP:Machine_check_polls
      5222 =C2=B1 34%     -14.7%       4452 =C2=B1 52%      -6.4%       488=
7 =C2=B1 47%  interrupts.CPU15.NMI:Non-maskable_interrupts
      5222 =C2=B1 34%     -14.7%       4452 =C2=B1 52%      -6.4%       488=
7 =C2=B1 47%  interrupts.CPU15.PMI:Performance_monitoring_interrupts
    182.50 =C2=B1 64%     -20.8%     144.50 =C2=B1 78%     -72.7%      49.7=
5 =C2=B1 53%  interrupts.CPU15.RES:Rescheduling_interrupts
    722.25 =C2=B1  6%     -48.3%     373.75 =C2=B1 99%     -81.6%     132.7=
5 =C2=B1171%  interrupts.CPU15.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.66:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.67:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.68:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.69:PCI-MSI.67178496-edge.ioat-msix
      2621 =C2=B1114%     -54.4%       1196 =C2=B1 25%     -46.9%       139=
2 =C2=B1 17%  interrupts.CPU16.CAL:Function_call_interrupts
      0.25 =C2=B1173%    +200.0%       0.75 =C2=B1110%    +100.0%       0.5=
0 =C2=B1100%  interrupts.CPU16.IWI:IRQ_work_interrupts
    604784            +0.2%     605730            +0.0%     605010        i=
nterrupts.CPU16.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.MCP:Machine_check_polls
      2867 =C2=B1 60%     +47.8%       4237 =C2=B1 60%     +22.1%       350=
2 =C2=B1 21%  interrupts.CPU16.NMI:Non-maskable_interrupts
      2867 =C2=B1 60%     +47.8%       4237 =C2=B1 60%     +22.1%       350=
2 =C2=B1 21%  interrupts.CPU16.PMI:Performance_monitoring_interrupts
     68.25 =C2=B1 72%     +46.2%      99.75 =C2=B1 82%    +174.7%     187.5=
0 =C2=B1 58%  interrupts.CPU16.RES:Rescheduling_interrupts
      0.75 =C2=B1 57%  +46933.3%     352.75 =C2=B1100%  +42200.0%     317.2=
5 =C2=B1102%  interrupts.CPU16.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.68:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.69:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.70:PCI-MSI.67180544-edge.ioat-msix
      1480 =C2=B1  6%    +139.1%       3538 =C2=B1101%     -23.3%       113=
4 =C2=B1 11%  interrupts.CPU17.CAL:Function_call_interrupts
      1.75 =C2=B1 24%     -57.1%       0.75 =C2=B1 57%     -71.4%       0.5=
0 =C2=B1100%  interrupts.CPU17.IWI:IRQ_work_interrupts
    605237            +0.1%     605554            -0.0%     605052        i=
nterrupts.CPU17.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.MCP:Machine_check_polls
      6463 =C2=B1 29%     -40.4%       3850 =C2=B1 14%     -45.1%       354=
7 =C2=B1 39%  interrupts.CPU17.NMI:Non-maskable_interrupts
      6463 =C2=B1 29%     -40.4%       3850 =C2=B1 14%     -45.1%       354=
7 =C2=B1 39%  interrupts.CPU17.PMI:Performance_monitoring_interrupts
    195.50 =C2=B1 53%     +22.6%     239.75 =C2=B1 38%     -81.5%      36.2=
5 =C2=B1 56%  interrupts.CPU17.RES:Rescheduling_interrupts
    730.75 =C2=B1  3%     -22.5%     566.00 =C2=B1 57%     -80.4%     143.5=
0 =C2=B1144%  interrupts.CPU17.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.69:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.70:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.71:PCI-MSI.67182592-edge.ioat-msix
      1128 =C2=B1 17%     +85.9%       2098 =C2=B1 62%     +14.8%       129=
5 =C2=B1  5%  interrupts.CPU18.CAL:Function_call_interrupts
      0.50 =C2=B1100%     -50.0%       0.25 =C2=B1173%    +150.0%       1.2=
5 =C2=B1 66%  interrupts.CPU18.IWI:IRQ_work_interrupts
    604860            +0.1%     605593            +0.0%     604861        i=
nterrupts.CPU18.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.MCP:Machine_check_polls
      3552 =C2=B1 44%     -20.0%       2840 =C2=B1 33%     +55.1%       550=
9 =C2=B1 52%  interrupts.CPU18.NMI:Non-maskable_interrupts
      3552 =C2=B1 44%     -20.0%       2840 =C2=B1 33%     +55.1%       550=
9 =C2=B1 52%  interrupts.CPU18.PMI:Performance_monitoring_interrupts
    104.25 =C2=B1105%     -25.9%      77.25 =C2=B1 81%     +12.0%     116.7=
5 =C2=B1 87%  interrupts.CPU18.RES:Rescheduling_interrupts
    170.25 =C2=B1168%      +1.8%     173.25 =C2=B1173%    +124.5%     382.2=
5 =C2=B1 57%  interrupts.CPU18.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.70:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.71:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.72:PCI-MSI.67184640-edge.ioat-msix
      1573 =C2=B1  2%     -10.5%       1408 =C2=B1 21%     +10.4%       173=
6 =C2=B1 21%  interrupts.CPU19.CAL:Function_call_interrupts
      1.25 =C2=B1 34%      +0.0%       1.25 =C2=B1 66%     -60.0%       0.5=
0 =C2=B1173%  interrupts.CPU19.IWI:IRQ_work_interrupts
    605253            +0.1%     605634            -0.1%     604734        i=
nterrupts.CPU19.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.MCP:Machine_check_polls
      5223 =C2=B1 34%      +6.8%       5581 =C2=B1 52%     -26.7%       383=
1 =C2=B1 68%  interrupts.CPU19.NMI:Non-maskable_interrupts
      5223 =C2=B1 34%      +6.8%       5581 =C2=B1 52%     -26.7%       383=
1 =C2=B1 68%  interrupts.CPU19.PMI:Performance_monitoring_interrupts
    206.75 =C2=B1 45%     -24.3%     156.50 =C2=B1 63%     -65.7%      71.0=
0 =C2=B1 60%  interrupts.CPU19.RES:Rescheduling_interrupts
    735.75 =C2=B1  2%     -22.7%     568.75 =C2=B1 57%     -82.0%     132.7=
5 =C2=B1170%  interrupts.CPU19.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU2.47:PCI-MSI.2623492-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU2.57:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU2.57:PCI-MSI.71680-edge.ioat-msix
      1268 =C2=B1 20%     +53.2%       1942 =C2=B1 22%      -1.1%       125=
4 =C2=B1 15%  interrupts.CPU2.CAL:Function_call_interrupts
      1.50 =C2=B1 57%     +66.7%       2.50 =C2=B1 60%      +0.0%       1.5=
0 =C2=B1 33%  interrupts.CPU2.IWI:IRQ_work_interrupts
    605262            +0.0%     605476            -0.0%     605077        i=
nterrupts.CPU2.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU2.MCP:Machine_check_polls
      6422 =C2=B1 34%      -7.1%       5967 =C2=B1 40%      -1.3%       633=
7 =C2=B1 25%  interrupts.CPU2.NMI:Non-maskable_interrupts
      6422 =C2=B1 34%      -7.1%       5967 =C2=B1 40%      -1.3%       633=
7 =C2=B1 25%  interrupts.CPU2.PMI:Performance_monitoring_interrupts
    178.50 =C2=B1 70%      +4.6%     186.75 =C2=B1 43%      -4.2%     171.0=
0 =C2=B1 74%  interrupts.CPU2.RES:Rescheduling_interrupts
    555.00 =C2=B1 57%     +20.6%     669.50 =C2=B1 10%     -21.4%     436.5=
0 =C2=B1 61%  interrupts.CPU2.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.71:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.73:PCI-MSI.67186688-edge.ioat-msix
      2498 =C2=B1 58%      -0.8%       2478 =C2=B1 78%     -51.5%       121=
1 =C2=B1 14%  interrupts.CPU20.CAL:Function_call_interrupts
      0.25 =C2=B1173%    +100.0%       0.50 =C2=B1173%    +400.0%       1.2=
5 =C2=B1 66%  interrupts.CPU20.IWI:IRQ_work_interrupts
    605304            -0.0%     605245            -0.1%     604826        i=
nterrupts.CPU20.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.MCP:Machine_check_polls
      2755 =C2=B1 56%     +36.3%       3754 =C2=B1 72%    +108.7%       574=
9 =C2=B1 41%  interrupts.CPU20.NMI:Non-maskable_interrupts
      2755 =C2=B1 56%     +36.3%       3754 =C2=B1 72%    +108.7%       574=
9 =C2=B1 41%  interrupts.CPU20.PMI:Performance_monitoring_interrupts
     53.50 =C2=B1 63%     +71.0%      91.50 =C2=B1 69%    +183.2%     151.5=
0 =C2=B1 68%  interrupts.CPU20.RES:Rescheduling_interrupts
     40.25 =C2=B1168%    +328.6%     172.50 =C2=B1164%    +928.6%     414.0=
0 =C2=B1 64%  interrupts.CPU20.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.72:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.74:PCI-MSI.67188736-edge.ioat-msix
      1480 =C2=B1 12%      -7.1%       1374 =C2=B1 22%     -17.1%       122=
7 =C2=B1 20%  interrupts.CPU21.CAL:Function_call_interrupts
      1.25 =C2=B1 66%     -40.0%       0.75 =C2=B1 57%     -20.0%       1.0=
0 =C2=B1100%  interrupts.CPU21.IWI:IRQ_work_interrupts
    605274            +0.0%     605524            -0.0%     605149        i=
nterrupts.CPU21.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.MCP:Machine_check_polls
      5636 =C2=B1 50%     -33.1%       3770 =C2=B1 18%      -0.6%       560=
2 =C2=B1 49%  interrupts.CPU21.NMI:Non-maskable_interrupts
      5636 =C2=B1 50%     -33.1%       3770 =C2=B1 18%      -0.6%       560=
2 =C2=B1 49%  interrupts.CPU21.PMI:Performance_monitoring_interrupts
    179.00 =C2=B1 67%     -15.1%     152.00 =C2=B1 70%      -3.6%     172.5=
0 =C2=B1 60%  interrupts.CPU21.RES:Rescheduling_interrupts
    602.50 =C2=B1 48%      -5.1%     571.50 =C2=B1 57%     -38.5%     370.7=
5 =C2=B1 80%  interrupts.CPU21.TLB:TLB_shootdowns
      1242 =C2=B1 51%     +90.4%       2365 =C2=B1 52%      +4.0%       129=
2 =C2=B1 20%  interrupts.CPU22.CAL:Function_call_interrupts
      0.25 =C2=B1173%    +100.0%       0.50 =C2=B1173%    +500.0%       1.5=
0 =C2=B1 57%  interrupts.CPU22.IWI:IRQ_work_interrupts
    604681            +0.2%     605704            -0.0%     604546        i=
nterrupts.CPU22.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.MCP:Machine_check_polls
      3095 =C2=B1 51%      +2.3%       3167 =C2=B1 94%    +109.6%       648=
7 =C2=B1 45%  interrupts.CPU22.NMI:Non-maskable_interrupts
      3095 =C2=B1 51%      +2.3%       3167 =C2=B1 94%    +109.6%       648=
7 =C2=B1 45%  interrupts.CPU22.PMI:Performance_monitoring_interrupts
     27.50 =C2=B1 37%    +206.4%      84.25 =C2=B1 73%    +620.0%     198.0=
0 =C2=B1 55%  interrupts.CPU22.RES:Rescheduling_interrupts
      1.00 =C2=B1122%  +17100.0%     172.00 =C2=B1172%  +46900.0%     470.0=
0 =C2=B1 59%  interrupts.CPU22.TLB:TLB_shootdowns
      1438 =C2=B1 13%      -0.2%       1435 =C2=B1 17%     -17.2%       119=
0 =C2=B1 20%  interrupts.CPU23.CAL:Function_call_interrupts
      2.00 =C2=B1 50%      +0.0%       2.00 =C2=B1 61%     -25.0%       1.5=
0 =C2=B1 57%  interrupts.CPU23.IWI:IRQ_work_interrupts
    605222            +0.1%     605600            -0.2%     603921        i=
nterrupts.CPU23.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.MCP:Machine_check_polls
      5396 =C2=B1 50%      +4.9%       5661 =C2=B1 38%     -15.4%       456=
4 =C2=B1 41%  interrupts.CPU23.NMI:Non-maskable_interrupts
      5396 =C2=B1 50%      +4.9%       5661 =C2=B1 38%     -15.4%       456=
4 =C2=B1 41%  interrupts.CPU23.PMI:Performance_monitoring_interrupts
    171.75 =C2=B1 51%      -0.6%     170.75 =C2=B1 55%     -15.4%     145.2=
5 =C2=B1 71%  interrupts.CPU23.RES:Rescheduling_interrupts
    634.00 =C2=B1 32%      +0.0%     634.00 =C2=B1 39%     -39.8%     381.5=
0 =C2=B1 58%  interrupts.CPU23.TLB:TLB_shootdowns
    997.25 =C2=B1  8%     +17.2%       1168 =C2=B1  9%     +23.4%       123=
0 =C2=B1 32%  interrupts.CPU24.CAL:Function_call_interrupts
      0.50 =C2=B1173%    +450.0%       2.75 =C2=B1 47%      +0.0%       0.5=
0 =C2=B1173%  interrupts.CPU24.IWI:IRQ_work_interrupts
    605385            +0.0%     605410            -0.2%     604365        i=
nterrupts.CPU24.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.MCP:Machine_check_polls
      3880 =C2=B1 68%     +84.0%       7138 =C2=B1 28%     +10.8%       430=
0 =C2=B1 54%  interrupts.CPU24.NMI:Non-maskable_interrupts
      3880 =C2=B1 68%     +84.0%       7138 =C2=B1 28%     +10.8%       430=
0 =C2=B1 54%  interrupts.CPU24.PMI:Performance_monitoring_interrupts
     59.75 =C2=B1 59%     +76.2%     105.25 =C2=B1 11%     -21.3%      47.0=
0 =C2=B1 39%  interrupts.CPU24.RES:Rescheduling_interrupts
    134.00 =C2=B1 99%    +134.9%     314.75 =C2=B1 40%      -8.8%     122.2=
5 =C2=B1 64%  interrupts.CPU24.TLB:TLB_shootdowns
      1439 =C2=B1 14%     -29.1%       1019 =C2=B1 26%     +13.4%       163=
2 =C2=B1 41%  interrupts.CPU25.CAL:Function_call_interrupts
      1.50 =C2=B1 57%     -83.3%       0.25 =C2=B1173%     +83.3%       2.7=
5 =C2=B1 69%  interrupts.CPU25.IWI:IRQ_work_interrupts
    605337            +0.1%     605720            -0.1%     604996        i=
nterrupts.CPU25.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.MCP:Machine_check_polls
      6907 =C2=B1 32%     -53.8%       3194 =C2=B1 17%      -3.5%       666=
5 =C2=B1 26%  interrupts.CPU25.NMI:Non-maskable_interrupts
      6907 =C2=B1 32%     -53.8%       3194 =C2=B1 17%      -3.5%       666=
5 =C2=B1 26%  interrupts.CPU25.PMI:Performance_monitoring_interrupts
    170.50 =C2=B1 51%     -56.7%      73.75 =C2=B1 90%      +2.3%     174.5=
0 =C2=B1 55%  interrupts.CPU25.RES:Rescheduling_interrupts
    596.50 =C2=B1 39%     -71.8%     168.00 =C2=B1171%     -26.9%     436.2=
5 =C2=B1 48%  interrupts.CPU25.TLB:TLB_shootdowns
      1776 =C2=B1 99%    +552.0%      11581 =C2=B1139%     -38.6%       109=
0 =C2=B1112%  interrupts.CPU26.35:PCI-MSI.2621441-edge.eth0-TxRx-0
      1073 =C2=B1 28%      -6.9%     999.00 =C2=B1 15%     +10.4%       118=
4 =C2=B1 22%  interrupts.CPU26.CAL:Function_call_interrupts
      0.25 =C2=B1173%      +0.0%       0.25 =C2=B1173%    +100.0%       0.5=
0 =C2=B1173%  interrupts.CPU26.IWI:IRQ_work_interrupts
    605562            -0.0%     605348            -0.1%     605061        i=
nterrupts.CPU26.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.MCP:Machine_check_polls
      2838 =C2=B1 34%     -11.4%       2514 =C2=B1 45%     +34.2%       380=
8 =C2=B1 70%  interrupts.CPU26.NMI:Non-maskable_interrupts
      2838 =C2=B1 34%     -11.4%       2514 =C2=B1 45%     +34.2%       380=
8 =C2=B1 70%  interrupts.CPU26.PMI:Performance_monitoring_interrupts
     40.75 =C2=B1 82%     +13.5%      46.25 =C2=B1 45%     +91.4%      78.0=
0 =C2=B1 65%  interrupts.CPU26.RES:Rescheduling_interrupts
    184.75 =C2=B1171%     -70.1%      55.25 =C2=B1172%     -24.8%     139.0=
0 =C2=B1159%  interrupts.CPU26.TLB:TLB_shootdowns
      2443 =C2=B1 67%     -59.8%     983.00 =C2=B1 92%     -91.7%     202.2=
5 =C2=B1 22%  interrupts.CPU27.36:PCI-MSI.2621442-edge.eth0-TxRx-1
      1414 =C2=B1 15%     +10.0%       1555 =C2=B1  3%      -6.6%       132=
0 =C2=B1 15%  interrupts.CPU27.CAL:Function_call_interrupts
      1.25 =C2=B1 66%     +20.0%       1.50 =C2=B1 33%     -20.0%       1.0=
0 =C2=B1 70%  interrupts.CPU27.IWI:IRQ_work_interrupts
    605320            +0.0%     605518            -0.0%     605084        i=
nterrupts.CPU27.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.MCP:Machine_check_polls
      5815 =C2=B1 40%      +7.8%       6270 =C2=B1 33%     -15.0%       494=
3 =C2=B1 41%  interrupts.CPU27.NMI:Non-maskable_interrupts
      5815 =C2=B1 40%      +7.8%       6270 =C2=B1 33%     -15.0%       494=
3 =C2=B1 41%  interrupts.CPU27.PMI:Performance_monitoring_interrupts
    134.25 =C2=B1 79%     +51.2%     203.00 =C2=B1 35%      +0.0%     134.2=
5 =C2=B1 92%  interrupts.CPU27.RES:Rescheduling_interrupts
    559.75 =C2=B1 58%     +30.7%     731.75 =C2=B1  6%     -21.2%     441.2=
5 =C2=B1 60%  interrupts.CPU27.TLB:TLB_shootdowns
      2792 =C2=B1159%     +64.4%       4590 =C2=B1139%     -93.7%     175.0=
0 =C2=B1  5%  interrupts.CPU28.37:PCI-MSI.2621443-edge.eth0-TxRx-2
      2926 =C2=B1102%     -56.0%       1288 =C2=B1 17%      +8.6%       317=
7 =C2=B1 60%  interrupts.CPU28.CAL:Function_call_interrupts
      0.00       +7.5e+101%       0.75 =C2=B1110% +2.5e+101%       0.25 =C2=
=B1173%  interrupts.CPU28.IWI:IRQ_work_interrupts
    605747            -0.0%     605646            -0.2%     604789        i=
nterrupts.CPU28.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.MCP:Machine_check_polls
      2534 =C2=B1 24%     +52.0%       3852 =C2=B1 73%     -16.3%       212=
1 =C2=B1 56%  interrupts.CPU28.NMI:Non-maskable_interrupts
      2534 =C2=B1 24%     +52.0%       3852 =C2=B1 73%     -16.3%       212=
1 =C2=B1 56%  interrupts.CPU28.PMI:Performance_monitoring_interrupts
    103.75 =C2=B1 65%      -5.3%      98.25 =C2=B1 59%      -6.5%      97.0=
0 =C2=B1 40%  interrupts.CPU28.RES:Rescheduling_interrupts
     21.00 =C2=B1159%   +1695.2%     377.00 =C2=B1 99%    +541.7%     134.7=
5 =C2=B1172%  interrupts.CPU28.TLB:TLB_shootdowns
      5994 =C2=B1 97%     +47.3%       8829 =C2=B1100%     -54.7%       271=
5 =C2=B1 94%  interrupts.CPU29.38:PCI-MSI.2621444-edge.eth0-TxRx-3
      1682 =C2=B1 17%      +5.8%       1780 =C2=B1 25%     -22.7%       130=
0 =C2=B1 19%  interrupts.CPU29.CAL:Function_call_interrupts
      0.75 =C2=B1110%     +66.7%       1.25 =C2=B1 66%     +33.3%       1.0=
0 =C2=B1 70%  interrupts.CPU29.IWI:IRQ_work_interrupts
    605359            -0.1%     604771            -0.1%     604717        i=
nterrupts.CPU29.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.MCP:Machine_check_polls
      3022 =C2=B1 52%     +97.6%       5973 =C2=B1 40%     +63.0%       492=
8 =C2=B1 41%  interrupts.CPU29.NMI:Non-maskable_interrupts
      3022 =C2=B1 52%     +97.6%       5973 =C2=B1 40%     +63.0%       492=
8 =C2=B1 41%  interrupts.CPU29.PMI:Performance_monitoring_interrupts
    169.75 =C2=B1 60%      +1.8%     172.75 =C2=B1 53%     -16.1%     142.5=
0 =C2=B1 74%  interrupts.CPU29.RES:Rescheduling_interrupts
    497.00 =C2=B1 62%      +8.2%     538.00 =C2=B1 57%      -9.7%     449.0=
0 =C2=B1 61%  interrupts.CPU29.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU3.48:PCI-MSI.2623493-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU3.58:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU3.58:PCI-MSI.73728-edge.ioat-msix
      1218 =C2=B1 42%     +28.8%       1569 =C2=B1 71%     -19.7%     978.5=
0 =C2=B1 18%  interrupts.CPU3.CAL:Function_call_interrupts
      0.50 =C2=B1100%    -100.0%       0.00            +0.0%       0.50 =C2=
=B1173%  interrupts.CPU3.IWI:IRQ_work_interrupts
    605231            +0.0%     605343            -0.0%     605090        i=
nterrupts.CPU3.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU3.MCP:Machine_check_polls
      3916 =C2=B1 30%     -45.6%       2130 =C2=B1 32%      -1.1%       387=
5 =C2=B1 68%  interrupts.CPU3.NMI:Non-maskable_interrupts
      3916 =C2=B1 30%     -45.6%       2130 =C2=B1 32%      -1.1%       387=
5 =C2=B1 68%  interrupts.CPU3.PMI:Performance_monitoring_interrupts
    113.50 =C2=B1 95%     -24.0%      86.25 =C2=B1 95%     -27.1%      82.7=
5 =C2=B1139%  interrupts.CPU3.RES:Rescheduling_interrupts
    199.75 =C2=B1161%     -92.2%      15.50 =C2=B1162%     -30.5%     138.7=
5 =C2=B1170%  interrupts.CPU3.TLB:TLB_shootdowns
      2001 =C2=B1 95%    +164.9%       5299 =C2=B1156%    +361.5%       923=
4 =C2=B1169%  interrupts.CPU30.39:PCI-MSI.2621445-edge.eth0-TxRx-4
      1240 =C2=B1 23%    +115.5%       2672 =C2=B1 58%     +78.0%       220=
7 =C2=B1 47%  interrupts.CPU30.CAL:Function_call_interrupts
      0.50 =C2=B1173%     -50.0%       0.25 =C2=B1173%    -100.0%       0.0=
0        interrupts.CPU30.IWI:IRQ_work_interrupts
    605342            +0.0%     605613            -0.1%     604856        i=
nterrupts.CPU30.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.MCP:Machine_check_polls
      3522 =C2=B1 80%     -39.6%       2126 =C2=B1 55%     -17.2%       291=
6 =C2=B1  2%  interrupts.CPU30.NMI:Non-maskable_interrupts
      3522 =C2=B1 80%     -39.6%       2126 =C2=B1 55%     -17.2%       291=
6 =C2=B1  2%  interrupts.CPU30.PMI:Performance_monitoring_interrupts
    133.75 =C2=B1 81%     -31.4%      91.75 =C2=B1 71%     -49.2%      68.0=
0 =C2=B1 86%  interrupts.CPU30.RES:Rescheduling_interrupts
    284.50 =C2=B1107%     -36.7%     180.00 =C2=B1172%     -99.1%       2.5=
0 =C2=B1 82%  interrupts.CPU30.TLB:TLB_shootdowns
    179.25 =C2=B1  5%   +1577.8%       3007 =C2=B1162%    +404.3%     904.0=
0 =C2=B1 84%  interrupts.CPU31.40:PCI-MSI.2621446-edge.eth0-TxRx-5
      1845 =C2=B1 47%      -1.2%       1823 =C2=B1 50%     -30.7%       127=
8 =C2=B1 19%  interrupts.CPU31.CAL:Function_call_interrupts
      1.00 =C2=B1100%     -25.0%       0.75 =C2=B1110%     +25.0%       1.2=
5 =C2=B1 66%  interrupts.CPU31.IWI:IRQ_work_interrupts
    605195            +0.1%     605548            -0.1%     604340        i=
nterrupts.CPU31.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.MCP:Machine_check_polls
      4519 =C2=B1 58%     -28.0%       3254 =C2=B1 37%     +32.8%       600=
0 =C2=B1 39%  interrupts.CPU31.NMI:Non-maskable_interrupts
      4519 =C2=B1 58%     -28.0%       3254 =C2=B1 37%     +32.8%       600=
0 =C2=B1 39%  interrupts.CPU31.PMI:Performance_monitoring_interrupts
    122.50 =C2=B1 90%     +40.6%     172.25 =C2=B1 58%     +64.1%     201.0=
0 =C2=B1 62%  interrupts.CPU31.RES:Rescheduling_interrupts
    400.75 =C2=B1 92%      -8.9%     365.00 =C2=B1100%     +20.9%     484.5=
0 =C2=B1 53%  interrupts.CPU31.TLB:TLB_shootdowns
     18460 =C2=B1136%     -91.0%       1655 =C2=B1153%     -96.4%     666.7=
5 =C2=B1 82%  interrupts.CPU32.41:PCI-MSI.2621447-edge.eth0-TxRx-6
      2238 =C2=B1 72%     +29.5%       2898 =C2=B1 88%     +25.3%       280=
4 =C2=B1 61%  interrupts.CPU32.CAL:Function_call_interrupts
      0.50 =C2=B1173%      +0.0%       0.50 =C2=B1173%     +50.0%       0.7=
5 =C2=B1173%  interrupts.CPU32.IWI:IRQ_work_interrupts
    604687            +0.1%     605543            -0.1%     604237        i=
nterrupts.CPU32.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU32.MCP:Machine_check_polls
      4082 =C2=B1 63%     -22.4%       3167 =C2=B1 94%      -8.6%       373=
2 =C2=B1 64%  interrupts.CPU32.NMI:Non-maskable_interrupts
      4082 =C2=B1 63%     -22.4%       3167 =C2=B1 94%      -8.6%       373=
2 =C2=B1 64%  interrupts.CPU32.PMI:Performance_monitoring_interrupts
    114.50 =C2=B1 96%     -25.3%      85.50 =C2=B1 78%     -32.3%      77.5=
0 =C2=B1 27%  interrupts.CPU32.RES:Rescheduling_interrupts
    190.00 =C2=B1167%      -5.5%     179.50 =C2=B1172%     +31.7%     250.2=
5 =C2=B1104%  interrupts.CPU32.TLB:TLB_shootdowns
    304.75 =C2=B1 56%    +447.1%       1667 =C2=B1133%     +61.5%     492.2=
5 =C2=B1101%  interrupts.CPU33.42:PCI-MSI.2621448-edge.eth0-TxRx-7
      1915 =C2=B1 35%     -25.3%       1431 =C2=B1 16%     +48.5%       284=
4 =C2=B1 85%  interrupts.CPU33.CAL:Function_call_interrupts
      1.50 =C2=B1 57%      +0.0%       1.50 =C2=B1 33%     -33.3%       1.0=
0 =C2=B1 70%  interrupts.CPU33.IWI:IRQ_work_interrupts
    605285            +0.0%     605539            -0.1%     604750        i=
nterrupts.CPU33.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU33.MCP:Machine_check_polls
      5829 =C2=B1 48%      +7.3%       6252 =C2=B1 33%     -16.0%       489=
9 =C2=B1 42%  interrupts.CPU33.NMI:Non-maskable_interrupts
      5829 =C2=B1 48%      +7.3%       6252 =C2=B1 33%     -16.0%       489=
9 =C2=B1 42%  interrupts.CPU33.PMI:Performance_monitoring_interrupts
    132.50 =C2=B1 76%     +34.0%     177.50 =C2=B1 50%     +70.6%     226.0=
0 =C2=B1 51%  interrupts.CPU33.RES:Rescheduling_interrupts
    535.50 =C2=B1 58%      +8.6%     581.50 =C2=B1 45%     -14.5%     457.7=
5 =C2=B1 60%  interrupts.CPU33.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU34.4:IO-APIC.4-edge.ttyS0
      1392 =C2=B1 22%     -25.6%       1036 =C2=B1 27%     -12.7%       121=
6 =C2=B1 18%  interrupts.CPU34.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     -83.3%       0.25 =C2=B1173%     +33.3%       2.0=
0 =C2=B1 93%  interrupts.CPU34.IWI:IRQ_work_interrupts
    605401            +0.0%     605572            -0.1%     604871        i=
nterrupts.CPU34.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU34.MCP:Machine_check_polls
      5969 =C2=B1 25%     -58.5%       2477 =C2=B1 46%     -27.5%       433=
0 =C2=B1 65%  interrupts.CPU34.NMI:Non-maskable_interrupts
      5969 =C2=B1 25%     -58.5%       2477 =C2=B1 46%     -27.5%       433=
0 =C2=B1 65%  interrupts.CPU34.PMI:Performance_monitoring_interrupts
    124.00 =C2=B1 84%     -43.8%      69.75 =C2=B1 92%     -33.7%      82.2=
5 =C2=B1 94%  interrupts.CPU34.RES:Rescheduling_interrupts
      1345 =C2=B1 78%     -86.7%     179.50 =C2=B1172%     -80.3%     264.5=
0 =C2=B1 98%  interrupts.CPU34.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU35.44:PCI-MSI.2623489-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU35.53:PCI-MSI.65536-edge.ioat-msix
      2543 =C2=B1 88%     -48.6%       1306 =C2=B1 19%     -49.1%       129=
4 =C2=B1 19%  interrupts.CPU35.CAL:Function_call_interrupts
      2.00 =C2=B1122%     -37.5%       1.25 =C2=B1 87%     -50.0%       1.0=
0 =C2=B1 70%  interrupts.CPU35.IWI:IRQ_work_interrupts
    605182            +0.1%     605623            -0.1%     604633        i=
nterrupts.CPU35.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU35.MCP:Machine_check_polls
      4367 =C2=B1 66%      +9.1%       4763 =C2=B1 38%      +4.1%       454=
4 =C2=B1 54%  interrupts.CPU35.NMI:Non-maskable_interrupts
      4367 =C2=B1 66%      +9.1%       4763 =C2=B1 38%      +4.1%       454=
4 =C2=B1 54%  interrupts.CPU35.PMI:Performance_monitoring_interrupts
     79.75 =C2=B1 40%     +75.9%     140.25 =C2=B1 72%    +143.3%     194.0=
0 =C2=B1 59%  interrupts.CPU35.RES:Rescheduling_interrupts
    333.00 =C2=B1103%     +47.7%     491.75 =C2=B1 61%     +35.2%     450.2=
5 =C2=B1 60%  interrupts.CPU35.TLB:TLB_shootdowns
      1465 =C2=B1 17%      +0.2%       1467 =C2=B1 24%      -8.1%       134=
6 =C2=B1 27%  interrupts.CPU36.CAL:Function_call_interrupts
      1.25 =C2=B1 66%     -40.0%       0.75 =C2=B1110%     -80.0%       0.2=
5 =C2=B1173%  interrupts.CPU36.IWI:IRQ_work_interrupts
    605624            +0.0%     605649            -0.0%     605407        i=
nterrupts.CPU36.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU36.MCP:Machine_check_polls
      5927 =C2=B1 41%     -29.0%       4209 =C2=B1 61%     -58.2%       247=
9 =C2=B1 45%  interrupts.CPU36.NMI:Non-maskable_interrupts
      5927 =C2=B1 41%     -29.0%       4209 =C2=B1 61%     -58.2%       247=
9 =C2=B1 45%  interrupts.CPU36.PMI:Performance_monitoring_interrupts
    156.50 =C2=B1 59%     -27.6%     113.25 =C2=B1 47%     -53.0%      73.5=
0 =C2=B1 48%  interrupts.CPU36.RES:Rescheduling_interrupts
    427.75 =C2=B1 74%      -7.7%     395.00 =C2=B1 91%     -47.5%     224.5=
0 =C2=B1 80%  interrupts.CPU36.TLB:TLB_shootdowns
      1636 =C2=B1 25%     -16.5%       1366 =C2=B1 20%      +5.2%       172=
2 =C2=B1 49%  interrupts.CPU37.CAL:Function_call_interrupts
      1.00 =C2=B1 70%     -50.0%       0.50 =C2=B1100%     -25.0%       0.7=
5 =C2=B1110%  interrupts.CPU37.IWI:IRQ_work_interrupts
    605311            +0.1%     605639            -0.1%     604977        i=
nterrupts.CPU37.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU37.MCP:Machine_check_polls
      4891 =C2=B1 42%     -34.3%       3214 =C2=B1 33%     -13.9%       421=
1 =C2=B1 61%  interrupts.CPU37.NMI:Non-maskable_interrupts
      4891 =C2=B1 42%     -34.3%       3214 =C2=B1 33%     -13.9%       421=
1 =C2=B1 61%  interrupts.CPU37.PMI:Performance_monitoring_interrupts
    177.50 =C2=B1 47%     -35.1%     115.25 =C2=B1 44%     -27.9%     128.0=
0 =C2=B1 91%  interrupts.CPU37.RES:Rescheduling_interrupts
    429.50 =C2=B1 76%     -18.5%     350.00 =C2=B1 99%     -27.4%     311.7=
5 =C2=B1102%  interrupts.CPU37.TLB:TLB_shootdowns
      1610           +14.6%       1845 =C2=B1 13%     +11.4%       1793 =C2=
=B1 49%  interrupts.CPU38.CAL:Function_call_interrupts
      2.50 =C2=B1 60%     -70.0%       0.75 =C2=B1110%     -50.0%       1.2=
5 =C2=B1173%  interrupts.CPU38.IWI:IRQ_work_interrupts
    605307            +0.0%     605456            -0.0%     605100        i=
nterrupts.CPU38.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU38.MCP:Machine_check_polls
      6011 =C2=B1 39%     -29.9%       4216 =C2=B1 61%     -53.5%       279=
4 =C2=B1  6%  interrupts.CPU38.NMI:Non-maskable_interrupts
      6011 =C2=B1 39%     -29.9%       4216 =C2=B1 61%     -53.5%       279=
4 =C2=B1  6%  interrupts.CPU38.PMI:Performance_monitoring_interrupts
    223.75 =C2=B1 44%     -16.2%     187.50 =C2=B1 48%     -70.8%      65.2=
5 =C2=B1 56%  interrupts.CPU38.RES:Rescheduling_interrupts
    734.00 =C2=B1  9%     -44.9%     404.25 =C2=B1 92%     -83.4%     121.7=
5 =C2=B1122%  interrupts.CPU38.TLB:TLB_shootdowns
      1730 =C2=B1 77%     -20.2%       1381 =C2=B1 21%     -24.5%       130=
6 =C2=B1 20%  interrupts.CPU39.CAL:Function_call_interrupts
      0.00       +7.5e+101%       0.75 =C2=B1110%   +1e+102%       1.00 =C2=
=B1 70%  interrupts.CPU39.IWI:IRQ_work_interrupts
    605466            -0.0%     605451            -0.2%     604258        i=
nterrupts.CPU39.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU39.MCP:Machine_check_polls
      2971 =C2=B1  3%      +9.2%       3245 =C2=B1 36%     +65.0%       490=
3 =C2=B1 42%  interrupts.CPU39.NMI:Non-maskable_interrupts
      2971 =C2=B1  3%      +9.2%       3245 =C2=B1 36%     +65.0%       490=
3 =C2=B1 42%  interrupts.CPU39.PMI:Performance_monitoring_interrupts
     65.50 =C2=B1 51%     +48.9%      97.50 =C2=B1 60%    +205.0%     199.7=
5 =C2=B1 51%  interrupts.CPU39.RES:Rescheduling_interrupts
     22.75 =C2=B1150%   +1487.9%     361.25 =C2=B1 99%   +1949.5%     466.2=
5 =C2=B1 60%  interrupts.CPU39.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU4.49:PCI-MSI.2623494-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU4.59:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU4.59:PCI-MSI.75776-edge.ioat-msix
      1506 =C2=B1  6%     +35.9%       2047 =C2=B1 35%     -14.7%       128=
5 =C2=B1 21%  interrupts.CPU4.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     -66.7%       0.50 =C2=B1100%     +16.7%       1.7=
5 =C2=B1 24%  interrupts.CPU4.IWI:IRQ_work_interrupts
    605289            +0.1%     605622            -0.1%     604911        i=
nterrupts.CPU4.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU4.MCP:Machine_check_polls
      6131 =C2=B1 31%     -49.0%       3129 =C2=B1 36%     +25.6%       769=
8 =C2=B1 14%  interrupts.CPU4.NMI:Non-maskable_interrupts
      6131 =C2=B1 31%     -49.0%       3129 =C2=B1 36%     +25.6%       769=
8 =C2=B1 14%  interrupts.CPU4.PMI:Performance_monitoring_interrupts
    185.50 =C2=B1 61%      +1.1%     187.50 =C2=B1 46%     -12.3%     162.7=
5 =C2=B1 84%  interrupts.CPU4.RES:Rescheduling_interrupts
    722.50 =C2=B1  4%     -52.0%     346.50 =C2=B1100%     -39.2%     439.5=
0 =C2=B1 61%  interrupts.CPU4.TLB:TLB_shootdowns
      1526 =C2=B1  5%     -27.1%       1112 =C2=B1 23%     -27.8%       110=
1 =C2=B1 22%  interrupts.CPU40.CAL:Function_call_interrupts
      1.75 =C2=B1 24%     -71.4%       0.50 =C2=B1100%     -42.9%       1.0=
0 =C2=B1100%  interrupts.CPU40.IWI:IRQ_work_interrupts
    605232            +0.1%     606066            -0.1%     604911        i=
nterrupts.CPU40.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU40.MCP:Machine_check_polls
      7314 =C2=B1 24%     -56.7%       3166 =C2=B1 35%     -33.1%       489=
5 =C2=B1 70%  interrupts.CPU40.NMI:Non-maskable_interrupts
      7314 =C2=B1 24%     -56.7%       3166 =C2=B1 35%     -33.1%       489=
5 =C2=B1 70%  interrupts.CPU40.PMI:Performance_monitoring_interrupts
    193.25 =C2=B1 54%     -40.0%     116.00 =C2=B1 98%     -71.0%      56.0=
0 =C2=B1101%  interrupts.CPU40.RES:Rescheduling_interrupts
    737.75 =C2=B1  4%     -49.1%     375.50 =C2=B1 99%     -64.7%     260.5=
0 =C2=B1 99%  interrupts.CPU40.TLB:TLB_shootdowns
      1666 =C2=B1 63%     -17.9%       1367 =C2=B1 41%     -24.7%       125=
4 =C2=B1 17%  interrupts.CPU41.CAL:Function_call_interrupts
      0.00       +2.5e+101%       0.25 =C2=B1173%   +1e+102%       1.00 =C2=
=B1 70%  interrupts.CPU41.IWI:IRQ_work_interrupts
    605534            -0.0%     605304            -0.1%     604725        i=
nterrupts.CPU41.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU41.MCP:Machine_check_polls
      2161 =C2=B1 32%     +31.4%       2839 =C2=B1 34%     +83.4%       396=
3 =C2=B1 16%  interrupts.CPU41.NMI:Non-maskable_interrupts
      2161 =C2=B1 32%     +31.4%       2839 =C2=B1 34%     +83.4%       396=
3 =C2=B1 16%  interrupts.CPU41.PMI:Performance_monitoring_interrupts
     19.75 =C2=B1111%    +287.3%      76.50 =C2=B1 87%    +932.9%     204.0=
0 =C2=B1 47%  interrupts.CPU41.RES:Rescheduling_interrupts
      6.75 =C2=B1 82%   +2463.0%     173.00 =C2=B1171%   +6366.7%     436.5=
0 =C2=B1 58%  interrupts.CPU41.TLB:TLB_shootdowns
      1349 =C2=B1 20%      +1.8%       1373 =C2=B1 23%     -10.5%       120=
7 =C2=B1 24%  interrupts.CPU42.CAL:Function_call_interrupts
      1.00 =C2=B1 70%     +25.0%       1.25 =C2=B1 66%     -25.0%       0.7=
5 =C2=B1110%  interrupts.CPU42.IWI:IRQ_work_interrupts
    605253            +0.1%     605683            -0.1%     604852        i=
nterrupts.CPU42.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU42.MCP:Machine_check_polls
      4794 =C2=B1 45%     +24.0%       5945 =C2=B1 41%      +3.5%       496=
1 =C2=B1 46%  interrupts.CPU42.NMI:Non-maskable_interrupts
      4794 =C2=B1 45%     +24.0%       5945 =C2=B1 41%      +3.5%       496=
1 =C2=B1 46%  interrupts.CPU42.PMI:Performance_monitoring_interrupts
    122.25 =C2=B1 91%     +35.6%     165.75 =C2=B1 52%      +1.2%     123.7=
5 =C2=B1 85%  interrupts.CPU42.RES:Rescheduling_interrupts
    572.00 =C2=B1 50%      -0.7%     568.25 =C2=B1 57%     -63.4%     209.2=
5 =C2=B1147%  interrupts.CPU42.TLB:TLB_shootdowns
    996.25 =C2=B1 18%     +27.8%       1272 =C2=B1 34%     +34.9%       134=
4 =C2=B1 12%  interrupts.CPU43.CAL:Function_call_interrupts
      0.25 =C2=B1173%      +0.0%       0.25 =C2=B1173%    +400.0%       1.2=
5 =C2=B1 66%  interrupts.CPU43.IWI:IRQ_work_interrupts
    605360            +0.1%     605683            -0.1%     604667        i=
nterrupts.CPU43.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU43.MCP:Machine_check_polls
      2857 =C2=B1 61%     -13.2%       2481 =C2=B1 45%     +75.5%       501=
3 =C2=B1 36%  interrupts.CPU43.NMI:Non-maskable_interrupts
      2857 =C2=B1 61%     -13.2%       2481 =C2=B1 45%     +75.5%       501=
3 =C2=B1 36%  interrupts.CPU43.PMI:Performance_monitoring_interrupts
     27.50 =C2=B1 45%    +155.5%      70.25 =C2=B1 90%    +587.3%     189.0=
0 =C2=B1 61%  interrupts.CPU43.RES:Rescheduling_interrupts
      2.50 =C2=B1 72%   +6860.0%     174.00 =C2=B1171%  +17700.0%     445.0=
0 =C2=B1 60%  interrupts.CPU43.TLB:TLB_shootdowns
      1578           -12.6%       1379 =C2=B1 22%     +64.5%       2596 =C2=
=B1 82%  interrupts.CPU44.CAL:Function_call_interrupts
      1.75 =C2=B1 24%     -14.3%       1.50 =C2=B1 57%     -71.4%       0.5=
0 =C2=B1173%  interrupts.CPU44.IWI:IRQ_work_interrupts
    605345            +0.0%     605519            -0.1%     604690        i=
nterrupts.CPU44.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU44.MCP:Machine_check_polls
      6443 =C2=B1 29%      -7.4%       5966 =C2=B1 47%     -36.2%       411=
1 =C2=B1 61%  interrupts.CPU44.NMI:Non-maskable_interrupts
      6443 =C2=B1 29%      -7.4%       5966 =C2=B1 47%     -36.2%       411=
1 =C2=B1 61%  interrupts.CPU44.PMI:Performance_monitoring_interrupts
    193.50 =C2=B1 54%     -27.6%     140.00 =C2=B1 74%     -49.4%      98.0=
0 =C2=B1 75%  interrupts.CPU44.RES:Rescheduling_interrupts
    746.75 =C2=B1  3%     -27.1%     544.75 =C2=B1 57%     -77.8%     165.5=
0 =C2=B1130%  interrupts.CPU44.TLB:TLB_shootdowns
      1029 =C2=B1 25%     +89.0%       1945 =C2=B1 78%     +43.3%       147=
5 =C2=B1 43%  interrupts.CPU45.CAL:Function_call_interrupts
      0.75 =C2=B1110%     -66.7%       0.25 =C2=B1173%      +0.0%       0.7=
5 =C2=B1110%  interrupts.CPU45.IWI:IRQ_work_interrupts
    605362            +0.0%     605588            -0.1%     604986        i=
nterrupts.CPU45.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU45.MCP:Machine_check_polls
      4517 =C2=B1 56%     -37.2%       2838 =C2=B1 34%      -7.2%       419=
2 =C2=B1 60%  interrupts.CPU45.NMI:Non-maskable_interrupts
      4517 =C2=B1 56%     -37.2%       2838 =C2=B1 34%      -7.2%       419=
2 =C2=B1 60%  interrupts.CPU45.PMI:Performance_monitoring_interrupts
     34.50 =C2=B1 89%    +108.7%      72.00 =C2=B1 94%    +232.6%     114.7=
5 =C2=B1 60%  interrupts.CPU45.RES:Rescheduling_interrupts
    160.50 =C2=B1170%      +8.1%     173.50 =C2=B1170%     +48.6%     238.5=
0 =C2=B1102%  interrupts.CPU45.TLB:TLB_shootdowns
      1580 =C2=B1  2%     -14.8%       1346 =C2=B1 20%     +28.5%       203=
0 =C2=B1 44%  interrupts.CPU46.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     -50.0%       0.75 =C2=B1 57%     -83.3%       0.2=
5 =C2=B1173%  interrupts.CPU46.IWI:IRQ_work_interrupts
    605230            +0.1%     605538            -0.1%     604401        i=
nterrupts.CPU46.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU46.MCP:Machine_check_polls
      5411 =C2=B1 31%     -28.8%       3853 =C2=B1 14%     -46.3%       290=
4 =C2=B1 30%  interrupts.CPU46.NMI:Non-maskable_interrupts
      5411 =C2=B1 31%     -28.8%       3853 =C2=B1 14%     -46.3%       290=
4 =C2=B1 30%  interrupts.CPU46.PMI:Performance_monitoring_interrupts
    194.00 =C2=B1 54%     -19.2%     156.75 =C2=B1 60%     -70.1%      58.0=
0 =C2=B1 40%  interrupts.CPU46.RES:Rescheduling_interrupts
    740.25 =C2=B1  4%     -23.9%     563.25 =C2=B1 57%     -81.4%     137.7=
5 =C2=B1167%  interrupts.CPU46.TLB:TLB_shootdowns
    933.25 =C2=B1 17%      +6.5%     994.25 =C2=B1 20%     +12.3%       104=
8 =C2=B1 22%  interrupts.CPU47.CAL:Function_call_interrupts
      0.75 =C2=B1110%     -33.3%       0.50 =C2=B1173%      +0.0%       0.7=
5 =C2=B1110%  interrupts.CPU47.IWI:IRQ_work_interrupts
    604858            +0.1%     605291            -0.0%     604673        i=
nterrupts.CPU47.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU47.MCP:Machine_check_polls
      4349 =C2=B1 54%      -1.9%       4269 =C2=B1 57%      -1.7%       427=
5 =C2=B1 57%  interrupts.CPU47.NMI:Non-maskable_interrupts
      4349 =C2=B1 54%      -1.9%       4269 =C2=B1 57%      -1.7%       427=
5 =C2=B1 57%  interrupts.CPU47.PMI:Performance_monitoring_interrupts
     75.50 =C2=B1 71%     -16.6%      63.00 =C2=B1 96%     +28.1%      96.7=
5 =C2=B1 78%  interrupts.CPU47.RES:Rescheduling_interrupts
    133.75 =C2=B1139%      +3.9%     139.00 =C2=B1145%     +65.4%     221.2=
5 =C2=B1 79%  interrupts.CPU47.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.50:PCI-MSI.2623495-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.60:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.60:PCI-MSI.77824-edge.ioat-msix
      1235 =C2=B1 22%     -13.6%       1068 =C2=B1 26%     -13.3%       107=
1 =C2=B1 23%  interrupts.CPU5.CAL:Function_call_interrupts
      1.25 =C2=B1 66%     -80.0%       0.25 =C2=B1173%     -60.0%       0.5=
0 =C2=B1100%  interrupts.CPU5.IWI:IRQ_work_interrupts
    605436            +0.0%     605547            -0.1%     604758        i=
nterrupts.CPU5.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.MCP:Machine_check_polls
      6254 =C2=B1 37%     -60.0%       2503 =C2=B1 44%     -41.6%       365=
2 =C2=B1 22%  interrupts.CPU5.NMI:Non-maskable_interrupts
      6254 =C2=B1 37%     -60.0%       2503 =C2=B1 44%     -41.6%       365=
2 =C2=B1 22%  interrupts.CPU5.PMI:Performance_monitoring_interrupts
    124.25 =C2=B1103%     -35.0%      80.75 =C2=B1 73%     -28.0%      89.5=
0 =C2=B1125%  interrupts.CPU5.RES:Rescheduling_interrupts
    254.50 =C2=B1118%    +600.3%       1782 =C2=B1150%     -45.8%     138.0=
0 =C2=B1172%  interrupts.CPU5.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU6.51:PCI-MSI.2623496-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU6.61:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU6.61:PCI-MSI.79872-edge.ioat-msix
      1533 =C2=B1 29%     -11.0%       1364 =C2=B1 20%      -7.1%       142=
4 =C2=B1  6%  interrupts.CPU6.CAL:Function_call_interrupts
      1.25 =C2=B1 66%     -40.0%       0.75 =C2=B1 57%     +60.0%       2.0=
0        interrupts.CPU6.IWI:IRQ_work_interrupts
    605020            +0.1%     605659            -0.0%     604855        i=
nterrupts.CPU6.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU6.MCP:Machine_check_polls
      5949 =C2=B1 41%     -41.1%       3506 =C2=B1 33%     +36.2%       810=
4 =C2=B1  4%  interrupts.CPU6.NMI:Non-maskable_interrupts
      5949 =C2=B1 41%     -41.1%       3506 =C2=B1 33%     +36.2%       810=
4 =C2=B1  4%  interrupts.CPU6.PMI:Performance_monitoring_interrupts
    129.50 =C2=B1 81%     +23.9%     160.50 =C2=B1 60%     +53.9%     199.2=
5 =C2=B1 54%  interrupts.CPU6.RES:Rescheduling_interrupts
    461.25 =C2=B1 69%     +20.0%     553.50 =C2=B1 58%     +27.0%     586.0=
0 =C2=B1 16%  interrupts.CPU6.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU7.62:PCI-MSI.2097152-edge.isci-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU7.62:PCI-MSI.79872-edge.ioat-msix
      1470 =C2=B1 18%     -12.3%       1289 =C2=B1 26%     +38.4%       203=
3 =C2=B1 97%  interrupts.CPU7.CAL:Function_call_interrupts
      0.75 =C2=B1110%      +0.0%       0.75 =C2=B1110%      +0.0%       0.7=
5 =C2=B1110%  interrupts.CPU7.IWI:IRQ_work_interrupts
    605330            +0.0%     605452            -0.1%     604814        i=
nterrupts.CPU7.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU7.MCP:Machine_check_polls
      4480 =C2=B1 51%     -14.1%       3850 =C2=B1 73%      +3.4%       463=
2 =C2=B1 48%  interrupts.CPU7.NMI:Non-maskable_interrupts
      4480 =C2=B1 51%     -14.1%       3850 =C2=B1 73%      +3.4%       463=
2 =C2=B1 48%  interrupts.CPU7.PMI:Performance_monitoring_interrupts
    130.50 =C2=B1 72%     -23.0%     100.50 =C2=B1 52%     -70.5%      38.5=
0 =C2=B1104%  interrupts.CPU7.RES:Rescheduling_interrupts
    365.50 =C2=B1100%     +12.5%     411.25 =C2=B1 90%     -61.4%     141.2=
5 =C2=B1171%  interrupts.CPU7.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU8.22:IO-APIC.22-fasteoi.ehci_hcd:usb1
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU8.63:PCI-MSI.2097152-edge.isci-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU8.64:PCI-MSI.2097152-edge.isci-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU8.67:PCI-MSI.2097152-edge.isci-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU8.73:PCI-MSI.2097152-edge.isci-msix
      1332 =C2=B1 19%      +7.7%       1435 =C2=B1 15%      -2.0%       130=
5 =C2=B1 15%  interrupts.CPU8.CAL:Function_call_interrupts
      1.00 =C2=B1 70%      +0.0%       1.00 =C2=B1 70%     +25.0%       1.2=
5 =C2=B1 66%  interrupts.CPU8.IWI:IRQ_work_interrupts
    605276            +0.0%     605504            -0.1%     604672        i=
nterrupts.CPU8.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU8.MCP:Machine_check_polls
      4586 =C2=B1 53%      +6.1%       4864 =C2=B1 43%     +23.6%       566=
8 =C2=B1 49%  interrupts.CPU8.NMI:Non-maskable_interrupts
      4586 =C2=B1 53%      +6.1%       4864 =C2=B1 43%     +23.6%       566=
8 =C2=B1 49%  interrupts.CPU8.PMI:Performance_monitoring_interrupts
    127.50 =C2=B1 88%     +52.9%     195.00 =C2=B1 35%     +49.6%     190.7=
5 =C2=B1 59%  interrupts.CPU8.RES:Rescheduling_interrupts
    565.25 =C2=B1 57%      -1.1%     558.75 =C2=B1 58%     -14.4%     484.0=
0 =C2=B1 44%  interrupts.CPU8.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU9.20:IO-APIC.20-fasteoi.ehci_hcd:usb2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU9.64:PCI-MSI.79872-edge.ioat-msix
      2520 =C2=B1 94%     +44.6%       3645 =C2=B1 47%     -49.8%       126=
6 =C2=B1 21%  interrupts.CPU9.CAL:Function_call_interrupts
      0.50 =C2=B1173%    +150.0%       1.25 =C2=B1173%      +0.0%       0.5=
0 =C2=B1100%  interrupts.CPU9.IWI:IRQ_work_interrupts
    605454            -0.1%     604785            -0.1%     604718        i=
nterrupts.CPU9.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU9.MCP:Machine_check_polls
      3794 =C2=B1 70%     -41.7%       2210 =C2=B1 35%      -4.2%       363=
5 =C2=B1 40%  interrupts.CPU9.NMI:Non-maskable_interrupts
      3794 =C2=B1 70%     -41.7%       2210 =C2=B1 35%      -4.2%       363=
5 =C2=B1 40%  interrupts.CPU9.PMI:Performance_monitoring_interrupts
    105.75 =C2=B1106%     -40.0%      63.50 =C2=B1 75%     -53.7%      49.0=
0 =C2=B1 52%  interrupts.CPU9.RES:Rescheduling_interrupts
    204.25 =C2=B1154%     -25.2%     152.75 =C2=B1173%     -35.5%     131.7=
5 =C2=B1173%  interrupts.CPU9.TLB:TLB_shootdowns
     47.25 =C2=B1  9%     -13.8%      40.75 =C2=B1  4%      +0.0%      47.2=
5 =C2=B1  7%  interrupts.IWI:IRQ_work_interrupts
  29053273            +0.0%   29064304            -0.1%   29030955        i=
nterrupts.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.MCP:Machine_check_polls
    218408 =C2=B1  9%     -11.2%     193910 =C2=B1  4%      +2.0%     22272=
6 =C2=B1  5%  interrupts.NMI:Non-maskable_interrupts
    218408 =C2=B1  9%     -11.2%     193910 =C2=B1  4%      +2.0%     22272=
6 =C2=B1  5%  interrupts.PMI:Performance_monitoring_interrupts
      5885 =C2=B1 41%      +1.7%       5986 =C2=B1 25%      +2.9%       605=
5 =C2=B1 44%  interrupts.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.RTR:APIC_ICR_read_retries
     19288 =C2=B1  7%      +0.9%      19465 =C2=B1 17%     -25.0%      1447=
4 =C2=B1 13%  interrupts.TLB:TLB_shootdowns


> =

> NOTE! The patch is entirely untested. I verified that the code
> generation now looks sane, and it all looks ObviouslyCorrect(tm) to
> me, but mistakes happen and maybe I missed some detail..
> =

>                Linus


--===============2021974569491563098==--

