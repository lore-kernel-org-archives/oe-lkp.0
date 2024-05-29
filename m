Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E333282F0
	for <oe-lkp@lists.linux.dev>; Wed, 29 May 2024 11:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716981491; cv=none; b=chC5OkH9/fX1TWCPfkbhK9PGoVAxQFW6ppusrQ5/bvDqjs36ckSbON9LK+8T4v4F+5EnYXz/HPD1WSE8A/NIpY0+p1yHgawbgEXgU8uXmWyCW1jYpi6YDwUCp4PGwNA8AQN4YPncJOy11MNNOhOqihwm1l3Tt4EmGaqjSQeA8Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716981491; c=relaxed/simple;
	bh=BNZlIxb7Q6BtIPSoz/T/Fpf+mnPmtlaPfvVxbffJA3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8MQ+G6+Tvb8C8MTV8ediGVR4GX2FTGC4IUIZRG06VsSLBIolvOQC7HnMuoWDmcTs6MG8vkP31pJj+1IBOmxaI5QHdqHWE5O3ZJFeJX+0dWbUWPcNrfVLftOG1DSZbFU5R9rP0AKQb5mJfg8Ptqg/HG+/vI7NeoZlgqd8m4Wsf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qwjg5uhi; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qwjg5uhi"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-794ab12341aso62133285a.1
        for <oe-lkp@lists.linux.dev>; Wed, 29 May 2024 04:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716981488; x=1717586288; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvNZ1sflOhYefWDIiRpwQve7jygWrWsQ4vaVtwmjvhY=;
        b=Qwjg5uhiiH2uO3vAhf7r+JbtUn92yWGxFRNVwr+Cc7cYBFxNquQSTFKtKpevjKeasK
         2d/8wEqZg+FZmEql5QI0lYI9GbBHLiCOONLX68sHgN+UFJGaRwVjTezEyvFGrMvpntXf
         rBfKPa5i7q0fmV+KdTcKOzNBJvpgxjfDk57HJWwRQ9NfVcgmeoOEwQpjNk+YLhbbZ188
         t1pLme8EnOtHOp7iVPg0MJP3+zb8javOEojOJOxO+kN4k3mYnGrGHB61yqq3ticQejc0
         NhNBpiOkkKBpN5zHq8WNeg434XUVuRHHaujWW6WYFNamyM/F2/AR5bTG3ZGRo2GLhoNo
         ePjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716981488; x=1717586288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvNZ1sflOhYefWDIiRpwQve7jygWrWsQ4vaVtwmjvhY=;
        b=n1CQ5fYfZOcE55bkdtamnlwhXJIYFKGCi+1KHTtwAtM4iA1JqGkO0zWy50rHhuyasX
         5AmOEtpUCaqC5L+gNe8Nj5wuaOdwEROwc/q2tqd28PIKRPCPpMaJB5TALqiJpfLM/Kn5
         0n3YzGsEDwfreyn1QF8Y0JwHX46d8JYjqthWMIZY+YX4Fbij7scaLKEQ3SjQzyFaeKez
         G4HQospgwxrApM6GzXdKV8PgzSa7sq5Bje+IyPb9qSgr/eYDSonH7MCnwjZ2+0RvBA/2
         AZZwyJNEv5rGBRDkT5NTb626zA0/s2A+qossWhLFq9MYYONZQdrxBLjr3nj39zvmmTON
         gQqA==
X-Forwarded-Encrypted: i=1; AJvYcCWAGiGRxfm6IZ7Q/MX3NShIHsf08p2J8Y+Mc0F4UwooD5yRGDCsvPre2NrHucjDtyIilmKXlLBAVFxLfItrIDParjDKCQI6
X-Gm-Message-State: AOJu0Yz1V/qt/tDrPGF4aBWLBuyRzE2vmVAJGi7Zd3lDa6jis5TEmzwY
	KEUKsUfj8KlhGqcRQ7Z9MEfg6oY/MVzxJ4Xgz9FODSOTvDPoUHdAkRxq5+mA55ho/xw6mCrfvpC
	KBudR4nNgsHel0aryn6XyReS4ld8=
X-Google-Smtp-Source: AGHT+IF8bzZQdX/gb7584x5Y/e7C2NhUwqaReEgDNy1yBtXIJwmrHHMvpL1RlJ4bc71x/QHQi7Y+/CHf28WUf7KwiqQ=
X-Received: by 2002:a05:620a:4acd:b0:792:9661:4a9c with SMTP id
 af79cd13be357-794dfb99afemr265314185a.10.1716981487746; Wed, 29 May 2024
 04:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405291640.2016ebfe-oliver.sang@intel.com>
In-Reply-To: <202405291640.2016ebfe-oliver.sang@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 29 May 2024 14:17:55 +0300
Message-ID: <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
To: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev
Cc: lkp@intel.com, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 11:26=E2=80=AFAM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -7.9% regression of unixbench.throughput on:
>
>
> commit: 9d1fd61f1d9bb74e44bdcc8767ba7008a08c6075 ("fanotify: pass optiona=
l file access range in pre-content event")
> https://github.com/amir73il/linux sb_write_barrier
>

Jan,

I speculate that the regression is due to the fact that we store and pass t=
he
path information on struct file_range on the stack before the optimizations
in fsnotify_parent(), so rw_verify_area() pays some price for the stores
and __fsnotify_parent() pays a bigger price for fetches?

Luckily, we already have the way to check
fsnotify_sb_has_priority_watchers(inode->i_sb,
                                               FSNOTIFY_PRIO_PRE_CONTENT))
so now I used it to optimize out the fsnotify_file_range() inline
code entirely.

Oliver,

Can you please re-test with fixed branch (also rebased on v6.10-rc1):

* a82fd282befc - (fan_pre_content) fanotify: report file range info
with pre-content events
* f301cd18006c - fanotify: rename a misnamed constant
* 64108c0b47db - fanotify: pass optional file access range in pre-content e=
vent
* 94167e071109 - fanotify: introduce FAN_PRE_MODIFY permission event
* 68e04c2451ba - fanotify: introduce FAN_PRE_ACCESS permission event
* 83af0c89527a - fsnotify: generate pre-content permission event on exec
* aca408421327 - fsnotify: generate pre-content permission event on open
* 93656e196b00 - fsnotify: introduce pre-content permission event

The optimization was done in the first commit (fsnotify: introduce
pre-content permission event),
but impacts the regressing commit (fanotify: pass optional file access
range in pre-content event).
no need to test all middle commits.

Thanks,
Amir.




> testcase: unixbench
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (S=
apphire Rapids) with 256G memory
> parameters:
>
>         runtime: 300s
>         nr_task: 100%
>         test: fsbuffer-w
>         cpufreq_governor: performance
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202405291640.2016ebfe-oliver.san=
g@intel.com
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240529/202405291640.2016ebfe-ol=
iver.sang@intel.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase:
>   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/3=
00s/lkp-spr-r02/fsbuffer-w/unixbench
>
> commit:
>   00c423c0d8 ("fanotify: introduce FAN_PRE_MODIFY permission event")
>   9d1fd61f1d ("fanotify: pass optional file access range in pre-content e=
vent")
>
> 00c423c0d82eabad 9d1fd61f1d9bb74e44bdcc8767b
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>   1.23e+08            -7.9%  1.133e+08        unixbench.throughput
>       6169            -7.7%       5694        unixbench.time.user_time
>  4.566e+10            -7.9%  4.206e+10        unixbench.workload
>  1.513e+11            -4.5%  1.445e+11        perf-stat.i.branch-instruct=
ions
>    6891152            +4.8%    7221484        perf-stat.i.branch-misses
>   29764445 =C2=B1  2%      -7.4%   27565609 =C2=B1  3%  perf-stat.i.cache=
-references
>       0.91            +2.0%       0.93        perf-stat.i.cpi
>  7.187e+11            -2.7%  6.996e+11        perf-stat.i.instructions
>       1.26            -2.6%       1.23        perf-stat.i.ipc
>       0.00            +0.0        0.01        perf-stat.overall.branch-mi=
ss-rate%
>       0.73            +2.7%       0.75        perf-stat.overall.cpi
>       1.37            -2.6%       1.34        perf-stat.overall.ipc
>       5828            +5.7%       6162        perf-stat.overall.path-leng=
th
>  1.505e+11            -4.5%  1.437e+11        perf-stat.ps.branch-instruc=
tions
>    6873687            +4.8%    7203107        perf-stat.ps.branch-misses
>   29721957 =C2=B1  2%      -7.3%   27538369 =C2=B1  3%  perf-stat.ps.cach=
e-references
>  7.148e+11            -2.6%   6.96e+11        perf-stat.ps.instructions
>  2.662e+14            -2.6%  2.592e+14        perf-stat.total.instruction=
s
>      57.79            -2.0       55.78        perf-profile.calltrace.cycl=
es-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>      37.58            -2.0       35.63        perf-profile.calltrace.cycl=
es-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do=
_syscall_64
>      13.06            -1.0       12.04        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64.write
>      13.81            -1.0       12.83        perf-profile.calltrace.cycl=
es-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_=
write.ksys_write
>      12.72            -0.9       11.78        perf-profile.calltrace.cycl=
es-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_=
file_write_iter.vfs_write
>       7.00            -0.5        6.47        perf-profile.calltrace.cycl=
es-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_i=
ter.vfs_write.ksys_write
>       6.53            -0.5        6.02        perf-profile.calltrace.cycl=
es-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perf=
orm_write.generic_file_write_iter
>       5.36            -0.5        4.89        perf-profile.calltrace.cycl=
es-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_wr=
ite.ksys_write
>       3.66            -0.4        3.28        perf-profile.calltrace.cycl=
es-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_sysca=
ll_64
>       2.68            -0.3        2.36        perf-profile.calltrace.cycl=
es-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_=
write.ksys_write
>       6.57            -0.2        6.34        perf-profile.calltrace.cycl=
es-pp.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_=
iter.vfs_write.ksys_write
>       2.36 =C2=B1  2%      -0.2        2.18 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after=
_hwframe.write
>       1.83            -0.2        1.66        perf-profile.calltrace.cycl=
es-pp.folio_unlock.simple_write_end.generic_perform_write.generic_file_writ=
e_iter.vfs_write
>       2.92            -0.2        2.76        perf-profile.calltrace.cycl=
es-pp.down_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
>       2.65            -0.2        2.49        perf-profile.calltrace.cycl=
es-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.gen=
eric_perform_write
>       3.95            -0.1        3.83        perf-profile.calltrace.cycl=
es-pp.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_w=
rite_iter.generic_file_write_iter.vfs_write
>       1.62            -0.1        1.50        perf-profile.calltrace.cycl=
es-pp.up_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
>       0.74            -0.1        0.64        perf-profile.calltrace.cycl=
es-pp.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>       3.26            -0.1        3.17        perf-profile.calltrace.cycl=
es-pp.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_priv=
s_flags.__generic_file_write_iter.generic_file_write_iter
>       3.57            -0.1        3.49        perf-profile.calltrace.cycl=
es-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
>       1.61            -0.1        1.53        perf-profile.calltrace.cycl=
es-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.write
>       0.93            -0.1        0.85        perf-profile.calltrace.cycl=
es-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.generic_f=
ile_write_iter.vfs_write.ksys_write
>       1.05            -0.1        0.99        perf-profile.calltrace.cycl=
es-pp.xas_descend.xas_load.filemap_get_entry.__filemap_get_folio.simple_wri=
te_begin
>       0.61            -0.1        0.55        perf-profile.calltrace.cycl=
es-pp.w_test
>       0.64            -0.1        0.58        perf-profile.calltrace.cycl=
es-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       0.87            -0.1        0.82        perf-profile.calltrace.cycl=
es-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_ver=
ify_area.vfs_write
>       2.50            -0.1        2.44        perf-profile.calltrace.cycl=
es-pp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.f=
ile_remove_privs_flags.__generic_file_write_iter
>       0.62            -0.1        0.56        perf-profile.calltrace.cycl=
es-pp.xas_start.xas_load.filemap_get_entry.__filemap_get_folio.simple_write=
_begin
>       0.74            -0.0        0.69        perf-profile.calltrace.cycl=
es-pp.setattr_should_drop_suidgid.file_remove_privs_flags.__generic_file_wr=
ite_iter.generic_file_write_iter.vfs_write
>       0.91            -0.0        0.86        perf-profile.calltrace.cycl=
es-pp.folio_wait_stable.__filemap_get_folio.simple_write_begin.generic_perf=
orm_write.generic_file_write_iter
>       0.84            -0.0        0.79        perf-profile.calltrace.cycl=
es-pp.xattr_resolve_name.__vfs_getxattr.cap_inode_need_killpriv.security_in=
ode_need_killpriv.file_remove_privs_flags
>       0.68            -0.0        0.64        perf-profile.calltrace.cycl=
es-pp.__cond_resched.__filemap_get_folio.simple_write_begin.generic_perform=
_write.generic_file_write_iter
>       0.74            -0.0        0.71        perf-profile.calltrace.cycl=
es-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_file_=
write_iter.vfs_write
>       0.62            -0.0        0.59        perf-profile.calltrace.cycl=
es-pp.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_writ=
e.ksys_write
>       0.97            +0.0        1.00        perf-profile.calltrace.cycl=
es-pp.strcmp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_kil=
lpriv.file_remove_privs_flags
>       0.91            +0.1        0.97        perf-profile.calltrace.cycl=
es-pp.timestamp_truncate.inode_needs_update_time.file_update_time.__generic=
_file_write_iter.generic_file_write_iter
>       0.86 =C2=B1  3%      +0.1        0.94        perf-profile.calltrace=
.cycles-pp.generic_write_check_limits.generic_write_checks.generic_file_wri=
te_iter.vfs_write.ksys_write
>       0.58 =C2=B1  2%      +0.1        0.66 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file_upd=
ate_time.__generic_file_write_iter.generic_file_write_iter
>      11.24            +0.1       11.36        perf-profile.calltrace.cycl=
es-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_writ=
e.do_syscall_64
>       2.01 =C2=B1  2%      +0.1        2.14        perf-profile.calltrace=
.cycles-pp.generic_write_checks.generic_file_write_iter.vfs_write.ksys_writ=
e.do_syscall_64
>       6.04            +0.2        6.24        perf-profile.calltrace.cycl=
es-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_i=
ter.vfs_write.ksys_write
>       5.17            +0.2        5.42        perf-profile.calltrace.cycl=
es-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.ge=
neric_file_write_iter.vfs_write
>      96.75            +0.3       97.03        perf-profile.calltrace.cycl=
es-pp.write
>       2.57            +0.4        2.92        perf-profile.calltrace.cycl=
es-pp.inode_needs_update_time.file_update_time.__generic_file_write_iter.ge=
neric_file_write_iter.vfs_write
>       3.20            +0.4        3.57        perf-profile.calltrace.cycl=
es-pp.file_update_time.__generic_file_write_iter.generic_file_write_iter.vf=
s_write.ksys_write
>      84.82            +1.1       85.88        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.write
>      83.38            +1.2       84.56        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      78.73            +1.5       80.20        perf-profile.calltrace.cycl=
es-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      74.54            +1.8       76.32        perf-profile.calltrace.cycl=
es-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.wri=
te
>       0.00            +4.0        3.99        perf-profile.calltrace.cycl=
es-pp.__fsnotify_parent.rw_verify_area.vfs_write.ksys_write.do_syscall_64
>       5.32            +4.2        9.48        perf-profile.calltrace.cycl=
es-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>      58.42            -2.0       56.38        perf-profile.children.cycle=
s-pp.generic_file_write_iter
>      38.46            -2.0       36.50        perf-profile.children.cycle=
s-pp.generic_perform_write
>      13.99            -1.0       13.01        perf-profile.children.cycle=
s-pp.simple_write_begin
>      13.11            -1.0       12.15        perf-profile.children.cycle=
s-pp.__filemap_get_folio
>       7.23            -0.6        6.66        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64
>       7.12            -0.5        6.59        perf-profile.children.cycle=
s-pp.copy_page_from_iter_atomic
>       6.73            -0.5        6.21        perf-profile.children.cycle=
s-pp.filemap_get_entry
>       5.76            -0.5        5.26        perf-profile.children.cycle=
s-pp.simple_write_end
>       4.05            -0.4        3.64        perf-profile.children.cycle=
s-pp.security_file_permission
>       2.93            -0.3        2.59        perf-profile.children.cycle=
s-pp.apparmor_file_permission
>       4.32            -0.3        4.04        perf-profile.children.cycle=
s-pp.entry_SYSRETQ_unsafe_stack
>       4.20            -0.3        3.92        perf-profile.children.cycle=
s-pp.__cond_resched
>       6.91            -0.2        6.67        perf-profile.children.cycle=
s-pp.file_remove_privs_flags
>       2.43            -0.2        2.24        perf-profile.children.cycle=
s-pp.rcu_all_qs
>       3.10            -0.2        2.92        perf-profile.children.cycle=
s-pp.xas_load
>       2.47 =C2=B1  2%      -0.2        2.29 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__fdget_pos
>       1.92            -0.2        1.74        perf-profile.children.cycle=
s-pp.folio_unlock
>       3.11            -0.2        2.94        perf-profile.children.cycle=
s-pp.down_write
>       4.18            -0.1        4.04        perf-profile.children.cycle=
s-pp.security_inode_need_killpriv
>       1.68            -0.1        1.56        perf-profile.children.cycle=
s-pp.up_write
>       3.48            -0.1        3.38        perf-profile.children.cycle=
s-pp.cap_inode_need_killpriv
>       1.96            -0.1        1.87        perf-profile.children.cycle=
s-pp.syscall_exit_to_user_mode
>       1.28            -0.1        1.18        perf-profile.children.cycle=
s-pp.balance_dirty_pages_ratelimited_flags
>       0.92            -0.1        0.84        perf-profile.children.cycle=
s-pp.w_test
>       3.14            -0.1        3.06        perf-profile.children.cycle=
s-pp.__vfs_getxattr
>       1.00            -0.1        0.92        perf-profile.children.cycle=
s-pp.aa_file_perm
>       1.29            -0.1        1.22        perf-profile.children.cycle=
s-pp.xas_descend
>       0.76            -0.1        0.70        perf-profile.children.cycle=
s-pp.x64_sys_call
>       0.87            -0.1        0.80        perf-profile.children.cycle=
s-pp.setattr_should_drop_suidgid
>       1.07            -0.1        1.01        perf-profile.children.cycle=
s-pp.xattr_resolve_name
>       1.10            -0.1        1.04        perf-profile.children.cycle=
s-pp.folio_wait_stable
>       1.05            -0.1        1.00        perf-profile.children.cycle=
s-pp.folio_mapping
>       0.73            -0.1        0.67        perf-profile.children.cycle=
s-pp.xas_start
>       0.93            -0.1        0.88        perf-profile.children.cycle=
s-pp.folio_mark_dirty
>       0.50            -0.0        0.46        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_safe_stack
>       0.60            -0.0        0.56        perf-profile.children.cycle=
s-pp.inode_to_bdi
>       0.43            -0.0        0.39        perf-profile.children.cycle=
s-pp.write@plt
>       0.36            -0.0        0.33        perf-profile.children.cycle=
s-pp.amd_clear_divider
>       0.37            -0.0        0.35        perf-profile.children.cycle=
s-pp.__x64_sys_write
>       0.33            -0.0        0.31        perf-profile.children.cycle=
s-pp.noop_dirty_folio
>       0.36            -0.0        0.34        perf-profile.children.cycle=
s-pp.is_bad_inode
>       0.24            -0.0        0.23 =C2=B1  2%  perf-profile.children.=
cycles-pp.file_remove_privs
>       1.18            +0.0        1.21        perf-profile.children.cycle=
s-pp.strcmp
>       1.02            +0.1        1.08        perf-profile.children.cycle=
s-pp.timestamp_truncate
>      99.01            +0.1       99.09        perf-profile.children.cycle=
s-pp.write
>       0.98 =C2=B1  3%      +0.1        1.06        perf-profile.children.=
cycles-pp.generic_write_check_limits
>       0.68 =C2=B1  2%      +0.1        0.77 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.ktime_get_coarse_real_ts64
>      11.58            +0.1       11.69        perf-profile.children.cycle=
s-pp.__generic_file_write_iter
>       2.36 =C2=B1  2%      +0.1        2.50        perf-profile.children.=
cycles-pp.generic_write_checks
>       5.57            +0.2        5.75        perf-profile.children.cycle=
s-pp.fault_in_readable
>       6.28            +0.2        6.49        perf-profile.children.cycle=
s-pp.fault_in_iov_iter_readable
>       2.98            +0.4        3.33        perf-profile.children.cycle=
s-pp.inode_needs_update_time
>       3.51            +0.4        3.89        perf-profile.children.cycle=
s-pp.file_update_time
>      85.24            +1.1       86.31        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>      84.05            +1.2       85.21        perf-profile.children.cycle=
s-pp.do_syscall_64
>      79.32            +1.5       80.78        perf-profile.children.cycle=
s-pp.ksys_write
>      75.49            +1.7       77.21        perf-profile.children.cycle=
s-pp.vfs_write
>       3.64            +4.0        7.64        perf-profile.children.cycle=
s-pp.__fsnotify_parent
>       5.68            +4.3       10.03        perf-profile.children.cycle=
s-pp.rw_verify_area
>       6.96            -0.5        6.44        perf-profile.self.cycles-pp=
.copy_page_from_iter_atomic
>       6.52            -0.5        6.01        perf-profile.self.cycles-pp=
.write
>       6.92            -0.4        6.48        perf-profile.self.cycles-pp=
.vfs_write
>       3.59            -0.3        3.24        perf-profile.self.cycles-pp=
.filemap_get_entry
>       4.41            -0.3        4.09        perf-profile.self.cycles-pp=
.__filemap_get_folio
>       4.23            -0.3        3.95        perf-profile.self.cycles-pp=
.entry_SYSRETQ_unsafe_stack
>       2.79            -0.3        2.52        perf-profile.self.cycles-pp=
.simple_write_end
>       1.76            -0.2        1.52        perf-profile.self.cycles-pp=
.apparmor_file_permission
>       2.32 =C2=B1  2%      -0.2        2.16 =C2=B1  2%  perf-profile.self=
.cycles-pp.__fdget_pos
>       1.79            -0.2        1.62        perf-profile.self.cycles-pp=
.folio_unlock
>       2.05            -0.2        1.89        perf-profile.self.cycles-pp=
.down_write
>       2.35            -0.1        2.22        perf-profile.self.cycles-pp=
.__cond_resched
>       1.89            -0.1        1.77        perf-profile.self.cycles-pp=
.do_syscall_64
>       1.38            -0.1        1.26        perf-profile.self.cycles-pp=
.entry_SYSCALL_64
>       1.56            -0.1        1.45        perf-profile.self.cycles-pp=
.up_write
>       1.30            -0.1        1.19        perf-profile.self.cycles-pp=
.entry_SYSCALL_64_after_hwframe
>       1.42            -0.1        1.31        perf-profile.self.cycles-pp=
.rcu_all_qs
>       1.12            -0.1        1.02        perf-profile.self.cycles-pp=
.security_file_permission
>       1.46            -0.1        1.38        perf-profile.self.cycles-pp=
.ksys_write
>       0.90            -0.1        0.83        perf-profile.self.cycles-pp=
.aa_file_perm
>       1.29            -0.1        1.22        perf-profile.self.cycles-pp=
.xas_load
>       0.74            -0.1        0.67        perf-profile.self.cycles-pp=
.w_test
>       1.08            -0.1        1.01        perf-profile.self.cycles-pp=
.syscall_exit_to_user_mode
>       1.98            -0.1        1.92        perf-profile.self.cycles-pp=
.file_remove_privs_flags
>       1.30            -0.1        1.24        perf-profile.self.cycles-pp=
.__vfs_getxattr
>       1.06            -0.1        1.00        perf-profile.self.cycles-pp=
.xas_descend
>       0.80            -0.1        0.74        perf-profile.self.cycles-pp=
.balance_dirty_pages_ratelimited_flags
>       0.63            -0.1        0.58        perf-profile.self.cycles-pp=
.x64_sys_call
>       0.74            -0.1        0.69        perf-profile.self.cycles-pp=
.setattr_should_drop_suidgid
>       0.63            -0.0        0.58        perf-profile.self.cycles-pp=
.xas_start
>       0.87            -0.0        0.83        perf-profile.self.cycles-pp=
.folio_mapping
>       0.50            -0.0        0.46        perf-profile.self.cycles-pp=
.entry_SYSCALL_64_safe_stack
>       0.60            -0.0        0.57        perf-profile.self.cycles-pp=
.xattr_resolve_name
>       0.48            -0.0        0.44        perf-profile.self.cycles-pp=
.folio_mark_dirty
>       0.68            -0.0        0.65        perf-profile.self.cycles-pp=
.security_inode_need_killpriv
>       0.36            -0.0        0.33 =C2=B1  2%  perf-profile.self.cycl=
es-pp.inode_to_bdi
>       0.52            -0.0        0.49        perf-profile.self.cycles-pp=
.folio_wait_stable
>       0.34            -0.0        0.32        perf-profile.self.cycles-pp=
.cap_inode_need_killpriv
>       0.89            -0.0        0.87        perf-profile.self.cycles-pp=
.simple_write_begin
>       0.25            -0.0        0.23        perf-profile.self.cycles-pp=
.__x64_sys_write
>       0.23 =C2=B1  2%      -0.0        0.22 =C2=B1  2%  perf-profile.self=
.cycles-pp.amd_clear_divider
>       0.23 =C2=B1  2%      -0.0        0.21        perf-profile.self.cycl=
es-pp.noop_dirty_folio
>       0.12 =C2=B1  4%      -0.0        0.10 =C2=B1  3%  perf-profile.self=
.cycles-pp.write@plt
>       0.24            -0.0        0.23 =C2=B1  2%  perf-profile.self.cycl=
es-pp.is_bad_inode
>       0.62            +0.0        0.65        perf-profile.self.cycles-pp=
.file_update_time
>       0.86            +0.0        0.90        perf-profile.self.cycles-pp=
.strcmp
>       0.69            +0.0        0.74        perf-profile.self.cycles-pp=
.fault_in_iov_iter_readable
>       0.75 =C2=B1  3%      +0.1        0.81        perf-profile.self.cycl=
es-pp.generic_write_check_limits
>       1.42 =C2=B1  2%      +0.1        1.48        perf-profile.self.cycl=
es-pp.generic_write_checks
>       0.82            +0.1        0.89        perf-profile.self.cycles-pp=
.timestamp_truncate
>       0.58 =C2=B1  3%      +0.1        0.66 =C2=B1  6%  perf-profile.self=
.cycles-pp.ktime_get_coarse_real_ts64
>       5.44            +0.2        5.60        perf-profile.self.cycles-pp=
.fault_in_readable
>       1.36            +0.2        1.55        perf-profile.self.cycles-pp=
.inode_needs_update_time
>       1.76 =C2=B1  3%      +0.9        2.64        perf-profile.self.cycl=
es-pp.rw_verify_area
>       3.46            +3.8        7.25        perf-profile.self.cycles-pp=
.__fsnotify_parent
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
