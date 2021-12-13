Content-Type: multipart/mixed; boundary="===============5109573292471065687=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [fget] 054aa8d439: will-it-scale.per_thread_ops -5.7% regression
Date: Mon, 13 Dec 2021 16:31:55 +0800
Message-ID: <20211213083154.GA20853@linux.intel.com>
In-Reply-To: <CAHk-=wh5iFv1MOx6r8zyGYkYGfgfxqcPSrUDwfuOCdis+VR+BQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5109573292471065687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, Dec 10, 2021 at 01:59:08PM -0800, Linus Torvalds wrote:
> On Fri, Dec 10, 2021 at 1:25 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > We could make a special light-weight version of files_lookup_fd_raw(),
> > I guess. We don't need the *whole* "look it up again".  We don't need
> > to re-check the array bounds, and we don't need to do the nospec
> > lookup - we would have triggered a NULL file pointer if that happened
> > the first time around.
> >
> > So all we'd need to do is "check that fdt is the same, and check that
> > fdt->fd[fd] is the same".
> =

> This is an ENTIRELY UNTESTED patch to do that.
> =

> It basically rewrites __fget_files() from scratch: it really wants to
> do the fd array lookup by hand, in order to cache the intermediate fdt
> pointer, and in order to cache the intermediate speculation-safe fd
> array index etc.
> =

> It's not a very complicated function, and rewriting it actually cleans
> up the loop to not need the ugly goto.
> =

> I made it use a helper wrapper function for the rcu locking, so that
> the "meat" of the function can just use plain "return NULL" for the
> error cases.
> =

> However, not only is it entirely untested, this rewrite also means
> that gcc has now decided that the result is so simple and clear that
> it will inline it into all the callers.
> =

> I guess that's a good sign - writing the code in a way that makes the
> compiler say "now it's so trivial that it should be inlined" is
> certainly not a bad thing. But it makes it hard to really compare the
> asm.
> =

> I did try a version with "noinline" just to make it more comparable,
> and hey, it all looked sane to me there too.
> =

> I added more comments about what is going on.
> =

> Again - this is UNTESTED. I've looked at the code, I've looked at the
> diff, and I've looked at the code it generates. It all looks fine to
> me. But I've looked at it so much that I suspect that I'd be entirely
> blind to any completely obvious bug by now.
> =

> Comments?
> =

> Oliver, does this make any difference in the performance department?

We tested your patch, the performance regression has recovered from -5.7% t=
o =

-0.4%, thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/thread/50%/debian-10.4-x86_64-20200603.=
cgz/lkp-ivb-2ep1/poll2/will-it-scale/0x42e

commit: =

  5f58da2bef ("Merge tag 'drm-fixes-2021-12-03-1' of git://anongit.freedesk=
top.org/drm/drm")
  054aa8d439 ("fget: check that the fd still exists after getting a ref to =
it")
  242d36be3a ("fixup-for-054aa8d439")

5f58da2befa58edf 054aa8d439b9185d4f5eb9a9028 242d36be3ad02063a1cf6df7802 =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

   6666720            -5.7%    6288280            -0.4%    6639231        w=
ill-it-scale.24.threads
    277779            -5.7%     262011            -0.4%     276634        w=
ill-it-scale.per_thread_ops
   6666720            -5.7%    6288280            -0.4%    6639231        w=
ill-it-scale.workload
      0.09 =C2=B1 59%     -24.7%       0.07 =C2=B1 16%      +5.0%       0.1=
0 =C2=B1 38%  perf-stat.overall.MPKI
      0.19            -0.0        0.17            +0.0        0.19        p=
erf-stat.overall.branch-miss-rate%
      8.12 =C2=B1118%      -4.7        3.43 =C2=B1 14%      +2.6       10.6=
8 =C2=B1118%  perf-stat.overall.cache-miss-rate%
      0.74           -13.0%       0.64            -4.6%       0.71        p=
erf-stat.overall.cpi
    234529 =C2=B1 42%     +15.5%     270984           -20.6%     186280 =C2=
=B1 55%  perf-stat.overall.cycles-between-cache-misses
      0.19 =C2=B1  3%      -0.0        0.14 =C2=B1  8%      -0.0        0.1=
6 =C2=B1  7%  perf-stat.overall.dTLB-load-miss-rate%
      0.10            -0.0        0.08            -0.0        0.08        p=
erf-stat.overall.dTLB-store-miss-rate%
     95.61            -0.1       95.50            -0.4       95.22        p=
erf-stat.overall.iTLB-load-miss-rate%
     13182           +20.1%      15826            +0.4%      13238 =C2=B1  =
2%  perf-stat.overall.instructions-per-iTLB-miss
      1.35           +14.9%       1.55            +4.8%       1.42        p=
erf-stat.overall.ipc
     46.17 =C2=B1  3%      -0.8       45.40            +0.2       46.40 =C2=
=B1  4%  perf-stat.overall.node-load-miss-rate%
     34.45 =C2=B1 10%      -0.3       34.18 =C2=B1  3%      -1.9       32.5=
3 =C2=B1 12%  perf-stat.overall.node-store-miss-rate%
   4411089           +21.5%    5360082            +5.3%    4644112        p=
erf-stat.overall.path-length
  2.37e+10            +0.8%  2.388e+10            -4.3%  2.267e+10        p=
erf-stat.ps.branch-instructions
  44188606            -5.4%   41787951            -1.2%   43679032        p=
erf-stat.ps.branch-misses
   1254452 =C2=B1177%     -78.9%     264997 =C2=B1  2%     +15.0%    144218=
9 =C2=B1160%  perf-stat.ps.cache-misses
   9152124 =C2=B1 58%     -13.4%    7923752 =C2=B1 17%      +9.6%   1002881=
3 =C2=B1 36%  perf-stat.ps.cache-references
      1317 =C2=B1  2%      +0.5%       1323 =C2=B1  3%      +2.4%       134=
8 =C2=B1  2%  perf-stat.ps.context-switches
     47842            -0.0%      47841            +0.0%      47842        p=
erf-stat.ps.cpu-clock
 7.202e+10            -0.3%  7.179e+10            -0.4%  7.175e+10        p=
erf-stat.ps.cpu-cycles
     72.64            +0.1%      72.68 =C2=B1  2%      +1.7%      73.85    =
    perf-stat.ps.cpu-migrations
  42723891 =C2=B1  3%      -7.1%   39692131 =C2=B1  8%      -0.5%   4249614=
9 =C2=B1  6%  perf-stat.ps.dTLB-load-misses
 2.289e+10           +25.4%  2.871e+10           +17.9%  2.698e+10        p=
erf-stat.ps.dTLB-loads
  14395868            -5.8%   13567459 =C2=B1  2%      -1.2%   14222816    =
    perf-stat.ps.dTLB-store-misses
 1.453e+10           +21.9%  1.771e+10           +16.7%  1.695e+10        p=
erf-stat.ps.dTLB-stores
   7382256            -4.6%    7043603            +4.0%    7680167 =C2=B1  =
2%  perf-stat.ps.iTLB-load-misses
    339276 =C2=B1  2%      -2.1%     332065 =C2=B1  4%     +13.3%     38455=
1 =C2=B1 29%  perf-stat.ps.iTLB-loads
 9.731e+10           +14.6%  1.115e+11            +4.4%  1.016e+11        p=
erf-stat.ps.instructions
      0.47 =C2=B1 14%      -9.2%       0.43 =C2=B1  8%      -6.6%       0.4=
4 =C2=B1 12%  perf-stat.ps.major-faults
      2699            -0.3%       2690            +0.2%       2705        p=
erf-stat.ps.minor-faults
    788197 =C2=B1193%     -86.7%     105083 =C2=B1  5%     +13.3%     89269=
9 =C2=B1174%  perf-stat.ps.node-load-misses
    817124 =C2=B1189%     -84.5%     126259 =C2=B1  3%     +13.4%     92639=
8 =C2=B1170%  perf-stat.ps.node-loads
    248114 =C2=B1168%     -74.7%      62837 =C2=B1  5%      +8.2%     26847=
4 =C2=B1160%  perf-stat.ps.node-store-misses
    434936 =C2=B1163%     -72.2%     120915 =C2=B1  3%      +9.9%     47783=
0 =C2=B1149%  perf-stat.ps.node-stores
      2700            -0.3%       2691            +0.2%       2705        p=
erf-stat.ps.page-faults
     47842            -0.0%      47841            +0.0%      47842        p=
erf-stat.ps.task-clock
 2.941e+13           +14.6%  3.371e+13            +4.9%  3.083e+13        p=
erf-stat.total.instructions
     28.74 =C2=B1 23%      -1.9       26.84 =C2=B1  6%      +6.1       34.8=
4 =C2=B1 20%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_sta=
te.cpuidle_enter.do_idle.cpu_startup_entry
     27.82 =C2=B1 23%      -1.9       25.93 =C2=B1  5%      +5.7       33.5=
4 =C2=B1 20%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_st=
artup_entry.start_secondary.secondary_startup_64_no_verify
     27.82 =C2=B1 23%      -1.9       25.93 =C2=B1  5%      +5.7       33.5=
4 =C2=B1 20%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_=
enter.do_idle.cpu_startup_entry.start_secondary
     27.83 =C2=B1 23%      -1.9       25.94 =C2=B1  5%      +5.7       33.5=
5 =C2=B1 20%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_seco=
ndary.secondary_startup_64_no_verify
     27.83 =C2=B1 23%      -1.9       25.94 =C2=B1  5%      +5.7       33.5=
5 =C2=B1 20%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.st=
art_secondary.secondary_startup_64_no_verify
     27.83 =C2=B1 23%      -1.9       25.94 =C2=B1  5%      +5.7       33.5=
5 =C2=B1 20%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_st=
artup_64_no_verify
     28.81 =C2=B1 23%      -1.9       26.93 =C2=B1  6%      +6.0       34.8=
5 =C2=B1 20%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_veri=
fy
     19.12 =C2=B1  9%      -1.7       17.39 =C2=B1  2%      -2.8       16.3=
3 =C2=B1 11%  perf-profile.calltrace.cycles-pp.fput_many.do_sys_poll.__x64_=
sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.26 =C2=B1100%      -0.2        0.10 =C2=B1223%      -0.2        0.0=
9 =C2=B1223%  perf-profile.calltrace.cycles-pp.__kmalloc.do_sys_poll.__x64_=
sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.88 =C2=B1  9%      -0.1        2.76 =C2=B1  2%      -0.3        2.6=
2 =C2=B1 11%  perf-profile.calltrace.cycles-pp.testcase
      3.27 =C2=B1  9%      -0.1        3.18 =C2=B1  2%      -0.2        3.0=
6 =C2=B1 11%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do=
_syscall_64.entry_SYSCALL_64_after_hwframe.__poll
      1.70 =C2=B1  9%      -0.1        1.63 =C2=B1  2%      -0.1        1.5=
7 =C2=B1 11%  perf-profile.calltrace.cycles-pp.__fdget.do_sys_poll.__x64_sy=
s_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.70 =C2=B1 10%      -0.1        1.64 =C2=B1  2%      -0.2        1.5=
2 =C2=B1 10%  perf-profile.calltrace.cycles-pp.fput.do_sys_poll.__x64_sys_p=
oll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.04 =C2=B1  8%      -0.1        0.98 =C2=B1  4%      -0.0        1.0=
0 =C2=B1 10%  perf-profile.calltrace.cycles-pp.__check_object_size.do_sys_p=
oll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.64 =C2=B1  9%      -0.1        1.59 =C2=B1  3%      -0.2        1.4=
8 =C2=B1 12%  perf-profile.calltrace.cycles-pp.__entry_text_start.__poll
      1.69 =C2=B1  9%      -0.0        1.65 =C2=B1  3%      -0.1        1.5=
7 =C2=B1 12%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__=
poll
      1.11 =C2=B1  9%      -0.0        1.08 =C2=B1  4%      -0.1        1.0=
1 =C2=B1 11%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_stri=
ng._copy_from_user.do_sys_poll.__x64_sys_poll.do_syscall_64
      1.48 =C2=B1  8%      -0.0        1.45 =C2=B1  4%      -0.1        1.3=
4 =C2=B1 10%  perf-profile.calltrace.cycles-pp._copy_from_user.do_sys_poll.=
__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.94 =C2=B1 57%      -0.0        0.92 =C2=B1 54%      +0.4        1.3=
1 =C2=B1 46%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_kern=
el.secondary_startup_64_no_verify
      0.94 =C2=B1 57%      -0.0        0.92 =C2=B1 54%      +0.4        1.3=
1 =C2=B1 46%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.st=
art_kernel.secondary_startup_64_no_verify
      0.94 =C2=B1 57%      -0.0        0.92 =C2=B1 54%      +0.4        1.3=
1 =C2=B1 46%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_st=
artup_entry.start_kernel.secondary_startup_64_no_verify
      0.94 =C2=B1 57%      -0.0        0.92 =C2=B1 54%      +0.4        1.3=
1 =C2=B1 46%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_=
enter.do_idle.cpu_startup_entry.start_kernel
      0.94 =C2=B1 57%      -0.0        0.92 =C2=B1 54%      +0.4        1.3=
1 =C2=B1 46%  perf-profile.calltrace.cycles-pp.start_kernel.secondary_start=
up_64_no_verify
      0.54 =C2=B1 45%      +0.1        0.59 =C2=B1  9%      -0.2        0.2=
9 =C2=B1100%  perf-profile.calltrace.cycles-pp.kfree.do_sys_poll.__x64_sys_=
poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
     67.66 =C2=B1  9%      +2.0       69.69 =C2=B1  2%      -5.7       61.9=
8 =C2=B1 11%  perf-profile.calltrace.cycles-pp.__poll
     63.66 =C2=B1  9%      +2.2       65.82 =C2=B1  2%      -5.4       58.3=
0 =C2=B1 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwfra=
me.__poll
     63.48 =C2=B1  9%      +2.2       65.64 =C2=B1  2%      -5.3       58.1=
4 =C2=B1 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_=
64_after_hwframe.__poll
     59.85 =C2=B1  9%      +2.3       62.12 =C2=B1  2%      -5.1       54.7=
7 =C2=B1 10%  perf-profile.calltrace.cycles-pp.__x64_sys_poll.do_syscall_64=
.entry_SYSCALL_64_after_hwframe.__poll
     57.74 =C2=B1  9%      +2.4       60.09 =C2=B1  2%      -4.9       52.8=
6 =C2=B1 10%  perf-profile.calltrace.cycles-pp.do_sys_poll.__x64_sys_poll.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe.__poll
     27.16 =C2=B1 10%      +4.3       31.51 =C2=B1  2%      -1.1       26.0=
4 =C2=B1 10%  perf-profile.calltrace.cycles-pp.__fget_light.do_sys_poll.__x=
64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
     22.91 =C2=B1 10%      +4.4       27.34 =C2=B1  2%     -22.9        0.0=
0        perf-profile.calltrace.cycles-pp.__fget_files.__fget_light.do_sys_=
poll.__x64_sys_poll.do_syscall_64
     27.83 =C2=B1 23%      -1.9       25.94 =C2=B1  5%      +5.7       33.5=
5 =C2=B1 20%  perf-profile.children.cycles-pp.start_secondary
     28.80 =C2=B1 23%      -1.9       26.92 =C2=B1  6%      +6.0       34.8=
5 =C2=B1 20%  perf-profile.children.cycles-pp.cpuidle_enter
     28.80 =C2=B1 23%      -1.9       26.92 =C2=B1  6%      +6.0       34.8=
5 =C2=B1 20%  perf-profile.children.cycles-pp.cpuidle_enter_state
     28.81 =C2=B1 23%      -1.9       26.93 =C2=B1  6%      +6.0       34.8=
5 =C2=B1 20%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     28.81 =C2=B1 23%      -1.9       26.93 =C2=B1  6%      +6.0       34.8=
5 =C2=B1 20%  perf-profile.children.cycles-pp.cpu_startup_entry
     28.81 =C2=B1 23%      -1.9       26.93 =C2=B1  6%      +6.0       34.8=
5 =C2=B1 20%  perf-profile.children.cycles-pp.do_idle
     28.78 =C2=B1 23%      -1.9       26.91 =C2=B1  6%      +6.1       34.8=
4 =C2=B1 20%  perf-profile.children.cycles-pp.intel_idle
     18.28 =C2=B1  9%      -1.7       16.59 =C2=B1  2%      -2.7       15.5=
7 =C2=B1 11%  perf-profile.children.cycles-pp.fput_many
      2.90 =C2=B1  9%      -0.1        2.76 =C2=B1  2%      -0.3        2.6=
4 =C2=B1 11%  perf-profile.children.cycles-pp.testcase
      3.29 =C2=B1  9%      -0.1        3.20 =C2=B1  2%      -0.2        3.0=
8 =C2=B1 11%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.69 =C2=B1  9%      -0.1        1.63 =C2=B1  2%      -0.1        1.5=
6 =C2=B1 11%  perf-profile.children.cycles-pp.__fdget
      1.70 =C2=B1  9%      -0.1        1.64 =C2=B1  2%      -0.2        1.5=
3 =C2=B1 10%  perf-profile.children.cycles-pp.fput
      1.82 =C2=B1  9%      -0.1        1.76 =C2=B1  3%      -0.2        1.6=
6 =C2=B1 12%  perf-profile.children.cycles-pp.__entry_text_start
      1.07 =C2=B1  9%      -0.1        1.02 =C2=B1  4%      -0.0        1.0=
4 =C2=B1 10%  perf-profile.children.cycles-pp.__check_object_size
      1.90 =C2=B1  9%      -0.0        1.86 =C2=B1  2%      -0.1        1.7=
7 =C2=B1 12%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      1.50 =C2=B1  8%      -0.0        1.47 =C2=B1  4%      -0.1        1.3=
7 =C2=B1 10%  perf-profile.children.cycles-pp._copy_from_user
      1.12 =C2=B1  9%      -0.0        1.09 =C2=B1  4%      -0.1        1.0=
2 =C2=B1 11%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      0.30 =C2=B1  8%      -0.0        0.26 =C2=B1 11%      +0.0        0.3=
1 =C2=B1 20%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.12 =C2=B1  8%      -0.0        0.09 =C2=B1 11%      -0.0        0.0=
9 =C2=B1 13%  perf-profile.children.cycles-pp.poll(a)plt
      0.04 =C2=B1 71%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.children.cycles-pp.seq_read_iter
      0.17 =C2=B1 26%      -0.0        0.14 =C2=B1 32%      -0.0        0.1=
3 =C2=B1 23%  perf-profile.children.cycles-pp.cmd_sched
      0.17 =C2=B1 26%      -0.0        0.14 =C2=B1 32%      -0.0        0.1=
3 =C2=B1 23%  perf-profile.children.cycles-pp.cmd_record
      0.04 =C2=B1 71%      -0.0        0.02 =C2=B1144%      -0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.ksys_read
      0.04 =C2=B1 71%      -0.0        0.02 =C2=B1144%      -0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.vfs_read
      0.61 =C2=B1 13%      -0.0        0.59 =C2=B1  9%      -0.1        0.5=
1 =C2=B1 13%  perf-profile.children.cycles-pp.kfree
      0.17 =C2=B1 26%      -0.0        0.15 =C2=B1 30%      -0.0        0.1=
3 =C2=B1 20%  perf-profile.children.cycles-pp.__libc_start_main
      0.17 =C2=B1 26%      -0.0        0.15 =C2=B1 30%      -0.0        0.1=
3 =C2=B1 20%  perf-profile.children.cycles-pp.main
      0.17 =C2=B1 26%      -0.0        0.15 =C2=B1 30%      -0.0        0.1=
3 =C2=B1 20%  perf-profile.children.cycles-pp.run_builtin
      0.02 =C2=B1142%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.ksys_write
      0.02 =C2=B1142%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.vfs_write
      0.02 =C2=B1142%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.new_sync_write
      0.04 =C2=B1 45%      -0.0        0.02 =C2=B1 99%      -0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.13 =C2=B1 10%      -0.0        0.12 =C2=B1  6%      -0.0        0.1=
1 =C2=B1  6%  perf-profile.children.cycles-pp.kmalloc_slab
      0.02 =C2=B1 99%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.children.cycles-pp.seq_read
      0.02 =C2=B1 99%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.children.cycles-pp.__libc_read
      0.15 =C2=B1 26%      -0.0        0.14 =C2=B1 31%      -0.0        0.1=
2 =C2=B1 20%  perf-profile.children.cycles-pp.record__finish_output
      0.15 =C2=B1 26%      -0.0        0.14 =C2=B1 31%      -0.0        0.1=
2 =C2=B1 20%  perf-profile.children.cycles-pp.perf_session__process_events
      0.06 =C2=B1 46%      -0.0        0.04 =C2=B1 73%      -0.0        0.0=
3 =C2=B1100%  perf-profile.children.cycles-pp.machines__deliver_event
      0.14 =C2=B1 27%      -0.0        0.12 =C2=B1 32%      -0.0        0.1=
1 =C2=B1 20%  perf-profile.children.cycles-pp.process_simple
      0.09 =C2=B1 30%      -0.0        0.08 =C2=B1 34%      -0.0        0.0=
7 =C2=B1 18%  perf-profile.children.cycles-pp.perf_session__process_user_ev=
ent
      0.05 =C2=B1 47%      -0.0        0.04 =C2=B1 71%      -0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.exc_page_fault
      0.10 =C2=B1 24%      -0.0        0.08 =C2=B1 30%      -0.0        0.0=
7 =C2=B1 15%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.02 =C2=B1142%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.poll_select_set_timeout
      0.09 =C2=B1 24%      -0.0        0.08 =C2=B1 28%      -0.0        0.0=
7 =C2=B1 14%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.children.cycles-pp.proc_reg_read
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.children.cycles-pp.perf_output_sample
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.do_user_addr_fault
      0.04 =C2=B1 45%      -0.0        0.04 =C2=B1 71%      -0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.perf_callchain_user
      0.29 =C2=B1  9%      -0.0        0.28 =C2=B1  4%      -0.0        0.2=
8 =C2=B1 13%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.11 =C2=B1 12%      -0.0        0.10 =C2=B1  8%      -0.0        0.1=
0 =C2=B1 14%  perf-profile.children.cycles-pp.__might_sleep
      0.05 =C2=B1 49%      -0.0        0.05 =C2=B1 52%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.check_stack_object
      0.16 =C2=B1 20%      -0.0        0.16 =C2=B1  9%      -0.0        0.1=
3 =C2=B1  8%  perf-profile.children.cycles-pp.perf_callchain_kernel
      0.12 =C2=B1 20%      -0.0        0.11 =C2=B1  8%      -0.0        0.0=
9 =C2=B1  7%  perf-profile.children.cycles-pp.unwind_next_frame
      0.29 =C2=B1 11%      -0.0        0.28 =C2=B1  5%      -0.0        0.2=
6 =C2=B1 14%  perf-profile.children.cycles-pp.__check_heap_object
      0.43 =C2=B1 19%      +0.0        0.43 =C2=B1 10%      -0.1        0.3=
6 =C2=B1 10%  perf-profile.children.cycles-pp.update_process_times
      0.23 =C2=B1 20%      +0.0        0.23 =C2=B1 11%      -0.1        0.1=
8 =C2=B1  8%  perf-profile.children.cycles-pp.perf_prepare_sample
      0.21 =C2=B1 20%      +0.0        0.21 =C2=B1 10%      -0.0        0.1=
7 =C2=B1  8%  perf-profile.children.cycles-pp.perf_callchain
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%      -0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.ordered_events__queue
      0.02 =C2=B1142%      +0.0        0.02 =C2=B1142%      -0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.io_serial_in
      0.07 =C2=B1 12%      +0.0        0.07 =C2=B1  6%      -0.0        0.0=
6 =C2=B1 17%  perf-profile.children.cycles-pp.uart_console_write
      0.07 =C2=B1 12%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
6 =C2=B1 17%  perf-profile.children.cycles-pp.serial8250_console_write
      0.21 =C2=B1 21%      +0.0        0.21 =C2=B1 10%      -0.0        0.1=
7 =C2=B1  8%  perf-profile.children.cycles-pp.get_perf_callchain
      0.07 =C2=B1 12%      +0.0        0.07 =C2=B1  6%      -0.0        0.0=
6 =C2=B1 17%  perf-profile.children.cycles-pp.wait_for_xmitr
      0.08 =C2=B1 12%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 13%  perf-profile.children.cycles-pp.vprintk_emit
      0.08 =C2=B1 12%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 13%  perf-profile.children.cycles-pp.console_unlock
      0.48 =C2=B1 17%      +0.0        0.48 =C2=B1  9%      -0.1        0.4=
1 =C2=B1 10%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.32 =C2=B1 21%      +0.0        0.32 =C2=B1 11%      -0.1        0.2=
5 =C2=B1  9%  perf-profile.children.cycles-pp.update_curr
      0.61 =C2=B1 16%      +0.0        0.61 =C2=B1  7%      -0.1        0.5=
3 =C2=B1 10%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interru=
pt
      0.30 =C2=B1 21%      +0.0        0.30 =C2=B1 10%      -0.1        0.2=
4 =C2=B1  9%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.28 =C2=B1 20%      +0.0        0.29 =C2=B1 10%      -0.1        0.2=
2 =C2=B1  8%  perf-profile.children.cycles-pp.__perf_event_overflow
      0.28 =C2=B1 19%      +0.0        0.28 =C2=B1 11%      -0.1        0.2=
2 =C2=B1  7%  perf-profile.children.cycles-pp.perf_event_output_forward
      0.29 =C2=B1 10%      +0.0        0.29 =C2=B1  9%      -0.0        0.2=
5 =C2=B1 10%  perf-profile.children.cycles-pp.__might_fault
      0.08 =C2=B1 12%      +0.0        0.08 =C2=B1 22%      -0.0        0.0=
7 =C2=B1  7%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.worker_thread
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.process_one_work
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.commit_tail
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_plan=
es
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.mgag200_simple_display_pipe_u=
pdate
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.drm_fb_memcpy_dstclip
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.memcpy_toio
      0.07 =C2=B1  8%      +0.0        0.07 =C2=B1  6%      -0.0        0.0=
6 =C2=B1 17%  perf-profile.children.cycles-pp.serial8250_console_putchar
      0.43 =C2=B1 19%      +0.0        0.44 =C2=B1  9%      -0.1        0.3=
6 =C2=B1 10%  perf-profile.children.cycles-pp.tick_sched_handle
      0.57 =C2=B1 16%      +0.0        0.58 =C2=B1  7%      -0.1        0.5=
0 =C2=B1 10%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.05 =C2=B1 47%      +0.0        0.06 =C2=B1  8%      -0.0        0.0=
2 =C2=B1 99%  perf-profile.children.cycles-pp.__unwind_start
      0.28 =C2=B1 20%      +0.0        0.29 =C2=B1 10%      -0.1        0.2=
2 =C2=B1  7%  perf-profile.children.cycles-pp.perf_swevent_overflow
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
6 =C2=B1 17%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
6 =C2=B1 17%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
6 =C2=B1 17%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
6 =C2=B1 17%  perf-profile.children.cycles-pp.irq_work_run
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
6 =C2=B1 17%  perf-profile.children.cycles-pp.irq_work_single
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
6 =C2=B1 17%  perf-profile.children.cycles-pp._printk
      0.44 =C2=B1 19%      +0.0        0.45 =C2=B1  9%      -0.1        0.3=
7 =C2=B1 10%  perf-profile.children.cycles-pp.tick_sched_timer
      0.54 =C2=B1 17%      +0.0        0.54 =C2=B1  8%      -0.1        0.4=
6 =C2=B1  9%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.54 =C2=B1 17%      +0.0        0.55 =C2=B1  8%      -0.1        0.4=
7 =C2=B1  9%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.37 =C2=B1 19%      +0.0        0.37 =C2=B1 10%      -0.1        0.3=
0 =C2=B1  9%  perf-profile.children.cycles-pp.task_tick_fair
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  8%      -0.0        0.0=
6 =C2=B1 17%  perf-profile.children.cycles-pp.irq_work_run_list
      0.06 =C2=B1 47%      +0.0        0.07 =C2=B1 18%      -0.0        0.0=
6 =C2=B1 13%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.29 =C2=B1 21%      +0.0        0.30 =C2=B1 10%      -0.1        0.2=
3 =C2=B1  8%  perf-profile.children.cycles-pp.perf_tp_event
      0.98 =C2=B1 47%      +0.0        0.99 =C2=B1 38%      +0.3        1.3=
1 =C2=B1 46%  perf-profile.children.cycles-pp.start_kernel
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%      +0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.__cond_resched
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%      +0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.queue_event
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.01 =C2=
=B1223%  perf-profile.children.cycles-pp.poll_freewait
      0.39 =C2=B1 19%      +0.0        0.40 =C2=B1  9%      -0.1        0.3=
2 =C2=B1  9%  perf-profile.children.cycles-pp.scheduler_tick
      0.06 =C2=B1  8%      +0.0        0.07 =C2=B1 11%      -0.0        0.0=
4 =C2=B1 73%  perf-profile.children.cycles-pp.ret_from_fork
      0.06 =C2=B1  8%      +0.0        0.07 =C2=B1 11%      -0.0        0.0=
4 =C2=B1 73%  perf-profile.children.cycles-pp.kthread
      0.04 =C2=B1 71%      +0.0        0.04 =C2=B1 45%      +0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.19 =C2=B1 10%      +0.0        0.20 =C2=B1  9%      -0.0        0.1=
6 =C2=B1 10%  perf-profile.children.cycles-pp.__might_resched
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%      +0.0        0.0=
6 =C2=B1 50%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_pre=
pare
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1 70%      -0.0        0.0=
0        perf-profile.children.cycles-pp.__get_user_nocheck_8
      0.50 =C2=B1 12%      +0.0        0.53 =C2=B1  9%      -0.0        0.4=
6 =C2=B1 12%  perf-profile.children.cycles-pp.__kmalloc
     67.89 =C2=B1  9%      +2.0       69.92 =C2=B1  2%      -5.7       62.2=
0 =C2=B1 11%  perf-profile.children.cycles-pp.__poll
     63.84 =C2=B1  9%      +2.1       65.97 =C2=B1  2%      -5.4       58.4=
3 =C2=B1 10%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     63.66 =C2=B1  9%      +2.1       65.80 =C2=B1  2%      -5.4       58.2=
7 =C2=B1 10%  perf-profile.children.cycles-pp.do_syscall_64
     59.86 =C2=B1  9%      +2.3       62.12 =C2=B1  2%      -5.1       54.7=
7 =C2=B1 10%  perf-profile.children.cycles-pp.__x64_sys_poll
     59.47 =C2=B1  9%      +2.3       61.75 =C2=B1  2%      -5.0       54.4=
2 =C2=B1 10%  perf-profile.children.cycles-pp.do_sys_poll
     26.33 =C2=B1 10%      +4.4       30.70 =C2=B1  2%      -1.0       25.2=
9 =C2=B1 10%  perf-profile.children.cycles-pp.__fget_light
     22.92 =C2=B1 10%      +4.4       27.35 =C2=B1  2%     -22.9        0.0=
0        perf-profile.children.cycles-pp.__fget_files
     28.78 =C2=B1 23%      -1.9       26.91 =C2=B1  6%      +6.1       34.8=
4 =C2=B1 20%  perf-profile.self.cycles-pp.intel_idle
     17.29 =C2=B1  9%      -1.6       15.64 =C2=B1  2%      -2.6       14.6=
7 =C2=B1 11%  perf-profile.self.cycles-pp.fput_many
     11.06 =C2=B1  9%      -0.3       10.74 =C2=B1  2%      -1.0       10.0=
9 =C2=B1 11%  perf-profile.self.cycles-pp.do_sys_poll
      2.87 =C2=B1  9%      -0.1        2.74 =C2=B1  2%      -0.3        2.6=
1 =C2=B1 12%  perf-profile.self.cycles-pp.testcase
      3.21 =C2=B1  9%      -0.1        3.12 =C2=B1  2%      -0.2        2.9=
8 =C2=B1 11%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      1.60 =C2=B1  9%      -0.1        1.54 =C2=B1  4%      -0.2        1.4=
5 =C2=B1 12%  perf-profile.self.cycles-pp.__entry_text_start
      1.90 =C2=B1  8%      -0.0        1.86 =C2=B1  3%      -0.1        1.7=
7 =C2=B1 12%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      2.55 =C2=B1  9%      -0.0        2.51 =C2=B1  4%     +21.8       24.3=
0 =C2=B1 10%  perf-profile.self.cycles-pp.__fget_light
      0.84 =C2=B1  8%      -0.0        0.81 =C2=B1  2%      -0.1        0.7=
7 =C2=B1 11%  perf-profile.self.cycles-pp.fput
      0.29 =C2=B1  8%      -0.0        0.26 =C2=B1 11%      +0.0        0.3=
0 =C2=B1 20%  perf-profile.self.cycles-pp.__virt_addr_valid
      1.10 =C2=B1  9%      -0.0        1.07 =C2=B1  4%      -0.1        1.0=
0 =C2=B1 11%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.28 =C2=B1  8%      -0.0        0.26 =C2=B1  5%      -0.0        0.2=
4 =C2=B1 10%  perf-profile.self.cycles-pp.do_syscall_64
      0.84 =C2=B1  9%      -0.0        0.82 =C2=B1  3%      -0.1        0.7=
8 =C2=B1 11%  perf-profile.self.cycles-pp.__fdget
      0.10 =C2=B1  6%      -0.0        0.08 =C2=B1 10%      -0.0        0.0=
8 =C2=B1 14%  perf-profile.self.cycles-pp.poll(a)plt
      0.60 =C2=B1 12%      -0.0        0.59 =C2=B1  9%      -0.1        0.5=
1 =C2=B1 14%  perf-profile.self.cycles-pp.kfree
      0.11 =C2=B1 12%      -0.0        0.09 =C2=B1  7%      -0.0        0.1=
0 =C2=B1 12%  perf-profile.self.cycles-pp._copy_from_user
      0.44 =C2=B1  9%      -0.0        0.43 =C2=B1  3%      -0.0        0.4=
2 =C2=B1 15%  perf-profile.self.cycles-pp.__check_object_size
      0.31 =C2=B1 10%      -0.0        0.30 =C2=B1  3%      -0.0        0.2=
9 =C2=B1 12%  perf-profile.self.cycles-pp.__x64_sys_poll
      0.18 =C2=B1  8%      -0.0        0.17 =C2=B1  5%      -0.0        0.1=
6 =C2=B1 10%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.02 =C2=B1142%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
1 =C2=B1223%  perf-profile.self.cycles-pp.poll_select_set_timeout
      0.04 =C2=B1 71%      -0.0        0.02 =C2=B1 99%      -0.0        0.0=
2 =C2=B1141%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.12 =C2=B1 10%      -0.0        0.12 =C2=B1  6%      -0.0        0.1=
0 =C2=B1 10%  perf-profile.self.cycles-pp.kmalloc_slab
      0.01 =C2=B1223%      -0.0        0.00            +0.0        0.04 =C2=
=B1 73%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.06 =C2=B1 11%      -0.0        0.05 =C2=B1  8%      -0.0        0.0=
4 =C2=B1 45%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1142%      -0.0        0.0=
2 =C2=B1 99%  perf-profile.self.cycles-pp.check_stack_object
      0.28 =C2=B1 11%      -0.0        0.27 =C2=B1  5%      -0.0        0.2=
5 =C2=B1 13%  perf-profile.self.cycles-pp.__check_heap_object
      0.09 =C2=B1 13%      -0.0        0.09 =C2=B1  7%      -0.0        0.0=
8 =C2=B1 14%  perf-profile.self.cycles-pp.__might_sleep
      0.08 =C2=B1 17%      -0.0        0.08 =C2=B1 25%      -0.0        0.0=
8 =C2=B1 16%  perf-profile.self.cycles-pp.__might_fault
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1 99%      -0.0        0.0=
0        perf-profile.self.cycles-pp.unwind_next_frame
      0.02 =C2=B1142%      +0.0        0.02 =C2=B1142%      -0.0        0.0=
2 =C2=B1141%  perf-profile.self.cycles-pp.io_serial_in
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
1 =C2=B1223%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.11 =C2=B1  9%      +0.0        0.12 =C2=B1  8%      -0.0        0.1=
1 =C2=B1  9%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.44 =C2=B1  8%      +0.0        0.45 =C2=B1  4%      -0.0        0.4=
2 =C2=B1 15%  perf-profile.self.cycles-pp.__poll
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%      +0.0        0.0=
1 =C2=B1223%  perf-profile.self.cycles-pp.queue_event
      0.18 =C2=B1 11%      +0.0        0.19 =C2=B1  8%      -0.0        0.1=
6 =C2=B1 10%  perf-profile.self.cycles-pp.__might_resched
      0.26 =C2=B1 13%      +0.0        0.30 =C2=B1 17%      -0.0        0.2=
5 =C2=B1 15%  perf-profile.self.cycles-pp.__kmalloc
     22.70 =C2=B1 10%      +4.4       27.11 =C2=B1  2%     -22.7        0.0=
0        perf-profile.self.cycles-pp.__fget_files

> =

>                  Linus

>  fs/file.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++---------=
------
>  1 file changed, 53 insertions(+), 16 deletions(-)
> =

> diff --git a/fs/file.c b/fs/file.c
> index ad4a8bf3cf10..70662fb1ab32 100644
> --- a/fs/file.c
> +++ b/fs/file.c
> @@ -841,28 +841,65 @@ void do_close_on_exec(struct files_struct *files)
>  	spin_unlock(&files->file_lock);
>  }
>  =

> +static inline struct file *__fget_files_rcu(struct files_struct *files,
> +	unsigned int fd, fmode_t mask, unsigned int refs)
> +{
> +	for (;;) {
> +		struct file *file;
> +		struct fdtable *fdt =3D rcu_dereference_raw(files->fdt);
> +		struct file __rcu **fdentry;
> +
> +		if (unlikely(fd >=3D fdt->max_fds))
> +			return NULL;
> +
> +		fdentry =3D fdt->fd + array_index_nospec(fd, fdt->max_fds);
> +		file =3D rcu_dereference_raw(*fdentry);
> +		if (unlikely(!file))
> +			return NULL;
> +
> +		if (unlikely(file->f_mode & mask))
> +			return NULL;
> +
> +		/*
> +		 * Ok, we have a file pointer. However, because we do
> +		 * this all locklessly under RCU, we may be racing with
> +		 * that file being closed.
> +		 *
> +		 * Such a race can take two forms:
> +		 *
> +		 *  (a) the file ref already went down to zero,
> +		 *      and get_file_rcu_many() fails. Just try
> +		 *      again:
> +		 */
> +		if (unlikely(!get_file_rcu_many(file, refs)))
> +			continue;
> +
> +		/*
> +		 *  (b) the file table entry has changed under us.
> +		 *
> +		 * If so, we need to put our refs and try again.
> +		 */
> +		if (unlikely(rcu_dereference_raw(files->fdt) !=3D fdt) ||
> +		    unlikely(rcu_dereference_raw(*fdentry) !=3D file)) {
> +			fput_many(file, refs);
> +			continue;
> +		}
> +
> +		/*
> +		 * Ok, we have a ref to the file, and checked that it
> +		 * still exists.
> +		 */
> +		return file;
> +	}
> +}
> +
>  static struct file *__fget_files(struct files_struct *files, unsigned in=
t fd,
>  				 fmode_t mask, unsigned int refs)
>  {
>  	struct file *file;
>  =

>  	rcu_read_lock();
> -loop:
> -	file =3D files_lookup_fd_rcu(files, fd);
> -	if (file) {
> -		/* File object ref couldn't be taken.
> -		 * dup2() atomicity guarantee is the reason
> -		 * we loop to catch the new file (or NULL pointer)
> -		 */
> -		if (file->f_mode & mask)
> -			file =3D NULL;
> -		else if (!get_file_rcu_many(file, refs))
> -			goto loop;
> -		else if (files_lookup_fd_raw(files, fd) !=3D file) {
> -			fput_many(file, refs);
> -			goto loop;
> -		}
> -	}
> +	file =3D __fget_files_rcu(files, fd, mask, refs);
>  	rcu_read_unlock();
>  =

>  	return file;

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============5109573292471065687==--

