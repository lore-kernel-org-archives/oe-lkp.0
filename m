Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A316101F3
	for <oe-lkp@lists.linux.dev>; Tue, 20 Jun 2023 11:37:04 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7870821d9a1so3243681241.1
        for <oe-lkp@lists.linux.dev>; Tue, 20 Jun 2023 04:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687261023; x=1689853023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oBZhR80OlFSMKde23bfx0FUSOyVdDbo+m3eUAe8tLE=;
        b=hBm+ssDwO4aC4KA11JHXS+PZ+z2QRCdfgA4THvuL8d+Hq+33XswozYvuANzls1VJ5w
         3NsMm1WytakPEBPVhBCWo2buD0JB5gDrcr6ewW3E3yDYMDTpMfHsygGkwrHkj77RQcAM
         LdZXLRX2t0+RTH9sKEc2zxmRCNyeqE+/yX7ZPR8RburnWDwNFywIN3BPFb1oVUOvzSGb
         RkgTSouWgOd4wQxr0O/vWY85Gr8XHGfll5LznwbJloygPcPLsqSUnucvWsgsvFwNnVnP
         0fiDVysFMLiNrP5bxYo18kbumN1XkJZT2ulCPJy8VhXYkYuXC08SMUO5gTGlODjOPRyo
         lHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687261023; x=1689853023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oBZhR80OlFSMKde23bfx0FUSOyVdDbo+m3eUAe8tLE=;
        b=MB56WPpJ3X7XB15MVjqQOlJ5Mle0NrsY29JEh0voKX1cOfiLkqLa7STDRUWZEJ+1oC
         LXsGPJhE0VM+QmfJcKz+avAzKp1XPn7FCkvf8umIdRPo85v1SforJR8wfFwoJsXVgnog
         KOws9bXYwdzUwtVIVUSfHxefL8AKkcAnAyAxWYMXFy8ig3TYwvVDmN5d3SvQbPGSPeNL
         eaphVwCFBOyzCt8mDJDnBDt6ywAFIy2SbjV2+JRgD0Z7+qW8TwiYDvUcukb/06IeQemw
         FTAa5/mEO2zLpO7EsDuNNXnUbt0HZA6FEUMl51RVIQ7Kcuvhfd/XuhoODhxhCJgpr5pu
         oSOQ==
X-Gm-Message-State: AC+VfDyzMbkm63Qvh86RDKulID+EjzEKbfPt0mB1TskphGt0s+M/o+Dv
	8+XBmStg9WdauXBLfQCOu6P0upVliiIgDddXKmHu4xajPzs=
X-Google-Smtp-Source: ACHHUZ5nS8NJoaxrQP4j0W9qraEd/WKJL6WwwqwqVrQeGMKajzKjwFs2tkEn31v4k2zVvmZ6+SWr4KIGEOaB9f+et+M=
X-Received: by 2002:a05:6102:334d:b0:43f:4304:63ce with SMTP id
 j13-20020a056102334d00b0043f430463cemr2974293vse.16.1687261022849; Tue, 20
 Jun 2023 04:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306192245.d77d7216-oliver.sang@intel.com>
In-Reply-To: <202306192245.d77d7216-oliver.sang@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 20 Jun 2023 14:36:51 +0300
Message-ID: <CAOQ4uxj_md8KqiQ=TTMC7Kv5VFtREfB8T3agB+pVH8STye_5Vw@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711: stress-ng.ramfs.ops_per_sec
 -13.0% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 4:44=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -13.0% regression of stress-ng.ramfs.ops_per_=
sec on:
>
>
> commit: e796a59711433d5400947b2dbfaf35d465840842 ("vfs: implement 'vfs wr=
ite barriers'")
> https://github.com/amir73il/linux sb_write_barrier
>

Considering that this commit only adds helpers but never uses them
this regression is a bit surprising.

You had reported regressions in the past on the next commit:
"vfs: prepare for pre-modify permission events on write"

which made sense and I had since fixed and you verified.

The only suspect I can think of is that adding the new s_write_*
members to struct super_block had split the frequently access
members s_fsnotify_connectors and s_readonly_remount into
different cachelines.

I've moved those new members to another location in the
super_block struct and pushed the new branch to:

https://github.com/amir73il/linux sb_write_barrier

I've added another commit at the tip of this branch:
67d1802889f0 ("fsnotify: activate sb write barriers for permission
event watchers")

This commit also adds a new member to struct super_block,
next to s_fsnotify_connectors and s_readonly_remount, but this
new member is also frequently accessed.

I am hoping that you can also verify that the tip commit does not
cause a regression.

Thanks!
Amir.

> testcase: stress-ng
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.0=
0GHz (Cascade Lake) with 128G memory
> parameters:
>
>         nr_threads: 1
>         disk: 1HDD
>         testtime: 60s
>         fs: ext4
>         class: os
>         test: ramfs
>         cpufreq_governor: performance
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202306192245.d77d7216-oliver.san=
g@intel.com
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_gr=
oup/test/testcase/testtime:
>   os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20=
220510.cgz/lkp-csl-d02/ramfs/stress-ng/60s
>
> commit:
>   1af0557e94 ("fanotify: report file range info with FAN_ACCESSS_PERM")
>   e796a59711 ("vfs: implement 'vfs write barriers'")
>
> 1af0557e94fc3d07 e796a59711433d5400947b2dbfa
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       0.14 =C4=85  4%      -0.0        0.13 =C4=85  5%  mpstat.cpu.all.so=
ft%
>     144866 =C4=85  5%     -17.1%     120041 =C4=85  5%  turbostat.C1
>      10.15           +15.2%      11.70        turbostat.RAMWatt
>     187740 =C4=85  2%     -10.7%     167653 =C4=85  2%  vmstat.system.cs
>      82600            -5.3%      78240        vmstat.system.in
>    1371303           -13.0%    1193418 =C4=85  2%  stress-ng.ramfs.ops
>      22854           -13.0%      19890 =C4=85  2%  stress-ng.ramfs.ops_pe=
r_sec
>    2747427           -11.6%    2429872 =C4=85  2%  stress-ng.time.involun=
tary_context_switches
>    3637751          +234.9%   12182075        meminfo.Memused
>      17971        +48231.5%    8685746        meminfo.Percpu
>      90936          +318.7%     380776        meminfo.SUnreclaim
>      38661 =C4=85  9%     -15.1%      32830        meminfo.Shmem
>     185820          +155.8%     475366        meminfo.Slab
>      20482         +2199.2%     470939        meminfo.VmallocUsed
>    4118313          +196.0%   12189340        meminfo.max_used_kB
>    3173298            -6.7%    2960000        proc-vmstat.nr_dirty_backgr=
ound_threshold
>    6354356            -6.7%    5927238        proc-vmstat.nr_dirty_thresh=
old
>   31991368            -6.7%   29855261        proc-vmstat.nr_free_pages
>      84482            -1.8%      82927        proc-vmstat.nr_inactive_ano=
n
>       9666 =C4=85  9%     -15.1%       8208        proc-vmstat.nr_shmem
>      22729          +318.8%      95193        proc-vmstat.nr_slab_unrecla=
imable
>      84482            -1.8%      82927        proc-vmstat.nr_zone_inactiv=
e_anon
>    1201688          +345.6%    5354530 =C4=85  2%  proc-vmstat.numa_hit
>    1197711          +347.0%    5353325 =C4=85  2%  proc-vmstat.numa_local
>     117966            -5.9%     110951        proc-vmstat.pgactivate
>    1887107 =C4=85  2%    +211.6%    5880960 =C4=85  2%  proc-vmstat.pgall=
oc_normal
>    1867687 =C4=85  2%     -23.1%    1435439 =C4=85  4%  proc-vmstat.pgfre=
e
>       3.47 =C4=85  2%     +13.1%       3.92        perf-stat.i.MPKI
>    2.7e+09            -1.4%  2.661e+09        perf-stat.i.branch-instruct=
ions
>       2.94 =C4=85  2%      +9.7       12.62 =C4=85  2%  perf-stat.i.cache=
-miss-rate%
>    1385785 =C4=85  2%    +377.9%    6622542        perf-stat.i.cache-miss=
es
>   45772191           +14.2%   52251891        perf-stat.i.cache-reference=
s
>     196041 =C4=85  2%     -10.7%     174973 =C4=85  2%  perf-stat.i.conte=
xt-switches
>     781.05 =C4=85  2%      -8.0%     718.25 =C4=85  3%  perf-stat.i.cpu-m=
igrations
>      26083 =C4=85 14%     -94.4%       1461        perf-stat.i.cycles-bet=
ween-cache-misses
>     162575 =C4=85  7%     +30.9%     212809 =C4=85  3%  perf-stat.i.dTLB-=
load-misses
>       0.01 =C4=85  4%      +0.0        0.01 =C4=85  3%  perf-stat.i.dTLB-=
store-miss-rate%
>     102941 =C4=85  3%    +119.0%     225459 =C4=85  2%  perf-stat.i.dTLB-=
store-misses
>  1.719e+09            +4.1%   1.79e+09        perf-stat.i.dTLB-stores
>      64.33            -1.6       62.68        perf-stat.i.iTLB-load-miss-=
rate%
>    3323983 =C4=85  3%      -7.4%    3079335 =C4=85  2%  perf-stat.i.iTLB-=
load-misses
>       4052 =C4=85  2%      +8.0%       4375 =C4=85  2%  perf-stat.i.instr=
uctions-per-iTLB-miss
>       0.07 =C4=85 48%    +306.5%       0.27 =C4=85 23%  perf-stat.i.major=
-faults
>      91.27 =C4=85  3%     +85.0%     168.88 =C4=85  7%  perf-stat.i.metri=
c.K/sec
>     167705 =C4=85  5%     +83.6%     307965 =C4=85  3%  perf-stat.i.node-=
loads
>     294581 =C4=85  8%    +866.8%    2848095 =C4=85 12%  perf-stat.i.node-=
stores
>       3.45           +14.3%       3.95        perf-stat.overall.MPKI
>       3.03 =C4=85  3%      +9.7       12.68 =C4=85  2%  perf-stat.overall=
.cache-miss-rate%
>       6505 =C4=85  3%     -79.1%       1359        perf-stat.overall.cycl=
es-between-cache-misses
>       0.01 =C4=85  8%      +0.0        0.01 =C4=85  3%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.01 =C4=85  3%      +0.0        0.01 =C4=85  3%  perf-stat.overall=
.dTLB-store-miss-rate%
>      64.58            -1.7       62.93        perf-stat.overall.iTLB-load=
-miss-rate%
>       3994 =C4=85  3%      +7.7%       4301 =C4=85  2%  perf-stat.overall=
.instructions-per-iTLB-miss
>  2.657e+09            -1.4%  2.619e+09        perf-stat.ps.branch-instruc=
tions
>    1364289 =C4=85  2%    +377.7%    6517813        perf-stat.ps.cache-mis=
ses
>   45049468           +14.1%   51423471        perf-stat.ps.cache-referenc=
es
>     192941 =C4=85  2%     -10.8%     172197 =C4=85  2%  perf-stat.ps.cont=
ext-switches
>     768.70 =C4=85  2%      -8.0%     706.85 =C4=85  3%  perf-stat.ps.cpu-=
migrations
>     160021 =C4=85  7%     +30.9%     209447 =C4=85  3%  perf-stat.ps.dTLB=
-load-misses
>     101316 =C4=85  3%    +119.0%     221881 =C4=85  2%  perf-stat.ps.dTLB=
-store-misses
>  1.692e+09            +4.1%  1.761e+09        perf-stat.ps.dTLB-stores
>    3271471 =C4=85  3%      -7.4%    3030527 =C4=85  2%  perf-stat.ps.iTLB=
-load-misses
>       0.07 =C4=85 48%    +306.3%       0.27 =C4=85 23%  perf-stat.ps.majo=
r-faults
>     165092 =C4=85  5%     +83.6%     303115 =C4=85  3%  perf-stat.ps.node=
-loads
>     290015 =C4=85  8%    +866.5%    2802974 =C4=85 12%  perf-stat.ps.node=
-stores
>      10.46 =C4=85  7%      -1.9        8.54 =C4=85 16%  perf-profile.call=
trace.cycles-pp.umount2
>      10.08 =C4=85  7%      -1.8        8.23 =C4=85 16%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.umount2
>      10.03 =C4=85  7%      -1.8        8.19 =C4=85 16%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
>       6.16 =C4=85  8%      -1.1        5.06 =C4=85 17%  perf-profile.call=
trace.cycles-pp.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.umount2
>       4.23 =C4=85  7%      -0.8        3.46 =C4=85 17%  perf-profile.call=
trace.cycles-pp.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64=
_after_hwframe.umount2
>       4.74 =C4=85  7%      -0.8        3.98 =C4=85  7%  perf-profile.call=
trace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_ex=
it_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       3.82 =C4=85  7%      -0.8        3.07 =C4=85 15%  perf-profile.call=
trace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe.umount2
>       3.84 =C4=85  7%      -0.7        3.09 =C4=85 15%  perf-profile.call=
trace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.umount2
>       4.62 =C4=85  7%      -0.7        3.88 =C4=85  8%  perf-profile.call=
trace.cycles-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prep=
are.syscall_exit_to_user_mode.do_syscall_64
>       3.80 =C4=85  7%      -0.7        3.14 =C4=85 16%  perf-profile.call=
trace.cycles-pp.do_umount.path_umount.__x64_sys_umount.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
>       3.07 =C4=85  6%      -0.6        2.45 =C4=85 14%  perf-profile.call=
trace.cycles-pp.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
>       2.64 =C4=85  6%      -0.5        2.10 =C4=85 13%  perf-profile.call=
trace.cycles-pp.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_m=
ount.do_syscall_64
>       2.53 =C4=85  6%      -0.5        2.02 =C4=85 13%  perf-profile.call=
trace.cycles-pp.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mou=
nt.__x64_sys_mount
>       2.83 =C4=85  7%      -0.5        2.32 =C4=85 12%  perf-profile.call=
trace.cycles-pp.stress_rndstr
>       2.48 =C4=85  7%      -0.5        1.96 =C4=85 12%  perf-profile.call=
trace.cycles-pp.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt.=
do_new_mount
>       2.44 =C4=85  7%      -0.5        1.94 =C4=85 13%  perf-profile.call=
trace.cycles-pp.clone_mnt.copy_tree.propagate_one.propagate_mnt.attach_recu=
rsive_mnt
>       2.39 =C4=85  8%      -0.5        1.91 =C4=85 16%  perf-profile.call=
trace.cycles-pp.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_u=
ser_mode_loop.exit_to_user_mode_prepare
>       2.11 =C4=85  7%      -0.4        1.68 =C4=85 12%  perf-profile.call=
trace.cycles-pp.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one.propagate_mn=
t
>       1.31 =C4=85  9%      -0.4        0.88 =C4=85 16%  perf-profile.call=
trace.cycles-pp.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super.vfs_g=
et_tree
>       1.85 =C4=85  8%      -0.4        1.46 =C4=85 11%  perf-profile.call=
trace.cycles-pp.unlink
>       1.20 =C4=85  9%      -0.4        0.81 =C4=85 16%  perf-profile.call=
trace.cycles-pp.pcpu_alloc.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_=
super
>       1.77 =C4=85  9%      -0.4        1.39 =C4=85 11%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
>       1.77 =C4=85  8%      -0.4        1.40 =C4=85 11%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
>       1.74 =C4=85  9%      -0.4        1.38 =C4=85 11%  perf-profile.call=
trace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.unlink
>       1.40 =C4=85  9%      -0.3        1.05 =C4=85 15%  perf-profile.call=
trace.cycles-pp.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one
>       1.59 =C4=85  8%      -0.3        1.26 =C4=85 11%  perf-profile.call=
trace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64=
_after_hwframe.unlink
>       0.66 =C4=85 12%      -0.3        0.37 =C4=85 70%  perf-profile.call=
trace.cycles-pp.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64=
.entry_SYSCALL_64_after_hwframe
>       0.86 =C4=85 12%      -0.3        0.58 =C4=85 46%  perf-profile.call=
trace.cycles-pp.srcu_advance_state.process_srcu.process_one_work.worker_thr=
ead.kthread
>       0.87 =C4=85  9%      -0.3        0.60 =C4=85 46%  perf-profile.call=
trace.cycles-pp.unregister_shrinker.deactivate_locked_super.cleanup_mnt.tas=
k_work_run.exit_to_user_mode_loop
>       0.83 =C4=85  6%      -0.2        0.58 =C4=85 45%  perf-profile.call=
trace.cycles-pp.shmem_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__=
x64_sys_mount
>       0.78 =C4=85 12%      -0.2        0.54 =C4=85 45%  perf-profile.call=
trace.cycles-pp.try_check_zero.srcu_advance_state.process_srcu.process_one_=
work.worker_thread
>       0.75 =C4=85  7%      -0.2        0.51 =C4=85 45%  perf-profile.call=
trace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_s=
ys_openat2
>       1.07 =C4=85  7%      -0.2        0.84 =C4=85 17%  perf-profile.call=
trace.cycles-pp.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.w=
orker_thread.kthread
>       0.59 =C4=85  2%      -0.2        0.36 =C4=85 70%  perf-profile.call=
trace.cycles-pp.__sync_rcu_exp_select_node_cpus.process_one_work.worker_thr=
ead.kthread.ret_from_fork
>       1.08 =C4=85  6%      -0.2        0.85 =C4=85 17%  perf-profile.call=
trace.cycles-pp.wait_rcu_exp_gp.process_one_work.worker_thread.kthread.ret_=
from_fork
>       1.03 =C4=85 11%      -0.2        0.80 =C4=85 16%  perf-profile.call=
trace.cycles-pp.strncpy_from_user.getname_flags.user_path_at_empty.__x64_sy=
s_umount.do_syscall_64
>       0.73 =C4=85  4%      -0.2        0.52 =C4=85 46%  perf-profile.call=
trace.cycles-pp.mnt_get_count.mntput_no_expire.namespace_unlock.do_umount.p=
ath_umount
>       0.69 =C4=85  7%      -0.2        0.49 =C4=85 44%  perf-profile.call=
trace.cycles-pp.do_rmdir.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe.rmdir
>       1.03 =C4=85  3%      -0.2        0.84 =C4=85 16%  perf-profile.call=
trace.cycles-pp.mntput_no_expire.namespace_unlock.do_umount.path_umount.__x=
64_sys_umount
>       0.92 =C4=85  7%      -0.2        0.75 =C4=85  9%  perf-profile.call=
trace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2._=
_x64_sys_openat
>       1.09            -0.2        0.92 =C4=85  6%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
>       1.10            -0.2        0.94 =C4=85  5%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.__lxstat64
>       1.19            -0.2        1.04 =C4=85  6%  perf-profile.calltrace=
.cycles-pp.__lxstat64
>       0.85 =C4=85 11%      -0.2        0.69 =C4=85  7%  perf-profile.call=
trace.cycles-pp.rmdir
>       1.06            -0.2        0.90 =C4=85  6%  perf-profile.calltrace=
.cycles-pp.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe._=
_lxstat64
>       0.78 =C4=85 10%      -0.1        0.63 =C4=85  6%  perf-profile.call=
trace.cycles-pp.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.rmdir
>       0.79 =C4=85 11%      -0.1        0.65 =C4=85  5%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.rmdir
>       0.79 =C4=85 11%      -0.1        0.65 =C4=85  5%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
>       0.94 =C4=85  3%      -0.1        0.80 =C4=85  8%  perf-profile.call=
trace.cycles-pp.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe.__lxstat64
>       0.74 =C4=85  3%      -0.1        0.64 =C4=85  7%  perf-profile.call=
trace.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
>       0.64 =C4=85 12%      +0.1        0.78 =C4=85 14%  perf-profile.call=
trace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.lo=
ad_balance.newidle_balance
>       1.07 =C4=85 10%      +0.2        1.24 =C4=85 11%  perf-profile.call=
trace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64=
_sys_clock_nanosleep
>       1.06 =C4=85  9%      +0.2        1.24 =C4=85 11%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_n=
sleep
>       1.18 =C4=85  9%      +0.2        1.37 =C4=85  9%  perf-profile.call=
trace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_cloc=
k_nanosleep.do_syscall_64
>       1.20 =C4=85 10%      +0.2        1.40 =C4=85  9%  perf-profile.call=
trace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.20 =C4=85 10%      +0.2        1.40 =C4=85  9%  perf-profile.call=
trace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry=
_SYSCALL_64_after_hwframe.clock_nanosleep
>       1.24 =C4=85 11%      +0.2        1.45 =C4=85 10%  perf-profile.call=
trace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.clock_nanosleep
>       1.26 =C4=85 11%      +0.2        1.47 =C4=85 10%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanoslee=
p
>       1.27 =C4=85 11%      +0.2        1.48 =C4=85 10%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
>       1.34 =C4=85 11%      +0.2        1.58 =C4=85  9%  perf-profile.call=
trace.cycles-pp.clock_nanosleep
>       0.00            +0.8        0.79 =C4=85 20%  perf-profile.calltrace=
.cycles-pp.memset_orig.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_=
fc
>       0.00            +1.6        1.61 =C4=85 31%  perf-profile.calltrace=
.cycles-pp.pcpu_find_block_fit.pcpu_alloc.init_srcu_struct_fields.alloc_sup=
er.sget_fc
>       9.19 =C4=85  7%      +3.2       12.40 =C4=85 11%  perf-profile.call=
trace.cycles-pp.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.mount
>       9.28 =C4=85  7%      +3.2       12.49 =C4=85 11%  perf-profile.call=
trace.cycles-pp.mount
>       9.21 =C4=85  7%      +3.2       12.43 =C4=85 11%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
>       9.23 =C4=85  7%      +3.2       12.44 =C4=85 11%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.mount
>       8.33 =C4=85  7%      +3.4       11.70 =C4=85 11%  perf-profile.call=
trace.cycles-pp.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64=
_after_hwframe.mount
>       3.18 =C4=85  6%      +4.3        7.52 =C4=85 14%  perf-profile.call=
trace.cycles-pp.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount.do_=
syscall_64
>       3.19 =C4=85  6%      +4.3        7.54 =C4=85 14%  perf-profile.call=
trace.cycles-pp.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
>       0.00            +4.5        4.48 =C4=85 22%  perf-profile.calltrace=
.cycles-pp.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_s=
uper
>       1.87 =C4=85  8%      +4.6        6.48 =C4=85 15%  perf-profile.call=
trace.cycles-pp.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_m=
ount
>       1.73 =C4=85  9%      +4.6        6.37 =C4=85 16%  perf-profile.call=
trace.cycles-pp.alloc_super.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount
>       0.00            +5.1        5.13 =C4=85 19%  perf-profile.calltrace=
.cycles-pp.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super.vfs_ge=
t_tree
>      10.53 =C4=85  7%      -1.9        8.60 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.umount2
>       6.16 =C4=85  8%      -1.1        5.06 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.__x64_sys_umount
>       4.24 =C4=85  7%      -0.8        3.46 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.path_umount
>       4.77 =C4=85  7%      -0.7        4.09 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.task_work_run
>       3.07 =C4=85  6%      -0.6        2.46 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.attach_recursive_mnt
>       2.71 =C4=85  7%      -0.6        2.13 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.alloc_vfsmnt
>       3.03 =C4=85  7%      -0.5        2.48 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.stress_rndstr
>       2.64 =C4=85  6%      -0.5        2.10 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.propagate_mnt
>       2.54 =C4=85  7%      -0.5        2.02 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.propagate_one
>       2.48 =C4=85  7%      -0.5        1.97 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.copy_tree
>       2.45 =C4=85  7%      -0.5        1.96 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.clone_mnt
>       2.39 =C4=85  8%      -0.5        1.91 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.deactivate_locked_super
>       1.31 =C4=85  9%      -0.4        0.89 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.__percpu_init_rwsem
>       1.86 =C4=85  8%      -0.4        1.47 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.unlink
>       2.50 =C4=85  8%      -0.4        2.12 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.getname_flags
>       1.75 =C4=85  9%      -0.4        1.38 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.__x64_sys_unlink
>       1.76 =C4=85  8%      -0.3        1.41 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.mnt_get_count
>       1.59 =C4=85  8%      -0.3        1.26 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.do_unlinkat
>       1.90 =C4=85  8%      -0.3        1.59 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.strncpy_from_user
>       1.33 =C4=85  8%      -0.3        1.07 =C4=85  3%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       1.36 =C4=85  9%      -0.3        1.10 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc_lru
>       0.89 =C4=85 13%      -0.2        0.64 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.__wait_for_common
>       1.07 =C4=85  7%      -0.2        0.84 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.sync_rcu_exp_select_cpus
>       1.08 =C4=85  6%      -0.2        0.85 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.wait_rcu_exp_gp
>       0.97 =C4=85  5%      -0.2        0.74 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.__filename_parentat
>       0.90 =C4=85  5%      -0.2        0.68 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.path_parentat
>       0.86 =C4=85 11%      -0.2        0.67 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.srcu_advance_state
>       0.82 =C4=85 12%      -0.2        0.64 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.try_check_zero
>       0.93 =C4=85  8%      -0.2        0.74 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.slab_pre_alloc_hook
>       0.67 =C4=85 14%      -0.2        0.49 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.schedule_timeout
>       0.93 =C4=85 10%      -0.2        0.75 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.alloc_inode
>       0.83 =C4=85  6%      -0.2        0.65 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.shmem_fill_super
>       0.93 =C4=85  7%      -0.2        0.76 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.open_last_lookups
>       1.24            -0.2        1.07 =C4=85  6%  perf-profile.children.=
cycles-pp.__lxstat64
>       0.88 =C4=85  5%      -0.2        0.71 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.__check_object_size
>       0.75 =C4=85  7%      -0.2        0.60 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.lookup_open
>       0.86 =C4=85 10%      -0.2        0.70 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.rmdir
>       0.66 =C4=85 12%      -0.2        0.51 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.vfs_create_mount
>       1.07            -0.2        0.92 =C4=85  7%  perf-profile.children.=
cycles-pp.__do_sys_newlstat
>       0.78 =C4=85 10%      -0.1        0.63 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.__x64_sys_rmdir
>       0.69 =C4=85  5%      -0.1        0.56 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.__d_alloc
>       0.73 =C4=85  2%      -0.1        0.60 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.__sync_rcu_exp_select_node_cpus
>       0.69 =C4=85  7%      -0.1        0.57 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.do_rmdir
>       0.41 =C4=85  4%      -0.1        0.30 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.xas_store
>       0.16 =C4=85 22%      -0.1        0.06 =C4=85 60%  perf-profile.chil=
dren.cycles-pp.pcpu_block_refresh_hint
>       0.47 =C4=85  9%      -0.1        0.38 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.d_alloc
>       0.41 =C4=85 10%      -0.1        0.33 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.truncate_inode_pages_range
>       0.39 =C4=85  5%      -0.1        0.32 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.check_heap_object
>       0.39 =C4=85  4%      -0.1        0.32 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.list_lru_destroy
>       0.33 =C4=85  5%      -0.1        0.27 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.memcg_destroy_list_lru
>       0.24 =C4=85  7%      -0.1        0.17 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       0.16 =C4=85  9%      -0.1        0.10 =C4=85 28%  perf-profile.chil=
dren.cycles-pp.change_mnt_propagation
>       0.60 =C4=85  8%      -0.1        0.54 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.__dentry_kill
>       0.24 =C4=85 11%      -0.1        0.18 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.__virt_addr_valid
>       0.24 =C4=85 15%      -0.1        0.18 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.security_capable
>       0.23 =C4=85  3%      -0.1        0.17 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.copy_mount_options
>       0.18 =C4=85  5%      -0.1        0.12 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.memcg_init_list_lru_one
>       0.09 =C4=85 15%      -0.0        0.04 =C4=85 73%  perf-profile.chil=
dren.cycles-pp.mnt_release_group_id
>       0.22 =C4=85  6%      -0.0        0.18 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.fsnotify_grab_connector
>       0.11 =C4=85 16%      -0.0        0.07 =C4=85 24%  perf-profile.chil=
dren.cycles-pp.syscall_enter_from_user_mode
>       0.12 =C4=85 25%      -0.0        0.08 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.__smp_call_single_queue
>       0.18 =C4=85  5%      -0.0        0.14 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.wq_worker_sleeping
>       0.12 =C4=85 11%      +0.0        0.16 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.read_tsc
>       0.08 =C4=85  9%      +0.1        0.14 =C4=85 28%  perf-profile.chil=
dren.cycles-pp.tick_nohz_next_event
>       0.15 =C4=85  6%      +0.1        0.22 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       0.00            +0.1        0.07 =C4=85 20%  perf-profile.children.=
cycles-pp.pcpu_chunk_refresh_hint
>       0.00            +0.1        0.08 =C4=85 14%  perf-profile.children.=
cycles-pp.init_timer_key
>       0.00            +0.1        0.10 =C4=85 29%  perf-profile.children.=
cycles-pp.rmqueue_bulk
>       0.04 =C4=85 50%      +0.2        0.21 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.get_page_from_freelist
>       0.00            +0.2        0.18 =C4=85 19%  perf-profile.children.=
cycles-pp.rcu_segcblist_init
>       0.00            +0.2        0.18 =C4=85 20%  perf-profile.children.=
cycles-pp.rmqueue
>       0.08 =C4=85  9%      +0.2        0.26 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.__alloc_pages
>       1.18 =C4=85  9%      +0.2        1.37 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.do_nanosleep
>       1.20 =C4=85 10%      +0.2        1.40 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.hrtimer_nanosleep
>       1.21 =C4=85 10%      +0.2        1.41 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.common_nsleep
>       1.24 =C4=85 11%      +0.2        1.45 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.__x64_sys_clock_nanosleep
>       0.00            +0.2        0.22 =C4=85 19%  perf-profile.children.=
cycles-pp.pcpu_alloc_pages
>       1.35 =C4=85 11%      +0.2        1.59 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.clock_nanosleep
>       0.00            +0.3        0.27 =C4=85 18%  perf-profile.children.=
cycles-pp.pcpu_populate_chunk
>       0.00            +0.3        0.33 =C4=85 16%  perf-profile.children.=
cycles-pp.pcpu_balance_populated
>       0.00            +0.3        0.34 =C4=85 15%  perf-profile.children.=
cycles-pp.pcpu_balance_workfn
>       1.41 =C4=85  7%      +0.5        1.95 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.memset_orig
>       0.12 =C4=85 21%      +1.6        1.70 =C4=85 30%  perf-profile.chil=
dren.cycles-pp.pcpu_find_block_fit
>       9.20 =C4=85  7%      +3.2       12.41 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.__x64_sys_mount
>       9.29 =C4=85  7%      +3.2       12.51 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.mount
>       8.34 =C4=85  7%      +3.4       11.70 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.do_new_mount
>       3.22 =C4=85  9%      +3.6        6.81 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.pcpu_alloc
>       3.18 =C4=85  6%      +4.3        7.52 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.vfs_get_super
>       3.19 =C4=85  6%      +4.3        7.54 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.vfs_get_tree
>       1.87 =C4=85  8%      +4.6        6.48 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.sget_fc
>       1.73 =C4=85  9%      +4.6        6.37 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.alloc_super
>       0.00            +5.1        5.14 =C4=85 19%  perf-profile.children.=
cycles-pp.init_srcu_struct_fields
>       2.80 =C4=85  7%      -0.5        2.30 =C4=85 13%  perf-profile.self=
.cycles-pp.stress_rndstr
>       1.30 =C4=85  6%      -0.3        1.04 =C4=85 16%  perf-profile.self=
.cycles-pp.mnt_get_count
>       1.25 =C4=85  7%      -0.2        1.02 =C4=85  4%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       1.08 =C4=85 10%      -0.1        0.93 =C4=85  7%  perf-profile.self=
.cycles-pp.strncpy_from_user
>       0.61 =C4=85 12%      -0.1        0.48 =C4=85 16%  perf-profile.self=
.cycles-pp.try_check_zero
>       0.63 =C4=85  8%      -0.1        0.50 =C4=85 17%  perf-profile.self=
.cycles-pp.mnt_get_writers
>       0.68 =C4=85  6%      -0.1        0.58 =C4=85  4%  perf-profile.self=
.cycles-pp.link_path_walk
>       0.40 =C4=85  3%      -0.1        0.32 =C4=85 15%  perf-profile.self=
.cycles-pp.__sync_rcu_exp_select_node_cpus
>       0.15 =C4=85 14%      -0.1        0.08 =C4=85 51%  perf-profile.self=
.cycles-pp.xas_store
>       0.29 =C4=85  6%      -0.1        0.22 =C4=85 18%  perf-profile.self=
.cycles-pp.inode_permission
>       0.16 =C4=85 12%      -0.0        0.12 =C4=85 18%  perf-profile.self=
.cycles-pp.filename_lookup
>       0.06 =C4=85  6%      -0.0        0.03 =C4=85 70%  perf-profile.self=
.cycles-pp.cpuidle_idle_call
>       0.12 =C4=85 11%      +0.0        0.15 =C4=85 16%  perf-profile.self=
.cycles-pp.read_tsc
>       0.04 =C4=85 83%      +0.0        0.08 =C4=85 12%  perf-profile.self=
.cycles-pp.delayed_free_vfsmnt
>       0.00            +0.1        0.07 =C4=85 15%  perf-profile.self.cycl=
es-pp.init_timer_key
>       0.00            +0.2        0.16 =C4=85 19%  perf-profile.self.cycl=
es-pp.rcu_segcblist_init
>       0.00            +0.2        0.24 =C4=85 14%  perf-profile.self.cycl=
es-pp.init_srcu_struct_fields
>       1.28 =C4=85  8%      +0.5        1.79 =C4=85 11%  perf-profile.self=
.cycles-pp.memset_orig
>       0.69 =C4=85 17%      +1.3        2.00 =C4=85 26%  perf-profile.self=
.cycles-pp.pcpu_alloc
>       0.04 =C4=85 85%      +1.6        1.62 =C4=85 31%  perf-profile.self=
.cycles-pp.pcpu_find_block_fit
>
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>
