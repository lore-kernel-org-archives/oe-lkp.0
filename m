Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05180142E92
	for <oe-lkp@lists.linux.dev>; Mon,  8 Jul 2024 16:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720456644; cv=none; b=sIMHDdRFxZjp9g33gnZa2oFF9r3WUakLACz1ubTF/8+P/m89xxUl49OnUXoEkqbPcrorLEeDClQC/hRWEU6nR1j86d3YgyT0RiMOcSCJ04FThOfcF56BSNWJGOyNAUyrVkRT7/1v3se3XHEZxkjdK2LR1GlaqVue+BwGRqL22gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720456644; c=relaxed/simple;
	bh=g53+/XrXdP2ORHcDD3bqaNH4/bIqUY7dMe74f3PxL7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqr9q/jENno6KuWlsyIt7f9W1qPmJIi3fY2pz6/gvetQMGNTISKR3MZyOeqoDOQDYaY7NOPM5LBBjeMXvrZ3Rv0b455FfGd5s9XLIYVKMqgX1wySJwX9b/qHpe+cz+bG5srBQDryHkqq8/L6x4q3maCScb8+ta/O+ta4WIVhHH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKci3QsX; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKci3QsX"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-79ef7635818so214398085a.3
        for <oe-lkp@lists.linux.dev>; Mon, 08 Jul 2024 09:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720456641; x=1721061441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LnQizbgfcSsyibuOMawMUMjXR5B/JMNejywHgjBqtU=;
        b=SKci3QsXiiq/rnRe9ijun/+Bbl3rQbkeFxy0/DFgQpzIs5V/fTSSVYns58buZNxHL0
         ZcJQG6LwiUgoKrNnlf62q8MXzlfdfGR8DKdABL1NREV2+YbYOWwwGLsfIj5y/grh8lOt
         lrAkRwqhEReLOT8zi6R/39wzFbMyP8Bsv9x/2jBNNAtnjDfqtkDxr+6zge7W6cXhCDYn
         SFO0gQjVP8w7QFoWZLJU60I1i6h3jL94hmWgTyf2t2FTrNC9K35fD3iOe0XgEdZr9pdc
         IFFf1dmywUSHP9lNriH+EBYEJ1ybmRlSN1Gaat82/sMD6FnvmJaI/jry+NtBtp/Ble2G
         7a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720456641; x=1721061441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LnQizbgfcSsyibuOMawMUMjXR5B/JMNejywHgjBqtU=;
        b=rChawKSISLgcchW6gbYcI+24Zhr337LxmurN0fid7vLWB0NPAfPy74atwhQkHnhEA6
         lhP+yw5weEkHtUFGRkUg8AF7M51zemxhABdS+OnU1MJbPmKefN8zpgKXn9I2dpr4MI2H
         hXRCg0YTyQ8+KSkUOx0d0CCrh8tzcCGk8xtP8MbUFidt5suBPzrud2S1fM/KRq/czMAS
         0a0T0WQ0q1GyQ+Z2nwbD0Cd16rxJ8ScaopOulAbGeo1RF9X59ifvX2kf7XSPy4NAO/z6
         eXRQtLKRhZZ4QDajs6MiVu6UDDEiwcEajWq24BEV0SoSV3LL09D1TRslwQsOJ8bxmgqP
         2H3w==
X-Forwarded-Encrypted: i=1; AJvYcCWAJ5WwqXm1MMjIOzwc0Txluw2xSiPD/i8dNDIePhjkSZUri5NntsS1BY9oDqaary0F+hLBoQuQM01BnDuofyRbGs1wAYn0
X-Gm-Message-State: AOJu0YwMWMQJhaEBSYXnqlTfGLYbb+rNC0482HJ9Xf70YaYHrsnDUdtx
	c33z0e//dwWWc6Og9DOjNhEIztCDGnbjaadFBCzZP5Y1FtKlKLUVHcS9BrKR0tyvB3SmUHMA37X
	cg0j/61TtZdr+QGzPMkATUc8+Fm8=
X-Google-Smtp-Source: AGHT+IH/zICPLiG58h16my6iGXNC2z0fw2dyaUbrAKPs2tNg5y8uAFDsOC7ZPYHN1Ybsxyz7H64O/AY/U8RbpW/ebTo=
X-Received: by 2002:a05:620a:2955:b0:79f:1002:f29b with SMTP id
 af79cd13be357-79f19bfb3cfmr3807085a.65.1720456640627; Mon, 08 Jul 2024
 09:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZllA260+kaBSKrPD@xsang-OptiPlex-9020> <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020> <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
 <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020> <CAOQ4uxhsdiR_CtYxu4FchWVCO6OpzkdtQksJrzsehhXeG2gp1w@mail.gmail.com>
 <ZoT78AZAoscvNZTv@xsang-OptiPlex-9020> <CAOQ4uxgk1mGf20=XVkJ6x-YTPaoww6d=v-ViD4Espu7EE+yQcg@mail.gmail.com>
 <ZodVyZd2esYH/tFu@xsang-OptiPlex-9020> <CAOQ4uxitXLvHgug08zbYRgyy+wNnd_aw8Kr1zcFWwsRLeFf7SA@mail.gmail.com>
 <Zot7v3RACCb1T0gh@xsang-OptiPlex-9020>
In-Reply-To: <Zot7v3RACCb1T0gh@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 8 Jul 2024 19:37:09 +0300
Message-ID: <CAOQ4uxgTcjR_X60tst3RaVYoDDsthX5R0H=4Y5HYqp1rrX_C8A@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 8:40=E2=80=AFAM Oliver Sang <oliver.sang@intel.com> =
wrote:
>
> hi, Amir,
>
> On Fri, Jul 05, 2024 at 08:48:28AM +0300, Amir Goldstein wrote:
>
> [...]
>
> >
> > Thanks.
> > That clarifies that the cycles are spent in the "optimization code" its=
elf.
> >
> > I pushed a new version to the fsnotify_for_lkp branch with a possible f=
ix commit
> > at the base of the branch.
> >
> > Hopefully, with this fix, the compiler will be able to optimize smarter=
 and
> > the generated fast path code will be less sensitive to code alignment ?=
??
> >
> > If it works, it may eliminate some of the regressions throughout this b=
ranch and
> > may also improve the stress-ng regression that you reported on v6.10-rc=
1 [1].
> >
> > * e0aaae806edc - (fsnotify_for_lkp) fanotify: report file range info
> > with pre-content events
> > * a28c32866bb3 - fanotify: rename a misnamed constant
> > * 61baabbdceaa - fanotify: pass optional file access range in pre-conte=
nt event
> > * 72e76d909afd - fanotify: introduce FAN_PRE_MODIFY permission event
> > * 1c71a12ff3ce - fanotify: introduce FAN_PRE_ACCESS permission event
> > * 38a903de931a - fsnotify: generate pre-content permission event on exe=
c
> > * 70be29706389 - fsnotify: generate pre-content permission event on ope=
n
> > * 96768b7d6721 - fsnotify: introduce pre-content permission event
> > * 28d5b4a88241 - fsnotify: avoid multiple fsnotify_sb_info() access in
> > permission hooks
> >
> > Fingers crossed...
>
> unfortunately, seems no luck. I combine the results with 96768b7d6721 and=
 its
> parent since 96768b7d6721 introduces most regression.
>

Too bad.

I will need to have a think.

Thank you for testing!

Amir.

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
>   28d5b4a88241d fsnotify: avoid multiple fsnotify_sb_info() access in per=
mission hooks
>   96768b7d67219 fsnotify: introduce pre-content permission event
>   e0aaae806edc3 (amir73il/fsnotify_for_lkp) fanotify: report file range i=
nfo with pre-content events
>
>        v6.10-rc1 28d5b4a88241d36788173a41211 96768b7d672192594d54b474077 =
e0aaae806edc3411d84dc0d66fe
> ---------------- --------------------------- --------------------------- =
---------------------------
>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev
>              \          |                \          |                \   =
       |                \
>  1.218e+08            -0.3%  1.214e+08            -7.6%  1.125e+08       =
     -6.4%   1.14e+08        unixbench.throughput
>
> detail is as below [2]
>
>
> >
> > Thanks,
> > Amir.
> >
> > [1] https://lore.kernel.org/all/202404101624.85684be8-oliver.sang@intel=
.com/
>
> for this report, I also retest on new branch. seems the regression reduce=
d to
> around 10%, but we cannot get stable data on this new branch, so we canno=
t say
> if it really becomes better now.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testc=
ase/testtime:
>   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/l=
kp-icl-2sp8/full/stress-ng/60s
>
> commit:
>   v6.10-rc1
>   e0aaae806edc3 (amir73il/fsnotify_for_lkp) fanotify: report file range i=
nfo with pre-content events
>
>        v6.10-rc1 e0aaae806edc3411d84dc0d66fe
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>  1.161e+08 =C4=85  5%      -9.5%   1.05e+08 =C4=85 10%  stress-ng.full.op=
s
>    1934587 =C4=85  5%      -9.5%    1750464 =C4=85 10%  stress-ng.full.op=
s_per_sec
>
>
>
> [2]
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
>   28d5b4a88241d fsnotify: avoid multiple fsnotify_sb_info() access in per=
mission hooks
>   96768b7d67219 fsnotify: introduce pre-content permission event
>   e0aaae806edc3 (amir73il/fsnotify_for_lkp) fanotify: report file range i=
nfo with pre-content events
>
>        v6.10-rc1 28d5b4a88241d36788173a41211 96768b7d672192594d54b474077 =
e0aaae806edc3411d84dc0d66fe
> ---------------- --------------------------- --------------------------- =
---------------------------
>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev
>              \          |                \          |                \   =
       |                \
>       6215            +0.1%       6223            -8.9%       5661       =
     -7.9%       5724        time.user_time
>       0.58            -0.0        0.54 =C4=85 18%      -0.1        0.52  =
          -0.0        0.55 =C4=85 11%  mpstat.cpu.all.irq%
>       0.01 =C4=85  4%      -0.0        0.01 =C4=85 13%      -0.0        0=
.00 =C4=85  2%      -0.0        0.01 =C4=85  6%  mpstat.cpu.all.soft%
>       7.59 =C4=85 59%     -58.7%       3.14 =C4=85 63%     -61.7%       2=
.90 =C4=85 52%     -33.4%       5.06 =C4=85 50%  sched_debug.cfs_rq:/.util_=
est.min
>       0.00 =C4=85 72%    -148.0%      -0.00           -50.9%       0.00 =
=C4=85244%     +12.3%       0.00 =C4=85102%  sched_debug.cpu.nr_uninterrupt=
ible.avg
>  1.218e+08            -0.3%  1.214e+08            -7.6%  1.125e+08       =
     -6.4%   1.14e+08        unixbench.throughput
>       6215            +0.1%       6223            -8.9%       5661       =
     -7.9%       5724        unixbench.time.user_time
>  4.521e+10            -0.3%  4.506e+10            -7.7%  4.172e+10       =
     -6.4%  4.231e+10        unixbench.workload
>  1.458e+11            -7.5%   1.35e+11 =C4=85 18%      -6.8%  1.359e+11  =
          -9.5%   1.32e+11 =C4=85 11%  perf-stat.i.branch-instructions
>    3742171 =C4=85  4%     -16.8%    3112873 =C4=85 20%     +80.4%    6752=
235 =C4=85  7%    +403.3%   18836125 =C4=85 14%  perf-stat.i.cache-misses
>   32402657 =C4=85  3%     -19.5%   26094697 =C4=85 16%     +77.8%   57627=
688 =C4=85  4%    +356.5%  1.479e+08 =C4=85 11%  perf-stat.i.cache-referenc=
es
>       0.95            +9.8%       1.04 =C4=85 20%      +5.8%       1.00 =
=C4=85  2%      +9.3%       1.03 =C4=85 13%  perf-stat.i.cpi
>     161794 =C4=85  8%      -2.2%     158309 =C4=85 20%     -49.9%      81=
139 =C4=85 15%     -77.3%      36784 =C4=85 54%  perf-stat.i.cycles-between=
-cache-misses
>  6.963e+11            -7.4%  6.445e+11 =C4=85 18%      -6.5%  6.513e+11  =
          -8.8%  6.353e+11 =C4=85 11%  perf-stat.i.instructions
>       1.22            -4.7%       1.16 =C4=85 10%      -6.3%       1.14  =
          -6.5%       1.14 =C4=85  6%  perf-stat.i.ipc
>       0.01 =C4=85  4%     -10.3%       0.00 =C4=85  6%     +92.9%       0=
.01 =C4=85  7%    +453.4%       0.03 =C4=85 14%  perf-stat.overall.MPKI
>       0.75            +0.0%       0.75            +6.8%       0.80       =
     +4.3%       0.78        perf-stat.overall.cpi
>     139258 =C4=85  4%     +11.8%     155626 =C4=85  6%     -44.5%      77=
325 =C4=85  7%     -80.8%      26737 =C4=85 14%  perf-stat.overall.cycles-b=
etween-cache-misses
>       1.33            -0.0%       1.33            -6.3%       1.25       =
     -4.1%       1.28        perf-stat.overall.ipc
>       5722            +0.3%       5738            +1.6%       5811       =
     +2.6%       5869        perf-stat.overall.path-length
>  1.452e+11            -7.4%  1.343e+11 =C4=85 18%      -6.8%  1.352e+11  =
          -9.5%  1.314e+11 =C4=85 11%  perf-stat.ps.branch-instructions
>    3742620 =C4=85  4%     -16.7%    3117570 =C4=85 20%     +80.4%    6752=
430 =C4=85  7%    +401.2%   18758290 =C4=85 14%  perf-stat.ps.cache-misses
>   32374621 =C4=85  3%     -19.4%   26088859 =C4=85 16%     +77.6%   57486=
380 =C4=85  4%    +354.8%  1.473e+08 =C4=85 11%  perf-stat.ps.cache-referen=
ces
>   6.93e+11            -7.4%  6.415e+11 =C4=85 18%      -6.5%  6.481e+11  =
          -8.8%  6.323e+11 =C4=85 11%  perf-stat.ps.instructions
>  2.587e+14            -0.0%  2.586e+14            -6.3%  2.425e+14       =
     -4.0%  2.484e+14        perf-stat.total.instructions
>       2.85            -0.2        2.62            -0.3        2.55 =C4=85=
  3%      +0.0        2.86        perf-profile.calltrace.cycles-pp.down_wri=
te.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
>       5.99            -0.1        5.86            +0.1        6.09       =
     +1.1        7.10        perf-profile.calltrace.cycles-pp.filemap_get_e=
ntry.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_f=
ile_write_iter
>      12.29            -0.1       12.16            -0.3       11.97       =
     +0.8       13.04        perf-profile.calltrace.cycles-pp.__filemap_get=
_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs=
_write
>      13.39            -0.1       13.28            -0.4       12.96       =
     +0.7       14.12        perf-profile.calltrace.cycles-pp.simple_write_=
begin.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
>      13.18            -0.1       13.08            -0.9       12.24       =
     -1.0       12.21        perf-profile.calltrace.cycles-pp.entry_SYSCALL=
_64.write
>       1.98 =C4=85  5%      -0.1        1.88            -0.0        1.96 =
=C4=85  3%      +0.2        2.20        perf-profile.calltrace.cycles-pp.ge=
neric_write_checks.generic_file_write_iter.vfs_write.ksys_write.do_syscall_=
64
>       3.27 =C4=85  4%      -0.1        3.20            +4.7        7.99 =
=C4=85  6%      -0.1        3.21        perf-profile.calltrace.cycles-pp.se=
curity_file_permission.rw_verify_area.vfs_write.ksys_write.do_syscall_64
>       2.42 =C4=85  6%      -0.1        2.37            +4.7        7.16 =
=C4=85  7%      -0.1        2.28        perf-profile.calltrace.cycles-pp.ap=
parmor_file_permission.security_file_permission.rw_verify_area.vfs_write.ks=
ys_write
>       3.72            -0.1        3.67            -0.4        3.37       =
     +0.1        3.81        perf-profile.calltrace.cycles-pp.__fsnotify_pa=
rent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      58.06            -0.0       58.01            -2.5       55.53       =
     +0.7       58.76        perf-profile.calltrace.cycles-pp.generic_file_=
write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e
>      74.32            -0.0       74.28            +1.8       76.16       =
     +1.4       75.67        perf-profile.calltrace.cycles-pp.vfs_write.ksy=
s_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       0.90 =C4=85  5%      -0.0        0.87            -0.0        0.87 =
=C4=85  3%      +0.1        1.00        perf-profile.calltrace.cycles-pp.ge=
neric_write_check_limits.generic_write_checks.generic_file_write_iter.vfs_w=
rite.ksys_write
>       0.70            -0.0        0.66            -0.0        0.68       =
     -0.0        0.68        perf-profile.calltrace.cycles-pp.__cond_resche=
d.down_write.generic_file_write_iter.vfs_write.ksys_write
>       5.30            -0.0        5.27            -0.2        5.06       =
     -0.1        5.25        perf-profile.calltrace.cycles-pp.simple_write_=
end.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
>       1.11            -0.0        1.08            -0.1        0.97       =
     -0.2        0.94        perf-profile.calltrace.cycles-pp.syscall_retur=
n_via_sysret.write
>       1.81            -0.0        1.80            -0.1        1.72       =
     -0.1        1.76        perf-profile.calltrace.cycles-pp.folio_unlock.=
simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
>       1.62            -0.0        1.62            -0.1        1.49       =
     -0.1        1.52        perf-profile.calltrace.cycles-pp.syscall_exit_=
to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       0.92            -0.0        0.91            -0.1        0.84       =
     -0.1        0.86        perf-profile.calltrace.cycles-pp.folio_wait_st=
able.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_f=
ile_write_iter
>       2.18            -0.0        2.17            -0.1        2.09       =
     -0.1        2.12        perf-profile.calltrace.cycles-pp.xas_load.file=
map_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write
>       0.62            -0.0        0.62            -0.0        0.58       =
     -0.0        0.60        perf-profile.calltrace.cycles-pp.__cond_resche=
d.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
>       0.63            -0.0        0.63            -0.0        0.58       =
     -0.0        0.59        perf-profile.calltrace.cycles-pp.x64_sys_call.=
do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       0.92            -0.0        0.92            -0.1        0.84       =
     -0.0        0.87        perf-profile.calltrace.cycles-pp.balance_dirty=
_pages_ratelimited_flags.generic_perform_write.generic_file_write_iter.vfs_=
write.ksys_write
>       1.68            +0.0        1.68            -0.1        1.56       =
     -0.1        1.60        perf-profile.calltrace.cycles-pp.up_write.gene=
ric_file_write_iter.vfs_write.ksys_write.do_syscall_64
>       0.68            +0.0        0.69            -0.0        0.64       =
     -0.0        0.66        perf-profile.calltrace.cycles-pp.__cond_resche=
d.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file=
_write_iter
>       0.72 =C4=85  2%      +0.0        0.72            -0.0        0.69  =
          -0.0        0.70        perf-profile.calltrace.cycles-pp.setattr_=
should_drop_suidgid.file_remove_privs_flags.__generic_file_write_iter.gener=
ic_file_write_iter.vfs_write
>       0.85            +0.0        0.86            -0.0        0.81       =
     -0.0        0.81        perf-profile.calltrace.cycles-pp.xattr_resolve=
_name.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.f=
ile_remove_privs_flags
>       0.74            +0.0        0.75            -0.0        0.70       =
     +0.0        0.77        perf-profile.calltrace.cycles-pp.folio_mark_di=
rty.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_writ=
e
>       0.86            +0.0        0.86            +0.0        0.88       =
     -0.0        0.82        perf-profile.calltrace.cycles-pp.aa_file_perm.=
apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write
>      84.29            +0.0       84.30            +1.2       85.47       =
     +1.1       85.34        perf-profile.calltrace.cycles-pp.entry_SYSCALL=
_64_after_hwframe.write
>       7.00            +0.0        7.02            -0.4        6.59       =
     -0.1        6.89        perf-profile.calltrace.cycles-pp.copy_page_fro=
m_iter_atomic.generic_perform_write.generic_file_write_iter.vfs_write.ksys_=
write
>      82.86            +0.0       82.87            +1.3       84.15       =
     +1.1       83.98        perf-profile.calltrace.cycles-pp.do_syscall_64=
.entry_SYSCALL_64_after_hwframe.write
>       0.73            +0.0        0.74            -0.0        0.71       =
     -0.0        0.70        perf-profile.calltrace.cycles-pp.__cond_resche=
d.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.64            +0.0        0.66 =C4=85  2%      -0.1        0.57  =
          -0.1        0.58        perf-profile.calltrace.cycles-pp.w_test
>      78.16            +0.0       78.18            +1.7       79.81       =
     +1.4       79.57        perf-profile.calltrace.cycles-pp.ksys_write.do=
_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      96.83            +0.0       96.86            +0.2       97.07       =
     +0.3       97.12        perf-profile.calltrace.cycles-pp.write
>       0.78 =C4=85  3%      +0.0        0.82 =C4=85  2%      +0.1        0=
.88 =C4=85  3%      +0.3        1.05 =C4=85  8%  perf-profile.calltrace.cyc=
les-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file_update_time.=
__generic_file_write_iter.generic_file_write_iter
>       1.12 =C4=85  2%      +0.0        1.16            -0.1        1.02  =
          -0.0        1.11        perf-profile.calltrace.cycles-pp.strcmp._=
_vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_rem=
ove_privs_flags
>       4.23            +0.0        4.27            -0.3        3.94       =
     -0.1        4.13        perf-profile.calltrace.cycles-pp.security_inod=
e_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_f=
ile_write_iter.vfs_write
>       2.70            +0.0        2.74            -0.2        2.50       =
     -0.1        2.63        perf-profile.calltrace.cycles-pp.__vfs_getxatt=
r.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_fl=
ags.__generic_file_write_iter
>       3.52            +0.0        3.57            -0.3        3.26       =
     -0.1        3.41        perf-profile.calltrace.cycles-pp.cap_inode_nee=
d_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_f=
ile_write_iter.generic_file_write_iter
>       6.89            +0.1        6.94            -0.4        6.47       =
     -0.1        6.77        perf-profile.calltrace.cycles-pp.file_remove_p=
rivs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys=
_write
>       2.10 =C4=85  5%      +0.1        2.15 =C4=85  3%      -0.1        2=
.03 =C4=85  4%      +0.2        2.25 =C4=85  3%  perf-profile.calltrace.cyc=
les-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.=
write
>       2.96            +0.1        3.06            +0.1        3.08       =
     +0.4        3.36 =C4=85  2%  perf-profile.calltrace.cycles-pp.inode_ne=
eds_update_time.file_update_time.__generic_file_write_iter.generic_file_wri=
te_iter.vfs_write
>       3.61            +0.1        3.72            +0.1        3.71       =
     +0.4        4.00 =C4=85  2%  perf-profile.calltrace.cycles-pp.file_upd=
ate_time.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_w=
rite
>      37.30            +0.1       37.42            -1.6       35.66       =
     +0.2       37.50        perf-profile.calltrace.cycles-pp.generic_perfo=
rm_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
>       5.32            +0.2        5.48            -0.1        5.18       =
     -0.1        5.21        perf-profile.calltrace.cycles-pp.fault_in_read=
able.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_it=
er.vfs_write
>       4.26 =C4=85  3%      +0.2        4.42            +5.4        9.61 =
=C4=85  5%      +0.7        4.98        perf-profile.calltrace.cycles-pp.rw=
_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
>       6.20            +0.2        6.37            -0.2        5.98       =
     -0.2        6.03        perf-profile.calltrace.cycles-pp.fault_in_iov_=
iter_readable.generic_perform_write.generic_file_write_iter.vfs_write.ksys_=
write
>      12.00            +0.2       12.19            -0.4       11.61       =
     +0.2       12.25        perf-profile.calltrace.cycles-pp.__generic_fil=
e_write_iter.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
>       3.02            -0.2        2.79            -0.3        2.72 =C4=85=
  3%      +0.0        3.04        perf-profile.children.cycles-pp.down_writ=
e
>       6.18            -0.1        6.05            +0.1        6.28       =
     +1.1        7.28        perf-profile.children.cycles-pp.filemap_get_en=
try
>      12.68            -0.1       12.56            -0.3       12.34       =
     +0.7       13.42        perf-profile.children.cycles-pp.__filemap_get_=
folio
>      13.58            -0.1       13.47            -0.5       13.13       =
     +0.7       14.29        perf-profile.children.cycles-pp.simple_write_b=
egin
>      58.65            -0.1       58.58            -2.5       56.11       =
     +0.7       59.36        perf-profile.children.cycles-pp.generic_file_w=
rite_iter
>       3.64 =C4=85  3%      -0.1        3.58            +4.7        8.36 =
=C4=85  6%      -0.1        3.56        perf-profile.children.cycles-pp.sec=
urity_file_permission
>       4.19            -0.1        4.14            -0.2        3.96       =
     -0.2        3.98        perf-profile.children.cycles-pp.__cond_resched
>       2.67 =C4=85  5%      -0.1        2.61            +4.7        7.40 =
=C4=85  6%      -0.2        2.51        perf-profile.children.cycles-pp.app=
armor_file_permission
>       3.81            -0.1        3.75            -0.4        3.45       =
     +0.1        3.90        perf-profile.children.cycles-pp.__fsnotify_par=
ent
>       2.42            -0.0        2.38            -0.2        2.23       =
     -0.2        2.25        perf-profile.children.cycles-pp.rcu_all_qs
>       7.43            -0.0        7.39            -0.5        6.91       =
     -0.5        6.92        perf-profile.children.cycles-pp.entry_SYSCALL_=
64
>      98.97            -0.0       98.94            +0.1       99.06       =
     +0.1       99.04        perf-profile.children.cycles-pp.write
>       5.69            -0.0        5.66            -0.3        5.44       =
     -0.1        5.62        perf-profile.children.cycles-pp.simple_write_e=
nd
>       1.21            -0.0        1.18            -0.1        1.06       =
     -0.2        1.04        perf-profile.children.cycles-pp.syscall_return=
_via_sysret
>      75.19            -0.0       75.17            +1.8       76.99       =
     +1.3       76.53        perf-profile.children.cycles-pp.vfs_write
>       1.12            -0.0        1.11            -0.1        1.03       =
     -0.1        1.04        perf-profile.children.cycles-pp.folio_wait_sta=
ble
>       1.90            -0.0        1.88            -0.1        1.80       =
     -0.1        1.84        perf-profile.children.cycles-pp.folio_unlock
>       1.99            -0.0        1.98            -0.2        1.82       =
     -0.1        1.86        perf-profile.children.cycles-pp.syscall_exit_t=
o_user_mode
>       0.76            -0.0        0.75            -0.1        0.70       =
     -0.1        0.70        perf-profile.children.cycles-pp.x64_sys_call
>       0.23            -0.0        0.23 =C4=85  2%      -0.0        0.22  =
          -0.0        0.22        perf-profile.children.cycles-pp.file_remo=
ve_privs
>       2.47            -0.0        2.46            -0.1        2.37       =
     -0.1        2.41        perf-profile.children.cycles-pp.xas_load
>       0.64            -0.0        0.64            -0.1        0.58       =
     -0.0        0.60        perf-profile.children.cycles-pp.syscall_exit_t=
o_user_mode_prepare
>       0.37            -0.0        0.37            -0.0        0.35       =
     -0.0        0.35        perf-profile.children.cycles-pp.__x64_sys_writ=
e
>       0.36            -0.0        0.36            -0.0        0.33       =
     -0.0        0.34        perf-profile.children.cycles-pp.amd_clear_divi=
der
>       1.26            -0.0        1.26            -0.1        1.16       =
     -0.1        1.19        perf-profile.children.cycles-pp.balance_dirty_=
pages_ratelimited_flags
>       0.59            -0.0        0.59            -0.1        0.54       =
     -0.0        0.56        perf-profile.children.cycles-pp.inode_to_bdi
>       1.74            -0.0        1.74            -0.1        1.62       =
     -0.1        1.66        perf-profile.children.cycles-pp.up_write
>       1.05            -0.0        1.05            -0.1        0.97       =
     -0.0        1.01        perf-profile.children.cycles-pp.folio_mapping
>       0.36            +0.0        0.36            -0.0        0.34       =
     -0.0        0.34        perf-profile.children.cycles-pp.is_bad_inode
>       0.33            +0.0        0.33            -0.0        0.30       =
     -0.0        0.31        perf-profile.children.cycles-pp.noop_dirty_fol=
io
>       0.25            +0.0        0.25            -0.0        0.23       =
     -0.0        0.23        perf-profile.children.cycles-pp.balance_dirty_=
pages_ratelimited
>       1.10            +0.0        1.10            -0.1        1.04       =
     -0.1        1.04        perf-profile.children.cycles-pp.xattr_resolve_=
name
>       0.85            +0.0        0.85            -0.0        0.80       =
     -0.0        0.82        perf-profile.children.cycles-pp.setattr_should=
_drop_suidgid
>       0.55            +0.0        0.55            -0.0        0.52       =
     -0.0        0.52        perf-profile.children.cycles-pp.entry_SYSCALL_=
64_safe_stack
>       0.92            +0.0        0.94            -0.1        0.87       =
     +0.0        0.95        perf-profile.children.cycles-pp.folio_mark_dir=
ty
>       0.97            +0.0        0.98            +0.0        0.99       =
     -0.0        0.93        perf-profile.children.cycles-pp.aa_file_perm
>      83.54            +0.0       83.55            +1.3       84.79       =
     +1.1       84.63        perf-profile.children.cycles-pp.do_syscall_64
>       7.14            +0.0        7.15            -0.4        6.72       =
     -0.1        7.03        perf-profile.children.cycles-pp.copy_page_from=
_iter_atomic
>       0.45 =C4=85  2%      +0.0        0.47            -0.0        0.41  =
          -0.0        0.41        perf-profile.children.cycles-pp.write@plt
>      84.71            +0.0       84.72            +1.2       85.88       =
     +1.1       85.76        perf-profile.children.cycles-pp.entry_SYSCALL_=
64_after_hwframe
>       4.41            +0.0        4.43            -0.3        4.11       =
     -0.3        4.16        perf-profile.children.cycles-pp.entry_SYSRETQ_=
unsafe_stack
>       0.98            +0.0        1.00            -0.1        0.87       =
     -0.1        0.89        perf-profile.children.cycles-pp.w_test
>      78.77            +0.0       78.80            +1.6       80.39       =
     +1.4       80.17        perf-profile.children.cycles-pp.ksys_write
>       0.89 =C4=85  3%      +0.0        0.93            +0.1        0.97 =
=C4=85  3%      +0.3        1.16 =C4=85  7%  perf-profile.children.cycles-p=
p.ktime_get_coarse_real_ts64
>       1.37            +0.0        1.42            -0.1        1.24       =
     -0.0        1.34        perf-profile.children.cycles-pp.strcmp
>       4.46            +0.0        4.51            -0.3        4.15       =
     -0.1        4.35        perf-profile.children.cycles-pp.security_inode=
_need_killpriv
>       3.75            +0.0        3.80            -0.3        3.47       =
     -0.1        3.63        perf-profile.children.cycles-pp.cap_inode_need=
_killpriv
>       7.24            +0.1        7.30            -0.4        6.81       =
     -0.1        7.11        perf-profile.children.cycles-pp.file_remove_pr=
ivs_flags
>       3.39            +0.1        3.45            -0.2        3.15       =
     -0.1        3.29        perf-profile.children.cycles-pp.__vfs_getxattr
>       3.38            +0.1        3.48            +0.1        3.46       =
     +0.4        3.74 =C4=85  2%  perf-profile.children.cycles-pp.inode_nee=
ds_update_time
>       3.94            +0.1        4.05            +0.1        4.02       =
     +0.4        4.32        perf-profile.children.cycles-pp.file_update_ti=
me
>      38.19            +0.1       38.33            -1.7       36.51       =
     +0.2       38.39        perf-profile.children.cycles-pp.generic_perfor=
m_write
>       5.71            +0.2        5.87            -0.2        5.49       =
     -0.2        5.54        perf-profile.children.cycles-pp.fault_in_reada=
ble
>       4.50 =C4=85  3%      +0.2        4.67            +5.4        9.86 =
=C4=85  4%      +0.9        5.35        perf-profile.children.cycles-pp.rw_=
verify_area
>       6.45            +0.2        6.64            -0.2        6.22       =
     -0.2        6.28        perf-profile.children.cycles-pp.fault_in_iov_i=
ter_readable
>      12.34            +0.2       12.53            -0.4       11.93       =
     +0.2       12.58        perf-profile.children.cycles-pp.__generic_file=
_write_iter
>       1.98 =C4=85  3%      -0.2        1.79            -0.2        1.74 =
=C4=85  4%      +0.1        2.04        perf-profile.self.cycles-pp.down_wr=
ite
>       3.66            -0.1        3.54            +0.2        3.86       =
     +1.2        4.82 =C4=85  2%  perf-profile.self.cycles-pp.filemap_get_e=
ntry
>       3.64            -0.1        3.57            -0.4        3.28       =
     +0.1        3.73        perf-profile.self.cycles-pp.__fsnotify_parent
>       1.54 =C4=85  9%      -0.1        1.47 =C4=85  2%      +4.7        6=
.22 =C4=85  8%      -0.1        1.44        perf-profile.self.cycles-pp.app=
armor_file_permission
>       1.71 =C4=85  2%      -0.1        1.65            -0.0        1.69 =
=C4=85  2%      +0.1        1.82        perf-profile.self.cycles-pp.generic=
_file_write_iter
>       6.45            -0.1        6.39            -0.5        5.95       =
     -0.5        6.00        perf-profile.self.cycles-pp.write
>       7.25            -0.1        7.20            -0.6        6.64       =
     -0.3        6.98        perf-profile.self.cycles-pp.vfs_write
>       2.35            -0.0        2.31            -0.1        2.25       =
     -0.1        2.22        perf-profile.self.cycles-pp.__cond_resched
>       2.76            -0.0        2.72            -0.1        2.65       =
     -0.0        2.72        perf-profile.self.cycles-pp.simple_write_end
>       0.80 =C4=85  4%      -0.0        0.78 =C4=85  2%      -0.1        0=
.76 =C4=85  2%      +0.1        0.88        perf-profile.self.cycles-pp.gen=
eric_write_check_limits
>       1.20            -0.0        1.18            -0.1        1.06       =
     -0.2        1.03        perf-profile.self.cycles-pp.syscall_return_via=
_sysret
>       1.41            -0.0        1.39            -0.1        1.30       =
     -0.1        1.34        perf-profile.self.cycles-pp.rcu_all_qs
>       1.76            -0.0        1.75            -0.1        1.68       =
     -0.0        1.72        perf-profile.self.cycles-pp.folio_unlock
>       1.90            -0.0        1.90            -0.1        1.76       =
     -0.1        1.78        perf-profile.self.cycles-pp.do_syscall_64
>       0.54            -0.0        0.53            -0.0        0.50       =
     -0.0        0.50        perf-profile.self.cycles-pp.folio_wait_stable
>       1.80            -0.0        1.80            -0.1        1.72       =
     -0.0        1.75        perf-profile.self.cycles-pp.xas_load
>       1.10            -0.0        1.09            -0.0        1.06       =
     -0.1        1.02        perf-profile.self.cycles-pp.security_file_perm=
ission
>       1.48            -0.0        1.47            -0.1        1.36       =
     -0.1        1.38        perf-profile.self.cycles-pp.ksys_write
>       0.62            -0.0        0.62            -0.0        0.58       =
     -0.0        0.58        perf-profile.self.cycles-pp.x64_sys_call
>       0.35            -0.0        0.35            -0.0        0.32       =
     -0.0        0.33        perf-profile.self.cycles-pp.cap_inode_need_kil=
lpriv
>       0.24            -0.0        0.24            -0.0        0.23 =C4=85=
  2%      -0.0        0.23        perf-profile.self.cycles-pp.is_bad_inode
>       0.87            -0.0        0.87            -0.1        0.80       =
     -0.0        0.83        perf-profile.self.cycles-pp.folio_mapping
>       0.24            -0.0        0.24            -0.0        0.22       =
     -0.0        0.22        perf-profile.self.cycles-pp.amd_clear_divider
>       0.70            -0.0        0.70            -0.0        0.67       =
     +0.0        0.72        perf-profile.self.cycles-pp.security_inode_nee=
d_killpriv
>       0.52            -0.0        0.52            -0.0        0.47       =
     -0.0        0.49        perf-profile.self.cycles-pp.syscall_exit_to_us=
er_mode_prepare
>       1.62            +0.0        1.62            -0.1        1.51       =
     -0.1        1.55        perf-profile.self.cycles-pp.up_write
>       0.22            +0.0        0.22            -0.0        0.21 =C4=85=
  2%      -0.0        0.21        perf-profile.self.cycles-pp.noop_dirty_fo=
lio
>       1.09            +0.0        1.10            -0.1        1.01       =
     -0.1        1.02        perf-profile.self.cycles-pp.syscall_exit_to_us=
er_mode
>       0.35            +0.0        0.36            -0.0        0.32       =
     -0.0        0.34        perf-profile.self.cycles-pp.inode_to_bdi
>       1.25            +0.0        1.25            -0.1        1.16       =
     -0.0        1.20        perf-profile.self.cycles-pp.entry_SYSCALL_64_a=
fter_hwframe
>       0.25            +0.0        0.25            -0.0        0.23       =
     -0.0        0.23        perf-profile.self.cycles-pp.__x64_sys_write
>       0.79            +0.0        0.80            -0.1        0.74       =
     -0.0        0.75        perf-profile.self.cycles-pp.balance_dirty_page=
s_ratelimited_flags
>       2.04            +0.0        2.04            -0.1        1.95       =
     +0.0        2.04        perf-profile.self.cycles-pp.file_remove_privs_=
flags
>       0.55            +0.0        0.55            -0.0        0.52       =
     -0.0        0.52        perf-profile.self.cycles-pp.entry_SYSCALL_64_s=
afe_stack
>       0.61            +0.0        0.62            -0.0        0.58       =
     -0.0        0.59        perf-profile.self.cycles-pp.xattr_resolve_name
>       0.73            +0.0        0.73            -0.0        0.69       =
     -0.0        0.70        perf-profile.self.cycles-pp.setattr_should_dro=
p_suidgid
>       4.51            +0.0        4.52            -0.3        4.23       =
     -0.2        4.27        perf-profile.self.cycles-pp.__filemap_get_foli=
o
>       0.47            +0.0        0.48            -0.0        0.45       =
     +0.0        0.49        perf-profile.self.cycles-pp.folio_mark_dirty
>       0.87            +0.0        0.88            +0.0        0.89       =
     -0.0        0.83        perf-profile.self.cycles-pp.aa_file_perm
>       6.97            +0.0        6.98            -0.4        6.56       =
     -0.1        6.86        perf-profile.self.cycles-pp.copy_page_from_ite=
r_atomic
>       1.39            +0.0        1.40            -0.1        1.30       =
     -0.0        1.34        perf-profile.self.cycles-pp.__vfs_getxattr
>       1.65            +0.0        1.67            -0.1        1.56       =
     -0.1        1.60        perf-profile.self.cycles-pp.entry_SYSCALL_64
>       4.32            +0.0        4.34            -0.3        4.02       =
     -0.3        4.06        perf-profile.self.cycles-pp.entry_SYSRETQ_unsa=
fe_stack
>       0.90            +0.0        0.92            -0.1        0.80       =
     -0.0        0.87        perf-profile.self.cycles-pp.simple_write_begin
>       0.66            +0.0        0.68            -0.0        0.64       =
     +0.0        0.67        perf-profile.self.cycles-pp.file_update_time
>       1.15            +0.0        1.18            -0.0        1.10       =
     -0.0        1.15        perf-profile.self.cycles-pp.__generic_file_wri=
te_iter
>       0.78            +0.0        0.81            -0.1        0.69       =
     -0.1        0.71        perf-profile.self.cycles-pp.w_test
>       1.02 =C4=85  2%      +0.0        1.06            -0.1        0.91  =
          -0.0        1.00        perf-profile.self.cycles-pp.strcmp
>       1.50            +0.0        1.53            +0.0        1.52       =
     +0.1        1.58        perf-profile.self.cycles-pp.inode_needs_update=
_time
>       0.78 =C4=85  4%      +0.0        0.82            +0.1        0.86 =
=C4=85  3%      +0.3        1.05 =C4=85  8%  perf-profile.self.cycles-pp.kt=
ime_get_coarse_real_ts64
>       3.35            +0.1        3.44            -0.2        3.18       =
     -0.0        3.31        perf-profile.self.cycles-pp.generic_perform_wr=
ite
>       5.56            +0.2        5.72            -0.2        5.33       =
     -0.2        5.38        perf-profile.self.cycles-pp.fault_in_readable
>       0.85            +0.2        1.09            +0.7        1.50       =
     +1.1        1.92        perf-profile.self.cycles-pp.rw_verify_area
>
>
