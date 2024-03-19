Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1DF7F7CA
	for <oe-lkp@lists.linux.dev>; Tue, 19 Mar 2024 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710842199; cv=none; b=I1GS5aBJniEIOrjpsA8SXR1C3xWftapu75joWoztZcaPNNTVvJQpOzmnHNZ5Pp1ERcnSJioh7gI99iD6IayqrKJR4sIiYKmic4iL4gaCMlqGcjnUfHwDCAJSRyr8P5cq//TdDWVGAFq8Wp80zTEohWmZbZWsAuf9Ex9Y83vhuws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710842199; c=relaxed/simple;
	bh=mMwrKw6CnRjMCoYiqeAaGe6I2Vw8TdanNkSX12q8byg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rItQHwZbAWJw+HIZmuQpO5NLxoyyvPJS1smfANZoeVebs36mltWbC2URNwZ3I2VTLwaXDNJb5GXqe7ZuvYOBkUUzTMa4wQbDegsbKsQy05UktCC6rtHbQ00WAjOyghD0twZCcNJVgmFBhzBUFPqyEEXB0LJGpG+1fLBbNzWJ6Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0OEIHY9; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0OEIHY9"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-430b6ff2a20so19994611cf.2
        for <oe-lkp@lists.linux.dev>; Tue, 19 Mar 2024 02:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710842195; x=1711446995; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WC2PI9fp+yT9shNMzR+6bPOmKCG9GqAGfSGWuGIt+w=;
        b=O0OEIHY9EnGXyVJaP/Lp3mpQFFKcajhz+UIE6pQTM63KAVhy1LNqGR7p+bdDm/b6sE
         MF0mAba+j4KT6duBQPVMsZ3BVqmaN3mFohYVrKKozrS5+GSZszWWlMcjR87C7AdWIxyl
         5ZXw9AUwG9NFo17TcnRbA3a6igjvqJHFEa1+i6+TlD/qTnPGRseF/ywemEpQBuvDqMlY
         IlHlcgwgjhTLB2N4knZGUrTXdn2RCPlcMZJTsfsKPT8JswfdcsZaBVt82+luZK/lfvVW
         mX+ReI8GjmvQ1ta0ArsS6m04BPHhaqmQF0pZZQTr/sI9VPUuYu1mc7719ktj2iImT9+C
         WVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710842195; x=1711446995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WC2PI9fp+yT9shNMzR+6bPOmKCG9GqAGfSGWuGIt+w=;
        b=gBFiV5ISyt3ouuMktMv5nFsT8O0oRfhb2/kzQeAXYDC9q2Q7RqhYT5X4PbfnZeH/Lp
         f6pXt9pXo5znbPmaoCM16lOiuv7JmZkHNHgbmqo3y7iatxl64UZOyTCtDEPvlhrUnBQU
         LcaRJOAVkqu2IVfjdPRMvM+8uWybm22gpCXs/V5HDGzpCwOhLnIcqJtEkzwiLZEH3ajJ
         EGgPuFPmLMm6MkXQLxxiCp/hid9BzizOrvMgAY4q//jOGpZkYxp0UUE2rOdxT7/YZZ8C
         PGprHSniJ9RDL67EkxSJrgmc/EBBVUxyedOf+mJAQlOpUjY2T/lYjBthDAJL8kPXPOEW
         CPwA==
X-Gm-Message-State: AOJu0YwKGh6agNCtQPA/+16tDxpEFt4QLde+++u636bGceEhGJllJVE7
	Lk6ldqVjrTwMSWAEHHnuFFf7XvlsPicUvG7MzEA+4UqRPYXUUChCkVhLYbLGkZ8uK3Ao0QQRdMj
	zn/ZqJYo842MecOxxLRLDY4r0brc=
X-Google-Smtp-Source: AGHT+IGFL6gTMYk/rkQjnGn9WAz9FEaZxQShyveVRNgahxAiwPEbQKcLmhBs71NAGkRsZaUOqX+W+ULbThWwrVzRrxI=
X-Received: by 2002:ac8:5f83:0:b0:42e:f5fa:cfe7 with SMTP id
 j3-20020ac85f83000000b0042ef5facfe7mr18376607qta.61.1710842195103; Tue, 19
 Mar 2024 02:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403141505.807a722b-oliver.sang@intel.com> <CAOQ4uxg=+fYa6cGeb3_FSCdSQMS8nW_9_XMheEGSQ_m1HafmZA@mail.gmail.com>
 <Zfj3wxDHolB1qCGO@xsang-OptiPlex-9020>
In-Reply-To: <Zfj3wxDHolB1qCGO@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 19 Mar 2024 11:56:23 +0200
Message-ID: <CAOQ4uxgJa108CN+xo2Ocfe+_k-T3VbK7xGQtf43As2ADgqVPdA@mail.gmail.com>
Subject: Re: [amir73il:fsnotify-sbconn] [fsnotify] 629f30e073:
 unixbench.throughput 5.8% improvement
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Jan Kara <jack@suse.cz>, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 4:26=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Amir,
>
> On Thu, Mar 14, 2024 at 11:21:50AM +0200, Amir Goldstein wrote:
> > On Thu, Mar 14, 2024 at 10:23=E2=80=AFAM kernel test robot
> > <oliver.sang@intel.com> wrote:
> > >
> > >
> > > hi, Amir Goldstein,
> > >
> > > while for report
> > > "[amir73il:sb_write_barrier] [fsnotify] 9c13a708ef: will-it-scale.per=
_thread_ops -4.2% regression"
> > > by our tests, "fsnotify: optimize the case of no permission event wat=
chers"
> > > caused some performance improvements in will-it-scale tests.
> > > (https://lore.kernel.org/all/Zc7KmlQ1cYVrPMQ+@xsang-OptiPlex-9020/)
> > >
> > > we report below just FYI what its behavior on another branch 'fsnotif=
y-sbconn'
> > > with unixbench tests.
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed a 5.8% improvement of unixbench.throughput =
on:
> > >
> > >
> > > commit: 629f30e073f457c2209aa2517dd653fe7da9bfd6 ("fsnotify: optimize=
 the case of no permission event watchers")
> > > https://github.com/amir73il/linux fsnotify-sbconn
> > >
> > > testcase: unixbench
> > > test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3=
.10GHz (Ice Lake) with 256G memory
> > > parameters:
> > >
> > >         runtime: 300s
> > >         nr_task: 100%
> > >         test: fstime-r
> > >         cpufreq_governor: performance
> > >
> >
> > Thanks Oliver, that's interesting.
> > The thing is that I had expected this performance improvement for the
> > "small buffered read/write" workloads, so I was a bit surprised not to
> > see it reported earlier.
> >
> > Specifically, the reduction of fsnotify_parent cycles is expected, beca=
use the
> > optimization avoids many fsnotify_parent() calls.
> > Commit 082fd1ea1f98 ("fsnotify: optimize the case of no parent watcher"=
)
> > that was merged upstream yesterday should have reduced fsnotify_parent =
cycles
> > considerably (as well as fsnotify() cycles) and this commit is expected=
 to
> > further reduce them in some workloads.
> >
> > The problem with the report on the fsnotify-sbconn branch is that this =
branch
> > currently has a bug (that was also in the first version of fsnotify-sbi=
nfo).
> > AFAIK, this bug does not result in false report of improvements, if any=
thing
> > it breaks some optimizations, but I cannot say for sure.
> >
> > Can you try to rerun unixbench benchmark on the latest fsnotify-sbinfo =
branch:
> >
> > * 7252b8296541 - (github/fsnotify-sbinfo) fsnotify: optimize the case
> > of no permission event watchers
> > * b05b4e647f7a - fsnotify: use an enum for group priority constants
> > * 850b57bda1e8 - fsnotify: move s_fsnotify_connectors into fsnotify_sb_=
info
> > * 78ed046d7030 - fsnotify: lazy attach fsnotify_sb_info state to sb
> >
> > It is mostly identical to the commit on fsnotify-perf that you tested
> > will-it-scale
> > manually, just a couple of minor review changes that should not affect
> > these tests.
> >
> > The main difference between fsnotify-sbinfo and fsnotify-sbconn is the =
commit
> > 78ed046d7030 ("fsnotify: lazy attach fsnotify_sb_info state to sb")
> > If we find out that fsnotify-sbinfo does not yield the same unixbench
> > improvement
> > as fsnotify-sbconn does this is something that needs to be investigated=
.
>
> on fsnotify-sbinfo branch, we still observed similar performance improvem=
ent.
> (I chose 14c141dab0a87 ("Merge remote-tracking branch 'jack/fsnotify' int=
o next")
> as base since I noticed it's also the base for fsnotify-sbconn)
>
> the 78ed046d7030 ("fsnotify: lazy attach fsnotify_sb_info state to sb") s=
eems
> not introduce further impact.
>

That's great!

Thanks for testing!
Amir.

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
>   14c141dab0a87 ("Merge remote-tracking branch 'jack/fsnotify' into next"=
)
>   78ed046d70300 ("fsnotify: lazy attach fsnotify_sb_info state to sb")
>   b05b4e647f7a7 ("fsnotify: use an enum for group priority constants")
>   7252b8296541d ("fsnotify: optimize the case of no permission event watc=
hers")
>
> 14c141dab0a87876 78ed046d703006625177ad110c8 b05b4e647f7a7fa293b5c158f62 =
7252b8296541ded934ebaa47609
> ---------------- --------------------------- --------------------------- =
---------------------------
>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev
>              \          |                \          |                \   =
       |                \
>  1.338e+08            +0.4%  1.344e+08            +0.3%  1.342e+08       =
     +5.8%  1.416e+08        unixbench.throughput
>  5.759e+10            +0.4%  5.784e+10            +0.2%  5.772e+10       =
     +5.8%  6.094e+10        unixbench.workload
>
> detail is at [1]
>
>
> >
> > I have also pushed a fixed version of fsnotify-sbconn with the bug
> > fixed for comparison:
> >
> > * 939c68368456 - (github/fsnotify-sbconn) fsnotify: optimize the case
> > of no permission event watchers
> > * 20e86594ebad - fsnotify: use an enum for group priority constants
> > * 9ee2d92d59cc - fsnotify: move s_fsnotify_connectors into sb connector
> >
>
> on new fsnotify-sbconn, still observed similar performance improvement.
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
>   14c141dab0a87 ("Merge remote-tracking branch 'jack/fsnotify' into next"=
)
>   20e86594ebade fsnotify: use an enum for group priority constants
>   939c683684560 ("fsnotify: optimize the case of no permission event watc=
hers")
>
> 14c141dab0a87876 20e86594ebade045d589ef3ea7c 939c6836845602989da2043b956
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>  1.338e+08            -0.2%  1.336e+08            +5.2%  1.408e+08       =
 unixbench.throughput
>  5.759e+10            -0.2%  5.748e+10            +5.2%  6.058e+10       =
 unixbench.workload
>
>
> detail is at [2]
>
> > Thanks,
> > Amir.
> >
>
> [1]
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
>   14c141dab0a87 ("Merge remote-tracking branch 'jack/fsnotify' into next"=
)
>   78ed046d70300 ("fsnotify: lazy attach fsnotify_sb_info state to sb")
>   b05b4e647f7a7 ("fsnotify: use an enum for group priority constants")
>   7252b8296541d ("fsnotify: optimize the case of no permission event watc=
hers")
>
> 14c141dab0a87876 78ed046d703006625177ad110c8 b05b4e647f7a7fa293b5c158f62 =
7252b8296541ded934ebaa47609
> ---------------- --------------------------- --------------------------- =
---------------------------
>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev
>              \          |                \          |                \   =
       |                \
>       1679            -0.3%       1675            -0.5%       1671       =
     +2.6%       1723        time.user_time
>  1.338e+08            +0.4%  1.344e+08            +0.3%  1.342e+08       =
     +5.8%  1.416e+08        unixbench.throughput
>       1679            -0.3%       1675            -0.5%       1671       =
     +2.6%       1723        unixbench.time.user_time
>  5.759e+10            +0.4%  5.784e+10            +0.2%  5.772e+10       =
     +5.8%  6.094e+10        unixbench.workload
>       3.30            +0.2%       3.30            -0.8%       3.27       =
     +5.2%       3.47        perf-stat.i.MPKI
>   2.64e+10            +0.4%  2.652e+10            +0.9%  2.665e+10       =
     +2.4%  2.704e+10        perf-stat.i.branch-instructions
>   28834151            -0.1%   28805905            -0.0%   28821542       =
     +4.9%   30245244        perf-stat.i.branch-misses
>      27.39            +0.1       27.45            -0.0       27.35       =
     +0.3       27.69        perf-stat.i.cache-miss-rate%
>  5.195e+08            +0.8%  5.234e+08            +0.0%  5.197e+08       =
     +6.9%  5.554e+08        perf-stat.i.cache-misses
>  1.661e+09            +0.5%  1.669e+09            +0.1%  1.663e+09       =
     +5.4%   1.75e+09        perf-stat.i.cache-references
>       3.70            +0.3%       3.72            -0.6%       3.68       =
     +6.2%       3.94        perf-stat.overall.MPKI
>       0.11            -0.0        0.11            -0.0        0.11       =
     +0.0        0.11        perf-stat.overall.branch-miss-rate%
>      31.27            +0.1       31.36            -0.0       31.26       =
     +0.5       31.73        perf-stat.overall.cache-miss-rate%
>     302.77            -0.5%     301.23            -0.3%     301.80       =
     -6.8%     282.31        perf-stat.overall.cycles-between-cache-misses
>       1049            -0.0%       1049            +0.4%       1054       =
     -4.8%     999.30        perf-stat.overall.path-length
>  2.637e+10            +0.5%  2.649e+10            +0.9%  2.662e+10       =
     +2.4%  2.702e+10        perf-stat.ps.branch-instructions
>   28794853            -0.1%   28770967            -0.0%   28782790       =
     +4.9%   30207845        perf-stat.ps.branch-misses
>  5.189e+08            +0.8%  5.229e+08            +0.0%  5.191e+08       =
     +6.9%   5.55e+08        perf-stat.ps.cache-misses
>  1.659e+09            +0.5%  1.667e+09            +0.1%  1.661e+09       =
     +5.4%  1.749e+09        perf-stat.ps.cache-references
>      57.94            -0.2       57.72            -0.4       57.50       =
     +2.9       60.81        perf-profile.calltrace.cycles-pp.filemap_read.=
vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      28.59            -0.2       28.39 =C2=B1  2%      +0.1       28.68  =
          +1.9       30.48        perf-profile.calltrace.cycles-pp._copy_to=
_iter.copy_page_to_iter.filemap_read.vfs_read.ksys_read
>      29.95            -0.2       29.77 =C2=B1  2%      +0.0       29.98  =
          +1.9       31.86        perf-profile.calltrace.cycles-pp.copy_pag=
e_to_iter.filemap_read.vfs_read.ksys_read.do_syscall_64
>      12.70            -0.1       12.56            -0.4       12.33       =
     +0.2       12.92        perf-profile.calltrace.cycles-pp.filemap_get_p=
ages.filemap_read.vfs_read.ksys_read.do_syscall_64
>      78.91            -0.1       78.80            +0.0       78.93       =
     -0.9       78.00        perf-profile.calltrace.cycles-pp.vfs_read.ksys=
_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>      82.87            -0.1       82.79            +0.1       82.93       =
     -0.6       82.26        perf-profile.calltrace.cycles-pp.ksys_read.do_=
syscall_64.entry_SYSCALL_64_after_hwframe.read
>      86.80            -0.1       86.73            -0.0       86.75       =
     -0.6       86.19        perf-profile.calltrace.cycles-pp.do_syscall_64=
.entry_SYSCALL_64_after_hwframe.read
>      88.16            -0.1       88.09            -0.0       88.12       =
     -0.5       87.64        perf-profile.calltrace.cycles-pp.entry_SYSCALL=
_64_after_hwframe.read
>       1.26            -0.0        1.24            -0.1        1.20 =C2=B1=
  2%      -0.1        1.16 =C2=B1  2%  perf-profile.calltrace.cycles-pp.sys=
call_return_via_sysret.read
>       0.72            -0.0        0.71            +0.0        0.72       =
     +0.0        0.74        perf-profile.calltrace.cycles-pp.__cond_resche=
d.filemap_read.vfs_read.ksys_read.do_syscall_64
>       0.73            -0.0        0.73            +0.0        0.73       =
     +0.0        0.77        perf-profile.calltrace.cycles-pp.aa_file_perm.=
apparmor_file_permission.security_file_permission.rw_verify_area.vfs_read
>       0.74            +0.0        0.74 =C2=B1  2%      +0.0        0.74  =
          +0.1        0.79        perf-profile.calltrace.cycles-pp.generic_=
file_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
>       1.41            +0.0        1.41            -0.1        1.28       =
     +0.0        1.42        perf-profile.calltrace.cycles-pp.xas_descend.x=
as_load.filemap_get_read_batch.filemap_get_pages.filemap_read
>      98.50            +0.0       98.50            -0.0       98.47       =
     -0.1       98.37        perf-profile.calltrace.cycles-pp.read
>       1.53            +0.0        1.54            -0.1        1.46       =
     -0.1        1.48        perf-profile.calltrace.cycles-pp.syscall_exit_=
to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>       0.80            +0.0        0.81            +0.0        0.84       =
     +0.1        0.89        perf-profile.calltrace.cycles-pp.r_test
>       0.79            +0.0        0.80 =C2=B1  5%      +0.0        0.79 =
=C2=B1  3%      +0.1        0.86        perf-profile.calltrace.cycles-pp.xa=
s_start.xas_load.filemap_get_read_batch.filemap_get_pages.filemap_read
>       4.47            +0.0        4.48 =C2=B1  2%      +0.4        4.83 =
=C2=B1  2%      +0.0        4.50        perf-profile.calltrace.cycles-pp.rw=
_verify_area.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e
>       3.18            +0.0        3.20            -0.1        3.04       =
     +0.1        3.30        perf-profile.calltrace.cycles-pp.xas_load.file=
map_get_read_batch.filemap_get_pages.filemap_read.vfs_read
>       2.74            +0.0        2.75 =C2=B1  3%      +0.0        2.76 =
=C2=B1  2%      +0.3        2.99 =C2=B1  3%  perf-profile.calltrace.cycles-=
pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>       3.15            +0.0        3.16 =C2=B1  2%      +0.1        3.22  =
          +0.2        3.36 =C2=B1  2%  perf-profile.calltrace.cycles-pp.sec=
urity_file_permission.rw_verify_area.vfs_read.ksys_read.do_syscall_64
>       2.42            +0.0        2.44 =C2=B1  2%      +0.1        2.48 =
=C2=B1  2%      +0.2        2.61 =C2=B1  2%  perf-profile.calltrace.cycles-=
pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_rea=
d.ksys_read
>       1.67            +0.0        1.70 =C2=B1  2%      -0.0        1.65  =
          +0.1        1.76        perf-profile.calltrace.cycles-pp.current_=
time.atime_needs_update.touch_atime.filemap_read.vfs_read
>       4.47            +0.0        4.50 =C2=B1  2%      -0.0        4.46  =
          +0.2        4.69        perf-profile.calltrace.cycles-pp.touch_at=
ime.filemap_read.vfs_read.ksys_read.do_syscall_64
>       3.84            +0.0        3.87 =C2=B1  2%      -0.0        3.82  =
          +0.2        4.01        perf-profile.calltrace.cycles-pp.atime_ne=
eds_update.touch_atime.filemap_read.vfs_read.ksys_read
>       8.09            +0.1        8.16            +0.0        8.12       =
     +0.5        8.55        perf-profile.calltrace.cycles-pp.entry_SYSCALL=
_64.read
>       8.55            +0.1        8.63 =C2=B1  2%      -0.1        8.48  =
          -4.1        4.42        perf-profile.calltrace.cycles-pp.__fsnoti=
fy_parent.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      58.48            -0.2       58.28            -0.4       58.04       =
     +2.9       61.37        perf-profile.children.cycles-pp.filemap_read
>      28.70            -0.2       28.50 =C2=B1  2%      +0.1       28.79  =
          +1.9       30.60        perf-profile.children.cycles-pp._copy_to_=
iter
>      30.17            -0.2       30.00 =C2=B1  2%      +0.0       30.20  =
          +1.9       32.08        perf-profile.children.cycles-pp.copy_page=
_to_iter
>      12.90            -0.1       12.76            -0.4       12.53       =
     +0.2       13.13        perf-profile.children.cycles-pp.filemap_get_pa=
ges
>      79.31            -0.1       79.21            +0.0       79.35       =
     -0.9       78.42        perf-profile.children.cycles-pp.vfs_read
>      83.27            -0.1       83.19            +0.1       83.32       =
     -0.6       82.67        perf-profile.children.cycles-pp.ksys_read
>      88.35            -0.1       88.28            -0.0       88.32       =
     -0.5       87.82        perf-profile.children.cycles-pp.entry_SYSCALL_=
64_after_hwframe
>      87.30            -0.1       87.24            -0.0       87.26       =
     -0.6       86.72        perf-profile.children.cycles-pp.do_syscall_64
>       1.40            -0.0        1.38            -0.1        1.34 =C2=B1=
  2%      -0.1        1.30        perf-profile.children.cycles-pp.syscall_r=
eturn_via_sysret
>       0.20            -0.0        0.20 =C2=B1  2%      +0.0        0.23  =
          +0.0        0.24 =C2=B1  2%  perf-profile.children.cycles-pp.foli=
o_mark_accessed
>       0.83            -0.0        0.83            +0.0        0.83       =
     +0.0        0.87        perf-profile.children.cycles-pp.aa_file_perm
>       1.22            +0.0        1.22            +0.0        1.26       =
     +0.1        1.32        perf-profile.children.cycles-pp.r_test
>      98.78            +0.0       98.78            -0.0       98.74       =
     -0.1       98.69        perf-profile.children.cycles-pp.read
>       1.62            +0.0        1.62            -0.1        1.48       =
     +0.0        1.63        perf-profile.children.cycles-pp.xas_descend
>       0.39            +0.0        0.39            +0.0        0.39       =
     +0.0        0.42        perf-profile.children.cycles-pp.make_vfsgid
>       0.54            +0.0        0.54            -0.1        0.48       =
     -0.1        0.48 =C2=B1  2%  perf-profile.children.cycles-pp.syscall_e=
xit_to_user_mode_prepare
>       0.30            +0.0        0.30 =C2=B1  2%      +0.0        0.30  =
          +0.0        0.32        perf-profile.children.cycles-pp.amd_clear=
_divider
>       0.84            +0.0        0.84 =C2=B1  2%      +0.0        0.84  =
          +0.1        0.90        perf-profile.children.cycles-pp.generic_f=
ile_read_iter
>       0.39            +0.0        0.39            +0.0        0.39       =
     +0.0        0.41        perf-profile.children.cycles-pp.make_vfsuid
>       0.33            +0.0        0.34 =C2=B1  2%      +0.0        0.33  =
          +0.0        0.35        perf-profile.children.cycles-pp.__x64_sys=
_read
>       0.92            +0.0        0.93            +0.0        0.94       =
     +0.0        0.97        perf-profile.children.cycles-pp.__cond_resched
>       0.52            +0.0        0.53 =C2=B1  3%      -0.0        0.52 =
=C2=B1  2%      +0.0        0.55        perf-profile.children.cycles-pp.kti=
me_get_coarse_real_ts64
>       1.84            +0.0        1.85            -0.1        1.76       =
     -0.0        1.79        perf-profile.children.cycles-pp.syscall_exit_t=
o_user_mode
>       0.89            +0.0        0.90 =C2=B1  4%      +0.0        0.89 =
=C2=B1  3%      +0.1        0.96        perf-profile.children.cycles-pp.xas=
_start
>       0.33            +0.0        0.34 =C2=B1  2%      +0.0        0.34 =
=C2=B1  2%      +0.0        0.37        perf-profile.children.cycles-pp.ent=
ry_SYSCALL_64_safe_stack
>       0.00            +0.0        0.02 =C2=B1141%      +0.0        0.02 =
=C2=B1141%      +0.1        0.05        perf-profile.children.cycles-pp.irq=
time_account_irq
>       3.44            +0.0        3.46 =C2=B1  2%      +0.1        3.51  =
          +0.2        3.67 =C2=B1  2%  perf-profile.children.cycles-pp.secu=
rity_file_permission
>       4.66            +0.0        4.68 =C2=B1  2%      +0.4        5.02 =
=C2=B1  2%      +0.0        4.70        perf-profile.children.cycles-pp.rw_=
verify_area
>       3.59            +0.0        3.61            -0.1        3.44       =
     +0.1        3.72        perf-profile.children.cycles-pp.xas_load
>       2.83            +0.0        2.85 =C2=B1  3%      +0.0        2.86 =
=C2=B1  2%      +0.3        3.09 =C2=B1  3%  perf-profile.children.cycles-p=
p.__fdget_pos
>       2.63            +0.0        2.65 =C2=B1  2%      +0.1        2.70 =
=C2=B1  2%      +0.2        2.83 =C2=B1  2%  perf-profile.children.cycles-p=
p.apparmor_file_permission
>       1.87            +0.0        1.89 =C2=B1  2%      -0.0        1.84  =
          +0.1        1.97        perf-profile.children.cycles-pp.current_t=
ime
>       4.66            +0.0        4.70 =C2=B1  2%      -0.0        4.65  =
          +0.2        4.89        perf-profile.children.cycles-pp.touch_ati=
me
>       4.22            +0.0        4.25 =C2=B1  2%      -0.0        4.21  =
          +0.2        4.42        perf-profile.children.cycles-pp.atime_nee=
ds_update
>       4.69            +0.0        4.72            +0.0        4.70       =
     +0.3        4.94        perf-profile.children.cycles-pp.entry_SYSCALL_=
64
>       3.59            +0.0        3.63            +0.0        3.62       =
     +0.2        3.79        perf-profile.children.cycles-pp.entry_SYSRETQ_=
unsafe_stack
>       8.77            +0.1        8.84 =C2=B1  2%      -0.1        8.69  =
          -4.2        4.53        perf-profile.children.cycles-pp.__fsnotif=
y_parent
>      28.41            -0.2       28.23 =C2=B1  2%      +0.1       28.52  =
          +1.9       30.30        perf-profile.self.cycles-pp._copy_to_iter
>       1.40            -0.0        1.38            -0.1        1.34 =C2=B1=
  2%      -0.1        1.30        perf-profile.self.cycles-pp.syscall_retur=
n_via_sysret
>       0.17            -0.0        0.16 =C2=B1  2%      +0.0        0.21 =
=C2=B1  2%      +0.0        0.21        perf-profile.self.cycles-pp.folio_m=
ark_accessed
>       1.76            -0.0        1.76 =C2=B1  2%      +0.0        1.76  =
          +0.1        1.81        perf-profile.self.cycles-pp.atime_needs_u=
pdate
>       0.71            -0.0        0.71            +0.0        0.71       =
     +0.0        0.74        perf-profile.self.cycles-pp.aa_file_perm
>       2.35            -0.0        2.35            -0.0        2.31       =
     +0.1        2.43        perf-profile.self.cycles-pp.filemap_get_pages
>       1.13            -0.0        1.13            +0.0        1.14       =
     +0.1        1.19        perf-profile.self.cycles-pp.entry_SYSCALL_64_a=
fter_hwframe
>       1.10            -0.0        1.09            +0.0        1.13       =
     +0.1        1.19        perf-profile.self.cycles-pp.r_test
>       0.20            -0.0        0.20 =C2=B1  2%      -0.0        0.20  =
          +0.0        0.21        perf-profile.self.cycles-pp.amd_clear_div=
ider
>       0.44            +0.0        0.44 =C2=B1  2%      -0.1        0.38  =
          -0.1        0.38 =C2=B1  2%  perf-profile.self.cycles-pp.syscall_=
exit_to_user_mode_prepare
>       1.32            +0.0        1.32            -0.0        1.30       =
     +0.0        1.37        perf-profile.self.cycles-pp.ksys_read
>       0.89            +0.0        0.89            +0.0        0.90       =
     +0.0        0.94        perf-profile.self.cycles-pp.security_file_perm=
ission
>       1.22            +0.0        1.22 =C2=B1  3%      +0.3        1.51 =
=C2=B1  8%      -0.2        1.03        perf-profile.self.cycles-pp.rw_veri=
fy_area
>       0.29            +0.0        0.29 =C2=B1  2%      +0.0        0.30  =
          +0.0        0.30        perf-profile.self.cycles-pp.make_vfsuid
>       0.29            +0.0        0.29 =C2=B1  2%      +0.0        0.30  =
          +0.0        0.31        perf-profile.self.cycles-pp.make_vfsgid
>       0.43            +0.0        0.43            +0.0        0.43       =
     +0.0        0.46        perf-profile.self.cycles-pp.touch_atime
>       2.06            +0.0        2.06 =C2=B1  2%      -0.0        2.05  =
          +0.1        2.12        perf-profile.self.cycles-pp.do_syscall_64
>       1.20            +0.0        1.20            -0.0        1.17       =
     +0.0        1.23        perf-profile.self.cycles-pp.xas_load
>       1.39            +0.0        1.40            -0.1        1.27       =
     +0.0        1.41        perf-profile.self.cycles-pp.xas_descend
>       0.73            +0.0        0.74 =C2=B1  2%      +0.0        0.73  =
          +0.1        0.78        perf-profile.self.cycles-pp.generic_file_=
read_iter
>       0.54            +0.0        0.55 =C2=B1  2%      +0.0        0.56  =
          +0.0        0.59        perf-profile.self.cycles-pp.__cond_resche=
d
>       1.27            +0.0        1.27 =C2=B1  2%      +0.0        1.27  =
          +0.1        1.32        perf-profile.self.cycles-pp.entry_SYSCALL=
_64
>       0.78            +0.0        0.79 =C2=B1  5%      +0.0        0.78 =
=C2=B1  3%      +0.1        0.86        perf-profile.self.cycles-pp.xas_sta=
rt
>       0.42 =C2=B1  2%      +0.0        0.43 =C2=B1  3%      -0.0        0=
.42 =C2=B1  2%      +0.0        0.45 =C2=B1  2%  perf-profile.self.cycles-p=
p.ktime_get_coarse_real_ts64
>       1.00            +0.0        1.00            -0.0        0.97       =
     -0.0        0.99        perf-profile.self.cycles-pp.syscall_exit_to_us=
er_mode
>       0.32            +0.0        0.34 =C2=B1  2%      +0.0        0.33 =
=C2=B1  2%      +0.0        0.36 =C2=B1  2%  perf-profile.self.cycles-pp.en=
try_SYSCALL_64_safe_stack
>       6.81            +0.0        6.83            +0.2        7.02       =
     +0.3        7.06        perf-profile.self.cycles-pp.vfs_read
>       1.46            +0.0        1.48            -0.1        1.40       =
     +0.0        1.48        perf-profile.self.cycles-pp.copy_page_to_iter
>       2.72            +0.0        2.74 =C2=B1  3%      +0.0        2.74 =
=C2=B1  2%      +0.2        2.97 =C2=B1  3%  perf-profile.self.cycles-pp.__=
fdget_pos
>       1.34            +0.0        1.36            -0.0        1.32       =
     +0.1        1.41        perf-profile.self.cycles-pp.current_time
>       1.72            +0.0        1.74 =C2=B1  3%      +0.1        1.78 =
=C2=B1  3%      +0.1        1.86 =C2=B1  3%  perf-profile.self.cycles-pp.ap=
parmor_file_permission
>       3.45            +0.0        3.49            +0.0        3.48       =
     +0.2        3.65        perf-profile.self.cycles-pp.entry_SYSRETQ_unsa=
fe_stack
>       3.91            +0.0        3.95            +0.0        3.93       =
     +0.2        4.15        perf-profile.self.cycles-pp.read
>       8.51            +0.1        8.58 =C2=B1  2%      -0.1        8.43  =
          -4.1        4.40        perf-profile.self.cycles-pp.__fsnotify_pa=
rent
>       9.90            +0.1        9.98            -0.1        9.76       =
     +0.4       10.33        perf-profile.self.cycles-pp.filemap_read
>
>
> [2]
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
>   14c141dab0a87 ("Merge remote-tracking branch 'jack/fsnotify' into next"=
)
>   20e86594ebade fsnotify: use an enum for group priority constants
>   939c683684560 ("fsnotify: optimize the case of no permission event watc=
hers")
>
> 14c141dab0a87876 20e86594ebade045d589ef3ea7c 939c6836845602989da2043b956
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>       1679            -1.9%       1647            +3.3%       1734       =
 time.user_time
>  1.338e+08            -0.2%  1.336e+08            +5.2%  1.408e+08       =
 unixbench.throughput
>       1679            -1.9%       1647            +3.3%       1734       =
 unixbench.time.user_time
>  5.759e+10            -0.2%  5.748e+10            +5.2%  6.058e+10       =
 unixbench.workload
>       3.30            -0.5%       3.28            +5.0%       3.46       =
 perf-stat.i.MPKI
>   2.64e+10            +0.6%  2.656e+10            +1.8%  2.687e+10       =
 perf-stat.i.branch-instructions
>   28834151           +13.4%   32709153            +4.7%   30184061       =
 perf-stat.i.branch-misses
>  5.195e+08            -0.0%  5.194e+08            +6.1%  5.509e+08       =
 perf-stat.i.cache-misses
>  1.661e+09            -0.2%  1.657e+09            +4.8%   1.74e+09       =
 perf-stat.i.cache-references
>       3.70            -0.3%       3.69            +6.0%       3.93       =
 perf-stat.overall.MPKI
>       0.11            +0.0        0.12            +0.0        0.11       =
 perf-stat.overall.branch-miss-rate%
>      31.27            +0.1       31.34            +0.4       31.66       =
 perf-stat.overall.cache-miss-rate%
>     302.77            +0.1%     302.95            -6.1%     284.34       =
 perf-stat.overall.cycles-between-cache-misses
>       1049            +0.4%       1054            -4.9%     998.18       =
 perf-stat.overall.path-length
>  2.637e+10            +0.6%  2.653e+10            +1.8%  2.684e+10       =
 perf-stat.ps.branch-instructions
>   28794853           +13.4%   32654626            +4.7%   30143924       =
 perf-stat.ps.branch-misses
>  5.189e+08            -0.0%  5.188e+08            +6.1%  5.504e+08       =
 perf-stat.ps.cache-misses
>  1.659e+09            -0.2%  1.656e+09            +4.8%  1.739e+09       =
 perf-stat.ps.cache-references
>      57.94            -0.5       57.41            +2.5       60.39       =
 perf-profile.calltrace.cycles-pp.filemap_read.vfs_read.ksys_read.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
>      12.70            -0.4       12.28            +0.2       12.93       =
 perf-profile.calltrace.cycles-pp.filemap_get_pages.filemap_read.vfs_read.k=
sys_read.do_syscall_64
>      10.23            -0.3        9.89            +0.1       10.36       =
 perf-profile.calltrace.cycles-pp.filemap_get_read_batch.filemap_get_pages.=
filemap_read.vfs_read.ksys_read
>      29.95            -0.1       29.80            +1.4       31.37       =
 perf-profile.calltrace.cycles-pp.copy_page_to_iter.filemap_read.vfs_read.k=
sys_read.do_syscall_64
>      28.59            -0.1       28.46            +1.4       30.00       =
 perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.filemap_r=
ead.vfs_read.ksys_read
>       8.55            -0.1        8.42            -4.1        4.45       =
 perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_read.ksys_read.do_s=
yscall_64.entry_SYSCALL_64_after_hwframe
>       1.26            -0.1        1.17 =C2=B1  2%      -0.0        1.23 =
=C2=B1  3%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.read
>       1.53            -0.1        1.44            -0.0        1.51       =
 perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.e=
ntry_SYSCALL_64_after_hwframe.read
>      98.50            -0.1       98.45            -0.1       98.37       =
 perf-profile.calltrace.cycles-pp.read
>       1.41            -0.0        1.36            +0.0        1.43       =
 perf-profile.calltrace.cycles-pp.xas_descend.xas_load.filemap_get_read_bat=
ch.filemap_get_pages.filemap_read
>       3.18            -0.0        3.17            +0.1        3.31       =
 perf-profile.calltrace.cycles-pp.xas_load.filemap_get_read_batch.filemap_g=
et_pages.filemap_read.vfs_read
>       0.73            -0.0        0.73            +0.0        0.77 =C2=B1=
  2%  perf-profile.calltrace.cycles-pp.aa_file_perm.apparmor_file_permissio=
n.security_file_permission.rw_verify_area.vfs_read
>       0.74            +0.0        0.74 =C2=B1  2%      +0.0        0.79  =
      perf-profile.calltrace.cycles-pp.generic_file_read_iter.vfs_read.ksys=
_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       4.47            +0.0        4.49            +0.3        4.75       =
 perf-profile.calltrace.cycles-pp.touch_atime.filemap_read.vfs_read.ksys_re=
ad.do_syscall_64
>       3.84            +0.0        3.86            +0.2        4.07       =
 perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.filemap_re=
ad.vfs_read.ksys_read
>       8.09            +0.0        8.11            +0.5        8.58       =
 perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.read
>      86.80            +0.0       86.82            -0.7       86.08       =
 perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.read
>       1.67            +0.0        1.70 =C2=B1  2%      +0.1        1.78  =
      perf-profile.calltrace.cycles-pp.current_time.atime_needs_update.touc=
h_atime.filemap_read.vfs_read
>      88.16            +0.0       88.19            -0.6       87.52       =
 perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
>       2.74            +0.0        2.77 =C2=B1  2%      +0.2        2.97  =
      perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.=
entry_SYSCALL_64_after_hwframe.read
>       0.80            +0.0        0.84            +0.1        0.88       =
 perf-profile.calltrace.cycles-pp.r_test
>       0.79            +0.0        0.82 =C2=B1  3%      +0.1        0.84 =
=C2=B1  3%  perf-profile.calltrace.cycles-pp.xas_start.xas_load.filemap_get=
_read_batch.filemap_get_pages.filemap_read
>      78.91            +0.1       79.04            -1.1       77.84       =
 perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SY=
SCALL_64_after_hwframe.read
>       3.15            +0.1        3.29            +0.2        3.30       =
 perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.v=
fs_read.ksys_read.do_syscall_64
>       2.42            +0.1        2.56            +0.1        2.54       =
 perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_pe=
rmission.rw_verify_area.vfs_read.ksys_read
>      82.87            +0.2       83.02            -0.8       82.09       =
 perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_=
after_hwframe.read
>       4.47            +0.5        4.93 =C2=B1  2%      +0.0        4.51  =
      perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_read.ksys_read.do=
_syscall_64.entry_SYSCALL_64_after_hwframe
>      58.48            -0.5       57.95            +2.5       60.95       =
 perf-profile.children.cycles-pp.filemap_read
>      12.90            -0.4       12.48            +0.2       13.14       =
 perf-profile.children.cycles-pp.filemap_get_pages
>      10.53            -0.3       10.19            +0.2       10.68       =
 perf-profile.children.cycles-pp.filemap_get_read_batch
>      30.17            -0.1       30.02            +1.4       31.60       =
 perf-profile.children.cycles-pp.copy_page_to_iter
>       8.77            -0.1        8.63            -4.2        4.56       =
 perf-profile.children.cycles-pp.__fsnotify_parent
>      28.70            -0.1       28.57            +1.4       30.12       =
 perf-profile.children.cycles-pp._copy_to_iter
>       1.40            -0.1        1.31 =C2=B1  2%      -0.0        1.38 =
=C2=B1  3%  perf-profile.children.cycles-pp.syscall_return_via_sysret
>       1.84            -0.1        1.74            -0.0        1.83       =
 perf-profile.children.cycles-pp.syscall_exit_to_user_mode
>       0.54            -0.1        0.48 =C2=B1  3%      -0.0        0.51 =
=C2=B1  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepa=
re
>       1.62            -0.1        1.57            +0.0        1.64       =
 perf-profile.children.cycles-pp.xas_descend
>      98.78            -0.0       98.75            -0.1       98.68       =
 perf-profile.children.cycles-pp.read
>       3.59            -0.0        3.58            +0.1        3.74       =
 perf-profile.children.cycles-pp.xas_load
>       0.83            -0.0        0.82            +0.0        0.87       =
 perf-profile.children.cycles-pp.aa_file_perm
>       3.59            -0.0        3.59            +0.2        3.81       =
 perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.39            +0.0        0.39            +0.0        0.41       =
 perf-profile.children.cycles-pp.make_vfsuid
>       0.39            +0.0        0.39            +0.0        0.42       =
 perf-profile.children.cycles-pp.make_vfsgid
>       0.84            +0.0        0.84 =C2=B1  2%      +0.1        0.89  =
      perf-profile.children.cycles-pp.generic_file_read_iter
>       0.33            +0.0        0.33            +0.0        0.35       =
 perf-profile.children.cycles-pp.__x64_sys_read
>       4.69            +0.0        4.69            +0.3        4.96       =
 perf-profile.children.cycles-pp.entry_SYSCALL_64
>       0.92            +0.0        0.93            +0.0        0.96       =
 perf-profile.children.cycles-pp.__cond_resched
>       0.33            +0.0        0.34            +0.0        0.36       =
 perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
>       0.52            +0.0        0.54 =C2=B1  4%      +0.0        0.56 =
=C2=B1  3%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
>       4.22            +0.0        4.24            +0.3        4.48       =
 perf-profile.children.cycles-pp.atime_needs_update
>       4.66            +0.0        4.69            +0.3        4.96       =
 perf-profile.children.cycles-pp.touch_atime
>       1.87            +0.0        1.90            +0.1        1.99       =
 perf-profile.children.cycles-pp.current_time
>      87.30            +0.0       87.34            -0.7       86.61       =
 perf-profile.children.cycles-pp.do_syscall_64
>       2.83            +0.0        2.86 =C2=B1  2%      +0.2        3.07  =
      perf-profile.children.cycles-pp.__fdget_pos
>      88.35            +0.0       88.38            -0.6       87.72       =
 perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
>       1.22            +0.0        1.26            +0.1        1.33       =
 perf-profile.children.cycles-pp.r_test
>       0.89            +0.0        0.93 =C2=B1  2%      +0.1        0.95 =
=C2=B1  3%  perf-profile.children.cycles-pp.xas_start
>       0.20            +0.0        0.24 =C2=B1  2%      +0.0        0.24  =
      perf-profile.children.cycles-pp.folio_mark_accessed
>      79.31            +0.1       79.45            -1.1       78.26       =
 perf-profile.children.cycles-pp.vfs_read
>       3.44            +0.1        3.57            +0.2        3.61       =
 perf-profile.children.cycles-pp.security_file_permission
>       2.63            +0.1        2.77            +0.1        2.76       =
 perf-profile.children.cycles-pp.apparmor_file_permission
>      83.27            +0.1       83.42            -0.8       82.50       =
 perf-profile.children.cycles-pp.ksys_read
>       4.66            +0.5        5.13 =C2=B1  2%      +0.1        4.71  =
      perf-profile.children.cycles-pp.rw_verify_area
>       8.51            -0.1        8.37            -4.1        4.43       =
 perf-profile.self.cycles-pp.__fsnotify_parent
>      28.41            -0.1       28.29            +1.4       29.82       =
 perf-profile.self.cycles-pp._copy_to_iter
>       1.40            -0.1        1.30 =C2=B1  2%      -0.0        1.37 =
=C2=B1  3%  perf-profile.self.cycles-pp.syscall_return_via_sysret
>       2.35            -0.1        2.28            +0.1        2.45       =
 perf-profile.self.cycles-pp.filemap_get_pages
>       0.44            -0.1        0.38 =C2=B1  3%      -0.0        0.40 =
=C2=B1  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
>       9.90            -0.0        9.85            +0.4       10.34       =
 perf-profile.self.cycles-pp.filemap_read
>       1.00            -0.0        0.96            +0.0        1.00       =
 perf-profile.self.cycles-pp.syscall_exit_to_user_mode
>       1.39            -0.0        1.36            +0.0        1.42       =
 perf-profile.self.cycles-pp.xas_descend
>       1.32            -0.0        1.30            +0.1        1.38       =
 perf-profile.self.cycles-pp.ksys_read
>       2.06            -0.0        2.04            +0.1        2.14       =
 perf-profile.self.cycles-pp.do_syscall_64
>       1.20            -0.0        1.18            +0.1        1.25       =
 perf-profile.self.cycles-pp.xas_load
>       1.76            -0.0        1.75            +0.1        1.85       =
 perf-profile.self.cycles-pp.atime_needs_update
>       0.89            -0.0        0.89            +0.0        0.94       =
 perf-profile.self.cycles-pp.security_file_permission
>       1.27            -0.0        1.26            +0.1        1.33       =
 perf-profile.self.cycles-pp.entry_SYSCALL_64
>       0.29            -0.0        0.29            +0.0        0.31       =
 perf-profile.self.cycles-pp.make_vfsuid
>       0.29            +0.0        0.29 =C2=B1  2%      +0.0        0.31  =
      perf-profile.self.cycles-pp.make_vfsgid
>       1.13            +0.0        1.14            +0.1        1.20       =
 perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
>       3.45            +0.0        3.46            +0.2        3.66       =
 perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.73            +0.0        0.74 =C2=B1  2%      +0.0        0.78  =
      perf-profile.self.cycles-pp.generic_file_read_iter
>       0.43            +0.0        0.43 =C2=B1  2%      +0.0        0.46 =
=C2=B1  2%  perf-profile.self.cycles-pp.touch_atime
>       0.32            +0.0        0.34            +0.0        0.36 =C2=B1=
  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
>       0.54            +0.0        0.56            +0.0        0.58       =
 perf-profile.self.cycles-pp.__cond_resched
>       1.34            +0.0        1.35            +0.1        1.42       =
 perf-profile.self.cycles-pp.current_time
>       0.42 =C2=B1  2%      +0.0        0.44 =C2=B1  5%      +0.0        0=
.46 =C2=B1  4%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
>       3.91            +0.0        3.93            +0.2        4.16       =
 perf-profile.self.cycles-pp.read
>       2.72            +0.0        2.75 =C2=B1  2%      +0.2        2.94  =
      perf-profile.self.cycles-pp.__fdget_pos
>       1.10            +0.0        1.13            +0.1        1.20       =
 perf-profile.self.cycles-pp.r_test
>       0.78            +0.0        0.82 =C2=B1  3%      +0.1        0.84 =
=C2=B1  3%  perf-profile.self.cycles-pp.xas_start
>       0.17            +0.0        0.22            +0.0        0.22 =C2=B1=
  2%  perf-profile.self.cycles-pp.folio_mark_accessed
>       1.72            +0.1        1.86 =C2=B1  2%      +0.1        1.80  =
      perf-profile.self.cycles-pp.apparmor_file_permission
>       1.22            +0.3        1.54 =C2=B1  9%      -0.1        1.10 =
=C2=B1  4%  perf-profile.self.cycles-pp.rw_verify_area
>       6.81            +0.3        7.15            +0.5        7.30       =
 perf-profile.self.cycles-pp.vfs_read
