Content-Type: multipart/mixed; boundary="===============1357945147103865777=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [fget] 054aa8d439: will-it-scale.per_thread_ops -5.7% regression
Date: Mon, 13 Dec 2021 18:57:29 +0800
Message-ID: <20211213105728.GA21139@linux.intel.com>
In-Reply-To: <CAHk-=wgxd2DqzM3PAsFmzJDHFggxg7ODTQxfJoGCRDbjgMm8nA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1357945147103865777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, Dec 10, 2021 at 10:33:43AM -0800, Linus Torvalds wrote:
> On Thu, Dec 9, 2021 at 9:38 PM kernel test robot <oliver.sang@intel.com=
> wrote:
> >
> > FYI, we noticed a -5.7% regression of will-it-scale.per_thread_ops due =
to commit:
> > 054aa8d439b9  ("fget: check that the fd still exists after getting a re=
f to it")
> =

> Well, some downside of the new checks was expected, that's just much
> more than I really like or would have thought.
> =

> But it's exactly where you'd expect:
> =

> >      27.16 =C2=B1 10%      +4.3       31.51 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.__fget_light.do_sys_poll.__x64_sys_poll.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
> >      22.91 =C2=B1 10%      +4.4       27.34 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.__fget_files.__fget_light.do_sys_poll.__x64_sys_poll.do_s=
yscall_64
> >      26.33 =C2=B1 10%      +4.4       30.70 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__fget_light
> >      22.92 =C2=B1 10%      +4.4       27.35 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__fget_files
> >      22.70 =C2=B1 10%      +4.4       27.11 =C2=B1  2%  perf-profile.se=
lf.cycles-pp.__fget_files
> =

> although there's odd spikes in dTLB-loads etc.
> =

> I checked whether it's some unexpected code generation issue, but the
> new "re-check file table after refcount update" really looks very
> cheap when I look at what gcc generates, there's nothing really
> unexpected there.
> =

> What did change was:
> =

>  (a) some branches go other ways, which might well affect branch
> prediction and just be unlucky. It might be that just marking the
> mismatch case "unlikely()" will help.
> =

>  (b) the obvious few new instructions (re-load and check file table
> pointer, re-load and check file pointer)
> =

>  (c) that __fget_files() function is now no longer a leaf function in
> a simple config case, since it calls "fput_many" in the error case.
> =

> And that (c) is worth mentioning simply because it means that the
> function goes from not having any stack frame at all, to having to
> save/restore four registers. So now it has the usual push/pop
> sequences.
> =

> It may also be that the test-case actually does a lot of threaded
> open/close/poll, and either actually triggers the re-lookup looping
> case (unlikely) or just sees a lot of cacheline bouncing that now got
> worse due to the re-check of the file pointer.
> =

> So this regression looks real, and the issue seems to be that
> __fget_files() really is _that_ important for this do_sys_poll()
> benchmark, and even just the handful of extra instructions end up
> being meaningful.
> =

> Oliver - I'm attaching the obvious "unlikely9)" oneliner in case it's
> just "gcc thought the retry loop was the common case" issue and bad
> branch prediction.

We tested your patch, it didn't work, still has -6.0% regression, thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/thread/50%/debian-10.4-x86_64-20200603.=
cgz/lkp-ivb-2ep1/poll2/will-it-scale/0x42e

commit:
  5f58da2bef ("Merge tag 'drm-fixes-2021-12-03-1' of git://anongit.freedesk=
top.org/drm/drm")
  054aa8d439 ("fget: check that the fd still exists after getting a ref to =
it")
  ef8c68873e ("fixup-for-054aa8d439")

5f58da2befa58edf 054aa8d439b9185d4f5eb9a9028 ef8c68873e75cf486bec22c3e8d =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

   6666720            -5.7%    6288280            -6.0%    6268295        w=
ill-it-scale.24.threads
    277779            -5.7%     262011            -6.0%     261178        w=
ill-it-scale.per_thread_ops
   6666720            -5.7%    6288280            -6.0%    6268295        w=
ill-it-scale.workload
     28.74 =C2=B1 23%      -1.9       26.84 =C2=B1  6%      +1.2       29.9=
2 =C2=B1 25%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_sta=
te.cpuidle_enter.do_idle.cpu_startup_entry
     27.82 =C2=B1 23%      -1.9       25.93 =C2=B1  5%      +1.4       29.2=
0 =C2=B1 26%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_st=
artup_entry.start_secondary.secondary_startup_64_no_verify
     27.82 =C2=B1 23%      -1.9       25.93 =C2=B1  5%      +1.4       29.2=
0 =C2=B1 26%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_=
enter.do_idle.cpu_startup_entry.start_secondary
     27.83 =C2=B1 23%      -1.9       25.94 =C2=B1  5%      +1.4       29.2=
0 =C2=B1 26%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_seco=
ndary.secondary_startup_64_no_verify
     27.83 =C2=B1 23%      -1.9       25.94 =C2=B1  5%      +1.4       29.2=
0 =C2=B1 26%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.st=
art_secondary.secondary_startup_64_no_verify
     27.83 =C2=B1 23%      -1.9       25.94 =C2=B1  5%      +1.4       29.2=
0 =C2=B1 26%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_st=
artup_64_no_verify
     28.81 =C2=B1 23%      -1.9       26.93 =C2=B1  6%      +1.2       29.9=
8 =C2=B1 25%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_veri=
fy
     19.12 =C2=B1  9%      -1.7       17.39 =C2=B1  2%      -2.5       16.6=
4 =C2=B1 11%  perf-profile.calltrace.cycles-pp.fput_many.do_sys_poll.__x64_=
sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.26 =C2=B1100%      -0.2        0.10 =C2=B1223%      -0.1        0.1=
7 =C2=B1141%  perf-profile.calltrace.cycles-pp.__kmalloc.do_sys_poll.__x64_=
sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.88 =C2=B1  9%      -0.1        2.76 =C2=B1  2%      -0.2        2.6=
4 =C2=B1 11%  perf-profile.calltrace.cycles-pp.testcase
      3.27 =C2=B1  9%      -0.1        3.18 =C2=B1  2%      -0.2        3.0=
4 =C2=B1 11%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do=
_syscall_64.entry_SYSCALL_64_after_hwframe.__poll
      1.70 =C2=B1  9%      -0.1        1.63 =C2=B1  2%      -0.1        1.5=
6 =C2=B1 11%  perf-profile.calltrace.cycles-pp.__fdget.do_sys_poll.__x64_sy=
s_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.70 =C2=B1 10%      -0.1        1.64 =C2=B1  2%      -0.1        1.5=
8 =C2=B1 10%  perf-profile.calltrace.cycles-pp.fput.do_sys_poll.__x64_sys_p=
oll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.04 =C2=B1  8%      -0.1        0.98 =C2=B1  4%      -0.1        0.9=
6 =C2=B1 11%  perf-profile.calltrace.cycles-pp.__check_object_size.do_sys_p=
oll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.64 =C2=B1  9%      -0.1        1.59 =C2=B1  3%      -0.1        1.5=
0 =C2=B1 10%  perf-profile.calltrace.cycles-pp.__entry_text_start.__poll
      1.69 =C2=B1  9%      -0.0        1.65 =C2=B1  3%      -0.1        1.5=
7 =C2=B1 12%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__=
poll
      1.11 =C2=B1  9%      -0.0        1.08 =C2=B1  4%      -0.1        1.0=
2 =C2=B1  9%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_stri=
ng._copy_from_user.do_sys_poll.__x64_sys_poll.do_syscall_64
      1.48 =C2=B1  8%      -0.0        1.45 =C2=B1  4%      -0.1        1.3=
8 =C2=B1 10%  perf-profile.calltrace.cycles-pp._copy_from_user.do_sys_poll.=
__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.94 =C2=B1 57%      -0.0        0.92 =C2=B1 54%      -0.2        0.7=
4 =C2=B1 56%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_kern=
el.secondary_startup_64_no_verify
      0.94 =C2=B1 57%      -0.0        0.92 =C2=B1 54%      -0.2        0.7=
4 =C2=B1 56%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.st=
art_kernel.secondary_startup_64_no_verify
      0.94 =C2=B1 57%      -0.0        0.92 =C2=B1 54%      -0.2        0.7=
4 =C2=B1 56%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_st=
artup_entry.start_kernel.secondary_startup_64_no_verify
      0.94 =C2=B1 57%      -0.0        0.92 =C2=B1 54%      -0.2        0.7=
4 =C2=B1 56%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_=
enter.do_idle.cpu_startup_entry.start_kernel
      0.94 =C2=B1 57%      -0.0        0.92 =C2=B1 54%      -0.2        0.7=
4 =C2=B1 56%  perf-profile.calltrace.cycles-pp.start_kernel.secondary_start=
up_64_no_verify
      0.54 =C2=B1 45%      +0.1        0.59 =C2=B1  9%      +0.1        0.6=
6 =C2=B1  6%  perf-profile.calltrace.cycles-pp.kfree.do_sys_poll.__x64_sys_=
poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
     67.66 =C2=B1  9%      +2.0       69.69 =C2=B1  2%      -0.9       66.7=
8 =C2=B1 10%  perf-profile.calltrace.cycles-pp.__poll
     63.66 =C2=B1  9%      +2.2       65.82 =C2=B1  2%      -0.6       63.1=
0 =C2=B1 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwfra=
me.__poll
     63.48 =C2=B1  9%      +2.2       65.64 =C2=B1  2%      -0.6       62.9=
3 =C2=B1 10%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_=
64_after_hwframe.__poll
     59.85 =C2=B1  9%      +2.3       62.12 =C2=B1  2%      -0.3       59.5=
6 =C2=B1 10%  perf-profile.calltrace.cycles-pp.__x64_sys_poll.do_syscall_64=
.entry_SYSCALL_64_after_hwframe.__poll
     57.74 =C2=B1  9%      +2.4       60.09 =C2=B1  2%      -0.1       57.6=
2 =C2=B1 10%  perf-profile.calltrace.cycles-pp.do_sys_poll.__x64_sys_poll.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe.__poll
     27.16 =C2=B1 10%      +4.3       31.51 =C2=B1  2%      +3.0       30.2=
1 =C2=B1 10%  perf-profile.calltrace.cycles-pp.__fget_light.do_sys_poll.__x=
64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
     22.91 =C2=B1 10%      +4.4       27.34 =C2=B1  2%      +3.3       26.2=
5 =C2=B1 10%  perf-profile.calltrace.cycles-pp.__fget_files.__fget_light.do=
_sys_poll.__x64_sys_poll.do_syscall_64
     27.83 =C2=B1 23%      -1.9       25.94 =C2=B1  5%      +1.4       29.2=
0 =C2=B1 26%  perf-profile.children.cycles-pp.start_secondary
     28.80 =C2=B1 23%      -1.9       26.92 =C2=B1  6%      +1.2       29.9=
8 =C2=B1 25%  perf-profile.children.cycles-pp.cpuidle_enter
     28.80 =C2=B1 23%      -1.9       26.92 =C2=B1  6%      +1.2       29.9=
8 =C2=B1 25%  perf-profile.children.cycles-pp.cpuidle_enter_state
     28.81 =C2=B1 23%      -1.9       26.93 =C2=B1  6%      +1.2       29.9=
8 =C2=B1 25%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     28.81 =C2=B1 23%      -1.9       26.93 =C2=B1  6%      +1.2       29.9=
8 =C2=B1 25%  perf-profile.children.cycles-pp.cpu_startup_entry
     28.81 =C2=B1 23%      -1.9       26.93 =C2=B1  6%      +1.2       29.9=
8 =C2=B1 25%  perf-profile.children.cycles-pp.do_idle
     28.78 =C2=B1 23%      -1.9       26.91 =C2=B1  6%      +1.2       29.9=
6 =C2=B1 25%  perf-profile.children.cycles-pp.intel_idle
     18.28 =C2=B1  9%      -1.7       16.59 =C2=B1  2%      -2.4       15.8=
7 =C2=B1 11%  perf-profile.children.cycles-pp.fput_many
      2.90 =C2=B1  9%      -0.1        2.76 =C2=B1  2%      -0.3        2.6=
4 =C2=B1 11%  perf-profile.children.cycles-pp.testcase
      3.29 =C2=B1  9%      -0.1        3.20 =C2=B1  2%      -0.2        3.0=
7 =C2=B1 11%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.69 =C2=B1  9%      -0.1        1.63 =C2=B1  2%      -0.1        1.5=
7 =C2=B1 10%  perf-profile.children.cycles-pp.__fdget
      1.70 =C2=B1  9%      -0.1        1.64 =C2=B1  2%      -0.1        1.5=
7 =C2=B1 10%  perf-profile.children.cycles-pp.fput
      1.82 =C2=B1  9%      -0.1        1.76 =C2=B1  3%      -0.2        1.6=
7 =C2=B1 11%  perf-profile.children.cycles-pp.__entry_text_start
      1.07 =C2=B1  9%      -0.1        1.02 =C2=B1  4%      -0.1        0.9=
9 =C2=B1 10%  perf-profile.children.cycles-pp.__check_object_size
      1.90 =C2=B1  9%      -0.0        1.86 =C2=B1  2%      -0.1        1.7=
7 =C2=B1 12%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      1.50 =C2=B1  8%      -0.0        1.47 =C2=B1  4%      -0.1        1.3=
9 =C2=B1 10%  perf-profile.children.cycles-pp._copy_from_user
      1.12 =C2=B1  9%      -0.0        1.09 =C2=B1  4%      -0.1        1.0=
3 =C2=B1 10%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      0.30 =C2=B1  8%      -0.0        0.26 =C2=B1 11%      -0.0        0.2=
9 =C2=B1 20%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.12 =C2=B1  8%      -0.0        0.09 =C2=B1 11%      -0.0        0.0=
9 =C2=B1 12%  perf-profile.children.cycles-pp.poll(a)plt
      0.04 =C2=B1 71%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
3 =C2=B1100%  perf-profile.children.cycles-pp.seq_read_iter
      0.17 =C2=B1 26%      -0.0        0.14 =C2=B1 32%      -0.0        0.1=
4 =C2=B1 23%  perf-profile.children.cycles-pp.cmd_sched
      0.17 =C2=B1 26%      -0.0        0.14 =C2=B1 32%      -0.0        0.1=
4 =C2=B1 23%  perf-profile.children.cycles-pp.cmd_record
      0.04 =C2=B1 71%      -0.0        0.02 =C2=B1144%      -0.0        0.0=
3 =C2=B1100%  perf-profile.children.cycles-pp.ksys_read
      0.04 =C2=B1 71%      -0.0        0.02 =C2=B1144%      -0.0        0.0=
3 =C2=B1100%  perf-profile.children.cycles-pp.vfs_read
      0.61 =C2=B1 13%      -0.0        0.59 =C2=B1  9%      +0.1        0.6=
6 =C2=B1  5%  perf-profile.children.cycles-pp.kfree
      0.17 =C2=B1 26%      -0.0        0.15 =C2=B1 30%      -0.0        0.1=
5 =C2=B1 21%  perf-profile.children.cycles-pp.__libc_start_main
      0.17 =C2=B1 26%      -0.0        0.15 =C2=B1 30%      -0.0        0.1=
5 =C2=B1 21%  perf-profile.children.cycles-pp.main
      0.17 =C2=B1 26%      -0.0        0.15 =C2=B1 30%      -0.0        0.1=
5 =C2=B1 21%  perf-profile.children.cycles-pp.run_builtin
      0.02 =C2=B1142%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.new_sync_write
      0.02 =C2=B1142%      -0.0        0.00            -0.0        0.01 =C2=
=B1223%  perf-profile.children.cycles-pp.ksys_write
      0.02 =C2=B1142%      -0.0        0.00            -0.0        0.01 =C2=
=B1223%  perf-profile.children.cycles-pp.vfs_write
      0.04 =C2=B1 45%      -0.0        0.02 =C2=B1 99%      -0.0        0.0=
2 =C2=B1 99%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.13 =C2=B1 10%      -0.0        0.12 =C2=B1  6%      -0.0        0.1=
2 =C2=B1 15%  perf-profile.children.cycles-pp.kmalloc_slab
      0.02 =C2=B1 99%      -0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1 99%  perf-profile.children.cycles-pp.seq_read
      0.02 =C2=B1 99%      -0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1 99%  perf-profile.children.cycles-pp.__libc_read
      0.15 =C2=B1 26%      -0.0        0.14 =C2=B1 31%      -0.0        0.1=
3 =C2=B1 23%  perf-profile.children.cycles-pp.record__finish_output
      0.15 =C2=B1 26%      -0.0        0.14 =C2=B1 31%      -0.0        0.1=
3 =C2=B1 23%  perf-profile.children.cycles-pp.perf_session__process_events
      0.06 =C2=B1 46%      -0.0        0.04 =C2=B1 73%      -0.0        0.0=
4 =C2=B1 73%  perf-profile.children.cycles-pp.machines__deliver_event
      0.14 =C2=B1 27%      -0.0        0.12 =C2=B1 32%      -0.0        0.1=
2 =C2=B1 19%  perf-profile.children.cycles-pp.process_simple
      0.09 =C2=B1 30%      -0.0        0.08 =C2=B1 34%      -0.0        0.0=
8 =C2=B1 17%  perf-profile.children.cycles-pp.perf_session__process_user_ev=
ent
      0.05 =C2=B1 47%      -0.0        0.04 =C2=B1 71%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.exc_page_fault
      0.10 =C2=B1 24%      -0.0        0.08 =C2=B1 30%      -0.0        0.0=
8 =C2=B1 17%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.02 =C2=B1142%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.poll_select_set_timeout
      0.09 =C2=B1 24%      -0.0        0.08 =C2=B1 28%      -0.0        0.0=
8 =C2=B1 19%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.children.cycles-pp.proc_reg_read
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.perf_output_sample
      0.01 =C2=B1223%      -0.0        0.00            +0.0        0.01 =C2=
=B1223%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.04 =C2=B1 45%      -0.0        0.04 =C2=B1 71%      -0.0        0.0=
0        perf-profile.children.cycles-pp.perf_callchain_user
      0.29 =C2=B1  9%      -0.0        0.28 =C2=B1  4%      -0.0        0.2=
8 =C2=B1 10%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.11 =C2=B1 12%      -0.0        0.10 =C2=B1  8%      -0.0        0.1=
0 =C2=B1 10%  perf-profile.children.cycles-pp.__might_sleep
      0.05 =C2=B1 49%      -0.0        0.05 =C2=B1 52%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.check_stack_object
      0.16 =C2=B1 20%      -0.0        0.16 =C2=B1  9%      -0.0        0.1=
2 =C2=B1 11%  perf-profile.children.cycles-pp.perf_callchain_kernel
      0.12 =C2=B1 20%      -0.0        0.11 =C2=B1  8%      -0.0        0.1=
0 =C2=B1 11%  perf-profile.children.cycles-pp.unwind_next_frame
      0.29 =C2=B1 11%      -0.0        0.28 =C2=B1  5%      -0.0        0.2=
6 =C2=B1  9%  perf-profile.children.cycles-pp.__check_heap_object
      0.43 =C2=B1 19%      +0.0        0.43 =C2=B1 10%      -0.1        0.3=
7 =C2=B1  9%  perf-profile.children.cycles-pp.update_process_times
      0.23 =C2=B1 20%      +0.0        0.23 =C2=B1 11%      -0.0        0.1=
8 =C2=B1  9%  perf-profile.children.cycles-pp.perf_prepare_sample
      0.21 =C2=B1 20%      +0.0        0.21 =C2=B1 10%      -0.0        0.1=
7 =C2=B1 10%  perf-profile.children.cycles-pp.perf_callchain
      0.02 =C2=B1142%      +0.0        0.02 =C2=B1142%      +0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.io_serial_in
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.ordered_events__queue
      0.07 =C2=B1 12%      +0.0        0.07 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 10%  perf-profile.children.cycles-pp.uart_console_write
      0.07 =C2=B1 12%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 10%  perf-profile.children.cycles-pp.serial8250_console_write
      0.21 =C2=B1 21%      +0.0        0.21 =C2=B1 10%      -0.0        0.1=
7 =C2=B1 10%  perf-profile.children.cycles-pp.get_perf_callchain
      0.07 =C2=B1 12%      +0.0        0.07 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 10%  perf-profile.children.cycles-pp.wait_for_xmitr
      0.08 =C2=B1 12%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 12%  perf-profile.children.cycles-pp.vprintk_emit
      0.08 =C2=B1 12%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 12%  perf-profile.children.cycles-pp.console_unlock
      0.48 =C2=B1 17%      +0.0        0.48 =C2=B1  9%      -0.1        0.4=
2 =C2=B1 10%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.32 =C2=B1 21%      +0.0        0.32 =C2=B1 11%      -0.1        0.2=
6 =C2=B1 11%  perf-profile.children.cycles-pp.update_curr
      0.61 =C2=B1 16%      +0.0        0.61 =C2=B1  7%      -0.1        0.5=
5 =C2=B1 10%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interru=
pt
      0.30 =C2=B1 21%      +0.0        0.30 =C2=B1 10%      -0.1        0.2=
4 =C2=B1 10%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.28 =C2=B1 20%      +0.0        0.29 =C2=B1 10%      -0.1        0.2=
3 =C2=B1 11%  perf-profile.children.cycles-pp.__perf_event_overflow
      0.28 =C2=B1 19%      +0.0        0.28 =C2=B1 11%      -0.1        0.2=
3 =C2=B1 10%  perf-profile.children.cycles-pp.perf_event_output_forward
      0.29 =C2=B1 10%      +0.0        0.29 =C2=B1  9%      -0.0        0.2=
8 =C2=B1 10%  perf-profile.children.cycles-pp.__might_fault
      0.08 =C2=B1 12%      +0.0        0.08 =C2=B1 22%      -0.0        0.0=
7 =C2=B1 14%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.worker_thread
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.process_one_work
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.commit_tail
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_plan=
es
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.mgag200_simple_display_pipe_u=
pdate
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.drm_fb_memcpy_dstclip
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.memcpy_toio
      0.07 =C2=B1  8%      +0.0        0.07 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 10%  perf-profile.children.cycles-pp.serial8250_console_putchar
      0.43 =C2=B1 19%      +0.0        0.44 =C2=B1  9%      -0.1        0.3=
8 =C2=B1  9%  perf-profile.children.cycles-pp.tick_sched_handle
      0.57 =C2=B1 16%      +0.0        0.58 =C2=B1  7%      -0.1        0.5=
2 =C2=B1  9%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.05 =C2=B1 47%      +0.0        0.06 =C2=B1  8%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.__unwind_start
      0.28 =C2=B1 20%      +0.0        0.29 =C2=B1 10%      -0.1        0.2=
3 =C2=B1 11%  perf-profile.children.cycles-pp.perf_swevent_overflow
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 11%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 11%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 11%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 11%  perf-profile.children.cycles-pp.irq_work_run
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 11%  perf-profile.children.cycles-pp.irq_work_single
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 11%  perf-profile.children.cycles-pp._printk
      0.44 =C2=B1 19%      +0.0        0.45 =C2=B1  9%      -0.1        0.3=
8 =C2=B1  9%  perf-profile.children.cycles-pp.tick_sched_timer
      0.54 =C2=B1 17%      +0.0        0.55 =C2=B1  8%      -0.1        0.4=
9 =C2=B1 10%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.54 =C2=B1 17%      +0.0        0.54 =C2=B1  8%      -0.1        0.4=
8 =C2=B1 10%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.37 =C2=B1 19%      +0.0        0.37 =C2=B1 10%      -0.1        0.3=
1 =C2=B1  9%  perf-profile.children.cycles-pp.task_tick_fair
      0.06 =C2=B1 47%      +0.0        0.07 =C2=B1 18%      -0.0        0.0=
6 =C2=B1 21%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  8%      -0.0        0.0=
7 =C2=B1 11%  perf-profile.children.cycles-pp.irq_work_run_list
      0.98 =C2=B1 47%      +0.0        0.99 =C2=B1 38%      -0.2        0.7=
8 =C2=B1 45%  perf-profile.children.cycles-pp.start_kernel
      0.29 =C2=B1 21%      +0.0        0.30 =C2=B1 10%      -0.1        0.2=
4 =C2=B1 10%  perf-profile.children.cycles-pp.perf_tp_event
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%      +0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.queue_event
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.01 =C2=
=B1223%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%      +0.0        0.0=
2 =C2=B1 99%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.02 =C2=
=B1 99%  perf-profile.children.cycles-pp.poll_freewait
      0.39 =C2=B1 19%      +0.0        0.40 =C2=B1  9%      -0.1        0.3=
4 =C2=B1  9%  perf-profile.children.cycles-pp.scheduler_tick
      0.04 =C2=B1 71%      +0.0        0.04 =C2=B1 45%      -0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.06 =C2=B1  8%      +0.0        0.07 =C2=B1 11%      +0.0        0.0=
6 =C2=B1 13%  perf-profile.children.cycles-pp.ret_from_fork
      0.06 =C2=B1  8%      +0.0        0.07 =C2=B1 11%      +0.0        0.0=
6 =C2=B1 13%  perf-profile.children.cycles-pp.kthread
      0.19 =C2=B1 10%      +0.0        0.20 =C2=B1  9%      +0.0        0.1=
9 =C2=B1 10%  perf-profile.children.cycles-pp.__might_resched
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%      -0.0        0.0=
0        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1 70%      -0.0        0.0=
0        perf-profile.children.cycles-pp.__get_user_nocheck_8
      0.50 =C2=B1 12%      +0.0        0.53 =C2=B1  9%      -0.0        0.4=
8 =C2=B1 11%  perf-profile.children.cycles-pp.__kmalloc
     67.89 =C2=B1  9%      +2.0       69.92 =C2=B1  2%      -0.9       67.0=
0 =C2=B1 10%  perf-profile.children.cycles-pp.__poll
     63.84 =C2=B1  9%      +2.1       65.97 =C2=B1  2%      -0.6       63.2=
6 =C2=B1 10%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     63.66 =C2=B1  9%      +2.1       65.80 =C2=B1  2%      -0.6       63.0=
9 =C2=B1 10%  perf-profile.children.cycles-pp.do_syscall_64
     59.86 =C2=B1  9%      +2.3       62.12 =C2=B1  2%      -0.3       59.5=
7 =C2=B1 10%  perf-profile.children.cycles-pp.__x64_sys_poll
     59.47 =C2=B1  9%      +2.3       61.75 =C2=B1  2%      -0.2       59.2=
2 =C2=B1 10%  perf-profile.children.cycles-pp.do_sys_poll
     26.33 =C2=B1 10%      +4.4       30.70 =C2=B1  2%      +3.1       29.4=
3 =C2=B1 10%  perf-profile.children.cycles-pp.__fget_light
     22.92 =C2=B1 10%      +4.4       27.35 =C2=B1  2%      +3.3       26.2=
6 =C2=B1 10%  perf-profile.children.cycles-pp.__fget_files
     28.78 =C2=B1 23%      -1.9       26.91 =C2=B1  6%      +1.2       29.9=
6 =C2=B1 25%  perf-profile.self.cycles-pp.intel_idle
     17.29 =C2=B1  9%      -1.6       15.64 =C2=B1  2%      -2.3       14.9=
6 =C2=B1 11%  perf-profile.self.cycles-pp.fput_many
     11.06 =C2=B1  9%      -0.3       10.74 =C2=B1  2%      -0.8       10.2=
9 =C2=B1 10%  perf-profile.self.cycles-pp.do_sys_poll
      2.87 =C2=B1  9%      -0.1        2.74 =C2=B1  2%      -0.2        2.6=
2 =C2=B1 11%  perf-profile.self.cycles-pp.testcase
      3.21 =C2=B1  9%      -0.1        3.12 =C2=B1  2%      -0.2        3.0=
0 =C2=B1 11%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      1.60 =C2=B1  9%      -0.1        1.54 =C2=B1  4%      -0.1        1.4=
7 =C2=B1 10%  perf-profile.self.cycles-pp.__entry_text_start
      1.90 =C2=B1  8%      -0.0        1.86 =C2=B1  3%      -0.1        1.7=
6 =C2=B1 12%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      2.55 =C2=B1  9%      -0.0        2.51 =C2=B1  4%      -0.2        2.3=
6 =C2=B1 12%  perf-profile.self.cycles-pp.__fget_light
      0.84 =C2=B1  8%      -0.0        0.81 =C2=B1  2%      -0.1        0.7=
8 =C2=B1 10%  perf-profile.self.cycles-pp.fput
      0.29 =C2=B1  8%      -0.0        0.26 =C2=B1 11%      -0.0        0.2=
8 =C2=B1 20%  perf-profile.self.cycles-pp.__virt_addr_valid
      1.10 =C2=B1  9%      -0.0        1.07 =C2=B1  4%      -0.1        1.0=
1 =C2=B1 10%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.28 =C2=B1  8%      -0.0        0.26 =C2=B1  5%      -0.0        0.2=
6 =C2=B1 11%  perf-profile.self.cycles-pp.do_syscall_64
      0.84 =C2=B1  9%      -0.0        0.82 =C2=B1  3%      -0.0        0.7=
9 =C2=B1 10%  perf-profile.self.cycles-pp.__fdget
      0.10 =C2=B1  6%      -0.0        0.08 =C2=B1 10%      -0.0        0.0=
8 =C2=B1 14%  perf-profile.self.cycles-pp.poll(a)plt
      0.60 =C2=B1 12%      -0.0        0.59 =C2=B1  9%      +0.1        0.6=
6 =C2=B1  6%  perf-profile.self.cycles-pp.kfree
      0.11 =C2=B1 12%      -0.0        0.09 =C2=B1  7%      -0.0        0.1=
0 =C2=B1 13%  perf-profile.self.cycles-pp._copy_from_user
      0.44 =C2=B1  9%      -0.0        0.43 =C2=B1  3%      -0.0        0.4=
0 =C2=B1 15%  perf-profile.self.cycles-pp.__check_object_size
      0.31 =C2=B1 10%      -0.0        0.30 =C2=B1  3%      -0.0        0.2=
8 =C2=B1 15%  perf-profile.self.cycles-pp.__x64_sys_poll
      0.18 =C2=B1  8%      -0.0        0.17 =C2=B1  5%      -0.0        0.1=
6 =C2=B1 11%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.02 =C2=B1142%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
1 =C2=B1223%  perf-profile.self.cycles-pp.poll_select_set_timeout
      0.04 =C2=B1 71%      -0.0        0.02 =C2=B1 99%      -0.0        0.0=
2 =C2=B1 99%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.12 =C2=B1 10%      -0.0        0.12 =C2=B1  6%      -0.0        0.1=
2 =C2=B1 17%  perf-profile.self.cycles-pp.kmalloc_slab
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.06 =C2=B1 11%      -0.0        0.05 =C2=B1  8%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1142%      -0.0        0.0=
2 =C2=B1141%  perf-profile.self.cycles-pp.check_stack_object
      0.28 =C2=B1 11%      -0.0        0.27 =C2=B1  5%      -0.0        0.2=
5 =C2=B1 11%  perf-profile.self.cycles-pp.__check_heap_object
      0.09 =C2=B1 13%      -0.0        0.09 =C2=B1  7%      -0.0        0.0=
9 =C2=B1 10%  perf-profile.self.cycles-pp.__might_sleep
      0.08 =C2=B1 17%      -0.0        0.08 =C2=B1 25%      -0.0        0.0=
8 =C2=B1 11%  perf-profile.self.cycles-pp.__might_fault
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1 99%      -0.0        0.0=
2 =C2=B1141%  perf-profile.self.cycles-pp.unwind_next_frame
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.02 =C2=B1142%      +0.0        0.02 =C2=B1142%      +0.0        0.0=
2 =C2=B1142%  perf-profile.self.cycles-pp.io_serial_in
      0.11 =C2=B1  9%      +0.0        0.12 =C2=B1  8%      -0.0        0.1=
1 =C2=B1 11%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.44 =C2=B1  8%      +0.0        0.45 =C2=B1  4%      -0.0        0.4=
2 =C2=B1 12%  perf-profile.self.cycles-pp.__poll
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%      +0.0        0.0=
1 =C2=B1223%  perf-profile.self.cycles-pp.queue_event
      0.18 =C2=B1 11%      +0.0        0.19 =C2=B1  8%      -0.0        0.1=
8 =C2=B1 10%  perf-profile.self.cycles-pp.__might_resched
      0.26 =C2=B1 13%      +0.0        0.30 =C2=B1 17%      -0.0        0.2=
5 =C2=B1 13%  perf-profile.self.cycles-pp.__kmalloc
     22.70 =C2=B1 10%      +4.4       27.11 =C2=B1  2%      +3.3       26.0=
4 =C2=B1 10%  perf-profile.self.cycles-pp.__fget_files

> =

> And it would perhaps be interesting to get an actual instruction-level
> profile of that __fget_files() thing for that benchmark, if that
> pinpoints exactly what is going on and in case that would be easy to
> get on that machine.
> =

> Because it might just be truly horrendously bad luck, with the 32-byte
> stack frame meaning that the kernel stack goes one more page down
> (just jhandwaving from the dTLB number spike), and this all being just
> random bad luck on that particular benchmark.
> =

> Of course, the thing about poll() is that for that case, we *don't*
> really need the "re-check the file descriptor" code at all, since the
> resulting fd isn't going to be installed as a new fd, and it doesn't
> matter for the socket garbage collector logic.
> =

> So maybe it was a mistake to put that re-check in the generic fdget()
> code - yes, it should be cheap, but it's also some of the most hot
> code in the kernel on some loads.
> =

> But if we move it elsewhere, we'd need to come up with some list of
> "these cases need it". Some are obvious: dup, dup2, unix domain file
> passing. It's the non-obvious ones I'd worry about.
> =

> Anybody?
> =

>               Linus

>  fs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/fs/file.c b/fs/file.c
> index ad4a8bf3cf10..f802360e240d 100644
> --- a/fs/file.c
> +++ b/fs/file.c
> @@ -858,7 +858,7 @@ static struct file *__fget_files(struct files_struct =
*files, unsigned int fd,
>  			file =3D NULL;
>  		else if (!get_file_rcu_many(file, refs))
>  			goto loop;
> -		else if (files_lookup_fd_raw(files, fd) !=3D file) {
> +		else if (unlikely(files_lookup_fd_raw(files, fd) !=3D file)) {
>  			fput_many(file, refs);
>  			goto loop;
>  		}

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============1357945147103865777==--

