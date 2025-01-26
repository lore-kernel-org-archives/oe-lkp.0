Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B4317E;
	Sun, 26 Jan 2025 12:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737894212; cv=none; b=I0xfxA712a9D/DD5QYM6ZyqfpW3Z7jCuvcZn+Enczz0ylFy0Vg++SPc+CKgr8K+oMCcOM0xvj0TRcpdc3o19Merv8MfJ0ndrunQy3tJH1JWyK+BXvw/IWzMtSxUY6xkH4BE9277dcxPEdeFfT0DY9PNdbWYmaqw1OZ0uOdRsXOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737894212; c=relaxed/simple;
	bh=eU0HT97H5SLajS01N1UuGCqrqWAEWv5s6UU8e0CMB88=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BP5mx0zbcWLRu/ZGWKH9IyRwWk/OzFujGVEr78WP/zikpR7DPAAJxHZuPeNans5essxJpmpEWcsWfRzicBsS1svrfoxOI/kRG8Oibyc651xxOmH5gg4iSUnoyxmUi2CS7dO5PzZ8+hFUwpluT0AYfqcdRfBjPp0AW+sSRX3piD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdKYPyBf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdKYPyBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83802C4CED3;
	Sun, 26 Jan 2025 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737894212;
	bh=eU0HT97H5SLajS01N1UuGCqrqWAEWv5s6UU8e0CMB88=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MdKYPyBfrcReYDYV0CuzWBFYJfTBbJvpVtvmr7z1USxdxxr7iBoLtYOmp/qVXAHN5
	 oSCXa4aj0vVjgMb9P665rtKiPjILPtPFRQCVqtchYTgiOu8zwyhye42rqGPNdGDxyh
	 IY551aRgGq+bIUX2lASBGjo7pZeJahy7fja/1s0tCqig9lKAVj9TbQ2onQ553G8AVu
	 nXMSnOQhAVHM0lzAtnUOZX4et1+UrTqUYalNAM/nW3B5rDG/GPxyCY/bjVD1MF9DBp
	 6zry6GpRzDFUD4O2NjtbZ0pymNHOqxffLDPa1gbgtPNQAYtPyCtNVPrb87X9JcggcS
	 3wjBWEuWFM4bQ==
Message-ID: <bd2059df8b6a7a6ce05dc4d325c144a64d474aae.camel@kernel.org>
Subject: Re: [linus:master] [timekeeping]  ee3283c608:
 will-it-scale.per_process_ops 4.8% regression
From: Jeff Layton <jlayton@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
 Christian Brauner
	 <brauner@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, John Stultz
	 <jstultz@google.com>
Date: Sun, 26 Jan 2025 07:23:30 -0500
In-Reply-To: <202501261527.c3bf4764-lkp@intel.com>
References: <202501261527.c3bf4764-lkp@intel.com>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2025-01-26 at 16:25 +0800, kernel test robot wrote:
> hi, Jeff Layton,
>=20
>=20
> we make out below report just FYI since the results is stable in our test=
s.
> we don't have enough knowledge if this regression is due to align.
>=20
> +static __cacheline_aligned_in_smp atomic64_t mg_floor;
>=20
> if low value, please just ignore. thanks a lot.
>=20


I think this is more or less the same regression we measured with the
pipe1 test during the rc phase:

    https://lore.kernel.org/linux-fsdevel/202410091041.6f5d221e-oliver.sang=
@intel.com/

This test just testing how fast it can do writes into a file in /tmp
without doing anything else in between. I don't think there is much we
can do to mitigate the perf hit here, as there is a basic cost to
fetching and handling the floor and ctime consistently.

>=20
> Hello,
>=20
> kernel test robot noticed a 4.8% regression of will-it-scale.per_process_=
ops on:
>=20
>=20
> commit: ee3283c608dfa21251b0821d7bb198c7ae3189f6 ("timekeeping: Add inter=
faces for handling timestamps with a floor value")

That patch just adds two new interfaces, but the first caller of them
wasn't added until a later patch. Are you sure that bisect landed in
the right place?

> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>=20
> [test failed on linus/master      bc8198dc7ebc492ec3e9fa1617dcdfbe98e73b1=
7]
> [test failed on linux-next/master 5ffa57f6eecefababb8cbe327222ef171943b18=
3]
>=20
> testcase: will-it-scale
> config: x86_64-rhel-9.4
> compiler: gcc-12
> test machine: 104 threads 2 sockets (Skylake) with 192G memory
> parameters:
>=20
> 	nr_task: 100%
> 	mode: process
> 	test: pwrite1
> 	cpufreq_governor: performance
>=20
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202501261527.c3bf4764-lkp@intel.=
com
>=20
>=20
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>=20
>=20
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250126/202501261527.c3bf4764-lk=
p@intel.com
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase:
>   gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-202402=
06.cgz/lkp-skl-fpga01/pwrite1/will-it-scale
>=20
> commit:=20
>   v6.12-rc2
>   ee3283c608 ("timekeeping: Add interfaces for handling timestamps with a=
 floor value")
>=20
>        v6.12-rc2 ee3283c608dfa21251b0821d7bb=20
> ---------------- ---------------------------=20
>          %stddev     %change         %stddev
>              \          |                \ =20
>   57550068            -4.8%   54794800        will-it-scale.104.processes
>     553365            -4.8%     526872        will-it-scale.per_process_o=
ps
>   57550068            -4.8%   54794800        will-it-scale.workload
>      43.00 =C2=B1 27%     -60.0%      17.20 =C2=B1 27%  perf-c2c.DRAM.loc=
al
>     251.20 =C2=B1 23%     -57.5%     106.80 =C2=B1 16%  perf-c2c.DRAM.rem=
ote
>     520.00 =C2=B1 33%     -70.3%     154.20 =C2=B1 13%  perf-c2c.HITM.loc=
al
>     218.50 =C2=B1 25%     -55.2%      97.80 =C2=B1 18%  perf-c2c.HITM.rem=
ote
>       0.03 =C2=B1 14%     +48.4%       0.04 =C2=B1  9%  perf-sched.sch_de=
lay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       4.18 =C2=B1  4%     +21.5%       5.08        perf-sched.sch_delay.m=
ax.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>     653.70 =C2=B1  5%     +50.5%     983.70 =C2=B1  7%  perf-sched.wait_a=
nd_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.v=
fs_write.__x64_sys_pwrite64
>     913.40 =C2=B1  6%     -24.8%     686.80 =C2=B1  7%  perf-sched.wait_a=
nd_delay.count.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic=
_perform_write.shmem_file_write_iter
>       1.29 =C2=B1 81%  +42618.3%     552.09 =C2=B1 74%  perf-sched.wait_t=
ime.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>       2.58 =C2=B1 81%  +65403.1%       1692 =C2=B1 72%  perf-sched.wait_t=
ime.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>  1.721e+10            -4.8%  1.639e+10        perf-stat.i.branch-instruct=
ions
>       1.66            +0.1        1.72        perf-stat.i.branch-miss-rat=
e%
>  2.852e+08            -1.2%  2.818e+08        perf-stat.i.branch-misses
>       3.29            +4.9%       3.45        perf-stat.i.cpi
>  8.743e+10            -4.8%  8.327e+10        perf-stat.i.instructions
>       0.30            -4.7%       0.29        perf-stat.i.ipc
>       1.66            +0.1        1.72        perf-stat.overall.branch-mi=
ss-rate%
>       3.29            +4.9%       3.45        perf-stat.overall.cpi
>       0.30            -4.7%       0.29        perf-stat.overall.ipc
>  1.715e+10            -4.8%  1.634e+10        perf-stat.ps.branch-instruc=
tions
>  2.842e+08            -1.2%  2.809e+08        perf-stat.ps.branch-misses
>  8.714e+10            -4.8%    8.3e+10        perf-stat.ps.instructions
>  2.632e+13            -4.7%  2.508e+13        perf-stat.total.instruction=
s
>      10.62            -4.8        5.81        perf-profile.calltrace.cycl=
es-pp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_wri=
te.__x64_sys_pwrite64
>       8.89 =C2=B1  2%      -4.6        4.25        perf-profile.calltrace=
.cycles-pp.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shme=
m_file_write_iter.vfs_write
>       5.98 =C2=B1  3%      -4.2        1.79 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_write_begin.gen=
eric_perform_write.shmem_file_write_iter
>      13.24            -1.4       11.88        perf-profile.calltrace.cycl=
es-pp.entry_SYSRETQ_unsafe_stack.__libc_pwrite
>      16.62            -1.2       15.42        perf-profile.calltrace.cycl=
es-pp.syscall_return_via_sysret.__libc_pwrite
>       2.90            -1.2        1.74        perf-profile.calltrace.cycl=
es-pp.file_update_time.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64.d=
o_syscall_64
>       2.38 =C2=B1  2%      -0.9        1.44        perf-profile.calltrace=
.cycles-pp.inode_needs_update_time.file_update_time.shmem_file_write_iter.v=
fs_write.__x64_sys_pwrite64
>       1.68 =C2=B1  2%      -0.9        0.79        perf-profile.calltrace=
.cycles-pp.folio_unlock.shmem_write_end.generic_perform_write.shmem_file_wr=
ite_iter.vfs_write
>       1.42 =C2=B1 13%      -0.8        0.64 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.file_remove_privs_flags.shmem_file_write_iter.vfs_write.__x=
64_sys_pwrite64.do_syscall_64
>       5.69            -0.7        4.99 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_=
write.__x64_sys_pwrite64
>       6.91            -0.4        6.53        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64.__libc_pwrite
>       1.23 =C2=B1  2%      -0.2        1.01        perf-profile.calltrace=
.cycles-pp.fdget.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.__libc_pwrite
>       1.41            -0.2        1.26        perf-profile.calltrace.cycl=
es-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.__libc_pwrite
>       0.87            -0.1        0.79 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.up_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64.do_s=
yscall_64
>       0.79 =C2=B1  2%      -0.1        0.74        perf-profile.calltrace=
.cycles-pp.noop_dirty_folio.shmem_write_end.generic_perform_write.shmem_fil=
e_write_iter.vfs_write
>       1.15 =C2=B1  2%      +0.1        1.26 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.down_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite=
64.do_syscall_64
>       0.54            +0.2        0.73        perf-profile.calltrace.cycl=
es-pp.folio_mark_accessed.shmem_get_folio_gfp.shmem_write_begin.generic_per=
form_write.shmem_file_write_iter
>       0.82 =C2=B1  2%      +0.4        1.26 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.folio_mark_dirty.shmem_write_end.generic_perform_write.shme=
m_file_write_iter.vfs_write
>       0.00            +0.7        0.67        perf-profile.calltrace.cycl=
es-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.shmem_fil=
e_write_iter.vfs_write.__x64_sys_pwrite64
>       2.10            +1.2        3.35        perf-profile.calltrace.cycl=
es-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.sh=
mem_file_write_iter.vfs_write
>       2.36            +1.3        3.69        perf-profile.calltrace.cycl=
es-pp.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_ite=
r.vfs_write.__x64_sys_pwrite64
>      46.08            +2.8       48.91        perf-profile.calltrace.cycl=
es-pp.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lib=
c_pwrite
>      43.76            +3.3       47.02        perf-profile.calltrace.cycl=
es-pp.vfs_write.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.__libc_pwrite
>      58.89            +3.4       62.32        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.__libc_pwrite
>      38.55            +3.5       42.07        perf-profile.calltrace.cycl=
es-pp.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
>      49.37            +3.7       53.09        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
>      29.41            +5.6       34.99        perf-profile.calltrace.cycl=
es-pp.generic_perform_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrit=
e64.do_syscall_64
>       4.60            +7.7       12.30        perf-profile.calltrace.cycl=
es-pp.rep_movs_alternative.copy_page_from_iter_atomic.generic_perform_write=
.shmem_file_write_iter.vfs_write
>       6.68           +10.3       16.96        perf-profile.calltrace.cycl=
es-pp.copy_page_from_iter_atomic.generic_perform_write.shmem_file_write_ite=
r.vfs_write.__x64_sys_pwrite64
>      10.69            -4.8        5.86        perf-profile.children.cycle=
s-pp.shmem_write_begin
>       8.99 =C2=B1  2%      -4.6        4.35        perf-profile.children.=
cycles-pp.shmem_get_folio_gfp
>       6.00 =C2=B1  3%      -4.2        1.81 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.filemap_get_entry
>      14.20            -1.4       12.77        perf-profile.children.cycle=
s-pp.entry_SYSRETQ_unsafe_stack
>       1.62 =C2=B1  9%      -1.3        0.37 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.xas_load
>      16.76            -1.2       15.54        perf-profile.children.cycle=
s-pp.syscall_return_via_sysret
>       2.96            -1.2        1.79        perf-profile.children.cycle=
s-pp.file_update_time
>       2.47 =C2=B1  2%      -1.0        1.51        perf-profile.children.=
cycles-pp.inode_needs_update_time
>       1.69 =C2=B1  2%      -0.9        0.79        perf-profile.children.=
cycles-pp.folio_unlock
>       1.44 =C2=B1 13%      -0.8        0.65 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.file_remove_privs_flags
>       5.94            -0.7        5.24 =C2=B1  2%  perf-profile.children.=
cycles-pp.shmem_write_end
>       7.17            -0.5        6.67        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64
>       1.77            -0.4        1.42        perf-profile.children.cycle=
s-pp.__cond_resched
>       0.67 =C2=B1  3%      -0.3        0.41        perf-profile.children.=
cycles-pp.ktime_get_coarse_real_ts64
>       1.68 =C2=B1  9%      -0.2        1.42 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.generic_write_checks
>       1.25            -0.2        1.03        perf-profile.children.cycle=
s-pp.fdget
>       1.44            -0.2        1.28        perf-profile.children.cycle=
s-pp.syscall_exit_to_user_mode
>       0.38 =C2=B1  3%      -0.1        0.27 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.timestamp_truncate
>       0.37 =C2=B1  4%      -0.1        0.26        perf-profile.children.=
cycles-pp.rw_verify_area
>       0.69 =C2=B1  3%      -0.1        0.60        perf-profile.children.=
cycles-pp.rcu_all_qs
>       0.90            -0.1        0.82 =C2=B1  2%  perf-profile.children.=
cycles-pp.up_write
>       0.23 =C2=B1  5%      -0.1        0.16 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.xas_start
>       0.85            -0.1        0.80        perf-profile.children.cycle=
s-pp.noop_dirty_folio
>       0.23 =C2=B1  4%      -0.0        0.20 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.x64_sys_call
>       0.15 =C2=B1  5%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.security_file_permission
>       0.28 =C2=B1  2%      -0.0        0.26        perf-profile.children.=
cycles-pp.syscall_exit_to_user_mode_prepare
>       0.17 =C2=B1  5%      +0.0        0.19 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sched_tick
>       1.18            +0.1        1.28 =C2=B1  2%  perf-profile.children.=
cycles-pp.down_write
>       0.35 =C2=B1  3%      +0.1        0.48 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.folio_mapping
>       0.50 =C2=B1  2%      +0.2        0.69        perf-profile.children.=
cycles-pp.balance_dirty_pages_ratelimited_flags
>       0.55 =C2=B1  2%      +0.2        0.75        perf-profile.children.=
cycles-pp.folio_mark_accessed
>       1.75 =C2=B1  2%      +0.4        2.10 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_safe_stack
>       0.90            +0.5        1.36 =C2=B1  5%  perf-profile.children.=
cycles-pp.folio_mark_dirty
>       2.17            +1.2        3.41        perf-profile.children.cycle=
s-pp.fault_in_readable
>       2.40            +1.4        3.75        perf-profile.children.cycle=
s-pp.fault_in_iov_iter_readable
>      46.10            +2.8       48.93        perf-profile.children.cycle=
s-pp.__x64_sys_pwrite64
>      43.86            +3.2       47.10        perf-profile.children.cycle=
s-pp.vfs_write
>      39.00            +3.4       42.41        perf-profile.children.cycle=
s-pp.shmem_file_write_iter
>      59.15            +3.4       62.56        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>      49.50            +3.7       53.21        perf-profile.children.cycle=
s-pp.do_syscall_64
>      29.56            +5.6       35.14        perf-profile.children.cycle=
s-pp.generic_perform_write
>       4.74            +8.3       13.02        perf-profile.children.cycle=
s-pp.rep_movs_alternative
>       6.85            +9.6       16.44        perf-profile.children.cycle=
s-pp.copy_page_from_iter_atomic
>       4.34 =C2=B1  2%      -2.9        1.43 =C2=B1  2%  perf-profile.self=
.cycles-pp.filemap_get_entry
>      14.06            -1.4       12.65        perf-profile.self.cycles-pp=
.entry_SYSRETQ_unsafe_stack
>      16.74            -1.2       15.53        perf-profile.self.cycles-pp=
.syscall_return_via_sysret
>       1.39 =C2=B1 10%      -1.2        0.21 =C2=B1  8%  perf-profile.self=
.cycles-pp.xas_load
>       1.49 =C2=B1  3%      -0.9        0.58        perf-profile.self.cycl=
es-pp.folio_unlock
>       2.72 =C2=B1  2%      -0.9        1.83        perf-profile.self.cycl=
es-pp.__libc_pwrite
>       1.42 =C2=B1 13%      -0.8        0.61 =C2=B1  3%  perf-profile.self=
.cycles-pp.file_remove_privs_flags
>       1.42            -0.6        0.83        perf-profile.self.cycles-pp=
.inode_needs_update_time
>       1.92 =C2=B1  5%      -0.5        1.44        perf-profile.self.cycl=
es-pp.shmem_get_folio_gfp
>       6.24            -0.4        5.81        perf-profile.self.cycles-pp=
.entry_SYSCALL_64
>       9.82            -0.3        9.50        perf-profile.self.cycles-pp=
.entry_SYSCALL_64_after_hwframe
>       0.64 =C2=B1  3%      -0.3        0.38        perf-profile.self.cycl=
es-pp.ktime_get_coarse_real_ts64
>       1.06 =C2=B1  2%      -0.3        0.79        perf-profile.self.cycl=
es-pp.__cond_resched
>       1.74 =C2=B1  5%      -0.2        1.52 =C2=B1  2%  perf-profile.self=
.cycles-pp.shmem_write_begin
>       1.24 =C2=B1  2%      -0.2        1.03        perf-profile.self.cycl=
es-pp.fdget
>       0.45 =C2=B1  3%      -0.2        0.25        perf-profile.self.cycl=
es-pp.file_update_time
>       0.98 =C2=B1  2%      -0.2        0.79 =C2=B1  2%  perf-profile.self=
.cycles-pp.__x64_sys_pwrite64
>       2.73 =C2=B1  2%      -0.2        2.54 =C2=B1  2%  perf-profile.self=
.cycles-pp.shmem_write_end
>       0.72 =C2=B1  5%      -0.1        0.58 =C2=B1  4%  perf-profile.self=
.cycles-pp.generic_write_checks
>       1.14            -0.1        1.02        perf-profile.self.cycles-pp=
.syscall_exit_to_user_mode
>       0.36 =C2=B1  3%      -0.1        0.25 =C2=B1  2%  perf-profile.self=
.cycles-pp.timestamp_truncate
>       0.23 =C2=B1  4%      -0.1        0.15 =C2=B1  2%  perf-profile.self=
.cycles-pp.rw_verify_area
>       0.60 =C2=B1  3%      -0.1        0.53        perf-profile.self.cycl=
es-pp.rcu_all_qs
>       0.81            -0.1        0.74        perf-profile.self.cycles-pp=
.noop_dirty_folio
>       0.20 =C2=B1  4%      -0.1        0.14 =C2=B1  2%  perf-profile.self=
.cycles-pp.xas_start
>       0.81            -0.1        0.75 =C2=B1  2%  perf-profile.self.cycl=
es-pp.up_write
>       0.21 =C2=B1  3%      -0.0        0.18 =C2=B1  3%  perf-profile.self=
.cycles-pp.x64_sys_call
>       0.26 =C2=B1  2%      -0.0        0.23 =C2=B1  2%  perf-profile.self=
.cycles-pp.syscall_exit_to_user_mode_prepare
>       0.12 =C2=B1  6%      -0.0        0.09 =C2=B1  4%  perf-profile.self=
.cycles-pp.security_file_permission
>       0.21 =C2=B1  4%      +0.0        0.24        perf-profile.self.cycl=
es-pp.testcase
>       0.77 =C2=B1  2%      +0.0        0.82 =C2=B1  3%  perf-profile.self=
.cycles-pp.down_write
>       0.24 =C2=B1  3%      +0.1        0.36        perf-profile.self.cycl=
es-pp.fault_in_iov_iter_readable
>       0.30 =C2=B1  3%      +0.1        0.43 =C2=B1  6%  perf-profile.self=
.cycles-pp.folio_mapping
>       0.35 =C2=B1  2%      +0.2        0.54        perf-profile.self.cycl=
es-pp.balance_dirty_pages_ratelimited_flags
>       2.74            +0.2        2.93 =C2=B1  2%  perf-profile.self.cycl=
es-pp.generic_perform_write
>       0.52            +0.2        0.72        perf-profile.self.cycles-pp=
.folio_mark_accessed
>       0.55 =C2=B1  2%      +0.3        0.87 =C2=B1  5%  perf-profile.self=
.cycles-pp.folio_mark_dirty
>       0.56            +0.5        1.10 =C2=B1  4%  perf-profile.self.cycl=
es-pp.entry_SYSCALL_64_safe_stack
>       1.48 =C2=B1  2%      +1.1        2.55 =C2=B1  4%  perf-profile.self=
.cycles-pp.do_syscall_64
>       2.14            +1.2        3.35        perf-profile.self.cycles-pp=
.fault_in_readable
>       2.20            +1.3        3.51 =C2=B1  2%  perf-profile.self.cycl=
es-pp.copy_page_from_iter_atomic
>       4.59            +8.2       12.80        perf-profile.self.cycles-pp=
.rep_movs_alternative
>=20
>=20
>=20
>=20
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>=20
>=20

--=20
Jeff Layton <jlayton@kernel.org>
