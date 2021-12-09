Content-Type: multipart/mixed; boundary="===============1071951870013098722=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/signal] 3aac3ebea0: will-it-scale.per_thread_ops -11.9% regression
Date: Thu, 09 Dec 2021 10:30:33 +0800
Message-ID: <20211209023032.GA8503@linux.intel.com>
In-Reply-To: <87bl1s357p.ffs@tglx>
List-Id: <oe-lkp.lists.linux.dev>

--===============1071951870013098722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, Dec 07, 2021 at 02:38:34PM +0100, Thomas Gleixner wrote:
> Hi!
> =

> On Tue, Dec 07 2021 at 09:21, kernel test robot wrote:
> =

> > (please be noted we made some further analysis before reporting out,
> > and thought it's likely the regression is related with the extra spinlo=
ck
> > introducded by enalbling DYNAMIC_SIGFRAME. below is the full report.)
> >
> > FYI, we noticed a -11.9% regression of will-it-scale.per_thread_ops due=
 to commit:
> =

> Does that use sigaltstack() ?
> =

> > 1bdda24c4af64cd2 3aac3ebea08f2d342364f827c89 =

> > ---------------- --------------------------- =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >     754824 =C2=B1  2%     -11.9%     664668 =C2=B1  2%  will-it-scale.1=
6.threads
> >      47176 =C2=B1  2%     -11.9%      41541 =C2=B1  2%  will-it-scale.p=
er_thread_ops
> >     754824 =C2=B1  2%     -11.9%     664668 =C2=B1  2%  will-it-scale.w=
orkload
> >    1422782 =C2=B1  8%  +3.3e+05     1751520 =C2=B1 12%  syscalls.sys_ge=
tpid.noise.5%
> =

> Somehow the printout got confused ...
> =

> >  1.583e+10            -2.1%   1.55e+10        perf-stat.i.instructions
> >    6328594 =C2=B1  2%     +11.1%    7032338 =C2=B1  2%  perf-stat.overa=
ll.path-length
> >  1.578e+10            -2.1%  1.545e+10        perf-stat.ps.instructions
> >  4.774e+12            -2.2%  4.671e+12        perf-stat.total.instructi=
ons
> >       0.00            +6.3        6.33 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.do_sigalts=
tack.restore_altstack.__x64_sys_rt_sigreturn
> >       0.00            +6.5        6.51 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp._raw_spin_lock_irq.do_sigaltstack.restore_altstack.__x64_sys_r=
t_sigreturn.do_syscall_64
> >       0.00            +6.6        6.58 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.do_sigaltstack.restore_altstack.__x64_sys_rt_sigreturn.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe
> >       0.00            +6.6        6.62 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SY=
SCALL_64_after_hwframe.raise
> >       0.00            +6.9        6.88 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.raise
> >       7.99 =C2=B1 12%      +6.0       14.00 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.__x64_sys_rt_sigreturn
> >       0.05 =C2=B1 44%      +6.6        6.62 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.restore_altstack
> >       0.00            +6.6        6.58 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.do_sigaltstack
> =

> It looks like it does. The problem is that sighand->lock is process
> wide.
> =

> Can you test whether the below cures it?
> =


We applied your patch upon mainline commit 2a987e6502 ("Merge tag =

'perf-tools-fixes-for-v5.16-2021-12-07' of =

git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux"), it will bring 9=
% =

improvement. Thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/thread/16/debian-10.4-x86_64-20200603.c=
gz/lkp-hsw-4ex1/signal1/will-it-scale/0x16

commit: =

  2a987e6502 ("Merge tag 'perf-tools-fixes-for-v5.16-2021-12-07' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/acme/linux")
  fceec50b60 ("fixup-for-2a987e6502")

2a987e65025e2b79 fceec50b600c90a3a3ac3406c03 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    660062 =C2=B1  2%      +9.0%     719344        will-it-scale.16.threads
     41253 =C2=B1  2%      +9.0%      44958        will-it-scale.per_thread=
_ops
    660062 =C2=B1  2%      +9.0%     719344        will-it-scale.workload
     38126 =C2=B1 35%      -6.2%      35753 =C2=B1 12%  syscalls.sys_getpid=
.max
    347.25            -0.4%     346.00        syscalls.sys_getpid.med
    324.00            -0.2%     323.50        syscalls.sys_getpid.min
    866263 =C2=B1  7%  -44781.2      821482 =C2=B1 10%  syscalls.sys_getpid=
.noise.100%
   1916161 =C2=B1  5%  -64520.2     1851640 =C2=B1  4%  syscalls.sys_getpid=
.noise.2%
   1268029 =C2=B1  5%  -50154.5     1217875 =C2=B1  7%  syscalls.sys_getpid=
.noise.25%
   1722829 =C2=B1  7%    -1e+05     1621521 =C2=B1  5%  syscalls.sys_getpid=
.noise.5%
   1167288 =C2=B1  5%  -40972.4     1126316 =C2=B1  8%  syscalls.sys_getpid=
.noise.50%
   1072219 =C2=B1  6%  -53120.8     1019098 =C2=B1  8%  syscalls.sys_getpid=
.noise.75%
     54168 =C2=B1 39%     -38.5%      33334 =C2=B1 15%  syscalls.sys_gettid=
.max
    333.75            -0.2%     333.00        syscalls.sys_gettid.med
    315.75            -0.2%     315.00        syscalls.sys_gettid.min
    923814 =C2=B1 13%  -1.3e+05      795012 =C2=B1 11%  syscalls.sys_gettid=
.noise.100%
   1909235 =C2=B1  6%  -1.2e+05     1788745 =C2=B1  5%  syscalls.sys_gettid=
.noise.2%
   1254536 =C2=B1 10%  -1.2e+05     1134475 =C2=B1  7%  syscalls.sys_gettid=
.noise.25%
   1664843 =C2=B1  8%  -1.2e+05     1544153 =C2=B1  6%  syscalls.sys_gettid=
.noise.5%
   1209931 =C2=B1 10%  -1.2e+05     1092160 =C2=B1  7%  syscalls.sys_gettid=
.noise.50%
   1120212 =C2=B1 10%  -1.2e+05     1004727 =C2=B1  8%  syscalls.sys_gettid=
.noise.75%
  3.64e+09 =C2=B1  8%     +83.1%  6.666e+09 =C2=B1 92%  syscalls.sys_read.m=
ax
      1837 =C2=B1  2%      +3.6%       1902        syscalls.sys_read.med
    669.75 =C2=B1  3%      +1.7%     681.33 =C2=B1  4%  syscalls.sys_read.m=
in
 8.308e+11        +2.5e+10   8.556e+11 =C2=B1  8%  syscalls.sys_read.noise.=
100%
 8.308e+11        +2.5e+10   8.557e+11 =C2=B1  8%  syscalls.sys_read.noise.=
2%
 8.308e+11        +2.5e+10   8.557e+11 =C2=B1  8%  syscalls.sys_read.noise.=
25%
 8.308e+11        +2.5e+10   8.557e+11 =C2=B1  8%  syscalls.sys_read.noise.=
5%
 8.308e+11        +2.5e+10   8.557e+11 =C2=B1  8%  syscalls.sys_read.noise.=
50%
 8.308e+11        +2.5e+10   8.557e+11 =C2=B1  8%  syscalls.sys_read.noise.=
75%
  27686929 =C2=B1172%     -47.1%   14660048 =C2=B1219%  syscalls.sys_rt_sig=
procmask.max
      7603 =C2=B1  2%      +1.1%       7689        syscalls.sys_rt_sigprocm=
ask.med
    554.75 =C2=B1  5%      +4.1%     577.67 =C2=B1  9%  syscalls.sys_rt_sig=
procmask.min
  59550208 =C2=B1117%  -2.3e+07    36678292 =C2=B1117%  syscalls.sys_rt_sig=
procmask.noise.100%
  99385689 =C2=B1 69%  -2.4e+07    75649798 =C2=B1 55%  syscalls.sys_rt_sig=
procmask.noise.2%
  70154045 =C2=B1 98%  -2.3e+07    47366143 =C2=B1 89%  syscalls.sys_rt_sig=
procmask.noise.25%
  96889781 =C2=B1 71%  -2.4e+07    72970986 =C2=B1 57%  syscalls.sys_rt_sig=
procmask.noise.5%
  65994619 =C2=B1105%  -2.2e+07    43517676 =C2=B1 97%  syscalls.sys_rt_sig=
procmask.noise.50%
  62923250 =C2=B1110%  -2.3e+07    40273591 =C2=B1106%  syscalls.sys_rt_sig=
procmask.noise.75%
  28208603 =C2=B1171%     -32.8%   18960706 =C2=B1220%  syscalls.sys_tgkill=
.max
      7711 =C2=B1  2%      +4.8%       8080        syscalls.sys_tgkill.med
      1337 =C2=B1  2%      +1.9%       1362 =C2=B1  2%  syscalls.sys_tgkill=
.min
  51870512 =C2=B1109%  -9.8e+06    42069157 =C2=B1126%  syscalls.sys_tgkill=
.noise.100%
 1.015e+08 =C2=B1 54%  -1.5e+07    86618122 =C2=B1 61%  syscalls.sys_tgkill=
.noise.2%
  68743216 =C2=B1 80%  -1.3e+07    55954685 =C2=B1 95%  syscalls.sys_tgkill=
.noise.25%
  99442048 =C2=B1 55%  -1.5e+07    83995198 =C2=B1 63%  syscalls.sys_tgkill=
.noise.5%
  59229382 =C2=B1 95%  -9.1e+06    50108976 =C2=B1106%  syscalls.sys_tgkill=
.noise.50%
  55423780 =C2=B1101%  -9.6e+06    45845571 =C2=B1116%  syscalls.sys_tgkill=
.noise.75%
      7.13 =C2=B1 23%      +7.6%       7.68 =C2=B1  7%  perf-stat.i.MPKI
 3.518e+09            -0.1%  3.517e+09        perf-stat.i.branch-instructio=
ns
      1.02 =C2=B1 18%      +0.1        1.11 =C2=B1  6%  perf-stat.i.branch-=
miss-rate%
  35924567 =C2=B1 18%      +9.0%   39155875 =C2=B1  6%  perf-stat.i.branch-=
misses
      0.25 =C2=B1 42%      -0.0        0.21 =C2=B1 26%  perf-stat.i.cache-m=
iss-rate%
    254920 =C2=B1  8%      -0.5%     253744 =C2=B1 15%  perf-stat.i.cache-m=
isses
 1.105e+08 =C2=B1 24%      +8.2%  1.196e+08 =C2=B1  7%  perf-stat.i.cache-r=
eferences
      1924            -0.6%       1912        perf-stat.i.context-switches
      3.39 =C2=B1  2%      +0.0%       3.39        perf-stat.i.cpi
    144011            +0.0%     144013        perf-stat.i.cpu-clock
 5.251e+10 =C2=B1  3%      +0.6%  5.283e+10        perf-stat.i.cpu-cycles
    149.17            -0.3%     148.80        perf-stat.i.cpu-migrations
    238223 =C2=B1 10%      +3.4%     246267 =C2=B1 11%  perf-stat.i.cycles-=
between-cache-misses
      0.17 =C2=B1 17%      +0.0        0.19 =C2=B1  6%  perf-stat.i.dTLB-lo=
ad-miss-rate%
   7107283 =C2=B1 17%     +12.4%    7986549 =C2=B1  5%  perf-stat.i.dTLB-lo=
ad-misses
 4.219e+09            +1.7%   4.29e+09        perf-stat.i.dTLB-loads
      0.28            +0.0        0.28        perf-stat.i.dTLB-store-miss-r=
ate%
   4776002 =C2=B1  7%      +9.6%    5232957 =C2=B1  2%  perf-stat.i.dTLB-st=
ore-misses
 1.707e+09 =C2=B1  8%      +8.5%  1.852e+09 =C2=B1  3%  perf-stat.i.dTLB-st=
ores
     76.72 =C2=B1  5%      +2.6       79.30 =C2=B1  2%  perf-stat.i.iTLB-lo=
ad-miss-rate%
   7312020 =C2=B1  9%      +6.8%    7811089 =C2=B1  2%  perf-stat.i.iTLB-lo=
ad-misses
   2197456 =C2=B1 17%      -7.8%    2024986 =C2=B1  6%  perf-stat.i.iTLB-lo=
ads
 1.551e+10            +0.6%   1.56e+10        perf-stat.i.instructions
      2153 =C2=B1  8%      -6.4%       2016 =C2=B1  3%  perf-stat.i.instruc=
tions-per-iTLB-miss
      0.30 =C2=B1  2%      -0.0%       0.30        perf-stat.i.ipc
      1.01 =C2=B1  3%      +1.4%       1.02 =C2=B1  3%  perf-stat.i.major-f=
aults
      0.36 =C2=B1  3%      +0.6%       0.37        perf-stat.i.metric.GHz
    811.17 =C2=B1 22%      +7.8%     874.34 =C2=B1  6%  perf-stat.i.metric.=
K/sec
     65.59            +2.3%      67.08        perf-stat.i.metric.M/sec
      3816            -0.1%       3812        perf-stat.i.minor-faults
     94.33            +0.6       94.95        perf-stat.i.node-load-miss-ra=
te%
    155138 =C2=B1 18%      -2.8%     150833 =C2=B1 20%  perf-stat.i.node-lo=
ad-misses
     17825 =C2=B1 11%     -18.6%      14509 =C2=B1  6%  perf-stat.i.node-lo=
ads
     61.65 =C2=B1  7%      +3.6       65.20 =C2=B1  4%  perf-stat.i.node-st=
ore-miss-rate%
     53253 =C2=B1 11%      -1.7%      52341 =C2=B1  2%  perf-stat.i.node-st=
ore-misses
     36553 =C2=B1 18%     -12.1%      32126 =C2=B1 19%  perf-stat.i.node-st=
ores
      3817            -0.1%       3813        perf-stat.i.page-faults
    144011            +0.0%     144013        perf-stat.i.task-clock
      7.12 =C2=B1 23%      +7.7%       7.66 =C2=B1  7%  perf-stat.overall.M=
PKI
      1.02 =C2=B1 17%      +0.1        1.11 =C2=B1  6%  perf-stat.overall.b=
ranch-miss-rate%
      0.26 =C2=B1 43%      -0.0        0.22 =C2=B1 26%  perf-stat.overall.c=
ache-miss-rate%
      3.39 =C2=B1  2%      -0.0%       3.39        perf-stat.overall.cpi
    207309 =C2=B1 10%      +2.3%     211978 =C2=B1 12%  perf-stat.overall.c=
ycles-between-cache-misses
      0.17 =C2=B1 17%      +0.0        0.19 =C2=B1  6%  perf-stat.overall.d=
TLB-load-miss-rate%
      0.28            +0.0        0.28        perf-stat.overall.dTLB-store-=
miss-rate%
     76.78 =C2=B1  5%      +2.6       79.39 =C2=B1  2%  perf-stat.overall.i=
TLB-load-miss-rate%
      2139 =C2=B1  8%      -6.5%       2000 =C2=B1  3%  perf-stat.overall.i=
nstructions-per-iTLB-miss
      0.30 =C2=B1  2%      -0.1%       0.30        perf-stat.overall.ipc
     89.49            +1.5       90.98        perf-stat.overall.node-load-m=
iss-rate%
     59.42 =C2=B1  7%      +2.8       62.26 =C2=B1  6%  perf-stat.overall.n=
ode-store-miss-rate%
   7090142            -7.8%    6537840        perf-stat.overall.path-length
 3.507e+09            -0.1%  3.505e+09        perf-stat.ps.branch-instructi=
ons
  35849751 =C2=B1 18%      +9.0%   39063558 =C2=B1  6%  perf-stat.ps.branch=
-misses
    254856 =C2=B1  8%      -0.5%     253483 =C2=B1 15%  perf-stat.ps.cache-=
misses
 1.101e+08 =C2=B1 24%      +8.2%  1.192e+08 =C2=B1  7%  perf-stat.ps.cache-=
references
      1916            -0.6%       1904        perf-stat.ps.context-switches
    143524            -0.0%     143524        perf-stat.ps.cpu-clock
 5.234e+10 =C2=B1  3%      +0.6%  5.265e+10        perf-stat.ps.cpu-cycles
    148.93            -0.3%     148.51        perf-stat.ps.cpu-migrations
   7083441 =C2=B1 17%     +12.4%    7959311 =C2=B1  5%  perf-stat.ps.dTLB-l=
oad-misses
 4.206e+09            +1.7%  4.276e+09        perf-stat.ps.dTLB-loads
   4760073 =C2=B1  7%      +9.6%    5215393 =C2=B1  2%  perf-stat.ps.dTLB-s=
tore-misses
 1.702e+09 =C2=B1  8%      +8.5%  1.846e+09 =C2=B1  3%  perf-stat.ps.dTLB-s=
tores
   7286389 =C2=B1  9%      +6.8%    7783435 =C2=B1  2%  perf-stat.ps.iTLB-l=
oad-misses
   2190584 =C2=B1 17%      -7.9%    2018547 =C2=B1  6%  perf-stat.ps.iTLB-l=
oads
 1.546e+10            +0.6%  1.555e+10        perf-stat.ps.instructions
      1.01 =C2=B1  3%      +1.6%       1.02 =C2=B1  3%  perf-stat.ps.major-=
faults
      3788            -0.1%       3784        perf-stat.ps.minor-faults
    154954 =C2=B1 18%      -2.8%     150666 =C2=B1 20%  perf-stat.ps.node-l=
oad-misses
     17958 =C2=B1 10%     -18.8%      14577 =C2=B1  6%  perf-stat.ps.node-l=
oads
     53120 =C2=B1 11%      -1.7%      52211 =C2=B1  2%  perf-stat.ps.node-s=
tore-misses
     36482 =C2=B1 18%     -12.1%      32073 =C2=B1 19%  perf-stat.ps.node-s=
tores
      3789            -0.1%       3785        perf-stat.ps.page-faults
    143524            -0.0%     143524        perf-stat.ps.task-clock
 4.678e+12            +0.5%  4.703e+12        perf-stat.total.instructions
      6.28 =C2=B1 10%      -6.3        0.00        perf-profile.calltrace.c=
ycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe.raise
      6.25 =C2=B1 10%      -6.2        0.00        perf-profile.calltrace.c=
ycles-pp.do_sigaltstack.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
      6.18 =C2=B1 10%      -6.2        0.00        perf-profile.calltrace.c=
ycles-pp._raw_spin_lock_irq.do_sigaltstack.restore_altstack.__x64_sys_rt_si=
greturn.do_syscall_64
      6.01 =C2=B1 10%      -6.0        0.00        perf-profile.calltrace.c=
ycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.do_sigaltstack=
.restore_altstack.__x64_sys_rt_sigreturn
      6.55 =C2=B1 10%      -5.9        0.65 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.raise
     38.33 =C2=B1 15%      -3.5       34.84 =C2=B1 17%  perf-profile.calltr=
ace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_star=
tup_entry
     40.09 =C2=B1 13%      -3.4       36.70 =C2=B1 14%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.s=
tart_secondary
     40.26 =C2=B1 13%      -3.4       36.88 =C2=B1 14%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secon=
dary_startup_64_no_verify
     41.08 =C2=B1 13%      -3.3       37.76 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_6=
4_no_verify
     41.09 =C2=B1 13%      -3.3       37.78 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_ver=
ify
     41.09 =C2=B1 13%      -3.3       37.78 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     41.76 =C2=B1 13%      -3.3       38.44 =C2=B1 14%  perf-profile.calltr=
ace.cycles-pp.secondary_startup_64_no_verify
      0.29 =C2=B1101%      -0.1        0.19 =C2=B1142%  perf-profile.calltr=
ace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtim=
er_interrupt.__sysvec_apic_timer_interrupt
      0.14 =C2=B1173%      -0.1        0.09 =C2=B1223%  perf-profile.calltr=
ace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrt=
imer_run_queues.hrtimer_interrupt
      0.45 =C2=B1 60%      +0.0        0.48 =C2=B1 46%  perf-profile.calltr=
ace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sys=
vec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.60 =C2=B1106%      +0.0        0.63 =C2=B1103%  perf-profile.calltr=
ace.cycles-pp.cpu_startup_entry.start_kernel.secondary_startup_64_no_verify
      0.60 =C2=B1106%      +0.0        0.63 =C2=B1103%  perf-profile.calltr=
ace.cycles-pp.do_idle.cpu_startup_entry.start_kernel.secondary_startup_64_n=
o_verify
      0.60 =C2=B1106%      +0.0        0.63 =C2=B1103%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_kernel.secondar=
y_startup_64_no_verify
      0.60 =C2=B1106%      +0.0        0.63 =C2=B1103%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.s=
tart_kernel
      0.60 =C2=B1106%      +0.0        0.63 =C2=B1103%  perf-profile.calltr=
ace.cycles-pp.start_kernel.secondary_startup_64_no_verify
      1.34 =C2=B1 18%      +0.0        1.39 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm=
_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      1.28 =C2=B1 18%      +0.0        1.33 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_t=
imer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.88 =C2=B1 23%      +0.1        0.94 =C2=B1 12%  perf-profile.calltr=
ace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_in=
terrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.96 =C2=B1 17%      +0.1        2.03 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.c=
puidle_enter_state.cpuidle_enter.do_idle
      0.46 =C2=B1 59%      +0.1        0.54 =C2=B1 46%  perf-profile.calltr=
ace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.seconda=
ry_startup_64_no_verify
      2.15 =C2=B1 16%      +0.1        2.23 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_e=
nter.do_idle.cpu_startup_entry
      0.00            +0.1        0.08 =C2=B1223%  perf-profile.calltrace.c=
ycles-pp.__set_task_blocked.__set_current_blocked.sigprocmask.__x64_sys_rt_=
sigprocmask.do_syscall_64
      0.60 =C2=B1  8%      +0.1        0.72 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.ring_buffer_lock_reserve.trace_buffer_lock_reserve.ftrace_sys=
call_exit.syscall_exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.90 =C2=B1  8%      +0.1        1.04 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.__entry_text_start.raise
      0.66 =C2=B1  8%      +0.1        0.79 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.trace_buffer_lock_reserve.ftrace_syscall_exit.syscall_exit_to=
_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.25 =C2=B1100%      +0.1        0.40 =C2=B1 70%  perf-profile.calltr=
ace.cycles-pp.__send_signal.do_send_sig_info.do_send_specific.do_tkill.__x6=
4_sys_tgkill
      0.91 =C2=B1  8%      +0.2        1.07 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.syscall_return_via_sysret.raise
     40.06 =C2=B1  9%      +0.2       40.22 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
      1.02 =C2=B1  7%      +0.2        1.20 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.ftrace_syscall_enter.syscall_trace_enter.do_syscall_64.entry_=
SYSCALL_64_after_hwframe.raise
      1.00 =C2=B1  9%      +0.2        1.18 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.ftrace_syscall_exit.syscall_exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     40.17 =C2=B1  9%      +0.2       40.35 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe.raise
      1.11 =C2=B1  8%      +0.2        1.30 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.syscall_trace_enter.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.raise
      1.08 =C2=B1  9%      +0.2        1.27 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.syscall_exit_to_user_mode_prepare.syscall_exit_to_user_mode.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe.raise
      0.27 =C2=B1100%      +0.3        0.59 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.trace_buffer_lock_reserve.ftrace_syscall_enter.syscall_trace_=
enter.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.13 =C2=B1173%      +0.3        0.47 =C2=B1 45%  perf-profile.calltr=
ace.cycles-pp.__rb_reserve_next.ring_buffer_lock_reserve.trace_buffer_lock_=
reserve.ftrace_syscall_exit.syscall_exit_to_user_mode_prepare
      0.00            +0.4        0.36 =C2=B1 70%  perf-profile.calltrace.c=
ycles-pp.ring_buffer_lock_reserve.trace_buffer_lock_reserve.ftrace_syscall_=
enter.syscall_trace_enter.do_syscall_64
     42.28 =C2=B1  9%      +0.5       42.82 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.raise
      6.59 =C2=B1  9%      +1.0        7.56 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.get_signa=
l.arch_do_signal_or_restart.exit_to_user_mode_prepare
      6.76 =C2=B1  9%      +1.0        7.78 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp._raw_spin_lock_irq.get_signal.arch_do_signal_or_restart.exit_=
to_user_mode_prepare.syscall_exit_to_user_mode
      7.17 =C2=B1  9%      +1.1        8.26 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_prepar=
e.syscall_exit_to_user_mode.do_syscall_64
      6.45 =C2=B1  9%      +1.1        7.57 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_cur=
rent_blocked.signal_setup_done.arch_do_signal_or_restart
      6.12 =C2=B1 10%      +1.1        7.26 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_cur=
rent_blocked.__x64_sys_rt_sigreturn.do_syscall_64
      6.61 =C2=B1  9%      +1.2        7.76 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp._raw_spin_lock_irq.__set_current_blocked.signal_setup_done.ar=
ch_do_signal_or_restart.exit_to_user_mode_prepare
      7.63 =C2=B1  9%      +1.2        8.79 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe.raise
      6.30 =C2=B1 10%      +1.2        7.50 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp._raw_spin_lock_irq.__set_current_blocked.__x64_sys_rt_sigretu=
rn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.88 =C2=B1  9%      +1.2        8.08 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.__set_current_blocked.signal_setup_done.arch_do_signal_or_res=
tart.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      6.89 =C2=B1  9%      +1.2        8.10 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.signal_setup_done.arch_do_signal_or_restart.exit_to_user_mode=
_prepare.syscall_exit_to_user_mode.do_syscall_64
      6.56 =C2=B1  9%      +1.2        7.79 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.__set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64.en=
try_SYSCALL_64_after_hwframe.__restore_rt
      7.01 =C2=B1  9%      +1.2        8.24 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe.handler
      6.71 =C2=B1  9%      +1.2        7.95 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.__restore_rt
      6.96 =C2=B1  9%      +1.3        8.26 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__restore_rt
      6.97 =C2=B1 10%      +1.3        8.27 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe.__restore_rt
      7.02 =C2=B1 10%      +1.3        8.32 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.__restore_rt
      6.04 =C2=B1 11%      +1.3        7.36 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__loc=
k_task_sighand.do_send_sig_info.do_send_specific
      7.60 =C2=B1  9%      +1.3        8.95 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe.handler
      7.59 =C2=B1  9%      +1.4        8.94 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.handler
      7.58 =C2=B1  9%      +1.4        8.93 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.handler
      6.23 =C2=B1 10%      +1.4        7.59 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp._raw_spin_lock_irqsave.__lock_task_sighand.do_send_sig_info.d=
o_send_specific.do_tkill
      6.23 =C2=B1 11%      +1.4        7.60 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.__lock_task_sighand.do_send_sig_info.do_send_specific.do_tkil=
l.__x64_sys_tgkill
      8.27 =C2=B1  9%      +1.4        9.72 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.handler
      6.81 =C2=B1 10%      +1.5        8.29 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.do_send_sig_info.do_send_specific.do_tkill.__x64_sys_tgkill.d=
o_syscall_64
      7.12 =C2=B1 10%      +1.6        8.68 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.do_send_specific.do_tkill.__x64_sys_tgkill.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
      7.18 =C2=B1 10%      +1.6        8.75 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.do_tkill.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.raise
      7.20 =C2=B1 10%      +1.6        8.77 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwframe=
.raise
     11.57 =C2=B1  9%      +1.6       13.20 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.raise
     14.57 =C2=B1  9%      +2.4       16.95 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_prepare.syscall_e=
xit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     12.32 =C2=B1  9%      +2.4       14.75 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_cur=
rent_blocked.sigprocmask.__x64_sys_rt_sigprocmask
     12.70 =C2=B1  9%      +2.5       15.19 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp._raw_spin_lock_irq.__set_current_blocked.sigprocmask.__x64_sy=
s_rt_sigprocmask.do_syscall_64
     13.20 =C2=B1  9%      +2.6       15.79 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.__set_current_blocked.sigprocmask.__x64_sys_rt_sigprocmask.do=
_syscall_64.entry_SYSCALL_64_after_hwframe
     13.22 =C2=B1  9%      +2.6       15.82 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.sigprocmask.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe.raise
     13.40 =C2=B1  9%      +2.6       16.02 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after=
_hwframe.raise
      6.28 =C2=B1 10%      -5.9        0.34 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.restore_altstack
      6.25 =C2=B1 10%      -5.9        0.31 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.do_sigaltstack



> Not pretty, but that's what I came up with for now.
> =

> Thanks,
> =

>         tglx
> ---
> --- a/arch/x86/kernel/fpu/core.c
> +++ b/arch/x86/kernel/fpu/core.c
> @@ -457,10 +457,10 @@ static inline void fpu_inherit_perms(str
>  	if (fpu_state_size_dynamic()) {
>  		struct fpu *src_fpu =3D &current->group_leader->thread.fpu;
>  =

> -		spin_lock_irq(&current->sighand->siglock);
> +		read_lock(&current->sighand->sigaltstack_lock);
>  		/* Fork also inherits the permissions of the parent */
>  		dst_fpu->perm =3D src_fpu->perm;
> -		spin_unlock_irq(&current->sighand->siglock);
> +		read_unlock(&current->sighand->sigaltstack_lock);
>  	}
>  }
>  =

> --- a/arch/x86/kernel/fpu/xstate.c
> +++ b/arch/x86/kernel/fpu/xstate.c
> @@ -1582,17 +1582,22 @@ static int validate_sigaltstack(unsigned
>  {
>  	struct task_struct *thread, *leader =3D current->group_leader;
>  	unsigned long framesize =3D get_sigframe_size();
> +	int ret =3D 0;
>  =

> -	lockdep_assert_held(&current->sighand->siglock);
> +	lockdep_assert_held_write(&current->sighand->sigaltstack_lock);
>  =

>  	/* get_sigframe_size() is based on fpu_user_cfg.max_size */
>  	framesize -=3D fpu_user_cfg.max_size;
>  	framesize +=3D usize;
> +	read_lock(&tasklist_lock);
>  	for_each_thread(leader, thread) {
> -		if (thread->sas_ss_size && thread->sas_ss_size < framesize)
> -			return -ENOSPC;
> +		if (thread->sas_ss_size && thread->sas_ss_size < framesize) {
> +			ret =3D -ENOSPC;
> +			break;
> +		}
>  	}
> -	return 0;
> +	read_unlock(&tasklist_lock);
> +	return ret;
>  }
>  =

>  static int __xstate_request_perm(u64 permitted, u64 requested)
> @@ -1627,7 +1632,7 @@ static int __xstate_request_perm(u64 per
>  =

>  	/* Pairs with the READ_ONCE() in xstate_get_group_perm() */
>  	WRITE_ONCE(fpu->perm.__state_perm, requested);
> -	/* Protected by sighand lock */
> +	/* Protected by sighand::sigaltstack_lock */
>  	fpu->perm.__state_size =3D ksize;
>  	fpu->perm.__user_state_size =3D usize;
>  	return ret;
> @@ -1666,10 +1671,10 @@ static int xstate_request_perm(unsigned
>  		return 0;
>  =

>  	/* Protect against concurrent modifications */
> -	spin_lock_irq(&current->sighand->siglock);
> +	write_lock(&current->sighand->sigaltstack_lock);
>  	permitted =3D xstate_get_host_group_perm();
>  	ret =3D __xstate_request_perm(permitted, requested);
> -	spin_unlock_irq(&current->sighand->siglock);
> +	write_unlock(&current->sighand->sigaltstack_lock);
>  	return ret;
>  }
>  =

> @@ -1685,11 +1690,11 @@ int xfd_enable_feature(u64 xfd_err)
>  	}
>  =

>  	/* Protect against concurrent modifications */
> -	spin_lock_irq(&current->sighand->siglock);
> +	read_lock(&current->sighand->sigaltstack_lock);
>  =

>  	/* If not permitted let it die */
>  	if ((xstate_get_host_group_perm() & xfd_event) !=3D xfd_event) {
> -		spin_unlock_irq(&current->sighand->siglock);
> +		read_unlock(&current->sighand->sigaltstack_lock);
>  		return -EPERM;
>  	}
>  =

> @@ -1702,7 +1707,7 @@ int xfd_enable_feature(u64 xfd_err)
>  	 * another task, the retrieved buffer sizes are valid for the
>  	 * currently requested feature(s).
>  	 */
> -	spin_unlock_irq(&current->sighand->siglock);
> +	read_unlock(&current->sighand->sigaltstack_lock);
>  =

>  	/*
>  	 * Try to allocate a new fpstate. If that fails there is no way
> --- a/arch/x86/kernel/signal.c
> +++ b/arch/x86/kernel/signal.c
> @@ -939,17 +939,19 @@ static int __init strict_sas_size(char *
>   * the task has permissions to use dynamic features. Tasks which have no
>   * permission are checked against the size of the non-dynamic feature set
>   * if strict checking is enabled. This avoids forcing all tasks on the
> - * system to allocate large sigaltstacks even if they are never going
> - * to use a dynamic feature. As this is serialized via sighand::siglock
> - * any permission request for a dynamic feature either happened already
> - * or will see the newly install sigaltstack size in the permission chec=
ks.
> + * system to allocate large sigaltstacks even if they are never going to
> + * use a dynamic feature.
> + *
> + * As this is serialized via sighand::sigaltstack_lock any permission
> + * request for a dynamic feature either happened already or will see the
> + * newly install sigaltstack size in the permission checks.
>   */
>  bool sigaltstack_size_valid(size_t ss_size)
>  {
>  	unsigned long fsize =3D max_frame_size - fpu_default_state_size;
>  	u64 mask;
>  =

> -	lockdep_assert_held(&current->sighand->siglock);
> +	lockdep_assert_held_read(&current->sighand->sigaltstack_lock);
>  =

>  	if (!fpu_state_size_dynamic() && !strict_sigaltstack_size)
>  		return true;
> --- a/include/linux/sched/signal.h
> +++ b/include/linux/sched/signal.h
> @@ -19,6 +19,9 @@
>  =

>  struct sighand_struct {
>  	spinlock_t		siglock;
> +#ifdef CONFIG_DYNAMIC_SIGFRAME
> +	rwlock_t		sigaltstack_lock;
> +#endif
>  	refcount_t		count;
>  	wait_queue_head_t	signalfd_wqh;
>  	struct k_sigaction	action[_NSIG];
> --- a/init/init_task.c
> +++ b/init/init_task.c
> @@ -48,6 +48,9 @@ static struct sighand_struct init_sighan
>  	.action		=3D { { { .sa_handler =3D SIG_DFL, } }, },
>  	.siglock	=3D __SPIN_LOCK_UNLOCKED(init_sighand.siglock),
>  	.signalfd_wqh	=3D __WAIT_QUEUE_HEAD_INITIALIZER(init_sighand.signalfd_w=
qh),
> +#ifdef CONFIG_DYNAMIC_SIGFRAME
> +	.sigaltstack_lock	=3D __RW_LOCK_UNLOCKED(init_sighand.sigaltstack_lock),
> +#endif
>  };
>  =

>  #ifdef CONFIG_SHADOW_CALL_STACK
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2900,6 +2900,9 @@ static void sighand_ctor(void *data)
>  =

>  	spin_lock_init(&sighand->siglock);
>  	init_waitqueue_head(&sighand->signalfd_wqh);
> +#ifdef CONFIG_DYNAMIC_SIGFRAME
> +	rwlock_init(&sighand->sigaltstack_lock);
> +#endif
>  }
>  =

>  void __init proc_caches_init(void)
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -4141,15 +4141,15 @@ int do_sigaction(int sig, struct k_sigac
>  =

>  #ifdef CONFIG_DYNAMIC_SIGFRAME
>  static inline void sigaltstack_lock(void)
> -	__acquires(&current->sighand->siglock)
> +	__acquires(&current->sighand->sigaltstack_lock)
>  {
> -	spin_lock_irq(&current->sighand->siglock);
> +	read_lock(&current->sighand->sigaltstack_lock);
>  }
>  =

>  static inline void sigaltstack_unlock(void)
> -	__releases(&current->sighand->siglock)
> +	__releases(&current->sighand->sigaltstack_lock)
>  {
> -	spin_unlock_irq(&current->sighand->siglock);
> +	read_unlock(&current->sighand->sigaltstack_lock);
>  }
>  #else
>  static inline void sigaltstack_lock(void) { }
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============1071951870013098722==--

