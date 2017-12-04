Content-Type: multipart/mixed; boundary="===============9219430228459329786=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/entry/64] 63e02a2a32: will-it-scale.per_process_ops -13.0% regression
Date: Sun, 03 Dec 2017 19:59:56 -0800
Message-ID: <DCCDFE6A-5A11-45FF-83C0-C441AD645F48@amacapital.net>
In-Reply-To: <20171204030240.GX21779@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============9219430228459329786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thomas, has my fix for this landed?

--Andy

> On Dec 3, 2017, at 7:02 PM, kernel test robot <xiaolong.ye@intel.com> w=
rote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -13.0% regression of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit: 63e02a2a3292d8815eac7be438c8c73d72a7bb93 ("x86/entry/64: Create a=
 per-CPU SYSCALL entry trampoline")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: will-it-scale
> on test machine: 32 threads Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz with=
 64G memory
> with following parameters:
> =

>    test: poll1
>    cpufreq_governor: performance
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
----------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops -7.0% r=
egression       |
> | test machine     | 32 threads Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz =
with 64G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                  |
> |                  | test=3Dwriteseek1                                   =
                  |
> +------------------+-----------------------------------------------------=
----------------+
> | testcase: change | aim9: aim9.brk_test.ops_per_sec -9.9% regression    =
                |
> | test machine     | 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz wi=
th 4G memory    |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                  |
> |                  | test=3Dbrk_test                                     =
                  |
> |                  | testtime=3D300s                                     =
                  |
> +------------------+-----------------------------------------------------=
----------------+
> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        bin/lkp install job.yaml  # job file is attached in this email
>        bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>  gcc-7/performance/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/lkp-sb03/=
poll1/will-it-scale
> =

> commit: =

>  955cef1517 ("x86/entry/64: Return to userspace from the trampoline stack=
")
>  63e02a2a32 ("x86/entry/64: Create a per-CPU SYSCALL entry trampoline")
> =

> 955cef1517a1be93 63e02a2a3292d8815eac7be438 =

> ---------------- -------------------------- =

>         %stddev     %change         %stddev
>             \          |                \  =

>   7435674           -13.0%    6465918        will-it-scale.per_process_ops
>   5868564           -10.4%    5256868        will-it-scale.per_thread_ops
>      0.56            +8.0%       0.61 =C2=B1  2%  will-it-scale.scalabili=
ty
>      1947            -2.0%       1908        will-it-scale.time.system_ti=
me
>    562.79            +6.9%     601.69        will-it-scale.time.user_time
>      8.06            +0.8        8.86 =C2=B1  3%  mpstat.cpu.usr%
>      4969 =C2=B1 83%     -84.5%     769.00 =C2=B1  6%  numa-meminfo.node1=
.Inactive(anon)
>    116.75 =C2=B1 63%     +90.1%     222.00 =C2=B1  9%  numa-vmstat.node0.=
nr_mlock
>    116.75 =C2=B1 63%     +90.1%     222.00 =C2=B1  9%  numa-vmstat.node0.=
nr_unevictable
>    116.75 =C2=B1 63%     +90.1%     222.00 =C2=B1  9%  numa-vmstat.node0.=
nr_zone_unevictable
>      1242 =C2=B1 83%     -84.6%     191.25 =C2=B1  6%  numa-vmstat.node1.=
nr_inactive_anon
>      1242 =C2=B1 83%     -84.6%     191.25 =C2=B1  6%  numa-vmstat.node1.=
nr_zone_inactive_anon
>   1414780            +7.7%    1524182 =C2=B1  3%  sched_debug.cfs_rq:/.mi=
n_vruntime.max
>    144.71 =C2=B1 12%     +17.8%     170.42 =C2=B1  2%  sched_debug.cfs_rq=
:/.runnable_load_avg.max
>   -568616           -29.5%    -400842        sched_debug.cfs_rq:/.spread0=
.min
>    202980 =C2=B1 13%     +56.8%     318219 =C2=B1  6%  sched_debug.cpu.av=
g_idle.min
>    173545 =C2=B1  3%     -13.9%     149414 =C2=B1  5%  sched_debug.cpu.av=
g_idle.stddev
> 2.906e+12            -7.9%  2.676e+12        perf-stat.branch-instructions
>      0.01 =C2=B1  2%      +2.0        2.00        perf-stat.branch-miss-r=
ate%
> 2.405e+08        +22170.9%  5.356e+10        perf-stat.branch-misses
>      1.15           +11.6%       1.28        perf-stat.cpi
> 3.659e+12            -9.3%  3.318e+12        perf-stat.dTLB-loads
>      0.00 =C2=B1  6%      +0.0        0.00 =C2=B1  3%  perf-stat.dTLB-sto=
re-miss-rate%
> 2.869e+12            -8.8%  2.616e+12        perf-stat.dTLB-stores
> 1.406e+13            -9.7%   1.27e+13        perf-stat.instructions
>      0.87           -10.4%       0.78        perf-stat.ipc
>     13.72 =C2=B1  2%     -13.7        0.00        perf-profile.calltrace.=
cycles.entry_SYSCALL_64
>     24.53 =C2=B1  2%      -0.2       24.30 =C2=B1  3%  perf-profile.callt=
race.cycles.copy_user_generic_string._copy_from_user.do_sys_poll.sys_poll.e=
ntry_SYSCALL_64_fastpath
>     12.15 =C2=B1  3%      -0.2       11.98 =C2=B1  3%  perf-profile.callt=
race.cycles.__fget_light.do_sys_poll.sys_poll.entry_SYSCALL_64_fastpath
>      9.57 =C2=B1  3%      -0.1        9.48 =C2=B1  4%  perf-profile.callt=
race.cycles.__fget.__fget_light.do_sys_poll.sys_poll.entry_SYSCALL_64_fastp=
ath
>      5.79 =C2=B1  6%      -0.0        5.75 =C2=B1  3%  perf-profile.callt=
race.cycles.fput.do_sys_poll.sys_poll.entry_SYSCALL_64_fastpath
>     32.25 =C2=B1  2%      +1.5       33.78 =C2=B1  3%  perf-profile.callt=
race.cycles._copy_from_user.do_sys_poll.sys_poll.entry_SYSCALL_64_fastpath
>      3.99 =C2=B1  5%      +1.6        5.56 =C2=B1  3%  perf-profile.callt=
race.cycles.__might_fault._copy_from_user.do_sys_poll.sys_poll.entry_SYSCAL=
L_64_fastpath
>     65.36 =C2=B1  2%      +2.0       67.34 =C2=B1  2%  perf-profile.callt=
race.cycles.do_sys_poll.sys_poll.entry_SYSCALL_64_fastpath
>     68.87 =C2=B1  2%      +3.1       72.01 =C2=B1  2%  perf-profile.callt=
race.cycles.sys_poll.entry_SYSCALL_64_fastpath
>      7.33 =C2=B1 35%      +3.7       11.05 =C2=B1 23%  perf-profile.callt=
race.cycles.poll_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.start_s=
econdary
>     71.48 =C2=B1  2%      +3.9       75.41 =C2=B1  2%  perf-profile.callt=
race.cycles.entry_SYSCALL_64_fastpath
>      9.50 =C2=B1 25%      +4.0       13.49 =C2=B1 19%  perf-profile.callt=
race.cycles.cpuidle_enter_state.do_idle.cpu_startup_entry.start_secondary.s=
econdary_startup_64
>     10.06 =C2=B1 23%      +4.0       14.05 =C2=B1 18%  perf-profile.callt=
race.cycles.secondary_startup_64
>      9.66 =C2=B1 24%      +4.0       13.66 =C2=B1 19%  perf-profile.callt=
race.cycles.cpu_startup_entry.start_secondary.secondary_startup_64
>      9.66 =C2=B1 24%      +4.0       13.66 =C2=B1 19%  perf-profile.callt=
race.cycles.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
>      9.66 =C2=B1 24%      +4.0       13.66 =C2=B1 19%  perf-profile.callt=
race.cycles.start_secondary.secondary_startup_64
>      2.25 =C2=B1  3%      +5.4        7.67 =C2=B1  3%  perf-profile.callt=
race.cycles.entry_SYSCALL_64_after_hwframe
>     13.72 =C2=B1  2%     -13.7        0.00        perf-profile.children.c=
ycles.entry_SYSCALL_64
>     24.53 =C2=B1  2%      -0.2       24.31 =C2=B1  3%  perf-profile.child=
ren.cycles.copy_user_generic_string
>     12.16 =C2=B1  3%      -0.2       11.99 =C2=B1  3%  perf-profile.child=
ren.cycles.__fget_light
>      9.57 =C2=B1  3%      -0.1        9.48 =C2=B1  4%  perf-profile.child=
ren.cycles.__fget
>      5.79 =C2=B1  6%      -0.0        5.75 =C2=B1  3%  perf-profile.child=
ren.cycles.fput
>     32.25 =C2=B1  2%      +1.5       33.78 =C2=B1  3%  perf-profile.child=
ren.cycles._copy_from_user
>      3.99 =C2=B1  5%      +1.6        5.56 =C2=B1  3%  perf-profile.child=
ren.cycles.__might_fault
>     65.36 =C2=B1  2%      +2.0       67.34 =C2=B1  2%  perf-profile.child=
ren.cycles.do_sys_poll
>     68.87 =C2=B1  2%      +3.1       72.01 =C2=B1  2%  perf-profile.child=
ren.cycles.sys_poll
>      7.42 =C2=B1 34%      +3.7       11.14 =C2=B1 22%  perf-profile.child=
ren.cycles.poll_idle
>     71.61 =C2=B1  2%      +3.9       75.50 =C2=B1  2%  perf-profile.child=
ren.cycles.entry_SYSCALL_64_fastpath
>      9.88 =C2=B1 23%      +4.0       13.87 =C2=B1 19%  perf-profile.child=
ren.cycles.cpuidle_enter_state
>     10.06 =C2=B1 23%      +4.0       14.05 =C2=B1 18%  perf-profile.child=
ren.cycles.secondary_startup_64
>     10.06 =C2=B1 23%      +4.0       14.05 =C2=B1 18%  perf-profile.child=
ren.cycles.cpu_startup_entry
>      9.66 =C2=B1 24%      +4.0       13.66 =C2=B1 19%  perf-profile.child=
ren.cycles.start_secondary
>     10.06 =C2=B1 23%      +4.0       14.05 =C2=B1 18%  perf-profile.child=
ren.cycles.do_idle
>      2.25 =C2=B1  3%      +5.4        7.67 =C2=B1  3%  perf-profile.child=
ren.cycles.entry_SYSCALL_64_after_hwframe
>     13.72 =C2=B1  2%     -13.7        0.00        perf-profile.self.cycle=
s.entry_SYSCALL_64
>     24.21 =C2=B1  2%      -0.3       23.93 =C2=B1  2%  perf-profile.self.=
cycles.copy_user_generic_string
>      9.47 =C2=B1  3%      -0.1        9.41 =C2=B1  4%  perf-profile.self.=
cycles.__fget
>      5.69 =C2=B1  5%      +0.0        5.71 =C2=B1  3%  perf-profile.self.=
cycles.fput
>     13.55 =C2=B1  4%      +0.7       14.24        perf-profile.self.cycle=
s.do_sys_poll
>      7.41 =C2=B1 34%      +3.7       11.07 =C2=B1 22%  perf-profile.self.=
cycles.poll_idle
>      2.25 =C2=B1  3%      +5.4        7.67 =C2=B1  3%  perf-profile.self.=
cycles.entry_SYSCALL_64_after_hwframe
> =

> =

> =

>                             will-it-scale.per_process_ops                =
      =

> =

>  7.8e+06 +-+-------------------------------------------------------------=
--+   =

>          |. .+.++                              .++.                      =
  |   =

>  7.6e+06 +-+     :                         .+.+    +.+.+.+        +.+    =
  |   =

>          |       :                     .+.+               +      +   +   =
  |   =

>  7.4e+06 +-+      +.+.+.+.++.+.+.+.+.++                    ++.+.+     ++.=
+.|   =

>          |                                                               =
  |   =

>  7.2e+06 +-+                                                             =
  |   =

>          |                                                               =
  |   =

>    7e+06 +-+                                                             =
  |   =

>          |                                                               =
  |   =

>  6.8e+06 +-+                                                             =
  |   =

>          |                                                               =
  |   =

>  6.6e+06 O-+ O OO                    OO O O                              =
  |   =

>          | O      O   O O OO O O O O            OO O O O O O             =
  |   =

>  6.4e+06 +-+--------O-----------------------O-O-------------O------------=
--+   =

> =

> =

>                                perf-stat.instructions                    =
      =

> =

>   1.5e+13 +-+------------------------------------------------------------=
--+   =

>           |                                                              =
  |   =

>  1.45e+13 +-+  +.+                                               .+.     =
  |   =

>           | +.+   +              +.+.+.+.    .+.+.+. +.   .+.++.+   +.   =
  |   =

>           |        +.            :       +.++       +  +.+            ++.=
+.|   =

>   1.4e+13 +-+        +.++.+.+.+.+                                        =
  |   =

>           |                                                              =
  |   =

>  1.35e+13 +-+                                                            =
  |   =

>           |                                                              =
  |   =

>   1.3e+13 +-+                                                            =
  |   =

>           O   OO O   O OO   O          O   O         O   O               =
  |   =

>           | O      O      O   O OO O O   O      O O O  O   O O           =
  |   =

>  1.25e+13 +-+                               O O                          =
  |   =

>           |                                                              =
  |   =

>   1.2e+13 +-+------------------------------------------------------------=
--+   =

> =

> =

>                             perf-stat.branch-instructions                =
      =

> =

>  3.05e+12 +-+------------------------------------------------------------=
--+   =

>     3e+12 +-+                                                     +      =
  |   =

>           |.+.++.+   +                     ++    .+.+ .+.        + +     =
+ |   =

>  2.95e+12 +-+     + + + +.+. .+.   +   +. +  + .+    +   +   +  +   +   :=
 +|   =

>   2.9e+12 +-+      +   +    +   + + + +  +    +           + + :+     +  :=
  |   =

>           |                      +   +                     +  +       ++ =
  |   =

>  2.85e+12 +-+                                                            =
  |   =

>   2.8e+12 +-+                                                            =
  |   =

>  2.75e+12 +-+                                                            =
  |   =

>           |    O                                                         =
  |   =

>   2.7e+12 +-+    O   O                                 O   O O           =
  |   =

>  2.65e+12 O-+ O    O   O    O   O  O   O   O  O O O O                    =
  |   =

>           | O           O O   O  O   O   O           O   O               =
  |   =

>   2.6e+12 +-+                               O                            =
  |   =

>  2.55e+12 +-+------------------------------------------------------------=
--+   =

> =

> =

>                               perf-stat.branch-misses                    =
      =

> =

>  6e+10 +-+---------------------------------------------------------------=
--+   =

>        |     O O  O                            O      O   O O            =
  |   =

>  5e+10 O-O O    O   O O O O O O OO O O O O O O   OO O   O                =
  |   =

>        |                                                                 =
  |   =

>        |                                                                 =
  |   =

>  4e+10 +-+                                                               =
  |   =

>        |                                                                 =
  |   =

>  3e+10 +-+                                                               =
  |   =

>        |                                                                 =
  |   =

>  2e+10 +-+                                                               =
  |   =

>        |                                                                 =
  |   =

>        |                                                                 =
  |   =

>  1e+10 +-+                                                               =
  |   =

>        |                                                                 =
  |   =

>      0 +-+---------------------------------------------------------------=
--+   =

> =

> =

>                                 perf-stat.dTLB-stores                    =
      =

> =

>  3.2e+12 +-+-------------------------------------------------------------=
--+   =

>          |                         +  +                     +   +        =
  |   =

>  3.1e+12 +-+                      + + :                     :+ +:        =
  |   =

>          |                       +   + :                   +  +  :       =
  |   =

>    3e+12 +-+                     :     :                   :     :       =
  |   =

>          |.                     :      :                  :       :      =
+ |   =

>  2.9e+12 +-+.+.++.              :       :     +.+   .+.   :       +. .+ :=
 +|   =

>          |        +.+. .+.++.+.:        +.   +   :.+   +.:          +  ::=
  |   =

>  2.8e+12 +-+          +        +          +.+    +       +             + =
  |   =

>          |                                                               =
  |   =

>  2.7e+12 +-+                                                             =
  |   =

>          O     OO   O      O                         O O                 =
  |   =

>  2.6e+12 +-O O    O   O O O           O   O     OO O     O OO            =
  |   =

>          |                   O O O O O  O   O O                          =
  |   =

>  2.5e+12 +-+-------------------------------------------------------------=
--+   =

> =

> =

>                            perf-stat.branch-miss-rate_                   =
      =

> =

>  2.5 +-+-----------------------------------------------------------------=
--+   =

>      |                                                                   =
  |   =

>      |                                                                   =
  |   =

>    2 O-O O O O O O O O OO O O O O O O O O O O O O O O O O OO             =
  |   =

>      |                                                                   =
  |   =

>      |                                                                   =
  |   =

>  1.5 +-+                                                                 =
  |   =

>      |                                                                   =
  |   =

>    1 +-+                                                                 =
  |   =

>      |                                                                   =
  |   =

>      |                                                                   =
  |   =

>  0.5 +-+                                                                 =
  |   =

>      |                                                                   =
  |   =

>      |                                                                   =
  |   =

>    0 +-+-----------------------------------------------------------------=
--+   =

> =

> =

>                                   perf-stat.ipc                          =
      =

> =

>  0.92 +-+----------------------------------------------------------------=
--+   =

>       |                                                                  =
  |   =

>   0.9 +-+.+.                   +. .+.        .+.          +. .+.         =
  |   =

>  0.88 +-+   +.                +  +   +.   +.+   +. .+.   +  +   + .+.    =
  |   =

>       |       +.   +.       .+         +.+        +   +.+        +   +. .=
+.|   =

>  0.86 +-+       +.+  +.+.+.+                                           + =
  |   =

>       |                                                                  =
  |   =

>  0.84 +-+                                                                =
  |   =

>       |                                                                  =
  |   =

>  0.82 +-+                                                                =
  |   =

>   0.8 +-+                          O O O O                               =
  |   =

>       |           O  O                              O O                  =
  |   =

>  0.78 +-O O O O O  O   O O   O   O            O O         O O            =
  |   =

>       O                    O   O          O O     O     O                =
  |   =

>  0.76 +-+----------------------------------------------------------------=
--+   =

> =

> =

>                                   perf-stat.cpi                          =
      =

> =

>   1.3 +-+---------------------------------O-O----------------------------=
--+   =

>  1.28 O-+          O       O O O O                O     O O O            =
  |   =

>       | O O O O O O  O O O                    O O     O                  =
  |   =

>  1.26 +-+                                           O                    =
  |   =

>  1.24 +-+                          O O O O                               =
  |   =

>       |                                                                  =
  |   =

>  1.22 +-+                                                                =
  |   =

>   1.2 +-+                                                                =
  |   =

>  1.18 +-+                                                                =
  |   =

>       |                                                                  =
  |   =

>  1.16 +-+      .+.+ .+.+.+.+.           .+                            .+.=
  |   =

>  1.14 +-+    .+    +         +        .+  +.     .+. .+.+        +. .+   =
+.|   =

>       |.+. .+                 + .+. .+      +. .+   +    + .+. .+  +     =
  |   =

>  1.12 +-+ +                    +   +          +           +   +          =
  |   =

>   1.1 +-+----------------------------------------------------------------=
--+   =

> =

> =

>                           will-it-scale.time.user_time                   =
      =

> =

>  620 +-+-----------------------------------------------------------------=
--+   =

>  610 +-+       O O                                                       =
  |   =

>      O O O O O     O O OO           O   O O O       O      O             =
  |   =

>  600 +-+                  O O O O O   O       O O O   O O O              =
  |   =

>  590 +-+                                                                 =
  |   =

>      |                                                                   =
  |   =

>  580 +-+                                                                 =
  |   =

>  570 +-+                                                                 =
  |   =

>  560 +-+                                                             +.+.=
+.|   =

>      |                                                               :   =
  |   =

>  550 +-+.+.+.+.                        .+        .+.+.              :    =
  |   =

>  540 +-+       +.+.                   +  +   .+.+     +.+        +. :    =
  |   =

>      |             +.+.++.+.+.       +    +.+            +      +  +     =
  |   =

>  530 +-+                      +.+.+.+                     ++.+.+         =
  |   =

>  520 +-+-----------------------------------------------------------------=
--+   =

> =

> =

> [*] bisect-good sample
> [O] bisect-bad  sample
> =

> *************************************************************************=
**************************
> lkp-sb03: 32 threads Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz with 64G me=
mory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>  gcc-7/performance/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/lkp-sb03/=
writeseek1/will-it-scale
> =

> commit: =

>  955cef1517 ("x86/entry/64: Return to userspace from the trampoline stack=
")
>  63e02a2a32 ("x86/entry/64: Create a per-CPU SYSCALL entry trampoline")
> =

> 955cef1517a1be93 63e02a2a3292d8815eac7be438 =

> ---------------- -------------------------- =

>         %stddev     %change         %stddev
>             \          |                \  =

>   1902014            -7.0%    1768039        will-it-scale.per_process_ops
>   1557647            -6.3%    1459046        will-it-scale.per_thread_ops
>      0.52            +4.0%       0.54        will-it-scale.scalability
>      2293            -1.8%       2251        will-it-scale.time.system_ti=
me
>    216.11           +19.7%     258.70        will-it-scale.time.user_time
> 1.453e+08 =C2=B1  6%     +21.7%  1.769e+08 =C2=B1  9%  cpuidle.POLL.time
>      3.43            +0.8        4.26        mpstat.cpu.usr%
>    284863 =C2=B1  6%     +12.9%     321561 =C2=B1  3%  softirqs.RCU
>      7178 =C2=B1  6%     -11.3%       6368        slabinfo.kmalloc-96.act=
ive_objs
>      7218 =C2=B1  5%     -10.6%       6450        slabinfo.kmalloc-96.num=
_objs
>     72.27 =C2=B1  6%     +19.5%      86.39 =C2=B1  7%  sched_debug.cfs_rq=
:/.load_avg.avg
>    107.67 =C2=B1  3%     +31.1%     141.11 =C2=B1 19%  sched_debug.cfs_rq=
:/.load_avg.stddev
>     50035 =C2=B1 23%     +17.3%      58672 =C2=B1 24%  sched_debug.cpu.lo=
ad.stddev
>      7.58 =C2=B1 21%     +65.4%      12.54 =C2=B1 11%  sched_debug.cpu.nr=
_uninterruptible.max
> 3.143e+12            -4.7%  2.995e+12        perf-stat.branch-instructions
>      0.01 =C2=B1  2%      +1.0        0.97        perf-stat.branch-miss-r=
ate%
> 3.791e+08 =C2=B1  3%   +7525.5%  2.891e+10        perf-stat.branch-misses
>  2.54e+08            +1.0%  2.566e+08        perf-stat.cache-misses
>      1.03            +6.3%       1.10        perf-stat.cpi
> 6.671e+12            -4.7%  6.361e+12        perf-stat.dTLB-loads
> 4.722e+12            -5.0%  4.485e+12        perf-stat.dTLB-stores
>     35.63 =C2=B1 12%     -29.7        5.89 =C2=B1 20%  perf-stat.iTLB-loa=
d-miss-rate%
> 8.119e+08 =C2=B1  8%    +829.8%  7.549e+09 =C2=B1  2%  perf-stat.iTLB-loa=
ds
> 1.563e+13            -5.3%   1.48e+13        perf-stat.instructions
>      0.97            -5.9%       0.91        perf-stat.ipc
>      5.97            -6.0        0.00        perf-profile.calltrace.cycle=
s.entry_SYSCALL_64
>      7.43 =C2=B1  2%      -0.1        7.29 =C2=B1  3%  perf-profile.callt=
race.cycles.find_lock_entry.shmem_getpage_gfp.shmem_write_begin.generic_per=
form_write.__generic_file_write_iter
>      9.10 =C2=B1  2%      -0.1        9.00 =C2=B1  3%  perf-profile.callt=
race.cycles.shmem_getpage_gfp.shmem_write_begin.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter
>      9.43 =C2=B1  2%      -0.1        9.33 =C2=B1  3%  perf-profile.callt=
race.cycles.shmem_write_begin.generic_perform_write.__generic_file_write_it=
er.generic_file_write_iter.__vfs_write
>     19.45            -0.1       19.39 =C2=B1  2%  perf-profile.calltrace.=
cycles.copyin.iov_iter_copy_from_user_atomic.generic_perform_write.__generi=
c_file_write_iter.generic_file_write_iter
>     19.14            -0.0       19.10        perf-profile.calltrace.cycle=
s.copy_user_generic_string.copyin.iov_iter_copy_from_user_atomic.generic_pe=
rform_write.__generic_file_write_iter
>     21.14            +0.0       21.15 =C2=B1  2%  perf-profile.calltrace.=
cycles.iov_iter_copy_from_user_atomic.generic_perform_write.__generic_file_=
write_iter.generic_file_write_iter.__vfs_write
>      9.16 =C2=B1 10%      +0.0        9.20 =C2=B1 41%  perf-profile.callt=
race.cycles.poll_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.start_s=
econdary
>     41.59            +0.1       41.71 =C2=B1  2%  perf-profile.calltrace.=
cycles.generic_perform_write.__generic_file_write_iter.generic_file_write_i=
ter.__vfs_write.vfs_write
>     11.09 =C2=B1  8%      +0.2       11.24 =C2=B1 31%  perf-profile.callt=
race.cycles.cpuidle_enter_state.do_idle.cpu_startup_entry.start_secondary.s=
econdary_startup_64
>     11.21 =C2=B1  8%      +0.2       11.37 =C2=B1 31%  perf-profile.callt=
race.cycles.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
>     11.21 =C2=B1  8%      +0.2       11.37 =C2=B1 31%  perf-profile.callt=
race.cycles.cpu_startup_entry.start_secondary.secondary_startup_64
>     11.21 =C2=B1  8%      +0.2       11.37 =C2=B1 31%  perf-profile.callt=
race.cycles.start_secondary.secondary_startup_64
>     11.68 =C2=B1  7%      +0.2       11.90 =C2=B1 27%  perf-profile.callt=
race.cycles.secondary_startup_64
>     45.10            +0.3       45.37 =C2=B1  2%  perf-profile.calltrace.=
cycles.__generic_file_write_iter.generic_file_write_iter.__vfs_write.vfs_wr=
ite.sys_write
>     51.69            +0.3       52.02 =C2=B1  2%  perf-profile.calltrace.=
cycles.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
>     50.28            +0.4       50.63 =C2=B1  2%  perf-profile.calltrace.=
cycles.generic_file_write_iter.__vfs_write.vfs_write.sys_write.entry_SYSCAL=
L_64_fastpath
>     61.80            +0.8       62.60 =C2=B1  3%  perf-profile.calltrace.=
cycles.vfs_write.sys_write.entry_SYSCALL_64_fastpath
>      4.92            +0.9        5.80 =C2=B1  5%  perf-profile.calltrace.=
cycles.__fdget_pos.sys_lseek.entry_SYSCALL_64_fastpath
>      4.96            +0.9        5.86 =C2=B1  3%  perf-profile.calltrace.=
cycles.__fdget_pos.sys_write.entry_SYSCALL_64_fastpath
>      8.74            +1.0        9.75 =C2=B1  6%  perf-profile.calltrace.=
cycles.sys_lseek.entry_SYSCALL_64_fastpath
>     69.88            +1.6       71.49 =C2=B1  3%  perf-profile.calltrace.=
cycles.sys_write.entry_SYSCALL_64_fastpath
>     80.00            +2.9       82.90 =C2=B1  3%  perf-profile.calltrace.=
cycles.entry_SYSCALL_64_fastpath
>      5.97            -6.0        0.00        perf-profile.children.cycles=
.entry_SYSCALL_64
>      7.43 =C2=B1  2%      -0.1        7.29 =C2=B1  3%  perf-profile.child=
ren.cycles.find_lock_entry
>      9.10 =C2=B1  2%      -0.1        9.00 =C2=B1  3%  perf-profile.child=
ren.cycles.shmem_getpage_gfp
>      9.43 =C2=B1  2%      -0.1        9.33 =C2=B1  3%  perf-profile.child=
ren.cycles.shmem_write_begin
>     19.45            -0.1       19.39 =C2=B1  2%  perf-profile.children.c=
ycles.copyin
>     19.14            -0.0       19.11        perf-profile.children.cycles=
.copy_user_generic_string
>     21.14            +0.0       21.15 =C2=B1  2%  perf-profile.children.c=
ycles.iov_iter_copy_from_user_atomic
>      9.46 =C2=B1  9%      +0.1        9.56 =C2=B1 36%  perf-profile.child=
ren.cycles.poll_idle
>     41.60            +0.1       41.72 =C2=B1  2%  perf-profile.children.c=
ycles.generic_perform_write
>     11.21 =C2=B1  8%      +0.2       11.37 =C2=B1 31%  perf-profile.child=
ren.cycles.start_secondary
>     11.56 =C2=B1  7%      +0.2       11.76 =C2=B1 27%  perf-profile.child=
ren.cycles.cpuidle_enter_state
>     11.69 =C2=B1  7%      +0.2       11.90 =C2=B1 27%  perf-profile.child=
ren.cycles.do_idle
>     11.68 =C2=B1  7%      +0.2       11.90 =C2=B1 27%  perf-profile.child=
ren.cycles.secondary_startup_64
>     11.68 =C2=B1  7%      +0.2       11.90 =C2=B1 27%  perf-profile.child=
ren.cycles.cpu_startup_entry
>     45.10            +0.3       45.37 =C2=B1  2%  perf-profile.children.c=
ycles.__generic_file_write_iter
>     51.72            +0.3       52.03 =C2=B1  2%  perf-profile.children.c=
ycles.__vfs_write
>     50.28            +0.4       50.63 =C2=B1  2%  perf-profile.children.c=
ycles.generic_file_write_iter
>     61.84            +0.8       62.62 =C2=B1  3%  perf-profile.children.c=
ycles.vfs_write
>      8.74            +1.0        9.75 =C2=B1  6%  perf-profile.children.c=
ycles.sys_lseek
>      3.81            +1.6        5.38 =C2=B1  5%  perf-profile.children.c=
ycles.__fget_light
>     69.93            +1.6       71.50 =C2=B1  3%  perf-profile.children.c=
ycles.sys_write
>      9.88            +1.8       11.67 =C2=B1  3%  perf-profile.children.c=
ycles.__fdget_pos
>     80.23            +2.7       82.94 =C2=B1  3%  perf-profile.children.c=
ycles.entry_SYSCALL_64_fastpath
>      5.97            -6.0        0.00        perf-profile.self.cycles.ent=
ry_SYSCALL_64
>     18.93            -0.1       18.84 =C2=B1  2%  perf-profile.self.cycle=
s.copy_user_generic_string
>      9.39 =C2=B1  8%      +0.0        9.42 =C2=B1 35%  perf-profile.self.=
cycles.poll_idle
> =

> =

> =

> *************************************************************************=
**************************
> lkp-ivb-d03: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G me=
mory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtim=
e:
>  gcc-7/performance/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/lkp-ivb-d=
03/brk_test/aim9/300s
> =

> commit: =

>  955cef1517 ("x86/entry/64: Return to userspace from the trampoline stack=
")
>  63e02a2a32 ("x86/entry/64: Create a per-CPU SYSCALL entry trampoline")
> =

> 955cef1517a1be93 63e02a2a3292d8815eac7be438 =

> ---------------- -------------------------- =

>         %stddev     %change         %stddev
>             \          |                \  =

>   4124214            -9.9%    3717599        aim9.brk_test.ops_per_sec
>    272.29            -4.9%     259.03        aim9.time.system_time
>     27.71           +47.2%      40.78        aim9.time.user_time
>     12605 =C2=B1  9%     -27.0%       9203 =C2=B1 10%  cpuidle.POLL.usage
>      3.24 =C2=B1  2%      +1.4        4.62        mpstat.cpu.usr%
>      4007 =C2=B1  3%      -9.2%       3639 =C2=B1  4%  slabinfo.anon_vma_=
chain.num_objs
>      9.80            -1.9%       9.61        turbostat.CorWatt
>     30309            -1.3%      29929        vmstat.system.cs
>     18905            -1.1%      18689        vmstat.system.in
>    716.67 =C2=B1 11%     -22.7%     554.33 =C2=B1  6%  sched_debug.cfs_rq=
:/.load_avg.avg
>      1.00 =C2=B1 11%     -79.2%       0.21 =C2=B1173%  sched_debug.cfs_rq=
:/.nr_spread_over.min
>      0.45 =C2=B1 55%     +70.3%       0.76 =C2=B1 19%  sched_debug.cfs_rq=
:/.nr_spread_over.stddev
>    521.82 =C2=B1  3%     -10.2%     468.57 =C2=B1  2%  sched_debug.cfs_rq=
:/.util_avg.avg
>      1.96 =C2=B1  7%     +34.0%       2.62 =C2=B1  9%  sched_debug.cpu.nr=
_running.max
>      0.68 =C2=B1 15%     +42.9%       0.98 =C2=B1 15%  sched_debug.cpu.nr=
_running.stddev
>      0.06 =C2=B1 19%      +0.9        0.92        perf-stat.branch-miss-r=
ate%
> 3.583e+08 =C2=B1  5%   +1125.0%  4.389e+09 =C2=B1 28%  perf-stat.branch-m=
isses
>   9163065            -1.8%    8997254        perf-stat.context-switches
>      0.56 =C2=B1  2%     +12.8%       0.63 =C2=B1  4%  perf-stat.cpi
>      0.06 =C2=B1132%      +0.2        0.23 =C2=B1  6%  perf-stat.dTLB-loa=
d-miss-rate%
> 4.062e+08 =C2=B1142%    +234.1%  1.357e+09 =C2=B1  8%  perf-stat.dTLB-loa=
d-misses
>   9061724 =C2=B1 12%     +22.0%   11056158 =C2=B1  6%  perf-stat.dTLB-sto=
re-misses
>     11.72 =C2=B1 24%      -6.6        5.08 =C2=B1 33%  perf-stat.iTLB-loa=
d-miss-rate%
>   4.4e+08 =C2=B1 29%    +135.5%  1.036e+09 =C2=B1 23%  perf-stat.iTLB-loa=
ds
>      1.80 =C2=B1  2%     -11.2%       1.60 =C2=B1  3%  perf-stat.ipc
>     14.11 =C2=B1 88%      -2.6       11.50 =C2=B1 86%  perf-profile.callt=
race.cycles-pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_secondar=
y.secondary_startup_64
>     14.22 =C2=B1 88%      -2.6       11.63 =C2=B1 85%  perf-profile.callt=
race.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_=
64
>     14.22 =C2=B1 88%      -2.6       11.63 =C2=B1 85%  perf-profile.callt=
race.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>     14.22 =C2=B1 88%      -2.6       11.63 =C2=B1 85%  perf-profile.callt=
race.cycles-pp.start_secondary.secondary_startup_64
>     12.86 =C2=B1 92%      -2.4       10.45 =C2=B1 97%  perf-profile.callt=
race.cycles-pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.sta=
rt_secondary
>     45.20 =C2=B1  3%      -1.4       43.82        perf-profile.calltrace.=
cycles-pp.do_brk_flags.sys_brk.entry_SYSCALL_64_fastpath
>     16.60 =C2=B1  3%      -0.9       15.74 =C2=B1  3%  perf-profile.callt=
race.cycles-pp.vma_merge.do_brk_flags.sys_brk.entry_SYSCALL_64_fastpath
>     56.05 =C2=B1  2%      -0.8       55.25        perf-profile.calltrace.=
cycles-pp.entry_SYSCALL_64_fastpath
>     14.60 =C2=B1  3%      -0.7       13.88 =C2=B1  2%  perf-profile.callt=
race.cycles-pp.__vma_adjust.vma_merge.do_brk_flags.sys_brk.entry_SYSCALL_64=
_fastpath
>     54.84 =C2=B1  3%      -0.7       54.15        perf-profile.calltrace.=
cycles-pp.sys_brk.entry_SYSCALL_64_fastpath
>     11.52 =C2=B1  9%      -0.1       11.46        perf-profile.calltrace.=
cycles-pp.perf_event_mmap.do_brk_flags.sys_brk.entry_SYSCALL_64_fastpath
>      6.30 =C2=B1  5%      +0.2        6.48 =C2=B1  3%  perf-profile.callt=
race.cycles-pp.security_vm_enough_memory_mm.do_brk_flags.sys_brk.entry_SYSC=
ALL_64_fastpath
>     27.40 =C2=B1  3%      +0.8       28.18 =C2=B1  4%  perf-profile.callt=
race.cycles-pp.secondary_startup_64
>     12.40 =C2=B1 94%      +3.3       15.73 =C2=B1 62%  perf-profile.callt=
race.cycles-pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.sta=
rt_kernel
>     13.18 =C2=B1 88%      +3.4       16.55 =C2=B1 57%  perf-profile.callt=
race.cycles-pp.do_idle.cpu_startup_entry.start_kernel.secondary_startup_64
>     13.18 =C2=B1 88%      +3.4       16.55 =C2=B1 57%  perf-profile.callt=
race.cycles-pp.cpu_startup_entry.start_kernel.secondary_startup_64
>     13.18 =C2=B1 88%      +3.4       16.55 =C2=B1 57%  perf-profile.callt=
race.cycles-pp.start_kernel.secondary_startup_64
>     13.14 =C2=B1 88%      +3.4       16.53 =C2=B1 57%  perf-profile.callt=
race.cycles-pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_kernel.s=
econdary_startup_64
>     14.22 =C2=B1 88%      -2.6       11.63 =C2=B1 85%  perf-profile.child=
ren.cycles-pp.start_secondary
>     45.83 =C2=B1  3%      -1.2       44.59        perf-profile.children.c=
ycles-pp.do_brk_flags
>     56.30 =C2=B1  2%      -0.9       55.36        perf-profile.children.c=
ycles-pp.entry_SYSCALL_64_fastpath
>     17.05 =C2=B1  3%      -0.8       16.24 =C2=B1  3%  perf-profile.child=
ren.cycles-pp.vma_merge
>     15.45 =C2=B1  3%      -0.7       14.79 =C2=B1  2%  perf-profile.child=
ren.cycles-pp.__vma_adjust
>     55.47 =C2=B1  3%      -0.6       54.88        perf-profile.children.c=
ycles-pp.sys_brk
>     12.21 =C2=B1  8%      -0.1       12.08        perf-profile.children.c=
ycles-pp.perf_event_mmap
>      6.40 =C2=B1  5%      +0.2        6.57 =C2=B1  3%  perf-profile.child=
ren.cycles-pp.security_vm_enough_memory_mm
>     27.41 =C2=B1  3%      +0.8       28.19 =C2=B1  4%  perf-profile.child=
ren.cycles-pp.do_idle
>     27.30 =C2=B1  3%      +0.8       28.07 =C2=B1  4%  perf-profile.child=
ren.cycles-pp.cpuidle_enter_state
>     27.40 =C2=B1  3%      +0.8       28.18 =C2=B1  4%  perf-profile.child=
ren.cycles-pp.secondary_startup_64
>     27.40 =C2=B1  3%      +0.8       28.18 =C2=B1  4%  perf-profile.child=
ren.cycles-pp.cpu_startup_entry
>     25.27            +0.9       26.19        perf-profile.children.cycles=
-pp.intel_idle
>     13.18 =C2=B1 88%      +3.4       16.55 =C2=B1 57%  perf-profile.child=
ren.cycles-pp.start_kernel
>      4.82 =C2=B1  9%      +0.0        4.83 =C2=B1  5%  perf-profile.self.=
cycles-pp.__vma_adjust
>      5.25 =C2=B1  9%      +0.0        5.29 =C2=B1  2%  perf-profile.self.=
cycles-pp.perf_event_mmap
>      5.33 =C2=B1  3%      +0.4        5.75 =C2=B1  3%  perf-profile.self.=
cycles-pp.do_brk_flags
>     25.26            +0.9       26.19        perf-profile.self.cycles-pp.=
intel_idle
> =

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

> Thanks,
> Xiaolong
> <config-4.14.0-01234-g63e02a2>
> <job.yaml>
> <reproduce>

--===============9219430228459329786==--

