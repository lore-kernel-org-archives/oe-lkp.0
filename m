Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C51249F5
	for <oe-lkp@lists.linux.dev>; Fri, 31 May 2024 05:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717132706; cv=none; b=Lr9sc+0FRQnjBSmQhDLz9av4HNUgVCwLTZsR6dmv6D8haMhqAfuWogYBHMYG1JkvkbtxHEZz0hnRjFQcAc3VmtIRUL2ul6EsqATmgyl4FBY+qkzGU0rrOk52KqtVaGThh6Elu1XwQ5REEQv6zjAbfus2HyrahiPwVkm3lmCZ6Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717132706; c=relaxed/simple;
	bh=8tj4sTcj1K48mn3NODpBxSanoILGI1u8kdSi4mhISpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrrphzILL7h2wapufsYijE0XfkMrsWMFYQ1y2NWhJsUD3Yw7uLLGxDVH91u6KD8C/Wcb3ZDf9HTkmOummKpLDDvDA/Zp2sQTW0e+DCfBZMuq5eVK3YlCHH92xLjLZJqQQvu7iho25Rms5/a0XZ+cyzrE0QrYAnFPvujmRHpXk9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ns0Tem0u; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ns0Tem0u"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-794ab28c3d4so125886285a.3
        for <oe-lkp@lists.linux.dev>; Thu, 30 May 2024 22:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717132701; x=1717737501; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QA6twkv5mBFcqjbVQR5JZpm+zVVh/2cS7mcwGUO1F2k=;
        b=Ns0Tem0uyaQC2aK8QKc91ENbcGXsF9uxZQ7itUn1jse6KQd5jf8tJNu3j39qRCbjKC
         GWFLFe+EGQ+NdY8rhtvfnNi/hFOq9wSe2zPZL9/Jp3x6s6aQtfEhaO9BHogLP41SxeGz
         gQ2ig5AvKjNVPbljdn6ns1oDbX+2Z2SiwV3fjU4C65GGPxqgJ1M/g2E5y/QHmGKGNwUr
         0hF5IXf3L9PSue3rIGcOqtx5O6+Loyy1tLYkpJNDzWDDhBQQjb3u9dta/jjX0UShMyZW
         06ybKoCBlNJkql823RccmMB6xVF0j5jR9+TTQuLxbDWx1D5chUlWZYCqYf/lMGarLVxX
         qjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717132701; x=1717737501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QA6twkv5mBFcqjbVQR5JZpm+zVVh/2cS7mcwGUO1F2k=;
        b=dJfQQ7kWz9LmXlXcFpaO4zgfjgiPYzVR5tcMBUxpaiEXauf1z39pVRmix/xQFWLQHv
         CR+o1DvxXXT/xlgaVA0oahKKBCG0rZs6KK9+6MBUv9FLdhlQHSPqae6xZAZso/IEzeCM
         Ms8vL4ygO7FkO8ORO9PaHmmeDeA5bLZbbjdZAirNwV8HcC+Kk6ZWg1H9lOWzetlHGO8w
         L/n6jRbLIRPcLz0+J315P2l52v8UoEZPAEFE4YDuW/v3JXBh0grSX6wMh9TfL+q4muCY
         cItIbLA4hiVo55EREZYreUvr00GbThD17G0bhHc+8MLAAWaensMCZ+zov9pq8ANTVpXP
         lVFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNyEIzPB0rHCmJ1GEiBGDnqLD9YtYjzDZ3nvJMnwA0uoOYnCzVZNgKyjKD71dLwT7aCPXe6dSz6Piy2xhYv4fH14JCFnoY
X-Gm-Message-State: AOJu0YzbkH3ROeH7KPhOWO8ezf5FPGJHXcqKLuNjS8dZXCXGbSIaXoOF
	PpEEzyIZ7HJw886fFmhL52h8OQzN3QFs7PXv0IyZ8zOWf6h8YeiFqd0cWhtyWixCuQ5y23wDzMv
	TbaMPO9VOYXj6ErvosdDW6/k583A=
X-Google-Smtp-Source: AGHT+IFhvBNBS4LI68hLW4B7L/5JHlMByXozkmD1BhqRTAqMewGwfo92/gKKHTvaFtNy7glR60LYBhVFoo+Z74AQfTY=
X-Received: by 2002:a05:620a:bc8:b0:792:9482:a9a7 with SMTP id
 af79cd13be357-794f5c8d5e9mr95259485a.44.1717132701063; Thu, 30 May 2024
 22:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405291640.2016ebfe-oliver.sang@intel.com> <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
 <ZllA260+kaBSKrPD@xsang-OptiPlex-9020>
In-Reply-To: <ZllA260+kaBSKrPD@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 31 May 2024 08:18:09 +0300
Message-ID: <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 6:15=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Amir,
>
> On Wed, May 29, 2024 at 02:17:55PM +0300, Amir Goldstein wrote:
> > On Wed, May 29, 2024 at 11:26=E2=80=AFAM kernel test robot
> > <oliver.sang@intel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed a -7.9% regression of unixbench.throughput =
on:
> > >
> > >
> > > commit: 9d1fd61f1d9bb74e44bdcc8767ba7008a08c6075 ("fanotify: pass opt=
ional file access range in pre-content event")
> > > https://github.com/amir73il/linux sb_write_barrier
> > >
> >
> > Jan,
> >
> > I speculate that the regression is due to the fact that we store and pa=
ss the
> > path information on struct file_range on the stack before the optimizat=
ions
> > in fsnotify_parent(), so rw_verify_area() pays some price for the store=
s
> > and __fsnotify_parent() pays a bigger price for fetches?
> >
> > Luckily, we already have the way to check
> > fsnotify_sb_has_priority_watchers(inode->i_sb,
> >                                                FSNOTIFY_PRIO_PRE_CONTEN=
T))
> > so now I used it to optimize out the fsnotify_file_range() inline
> > code entirely.
> >
> > Oliver,
> >
> > Can you please re-test with fixed branch (also rebased on v6.10-rc1):
> >
> > * a82fd282befc - (fan_pre_content) fanotify: report file range info
> > with pre-content events
> > * f301cd18006c - fanotify: rename a misnamed constant
> > * 64108c0b47db - fanotify: pass optional file access range in pre-conte=
nt event
> > * 94167e071109 - fanotify: introduce FAN_PRE_MODIFY permission event
> > * 68e04c2451ba - fanotify: introduce FAN_PRE_ACCESS permission event
> > * 83af0c89527a - fsnotify: generate pre-content permission event on exe=
c
> > * aca408421327 - fsnotify: generate pre-content permission event on ope=
n
> > * 93656e196b00 - fsnotify: introduce pre-content permission event
> >
> > The optimization was done in the first commit (fsnotify: introduce
> > pre-content permission event),
> > but impacts the regressing commit (fanotify: pass optional file access
> > range in pre-content event).
> > no need to test all middle commits.
>
> I directly compare the tip with v6.10-rc1, still a regression but better =
now
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
>   v6.10-rc1
>   a82fd282befc7 ("fanotify: report file range info with pre-content event=
s")
>
>        v6.10-rc1 a82fd282befc71d99106bf31066
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>  1.216e+08            -3.9%  1.168e+08        unixbench.throughput
>
> full data is as below [1]
>
>
> then I checked new "64108c0b47db - fanotify: pass optional file access ra=
nge in pre-content event"
>
> it also has a small regression comparing to its parent, but better also.
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
>   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
>   64108c0b47db9 ("fanotify: pass optional file access range in pre-conten=
t event")
>
> 94167e071109d573 64108c0b47db91b20d658a89969
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>  1.163e+08            -2.4%  1.135e+08        unixbench.throughput
>
> full data is as below [2]
>

Ok, this looks sane, the small overhead in the write path makes sense.
It may have been a "tactic mistake" merging this optimization to v6.10-rc1
a5e57b4d370c ("fsnotify: optimize the case of no permission event watchers"=
)
before the rest of the pre-content infrastructure, because together they
would still be a performance win.

Can you please compare this branch to v6.9?

Thanks,
Amir.

>
> [1]
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
>   v6.10-rc1
>   a82fd282befc7 ("fanotify: report file range info with pre-content event=
s")
>
>        v6.10-rc1 a82fd282befc71d99106bf31066
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       1614 =C2=B1  6%    +252.4%       5688 =C2=B1 67%  numa-vmstat.node1=
.nr_mapped
>       6199            -5.8%       5841        time.user_time
>     220234 =C2=B1 13%    +121.4%     487546 =C2=B1 41%  numa-meminfo.node=
0.AnonPages.max
>     836146 =C2=B1  6%     -36.0%     535267 =C2=B1 45%  numa-meminfo.node=
1.AnonPages.max
>       6233 =C2=B1  7%    +251.3%      21898 =C2=B1 69%  numa-meminfo.node=
1.Mapped
>  1.216e+08            -3.9%  1.168e+08        unixbench.throughput
>       6199            -5.8%       5841        unixbench.time.user_time
>  4.513e+10            -3.9%  4.338e+10        unixbench.workload
>  1.458e+11            -2.7%  1.419e+11        perf-stat.i.branch-instruct=
ions
>      11.47 =C2=B1  6%      +2.6       14.10 =C2=B1  9%  perf-stat.i.cache=
-miss-rate%
>    3915539 =C2=B1  8%    +510.0%   23884093 =C2=B1  9%  perf-stat.i.cache=
-misses
>   32425619 =C2=B1  3%    +396.4%   1.61e+08 =C2=B1  4%  perf-stat.i.cache=
-references
>     151202 =C2=B1 16%     -78.6%      32364 =C2=B1 56%  perf-stat.i.cycle=
s-between-cache-misses
>  6.961e+11            -1.9%  6.828e+11        perf-stat.i.instructions
>       1.22            -1.3%       1.20        perf-stat.i.ipc
>       0.01 =C2=B1  9%    +519.5%       0.04 =C2=B1 10%  perf-stat.overall=
.MPKI
>       0.01            +0.0        0.01        perf-stat.overall.branch-mi=
ss-rate%
>      12.09 =C2=B1  6%      +2.8       14.86 =C2=B1  8%  perf-stat.overall=
.cache-miss-rate%
>       0.75            +2.0%       0.77        perf-stat.overall.cpi
>     133775 =C2=B1  8%     -83.5%      22060 =C2=B1  9%  perf-stat.overall=
.cycles-between-cache-misses
>       1.33            -1.9%       1.31        perf-stat.overall.ipc
>       5721            +2.0%       5836        perf-stat.overall.path-leng=
th
>  1.452e+11            -2.7%  1.413e+11        perf-stat.ps.branch-instruc=
tions
>    3921138 =C2=B1  8%    +507.4%   23818053 =C2=B1  9%  perf-stat.ps.cach=
e-misses
>   32415461 =C2=B1  3%    +394.4%  1.603e+08 =C2=B1  4%  perf-stat.ps.cach=
e-references
>  6.932e+11            -1.9%  6.797e+11        perf-stat.ps.instructions
>  2.582e+14            -1.9%  2.532e+14        perf-stat.total.instruction=
s
>      13.19            -0.7       12.50        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64.write
>       7.01            -0.2        6.80        perf-profile.calltrace.cycl=
es-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_i=
ter.vfs_write.ksys_write
>       1.11            -0.2        0.91        perf-profile.calltrace.cycl=
es-pp.syscall_return_via_sysret.write
>       2.50            -0.1        2.35        perf-profile.calltrace.cycl=
es-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_=
write.ksys_write
>       1.68            -0.1        1.59        perf-profile.calltrace.cycl=
es-pp.up_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
>       3.73            -0.1        3.64        perf-profile.calltrace.cycl=
es-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
>       1.62            -0.1        1.55        perf-profile.calltrace.cycl=
es-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.write
>       2.18            -0.1        2.12        perf-profile.calltrace.cycl=
es-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.gen=
eric_perform_write
>       0.65            -0.1        0.60 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.w_test
>       0.92            -0.0        0.87        perf-profile.calltrace.cycl=
es-pp.folio_wait_stable.__filemap_get_folio.simple_write_begin.generic_perf=
orm_write.generic_file_write_iter
>       0.70            -0.0        0.66        perf-profile.calltrace.cycl=
es-pp.__cond_resched.down_write.generic_file_write_iter.vfs_write.ksys_writ=
e
>       0.86            -0.0        0.82        perf-profile.calltrace.cycl=
es-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_ver=
ify_area.vfs_write
>       0.92            -0.0        0.88        perf-profile.calltrace.cycl=
es-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.generic_f=
ile_write_iter.vfs_write.ksys_write
>       0.63            -0.0        0.59        perf-profile.calltrace.cycl=
es-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       0.86            -0.0        0.83        perf-profile.calltrace.cycl=
es-pp.xattr_resolve_name.__vfs_getxattr.cap_inode_need_killpriv.security_in=
ode_need_killpriv.file_remove_privs_flags
>       3.53            -0.0        3.50        perf-profile.calltrace.cycl=
es-pp.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_priv=
s_flags.__generic_file_write_iter.generic_file_write_iter
>       0.68            -0.0        0.66        perf-profile.calltrace.cycl=
es-pp.__cond_resched.__filemap_get_folio.simple_write_begin.generic_perform=
_write.generic_file_write_iter
>       0.53            -0.0        0.51        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_safe_stack.write
>       0.72            -0.0        0.71        perf-profile.calltrace.cycl=
es-pp.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>       0.75            +0.0        0.77        perf-profile.calltrace.cycl=
es-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_file_=
write_iter.vfs_write
>       1.13            +0.0        1.17        perf-profile.calltrace.cycl=
es-pp.strcmp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_kil=
lpriv.file_remove_privs_flags
>       5.30            +0.1        5.36        perf-profile.calltrace.cycl=
es-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_wr=
ite.ksys_write
>       5.30            +0.1        5.38        perf-profile.calltrace.cycl=
es-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.ge=
neric_file_write_iter.vfs_write
>       6.17            +0.1        6.27        perf-profile.calltrace.cycl=
es-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_i=
ter.vfs_write.ksys_write
>      96.84            +0.1       96.98        perf-profile.calltrace.cycl=
es-pp.write
>       0.78 =C2=B1  2%      +0.3        1.13 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file_upd=
ate_time.__generic_file_write_iter.generic_file_write_iter
>       2.97            +0.6        3.57        perf-profile.calltrace.cycl=
es-pp.inode_needs_update_time.file_update_time.__generic_file_write_iter.ge=
neric_file_write_iter.vfs_write
>      12.01            +0.6       12.62        perf-profile.calltrace.cycl=
es-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_writ=
e.do_syscall_64
>       3.63            +0.6        4.24        perf-profile.calltrace.cycl=
es-pp.file_update_time.__generic_file_write_iter.generic_file_write_iter.vf=
s_write.ksys_write
>       4.32            +0.6        4.96        perf-profile.calltrace.cycl=
es-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>      37.28            +0.8       38.12        perf-profile.calltrace.cycl=
es-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do=
_syscall_64
>      84.26            +1.0       85.21        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.write
>      13.39            +1.0       14.36        perf-profile.calltrace.cycl=
es-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_=
write.ksys_write
>      12.30            +1.0       13.30        perf-profile.calltrace.cycl=
es-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_=
file_write_iter.vfs_write
>      82.83            +1.0       83.86        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      57.94            +1.3       59.20        perf-profile.calltrace.cycl=
es-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>       5.99            +1.3        7.25 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic=
_perform_write.generic_file_write_iter
>      78.13            +1.3       79.41        perf-profile.calltrace.cycl=
es-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      74.26            +1.3       75.59        perf-profile.calltrace.cycl=
es-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.wri=
te
>       7.43            -0.4        7.06        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64
>       4.42            -0.2        4.18        perf-profile.children.cycle=
s-pp.entry_SYSRETQ_unsafe_stack
>       1.21            -0.2        1.00        perf-profile.children.cycle=
s-pp.syscall_return_via_sysret
>       7.14            -0.2        6.94        perf-profile.children.cycle=
s-pp.copy_page_from_iter_atomic
>       4.18            -0.2        4.00        perf-profile.children.cycle=
s-pp.__cond_resched
>       2.74            -0.2        2.58        perf-profile.children.cycle=
s-pp.apparmor_file_permission
>       2.42            -0.1        2.30        perf-profile.children.cycle=
s-pp.rcu_all_qs
>       3.82            -0.1        3.72        perf-profile.children.cycle=
s-pp.__fsnotify_parent
>       1.74            -0.1        1.65        perf-profile.children.cycle=
s-pp.up_write
>       1.99            -0.1        1.90        perf-profile.children.cycle=
s-pp.syscall_exit_to_user_mode
>       0.99            -0.1        0.91        perf-profile.children.cycle=
s-pp.w_test
>       3.71            -0.1        3.64        perf-profile.children.cycle=
s-pp.security_file_permission
>       2.47            -0.1        2.41        perf-profile.children.cycle=
s-pp.xas_load
>       1.12            -0.1        1.06        perf-profile.children.cycle=
s-pp.folio_wait_stable
>       1.26            -0.1        1.21        perf-profile.children.cycle=
s-pp.balance_dirty_pages_ratelimited_flags
>       0.75            -0.0        0.71        perf-profile.children.cycle=
s-pp.x64_sys_call
>       0.98            -0.0        0.94        perf-profile.children.cycle=
s-pp.aa_file_perm
>       0.46            -0.0        0.42        perf-profile.children.cycle=
s-pp.write@plt
>       1.10            -0.0        1.07        perf-profile.children.cycle=
s-pp.xattr_resolve_name
>       0.36            -0.0        0.34        perf-profile.children.cycle=
s-pp.amd_clear_divider
>       3.76            -0.0        3.73        perf-profile.children.cycle=
s-pp.cap_inode_need_killpriv
>       0.59            -0.0        0.56        perf-profile.children.cycle=
s-pp.inode_to_bdi
>       3.41            -0.0        3.38        perf-profile.children.cycle=
s-pp.__vfs_getxattr
>       0.56            -0.0        0.53        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_safe_stack
>       1.05            -0.0        1.03        perf-profile.children.cycle=
s-pp.folio_mapping
>       0.38            -0.0        0.35        perf-profile.children.cycle=
s-pp.__x64_sys_write
>       0.25            -0.0        0.24        perf-profile.children.cycle=
s-pp.balance_dirty_pages_ratelimited
>       0.36            -0.0        0.35        perf-profile.children.cycle=
s-pp.is_bad_inode
>       1.38            +0.0        1.40        perf-profile.children.cycle=
s-pp.strcmp
>       0.93            +0.0        0.95        perf-profile.children.cycle=
s-pp.folio_mark_dirty
>       1.07            +0.0        1.09        perf-profile.children.cycle=
s-pp.timestamp_truncate
>       5.70            +0.0        5.75        perf-profile.children.cycle=
s-pp.simple_write_end
>      98.96            +0.1       99.02        perf-profile.children.cycle=
s-pp.write
>       5.69            +0.1        5.75        perf-profile.children.cycle=
s-pp.fault_in_readable
>       6.42            +0.1        6.53        perf-profile.children.cycle=
s-pp.fault_in_iov_iter_readable
>       0.89            +0.3        1.24 =C2=B1  4%  perf-profile.children.=
cycles-pp.ktime_get_coarse_real_ts64
>       3.39            +0.6        3.97        perf-profile.children.cycle=
s-pp.inode_needs_update_time
>      12.35            +0.6       12.96        perf-profile.children.cycle=
s-pp.__generic_file_write_iter
>       3.96            +0.6        4.57        perf-profile.children.cycle=
s-pp.file_update_time
>       4.56            +0.8        5.33        perf-profile.children.cycle=
s-pp.rw_verify_area
>      38.16            +0.8       39.01        perf-profile.children.cycle=
s-pp.generic_perform_write
>      13.58            +1.0       14.54        perf-profile.children.cycle=
s-pp.simple_write_begin
>      84.67            +1.0       85.63        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>      12.68            +1.0       13.68        perf-profile.children.cycle=
s-pp.__filemap_get_folio
>      83.50            +1.0       84.51        perf-profile.children.cycle=
s-pp.do_syscall_64
>      58.52            +1.3       59.78        perf-profile.children.cycle=
s-pp.generic_file_write_iter
>       6.18            +1.3        7.44 =C2=B1  3%  perf-profile.children.=
cycles-pp.filemap_get_entry
>      78.74            +1.3       80.00        perf-profile.children.cycle=
s-pp.ksys_write
>      75.13            +1.3       76.42        perf-profile.children.cycle=
s-pp.vfs_write
>       7.25            -0.6        6.64        perf-profile.self.cycles-pp=
.vfs_write
>       6.45            -0.4        6.08        perf-profile.self.cycles-pp=
.write
>       4.32            -0.2        4.08        perf-profile.self.cycles-pp=
.entry_SYSRETQ_unsafe_stack
>       1.21            -0.2        1.00        perf-profile.self.cycles-pp=
.syscall_return_via_sysret
>       6.98            -0.2        6.78        perf-profile.self.cycles-pp=
.copy_page_from_iter_atomic
>       4.52            -0.2        4.36        perf-profile.self.cycles-pp=
.__filemap_get_folio
>       2.34            -0.1        2.22        perf-profile.self.cycles-pp=
.__cond_resched
>       1.90            -0.1        1.78        perf-profile.self.cycles-pp=
.do_syscall_64
>       1.60            -0.1        1.50 =C2=B1  2%  perf-profile.self.cycl=
es-pp.apparmor_file_permission
>       1.47            -0.1        1.38        perf-profile.self.cycles-pp=
.ksys_write
>       1.62            -0.1        1.53        perf-profile.self.cycles-pp=
.up_write
>       3.65            -0.1        3.56        perf-profile.self.cycles-pp=
.__fsnotify_parent
>       1.09            -0.1        1.02        perf-profile.self.cycles-pp=
.syscall_exit_to_user_mode
>       1.80            -0.1        1.74        perf-profile.self.cycles-pp=
.xas_load
>       0.79            -0.1        0.73        perf-profile.self.cycles-pp=
.w_test
>       1.10            -0.1        1.04        perf-profile.self.cycles-pp=
.security_file_permission
>       1.25            -0.1        1.20        perf-profile.self.cycles-pp=
.entry_SYSCALL_64_after_hwframe
>       1.66            -0.1        1.60        perf-profile.self.cycles-pp=
.entry_SYSCALL_64
>       1.41            -0.0        1.36        perf-profile.self.cycles-pp=
.rcu_all_qs
>       0.90            -0.0        0.86        perf-profile.self.cycles-pp=
.simple_write_begin
>       0.88            -0.0        0.84        perf-profile.self.cycles-pp=
.aa_file_perm
>       0.80            -0.0        0.76        perf-profile.self.cycles-pp=
.balance_dirty_pages_ratelimited_flags
>       0.62            -0.0        0.59        perf-profile.self.cycles-pp=
.x64_sys_call
>       1.39            -0.0        1.36        perf-profile.self.cycles-pp=
.__vfs_getxattr
>       0.53            -0.0        0.51        perf-profile.self.cycles-pp=
.folio_wait_stable
>       0.87            -0.0        0.85        perf-profile.self.cycles-pp=
.folio_mapping
>       0.56            -0.0        0.53        perf-profile.self.cycles-pp=
.entry_SYSCALL_64_safe_stack
>       0.24            -0.0        0.22        perf-profile.self.cycles-pp=
.amd_clear_divider
>       0.12 =C2=B1  3%      -0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.write@plt
>       0.25            -0.0        0.23        perf-profile.self.cycles-pp=
.__x64_sys_write
>       0.35            -0.0        0.34        perf-profile.self.cycles-pp=
.inode_to_bdi
>       0.22            -0.0        0.21        perf-profile.self.cycles-pp=
.noop_dirty_folio
>       0.66            +0.0        0.69        perf-profile.self.cycles-pp=
.file_update_time
>       1.03            +0.0        1.06        perf-profile.self.cycles-pp=
.strcmp
>       2.75            +0.0        2.79        perf-profile.self.cycles-pp=
.simple_write_end
>       0.72            +0.0        0.77        perf-profile.self.cycles-pp=
.fault_in_iov_iter_readable
>       0.87            +0.1        0.92        perf-profile.self.cycles-pp=
.timestamp_truncate
>       5.54            +0.1        5.59        perf-profile.self.cycles-pp=
.fault_in_readable
>       2.04            +0.1        2.09        perf-profile.self.cycles-pp=
.file_remove_privs_flags
>       1.51            +0.2        1.69        perf-profile.self.cycles-pp=
.inode_needs_update_time
>       0.78 =C2=B1  2%      +0.3        1.11 =C2=B1  5%  perf-profile.self=
.cycles-pp.ktime_get_coarse_real_ts64
>       0.84            +1.0        1.82        perf-profile.self.cycles-pp=
.rw_verify_area
>       3.66            +1.3        4.97 =C2=B1  4%  perf-profile.self.cycl=
es-pp.filemap_get_entry
>
>
> [2]
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
>   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
>   64108c0b47db9 ("fanotify: pass optional file access range in pre-conten=
t event")
>
> 94167e071109d573 64108c0b47db91b20d658a89969
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>      38903 =C2=B1113%    +313.8%     160973 =C2=B1 66%  numa-meminfo.node=
1.AnonHugePages
>    1666466 =C2=B1  4%     -12.2%    1462703 =C2=B1  9%  numa-numastat.nod=
e1.local_node
>      18.97 =C2=B1113%    +314.3%      78.59 =C2=B1 66%  numa-vmstat.node1=
.nr_anon_transparent_hugepages
>       6003            -5.6%       5668        time.user_time
>  1.163e+08            -2.4%  1.135e+08        unixbench.throughput
>       6003            -5.6%       5668        unixbench.time.user_time
>  4.314e+10            -2.3%  4.215e+10        unixbench.workload
>     -12.17           +33.7%     -16.26        sched_debug.cpu.nr_uninterr=
uptible.min
>       0.00 =C2=B1 95%    +600.3%       0.00 =C2=B1 88%  sched_debug.rt_rq=
:.rt_time.avg
>       0.02 =C2=B1 95%    +600.3%       0.14 =C2=B1 88%  sched_debug.rt_rq=
:.rt_time.max
>       0.00 =C2=B1 95%    +600.3%       0.01 =C2=B1 88%  sched_debug.rt_rq=
:.rt_time.stddev
>  1.407e+11            -2.0%  1.379e+11        perf-stat.i.branch-instruct=
ions
>       0.55            -0.0        0.51 =C2=B1  4%  perf-stat.i.branch-mis=
s-rate%
>   55780077           -85.5%    8078438        perf-stat.i.branch-misses
>    5029827 =C2=B1  6%    +315.5%   20897838 =C2=B1 10%  perf-stat.i.cache=
-misses
>   35311245 =C2=B1  2%    +328.2%  1.512e+08 =C2=B1  6%  perf-stat.i.cache=
-references
>     118639 =C2=B1 18%     -61.7%      45421 =C2=B1 41%  perf-stat.i.cycle=
s-between-cache-misses
>  6.736e+11            -1.5%  6.634e+11        perf-stat.i.instructions
>       0.01 =C2=B1  6%    +321.2%       0.03 =C2=B1 10%  perf-stat.overall=
.MPKI
>       0.04            -0.0        0.01        perf-stat.overall.branch-mi=
ss-rate%
>       0.78            +1.5%       0.79        perf-stat.overall.cpi
>     103942 =C2=B1  6%     -75.7%      25208 =C2=B1 10%  perf-stat.overall=
.cycles-between-cache-misses
>       1.29            -1.5%       1.27        perf-stat.overall.ipc
>    1.4e+11            -1.9%  1.373e+11        perf-stat.ps.branch-instruc=
tions
>   55517704           -85.5%    8057745        perf-stat.ps.branch-misses
>    5026889 =C2=B1  6%    +315.3%   20876882 =C2=B1 10%  perf-stat.ps.cach=
e-misses
>   35229110 =C2=B1  2%    +327.6%  1.506e+08 =C2=B1  6%  perf-stat.ps.cach=
e-references
>  6.701e+11            -1.4%  6.608e+11        perf-stat.ps.instructions
>  2.496e+14            -1.4%   2.46e+14        perf-stat.total.instruction=
s
>       3.61            -0.5        3.09        perf-profile.calltrace.cycl=
es-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_sysca=
ll_64
>       2.66            -0.5        2.18        perf-profile.calltrace.cycl=
es-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_=
write.ksys_write
>      12.62            -0.5       12.16        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64.write
>       7.29            -0.3        7.03        perf-profile.calltrace.cycl=
es-pp.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_=
iter.vfs_write.ksys_write
>       4.98            -0.2        4.74        perf-profile.calltrace.cycl=
es-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>       6.96            -0.2        6.74        perf-profile.calltrace.cycl=
es-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_i=
ter.vfs_write.ksys_write
>       4.50            -0.2        4.33        perf-profile.calltrace.cycl=
es-pp.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_w=
rite_iter.generic_file_write_iter.vfs_write
>       3.74            -0.2        3.58        perf-profile.calltrace.cycl=
es-pp.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_priv=
s_flags.__generic_file_write_iter.generic_file_write_iter
>      12.82            -0.2       12.66        perf-profile.calltrace.cycl=
es-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_writ=
e.do_syscall_64
>       1.04            -0.1        0.91        perf-profile.calltrace.cycl=
es-pp.syscall_return_via_sysret.write
>       2.87            -0.1        2.78        perf-profile.calltrace.cycl=
es-pp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.f=
ile_remove_privs_flags.__generic_file_write_iter
>       5.27            -0.1        5.18        perf-profile.calltrace.cycl=
es-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_wr=
ite.ksys_write
>       0.81            -0.1        0.75        perf-profile.calltrace.cycl=
es-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_file_=
write_iter.vfs_write
>       2.17            -0.0        2.13        perf-profile.calltrace.cycl=
es-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.gen=
eric_perform_write
>       1.66            -0.0        1.62        perf-profile.calltrace.cycl=
es-pp.up_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
>       0.74            -0.0        0.70        perf-profile.calltrace.cycl=
es-pp.setattr_should_drop_suidgid.file_remove_privs_flags.__generic_file_wr=
ite_iter.generic_file_write_iter.vfs_write
>       1.27            -0.0        1.23        perf-profile.calltrace.cycl=
es-pp.strcmp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_kil=
lpriv.file_remove_privs_flags
>       0.84            -0.0        0.81        perf-profile.calltrace.cycl=
es-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_ver=
ify_area.vfs_write
>       0.61            -0.0        0.57        perf-profile.calltrace.cycl=
es-pp.w_test
>       0.88            -0.0        0.86        perf-profile.calltrace.cycl=
es-pp.folio_wait_stable.__filemap_get_folio.simple_write_begin.generic_perf=
orm_write.generic_file_write_iter
>       0.90            -0.0        0.87        perf-profile.calltrace.cycl=
es-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.generic_f=
ile_write_iter.vfs_write.ksys_write
>       0.61            -0.0        0.59        perf-profile.calltrace.cycl=
es-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       0.68            -0.0        0.66        perf-profile.calltrace.cycl=
es-pp.__cond_resched.__filemap_get_folio.simple_write_begin.generic_perform=
_write.generic_file_write_iter
>       0.71            -0.0        0.69        perf-profile.calltrace.cycl=
es-pp.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>       1.00 =C2=B1  4%      +0.1        1.10 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file_upd=
ate_time.__generic_file_write_iter.generic_file_write_iter
>       2.68            +0.1        2.79        perf-profile.calltrace.cycl=
es-pp.down_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
>       5.18            +0.1        5.31        perf-profile.calltrace.cycl=
es-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.ge=
neric_file_write_iter.vfs_write
>       6.00            +0.1        6.14        perf-profile.calltrace.cycl=
es-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_i=
ter.vfs_write.ksys_write
>       3.35            +0.1        3.48        perf-profile.calltrace.cycl=
es-pp.inode_needs_update_time.file_update_time.__generic_file_write_iter.ge=
neric_file_write_iter.vfs_write
>       4.00            +0.1        4.14        perf-profile.calltrace.cycl=
es-pp.file_update_time.__generic_file_write_iter.generic_file_write_iter.vf=
s_write.ksys_write
>      96.95            +0.2       97.12        perf-profile.calltrace.cycl=
es-pp.write
>       3.68            +0.2        3.86        perf-profile.calltrace.cycl=
es-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
>      84.87            +0.6       85.45        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.write
>      83.48            +0.6       84.10        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      78.96            +0.7       79.70        perf-profile.calltrace.cycl=
es-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      75.00            +0.8       75.81        perf-profile.calltrace.cycl=
es-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.wri=
te
>      58.04            +1.1       59.14        perf-profile.calltrace.cycl=
es-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>      36.40            +1.2       37.55        perf-profile.calltrace.cycl=
es-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do=
_syscall_64
>      12.88            +1.3       14.20        perf-profile.calltrace.cycl=
es-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_=
write.ksys_write
>      11.79            +1.3       13.13        perf-profile.calltrace.cycl=
es-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_=
file_write_iter.vfs_write
>       5.74            +1.4        7.16 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic=
_perform_write.generic_file_write_iter
>       3.98            -0.5        3.44        perf-profile.children.cycle=
s-pp.security_file_permission
>       2.90            -0.5        2.40        perf-profile.children.cycle=
s-pp.apparmor_file_permission
>       7.66            -0.3        7.38        perf-profile.children.cycle=
s-pp.file_remove_privs_flags
>       7.14            -0.3        6.89        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64
>       5.34            -0.2        5.10        perf-profile.children.cycle=
s-pp.rw_verify_area
>       7.10            -0.2        6.88        perf-profile.children.cycle=
s-pp.copy_page_from_iter_atomic
>       3.98            -0.2        3.80        perf-profile.children.cycle=
s-pp.cap_inode_need_killpriv
>       4.73            -0.2        4.56        perf-profile.children.cycle=
s-pp.security_inode_need_killpriv
>      13.16            -0.2       13.00        perf-profile.children.cycle=
s-pp.__generic_file_write_iter
>       1.14            -0.1        1.01        perf-profile.children.cycle=
s-pp.syscall_return_via_sysret
>       5.67            -0.1        5.56        perf-profile.children.cycle=
s-pp.simple_write_end
>       3.56            -0.1        3.46        perf-profile.children.cycle=
s-pp.__vfs_getxattr
>       4.04            -0.1        3.95        perf-profile.children.cycle=
s-pp.__cond_resched
>       4.21            -0.1        4.14        perf-profile.children.cycle=
s-pp.entry_SYSRETQ_unsafe_stack
>       2.31            -0.1        2.24        perf-profile.children.cycle=
s-pp.rcu_all_qs
>       0.99            -0.1        0.93        perf-profile.children.cycle=
s-pp.folio_mark_dirty
>       2.46            -0.0        2.42        perf-profile.children.cycle=
s-pp.xas_load
>       0.93            -0.0        0.88 =C2=B1  2%  perf-profile.children.=
cycles-pp.w_test
>       1.50            -0.0        1.46        perf-profile.children.cycle=
s-pp.strcmp
>       1.72            -0.0        1.68        perf-profile.children.cycle=
s-pp.up_write
>       0.87            -0.0        0.82        perf-profile.children.cycle=
s-pp.setattr_should_drop_suidgid
>       1.04            -0.0        1.00        perf-profile.children.cycle=
s-pp.folio_mapping
>       0.96            -0.0        0.92        perf-profile.children.cycle=
s-pp.aa_file_perm
>       1.23            -0.0        1.20        perf-profile.children.cycle=
s-pp.balance_dirty_pages_ratelimited_flags
>       0.73            -0.0        0.70        perf-profile.children.cycle=
s-pp.x64_sys_call
>       1.07            -0.0        1.05        perf-profile.children.cycle=
s-pp.folio_wait_stable
>       0.43            -0.0        0.41 =C2=B1  2%  perf-profile.children.=
cycles-pp.write@plt
>       1.08            -0.0        1.06        perf-profile.children.cycle=
s-pp.xattr_resolve_name
>       0.35            -0.0        0.34        perf-profile.children.cycle=
s-pp.__x64_sys_write
>      99.01            +0.0       99.04        perf-profile.children.cycle=
s-pp.write
>       1.12 =C2=B1  4%      +0.1        1.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ktime_get_coarse_real_ts64
>       2.86            +0.1        2.97        perf-profile.children.cycle=
s-pp.down_write
>       5.50            +0.1        5.63        perf-profile.children.cycle=
s-pp.fault_in_readable
>       3.75            +0.1        3.88        perf-profile.children.cycle=
s-pp.inode_needs_update_time
>       4.34            +0.1        4.47        perf-profile.children.cycle=
s-pp.file_update_time
>       6.25            +0.1        6.39        perf-profile.children.cycle=
s-pp.fault_in_iov_iter_readable
>       3.77            +0.2        3.96        perf-profile.children.cycle=
s-pp.__fsnotify_parent
>      85.29            +0.6       85.86        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>      84.14            +0.6       84.74        perf-profile.children.cycle=
s-pp.do_syscall_64
>      79.57            +0.7       80.28        perf-profile.children.cycle=
s-pp.ksys_write
>      75.84            +0.8       76.64        perf-profile.children.cycle=
s-pp.vfs_write
>      58.64            +1.1       59.72        perf-profile.children.cycle=
s-pp.generic_file_write_iter
>      37.30            +1.1       38.43        perf-profile.children.cycle=
s-pp.generic_perform_write
>      13.05            +1.3       14.38        perf-profile.children.cycle=
s-pp.simple_write_begin
>      12.18            +1.3       13.52        perf-profile.children.cycle=
s-pp.__filemap_get_folio
>       5.94            +1.4        7.35 =C2=B1  2%  perf-profile.children.=
cycles-pp.filemap_get_entry
>       1.77            -0.4        1.35 =C2=B1  2%  perf-profile.self.cycl=
es-pp.apparmor_file_permission
>       6.23            -0.3        5.94        perf-profile.self.cycles-pp=
.write
>       6.94            -0.2        6.71        perf-profile.self.cycles-pp=
.copy_page_from_iter_atomic
>       7.14            -0.2        6.93        perf-profile.self.cycles-pp=
.vfs_write
>       1.13            -0.1        1.01        perf-profile.self.cycles-pp=
.syscall_return_via_sysret
>       1.49 =C2=B1  3%      -0.1        1.38        perf-profile.self.cycl=
es-pp.ksys_write
>       4.12            -0.1        4.03        perf-profile.self.cycles-pp=
.entry_SYSRETQ_unsafe_stack
>       0.42            -0.1        0.34        perf-profile.self.cycles-pp=
.cap_inode_need_killpriv
>       2.17            -0.1        2.10        perf-profile.self.cycles-pp=
.file_remove_privs_flags
>       1.08            -0.1        1.02        perf-profile.self.cycles-pp=
.security_file_permission
>       1.83            -0.1        1.77        perf-profile.self.cycles-pp=
.do_syscall_64
>       2.74            -0.1        2.68        perf-profile.self.cycles-pp=
.simple_write_end
>       0.86            -0.0        0.81        perf-profile.self.cycles-pp=
.aa_file_perm
>       1.60            -0.0        1.56        perf-profile.self.cycles-pp=
.up_write
>       1.42            -0.0        1.38        perf-profile.self.cycles-pp=
.__vfs_getxattr
>       0.86            -0.0        0.82        perf-profile.self.cycles-pp=
.folio_mapping
>       1.36            -0.0        1.32        perf-profile.self.cycles-pp=
.rcu_all_qs
>       0.52            -0.0        0.49        perf-profile.self.cycles-pp=
.folio_mark_dirty
>       1.78            -0.0        1.75        perf-profile.self.cycles-pp=
.xas_load
>       1.23            -0.0        1.20        perf-profile.self.cycles-pp=
.entry_SYSCALL_64_after_hwframe
>       0.74            -0.0        0.71        perf-profile.self.cycles-pp=
.setattr_should_drop_suidgid
>       0.74            -0.0        0.71 =C2=B1  2%  perf-profile.self.cycl=
es-pp.w_test
>       1.14            -0.0        1.11        perf-profile.self.cycles-pp=
.strcmp
>       2.25            -0.0        2.22        perf-profile.self.cycles-pp=
.__cond_resched
>       0.60            -0.0        0.58        perf-profile.self.cycles-pp=
.x64_sys_call
>       0.77            -0.0        0.75        perf-profile.self.cycles-pp=
.balance_dirty_pages_ratelimited_flags
>       0.61            -0.0        0.60        perf-profile.self.cycles-pp=
.xattr_resolve_name
>       0.74            +0.0        0.76        perf-profile.self.cycles-pp=
.fault_in_iov_iter_readable
>       1.40            +0.1        1.45        perf-profile.self.cycles-pp=
.generic_write_checks
>       1.60            +0.1        1.65        perf-profile.self.cycles-pp=
.inode_needs_update_time
>       1.00 =C2=B1  4%      +0.1        1.08 =C2=B1  3%  perf-profile.self=
.cycles-pp.ktime_get_coarse_real_ts64
>       1.86 =C2=B1  2%      +0.1        1.98        perf-profile.self.cycl=
es-pp.down_write
>       5.34            +0.1        5.47        perf-profile.self.cycles-pp=
.fault_in_readable
>       3.61            +0.2        3.80        perf-profile.self.cycles-pp=
.__fsnotify_parent
>       1.46            +0.3        1.77        perf-profile.self.cycles-pp=
.rw_verify_area
>       3.43            +1.4        4.88 =C2=B1  3%  perf-profile.self.cycl=
es-pp.filemap_get_entry
>
>
> >
> > Thanks,
> > Amir.
> >
> >
> >
> >
> > > testcase: unixbench
> > > test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTD=
X (Sapphire Rapids) with 256G memory
> > > parameters:
> > >
> > >         runtime: 300s
> > >         nr_task: 100%
> > >         test: fsbuffer-w
> > >         cpufreq_governor: performance
> > >
> > >
> > >
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202405291640.2016ebfe-oliver=
.sang@intel.com
> > >
> > >
> > > Details are as below:
> > > ---------------------------------------------------------------------=
----------------------------->
> > >
> > >
> > > The kernel config and materials to reproduce are available at:
> > > https://download.01.org/0day-ci/archive/20240529/202405291640.2016ebf=
e-oliver.sang@intel.com
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/t=
est/testcase:
> > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.c=
gz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > >
> > > commit:
> > >   00c423c0d8 ("fanotify: introduce FAN_PRE_MODIFY permission event")
> > >   9d1fd61f1d ("fanotify: pass optional file access range in pre-conte=
nt event")
> > >
> > > 00c423c0d82eabad 9d1fd61f1d9bb74e44bdcc8767b
> > > ---------------- ---------------------------
> > >          %stddev     %change         %stddev
> > >              \          |                \
> > >   1.23e+08            -7.9%  1.133e+08        unixbench.throughput
> > >       6169            -7.7%       5694        unixbench.time.user_tim=
e
> > >  4.566e+10            -7.9%  4.206e+10        unixbench.workload
> > >  1.513e+11            -4.5%  1.445e+11        perf-stat.i.branch-inst=
ructions
> > >    6891152            +4.8%    7221484        perf-stat.i.branch-miss=
es
> > >   29764445 =C2=B1  2%      -7.4%   27565609 =C2=B1  3%  perf-stat.i.c=
ache-references
> > >       0.91            +2.0%       0.93        perf-stat.i.cpi
> > >  7.187e+11            -2.7%  6.996e+11        perf-stat.i.instruction=
s
> > >       1.26            -2.6%       1.23        perf-stat.i.ipc
> > >       0.00            +0.0        0.01        perf-stat.overall.branc=
h-miss-rate%
> > >       0.73            +2.7%       0.75        perf-stat.overall.cpi
> > >       1.37            -2.6%       1.34        perf-stat.overall.ipc
> > >       5828            +5.7%       6162        perf-stat.overall.path-=
length
> > >  1.505e+11            -4.5%  1.437e+11        perf-stat.ps.branch-ins=
tructions
> > >    6873687            +4.8%    7203107        perf-stat.ps.branch-mis=
ses
> > >   29721957 =C2=B1  2%      -7.3%   27538369 =C2=B1  3%  perf-stat.ps.=
cache-references
> > >  7.148e+11            -2.6%   6.96e+11        perf-stat.ps.instructio=
ns
> > >  2.662e+14            -2.6%  2.592e+14        perf-stat.total.instruc=
tions
> > >      57.79            -2.0       55.78        perf-profile.calltrace.=
cycles-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
> > >      37.58            -2.0       35.63        perf-profile.calltrace.=
cycles-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_writ=
e.do_syscall_64
> > >      13.06            -1.0       12.04        perf-profile.calltrace.=
cycles-pp.entry_SYSCALL_64.write
> > >      13.81            -1.0       12.83        perf-profile.calltrace.=
cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.=
vfs_write.ksys_write
> > >      12.72            -0.9       11.78        perf-profile.calltrace.=
cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.gene=
ric_file_write_iter.vfs_write
> > >       7.00            -0.5        6.47        perf-profile.calltrace.=
cycles-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_wri=
te_iter.vfs_write.ksys_write
> > >       6.53            -0.5        6.02        perf-profile.calltrace.=
cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_=
perform_write.generic_file_write_iter
> > >       5.36            -0.5        4.89        perf-profile.calltrace.=
cycles-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vf=
s_write.ksys_write
> > >       3.66            -0.4        3.28        perf-profile.calltrace.=
cycles-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_s=
yscall_64
> > >       2.68            -0.3        2.36        perf-profile.calltrace.=
cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.=
vfs_write.ksys_write
> > >       6.57            -0.2        6.34        perf-profile.calltrace.=
cycles-pp.file_remove_privs_flags.__generic_file_write_iter.generic_file_wr=
ite_iter.vfs_write.ksys_write
> > >       2.36 =C2=B1  2%      -0.2        2.18 =C2=B1  2%  perf-profile.=
calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.write
> > >       1.83            -0.2        1.66        perf-profile.calltrace.=
cycles-pp.folio_unlock.simple_write_end.generic_perform_write.generic_file_=
write_iter.vfs_write
> > >       2.92            -0.2        2.76        perf-profile.calltrace.=
cycles-pp.down_write.generic_file_write_iter.vfs_write.ksys_write.do_syscal=
l_64
> > >       2.65            -0.2        2.49        perf-profile.calltrace.=
cycles-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin=
.generic_perform_write
> > >       3.95            -0.1        3.83        perf-profile.calltrace.=
cycles-pp.security_inode_need_killpriv.file_remove_privs_flags.__generic_fi=
le_write_iter.generic_file_write_iter.vfs_write
> > >       1.62            -0.1        1.50        perf-profile.calltrace.=
cycles-pp.up_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_=
64
> > >       0.74            -0.1        0.64        perf-profile.calltrace.=
cycles-pp.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
> > >       3.26            -0.1        3.17        perf-profile.calltrace.=
cycles-pp.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_=
privs_flags.__generic_file_write_iter.generic_file_write_iter
> > >       3.57            -0.1        3.49        perf-profile.calltrace.=
cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
> > >       1.61            -0.1        1.53        perf-profile.calltrace.=
cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.write
> > >       0.93            -0.1        0.85        perf-profile.calltrace.=
cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.gener=
ic_file_write_iter.vfs_write.ksys_write
> > >       1.05            -0.1        0.99        perf-profile.calltrace.=
cycles-pp.xas_descend.xas_load.filemap_get_entry.__filemap_get_folio.simple=
_write_begin
> > >       0.61            -0.1        0.55        perf-profile.calltrace.=
cycles-pp.w_test
> > >       0.64            -0.1        0.58        perf-profile.calltrace.=
cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
> > >       0.87            -0.1        0.82        perf-profile.calltrace.=
cycles-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw=
_verify_area.vfs_write
> > >       2.50            -0.1        2.44        perf-profile.calltrace.=
cycles-pp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpr=
iv.file_remove_privs_flags.__generic_file_write_iter
> > >       0.62            -0.1        0.56        perf-profile.calltrace.=
cycles-pp.xas_start.xas_load.filemap_get_entry.__filemap_get_folio.simple_w=
rite_begin
> > >       0.74            -0.0        0.69        perf-profile.calltrace.=
cycles-pp.setattr_should_drop_suidgid.file_remove_privs_flags.__generic_fil=
e_write_iter.generic_file_write_iter.vfs_write
> > >       0.91            -0.0        0.86        perf-profile.calltrace.=
cycles-pp.folio_wait_stable.__filemap_get_folio.simple_write_begin.generic_=
perform_write.generic_file_write_iter
> > >       0.84            -0.0        0.79        perf-profile.calltrace.=
cycles-pp.xattr_resolve_name.__vfs_getxattr.cap_inode_need_killpriv.securit=
y_inode_need_killpriv.file_remove_privs_flags
> > >       0.68            -0.0        0.64        perf-profile.calltrace.=
cycles-pp.__cond_resched.__filemap_get_folio.simple_write_begin.generic_per=
form_write.generic_file_write_iter
> > >       0.74            -0.0        0.71        perf-profile.calltrace.=
cycles-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_f=
ile_write_iter.vfs_write
> > >       0.62            -0.0        0.59        perf-profile.calltrace.=
cycles-pp.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_=
write.ksys_write
> > >       0.97            +0.0        1.00        perf-profile.calltrace.=
cycles-pp.strcmp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need=
_killpriv.file_remove_privs_flags
> > >       0.91            +0.1        0.97        perf-profile.calltrace.=
cycles-pp.timestamp_truncate.inode_needs_update_time.file_update_time.__gen=
eric_file_write_iter.generic_file_write_iter
> > >       0.86 =C2=B1  3%      +0.1        0.94        perf-profile.callt=
race.cycles-pp.generic_write_check_limits.generic_write_checks.generic_file=
_write_iter.vfs_write.ksys_write
> > >       0.58 =C2=B1  2%      +0.1        0.66 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file=
_update_time.__generic_file_write_iter.generic_file_write_iter
> > >      11.24            +0.1       11.36        perf-profile.calltrace.=
cycles-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_=
write.do_syscall_64
> > >       2.01 =C2=B1  2%      +0.1        2.14        perf-profile.callt=
race.cycles-pp.generic_write_checks.generic_file_write_iter.vfs_write.ksys_=
write.do_syscall_64
> > >       6.04            +0.2        6.24        perf-profile.calltrace.=
cycles-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_wri=
te_iter.vfs_write.ksys_write
> > >       5.17            +0.2        5.42        perf-profile.calltrace.=
cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_writ=
e.generic_file_write_iter.vfs_write
> > >      96.75            +0.3       97.03        perf-profile.calltrace.=
cycles-pp.write
> > >       2.57            +0.4        2.92        perf-profile.calltrace.=
cycles-pp.inode_needs_update_time.file_update_time.__generic_file_write_ite=
r.generic_file_write_iter.vfs_write
> > >       3.20            +0.4        3.57        perf-profile.calltrace.=
cycles-pp.file_update_time.__generic_file_write_iter.generic_file_write_ite=
r.vfs_write.ksys_write
> > >      84.82            +1.1       85.88        perf-profile.calltrace.=
cycles-pp.entry_SYSCALL_64_after_hwframe.write
> > >      83.38            +1.2       84.56        perf-profile.calltrace.=
cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
> > >      78.73            +1.5       80.20        perf-profile.calltrace.=
cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
> > >      74.54            +1.8       76.32        perf-profile.calltrace.=
cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe=
.write
> > >       0.00            +4.0        3.99        perf-profile.calltrace.=
cycles-pp.__fsnotify_parent.rw_verify_area.vfs_write.ksys_write.do_syscall_=
64
> > >       5.32            +4.2        9.48        perf-profile.calltrace.=
cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
> > >      58.42            -2.0       56.38        perf-profile.children.c=
ycles-pp.generic_file_write_iter
> > >      38.46            -2.0       36.50        perf-profile.children.c=
ycles-pp.generic_perform_write
> > >      13.99            -1.0       13.01        perf-profile.children.c=
ycles-pp.simple_write_begin
> > >      13.11            -1.0       12.15        perf-profile.children.c=
ycles-pp.__filemap_get_folio
> > >       7.23            -0.6        6.66        perf-profile.children.c=
ycles-pp.entry_SYSCALL_64
> > >       7.12            -0.5        6.59        perf-profile.children.c=
ycles-pp.copy_page_from_iter_atomic
> > >       6.73            -0.5        6.21        perf-profile.children.c=
ycles-pp.filemap_get_entry
> > >       5.76            -0.5        5.26        perf-profile.children.c=
ycles-pp.simple_write_end
> > >       4.05            -0.4        3.64        perf-profile.children.c=
ycles-pp.security_file_permission
> > >       2.93            -0.3        2.59        perf-profile.children.c=
ycles-pp.apparmor_file_permission
> > >       4.32            -0.3        4.04        perf-profile.children.c=
ycles-pp.entry_SYSRETQ_unsafe_stack
> > >       4.20            -0.3        3.92        perf-profile.children.c=
ycles-pp.__cond_resched
> > >       6.91            -0.2        6.67        perf-profile.children.c=
ycles-pp.file_remove_privs_flags
> > >       2.43            -0.2        2.24        perf-profile.children.c=
ycles-pp.rcu_all_qs
> > >       3.10            -0.2        2.92        perf-profile.children.c=
ycles-pp.xas_load
> > >       2.47 =C2=B1  2%      -0.2        2.29 =C2=B1  2%  perf-profile.=
children.cycles-pp.__fdget_pos
> > >       1.92            -0.2        1.74        perf-profile.children.c=
ycles-pp.folio_unlock
> > >       3.11            -0.2        2.94        perf-profile.children.c=
ycles-pp.down_write
> > >       4.18            -0.1        4.04        perf-profile.children.c=
ycles-pp.security_inode_need_killpriv
> > >       1.68            -0.1        1.56        perf-profile.children.c=
ycles-pp.up_write
> > >       3.48            -0.1        3.38        perf-profile.children.c=
ycles-pp.cap_inode_need_killpriv
> > >       1.96            -0.1        1.87        perf-profile.children.c=
ycles-pp.syscall_exit_to_user_mode
> > >       1.28            -0.1        1.18        perf-profile.children.c=
ycles-pp.balance_dirty_pages_ratelimited_flags
> > >       0.92            -0.1        0.84        perf-profile.children.c=
ycles-pp.w_test
> > >       3.14            -0.1        3.06        perf-profile.children.c=
ycles-pp.__vfs_getxattr
> > >       1.00            -0.1        0.92        perf-profile.children.c=
ycles-pp.aa_file_perm
> > >       1.29            -0.1        1.22        perf-profile.children.c=
ycles-pp.xas_descend
> > >       0.76            -0.1        0.70        perf-profile.children.c=
ycles-pp.x64_sys_call
> > >       0.87            -0.1        0.80        perf-profile.children.c=
ycles-pp.setattr_should_drop_suidgid
> > >       1.07            -0.1        1.01        perf-profile.children.c=
ycles-pp.xattr_resolve_name
> > >       1.10            -0.1        1.04        perf-profile.children.c=
ycles-pp.folio_wait_stable
> > >       1.05            -0.1        1.00        perf-profile.children.c=
ycles-pp.folio_mapping
> > >       0.73            -0.1        0.67        perf-profile.children.c=
ycles-pp.xas_start
> > >       0.93            -0.1        0.88        perf-profile.children.c=
ycles-pp.folio_mark_dirty
> > >       0.50            -0.0        0.46        perf-profile.children.c=
ycles-pp.entry_SYSCALL_64_safe_stack
> > >       0.60            -0.0        0.56        perf-profile.children.c=
ycles-pp.inode_to_bdi
> > >       0.43            -0.0        0.39        perf-profile.children.c=
ycles-pp.write@plt
> > >       0.36            -0.0        0.33        perf-profile.children.c=
ycles-pp.amd_clear_divider
> > >       0.37            -0.0        0.35        perf-profile.children.c=
ycles-pp.__x64_sys_write
> > >       0.33            -0.0        0.31        perf-profile.children.c=
ycles-pp.noop_dirty_folio
> > >       0.36            -0.0        0.34        perf-profile.children.c=
ycles-pp.is_bad_inode
> > >       0.24            -0.0        0.23 =C2=B1  2%  perf-profile.child=
ren.cycles-pp.file_remove_privs
> > >       1.18            +0.0        1.21        perf-profile.children.c=
ycles-pp.strcmp
> > >       1.02            +0.1        1.08        perf-profile.children.c=
ycles-pp.timestamp_truncate
> > >      99.01            +0.1       99.09        perf-profile.children.c=
ycles-pp.write
> > >       0.98 =C2=B1  3%      +0.1        1.06        perf-profile.child=
ren.cycles-pp.generic_write_check_limits
> > >       0.68 =C2=B1  2%      +0.1        0.77 =C2=B1  6%  perf-profile.=
children.cycles-pp.ktime_get_coarse_real_ts64
> > >      11.58            +0.1       11.69        perf-profile.children.c=
ycles-pp.__generic_file_write_iter
> > >       2.36 =C2=B1  2%      +0.1        2.50        perf-profile.child=
ren.cycles-pp.generic_write_checks
> > >       5.57            +0.2        5.75        perf-profile.children.c=
ycles-pp.fault_in_readable
> > >       6.28            +0.2        6.49        perf-profile.children.c=
ycles-pp.fault_in_iov_iter_readable
> > >       2.98            +0.4        3.33        perf-profile.children.c=
ycles-pp.inode_needs_update_time
> > >       3.51            +0.4        3.89        perf-profile.children.c=
ycles-pp.file_update_time
> > >      85.24            +1.1       86.31        perf-profile.children.c=
ycles-pp.entry_SYSCALL_64_after_hwframe
> > >      84.05            +1.2       85.21        perf-profile.children.c=
ycles-pp.do_syscall_64
> > >      79.32            +1.5       80.78        perf-profile.children.c=
ycles-pp.ksys_write
> > >      75.49            +1.7       77.21        perf-profile.children.c=
ycles-pp.vfs_write
> > >       3.64            +4.0        7.64        perf-profile.children.c=
ycles-pp.__fsnotify_parent
> > >       5.68            +4.3       10.03        perf-profile.children.c=
ycles-pp.rw_verify_area
> > >       6.96            -0.5        6.44        perf-profile.self.cycle=
s-pp.copy_page_from_iter_atomic
> > >       6.52            -0.5        6.01        perf-profile.self.cycle=
s-pp.write
> > >       6.92            -0.4        6.48        perf-profile.self.cycle=
s-pp.vfs_write
> > >       3.59            -0.3        3.24        perf-profile.self.cycle=
s-pp.filemap_get_entry
> > >       4.41            -0.3        4.09        perf-profile.self.cycle=
s-pp.__filemap_get_folio
> > >       4.23            -0.3        3.95        perf-profile.self.cycle=
s-pp.entry_SYSRETQ_unsafe_stack
> > >       2.79            -0.3        2.52        perf-profile.self.cycle=
s-pp.simple_write_end
> > >       1.76            -0.2        1.52        perf-profile.self.cycle=
s-pp.apparmor_file_permission
> > >       2.32 =C2=B1  2%      -0.2        2.16 =C2=B1  2%  perf-profile.=
self.cycles-pp.__fdget_pos
> > >       1.79            -0.2        1.62        perf-profile.self.cycle=
s-pp.folio_unlock
> > >       2.05            -0.2        1.89        perf-profile.self.cycle=
s-pp.down_write
> > >       2.35            -0.1        2.22        perf-profile.self.cycle=
s-pp.__cond_resched
> > >       1.89            -0.1        1.77        perf-profile.self.cycle=
s-pp.do_syscall_64
> > >       1.38            -0.1        1.26        perf-profile.self.cycle=
s-pp.entry_SYSCALL_64
> > >       1.56            -0.1        1.45        perf-profile.self.cycle=
s-pp.up_write
> > >       1.30            -0.1        1.19        perf-profile.self.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
> > >       1.42            -0.1        1.31        perf-profile.self.cycle=
s-pp.rcu_all_qs
> > >       1.12            -0.1        1.02        perf-profile.self.cycle=
s-pp.security_file_permission
> > >       1.46            -0.1        1.38        perf-profile.self.cycle=
s-pp.ksys_write
> > >       0.90            -0.1        0.83        perf-profile.self.cycle=
s-pp.aa_file_perm
> > >       1.29            -0.1        1.22        perf-profile.self.cycle=
s-pp.xas_load
> > >       0.74            -0.1        0.67        perf-profile.self.cycle=
s-pp.w_test
> > >       1.08            -0.1        1.01        perf-profile.self.cycle=
s-pp.syscall_exit_to_user_mode
> > >       1.98            -0.1        1.92        perf-profile.self.cycle=
s-pp.file_remove_privs_flags
> > >       1.30            -0.1        1.24        perf-profile.self.cycle=
s-pp.__vfs_getxattr
> > >       1.06            -0.1        1.00        perf-profile.self.cycle=
s-pp.xas_descend
> > >       0.80            -0.1        0.74        perf-profile.self.cycle=
s-pp.balance_dirty_pages_ratelimited_flags
> > >       0.63            -0.1        0.58        perf-profile.self.cycle=
s-pp.x64_sys_call
> > >       0.74            -0.1        0.69        perf-profile.self.cycle=
s-pp.setattr_should_drop_suidgid
> > >       0.63            -0.0        0.58        perf-profile.self.cycle=
s-pp.xas_start
> > >       0.87            -0.0        0.83        perf-profile.self.cycle=
s-pp.folio_mapping
> > >       0.50            -0.0        0.46        perf-profile.self.cycle=
s-pp.entry_SYSCALL_64_safe_stack
> > >       0.60            -0.0        0.57        perf-profile.self.cycle=
s-pp.xattr_resolve_name
> > >       0.48            -0.0        0.44        perf-profile.self.cycle=
s-pp.folio_mark_dirty
> > >       0.68            -0.0        0.65        perf-profile.self.cycle=
s-pp.security_inode_need_killpriv
> > >       0.36            -0.0        0.33 =C2=B1  2%  perf-profile.self.=
cycles-pp.inode_to_bdi
> > >       0.52            -0.0        0.49        perf-profile.self.cycle=
s-pp.folio_wait_stable
> > >       0.34            -0.0        0.32        perf-profile.self.cycle=
s-pp.cap_inode_need_killpriv
> > >       0.89            -0.0        0.87        perf-profile.self.cycle=
s-pp.simple_write_begin
> > >       0.25            -0.0        0.23        perf-profile.self.cycle=
s-pp.__x64_sys_write
> > >       0.23 =C2=B1  2%      -0.0        0.22 =C2=B1  2%  perf-profile.=
self.cycles-pp.amd_clear_divider
> > >       0.23 =C2=B1  2%      -0.0        0.21        perf-profile.self.=
cycles-pp.noop_dirty_folio
> > >       0.12 =C2=B1  4%      -0.0        0.10 =C2=B1  3%  perf-profile.=
self.cycles-pp.write@plt
> > >       0.24            -0.0        0.23 =C2=B1  2%  perf-profile.self.=
cycles-pp.is_bad_inode
> > >       0.62            +0.0        0.65        perf-profile.self.cycle=
s-pp.file_update_time
> > >       0.86            +0.0        0.90        perf-profile.self.cycle=
s-pp.strcmp
> > >       0.69            +0.0        0.74        perf-profile.self.cycle=
s-pp.fault_in_iov_iter_readable
> > >       0.75 =C2=B1  3%      +0.1        0.81        perf-profile.self.=
cycles-pp.generic_write_check_limits
> > >       1.42 =C2=B1  2%      +0.1        1.48        perf-profile.self.=
cycles-pp.generic_write_checks
> > >       0.82            +0.1        0.89        perf-profile.self.cycle=
s-pp.timestamp_truncate
> > >       0.58 =C2=B1  3%      +0.1        0.66 =C2=B1  6%  perf-profile.=
self.cycles-pp.ktime_get_coarse_real_ts64
> > >       5.44            +0.2        5.60        perf-profile.self.cycle=
s-pp.fault_in_readable
> > >       1.36            +0.2        1.55        perf-profile.self.cycle=
s-pp.inode_needs_update_time
> > >       1.76 =C2=B1  3%      +0.9        2.64        perf-profile.self.=
cycles-pp.rw_verify_area
> > >       3.46            +3.8        7.25        perf-profile.self.cycle=
s-pp.__fsnotify_parent
> > >
> > >
> > >
> > >
> > > Disclaimer:
> > > Results have been estimated based on internal Intel analysis and are =
provided
> > > for informational purposes only. Any difference in system hardware or=
 software
> > > design or configuration may affect actual performance.
> > >
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > >
