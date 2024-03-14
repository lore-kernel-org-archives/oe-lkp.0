Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0584A6CDB8
	for <oe-lkp@lists.linux.dev>; Thu, 14 Mar 2024 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710408124; cv=none; b=pV4beSok/MmYZiTMpeVjQN5riy8WWYgRqTjOQ5LCyH0WEpWqdRVaXFVuavzZH4JB95wFV6BNYV/IrNEjUp92VTOKiYHdVQqiqixx6zw+4JjUhio6xwFI1iFoEioA3B2Dwuxg8AjcKco9QFbUnBHYT07BhShlPQFAYLfulH9lIO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710408124; c=relaxed/simple;
	bh=ugmKGsafHH/1LRzfdSStYOTwmV1SwV41yCNJWUXdMWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARB7dxZlKr42JXPFUQRtmJLBKlsdtIKbP2VC+x00FhOI5LOfmZGEUvZ4T12vxZYXzt4T8YUOVaxjgiUZdvRzRATHLH1bgt/6/bR8Ph1q2nFKzCBFC6lYjekYn6YcZy/Ud1zipTnE63vJ9CpX1b8FDeP4VqSnAX3glrgN3jJF5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLmnDwVm; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLmnDwVm"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-42ee2012bf0so5669821cf.0
        for <oe-lkp@lists.linux.dev>; Thu, 14 Mar 2024 02:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710408122; x=1711012922; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1e4crB1mm6vJQKf9lfF2tB3cr4l3p4Iw4gMUBr8SF2Q=;
        b=DLmnDwVm7wcMtNWClFFsk/Um7YmcWKCshIUx2bBJz/Gi1g90/BGeu1i104IXU9fn12
         HbVNqg1ttyiPm6Wsajm1+zBJN5/tm8o7/D4wZUQubfHFlZ/otCgKiZqTzNXpaLTTiGJJ
         XG+WOnT6odSqNjGjzFhH5A0ridJFvNNck9v1Xc6oLqOFL0holS4LBOx5MmErBXrYdrvB
         nlgjPg9uzSt/TXlTZVLvVGmjZhfhjBV+7qvy0q/0D0m6JiZN7ms8X6VokdDA4Vpf5tNq
         qc8sfYr6odYMU84zaUV3wGiUcC3eZCMLQ6d1Z0hfxI8b/oOY4yC16ANd01MfgmekLWn/
         ldjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710408122; x=1711012922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1e4crB1mm6vJQKf9lfF2tB3cr4l3p4Iw4gMUBr8SF2Q=;
        b=I16LCiqiWorC4omFOcuvvrE+hEp4WVV/YVvPlASUr3+Q7uo2/X/bDcNCDT2fQQKocY
         W9NHtjj4ls/RvDds6IYcKKIKQPbXx0/wYGJiX3OdxyRZ4hKOHqKqyiNX3VT+TL/SQrEn
         VqXWEJ+RM74Z8nVruwOOQRjM9HZr2OmQS9cetKRzV0ciCwWQhglndlPQKMMYkA/E/Qfs
         vAYpTiXIs8CaKtwoQQcpVm7oyTQu8GovP9Cmm6zQyvTJo6ey46Hgg9URD2MQrKZvTJaa
         D2clL7hJ6AXgGWRz5MqqTQukdFw1By6eZkKRNiFCwmyQLgmO5jqu9TQuqrpIxrQgmBev
         0HGw==
X-Gm-Message-State: AOJu0YwdhThBfgsmoo28EA5xgmW9A1veplEZKMFPGiXts+YItYMIBUCO
	kJM0FACtmI8nm16VePJiq7sFbDT6fICgpOyNiTO8NdB5mIsL1LjliPBK80G3pNyVA3wfch5c7uJ
	vhwg6auoNtAuXGICRu6hoX0/N5Vk=
X-Google-Smtp-Source: AGHT+IFEM+RP8M8uuDuzhZ02FHiN6ghNBGsrKi/A23mUtQDW7OlT3JpOlm/SRnwiCYatz7HRQR2iJaQaW/W8tWP6uMs=
X-Received: by 2002:a05:622a:91:b0:42e:7e4d:9b68 with SMTP id
 o17-20020a05622a009100b0042e7e4d9b68mr7327899qtw.18.1710408121764; Thu, 14
 Mar 2024 02:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403141505.807a722b-oliver.sang@intel.com>
In-Reply-To: <202403141505.807a722b-oliver.sang@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 14 Mar 2024 11:21:50 +0200
Message-ID: <CAOQ4uxg=+fYa6cGeb3_FSCdSQMS8nW_9_XMheEGSQ_m1HafmZA@mail.gmail.com>
Subject: Re: [amir73il:fsnotify-sbconn] [fsnotify] 629f30e073:
 unixbench.throughput 5.8% improvement
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Jan Kara <jack@suse.cz>, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 10:23=E2=80=AFAM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
> hi, Amir Goldstein,
>
> while for report
> "[amir73il:sb_write_barrier] [fsnotify] 9c13a708ef: will-it-scale.per_thr=
ead_ops -4.2% regression"
> by our tests, "fsnotify: optimize the case of no permission event watcher=
s"
> caused some performance improvements in will-it-scale tests.
> (https://lore.kernel.org/all/Zc7KmlQ1cYVrPMQ+@xsang-OptiPlex-9020/)
>
> we report below just FYI what its behavior on another branch 'fsnotify-sb=
conn'
> with unixbench tests.
>
>
> Hello,
>
> kernel test robot noticed a 5.8% improvement of unixbench.throughput on:
>
>
> commit: 629f30e073f457c2209aa2517dd653fe7da9bfd6 ("fsnotify: optimize the=
 case of no permission event watchers")
> https://github.com/amir73il/linux fsnotify-sbconn
>
> testcase: unixbench
> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10G=
Hz (Ice Lake) with 256G memory
> parameters:
>
>         runtime: 300s
>         nr_task: 100%
>         test: fstime-r
>         cpufreq_governor: performance
>

Thanks Oliver, that's interesting.
The thing is that I had expected this performance improvement for the
"small buffered read/write" workloads, so I was a bit surprised not to
see it reported earlier.

Specifically, the reduction of fsnotify_parent cycles is expected, because =
the
optimization avoids many fsnotify_parent() calls.
Commit 082fd1ea1f98 ("fsnotify: optimize the case of no parent watcher")
that was merged upstream yesterday should have reduced fsnotify_parent cycl=
es
considerably (as well as fsnotify() cycles) and this commit is expected to
further reduce them in some workloads.

The problem with the report on the fsnotify-sbconn branch is that this bran=
ch
currently has a bug (that was also in the first version of fsnotify-sbinfo)=
.
AFAIK, this bug does not result in false report of improvements, if anythin=
g
it breaks some optimizations, but I cannot say for sure.

Can you try to rerun unixbench benchmark on the latest fsnotify-sbinfo bran=
ch:

* 7252b8296541 - (github/fsnotify-sbinfo) fsnotify: optimize the case
of no permission event watchers
* b05b4e647f7a - fsnotify: use an enum for group priority constants
* 850b57bda1e8 - fsnotify: move s_fsnotify_connectors into fsnotify_sb_info
* 78ed046d7030 - fsnotify: lazy attach fsnotify_sb_info state to sb

It is mostly identical to the commit on fsnotify-perf that you tested
will-it-scale
manually, just a couple of minor review changes that should not affect
these tests.

The main difference between fsnotify-sbinfo and fsnotify-sbconn is the comm=
it
78ed046d7030 ("fsnotify: lazy attach fsnotify_sb_info state to sb")
If we find out that fsnotify-sbinfo does not yield the same unixbench
improvement
as fsnotify-sbconn does this is something that needs to be investigated.

I have also pushed a fixed version of fsnotify-sbconn with the bug
fixed for comparison:

* 939c68368456 - (github/fsnotify-sbconn) fsnotify: optimize the case
of no permission event watchers
* 20e86594ebad - fsnotify: use an enum for group priority constants
* 9ee2d92d59cc - fsnotify: move s_fsnotify_connectors into sb connector

Thanks,
Amir.

>
>
>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240314/202403141505.807a722b-ol=
iver.sang@intel.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase:
>   gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/3=
00s/lkp-icl-2sp9/fstime-r/unixbench
>
> commit:
>   20e86594eb ("fsnotify: use an enum for group priority constants")
>   629f30e073 ("fsnotify: optimize the case of no permission event watcher=
s")
>
> 20e86594ebade045 629f30e073f457c2209aa2517dd
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       3568            -1.7%       3507        proc-vmstat.nr_page_table_p=
ages
>  1.334e+08            +5.8%  1.412e+08        unixbench.throughput
>       1648            +5.3%       1735        unixbench.time.user_time
>   5.74e+10            +5.9%  6.082e+10        unixbench.workload
>       3.28            +5.2%       3.45        perf-stat.i.MPKI
>  2.653e+10            +1.6%  2.695e+10        perf-stat.i.branch-instruct=
ions
>   32649261            -7.4%   30238184        perf-stat.i.branch-misses
>  5.186e+08            +6.1%  5.504e+08        perf-stat.i.cache-misses
>  1.655e+09            +5.3%  1.743e+09        perf-stat.i.cache-reference=
s
>     472.59 =C2=B1  2%      -4.8%     450.03 =C2=B1  2%  perf-stat.i.cycle=
s-between-cache-misses
>       3.69            +6.0%       3.91        perf-stat.overall.MPKI
>       0.12            -0.0        0.11        perf-stat.overall.branch-mi=
ss-rate%
>      31.34            +0.2       31.58        perf-stat.overall.cache-mis=
s-rate%
>     303.09            -6.3%     284.06        perf-stat.overall.cycles-be=
tween-cache-misses
>       1054            -5.5%     997.35        perf-stat.overall.path-leng=
th
>   2.65e+10            +1.6%  2.693e+10        perf-stat.ps.branch-instruc=
tions
>   32593661            -7.3%   30202456        perf-stat.ps.branch-misses
>   5.18e+08            +6.2%    5.5e+08        perf-stat.ps.cache-misses
>  1.653e+09            +5.3%  1.741e+09        perf-stat.ps.cache-referenc=
es
>       8.43            -4.0        4.42        perf-profile.calltrace.cycl=
es-pp.__fsnotify_parent.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
>      79.00            -1.0       77.96        perf-profile.calltrace.cycl=
es-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>      82.99            -0.8       82.14        perf-profile.calltrace.cycl=
es-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>      86.80            -0.7       86.12        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>      88.17            -0.6       87.56        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.read
>       4.90 =C2=B1  2%      -0.3        4.55 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.rw_verify_area.vfs_read.ksys_read.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
>      98.46            -0.1       98.37        perf-profile.calltrace.cycl=
es-pp.read
>       0.72            +0.1        0.78        perf-profile.calltrace.cycl=
es-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_ver=
ify_area.vfs_read
>       0.84            +0.1        0.89        perf-profile.calltrace.cycl=
es-pp.r_test
>       1.37            +0.1        1.44        perf-profile.calltrace.cycl=
es-pp.xas_descend.xas_load.filemap_get_read_batch.filemap_get_pages.filemap=
_read
>       3.18            +0.1        3.31        perf-profile.calltrace.cycl=
es-pp.xas_load.filemap_get_read_batch.filemap_get_pages.filemap_read.vfs_re=
ad
>       3.85            +0.2        4.02        perf-profile.calltrace.cycl=
es-pp.atime_needs_update.touch_atime.filemap_read.vfs_read.ksys_read
>       4.49            +0.2        4.69        perf-profile.calltrace.cycl=
es-pp.touch_atime.filemap_read.vfs_read.ksys_read.do_syscall_64
>       8.11            +0.5        8.57        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64.read
>       9.90 =C2=B1  2%      +0.6       10.51        perf-profile.calltrace=
.cycles-pp.filemap_get_read_batch.filemap_get_pages.filemap_read.vfs_read.k=
sys_read
>      12.29            +0.8       13.07        perf-profile.calltrace.cycl=
es-pp.filemap_get_pages.filemap_read.vfs_read.ksys_read.do_syscall_64
>      28.37            +1.8       30.19        perf-profile.calltrace.cycl=
es-pp._copy_to_iter.copy_page_to_iter.filemap_read.vfs_read.ksys_read
>      29.72            +1.8       31.56        perf-profile.calltrace.cycl=
es-pp.copy_page_to_iter.filemap_read.vfs_read.ksys_read.do_syscall_64
>      57.38            +3.2       60.61        perf-profile.calltrace.cycl=
es-pp.filemap_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_=
hwframe
>       8.64            -4.1        4.53        perf-profile.children.cycle=
s-pp.__fsnotify_parent
>      79.41            -1.0       78.38        perf-profile.children.cycle=
s-pp.vfs_read
>      83.38            -0.8       82.55        perf-profile.children.cycle=
s-pp.ksys_read
>      87.31            -0.7       86.65        perf-profile.children.cycle=
s-pp.do_syscall_64
>      88.36            -0.6       87.76        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>       5.10 =C2=B1  2%      -0.3        4.76        perf-profile.children.=
cycles-pp.rw_verify_area
>      98.75            -0.1       98.68        perf-profile.children.cycle=
s-pp.read
>       0.33            +0.0        0.35        perf-profile.children.cycle=
s-pp.__x64_sys_read
>       0.39            +0.0        0.41        perf-profile.children.cycle=
s-pp.make_vfsgid
>       0.39            +0.0        0.41        perf-profile.children.cycle=
s-pp.make_vfsuid
>       0.54            +0.0        0.57        perf-profile.children.cycle=
s-pp.read@plt
>       0.34            +0.0        0.37        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_safe_stack
>       0.30 =C2=B1  3%      +0.0        0.33 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       0.84 =C2=B1  2%      +0.0        0.88        perf-profile.children.=
cycles-pp.generic_file_read_iter
>       0.82            +0.1        0.88        perf-profile.children.cycle=
s-pp.aa_file_perm
>       1.75 =C2=B1  2%      +0.1        1.81        perf-profile.children.=
cycles-pp.syscall_exit_to_user_mode
>       1.25            +0.1        1.33        perf-profile.children.cycle=
s-pp.r_test
>       1.57            +0.1        1.66        perf-profile.children.cycle=
s-pp.xas_descend
>       3.54            +0.1        3.66 =C2=B1  2%  perf-profile.children.=
cycles-pp.security_file_permission
>       3.59            +0.1        3.74        perf-profile.children.cycle=
s-pp.xas_load
>       3.60            +0.2        3.79        perf-profile.children.cycle=
s-pp.entry_SYSRETQ_unsafe_stack
>       4.24            +0.2        4.43        perf-profile.children.cycle=
s-pp.atime_needs_update
>       4.69            +0.2        4.90        perf-profile.children.cycle=
s-pp.touch_atime
>       4.70            +0.3        4.96        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64
>      10.20 =C2=B1  2%      +0.6       10.83        perf-profile.children.=
cycles-pp.filemap_get_read_batch
>      12.50            +0.8       13.28        perf-profile.children.cycle=
s-pp.filemap_get_pages
>      28.48            +1.8       30.31        perf-profile.children.cycle=
s-pp._copy_to_iter
>      29.94            +1.9       31.80        perf-profile.children.cycle=
s-pp.copy_page_to_iter
>      57.92            +3.3       61.17        perf-profile.children.cycle=
s-pp.filemap_read
>       8.38            -4.0        4.40        perf-profile.self.cycles-pp=
.__fsnotify_parent
>       1.54 =C2=B1  7%      -0.5        1.09 =C2=B1  4%  perf-profile.self=
.cycles-pp.rw_verify_area
>       0.20            +0.0        0.21        perf-profile.self.cycles-pp=
.__x64_sys_read
>       0.29            +0.0        0.31        perf-profile.self.cycles-pp=
.make_vfsgid
>       0.29            +0.0        0.31        perf-profile.self.cycles-pp=
.make_vfsuid
>       0.43            +0.0        0.46        perf-profile.self.cycles-pp=
.touch_atime
>       0.34            +0.0        0.36        perf-profile.self.cycles-pp=
.entry_SYSCALL_64_safe_stack
>       0.74 =C2=B1  2%      +0.0        0.77        perf-profile.self.cycl=
es-pp.generic_file_read_iter
>       0.70            +0.0        0.75        perf-profile.self.cycles-pp=
.aa_file_perm
>       1.35            +0.0        1.40        perf-profile.self.cycles-pp=
.current_time
>       0.88            +0.0        0.94        perf-profile.self.cycles-pp=
.security_file_permission
>       1.14            +0.1        1.20        perf-profile.self.cycles-pp=
.entry_SYSCALL_64_after_hwframe
>       1.30            +0.1        1.37        perf-profile.self.cycles-pp=
.ksys_read
>       1.26            +0.1        1.33        perf-profile.self.cycles-pp=
.entry_SYSCALL_64
>       1.36            +0.1        1.43        perf-profile.self.cycles-pp=
.xas_descend
>       1.12            +0.1        1.20        perf-profile.self.cycles-pp=
.r_test
>       1.18            +0.1        1.26        perf-profile.self.cycles-pp=
.xas_load
>       1.75            +0.1        1.83        perf-profile.self.cycles-pp=
.atime_needs_update
>       2.04            +0.1        2.15        perf-profile.self.cycles-pp=
.do_syscall_64
>       2.28            +0.2        2.44        perf-profile.self.cycles-pp=
.filemap_get_pages
>       3.47            +0.2        3.65        perf-profile.self.cycles-pp=
.entry_SYSRETQ_unsafe_stack
>       3.94            +0.2        4.16        perf-profile.self.cycles-pp=
.read
>       9.88            +0.4       10.28        perf-profile.self.cycles-pp=
.filemap_read
>       6.57 =C2=B1  3%      +0.5        7.05 =C2=B1  2%  perf-profile.self=
.cycles-pp.filemap_get_read_batch
>      28.21            +1.8       30.01        perf-profile.self.cycles-pp=
._copy_to_iter
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
