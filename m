Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA85BA29
	for <oe-lkp@lists.linux.dev>; Mon, 26 Jun 2023 15:14:10 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7943bfaed0dso184356241.0
        for <oe-lkp@lists.linux.dev>; Mon, 26 Jun 2023 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687792450; x=1690384450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L00GrgfcPCALu34h4ynS7YzN8iw0RGUJdOs/3NF2tNk=;
        b=UzNXfwubr/uE8yAuyQbzfoRkVQv1DOZqJjc1nZxO0aGmpwFWhcDicneHJjabR0M2yP
         YPMNJtPmSyn9gYmfPycV0JhALs2rVRBcdsHMEl+aqz2uSOEz/AlEvBu5UGeERcCJdAq4
         QfzeMogSRIx90H2qGXzmPNUv05yKWx6OWa7STNQlH3D3lvsBYLYZb7dQWBaNrJmtUnX/
         W6l4EzCr/NOgB2IR+W0XaRoPMvoD+JnNLgQCNRQKZBlQboJwJppaK2DrUM3tdUPn9e8+
         Ybe2D/s3H7esxlXlIGLp1S1UoIWTEh7a4GzZxdi+lPjQ61YJXI/a8AxfMPZzv6XJeufa
         vtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687792450; x=1690384450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L00GrgfcPCALu34h4ynS7YzN8iw0RGUJdOs/3NF2tNk=;
        b=fZp/7XDArmTXoGKp4Li4UQtglTLpH+KNgWXMgSPdPa1A61gmAapg+wiuYzAPIQbi9O
         wyApgA1OL26wF2nnrm6f+Tm6ysRf5W11GRDylV1Z5MszWre9787BElTVWp7Yec3JQv2b
         nyJAbtd1mzBYnbOV6c9jvlHsTW4Z8l9zMtERbpPt+NaDT/aZxOwnhyBYwjMhMHCsEJyh
         3V2eYPY0dcJWS1UCcklc9SFdpRZbKQ0yYWthuGFG05UOEeIxn+y9EIvGRvooG6b+uGyV
         ZNy4I7Su0ZTyU6nG8z03nzUWspp5TegR8VjD4pdnAxAzrZahSPRPCwzBuzl87KEdVBul
         XN/w==
X-Gm-Message-State: AC+VfDwyNnrc+MC0JCvaDGOu+F7kvTlLoi3IYDx8OGtca607MuG30IrW
	XLxrFqGvHWC23Of34EMiNktP7iuUWWC5kFgiKMg=
X-Google-Smtp-Source: ACHHUZ6wlIY0P4XVl2RjbPoVAQeDDigH7lIqszUC75b2K0mYMV22q/w+xlL+cEtyyMNWAdHUOh0R+hd2X0RzWGMNpYY=
X-Received: by 2002:a67:fa4e:0:b0:440:c751:2a64 with SMTP id
 j14-20020a67fa4e000000b00440c7512a64mr9145100vsq.19.1687792448777; Mon, 26
 Jun 2023 08:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306192245.d77d7216-oliver.sang@intel.com> <CAOQ4uxj_md8KqiQ=TTMC7Kv5VFtREfB8T3agB+pVH8STye_5Vw@mail.gmail.com>
 <ZJWwrHozI2GkRnJ6@xsang-OptiPlex-9020> <CAOQ4uxg8rr-uHUo62nrZzfp14UpNAz1K9YxyaAq7D2ggAFLHMg@mail.gmail.com>
 <20230626133142.xdcwu7akidnftrla@quack3>
In-Reply-To: <20230626133142.xdcwu7akidnftrla@quack3>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 26 Jun 2023 18:13:55 +0300
Message-ID: <CAOQ4uxhf2UkZUtrB42d=5Nti1eS3Fn_Jg7gsqNRkQVS=GWmPTQ@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711: stress-ng.ramfs.ops_per_sec
 -13.0% regression
To: Jan Kara <jack@suse.cz>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 4:31=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
>
> Hi Amir!
>
> On Sat 24-06-23 16:18:14, Amir Goldstein wrote:
> > On Fri, Jun 23, 2023 at 5:48=E2=80=AFPM Oliver Sang <oliver.sang@intel.=
com> wrote:
> > > On Tue, Jun 20, 2023 at 02:36:51PM +0300, Amir Goldstein wrote:
> > > > On Tue, Jun 20, 2023 at 4:44=E2=80=AFAM kernel test robot <oliver.s=
ang@intel.com> wrote:
> > > > > kernel test robot noticed a -13.0% regression of stress-ng.ramfs.=
ops_per_sec on:
> > > > >
> > > > >
> > > > > commit: e796a59711433d5400947b2dbfaf35d465840842 ("vfs: implement=
 'vfs write barriers'")
> > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > >
> > > >
> > > > Considering that this commit only adds helpers but never uses them
> > > > this regression is a bit surprising.
> > > >
> > > > You had reported regressions in the past on the next commit:
> > > > "vfs: prepare for pre-modify permission events on write"
> > > >
> > > > which made sense and I had since fixed and you verified.
> > > >
> > > > The only suspect I can think of is that adding the new s_write_*
> > > > members to struct super_block had split the frequently access
> > > > members s_fsnotify_connectors and s_readonly_remount into
> > > > different cachelines.
> > > >
> > > > I've moved those new members to another location in the
> > > > super_block struct and pushed the new branch to:
> > > >
> > > > https://github.com/amir73il/linux sb_write_barrier
> > > >
> > > > I've added another commit at the tip of this branch:
> > > > 67d1802889f0 ("fsnotify: activate sb write barriers for permission
> > > > event watchers")
> > > >
> > > > This commit also adds a new member to struct super_block,
> > > > next to s_fsnotify_connectors and s_readonly_remount, but this
> > > > new member is also frequently accessed.
> > > >
> > > > I am hoping that you can also verify that the tip commit does not
> > > > cause a regression.
> > >
> > > I finished the test on updated branch, but seems regression not be fi=
xed.
> > >
> > >   d0c30b5ebd657 (amir73il/fan_access_range) fanotify: report file ran=
ge info with FAN_ACCESSS_PERM
> > >   f995c9620bfd7 vfs: implement 'vfs write barriers'
> > >   309b0dd357c60 vfs: prepare for pre-modify permission events on writ=
e
> > >   67d1802889f02 (amir73il/sb_write_barrier) fsnotify: activate sb wri=
te barriers for permission event watchers
> > >
> > > d0c30b5ebd6579cc f995c9620bfd75a07a2c8a8d70c 309b0dd357c60a5e541766ef=
097 67d1802889f02cd626d5924339a
> > > ---------------- --------------------------- ------------------------=
--- ---------------------------
> > >          %stddev     %change         %stddev     %change         %std=
dev     %change         %stddev
> > >              \          |                \          |                =
\          |                \
> > >    1377718           -13.8%    1187511 =C2=B1  2%     -14.4%    11796=
29           -14.0%    1185167        stress-ng.ramfs.ops
> > >      22961           -13.8%      19791 =C2=B1  2%     -14.4%      196=
60           -14.0%      19752        stress-ng.ramfs.ops_per_sec
> > >
> > > all detail comparison is as below, I also attached the config to buil=
d all
> > > these four kernels.
> > >
> >
> > Thank you Oliver!
> >
> > Jan,
> >
> > Do you have an idea of what might be going on here?
>
> Not really.
>
> > The only code change in the regressing commit is the addition
> > of the s_write_* members to super_block and the addition of
> > init_srcu_struct() call in alloc_super().
> >
> > Unless I am missing something.
>
> No, you are right. But it could also be some code alignment changing afte=
r
> adding those new functions. Can you reproduce the regression on your
> machine?

I have not tried yet.

> If yes, you could have a look at some micro-architectural perf
> counters like iTLB misses or similar to see e.g. whether code of some hot
> function didn't get split among two cachelines or similar issue. There's
> also CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B which can help in determining
> whether function alignment is the issue or not.
>

There is a lot of perf information in the report below, e.g.:

>    1259329 =C2=B1  2%    +405.3%    6363306          +404.5%    6353871  =
        +408.1%    6398089        perf-stat.ps.cache-misses
>     182239 =C2=B1  2%     +40.1%     255227 =C2=B1  9%     +38.0%     251=
400 =C2=B1 14%     +23.9%     225874 =C2=B1  6%  perf-stat.ps.dTLB-load-mis=
ses
>      98768 =C2=B1  6%    +131.3%     228477          +130.1%     227267 =
=C2=B1  3%    +126.1%     223327        perf-stat.ps.dTLB-store-misses

And some odd reports like:

>      17796        +48024.2%    8564575        +47827.4%    8529539       =
 +48034.7%    8566438        meminfo.Percpu
>      91742          +311.6%     377568          +310.0%     376107       =
   +311.2%     377278        meminfo.SUnreclaim
>     187447          +152.3%     472983          +151.6%     471592       =
   +152.1%     472612        meminfo.Slab
>      20441         +2173.2%     464664         +2164.2%     462832       =
  +2173.5%     464731        meminfo.VmallocUsed

Which I assume are not related to my change...

> Frankly, when confirmed the issue is with code alignment, I usually tend =
to
> ignore it except for the hottest loops / functions (like memset(), memcpy=
()
> and similar) because for normal functions it is a win or loss depending o=
n
> the particular microbenchmark.

Ok, I will ignore this for now and will try to reproduce locally with
different kernel config options later on.

Thanks,
Amir.

>
>                                                                 Honza
>
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbo=
x_group/test/testcase/testtime:
> > >   os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_6=
4-20220510.cgz/lkp-csl-d02/ramfs/stress-ng/60s
> > >
> > > commit:
> > >   d0c30b5ebd657 (amir73il/fan_access_range) fanotify: report file ran=
ge info with FAN_ACCESSS_PERM
> > >   f995c9620bfd7 vfs: implement 'vfs write barriers'
> > >   309b0dd357c60 vfs: prepare for pre-modify permission events on writ=
e
> > >   67d1802889f02 (amir73il/sb_write_barrier) fsnotify: activate sb wri=
te barriers for permission event watchers
> > >
> > > d0c30b5ebd6579cc f995c9620bfd75a07a2c8a8d70c 309b0dd357c60a5e541766ef=
097 67d1802889f02cd626d5924339a
> > > ---------------- --------------------------- ------------------------=
--- ---------------------------
> > >          %stddev     %change         %stddev     %change         %std=
dev     %change         %stddev
> > >              \          |                \          |                =
\          |                \
> > >   2.15e+09            -0.2%  2.146e+09            -0.1%  2.147e+09   =
         -0.3%  2.144e+09        cpuidle..time
> > >    3626267            +2.7%    3723533            +0.5%    3643077   =
         -2.4%    3540533        cpuidle..usage
> > >      94.20            +0.4%      94.59            +0.8%      94.96 =
=C2=B1  2%      -0.4%      93.83        uptime.boot
> > >       3164            +0.3%       3172            +0.7%       3186   =
         -0.4%       3151        uptime.idle
> > >      21.92            +1.1%      22.16 =C2=B1  7%      +1.5%      22.=
24 =C2=B1  8%      -0.7%      21.75        boot-time.boot
> > >      12.15 =C2=B1  2%      +4.3%      12.67 =C2=B1  9%      +5.4%    =
  12.81 =C2=B1 15%      +0.3%      12.18        boot-time.dhcp
> > >     730.73            +0.5%     734.39 =C2=B1  5%      +0.8%     736.=
74 =C2=B1  6%      -0.8%     725.09        boot-time.idle
> > >      93.62            -0.0%      93.59            +0.0%      93.65   =
         -0.0%      93.60        iostat.cpu.idle
> > >       0.16 =C2=B1 19%     +19.7%       0.19 =C2=B1 19%      -2.4%    =
   0.15 =C2=B1  7%      +9.0%       0.17 =C2=B1 50%  iostat.cpu.iowait
> > >       3.63            +1.1%       3.67            +1.0%       3.67   =
         +1.2%       3.68        iostat.cpu.system
> > >       2.59            -1.8%       2.54            -2.5%       2.53   =
         -1.4%       2.55        iostat.cpu.user
> > >      93.55            -0.0       93.53            +0.0       93.58   =
         -0.0       93.53        mpstat.cpu.all.idle%
> > >       0.15 =C2=B1 21%      +0.0        0.17 =C2=B1 15%      -0.0     =
   0.14 =C2=B1 10%      +0.0        0.16 =C2=B1 55%  mpstat.cpu.all.iowait%
> > >       0.56 =C2=B1  2%      +0.0        0.57 =C2=B1  2%      +0.0     =
   0.57 =C2=B1  2%      -0.0        0.55        mpstat.cpu.all.irq%
> > >       0.14 =C2=B1  2%      -0.0        0.10 =C2=B1 34%      -0.0     =
   0.11 =C2=B1 25%      -0.0        0.11 =C2=B1 32%  mpstat.cpu.all.soft%
> > >       2.97            +0.1        3.04            +0.1        3.03   =
         +0.1        3.04        mpstat.cpu.all.sys%
> > >       2.63            -0.0        2.59            -0.1        2.57   =
         -0.0        2.60        mpstat.cpu.all.usr%
> > >      62.03            +0.0%      62.03            +0.0%      62.06   =
         +0.0%      62.03        time.elapsed_time
> > >      62.03            +0.0%      62.03            +0.0%      62.06   =
         +0.0%      62.03        time.elapsed_time.max
> > >      14.40 =C2=B1 22%      -7.4%      13.33 =C2=B1 28%     -25.9%    =
  10.67 =C2=B1 35%     -11.1%      12.80 =C2=B1 30%  time.file_system_input=
s
> > >    2760309           -12.4%    2418439 =C2=B1  2%     -13.0%    24015=
66           -12.5%    2414316        time.involuntary_context_switches
> > >       0.40 =C2=B1122%     +66.7%       0.67 =C2=B1111%    +108.3%    =
   0.83 =C2=B1107%    -100.0%       0.00        time.major_page_faults
> > >       6969 =C2=B1  3%      -1.5%       6864 =C2=B1  2%      -0.1%    =
   6960 =C2=B1  2%      +0.0%       6969        time.maximum_resident_set_s=
ize
> > >       9403            -0.3%       9371            -0.3%       9376   =
         -0.4%       9361        time.minor_page_faults
> > >       4096            +0.0%       4096            +0.0%       4096   =
         +0.0%       4096        time.page_size
> > >      75.00            +0.4%      75.33            +0.9%      75.67   =
         +1.6%      76.20        time.percent_of_cpu_this_job_got
> > >      40.03            +3.2%      41.31            +4.0%      41.64   =
         +4.7%      41.89        time.system_time
> > >       6.85           -15.5%       5.79 =C2=B1  8%     -16.3%       5.=
73 =C2=B1  2%     -16.6%       5.71 =C2=B1  2%  time.user_time
> > >     355622 =C2=B1 14%     +42.2%     505661 =C2=B1 13%     +21.1%    =
 430817 =C2=B1 15%     -13.4%     308012 =C2=B1 12%  time.voluntary_context=
_switches
> > >      93.00            +0.0%      93.00            +0.0%      93.00   =
         +0.0%      93.00        vmstat.cpu.id
> > >       3.00            +0.0%       3.00            +0.0%       3.00   =
         +0.0%       3.00        vmstat.cpu.sy
> > >       2.00            +0.0%       2.00            +0.0%       2.00   =
         +0.0%       2.00        vmstat.cpu.us
> > >       0.00          -100.0%       0.00          -100.0%       0.00   =
       -100.0%       0.00        vmstat.cpu.wa
> > >      15.00            +0.0%      15.00            +0.0%      15.00   =
         +0.0%      15.00        vmstat.io.bi
> > >     375.00 =C2=B1  4%      +9.3%     409.83 =C2=B1 19%     +14.4%    =
 429.00 =C2=B1 21%      -4.6%     357.60 =C2=B1  3%  vmstat.io.bo
> > >       2052            +0.2%       2056            +1.0%       2073   =
         +0.5%       2062        vmstat.memory.buff
> > >    3257813            -0.7%    3235379            -0.8%    3232739   =
         -0.8%    3233180        vmstat.memory.cache
> > >  1.276e+08            -6.7%  1.191e+08            -6.7%  1.191e+08   =
         -6.7%  1.191e+08        vmstat.memory.free
> > >       0.00          -100.0%       0.00          -100.0%       0.00   =
       -100.0%       0.00        vmstat.procs.b
> > >       2.00            +0.0%       2.00            +0.0%       2.00   =
        -10.0%       1.80 =C2=B1 22%  vmstat.procs.r
> > >     184174            -4.0%     176739            -7.4%     170573 =
=C2=B1  3%     -10.7%     164543        vmstat.system.cs
> > >      81544            -0.6%      81066            -2.8%      79288   =
         -4.8%      77608        vmstat.system.in
> > >    1377718           -13.8%    1187511 =C2=B1  2%     -14.4%    11796=
29           -14.0%    1185167        stress-ng.ramfs.ops
> > >      22961           -13.8%      19791 =C2=B1  2%     -14.4%      196=
60           -14.0%      19752        stress-ng.ramfs.ops_per_sec
> > >      62.03            +0.0%      62.03            +0.0%      62.06   =
         +0.0%      62.03        stress-ng.time.elapsed_time
> > >      62.03            +0.0%      62.03            +0.0%      62.06   =
         +0.0%      62.03        stress-ng.time.elapsed_time.max
> > >      14.40 =C2=B1 22%      -7.4%      13.33 =C2=B1 28%     -25.9%    =
  10.67 =C2=B1 35%     -11.1%      12.80 =C2=B1 30%  stress-ng.time.file_sy=
stem_inputs
> > >    2760309           -12.4%    2418439 =C2=B1  2%     -13.0%    24015=
66           -12.5%    2414316        stress-ng.time.involuntary_context_sw=
itches
> > >       0.40 =C2=B1122%     +66.7%       0.67 =C2=B1111%    +108.3%    =
   0.83 =C2=B1107%    -100.0%       0.00        stress-ng.time.major_page_f=
aults
> > >       6969 =C2=B1  3%      -1.5%       6864 =C2=B1  2%      -0.1%    =
   6960 =C2=B1  2%      +0.0%       6969        stress-ng.time.maximum_resi=
dent_set_size
> > >       9403            -0.3%       9371            -0.3%       9376   =
         -0.4%       9361        stress-ng.time.minor_page_faults
> > >       4096            +0.0%       4096            +0.0%       4096   =
         +0.0%       4096        stress-ng.time.page_size
> > >      75.00            +0.4%      75.33            +0.9%      75.67   =
         +1.6%      76.20        stress-ng.time.percent_of_cpu_this_job_got
> > >      40.03            +3.2%      41.31            +4.0%      41.64   =
         +4.7%      41.89        stress-ng.time.system_time
> > >       6.85           -15.5%       5.79 =C2=B1  8%     -16.3%       5.=
73 =C2=B1  2%     -16.6%       5.71 =C2=B1  2%  stress-ng.time.user_time
> > >     355622 =C2=B1 14%     +42.2%     505661 =C2=B1 13%     +21.1%    =
 430817 =C2=B1 15%     -13.4%     308012 =C2=B1 12%  stress-ng.time.volunta=
ry_context_switches
> > >     260.40            +0.5%     261.67            -0.0%     260.33   =
         +0.1%     260.60        turbostat.Avg_MHz
> > >       6.93            +0.0        6.96            -0.0        6.92   =
         -0.0        6.93        turbostat.Busy%
> > >       3753            +0.1%       3758            +0.1%       3758   =
         +0.2%       3760        turbostat.Bzy_MHz
> > >     158528           -20.0%     126746 =C2=B1  2%     -23.7%     1210=
31 =C2=B1  4%     -19.3%     128009 =C2=B1  4%  turbostat.C1
> > >       0.20 =C2=B1  3%      -0.0        0.18 =C2=B1  6%      -0.0     =
   0.18 =C2=B1  7%      -0.0        0.18 =C2=B1  8%  turbostat.C1%
> > >    1192913            -0.1%    1192259            -1.0%    1180912   =
         -0.5%    1187383        turbostat.C1E
> > >       5.87            +0.0        5.88            -0.2        5.72   =
         +0.0        5.87 =C2=B1  6%  turbostat.C1E%
> > >    2048935            -0.2%    2045629            +0.0%    2049836   =
         -0.2%    2043994        turbostat.C6
> > >      87.27            -0.0       87.25            +0.2       87.45   =
         +0.0       87.27        turbostat.C6%
> > >      92.04            +0.1%      92.16            +0.2%      92.22   =
         +0.2%      92.22        turbostat.CPU%c1
> > >       1.02 =C2=B1 12%     -13.9%       0.88 =C2=B1 11%     -16.0%    =
   0.86 =C2=B1 14%     -16.8%       0.85 =C2=B1  4%  turbostat.CPU%c6
> > >      41.00            +0.8%      41.33 =C2=B1  2%      +0.0%      41.=
00 =C2=B1  2%      -0.5%      40.80        turbostat.CoreTmp
> > >       0.43            -2.6%       0.42            +0.1%       0.43 =
=C2=B1  2%      -0.9%       0.42        turbostat.IPC
> > >    5306984            -0.7%    5272062            -2.6%    5169631   =
         -5.1%    5034120        turbostat.IRQ
> > >     222417 =C2=B1 21%     +59.9%     355585 =C2=B1 15%     +29.7%    =
 288493 =C2=B1 17%     -20.0%     177907 =C2=B1 19%  turbostat.POLL
> > >       0.02 =C2=B1 20%      +0.0        0.04 =C2=B1 14%      +0.0     =
   0.03 =C2=B1 19%      -0.0        0.02        turbostat.POLL%
> > >       0.52 =C2=B1 24%     -19.3%       0.42 =C2=B1 50%      -7.0%    =
   0.48 =C2=B1 17%     -12.4%       0.45 =C2=B1  7%  turbostat.Pkg%pc2
> > >      40.20            +0.7%      40.50 =C2=B1  3%      -0.1%      40.=
17 =C2=B1  3%      +0.5%      40.40 =C2=B1  2%  turbostat.PkgTmp
> > >      87.87            +0.3%      88.17            +0.4%      88.20   =
         +0.6%      88.40        turbostat.PkgWatt
> > >      10.04           +12.4%      11.29           +12.2%      11.26   =
        +12.6%      11.30        turbostat.RAMWatt
> > >       3001            -0.0%       3000            -0.0%       3000   =
         -0.0%       3000        turbostat.TSC_MHz
> > >     314265            -4.1%     301274            -5.0%     298490   =
         -4.8%     299238        meminfo.Active
> > >     312130            -4.2%     299145            -5.1%     296340   =
         -4.8%     297104        meminfo.Active(anon)
> > >       2134            -0.3%       2128            +0.7%       2149   =
         -0.0%       2134        meminfo.Active(file)
> > >      53077 =C2=B1  9%      +0.3%      53222 =C2=B1  8%     +10.7%    =
  58778 =C2=B1  9%      +5.9%      56198 =C2=B1 14%  meminfo.AnonHugePages
> > >     304406            -0.3%     303490            +0.1%     304645   =
         +0.1%     304617        meminfo.AnonPages
> > >       2051            +0.2%       2055            +1.0%       2072   =
         +0.5%       2061        meminfo.Buffers
> > >    3160005            -0.7%    3137936            -0.8%    3134924   =
         -0.8%    3135847        meminfo.Cached
> > >   65801604            -0.0%   65801600            -0.0%   65801600   =
         -0.0%   65801600        meminfo.CommitLimit
> > >     839115            -2.7%     816130            -3.1%     813419   =
         -3.0%     814330        meminfo.Committed_AS
> > >   1.25e+08 =C2=B1  2%      +2.1%  1.276e+08            +1.8%  1.272e+=
08            +1.0%  1.262e+08        meminfo.DirectMap1G
> > >    8610611 =C2=B1 40%     -30.0%    6030336 =C2=B1 23%     -26.0%    =
6374741 =C2=B1 22%     -14.6%    7351910 =C2=B1 14%  meminfo.DirectMap2M
> > >     308537 =C2=B1 17%      -2.0%     302325 =C2=B1 16%      -0.4%    =
 307445 =C2=B1 10%      +0.1%     308947 =C2=B1  9%  meminfo.DirectMap4k
> > >      13.00 =C2=B1 28%     +12.8%      14.67 =C2=B1 30%      +3.8%    =
  13.50 =C2=B1 23%     +23.1%      16.00 =C2=B1  5%  meminfo.Dirty
> > >       2048            +0.0%       2048            +0.0%       2048   =
         +0.0%       2048        meminfo.Hugepagesize
> > >     340650            -3.0%     330534            -2.8%     331152   =
         -2.6%     331690        meminfo.Inactive
> > >     340463            -3.0%     330348            -2.8%     330961   =
         -2.6%     331497        meminfo.Inactive(anon)
> > >     186.60            -0.5%     185.67            +1.9%     190.17 =
=C2=B1  4%      +3.1%     192.40 =C2=B1  3%  meminfo.Inactive(file)
> > >      95703            -0.3%      95413            -0.2%      95485   =
         -0.4%      95332        meminfo.KReclaimable
> > >       9046            +0.2%       9060            -0.1%       9034   =
         -0.3%       9017        meminfo.KernelStack
> > >      54598           -16.7%      45490           -16.3%      45704   =
        -16.0%      45866        meminfo.Mapped
> > >  1.268e+08            -6.6%  1.184e+08            -6.6%  1.185e+08   =
         -6.6%  1.184e+08        meminfo.MemAvailable
> > >  1.276e+08            -6.6%  1.192e+08            -6.5%  1.193e+08   =
         -6.6%  1.193e+08        meminfo.MemFree
> > >  1.316e+08            -0.0%  1.316e+08            -0.0%  1.316e+08   =
         -0.0%  1.316e+08        meminfo.MemTotal
> > >    3958498          +212.2%   12357945          +211.2%   12317930   =
       +212.1%   12353184        meminfo.Memused
> > >      11.00            +0.0%      11.00            +0.0%      11.00   =
         +0.0%      11.00        meminfo.Mlocked
> > >       4014            -0.2%       4007            -0.2%       4006   =
         +0.6%       4040        meminfo.PageTables
> > >      17796        +48024.2%    8564575        +47827.4%    8529539   =
     +48034.7%    8566438        meminfo.Percpu
> > >      95703            -0.3%      95413            -0.2%      95485   =
         -0.4%      95332        meminfo.SReclaimable
> > >      91742          +311.6%     377568          +310.0%     376107   =
       +311.2%     377278        meminfo.SUnreclaim
> > >     347928            -6.3%     325861            -7.2%     322842   =
         -6.9%     323773        meminfo.Shmem
> > >     187447          +152.3%     472983          +151.6%     471592   =
       +152.1%     472612        meminfo.Slab
> > >    2811804            +0.0%    2811809            +0.0%    2811810   =
         -0.0%    2811803        meminfo.Unevictable
> > >  3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10   =
         +0.0%  3.436e+10        meminfo.VmallocTotal
> > >      20441         +2173.2%     464664         +2164.2%     462832   =
      +2173.5%     464731        meminfo.VmallocUsed
> > >       0.00          -100.0%       0.00          -100.0%       0.00   =
       -100.0%       0.00        meminfo.Writeback
> > >    4134235          +198.9%   12358013          +198.0%   12317956   =
       +198.8%   12353188        meminfo.max_used_kB
> > >     136.40 =C2=B1 19%      -2.9%     132.50 =C2=B1 17%      -1.0%    =
 135.00 =C2=B1 11%      +0.3%     136.80 =C2=B1 10%  proc-vmstat.direct_map=
_level2_splits
> > >       5.00 =C2=B1 65%     -53.3%       2.33 =C2=B1 58%     -46.7%    =
   2.67 =C2=B1 51%     -24.0%       3.80 =C2=B1 34%  proc-vmstat.direct_map=
_level3_splits
> > >      78032            -4.2%      74786            -5.1%      74084   =
         -4.8%      74275        proc-vmstat.nr_active_anon
> > >     533.20            -0.3%     531.83            +0.7%     537.00   =
         +0.0%     533.20        proc-vmstat.nr_active_file
> > >      76105            -0.3%      75876            +0.1%      76160   =
         +0.1%      76154        proc-vmstat.nr_anon_pages
> > >      25.60 =C2=B1  9%      +0.3%      25.67 =C2=B1  8%     +10.0%    =
  28.17 =C2=B1  9%      +4.7%      26.80 =C2=B1 15%  proc-vmstat.nr_anon_tr=
ansparent_hugepages
> > >      10.40 =C2=B1 13%      -3.8%      10.00 =C2=B1 11%     +69.9%    =
  17.67 =C2=B1 68%     -11.5%       9.20 =C2=B1  4%  proc-vmstat.nr_dirtied
> > >       3.20 =C2=B1 30%      +9.4%       3.50 =C2=B1 31%      -1.0%    =
   3.17 =C2=B1 28%     +12.5%       3.60 =C2=B1 13%  proc-vmstat.nr_dirty
> > >    3165293            -6.6%    2955608            -6.6%    2956609   =
         -6.6%    2955729        proc-vmstat.nr_dirty_background_threshold
> > >    6338326            -6.6%    5918443            -6.6%    5920448   =
         -6.6%    5918685        proc-vmstat.nr_dirty_threshold
> > >     790516            -0.7%     785001            -0.8%     784249   =
         -0.8%     784477        proc-vmstat.nr_file_pages
> > >   31911204            -6.6%   29811282            -6.5%   29821300   =
         -6.6%   29812487        proc-vmstat.nr_free_pages
> > >      85121            -3.0%      82592            -2.8%      82739   =
         -2.6%      82877        proc-vmstat.nr_inactive_anon
> > >      46.40            -0.9%      46.00            +1.7%      47.17 =
=C2=B1  4%      +2.6%      47.60 =C2=B1  3%  proc-vmstat.nr_inactive_file
> > >       9046            +0.2%       9061            -0.1%       9035   =
         -0.3%       9016        proc-vmstat.nr_kernel_stack
> > >      13656           -16.7%      11375           -16.3%      11427   =
        -16.0%      11469        proc-vmstat.nr_mapped
> > >       2.00            +0.0%       2.00            +0.0%       2.00   =
         +0.0%       2.00        proc-vmstat.nr_mlock
> > >       1003            -0.2%       1001            -0.2%       1001   =
         +0.7%       1010        proc-vmstat.nr_page_table_pages
> > >      86984            -6.3%      81468            -7.2%      80710   =
         -6.9%      80944        proc-vmstat.nr_shmem
> > >      23925            -0.3%      23853            -0.2%      23870   =
         -0.4%      23831        proc-vmstat.nr_slab_reclaimable
> > >      22933          +311.6%      94392          +310.0%      94026   =
       +311.3%      94320        proc-vmstat.nr_slab_unreclaimable
> > >     702950            +0.0%     702951            +0.0%     702952   =
         -0.0%     702950        proc-vmstat.nr_unevictable
> > >       0.00          -100.0%       0.00          -100.0%       0.00   =
       -100.0%       0.00        proc-vmstat.nr_writeback
> > >       9.20 =C2=B1 15%      -2.2%       9.00 =C2=B1 16%      -2.2%    =
   9.00 =C2=B1 12%     -10.9%       8.20 =C2=B1  4%  proc-vmstat.nr_written
> > >      78032            -4.2%      74786            -5.1%      74084   =
         -4.8%      74275        proc-vmstat.nr_zone_active_anon
> > >     533.20            -0.3%     531.83            +0.7%     537.00   =
         +0.0%     533.20        proc-vmstat.nr_zone_active_file
> > >      85121            -3.0%      82592            -2.8%      82739   =
         -2.6%      82877        proc-vmstat.nr_zone_inactive_anon
> > >      46.40            -0.9%      46.00            +1.7%      47.17 =
=C2=B1  4%      +2.6%      47.60 =C2=B1  3%  proc-vmstat.nr_zone_inactive_f=
ile
> > >     702950            +0.0%     702951            +0.0%     702952   =
         -0.0%     702950        proc-vmstat.nr_zone_unevictable
> > >       3.00 =C2=B1 42%     +11.1%       3.33 =C2=B1 28%      -5.6%    =
   2.83 =C2=B1 42%     +20.0%       3.60 =C2=B1 13%  proc-vmstat.nr_zone_wr=
ite_pending
> > >    1198017          +343.6%    5314240 =C2=B1  2%    +341.8%    52928=
95          +342.8%    5304308        proc-vmstat.numa_hit
> > >       0.00          -100.0%       0.00          -100.0%       0.00   =
       -100.0%       0.00        proc-vmstat.numa_interleave
> > >    1198053          +343.5%    5313831 =C2=B1  2%    +341.3%    52874=
76          +342.7%    5304308        proc-vmstat.numa_local
> > >     119617            -6.2%     112166            -7.2%     111048   =
         -6.8%     111519        proc-vmstat.pgactivate
> > >       0.00          -100.0%       0.00          -100.0%       0.00   =
       -100.0%       0.00        proc-vmstat.pgalloc_dma32
> > >    1872854 =C2=B1  3%    +209.6%    5799179 =C2=B1  2%    +208.3%    =
5774057          +207.9%    5767226        proc-vmstat.pgalloc_normal
> > >     208042            -1.2%     205567            -1.0%     206000   =
         -0.6%     206729        proc-vmstat.pgfault
> > >    1734145 =C2=B1  3%     -27.1%    1265016 =C2=B1  4%     -26.7%    =
1270273 =C2=B1  2%     -28.4%    1242297 =C2=B1  3%  proc-vmstat.pgfree
> > >       1008            +0.0%       1008            +0.0%       1008   =
         +0.1%       1008        proc-vmstat.pgpgin
> > >      23484 =C2=B1  4%      +9.7%      25752 =C2=B1 19%     +14.0%    =
  26763 =C2=B1 24%      -5.2%      22257 =C2=B1  3%  proc-vmstat.pgpgout
> > >       7594            +1.8%       7734 =C2=B1  3%      -0.6%       75=
46            +2.2%       7759 =C2=B1  2%  proc-vmstat.pgreuse
> > >      47.20 =C2=B1  3%      -0.1%      47.17 =C2=B1  3%      +1.7%    =
  48.00            -0.4%      47.00 =C2=B1  4%  proc-vmstat.thp_collapse_al=
loc
> > >       0.20 =C2=B1200%     -16.7%       0.17 =C2=B1223%     -16.7%    =
   0.17 =C2=B1223%      +0.0%       0.20 =C2=B1200%  proc-vmstat.thp_deferr=
ed_split_page
> > >       1.20 =C2=B1 97%     -58.3%       0.50 =C2=B1100%     +25.0%    =
   1.50 =C2=B1 74%      +0.0%       1.20 =C2=B1 97%  proc-vmstat.thp_fault_=
alloc
> > >       0.20 =C2=B1200%     -16.7%       0.17 =C2=B1223%     -16.7%    =
   0.17 =C2=B1223%      +0.0%       0.20 =C2=B1200%  proc-vmstat.thp_split_=
pmd
> > >       0.00          -100.0%       0.00          -100.0%       0.00   =
       -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
> > >     155.20            +1.1%     156.83            +2.2%     158.67 =
=C2=B1  3%      +2.7%     159.40 =C2=B1  2%  proc-vmstat.unevictable_pgs_cu=
lled
> > >       3.00            +0.0%       3.00            +0.0%       3.00   =
         +0.0%       3.00        proc-vmstat.unevictable_pgs_mlocked
> > >       3.00            +0.0%       3.00           -16.7%       2.50 =
=C2=B1 44%      +0.0%       3.00        proc-vmstat.unevictable_pgs_munlock=
ed
> > >       3.38           +16.3%       3.93 =C2=B1  2%     +15.9%       3.=
92           +13.9%       3.85        perf-stat.i.MPKI
> > >  2.722e+09            -2.8%  2.646e+09            -2.9%  2.642e+09   =
         -1.7%  2.676e+09        perf-stat.i.branch-instructions
> > >       1.51            +0.0        1.54            +0.0        1.54   =
         +0.0        1.54        perf-stat.i.branch-miss-rate%
> > >   40905304            -0.6%   40670573            -0.9%   40554409   =
         -0.0%   40900878        perf-stat.i.branch-misses
> > >       2.80 =C2=B1  3%      +9.7       12.51 =C2=B1  2%      +9.7     =
  12.54            +9.8       12.61        perf-stat.i.cache-miss-rate%
> > >    1279219 =C2=B1  2%    +405.4%    6465648          +404.7%    64560=
91          +408.2%    6501132        perf-stat.i.cache-misses
> > >   45100283           +14.9%   51811443 =C2=B1  2%     +14.7%   517118=
39           +14.3%   51548096        perf-stat.i.cache-references
> > >     191751            -4.0%     184047            -7.2%     177903 =
=C2=B1  2%     -10.9%     170818        perf-stat.i.context-switches
> > >       0.68            +2.0%       0.69            +1.3%       0.69   =
         +0.1%       0.68        perf-stat.i.cpi
> > >      36001            +0.0%      36001            +0.0%      36001   =
         -0.0%      36001        perf-stat.i.cpu-clock
> > >  9.046e+09            +0.4%   9.08e+09            -0.3%  9.021e+09   =
         -0.0%  9.043e+09        perf-stat.i.cpu-cycles
> > >     801.69 =C2=B1  3%      +5.5%     845.41 =C2=B1  8%      -7.3%    =
 743.06 =C2=B1 12%      -5.3%     759.06 =C2=B1 12%  perf-stat.i.cpu-migrat=
ions
> > >      29639 =C2=B1 13%     -95.0%       1483           -95.0%       14=
81           -95.0%       1471        perf-stat.i.cycles-between-cache-miss=
es
> > >       0.01 =C2=B1  2%      +0.0        0.01 =C2=B1  9%      +0.0     =
   0.01 =C2=B1 15%      +0.0        0.01 =C2=B1  7%  perf-stat.i.dTLB-load-=
miss-rate%
> > >     185154 =C2=B1  2%     +40.1%     259332 =C2=B1  9%     +38.0%    =
 255444 =C2=B1 14%     +24.0%     229505 =C2=B1  6%  perf-stat.i.dTLB-load-=
misses
> > >  2.909e+09            -0.2%  2.904e+09            +0.2%  2.915e+09   =
         +1.5%  2.952e+09        perf-stat.i.dTLB-loads
> > >       0.01 =C2=B1  6%      +0.0        0.01 =C2=B1  2%      +0.0     =
   0.01 =C2=B1  4%      +0.0        0.01        perf-stat.i.dTLB-store-miss=
-rate%
> > >     100360 =C2=B1  6%    +131.3%     232163          +130.1%     2309=
34 =C2=B1  3%    +126.1%     226935        perf-stat.i.dTLB-store-misses
> > >  1.714e+09            +2.8%  1.761e+09            +3.4%  1.771e+09   =
         +4.7%  1.794e+09        perf-stat.i.dTLB-stores
> > >      65.01            -2.2       62.84            -2.1       62.95   =
         -1.8       63.22        perf-stat.i.iTLB-load-miss-rate%
> > >    3401759 =C2=B1  2%     -10.4%    3046756 =C2=B1  2%     -11.2%    =
3021917 =C2=B1  3%     -10.1%    3059770        perf-stat.i.iTLB-load-misse=
s
> > >    1811706            -1.4%    1786901 =C2=B1  2%      -2.8%    17611=
99 =C2=B1  2%      -2.7%    1762394        perf-stat.i.iTLB-loads
> > >  1.333e+10            -1.7%  1.311e+10            -1.6%  1.312e+10   =
         -0.2%  1.331e+10        perf-stat.i.instructions
> > >       4008 =C2=B1  2%      +9.4%       4386 =C2=B1  2%     +10.5%    =
   4427 =C2=B1  3%     +10.7%       4438 =C2=B1  2%  perf-stat.i.instructio=
ns-per-iTLB-miss
> > >       1.47            -1.9%       1.44            -1.2%       1.46   =
         -0.1%       1.47        perf-stat.i.ipc
> > >       0.07 =C2=B1 54%    +324.4%       0.30 =C2=B1 24%    +464.6%    =
   0.40 =C2=B1 22%    +200.1%       0.21 =C2=B1 29%  perf-stat.i.major-faul=
ts
> > >       0.25            +0.4%       0.25            -0.3%       0.25   =
         -0.0%       0.25        perf-stat.i.metric.GHz
> > >      83.36          +105.3%     171.11 =C2=B1  8%     +98.1%     165.=
17 =C2=B1  3%     +94.4%     162.07 =C2=B1  3%  perf-stat.i.metric.K/sec
> > >     205.25            -0.4%     204.51            -0.1%     204.97   =
         +1.1%     207.60        perf-stat.i.metric.M/sec
> > >       1821            -1.7%       1789            -1.6%       1792   =
         -0.9%       1804        perf-stat.i.minor-faults
> > >     178289 =C2=B1  3%     +80.4%     321568 =C2=B1  3%     +78.1%    =
 317486 =C2=B1  2%     +73.8%     309946 =C2=B1  2%  perf-stat.i.node-loads
> > >     250794 =C2=B1  5%   +1108.3%    3030370 =C2=B1 10%   +1026.1%    =
2824270 =C2=B1  6%    +988.8%    2730537 =C2=B1  4%  perf-stat.i.node-store=
s
> > >       1821            -1.7%       1789            -1.6%       1792   =
         -0.9%       1804        perf-stat.i.page-faults
> > >      36001            +0.0%      36001            +0.0%      36001   =
         -0.0%      36001        perf-stat.i.task-clock
> > >       3.38           +16.8%       3.95 =C2=B1  2%     +16.5%       3.=
94           +14.5%       3.87        perf-stat.overall.MPKI
> > >       1.50            +0.0        1.54            +0.0        1.53   =
         +0.0        1.53        perf-stat.overall.branch-miss-rate%
> > >       2.84 =C2=B1  3%      +9.7       12.49 =C2=B1  3%      +9.6     =
  12.49            +9.8       12.61        perf-stat.overall.cache-miss-rat=
e%
> > >       0.68            +2.1%       0.69            +1.3%       0.69   =
         +0.2%       0.68        perf-stat.overall.cpi
> > >       7074 =C2=B1  2%     -80.1%       1404           -80.2%       13=
97           -80.3%       1391        perf-stat.overall.cycles-between-cach=
e-misses
> > >       0.01 =C2=B1  2%      +0.0        0.01 =C2=B1  9%      +0.0     =
   0.01 =C2=B1 14%      +0.0        0.01 =C2=B1  6%  perf-stat.overall.dTLB=
-load-miss-rate%
> > >       0.01 =C2=B1  6%      +0.0        0.01 =C2=B1  2%      +0.0     =
   0.01 =C2=B1  3%      +0.0        0.01        perf-stat.overall.dTLB-stor=
e-miss-rate%
> > >      65.24            -2.2       63.03            -2.1       63.16   =
         -1.8       63.45        perf-stat.overall.iTLB-load-miss-rate%
> > >       3921 =C2=B1  2%      +9.8%       4306 =C2=B1  2%     +10.9%    =
   4348 =C2=B1  3%     +10.9%       4350        perf-stat.overall.instructi=
ons-per-iTLB-miss
> > >       1.47            -2.0%       1.44            -1.3%       1.45   =
         -0.2%       1.47        perf-stat.overall.ipc
> > >  2.678e+09            -2.8%  2.604e+09            -2.9%    2.6e+09   =
         -1.7%  2.634e+09        perf-stat.ps.branch-instructions
> > >   40256213            -0.6%   40026001            -0.9%   39911551   =
         -0.0%   40251975        perf-stat.ps.branch-misses
> > >    1259329 =C2=B1  2%    +405.3%    6363306          +404.5%    63538=
71          +408.1%    6398089        perf-stat.ps.cache-misses
> > >   44384348           +14.9%   50989645 =C2=B1  2%     +14.7%   508911=
31           +14.3%   50729049        perf-stat.ps.cache-references
> > >     188703            -4.0%     181127            -7.2%     175079 =
=C2=B1  2%     -10.9%     168103        perf-stat.ps.context-switches
> > >      35429            -0.0%      35429            +0.0%      35430   =
         -0.0%      35429        perf-stat.ps.cpu-clock
> > >  8.903e+09            +0.4%  8.936e+09            -0.3%  8.878e+09   =
         -0.0%    8.9e+09        perf-stat.ps.cpu-cycles
> > >     788.95 =C2=B1  3%      +5.5%     832.00 =C2=B1  8%      -7.3%    =
 731.27 =C2=B1 12%      -5.3%     746.99 =C2=B1 12%  perf-stat.ps.cpu-migra=
tions
> > >     182239 =C2=B1  2%     +40.1%     255227 =C2=B1  9%     +38.0%    =
 251400 =C2=B1 14%     +23.9%     225874 =C2=B1  6%  perf-stat.ps.dTLB-load=
-misses
> > >  2.863e+09            -0.2%  2.858e+09            +0.2%  2.869e+09   =
         +1.5%  2.905e+09        perf-stat.ps.dTLB-loads
> > >      98768 =C2=B1  6%    +131.3%     228477          +130.1%     2272=
67 =C2=B1  3%    +126.1%     223327        perf-stat.ps.dTLB-store-misses
> > >  1.686e+09            +2.8%  1.733e+09            +3.4%  1.743e+09   =
         +4.7%  1.766e+09        perf-stat.ps.dTLB-stores
> > >    3347701 =C2=B1  2%     -10.4%    2998429 =C2=B1  2%     -11.2%    =
2973969 =C2=B1  3%     -10.1%    3011153        perf-stat.ps.iTLB-load-miss=
es
> > >    1782901            -1.4%    1758532 =C2=B1  2%      -2.8%    17332=
26 =C2=B1  2%      -2.7%    1734372        perf-stat.ps.iTLB-loads
> > >  1.312e+10            -1.6%  1.291e+10            -1.6%  1.291e+10   =
         -0.2%   1.31e+10        perf-stat.ps.instructions
> > >       0.07 =C2=B1 54%    +324.2%       0.30 =C2=B1 24%    +464.4%    =
   0.39 =C2=B1 22%    +200.0%       0.21 =C2=B1 29%  perf-stat.ps.major-fau=
lts
> > >       1792            -1.8%       1760            -1.6%       1764   =
         -0.9%       1776        perf-stat.ps.minor-faults
> > >     175514 =C2=B1  3%     +80.3%     316505 =C2=B1  3%     +78.0%    =
 312489 =C2=B1  2%     +73.8%     305064 =C2=B1  2%  perf-stat.ps.node-load=
s
> > >     246889 =C2=B1  5%   +1108.0%    2982338 =C2=B1 10%   +1025.8%    =
2779488 =C2=B1  6%    +988.4%    2687177 =C2=B1  4%  perf-stat.ps.node-stor=
es
> > >       1792            -1.7%       1761            -1.6%       1764   =
         -0.9%       1776        perf-stat.ps.page-faults
> > >      35429            -0.0%      35429            +0.0%      35430   =
         -0.0%      35429        perf-stat.ps.task-clock
> > >  8.277e+11            -1.6%  8.141e+11            -1.6%  8.146e+11   =
         -0.2%  8.262e+11        perf-stat.total.instructions
> > >       2891            +0.2%       2897            +0.0%       2892   =
         +0.1%       2894        softirqs.BLOCK
> > >      99.40            +0.4%      99.83            -0.9%      98.50   =
         +0.0%      99.40        softirqs.HI
> > >      68.40 =C2=B1  3%      +0.1%      68.50            +0.4%      68.=
67 =C2=B1  2%      +3.2%      70.60 =C2=B1  2%  softirqs.NET_RX
> > >       4.00            +0.0%       4.00            +0.0%       4.00   =
         +0.0%       4.00        softirqs.NET_TX
> > >     705640 =C2=B1  4%     +37.2%     968304 =C2=B1 28%     +16.5%    =
 822138 =C2=B1 31%      +9.5%     772471 =C2=B1 49%  softirqs.RCU
> > >     326452 =C2=B1  3%      +2.2%     333791            +1.6%     3315=
96 =C2=B1  5%      -2.5%     318406 =C2=B1  4%  softirqs.SCHED
> > >     580.40            +0.8%     585.17            +0.5%     583.17   =
         +0.7%     584.40        softirqs.TASKLET
> > >      16668 =C2=B1  2%      +0.7%      16789            -0.5%      165=
92 =C2=B1  3%      -0.6%      16567 =C2=B1  4%  softirqs.TIMER
> > >    1797799           -11.6%    1589634           -13.0%    1563259 =
=C2=B1  2%     -13.5%    1554661        interrupts.CAL:Function_call_interr=
upts
> > >     245.40            -4.8%     233.67            -5.7%     231.33   =
         -5.6%     231.60        interrupts.IWI:IRQ_work_interrupts
> > >    3191028            -0.1%    3187387            -0.1%    3187700   =
         -0.2%    3185238        interrupts.LOC:Local_timer_interrupts
> > >       0.00          -100.0%       0.00          -100.0%       0.00   =
       -100.0%       0.00        interrupts.MCP:Machine_check_polls
> > >      63377 =C2=B1  2%      +9.3%      69282 =C2=B1  4%      +5.0%    =
  66568 =C2=B1  5%      +3.8%      65768 =C2=B1  6%  interrupts.NMI:Non-mas=
kable_interrupts
> > >      63377 =C2=B1  2%      +9.3%      69282 =C2=B1  4%      +5.0%    =
  66568 =C2=B1  5%      +3.8%      65768 =C2=B1  6%  interrupts.PMI:Perform=
ance_monitoring_interrupts
> > >     193638 =C2=B1 24%     +85.7%     359502 =C2=B1 18%     +48.7%    =
 287850 =C2=B1 21%     -14.6%     165355 =C2=B1 24%  interrupts.RES:Resched=
uling_interrupts
> > >       0.00          -100.0%       0.00          -100.0%       0.00   =
       -100.0%       0.00        interrupts.RTR:APIC_ICR_read_retries
> > >     314.80 =C2=B1  6%     -12.5%     275.50 =C2=B1  7%     -14.9%    =
 267.83 =C2=B1  5%     -14.7%     268.40 =C2=B1  9%  interrupts.TLB:TLB_sho=
otdowns
> > >       0.00            +0.0%       0.00            +0.0%       0.00   =
         +0.0%       0.00        perf-sched.total_sch_delay.average.ms
> > >       1.37 =C2=B1 33%     -35.2%       0.89 =C2=B1 41%      +4.8%    =
   1.44 =C2=B1 72%     -36.2%       0.88 =C2=B1 34%  perf-sched.total_sch_d=
elay.max.ms
> > >       0.86 =C2=B1  4%      +5.5%       0.90            +8.1%       0.=
92 =C2=B1  2%      +7.4%       0.92        perf-sched.total_wait_and_delay.=
average.ms
> > >     629234            -7.2%     584017            -7.8%     580183   =
         -7.4%     582793 =C2=B1  2%  perf-sched.total_wait_and_delay.count=
.ms
> > >       4101 =C2=B1 10%      -9.9%       3696 =C2=B1 11%     -12.1%    =
   3604 =C2=B1 24%     -12.7%       3579 =C2=B1 27%  perf-sched.total_wait_=
and_delay.max.ms
> > >       0.85 =C2=B1  4%      +5.6%       0.90            +8.1%       0.=
92 =C2=B1  2%      +7.4%       0.92        perf-sched.total_wait_time.avera=
ge.ms
> > >       4101 =C2=B1 10%      -9.9%       3696 =C2=B1 11%     -12.1%    =
   3604 =C2=B1 24%     -12.7%       3579 =C2=B1 27%  perf-sched.total_wait_=
time.max.ms
> > >      42.15 =C2=B1 23%      -6.7       35.41 =C2=B1  9%      -8.5     =
  33.69 =C2=B1 11%      -9.4       32.80 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.start_secondary.secondary_startup_64_no_verify
> > >      42.15 =C2=B1 23%      -6.7       35.41 =C2=B1  9%      -8.5     =
  33.69 =C2=B1 11%      -9.4       32.80 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
> > >      42.13 =C2=B1 23%      -6.7       35.40 =C2=B1  9%      -8.5     =
  33.67 =C2=B1 11%      -9.4       32.78 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_n=
o_verify
> > >      41.50 =C2=B1 23%      -6.7       34.82 =C2=B1  9%      -8.4     =
  33.10 =C2=B1 11%      -9.3       32.24 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.seco=
ndary_startup_64_no_verify
> > >      42.92 =C2=B1 22%      -6.6       36.33 =C2=B1  8%      -8.2     =
  34.69 =C2=B1 10%      -9.0       33.89 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.secondary_startup_64_no_verify
> > >      40.93 =C2=B1 24%      -6.6       34.35 =C2=B1  9%      -8.4     =
  32.52 =C2=B1 11%      -9.3       31.68 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_=
secondary
> > >      41.24 =C2=B1 23%      -6.5       34.76 =C2=B1  9%      -8.2     =
  33.00 =C2=B1 11%      -8.9       32.35 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_=
startup_entry
> > >      36.93 =C2=B1 26%      -6.2       30.72 =C2=B1 10%      -8.2     =
  28.69 =C2=B1 12%      -8.6       28.30 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.d=
o_idle
> > >       3.27 =C2=B1 14%      -0.5        2.76 =C2=B1 12%      -0.2     =
   3.04 =C2=B1 23%      -0.6        2.65 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_ente=
r.cpuidle_idle_call.do_idle
> > >       2.96 =C2=B1 14%      -0.4        2.51 =C2=B1 13%      -0.2     =
   2.75 =C2=B1 23%      -0.6        2.40 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpui=
dle_enter_state.cpuidle_enter.cpuidle_idle_call
> > >       2.24 =C2=B1 11%      -0.3        1.92 =C2=B1  9%      -0.1     =
   2.16 =C2=B1 20%      -0.5        1.77 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sy=
svec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> > >       2.22 =C2=B1 11%      -0.3        1.90 =C2=B1  9%      -0.1     =
   2.14 =C2=B1 20%      -0.5        1.75 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_time=
r_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> > >       0.48 =C2=B1 51%      -0.3        0.18 =C2=B1141%      -0.4     =
   0.09 =C2=B1223%      -0.4        0.12 =C2=B1200%  perf-profile.calltrace=
.cycles-pp.__xstat64
> > >       1.46 =C2=B1 15%      -0.3        1.20 =C2=B1 19%      +0.0     =
   1.50 =C2=B1 25%      -0.2        1.27 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.clock_nanosleep
> > >       1.84 =C2=B1 12%      -0.3        1.58 =C2=B1  8%      -0.1     =
   1.73 =C2=B1 21%      -0.4        1.39 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_inter=
rupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> > >       0.44 =C2=B1 50%      -0.3        0.18 =C2=B1141%      -0.4     =
   0.08 =C2=B1223%      -0.4        0.00        perf-profile.calltrace.cycl=
es-pp.alloc_empty_file.path_openat.do_filp_open.do_sys_openat2.__x64_sys_op=
enat
> > >       1.30 =C2=B1 15%      -0.2        1.06 =C2=B1 19%      +0.0     =
   1.33 =C2=B1 25%      -0.2        1.14 =C2=B1 21%  perf-profile.calltrace=
.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe.clock_nanosleep
> > >       1.28 =C2=B1 15%      -0.2        1.04 =C2=B1 19%      +0.0     =
   1.31 =C2=B1 25%      -0.2        1.13 =C2=B1 21%  perf-profile.calltrace=
.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nan=
osleep.do_syscall_64
> > >       1.30 =C2=B1 15%      -0.2        1.06 =C2=B1 19%      +0.0     =
   1.33 =C2=B1 25%      -0.2        1.14 =C2=B1 21%  perf-profile.calltrace=
.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
> > >       1.36 =C2=B1 15%      -0.2        1.12 =C2=B1 19%      +0.0     =
   1.40 =C2=B1 25%      -0.2        1.19 =C2=B1 21%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> > >       1.34 =C2=B1 14%      -0.2        1.10 =C2=B1 19%      +0.0     =
   1.37 =C2=B1 25%      -0.2        1.17 =C2=B1 21%  perf-profile.calltrace=
.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.clock_nanosleep
> > >       1.36 =C2=B1 15%      -0.2        1.13 =C2=B1 19%      +0.0     =
   1.41 =C2=B1 25%      -0.2        1.21 =C2=B1 21%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> > >       1.17 =C2=B1 30%      -0.2        0.94 =C2=B1 16%      -0.2     =
   0.96 =C2=B1 18%      -0.2        0.99 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super.vfs_get_tr=
ee
> > >       0.23 =C2=B1122%      -0.2        0.00            -0.0        0.=
18 =C2=B1141%      -0.1        0.11 =C2=B1200%  perf-profile.calltrace.cycl=
es-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_seconda=
ry
> > >       0.22 =C2=B1123%      -0.2        0.00            -0.1        0.=
08 =C2=B1223%      +0.0        0.23 =C2=B1122%  perf-profile.calltrace.cycl=
es-pp.ramfs_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mo=
unt
> > >       1.17 =C2=B1 16%      -0.2        0.95 =C2=B1 20%      +0.0     =
   1.19 =C2=B1 24%      -0.1        1.05 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_=
clock_nanosleep
> > >       1.07 =C2=B1 30%      -0.2        0.86 =C2=B1 17%      -0.2     =
   0.88 =C2=B1 17%      -0.2        0.91 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.pcpu_alloc.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super
> > >       1.16 =C2=B1 16%      -0.2        0.94 =C2=B1 21%      +0.0     =
   1.18 =C2=B1 24%      -0.1        1.04 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
> > >       1.36 =C2=B1 14%      -0.2        1.16 =C2=B1 10%      -0.1     =
   1.28 =C2=B1 21%      -0.3        1.04 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec=
_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > >       0.83 =C2=B1 16%      -0.2        0.64 =C2=B1 48%      -0.0     =
   0.82 =C2=B1 47%      -0.2        0.67 =C2=B1 51%  perf-profile.calltrace=
.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.sche=
dule
> > >       1.25 =C2=B1 12%      -0.2        1.07 =C2=B1 11%      -0.1     =
   1.18 =C2=B1 19%      -0.3        0.99 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_=
interrupt.__sysvec_apic_timer_interrupt
> > >       0.66 =C2=B1 10%      -0.2        0.48 =C2=B1 46%      -0.1     =
   0.56 =C2=B1 46%      -0.1        0.59 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.perf_adjust_freq_unthr_context.perf_event_task_tick.scheduler_ti=
ck.update_process_times.tick_sched_handle
> > >       0.78 =C2=B1 16%      -0.2        0.60 =C2=B1 48%      -0.0     =
   0.76 =C2=B1 47%      -0.2        0.62 =C2=B1 52%  perf-profile.calltrace=
.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_f=
air.__schedule
> > >       1.24 =C2=B1 11%      -0.2        1.06 =C2=B1 11%      -0.1     =
   1.16 =C2=B1 19%      -0.3        0.98 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtime=
r_run_queues.hrtimer_interrupt
> > >       0.76 =C2=B1 16%      -0.2        0.58 =C2=B1 48%      -0.0     =
   0.74 =C2=B1 47%      -0.2        0.61 =C2=B1 52%  perf-profile.calltrace=
.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balan=
ce.pick_next_task_fair
> > >       0.96 =C2=B1 16%      -0.2        0.81 =C2=B1 20%      +0.0     =
   1.00 =C2=B1 27%      -0.1        0.88 =C2=B1 22%  perf-profile.calltrace=
.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nan=
osleep
> > >       0.95 =C2=B1 16%      -0.2        0.80 =C2=B1 20%      -0.0     =
   0.90 =C2=B1 47%      -0.1        0.88 =C2=B1 22%  perf-profile.calltrace=
.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.do_nanos=
leep
> > >       0.69 =C2=B1 16%      -0.1        0.54 =C2=B1 49%      -0.0     =
   0.67 =C2=B1 47%      -0.1        0.56 =C2=B1 52%  perf-profile.calltrace=
.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_ba=
lance.newidle_balance
> > >       0.98 =C2=B1 10%      -0.1        0.84 =C2=B1  9%      -0.1     =
   0.93 =C2=B1 16%      -0.2        0.82 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched=
_timer.__hrtimer_run_queues
> > >       0.22 =C2=B1122%      -0.1        0.09 =C2=B1223%      -0.1     =
   0.10 =C2=B1223%      -0.1        0.11 =C2=B1200%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath.sd_=
device_new_from_syspath
> > >       1.20 =C2=B1 23%      -0.1        1.07 =C2=B1 16%      -0.1     =
   1.14 =C2=B1  6%      +0.0        1.24 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one
> > >       0.23 =C2=B1123%      -0.1        0.10 =C2=B1223%      -0.2     =
   0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp=
.strcmp@plt
> > >       0.22 =C2=B1122%      -0.1        0.08 =C2=B1223%      -0.1     =
   0.09 =C2=B1223%      -0.1        0.10 =C2=B1200%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.device_s=
et_syspath.sd_device_new_from_syspath
> > >       3.33 =C2=B1 25%      -0.1        3.20 =C2=B1 10%      +0.1     =
   3.45 =C2=B1 11%      +0.2        3.57 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe.umount2
> > >       3.35 =C2=B1 24%      -0.1        3.22 =C2=B1 10%      +0.1     =
   3.46 =C2=B1 11%      +0.2        3.58 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.umount2
> > >       0.21 =C2=B1122%      -0.1        0.08 =C2=B1223%      -0.2     =
   0.00            -0.1        0.10 =C2=B1200%  perf-profile.calltrace.cycl=
es-pp.vfs_fstatat.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.__xstat64
> > >       0.22 =C2=B1122%      -0.1        0.09 =C2=B1223%      -0.0     =
   0.18 =C2=B1141%      +0.1        0.35 =C2=B1 81%  perf-profile.calltrace=
.cycles-pp.ramfs_symlink.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_sysc=
all_64
> > >       0.13 =C2=B1200%      -0.1        0.00            -0.0        0.=
08 =C2=B1223%      -0.1        0.00        perf-profile.calltrace.cycles-pp=
.path_lookupat.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat
> > >       0.32 =C2=B1 81%      -0.1        0.19 =C2=B1141%      -0.2     =
   0.09 =C2=B1223%      -0.3        0.00        perf-profile.calltrace.cycl=
es-pp.vsnprintf.seq_printf.show_mountinfo.seq_read_iter.vfs_read
> > >       3.07 =C2=B1 25%      -0.1        2.95 =C2=B1 10%      +0.1     =
   3.19 =C2=B1 11%      +0.2        3.29 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mo=
de_prepare.syscall_exit_to_user_mode
> > >       4.13 =C2=B1 22%      -0.1        4.02 =C2=B1  8%      +0.1     =
   4.26 =C2=B1  9%      +0.2        4.37 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.s=
yscall_exit_to_user_mode.do_syscall_64
> > >       4.25 =C2=B1 21%      -0.1        4.14 =C2=B1  8%      +0.1     =
   4.38 =C2=B1  8%      +0.3        4.50 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to=
_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > >       0.11 =C2=B1200%      -0.1        0.00            -0.1        0.=
00            -0.1        0.00        perf-profile.calltrace.cycles-pp.__fx=
stat64
> > >       0.11 =C2=B1200%      -0.1        0.00            -0.1        0.=
00            -0.1        0.00        perf-profile.calltrace.cycles-pp.do_o=
pen.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
> > >       0.11 =C2=B1200%      -0.1        0.00            -0.1        0.=
00            -0.0        0.10 =C2=B1200%  perf-profile.calltrace.cycles-pp=
.memset_orig.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree
> > >       0.11 =C2=B1200%      -0.1        0.00            -0.1        0.=
00            -0.1        0.00        perf-profile.calltrace.cycles-pp.file=
name_create.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
> > >       0.10 =C2=B1200%      -0.1        0.00            -0.0        0.=
10 =C2=B1223%      -0.1        0.00        perf-profile.calltrace.cycles-pp=
.schedule.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_sele=
ct_cpus
> > >       0.10 =C2=B1200%      -0.1        0.00            -0.1        0.=
00            -0.1        0.00        perf-profile.calltrace.cycles-pp.__do=
_sys_newfstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.devic=
e_set_syspath
> > >       0.68 =C2=B1 10%      -0.1        0.58 =C2=B1 11%      -0.1     =
   0.58 =C2=B1 46%      -0.1        0.61 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.perf_event_task_tick.scheduler_tick.update_process_times.tick_sc=
hed_handle.tick_sched_timer
> > >       9.18 =C2=B1 25%      -0.1        9.10 =C2=B1 12%      +0.4     =
   9.63 =C2=B1 11%      +0.7        9.89 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.umount2
> > >       0.36 =C2=B1 82%      -0.1        0.28 =C2=B1100%      -0.1     =
   0.30 =C2=B1100%      -0.0        0.34 =C2=B1 81%  perf-profile.calltrace=
.cycles-pp.__sync_rcu_exp_select_node_cpus.process_one_work.worker_thread.k=
thread.ret_from_fork
> > >       1.82 =C2=B1 24%      -0.1        1.75 =C2=B1 16%      -0.0     =
   1.81 =C2=B1  9%      +0.1        1.95 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one.propagate_mnt
> > >       8.78 =C2=B1 25%      -0.1        8.71 =C2=B1 12%      +0.4     =
   9.22 =C2=B1 11%      +0.7        9.47 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> > >       8.82 =C2=B1 25%      -0.1        8.75 =C2=B1 12%      +0.4     =
   9.26 =C2=B1 11%      +0.7        9.52 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.umount2
> > >       0.37 =C2=B1 81%      -0.1        0.30 =C2=B1101%      +0.0     =
   0.39 =C2=B1 73%      -0.0        0.36 =C2=B1 82%  perf-profile.calltrace=
.cycles-pp.alloc_vfsmnt.vfs_create_mount.do_new_mount.__x64_sys_mount.do_sy=
scall_64
> > >       0.24 =C2=B1122%      -0.1        0.18 =C2=B1141%      -0.2     =
   0.00            -0.1        0.11 =C2=B1200%  perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.__xstat64
> > >       0.24 =C2=B1122%      -0.1        0.18 =C2=B1141%      -0.2     =
   0.00            -0.1        0.11 =C2=B1200%  perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
> > >       0.24 =C2=B1122%      -0.1        0.17 =C2=B1141%      -0.2     =
   0.00            -0.1        0.11 =C2=B1200%  perf-profile.calltrace.cycl=
es-pp.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat=
64
> > >       0.33 =C2=B1 81%      -0.1        0.26 =C2=B1100%      +0.1     =
   0.40 =C2=B1 71%      -0.1        0.22 =C2=B1122%  perf-profile.calltrace=
.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys=
_openat
> > >       0.36 =C2=B1 83%      -0.1        0.30 =C2=B1100%      +0.1     =
   0.46 =C2=B1 46%      -0.0        0.35 =C2=B1 81%  perf-profile.calltrace=
.cycles-pp.umount_tree.do_umount.path_umount.__x64_sys_umount.do_syscall_64
> > >       0.15 =C2=B1199%      -0.1        0.10 =C2=B1223%      -0.0     =
   0.13 =C2=B1223%      +0.1        0.22 =C2=B1122%  perf-profile.calltrace=
.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sys=
vec_apic_timer_interrupt.cpuidle_enter_state
> > >       0.14 =C2=B1200%      -0.1        0.09 =C2=B1223%      -0.0     =
   0.13 =C2=B1223%      +0.1        0.21 =C2=B1122%  perf-profile.calltrace=
.cycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interru=
pt.asm_sysvec_apic_timer_interrupt
> > >       0.33 =C2=B1 82%      -0.1        0.28 =C2=B1100%      -0.1     =
   0.28 =C2=B1100%      -0.3        0.00        perf-profile.calltrace.cycl=
es-pp.path_compare
> > >       0.35 =C2=B1 81%      -0.0        0.30 =C2=B1100%      -0.3     =
   0.10 =C2=B1223%      -0.3        0.00        perf-profile.calltrace.cycl=
es-pp.seq_printf.show_mountinfo.seq_read_iter.vfs_read.ksys_read
> > >       1.89 =C2=B1 25%      -0.0        1.84 =C2=B1  9%      -0.0     =
   1.85 =C2=B1 13%      -0.1        1.76 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.op=
enat64.device_set_syspath
> > >       1.87 =C2=B1 25%      -0.0        1.83 =C2=B1  9%      -0.0     =
   1.84 =C2=B1 12%      -0.1        1.74 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.openat64
> > >       0.93 =C2=B1 23%      -0.0        0.89 =C2=B1 18%      +0.0     =
   0.93 =C2=B1 17%      +0.1        0.99 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.mntput_no_expire.namespace_unlock.do_umount.path_umount.__x64_sy=
s_umount
> > >       1.94 =C2=B1 25%      -0.0        1.90 =C2=B1  9%      -0.0     =
   1.90 =C2=B1 13%      -0.1        1.81 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath.sd_de=
vice_new_from_syspath
> > >       2.09 =C2=B1 24%      -0.0        2.05 =C2=B1 15%      +0.1     =
   2.14 =C2=B1  8%      +0.2        2.26 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt.do_ne=
w_mount
> > >       2.14 =C2=B1 23%      -0.0        2.10 =C2=B1 16%      +0.1     =
   2.20 =C2=B1  8%      +0.2        2.34 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount.__=
x64_sys_mount
> > >       2.06 =C2=B1 23%      -0.0        2.02 =C2=B1 15%      +0.1     =
   2.12 =C2=B1  8%      +0.2        2.24 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.clone_mnt.copy_tree.propagate_one.propagate_mnt.attach_recursive=
_mnt
> > >       1.92 =C2=B1 25%      -0.0        1.88 =C2=B1  9%      -0.0     =
   1.89 =C2=B1 13%      -0.1        1.80 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64.device_set=
_syspath.sd_device_new_from_syspath
> > >       0.59 =C2=B1 52%      -0.0        0.56 =C2=B1 48%      +0.1     =
   0.68 =C2=B1 17%      +0.1        0.73 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.mnt_get_count.mntput_no_expire.namespace_unlock.do_umount.path_u=
mount
> > >       0.82 =C2=B1 26%      -0.0        0.79 =C2=B1  6%      +0.1     =
   0.87 =C2=B1 14%      +0.1        0.88 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.kill_litter_super.deactivate_locked_super.cleanup_mnt.task_work_=
run.exit_to_user_mode_loop
> > >       2.20 =C2=B1 24%      -0.0        2.17 =C2=B1 16%      +0.1     =
   2.26 =C2=B1  8%      +0.2        2.39 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount.=
do_syscall_64
> > >       0.78 =C2=B1 27%      -0.0        0.76 =C2=B1 19%      +0.0     =
   0.79 =C2=B1 14%      +0.0        0.83 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.srcu_advance_state.process_srcu.process_one_work.worker_thread.k=
thread
> > >       0.11 =C2=B1200%      -0.0        0.09 =C2=B1223%      -0.0     =
   0.11 =C2=B1223%      -0.0        0.10 =C2=B1200%  perf-profile.calltrace=
.cycles-pp.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_sel=
ect_cpus.wait_rcu_exp_gp
> > >       2.07 =C2=B1 25%      -0.0        2.05 =C2=B1  9%      -0.0     =
   2.04 =C2=B1 13%      -0.1        1.96 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.openat64.device_set_syspath.sd_device_new_from_syspath
> > >       0.97 =C2=B1 22%      -0.0        0.96 =C2=B1  8%      +0.0     =
   1.00 =C2=B1  5%      -0.0        0.97 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe._=
_lxstat64
> > >       0.37 =C2=B1 82%      -0.0        0.36 =C2=B1 70%      -0.4     =
   0.00            -0.0        0.33 =C2=B1 81%  perf-profile.calltrace.cycl=
es-pp.path_lookupat.filename_lookup.user_path_at_empty.__x64_sys_umount.do_=
syscall_64
> > >       0.66 =C2=B1 54%      -0.0        0.66 =C2=B1 12%      +0.0     =
   0.71 =C2=B1 15%      +0.1        0.71 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.mnt_get_writers.cleanup_mnt.task_work_run.exit_to_user_mode_loop=
.exit_to_user_mode_prepare
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.1        0.10 =C2=B1200%  perf-profile.calltrace.cycles-pp.__fi=
lename_parentat.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
> > >       0.00            +0.0        0.00            +0.1        0.08 =
=C2=B1223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.__=
wait_for_common.__synchronize_srcu.unregister_shrinker.deactivate_locked_su=
per.cleanup_mnt
> > >       0.00            +0.0        0.00            +0.1        0.09 =
=C2=B1223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.pa=
th_lookupat.filename_lookup.user_path_at_empty.do_readlinkat.__x64_sys_read=
linkat
> > >       0.00            +0.0        0.00            +0.1        0.09 =
=C2=B1223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.fi=
lename_lookup.user_path_at_empty.do_readlinkat.__x64_sys_readlinkat.do_sysc=
all_64
> > >       0.00            +0.0        0.00            +0.1        0.10 =
=C2=B1223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.ev=
ict.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
> > >       0.00            +0.0        0.00            +0.1        0.10 =
=C2=B1223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.us=
er_path_at_empty.do_readlinkat.__x64_sys_readlinkat.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
> > >       0.99 =C2=B1 23%      +0.0        1.00 =C2=B1  8%      +0.0     =
   1.03 =C2=B1  6%      -0.0        0.99 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
> > >       1.00 =C2=B1 23%      +0.0        1.01 =C2=B1  8%      +0.0     =
   1.04 =C2=B1  6%      -0.0        1.00 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.__lxstat64
> > >       3.68 =C2=B1 16%      +0.0        3.68 =C2=B1  4%      +0.0     =
   3.72 =C2=B1  9%      -0.1        3.60 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_sysc=
all_64
> > >       1.85 =C2=B1 23%      +0.0        1.86 =C2=B1 10%      -0.2     =
   1.69 =C2=B1 12%      -0.1        1.74 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.show_mountinfo.seq_read_iter.vfs_read.ksys_read.do_syscall_64
> > >       0.65 =C2=B1 23%      +0.0        0.66 =C2=B1  5%      +0.0     =
   0.67 =C2=B1  8%      +0.0        0.68 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_pr=
epare.syscall_exit_to_user_mode
> > >       0.41 =C2=B1 81%      +0.0        0.42 =C2=B1 72%      +0.1     =
   0.52 =C2=B1 48%      +0.1        0.51 =C2=B1 51%  perf-profile.calltrace=
.cycles-pp.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
> > >       0.84 =C2=B1 22%      +0.0        0.85 =C2=B1  9%      +0.0     =
   0.86 =C2=B1  6%      -0.0        0.84 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe.__lxstat64
> > >       3.77 =C2=B1 16%      +0.0        3.78 =C2=B1  4%      +0.0     =
   3.82 =C2=B1  9%      -0.1        3.68 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
> > >       0.36 =C2=B1 81%      +0.0        0.36 =C2=B1 71%      -0.1     =
   0.28 =C2=B1100%      -0.2        0.21 =C2=B1122%  perf-profile.calltrace=
.cycles-pp.rdrand
> > >       0.99 =C2=B1 18%      +0.0        1.00 =C2=B1  4%      +0.0     =
   1.00 =C2=B1  8%      -0.0        0.98 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.__close
> > >       1.10 =C2=B1 25%      +0.0        1.11 =C2=B1  9%      +0.0     =
   1.13 =C2=B1  6%      +0.0        1.10 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.__lxstat64
> > >       1.64 =C2=B1 24%      +0.0        1.66 =C2=B1 13%      +0.1     =
   1.72 =C2=B1  8%      +0.1        1.75 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_=
64_after_hwframe.umount2
> > >       0.98 =C2=B1 18%      +0.0        1.00 =C2=B1  4%      +0.0     =
   0.99 =C2=B1  8%      -0.0        0.97 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe.__close
> > >       1.41 =C2=B1 23%      +0.0        1.42 =C2=B1  7%      -0.1     =
   1.33 =C2=B1 14%      -0.1        1.31 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.siphash24_compress
> > >       1.99 =C2=B1 24%      +0.0        2.00 =C2=B1 10%      +0.2     =
   2.15 =C2=B1 10%      +0.2        2.23 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_m=
ode_loop.exit_to_user_mode_prepare
> > >       0.83 =C2=B1 25%      +0.0        0.85 =C2=B1 18%      +0.2     =
   0.98 =C2=B1 10%      +0.1        0.93 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.strncpy_from_user.getname_flags.user_path_at_empty.__x64_sys_umo=
unt.do_syscall_64
> > >       2.53 =C2=B1 25%      +0.0        2.56 =C2=B1 15%      +0.1     =
   2.65 =C2=B1 10%      +0.3        2.81 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
> > >       1.72 =C2=B1 23%      +0.0        1.75 =C2=B1 16%      +0.1     =
   1.78 =C2=B1 13%      +0.1        1.84 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.namespace_unlock.do_umount.path_umount.__x64_sys_umount.do_sysca=
ll_64
> > >       1.00 =C2=B1 24%      +0.0        1.03 =C2=B1 18%      +0.1     =
   1.15 =C2=B1  9%      +0.1        1.11 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
> > >       0.15 =C2=B1200%      +0.0        0.18 =C2=B1142%      -0.0     =
   0.14 =C2=B1223%      +0.1        0.22 =C2=B1122%  perf-profile.calltrace=
.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_=
interrupt.cpuidle_enter_state.cpuidle_enter
> > >       0.70 =C2=B1 50%      +0.0        0.74 =C2=B1 13%      +0.1     =
   0.77 =C2=B1 14%      +0.1        0.76 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp.path_lookupat.path_openat.do_filp_open.do_sys_openat2.__x64_sys_=
openat
> > >       3.72 =C2=B1 26%      +0.0        3.76 =C2=B1 14%      +0.2     =
   3.93 =C2=B1 13%      +0.3        4.04 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.umount2
> > >       0.23 =C2=B1122%      +0.0        0.27 =C2=B1100%      +0.1     =
   0.29 =C2=B1100%      -0.0        0.22 =C2=B1122%  perf-profile.calltrace=
.cycles-pp.do_lock_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_S=
YSCALL_64_after_hwframe
> > >       3.33 =C2=B1 26%      +0.0        3.38 =C2=B1 15%      +0.2     =
   3.55 =C2=B1 13%      +0.3        3.63 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.do_umount.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
> > >       2.39 =C2=B1 23%      +0.0        2.44 =C2=B1  9%      -0.1     =
   2.25 =C2=B1 13%      -0.1        2.31 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.seq_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
> > >       1.59 =C2=B1 32%      +0.1        1.64 =C2=B1 11%      +0.1     =
   1.70 =C2=B1 12%      +0.2        1.75 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.unlink
> > >       0.88 =C2=B1 25%      +0.1        0.93 =C2=B1 15%      +0.1     =
   0.93 =C2=B1 11%      +0.1        0.96 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker=
_thread.kthread
> > >       2.58 =C2=B1 24%      +0.1        2.64 =C2=B1  9%      -0.1     =
   2.46 =C2=B1 13%      -0.1        2.47 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
> > >       0.25 =C2=B1125%      +0.1        0.31 =C2=B1100%      +0.0     =
   0.30 =C2=B1103%      +0.1        0.35 =C2=B1 81%  perf-profile.calltrace=
.cycles-pp.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_on=
e_work.worker_thread
> > >       0.88 =C2=B1 25%      +0.1        0.94 =C2=B1 16%      +0.1     =
   0.94 =C2=B1 12%      +0.1        0.97 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.wait_rcu_exp_gp.process_one_work.worker_thread.kthread.ret_from_=
fork
> > >       2.80 =C2=B1 25%      +0.1        2.86 =C2=B1  8%      -0.0     =
   2.79 =C2=B1 13%      -0.1        2.73 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.device_set_syspath.sd_device_new_from_syspath
> > >       0.87 =C2=B1 28%      +0.1        0.93 =C2=B1 15%      +0.1     =
   0.96 =C2=B1 17%      +0.1        1.00 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.process_srcu.process_one_work.worker_thread.kthread.ret_from_for=
k
> > >       5.39 =C2=B1 26%      +0.1        5.45 =C2=B1 14%      +0.3     =
   5.71 =C2=B1 11%      +0.4        5.83 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.um=
ount2
> > >       2.60 =C2=B1 24%      +0.1        2.66 =C2=B1  9%      -0.1     =
   2.49 =C2=B1 13%      -0.1        2.48 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
> > >       2.56 =C2=B1 24%      +0.1        2.63 =C2=B1  9%      -0.1     =
   2.44 =C2=B1 13%      -0.1        2.45 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.=
read
> > >       2.60 =C2=B1 24%      +0.1        2.67 =C2=B1  9%      -0.1     =
   2.50 =C2=B1 13%      -0.1        2.49 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.read
> > >       2.48 =C2=B1 28%      +0.1        2.54 =C2=B1 12%      +0.2     =
   2.64 =C2=B1 15%      +0.3        2.77 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.stress_rndstr
> > >       0.58 =C2=B1 54%      +0.1        0.65 =C2=B1 50%      +0.2     =
   0.75 =C2=B1 46%      +0.3        0.90 =C2=B1 26%  perf-profile.calltrace=
.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_i=
nit
> > >       1.23 =C2=B1 18%      +0.1        1.30 =C2=B1  4%      +0.1     =
   1.30 =C2=B1  8%      +0.0        1.27 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.__close
> > >       0.12 =C2=B1200%      +0.1        0.18 =C2=B1141%      -0.0     =
   0.12 =C2=B1223%      -0.0        0.11 =C2=B1200%  perf-profile.calltrace=
.cycles-pp.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus.wait_rcu=
_exp_gp.process_one_work
> > >       2.76 =C2=B1 17%      +0.1        2.83 =C2=B1  7%      +0.1     =
   2.88 =C2=B1  8%      +0.1        2.85 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.open64
> > >       1.34 =C2=B1 31%      +0.1        1.41 =C2=B1 11%      +0.1     =
   1.46 =C2=B1 13%      +0.2        1.50 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.unlink
> > >       1.52 =C2=B1 32%      +0.1        1.59 =C2=B1 12%      +0.1     =
   1.64 =C2=B1 12%      +0.2        1.68 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
> > >       1.20 =C2=B1 18%      +0.1        1.28 =C2=B1  4%      +0.1     =
   1.27 =C2=B1  8%      +0.1        1.25 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
> > >       1.50 =C2=B1 32%      +0.1        1.57 =C2=B1 12%      +0.1     =
   1.63 =C2=B1 12%      +0.2        1.67 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
> > >       0.62 =C2=B1 55%      +0.1        0.69 =C2=B1 20%      +0.1     =
   0.72 =C2=B1 16%      +0.1        0.75 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.try_check_zero.srcu_advance_state.process_srcu.process_one_work.=
worker_thread
> > >       0.68 =C2=B1 54%      +0.1        0.75 =C2=B1  6%      +0.2     =
   0.84 =C2=B1 14%      +0.2        0.84 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.generic_shutdown_super.kill_litter_super.deactivate_locked_super=
.cleanup_mnt.task_work_run
> > >       0.42 =C2=B1 82%      +0.1        0.50 =C2=B1 44%      -0.1     =
   0.37 =C2=B1 70%      +0.2        0.58 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.filename_lookup.user_path_at_empty.__x64_sys_umount.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
> > >       0.72 =C2=B1 24%      +0.1        0.80 =C2=B1 10%      +0.1     =
   0.79 =C2=B1  8%      +0.1        0.81 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
> > >       0.10 =C2=B1200%      +0.1        0.18 =C2=B1141%      +0.2     =
   0.34 =C2=B1 70%      +0.2        0.27 =C2=B1126%  perf-profile.calltrace=
.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_ca=
ll.do_idle
> > >       0.53 =C2=B1 82%      +0.1        0.61 =C2=B1 47%      +0.2     =
   0.74 =C2=B1 19%      +0.2        0.75 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.shmem_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_s=
ys_mount
> > >       0.00            +0.1        0.08 =C2=B1223%      +0.0        0.=
00            +0.1        0.11 =C2=B1200%  perf-profile.calltrace.cycles-pp=
.__slab_free.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
> > >       0.47 =C2=B1 50%      +0.1        0.56 =C2=B1  9%      -0.1     =
   0.38 =C2=B1 71%      -0.1        0.34 =C2=B1 82%  perf-profile.calltrace=
.cycles-pp.device_read_db_internal_filename
> > >       2.65 =C2=B1 24%      +0.1        2.73 =C2=B1  9%      -0.1     =
   2.55 =C2=B1 13%      -0.1        2.53 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.read
> > >       1.47 =C2=B1 32%      +0.1        1.56 =C2=B1 12%      +0.1     =
   1.62 =C2=B1 12%      +0.2        1.65 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.un=
link
> > >       0.69 =C2=B1 55%      +0.1        0.78 =C2=B1 11%      +0.2     =
   0.86 =C2=B1 13%      +0.2        0.89 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.propagate_mount_busy.do_umount.path_umount.__x64_sys_umount.do_s=
yscall_64
> > >       1.29 =C2=B1 31%      +0.1        1.38 =C2=B1  8%      +0.0     =
   1.30 =C2=B1 12%      +0.0        1.32 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.malloc
> > >       2.65 =C2=B1 17%      +0.1        2.74 =C2=B1  7%      +0.1     =
   2.78 =C2=B1  8%      +0.1        2.75 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
> > >       1.10 =C2=B1 29%      +0.1        1.19 =C2=B1 10%      +0.1     =
   1.16 =C2=B1  9%      +0.1        1.19 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.symlink
> > >       3.15 =C2=B1 24%      +0.1        3.24 =C2=B1  8%      +0.0     =
   3.15 =C2=B1 13%      -0.1        3.08 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.sd_device_new_from_syspath
> > >       2.63 =C2=B1 16%      +0.1        2.73 =C2=B1  6%      +0.1     =
   2.76 =C2=B1  8%      +0.1        2.73 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
> > >       0.77 =C2=B1 23%      +0.1        0.86 =C2=B1 10%      +0.1     =
   0.84 =C2=B1  7%      +0.1        0.86 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.schedule.worker_thread.kthread.ret_from_fork
> > >       2.59 =C2=B1 16%      +0.1        2.69 =C2=B1  6%      +0.1     =
   2.72 =C2=B1  9%      +0.1        2.69 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.op=
en64
> > >       2.57 =C2=B1 16%      +0.1        2.68 =C2=B1  6%      +0.1     =
   2.70 =C2=B1  9%      +0.1        2.67 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.open64
> > >       0.56 =C2=B1 53%      +0.1        0.67 =C2=B1  9%      +0.1     =
   0.68 =C2=B1  6%      +0.1        0.64 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
> > >       1.42 =C2=B1 17%      +0.1        1.53 =C2=B1  4%      +0.1     =
   1.50 =C2=B1  9%      +0.0        1.44 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.__close
> > >       0.00            +0.1        0.11 =C2=B1223%      +0.1        0.=
12 =C2=B1223%      +0.0        0.00        perf-profile.calltrace.cycles-pp=
.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
> > >       1.24 =C2=B1 29%      +0.1        1.36 =C2=B1 11%      +0.1     =
   1.30 =C2=B1 10%      +0.1        1.35 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.s=
ymlink
> > >       1.26 =C2=B1 28%      +0.1        1.38 =C2=B1 11%      +0.1     =
   1.33 =C2=B1  9%      +0.1        1.36 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.symlink
> > >       0.64 =C2=B1 54%      +0.1        0.76 =C2=B1 11%      +0.2     =
   0.82 =C2=B1 12%      +0.1        0.79 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkd=
ir
> > >       1.26 =C2=B1 29%      +0.1        1.38 =C2=B1 11%      +0.1     =
   1.32 =C2=B1  9%      +0.1        1.36 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
> > >       0.13 =C2=B1200%      +0.1        0.26 =C2=B1100%      +0.2     =
   0.35 =C2=B1 70%      +0.1        0.21 =C2=B1122%  perf-profile.calltrace=
.cycles-pp.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_sysca=
ll_64
> > >       0.66 =C2=B1 53%      +0.1        0.78 =C2=B1 16%      +0.1     =
   0.76 =C2=B1 16%      +0.2        0.81 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.stress_mwc32
> > >       0.65 =C2=B1 54%      +0.1        0.77 =C2=B1 11%      +0.2     =
   0.83 =C2=B1 13%      +0.1        0.79 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
> > >       0.44 =C2=B1 82%      +0.1        0.57 =C2=B1 47%      +0.2     =
   0.67 =C2=B1 14%      +0.2        0.69 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.do_rmdir.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.rmdir
> > >       0.65 =C2=B1 53%      +0.1        0.78 =C2=B1 12%      +0.2     =
   0.83 =C2=B1 12%      +0.1        0.80 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.mkdir
> > >       0.61 =C2=B1 53%      +0.1        0.74 =C2=B1 16%      +0.1     =
   0.75 =C2=B1 15%      +0.2        0.77 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.unregister_shrinker.deactivate_locked_super.cleanup_mnt.task_wor=
k_run.exit_to_user_mode_loop
> > >       0.38 =C2=B1 82%      +0.1        0.51 =C2=B1 45%      +0.0     =
   0.41 =C2=B1 71%      +0.2        0.58 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.__fxstat64.device_set_syspath.sd_device_new_from_syspath
> > >       1.30 =C2=B1 28%      +0.1        1.43 =C2=B1 11%      +0.1     =
   1.37 =C2=B1  9%      +0.1        1.42 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.symlink
> > >       0.60 =C2=B1 54%      +0.1        0.74 =C2=B1 18%      +0.2     =
   0.76 =C2=B1 16%      +0.2        0.78 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
> > >       0.40 =C2=B1 81%      +0.1        0.54 =C2=B1 46%      +0.1     =
   0.54 =C2=B1 48%      +0.2        0.64 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.__synchronize_srcu.unregister_shrinker.deactivate_locked_super.c=
leanup_mnt.task_work_run
> > >       0.60 =C2=B1 54%      +0.1        0.74 =C2=B1 18%      +0.2     =
   0.77 =C2=B1 15%      +0.2        0.78 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.rmdir
> > >       0.68 =C2=B1 53%      +0.1        0.82 =C2=B1 12%      +0.2     =
   0.88 =C2=B1 11%      +0.2        0.84 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.mkdir
> > >       0.70 =C2=B1 54%      +0.2        0.85 =C2=B1 14%      +0.2     =
   0.85 =C2=B1 17%      +0.2        0.85 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_=
sys_openat
> > >       0.63 =C2=B1 54%      +0.2        0.80 =C2=B1 18%      +0.2     =
   0.81 =C2=B1 15%      +0.2        0.82 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.rmdir
> > >       0.61 =C2=B1 53%      +0.2        0.78 =C2=B1 24%      +0.2     =
   0.79 =C2=B1 46%      +0.3        0.96 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.arch_call_=
rest_init
> > >       0.63 =C2=B1 55%      +0.2        0.80 =C2=B1 15%      +0.2     =
   0.80 =C2=B1  8%      +0.2        0.80 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.synchronize_rcu_expedited.namespace_unlock.do_umount.path_umount=
.__x64_sys_umount
> > >       0.00            +0.2        0.17 =C2=B1141%      +0.0        0.=
00            +0.2        0.21 =C2=B1122%  perf-profile.calltrace.cycles-pp=
.kmem_cache_free.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
> > >       0.60 =C2=B1 51%      +0.2        0.78 =C2=B1  3%      +0.2     =
   0.78 =C2=B1 13%      +0.1        0.70 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.do_readlinkat.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe.readlinkat
> > >       0.48 =C2=B1 82%      +0.2        0.66 =C2=B1 14%      +0.2     =
   0.68 =C2=B1 18%      +0.2        0.67 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_op=
enat2
> > >       0.61 =C2=B1 51%      +0.2        0.79 =C2=B1  3%      +0.2     =
   0.78 =C2=B1 12%      +0.1        0.71 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.readlinkat
> > >       0.61 =C2=B1 51%      +0.2        0.80 =C2=B1  3%      +0.2     =
   0.79 =C2=B1 12%      +0.1        0.72 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.readlinkat
> > >       0.61 =C2=B1 51%      +0.2        0.80 =C2=B1  3%      +0.2     =
   0.78 =C2=B1 13%      +0.1        0.72 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
> > >       0.49 =C2=B1 82%      +0.2        0.68 =C2=B1 12%      +0.2     =
   0.70 =C2=B1 14%      +0.3        0.76 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.mnt_get_count.propagate_mount_busy.do_umount.path_umount.__x64_s=
ys_umount
> > >       0.00            +0.2        0.19 =C2=B1141%      +0.0        0.=
00            +0.2        0.25 =C2=B1122%  perf-profile.calltrace.cycles-pp=
.delayed_free_vfsmnt.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
> > >       0.48 =C2=B1 81%      +0.2        0.68 =C2=B1 13%      +0.3     =
   0.74 =C2=B1 13%      +0.2        0.71 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.do_mkdirat.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_=
hwframe.mkdir
> > >       0.62 =C2=B1 50%      +0.2        0.83 =C2=B1  4%      +0.2     =
   0.82 =C2=B1 12%      +0.1        0.74 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.readlinkat
> > >       0.70 =C2=B1 53%      +0.2        0.92 =C2=B1 19%      +0.3     =
   1.00 =C2=B1 22%      +0.4        1.10 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel.x86=
_64_start_reservations
> > >       0.70 =C2=B1 53%      +0.2        0.92 =C2=B1 19%      +0.3     =
   1.00 =C2=B1 22%      +0.4        1.10 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp.x86_64_start_kernel.secondary_startup_64_no_verify
> > >       0.70 =C2=B1 53%      +0.2        0.92 =C2=B1 19%      +0.3     =
   1.00 =C2=B1 22%      +0.4        1.10 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_=
64_no_verify
> > >       0.70 =C2=B1 53%      +0.2        0.92 =C2=B1 19%      +0.3     =
   1.00 =C2=B1 22%      +0.4        1.10 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secon=
dary_startup_64_no_verify
> > >       0.70 =C2=B1 53%      +0.2        0.92 =C2=B1 19%      +0.3     =
   1.00 =C2=B1 22%      +0.4        1.10 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_6=
4_start_kernel.secondary_startup_64_no_verify
> > >       0.70 =C2=B1 53%      +0.2        0.92 =C2=B1 19%      +0.3     =
   1.00 =C2=B1 22%      +0.4        1.10 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservat=
ions.x86_64_start_kernel
> > >       0.70 =C2=B1 53%      +0.2        0.92 =C2=B1 19%      +0.3     =
   1.00 =C2=B1 22%      +0.4        1.10 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init.start_ke=
rnel
> > >       0.47 =C2=B1 82%      +0.2        0.70 =C2=B1  8%      +0.2     =
   0.68 =C2=B1 11%      +0.3        0.73 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_S=
YSCALL_64_after_hwframe
> > >       0.49 =C2=B1 82%      +0.2        0.73 =C2=B1 17%      +0.3     =
   0.75 =C2=B1 15%      +0.3        0.76 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmd=
ir
> > >       3.47 =C2=B1 25%      +0.6        4.06 =C2=B1 14%      +0.7     =
   4.18 =C2=B1 11%      +0.8        4.22 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
> > >       4.38 =C2=B1 24%      +0.7        5.08 =C2=B1 13%      +0.8     =
   5.17 =C2=B1 10%      +0.9        5.25 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.worker_thread.kthread.ret_from_fork
> > >       0.32 =C2=B1 81%      +0.7        1.04 =C2=B1 90%      +0.3     =
   0.64 =C2=B1113%      +0.7        1.04 =C2=B1 97%  perf-profile.calltrace=
.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
> > >       0.00            +0.9        0.94 =C2=B1 15%      +0.9        0.=
87 =C2=B1 14%      +0.9        0.87 =C2=B1 11%  perf-profile.calltrace.cycl=
es-pp.memset_orig.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc
> > >       0.00            +1.0        0.97 =C2=B1 92%      +0.6        0.=
57 =C2=B1113%      +1.0        0.98 =C2=B1 98%  perf-profile.calltrace.cycl=
es-pp.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn
> > >       0.00            +1.0        0.98 =C2=B1 92%      +0.6        0.=
58 =C2=B1113%      +1.0        0.99 =C2=B1 98%  perf-profile.calltrace.cycl=
es-pp.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread
> > >       0.00            +1.0        1.00 =C2=B1 92%      +0.6        0.=
58 =C2=B1113%      +1.0        1.00 =C2=B1 98%  perf-profile.calltrace.cycl=
es-pp.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
> > >       0.00            +1.0        1.00 =C2=B1 92%      +0.6        0.=
58 =C2=B1113%      +1.0        1.00 =C2=B1 98%  perf-profile.calltrace.cycl=
es-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
> > >       4.92 =C2=B1 21%      +1.4        6.32 =C2=B1 11%      +1.2     =
   6.09 =C2=B1  9%      +1.5        6.46 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp.ret_from_fork
> > >       4.92 =C2=B1 21%      +1.4        6.32 =C2=B1 11%      +1.2     =
   6.09 =C2=B1  9%      +1.5        6.46 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp.kthread.ret_from_fork
> > >       0.00            +1.5        1.45 =C2=B1 50%      +2.1        2.=
08 =C2=B1 21%      +2.3        2.34 =C2=B1  4%  perf-profile.calltrace.cycl=
es-pp.pcpu_find_block_fit.pcpu_alloc.init_srcu_struct_fields.alloc_super.sg=
et_fc
> > >       0.00            +4.3        4.27 =C2=B1 29%      +5.5        5.=
47 =C2=B1 17%      +6.0        5.96 =C2=B1  5%  perf-profile.calltrace.cycl=
es-pp.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super
> > >       2.84 =C2=B1 30%      +4.6        7.44 =C2=B1 18%      +6.1     =
   8.92 =C2=B1 16%      +6.6        9.42 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount.do_sysca=
ll_64
> > >       2.85 =C2=B1 30%      +4.6        7.46 =C2=B1 18%      +6.1     =
   8.94 =C2=B1 16%      +6.6        9.44 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
> > >       7.97 =C2=B1 28%      +4.7       12.64 =C2=B1 14%      +6.3     =
  14.28 =C2=B1 13%      +7.1       15.02 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.mount
> > >       7.93 =C2=B1 28%      +4.7       12.60 =C2=B1 14%      +6.3     =
  14.25 =C2=B1 13%      +7.0       14.98 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mou=
nt
> > >       1.56 =C2=B1 29%      +4.7        6.23 =C2=B1 21%      +6.0     =
   7.55 =C2=B1 16%      +6.5        8.04 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.alloc_super.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount
> > >       7.95 =C2=B1 28%      +4.7       12.62 =C2=B1 14%      +6.3     =
  14.27 =C2=B1 13%      +7.0       15.00 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
> > >       8.02 =C2=B1 28%      +4.7       12.69 =C2=B1 14%      +6.3     =
  14.34 =C2=B1 13%      +7.1       15.07 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.mount
> > >       1.68 =C2=B1 30%      +4.7        6.36 =C2=B1 21%      +6.0     =
   7.72 =C2=B1 16%      +6.5        8.20 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
> > >       7.20 =C2=B1 28%      +4.7       11.89 =C2=B1 15%      +6.3     =
  13.52 =C2=B1 13%      +7.0       14.19 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.mount
> > >       0.00            +4.9        4.90 =C2=B1 25%      +6.2        6.=
17 =C2=B1 16%      +6.6        6.61 =C2=B1  5%  perf-profile.calltrace.cycl=
es-pp.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super.vfs_get_tre=
e
> > >      42.15 =C2=B1 23%      -6.7       35.41 =C2=B1  9%      -8.5     =
  33.69 =C2=B1 11%      -9.4       32.80 =C2=B1  8%  perf-profile.children.=
cycles-pp.start_secondary
> > >      42.92 =C2=B1 22%      -6.6       36.33 =C2=B1  8%      -8.2     =
  34.69 =C2=B1 10%      -9.0       33.89 =C2=B1  8%  perf-profile.children.=
cycles-pp.secondary_startup_64_no_verify
> > >      42.92 =C2=B1 22%      -6.6       36.33 =C2=B1  8%      -8.2     =
  34.69 =C2=B1 10%      -9.0       33.89 =C2=B1  8%  perf-profile.children.=
cycles-pp.cpu_startup_entry
> > >      42.91 =C2=B1 22%      -6.6       36.32 =C2=B1  8%      -8.2     =
  34.68 =C2=B1 10%      -9.0       33.89 =C2=B1  8%  perf-profile.children.=
cycles-pp.do_idle
> > >      42.18 =C2=B1 23%      -6.6       35.61 =C2=B1  9%      -8.2     =
  33.97 =C2=B1 11%      -9.0       33.21 =C2=B1  8%  perf-profile.children.=
cycles-pp.cpuidle_idle_call
> > >      41.57 =C2=B1 23%      -6.5       35.07 =C2=B1  9%      -8.2     =
  33.34 =C2=B1 11%      -9.0       32.58 =C2=B1  8%  perf-profile.children.=
cycles-pp.cpuidle_enter_state
> > >      41.57 =C2=B1 23%      -6.5       35.08 =C2=B1  9%      -8.2     =
  33.35 =C2=B1 11%      -9.0       32.58 =C2=B1  8%  perf-profile.children.=
cycles-pp.cpuidle_enter
> > >      37.09 =C2=B1 26%      -6.1       30.96 =C2=B1 10%      -8.1     =
  28.98 =C2=B1 12%      -8.5       28.64 =C2=B1  8%  perf-profile.children.=
cycles-pp.intel_idle
> > >       5.40 =C2=B1  7%      -1.0        4.35 =C2=B1 11%      -0.4     =
   5.01 =C2=B1 14%      -1.0        4.37 =C2=B1 16%  perf-profile.children.=
cycles-pp.asm_sysvec_apic_timer_interrupt
> > >       5.01 =C2=B1  6%      -1.0        4.00 =C2=B1 12%      -0.4     =
   4.64 =C2=B1 15%      -1.0        4.02 =C2=B1 17%  perf-profile.children.=
cycles-pp.sysvec_apic_timer_interrupt
> > >       2.16 =C2=B1 21%      -0.7        1.51 =C2=B1 51%      -0.3     =
   1.87 =C2=B1 41%      -0.6        1.55 =C2=B1 61%  perf-profile.children.=
cycles-pp.__irq_exit_rcu
> > >       2.51 =C2=B1 11%      -0.3        2.19 =C2=B1  8%      -0.1     =
   2.46 =C2=B1 16%      -0.4        2.11 =C2=B1  9%  perf-profile.children.=
cycles-pp.hrtimer_interrupt
> > >       2.53 =C2=B1 11%      -0.3        2.21 =C2=B1  8%      -0.0     =
   2.48 =C2=B1 16%      -0.4        2.13 =C2=B1  9%  perf-profile.children.=
cycles-pp.__sysvec_apic_timer_interrupt
> > >       1.47 =C2=B1 15%      -0.3        1.20 =C2=B1 19%      +0.0     =
   1.51 =C2=B1 25%      -0.2        1.29 =C2=B1 20%  perf-profile.children.=
cycles-pp.clock_nanosleep
> > >       2.09 =C2=B1 12%      -0.2        1.85 =C2=B1  7%      -0.1     =
   2.02 =C2=B1 16%      -0.4        1.72 =C2=B1  7%  perf-profile.children.=
cycles-pp.__hrtimer_run_queues
> > >       1.30 =C2=B1 15%      -0.2        1.06 =C2=B1 19%      +0.0     =
   1.33 =C2=B1 25%      -0.2        1.14 =C2=B1 21%  perf-profile.children.=
cycles-pp.hrtimer_nanosleep
> > >       1.31 =C2=B1 15%      -0.2        1.07 =C2=B1 19%      +0.0     =
   1.34 =C2=B1 25%      -0.2        1.15 =C2=B1 21%  perf-profile.children.=
cycles-pp.common_nsleep
> > >       1.28 =C2=B1 15%      -0.2        1.04 =C2=B1 19%      +0.0     =
   1.31 =C2=B1 25%      -0.2        1.13 =C2=B1 21%  perf-profile.children.=
cycles-pp.do_nanosleep
> > >       1.34 =C2=B1 14%      -0.2        1.10 =C2=B1 19%      +0.0     =
   1.37 =C2=B1 25%      -0.2        1.17 =C2=B1 21%  perf-profile.children.=
cycles-pp.__x64_sys_clock_nanosleep
> > >       1.18 =C2=B1 30%      -0.2        0.94 =C2=B1 16%      -0.2     =
   0.97 =C2=B1 18%      -0.2        1.00 =C2=B1 11%  perf-profile.children.=
cycles-pp.__percpu_init_rwsem
> > >       1.56 =C2=B1 13%      -0.2        1.38 =C2=B1  8%      -0.1     =
   1.51 =C2=B1 17%      -0.3        1.30 =C2=B1  8%  perf-profile.children.=
cycles-pp.tick_sched_timer
> > >       1.43 =C2=B1 11%      -0.2        1.26 =C2=B1  9%      -0.1     =
   1.38 =C2=B1 15%      -0.2        1.21 =C2=B1  7%  perf-profile.children.=
cycles-pp.tick_sched_handle
> > >       1.42 =C2=B1 11%      -0.2        1.25 =C2=B1  9%      -0.1     =
   1.37 =C2=B1 15%      -0.2        1.20 =C2=B1  7%  perf-profile.children.=
cycles-pp.update_process_times
> > >       1.34 =C2=B1 15%      -0.2        1.18 =C2=B1 17%      +0.1     =
   1.41 =C2=B1 27%      -0.1        1.26 =C2=B1 17%  perf-profile.children.=
cycles-pp.newidle_balance
> > >       1.26 =C2=B1 14%      -0.1        1.12 =C2=B1 17%      +0.0     =
   1.31 =C2=B1 26%      -0.1        1.15 =C2=B1 16%  perf-profile.children.=
cycles-pp.load_balance
> > >       1.12 =C2=B1 15%      -0.1        0.98 =C2=B1 18%      +0.0     =
   1.17 =C2=B1 25%      -0.1        1.02 =C2=B1 17%  perf-profile.children.=
cycles-pp.update_sd_lb_stats
> > >       1.15 =C2=B1 15%      -0.1        1.01 =C2=B1 18%      +0.0     =
   1.19 =C2=B1 26%      -0.1        1.04 =C2=B1 17%  perf-profile.children.=
cycles-pp.find_busiest_group
> > >       4.71 =C2=B1 20%      -0.1        4.57 =C2=B1  7%      +0.1     =
   4.83 =C2=B1  7%      +0.2        4.91 =C2=B1  7%  perf-profile.children.=
cycles-pp.syscall_exit_to_user_mode
> > >       1.13 =C2=B1  9%      -0.1        1.00 =C2=B1  8%      -0.0     =
   1.09 =C2=B1 12%      -0.1        0.99 =C2=B1  8%  perf-profile.children.=
cycles-pp.scheduler_tick
> > >       4.32 =C2=B1 21%      -0.1        4.19 =C2=B1  7%      +0.1     =
   4.44 =C2=B1  8%      +0.2        4.54 =C2=B1  7%  perf-profile.children.=
cycles-pp.task_work_run
> > >       1.00 =C2=B1 16%      -0.1        0.88 =C2=B1 19%      +0.0     =
   1.03 =C2=B1 25%      -0.1        0.92 =C2=B1 18%  perf-profile.children.=
cycles-pp.update_sg_lb_stats
> > >       3.08 =C2=B1 25%      -0.1        2.96 =C2=B1 10%      +0.1     =
   3.20 =C2=B1 11%      +0.2        3.30 =C2=B1  9%  perf-profile.children.=
cycles-pp.cleanup_mnt
> > >       0.79 =C2=B1 26%      -0.1        0.68 =C2=B1 11%      -0.0     =
   0.74 =C2=B1 15%      -0.0        0.76 =C2=B1  8%  perf-profile.children.=
cycles-pp.mnt_get_writers
> > >       0.69 =C2=B1 18%      -0.1        0.60 =C2=B1 13%      -0.1     =
   0.60 =C2=B1 12%      -0.1        0.57 =C2=B1 10%  perf-profile.children.=
cycles-pp.path_init
> > >       0.49 =C2=B1 19%      -0.1        0.40 =C2=B1 10%      -0.0     =
   0.48 =C2=B1 19%      +0.0        0.50 =C2=B1 14%  perf-profile.children.=
cycles-pp.menu_select
> > >       0.59 =C2=B1 33%      -0.1        0.50 =C2=B1 17%      -0.0     =
   0.57 =C2=B1 12%      -0.0        0.57 =C2=B1 14%  perf-profile.children.=
cycles-pp.memcg_list_lru_alloc
> > >       0.81 =C2=B1 31%      -0.1        0.72 =C2=B1 14%      -0.0     =
   0.80 =C2=B1 13%      -0.0        0.79 =C2=B1 13%  perf-profile.children.=
cycles-pp.slab_pre_alloc_hook
> > >       0.77 =C2=B1  8%      -0.1        0.69 =C2=B1 10%      -0.0     =
   0.76 =C2=B1 15%      -0.1        0.72 =C2=B1  8%  perf-profile.children.=
cycles-pp.perf_event_task_tick
> > >       0.27 =C2=B1 19%      -0.1        0.19 =C2=B1 25%      -0.1     =
   0.20 =C2=B1 23%      -0.1        0.17 =C2=B1 19%  perf-profile.children.=
cycles-pp.ep_poll
> > >       0.21 =C2=B1 37%      -0.1        0.14 =C2=B1 24%      -0.0     =
   0.21 =C2=B1 33%      +0.0        0.23 =C2=B1 30%  perf-profile.children.=
cycles-pp.tick_nohz_get_sleep_length
> > >       9.23 =C2=B1 26%      -0.1        9.16 =C2=B1 12%      +0.5     =
   9.68 =C2=B1 11%      +0.7        9.94 =C2=B1 10%  perf-profile.children.=
cycles-pp.umount2
> > >       0.28 =C2=B1 21%      -0.1        0.20 =C2=B1 24%      -0.1     =
   0.22 =C2=B1 23%      -0.1        0.19 =C2=B1 16%  perf-profile.children.=
cycles-pp.do_epoll_wait
> > >       0.76 =C2=B1  8%      -0.1        0.68 =C2=B1 10%      -0.0     =
   0.75 =C2=B1 16%      -0.0        0.71 =C2=B1  7%  perf-profile.children.=
cycles-pp.perf_adjust_freq_unthr_context
> > >       0.34 =C2=B1 18%      -0.1        0.26 =C2=B1 25%      -0.1     =
   0.28 =C2=B1 21%      -0.1        0.24 =C2=B1 12%  perf-profile.children.=
cycles-pp.epoll_wait
> > >       1.94 =C2=B1 15%      -0.1        1.87 =C2=B1 10%      +0.1     =
   2.07 =C2=B1 18%      -0.0        1.92 =C2=B1  8%  perf-profile.children.=
cycles-pp.pick_next_task_fair
> > >       0.28 =C2=B1 19%      -0.1        0.21 =C2=B1 26%      -0.1     =
   0.22 =C2=B1 23%      -0.1        0.19 =C2=B1 16%  perf-profile.children.=
cycles-pp.__x64_sys_epoll_wait
> > >       2.33 =C2=B1 24%      -0.1        2.27 =C2=B1 16%      +0.0     =
   2.35 =C2=B1 11%      +0.2        2.49 =C2=B1 15%  perf-profile.children.=
cycles-pp.alloc_vfsmnt
> > >       0.28 =C2=B1 10%      -0.1        0.22 =C2=B1 21%      +0.0     =
   0.28 =C2=B1 17%      -0.0        0.24 =C2=B1 20%  perf-profile.children.=
cycles-pp.clockevents_program_event
> > >       0.14 =C2=B1 56%      -0.1        0.08 =C2=B1 23%      +0.0     =
   0.16 =C2=B1 39%      +0.0        0.18 =C2=B1 36%  perf-profile.children.=
cycles-pp.tick_nohz_next_event
> > >       0.47 =C2=B1 20%      -0.1        0.42 =C2=B1 12%      -0.0     =
   0.42 =C2=B1 17%      -0.0        0.45 =C2=B1  5%  perf-profile.children.=
cycles-pp.__wake_up_common_lock
> > >       1.18 =C2=B1 23%      -0.1        1.12 =C2=B1 16%      +0.0     =
   1.20 =C2=B1 16%      +0.1        1.26 =C2=B1 11%  perf-profile.children.=
cycles-pp.mntput_no_expire
> > >       1.17 =C2=B1 30%      -0.1        1.12 =C2=B1 12%      +0.0     =
   1.21 =C2=B1 13%      +0.0        1.20 =C2=B1 14%  perf-profile.children.=
cycles-pp.kmem_cache_alloc_lru
> > >       0.33 =C2=B1 21%      -0.0        0.28 =C2=B1  8%      -0.0     =
   0.31 =C2=B1 10%      -0.0        0.29 =C2=B1 13%  perf-profile.children.=
cycles-pp.dequeue_entity
> > >       0.16 =C2=B1 22%      -0.0        0.11 =C2=B1 38%      -0.0     =
   0.11 =C2=B1 35%      -0.1        0.09 =C2=B1 37%  perf-profile.children.=
cycles-pp.schedule_hrtimeout_range_clock
> > >       0.08 =C2=B1 27%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.07 =C2=B1 23%      -0.0        0.04 =C2=B1 87%  perf-profile.children.=
cycles-pp.llist_reverse_order
> > >       0.39 =C2=B1 59%      -0.0        0.34 =C2=B1 64%      -0.1     =
   0.34 =C2=B1 87%      -0.0        0.38 =C2=B1 64%  perf-profile.children.=
cycles-pp.ktime_get
> > >       0.06 =C2=B1 56%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.03 =C2=B1102%      -0.0        0.02 =C2=B1122%  perf-profile.children.=
cycles-pp._ext4_show_options
> > >       0.56 =C2=B1 29%      -0.0        0.51 =C2=B1 11%      -0.1     =
   0.48 =C2=B1 10%      -0.1        0.50 =C2=B1 16%  perf-profile.children.=
cycles-pp.__xstat64
> > >       0.20 =C2=B1 23%      -0.0        0.15 =C2=B1 23%      -0.0     =
   0.15 =C2=B1 30%      -0.1        0.15 =C2=B1 20%  perf-profile.children.=
cycles-pp.__sys_recvmsg
> > >       0.42 =C2=B1 32%      -0.0        0.37 =C2=B1 18%      +0.0     =
   0.44 =C2=B1 12%      +0.0        0.45 =C2=B1 21%  perf-profile.children.=
cycles-pp.ramfs_fill_super
> > >       0.18 =C2=B1 11%      -0.0        0.13 =C2=B1 16%      -0.0     =
   0.15 =C2=B1 23%      -0.0        0.15 =C2=B1 32%  perf-profile.children.=
cycles-pp.read_tsc
> > >       1.23 =C2=B1 20%      -0.0        1.19 =C2=B1  8%      +0.1     =
   1.29 =C2=B1  9%      +0.0        1.28 =C2=B1 11%  perf-profile.children.=
cycles-pp.dput
> > >       0.53 =C2=B1 27%      -0.0        0.49 =C2=B1 16%      -0.0     =
   0.49 =C2=B1  8%      -0.1        0.47 =C2=B1 12%  perf-profile.children.=
cycles-pp.strcmp@plt
> > >       0.13 =C2=B1 36%      -0.0        0.08 =C2=B1 13%      -0.0     =
   0.09 =C2=B1 19%      -0.0        0.08 =C2=B1 15%  perf-profile.children.=
cycles-pp.pcpu_block_refresh_hint
> > >       0.28 =C2=B1  8%      -0.0        0.24 =C2=B1 19%      -0.0     =
   0.27 =C2=B1 19%      -0.0        0.25 =C2=B1 12%  perf-profile.children.=
cycles-pp.__intel_pmu_enable_all
> > >       0.54 =C2=B1 29%      -0.0        0.50 =C2=B1 14%      +0.0     =
   0.56 =C2=B1 14%      +0.0        0.56 =C2=B1 18%  perf-profile.children.=
cycles-pp.__dentry_kill
> > >       1.56 =C2=B1 24%      -0.0        1.52 =C2=B1 14%      +0.0     =
   1.60 =C2=B1 15%      +0.2        1.74 =C2=B1 10%  perf-profile.children.=
cycles-pp.mnt_get_count
> > >       0.60 =C2=B1 30%      -0.0        0.56 =C2=B1 13%      +0.0     =
   0.62 =C2=B1 15%      +0.0        0.62 =C2=B1 17%  perf-profile.children.=
cycles-pp.dentry_kill
> > >       0.18 =C2=B1 21%      -0.0        0.14 =C2=B1 26%      -0.0     =
   0.14 =C2=B1 29%      -0.0        0.14 =C2=B1 20%  perf-profile.children.=
cycles-pp.___sys_recvmsg
> > >       2.09 =C2=B1 23%      -0.0        2.05 =C2=B1 15%      +0.1     =
   2.14 =C2=B1  8%      +0.2        2.26 =C2=B1 14%  perf-profile.children.=
cycles-pp.copy_tree
> > >       0.13 =C2=B1 17%      -0.0        0.09 =C2=B1 23%      -0.0     =
   0.11 =C2=B1 23%      -0.0        0.09 =C2=B1 15%  perf-profile.children.=
cycles-pp.ct_kernel_exit_state
> > >       0.28 =C2=B1 22%      -0.0        0.24 =C2=B1 15%      -0.0     =
   0.24 =C2=B1 16%      -0.0        0.25 =C2=B1  5%  perf-profile.children.=
cycles-pp.__wake_up_common
> > >       0.16 =C2=B1 26%      -0.0        0.12 =C2=B1 27%      -0.0     =
   0.14 =C2=B1 29%      -0.0        0.12 =C2=B1 19%  perf-profile.children.=
cycles-pp.____sys_recvmsg
> > >       2.06 =C2=B1 23%      -0.0        2.02 =C2=B1 15%      +0.1     =
   2.12 =C2=B1  8%      +0.2        2.24 =C2=B1 15%  perf-profile.children.=
cycles-pp.clone_mnt
> > >       0.21 =C2=B1 13%      -0.0        0.17 =C2=B1 22%      +0.0     =
   0.22 =C2=B1 20%      -0.0        0.19 =C2=B1 21%  perf-profile.children.=
cycles-pp.lapic_next_deadline
> > >       0.16 =C2=B1 25%      -0.0        0.12 =C2=B1 28%      -0.0     =
   0.13 =C2=B1 28%      -0.0        0.12 =C2=B1 21%  perf-profile.children.=
cycles-pp.sock_recvmsg
> > >       0.08 =C2=B1 18%      -0.0        0.04 =C2=B1 72%      -0.0     =
   0.05 =C2=B1 73%      -0.0        0.05 =C2=B1 57%  perf-profile.children.=
cycles-pp.__pthread_mutex_unlock_usercnt
> > >       0.13 =C2=B1 18%      -0.0        0.09 =C2=B1 27%      -0.0     =
   0.11 =C2=B1 24%      -0.0        0.09 =C2=B1  8%  perf-profile.children.=
cycles-pp.ct_kernel_enter
> > >       1.20 =C2=B1 15%      -0.0        1.16 =C2=B1  6%      -0.0     =
   1.18 =C2=B1  8%      -0.0        1.15 =C2=B1  9%  perf-profile.children.=
cycles-pp.kmem_cache_alloc
> > >       0.14 =C2=B1 16%      -0.0        0.10 =C2=B1 27%      -0.0     =
   0.11 =C2=B1 23%      -0.0        0.10 =C2=B1 10%  perf-profile.children.=
cycles-pp.ct_idle_exit
> > >       0.24 =C2=B1 10%      -0.0        0.20 =C2=B1 12%      -0.0     =
   0.20 =C2=B1 19%      -0.0        0.20 =C2=B1 11%  perf-profile.children.=
cycles-pp.update_blocked_averages
> > >       2.14 =C2=B1 23%      -0.0        2.11 =C2=B1 16%      +0.1     =
   2.20 =C2=B1  8%      +0.2        2.34 =C2=B1 15%  perf-profile.children.=
cycles-pp.propagate_one
> > >       0.21 =C2=B1 34%      -0.0        0.18 =C2=B1 10%      -0.0     =
   0.19 =C2=B1 13%      -0.0        0.19 =C2=B1 20%  perf-profile.children.=
cycles-pp.up_read
> > >       0.74 =C2=B1 27%      -0.0        0.71 =C2=B1 20%      +0.0     =
   0.74 =C2=B1 15%      +0.0        0.79 =C2=B1 14%  perf-profile.children.=
cycles-pp.try_check_zero
> > >       0.07 =C2=B1 61%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.05 =C2=B1 76%      +0.0        0.07 =C2=B1 18%  perf-profile.children.=
cycles-pp.xas_find
> > >       0.25 =C2=B1 29%      -0.0        0.21 =C2=B1 18%      -0.1     =
   0.19 =C2=B1 19%      -0.1        0.19 =C2=B1 22%  perf-profile.children.=
cycles-pp.__sys_sendmsg
> > >       0.03 =C2=B1 82%      -0.0        0.00            +0.0        0.=
04 =C2=B1102%      +0.0        0.05 =C2=B1 54%  perf-profile.children.cycle=
s-pp.idr_alloc
> > >       0.05 =C2=B1 53%      -0.0        0.02 =C2=B1142%      -0.0     =
   0.05 =C2=B1 80%      -0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.get_next_timer_interrupt
> > >       0.23 =C2=B1 25%      -0.0        0.20 =C2=B1  6%      -0.0     =
   0.21 =C2=B1 21%      -0.1        0.18 =C2=B1 23%  perf-profile.children.=
cycles-pp.__flush_smp_call_function_queue
> > >       0.22 =C2=B1 28%      -0.0        0.18 =C2=B1 15%      -0.1     =
   0.16 =C2=B1 23%      -0.1        0.16 =C2=B1 20%  perf-profile.children.=
cycles-pp.unix_stream_sendmsg
> > >       0.20 =C2=B1 28%      -0.0        0.17 =C2=B1 24%      -0.0     =
   0.18 =C2=B1 14%      -0.0        0.18 =C2=B1 20%  perf-profile.children.=
cycles-pp.pcpu_block_update_hint_alloc
> > >       0.22 =C2=B1 30%      -0.0        0.19 =C2=B1 13%      -0.1     =
   0.17 =C2=B1 20%      -0.1        0.17 =C2=B1 21%  perf-profile.children.=
cycles-pp.sock_sendmsg
> > >       0.03 =C2=B1 82%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.02 =C2=B1122%  perf-profile.children.cycle=
s-pp.strcmp_ptr
> > >       0.03 =C2=B1 82%      -0.0        0.00            -0.0        0.=
02 =C2=B1144%      -0.0        0.02 =C2=B1122%  perf-profile.children.cycle=
s-pp.__x64_sys_execve
> > >       0.03 =C2=B1 82%      -0.0        0.00            -0.0        0.=
02 =C2=B1144%      -0.0        0.02 =C2=B1122%  perf-profile.children.cycle=
s-pp.execve
> > >       0.03 =C2=B1 82%      -0.0        0.00            -0.0        0.=
02 =C2=B1144%      -0.0        0.02 =C2=B1122%  perf-profile.children.cycle=
s-pp.do_execveat_common
> > >       0.03 =C2=B1 82%      -0.0        0.00            +0.0        0.=
04 =C2=B1 71%      +0.0        0.03 =C2=B1 82%  perf-profile.children.cycle=
s-pp.__isoc99_sscanf
> > >       0.03 =C2=B1 82%      -0.0        0.00            +0.0        0.=
04 =C2=B1102%      +0.0        0.05 =C2=B1 54%  perf-profile.children.cycle=
s-pp.idr_alloc_u32
> > >       0.15 =C2=B1 25%      -0.0        0.12 =C2=B1 30%      -0.0     =
   0.11 =C2=B1 32%      -0.0        0.11 =C2=B1 23%  perf-profile.children.=
cycles-pp.unix_stream_read_generic
> > >       0.15 =C2=B1 25%      -0.0        0.12 =C2=B1 30%      -0.0     =
   0.11 =C2=B1 30%      -0.0        0.11 =C2=B1 23%  perf-profile.children.=
cycles-pp.unix_stream_recvmsg
> > >       0.13 =C2=B1 23%      -0.0        0.10 =C2=B1 34%      -0.0     =
   0.08 =C2=B1 28%      -0.0        0.09 =C2=B1 23%  perf-profile.children.=
cycles-pp.__libc_recvmsg
> > >       0.22 =C2=B1 28%      -0.0        0.19 =C2=B1 14%      -0.0     =
   0.18 =C2=B1 20%      -0.1        0.17 =C2=B1 21%  perf-profile.children.=
cycles-pp.____sys_sendmsg
> > >       0.13 =C2=B1 29%      -0.0        0.10 =C2=B1 19%      -0.0     =
   0.12 =C2=B1 12%      -0.0        0.11 =C2=B1 19%  perf-profile.children.=
cycles-pp.irqtime_account_irq
> > >       0.03 =C2=B1 81%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.unix_=
stream_read_actor
> > >       0.03 =C2=B1200%      -0.0        0.00            +0.0        0.=
04 =C2=B1147%      +0.0        0.07 =C2=B1 81%  perf-profile.children.cycle=
s-pp.timekeeping_max_deferment
> > >       0.38 =C2=B1 20%      -0.0        0.35 =C2=B1  8%      +0.0     =
   0.40 =C2=B1 12%      +0.0        0.38 =C2=B1 14%  perf-profile.children.=
cycles-pp.dequeue_task_fair
> > >       4.75 =C2=B1 19%      -0.0        4.72 =C2=B1  7%      +0.1     =
   4.88 =C2=B1  7%      +0.2        4.99 =C2=B1  6%  perf-profile.children.=
cycles-pp.exit_to_user_mode_loop
> > >       4.87 =C2=B1 19%      -0.0        4.84 =C2=B1  7%      +0.1     =
   5.00 =C2=B1  7%      +0.2        5.09 =C2=B1  6%  perf-profile.children.=
cycles-pp.exit_to_user_mode_prepare
> > >       0.17 =C2=B1 44%      -0.0        0.14 =C2=B1 21%      -0.0     =
   0.15 =C2=B1 14%      -0.0        0.17 =C2=B1  8%  perf-profile.children.=
cycles-pp.apparmor_capable
> > >       0.09 =C2=B1 26%      -0.0        0.06 =C2=B1 11%      -0.0     =
   0.08 =C2=B1 52%      -0.1        0.04 =C2=B1 87%  perf-profile.children.=
cycles-pp.__pthread_mutex_lock
> > >       0.09 =C2=B1 39%      -0.0        0.06 =C2=B1 49%      -0.0     =
   0.08 =C2=B1 14%      -0.0        0.07 =C2=B1 20%  perf-profile.children.=
cycles-pp.__get_fs_type
> > >       0.04 =C2=B1 82%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycle=
s-pp.calc_global_load_tick
> > >       0.33 =C2=B1 20%      -0.0        0.30 =C2=B1 13%      -0.1     =
   0.28 =C2=B1 14%      -0.0        0.29 =C2=B1 10%  perf-profile.children.=
cycles-pp.seq_path_root
> > >       0.69 =C2=B1 22%      -0.0        0.66 =C2=B1 14%      -0.1     =
   0.59 =C2=B1 13%      -0.1        0.57 =C2=B1  4%  perf-profile.children.=
cycles-pp.asm_sysvec_call_function_single
> > >       0.24 =C2=B1 30%      -0.0        0.21 =C2=B1 16%      -0.0     =
   0.19 =C2=B1 19%      -0.0        0.19 =C2=B1 22%  perf-profile.children.=
cycles-pp.___sys_sendmsg
> > >       0.04 =C2=B1 87%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.03 =C2=B1100%      -0.0        0.00        perf-profile.children.cycle=
s-pp.enqueue_hrtimer
> > >       0.10 =C2=B1 10%      -0.0        0.07 =C2=B1 47%      -0.0     =
   0.08 =C2=B1 26%      -0.0        0.09 =C2=B1 11%  perf-profile.children.=
cycles-pp.path_put
> > >       0.06 =C2=B1 15%      -0.0        0.04 =C2=B1 71%      -0.0     =
   0.05 =C2=B1 45%      -0.0        0.04 =C2=B1 83%  perf-profile.children.=
cycles-pp.obj_cgroup_uncharge_pages
> > >       0.04 =C2=B1 88%      -0.0        0.02 =C2=B1141%      +0.0     =
   0.05 =C2=B1 56%      -0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.strjoin_real
> > >       0.22 =C2=B1 47%      -0.0        0.20 =C2=B1 23%      -0.0     =
   0.19 =C2=B1 16%      -0.0        0.22 =C2=B1  9%  perf-profile.children.=
cycles-pp.security_capable
> > >       0.06 =C2=B1 51%      -0.0        0.04 =C2=B1 71%      -0.0     =
   0.06 =C2=B1 52%      -0.0        0.02 =C2=B1125%  perf-profile.children.=
cycles-pp.rwsem_down_read_slowpath
> > >       0.49 =C2=B1 29%      -0.0        0.46 =C2=B1 10%      +0.0     =
   0.52 =C2=B1 11%      +0.0        0.52 =C2=B1 21%  perf-profile.children.=
cycles-pp.ramfs_get_inode
> > >       2.20 =C2=B1 24%      -0.0        2.18 =C2=B1 16%      +0.1     =
   2.27 =C2=B1  8%      +0.2        2.39 =C2=B1 15%  perf-profile.children.=
cycles-pp.propagate_mnt
> > >       0.82 =C2=B1 26%      -0.0        0.79 =C2=B1  6%      +0.1     =
   0.87 =C2=B1 14%      +0.1        0.88 =C2=B1  9%  perf-profile.children.=
cycles-pp.kill_litter_super
> > >       0.11 =C2=B1 27%      -0.0        0.08 =C2=B1 27%      +0.0     =
   0.12 =C2=B1 28%      +0.0        0.11 =C2=B1 28%  perf-profile.children.=
cycles-pp.xas_load
> > >       0.72 =C2=B1 30%      -0.0        0.69 =C2=B1 19%      +0.0     =
   0.75 =C2=B1 19%      +0.0        0.76 =C2=B1 12%  perf-profile.children.=
cycles-pp.shmem_fill_super
> > >       0.03 =C2=B1127%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      +0.0        0.03 =C2=B1 82%  perf-profile.children.cycle=
s-pp.tick_nohz_irq_exit
> > >       0.03 =C2=B1127%      -0.0        0.00            -0.0        0.=
02 =C2=B1141%      -0.0        0.00        perf-profile.children.cycles-pp.=
timerqueue_add
> > >       0.15 =C2=B1 35%      -0.0        0.12 =C2=B1 14%      -0.0     =
   0.12 =C2=B1 31%      -0.0        0.12 =C2=B1 29%  perf-profile.children.=
cycles-pp.sendmsg
> > >       0.03 =C2=B1 84%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.03 =C2=B1100%      -0.0        0.00        perf-profile.children.cycle=
s-pp.hrtimer_next_event_without
> > >       0.03 =C2=B1 82%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.04 =C2=B1104%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.__libc_start_main
> > >       0.03 =C2=B1 82%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.04 =C2=B1104%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.main
> > >       0.03 =C2=B1 82%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.04 =C2=B1104%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.run_builtin
> > >       0.07 =C2=B1 55%      -0.0        0.05 =C2=B1 72%      -0.0     =
   0.05 =C2=B1 46%      -0.0        0.04 =C2=B1 83%  perf-profile.children.=
cycles-pp.sock_def_readable
> > >       0.10 =C2=B1 28%      -0.0        0.07 =C2=B1 21%      +0.0     =
   0.10 =C2=B1 41%      -0.0        0.06 =C2=B1 56%  perf-profile.children.=
cycles-pp.hrtimer_start_range_ns
> > >       0.04 =C2=B1 83%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.06 =C2=B1 50%      +0.0        0.04 =C2=B1 50%  perf-profile.children.=
cycles-pp.perf_pmu_nop_void
> > >       0.28 =C2=B1 33%      -0.0        0.25 =C2=B1 13%      -0.1     =
   0.22 =C2=B1 11%      -0.1        0.21 =C2=B1 17%  perf-profile.children.=
cycles-pp.unit_name_is_valid
> > >       0.06 =C2=B1 21%      -0.0        0.03 =C2=B1102%      -0.0     =
   0.05 =C2=B1 80%      +0.0        0.06 =C2=B1  7%  perf-profile.children.=
cycles-pp.current_time
> > >       0.78 =C2=B1 27%      -0.0        0.76 =C2=B1 19%      +0.0     =
   0.79 =C2=B1 14%      +0.0        0.83 =C2=B1 13%  perf-profile.children.=
cycles-pp.srcu_advance_state
> > >       0.10 =C2=B1 30%      -0.0        0.08 =C2=B1 21%      -0.0     =
   0.08 =C2=B1 49%      -0.0        0.08 =C2=B1 28%  perf-profile.children.=
cycles-pp.recvmsg
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
seq_release
> > >       0.02 =C2=B1125%      -0.0        0.00            -0.0        0.=
02 =C2=B1142%      -0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.balance_fair
> > >       0.08 =C2=B1 19%      -0.0        0.06 =C2=B1 48%      -0.0     =
   0.07 =C2=B1 19%      -0.0        0.07 =C2=B1 22%  perf-profile.children.=
cycles-pp.ep_send_events
> > >       0.19 =C2=B1 15%      -0.0        0.16 =C2=B1 14%      -0.0     =
   0.18 =C2=B1  8%      -0.0        0.15 =C2=B1 12%  perf-profile.children.=
cycles-pp.perf_mux_hrtimer_handler
> > >       0.79 =C2=B1 15%      -0.0        0.77 =C2=B1  9%      +0.1     =
   0.85 =C2=B1  6%      +0.0        0.80 =C2=B1  8%  perf-profile.children.=
cycles-pp.inode_permission
> > >       0.21 =C2=B1 42%      -0.0        0.19 =C2=B1 24%      -0.0     =
   0.19 =C2=B1 14%      +0.0        0.21 =C2=B1 12%  perf-profile.children.=
cycles-pp.ns_capable
> > >       0.05 =C2=B1 58%      -0.0        0.03 =C2=B1103%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.03 =C2=B1123%  perf-profile.children.=
cycles-pp.consume_skb
> > >       0.12 =C2=B1 15%      -0.0        0.10 =C2=B1 11%      -0.0     =
   0.09 =C2=B1 20%      -0.0        0.09 =C2=B1 25%  perf-profile.children.=
cycles-pp.run_rebalance_domains
> > >       0.02 =C2=B1123%      -0.0        0.00            -0.0        0.=
00            +0.0        0.03 =C2=B1 82%  perf-profile.children.cycles-pp.=
___d_drop
> > >       0.02 =C2=B1123%      -0.0        0.00            -0.0        0.=
02 =C2=B1141%      -0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.get_random_u32
> > >       0.28 =C2=B1 24%      -0.0        0.26 =C2=B1 15%      -0.1     =
   0.22 =C2=B1 10%      -0.1        0.22 =C2=B1  9%  perf-profile.children.=
cycles-pp.rcu_note_context_switch
> > >       0.21 =C2=B1 11%      -0.0        0.19 =C2=B1 10%      -0.0     =
   0.20 =C2=B1 15%      -0.0        0.19 =C2=B1 12%  perf-profile.children.=
cycles-pp.d_alloc_parallel
> > >       0.27 =C2=B1 29%      -0.0        0.25 =C2=B1 18%      -0.0     =
   0.26 =C2=B1 26%      -0.0        0.23 =C2=B1 21%  perf-profile.children.=
cycles-pp.smp_call_function_single
> > >       0.59 =C2=B1 28%      -0.0        0.57 =C2=B1 13%      -0.0     =
   0.58 =C2=B1 14%      +0.0        0.60 =C2=B1  9%  perf-profile.children.=
cycles-pp.__d_alloc
> > >       0.41 =C2=B1 24%      -0.0        0.38 =C2=B1  9%      -0.1     =
   0.35 =C2=B1 10%      -0.0        0.36 =C2=B1 13%  perf-profile.children.=
cycles-pp.do_dentry_open
> > >       0.06 =C2=B1 53%      -0.0        0.04 =C2=B1109%      -0.0     =
   0.03 =C2=B1106%      -0.0        0.03 =C2=B1122%  perf-profile.children.=
cycles-pp.sync_regs
> > >       0.15 =C2=B1 21%      -0.0        0.12 =C2=B1 21%      -0.0     =
   0.13 =C2=B1 35%      -0.0        0.12 =C2=B1 20%  perf-profile.children.=
cycles-pp.rebalance_domains
> > >       0.03 =C2=B1 84%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.03 =C2=B1101%      -0.0        0.00        perf-profile.children.cycle=
s-pp.asm_exc_page_fault
> > >       0.05 =C2=B1 52%      -0.0        0.03 =C2=B1103%      -0.0     =
   0.03 =C2=B1100%      -0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.device_get_id_filename
> > >       0.12 =C2=B1 29%      -0.0        0.10 =C2=B1  8%      -0.0     =
   0.10 =C2=B1 16%      -0.0        0.09 =C2=B1 15%  perf-profile.children.=
cycles-pp.shmem_show_options
> > >       2.88 =C2=B1 15%      -0.0        2.86 =C2=B1  5%      -0.0     =
   2.84 =C2=B1  7%      -0.1        2.78 =C2=B1  4%  perf-profile.children.=
cycles-pp.path_lookupat
> > >       0.25 =C2=B1 26%      -0.0        0.23 =C2=B1  9%      -0.0     =
   0.24 =C2=B1 11%      -0.0        0.25 =C2=B1 12%  perf-profile.children.=
cycles-pp.fsnotify_destroy_marks
> > >       0.05 =C2=B1 55%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.03 =C2=B1100%      -0.0        0.03 =C2=B1 84%  perf-profile.children.=
cycles-pp.update_cfs_group
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.__d_r=
ehash
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.skb_c=
opy_datagram_iter
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.__skb=
_datagram_iter
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
00            -0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.=
_find_first_bit
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
02 =C2=B1141%      +0.0        0.02 =C2=B1122%  perf-profile.children.cycle=
s-pp.greedy_realloc
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
02 =C2=B1141%      +0.0        0.04 =C2=B1 83%  perf-profile.children.cycle=
s-pp.__mem_cgroup_charge
> > >       0.21 =C2=B1 20%      -0.0        0.19 =C2=B1 17%      -0.0     =
   0.19 =C2=B1 13%      -0.0        0.19 =C2=B1  7%  perf-profile.children.=
cycles-pp.ep_poll_callback
> > >       0.48 =C2=B1 22%      -0.0        0.46 =C2=B1 10%      +0.0     =
   0.50 =C2=B1 12%      +0.0        0.49 =C2=B1  7%  perf-profile.children.=
cycles-pp.update_load_avg
> > >       0.03 =C2=B1124%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.00        perf-profile.children.cycles-pp.=
ep_autoremove_wake_function
> > >       0.36 =C2=B1 23%      -0.0        0.34 =C2=B1  8%      -0.0     =
   0.36 =C2=B1 12%      +0.0        0.40 =C2=B1  8%  perf-profile.children.=
cycles-pp.sync_filesystem
> > >       0.21 =C2=B1 21%      -0.0        0.19 =C2=B1  9%      -0.0     =
   0.20 =C2=B1 13%      -0.0        0.18 =C2=B1  9%  perf-profile.children.=
cycles-pp.rcu_all_qs
> > >       0.12 =C2=B1 17%      -0.0        0.10 =C2=B1 22%      -0.0     =
   0.11 =C2=B1 10%      -0.0        0.09 =C2=B1 17%  perf-profile.children.=
cycles-pp.perf_rotate_context
> > >       0.13 =C2=B1 23%      -0.0        0.11 =C2=B1 22%      -0.0     =
   0.09 =C2=B1 34%      -0.0        0.08 =C2=B1 20%  perf-profile.children.=
cycles-pp.__libc_sendmsg
> > >       0.82 =C2=B1 22%      -0.0        0.80 =C2=B1  3%      -0.0     =
   0.81 =C2=B1  9%      -0.0        0.80 =C2=B1  6%  perf-profile.children.=
cycles-pp.__fput
> > >       0.29 =C2=B1 26%      -0.0        0.27 =C2=B1 25%      -0.0     =
   0.28 =C2=B1 13%      +0.0        0.31 =C2=B1  9%  perf-profile.children.=
cycles-pp.srcu_gp_start_if_needed
> > >       0.78 =C2=B1 26%      -0.0        0.76 =C2=B1  6%      +0.1     =
   0.85 =C2=B1 14%      +0.1        0.84 =C2=B1  9%  perf-profile.children.=
cycles-pp.generic_shutdown_super
> > >       0.32 =C2=B1 32%      -0.0        0.30 =C2=B1 22%      +0.0     =
   0.34 =C2=B1 18%      +0.0        0.36 =C2=B1 19%  perf-profile.children.=
cycles-pp.d_make_root
> > >       0.91 =C2=B1 31%      -0.0        0.90 =C2=B1 14%      +0.1     =
   0.99 =C2=B1 15%      +0.0        0.95 =C2=B1 18%  perf-profile.children.=
cycles-pp.new_inode
> > >       0.20 =C2=B1 35%      -0.0        0.18 =C2=B1 18%      -0.0     =
   0.18 =C2=B1 15%      +0.0        0.22 =C2=B1 16%  perf-profile.children.=
cycles-pp.vfs_parse_fs_param
> > >       0.20 =C2=B1 29%      -0.0        0.18 =C2=B1 15%      -0.0     =
   0.19 =C2=B1 11%      +0.0        0.20 =C2=B1 16%  perf-profile.children.=
cycles-pp.fsnotify_grab_connector
> > >       0.49 =C2=B1 30%      -0.0        0.47 =C2=B1 13%      -0.1     =
   0.43 =C2=B1 10%      -0.0        0.44 =C2=B1 16%  perf-profile.children.=
cycles-pp.__do_sys_newstat
> > >       0.29 =C2=B1 20%      -0.0        0.27 =C2=B1  7%      -0.0     =
   0.27 =C2=B1  7%      -0.0        0.26 =C2=B1  8%  perf-profile.children.=
cycles-pp.rep_movs_alternative
> > >       0.24 =C2=B1 15%      -0.0        0.22 =C2=B1 11%      -0.0     =
   0.22 =C2=B1 20%      -0.0        0.21 =C2=B1 11%  perf-profile.children.=
cycles-pp.native_irq_return_iret
> > >       0.03 =C2=B1122%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.03 =C2=B1101%      -0.0        0.00        perf-profile.children.cycle=
s-pp.trigger_load_balance
> > >       0.04 =C2=B1 90%      -0.0        0.02 =C2=B1144%      -0.0     =
   0.02 =C2=B1142%      -0.0        0.02 =C2=B1125%  perf-profile.children.=
cycles-pp.inode_wait_for_writeback
> > >       0.11 =C2=B1 36%      -0.0        0.09 =C2=B1 26%      -0.0     =
   0.10 =C2=B1 12%      -0.0        0.09 =C2=B1 19%  perf-profile.children.=
cycles-pp.get_fs_type
> > >       0.03 =C2=B1123%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.02 =C2=B1141%      -0.0        0.02 =C2=B1122%  perf-profile.children.=
cycles-pp.check_stack_object
> > >       0.08 =C2=B1 62%      -0.0        0.06 =C2=B1 15%      -0.0     =
   0.06 =C2=B1 23%      +0.0        0.08 =C2=B1 51%  perf-profile.children.=
cycles-pp.generic_parse_monolithic
> > >       0.32 =C2=B1 24%      -0.0        0.31 =C2=B1 14%      +0.0     =
   0.33 =C2=B1 15%      -0.0        0.30 =C2=B1 15%  perf-profile.children.=
cycles-pp.cp_new_stat
> > >       0.30 =C2=B1 29%      -0.0        0.29 =C2=B1  9%      +0.0     =
   0.32 =C2=B1 10%      +0.0        0.35 =C2=B1 13%  perf-profile.children.=
cycles-pp.memcg_destroy_list_lru
> > >       0.43 =C2=B1 20%      -0.0        0.42 =C2=B1 10%      -0.0     =
   0.39 =C2=B1  7%      -0.0        0.41 =C2=B1  7%  perf-profile.children.=
cycles-pp.do_open
> > >       0.20 =C2=B1 25%      -0.0        0.18 =C2=B1 27%      -0.0     =
   0.18 =C2=B1 14%      -0.0        0.17 =C2=B1 18%  perf-profile.children.=
cycles-pp.finish_task_switch
> > >       0.14 =C2=B1 39%      -0.0        0.12 =C2=B1 26%      -0.0     =
   0.13 =C2=B1 14%      +0.0        0.15 =C2=B1  6%  perf-profile.children.=
cycles-pp.__list_lru_init
> > >       0.09 =C2=B1 24%      -0.0        0.07 =C2=B1  9%      -0.0     =
   0.07 =C2=B1 55%      -0.0        0.07 =C2=B1 15%  perf-profile.children.=
cycles-pp.update_irq_load_avg
> > >       0.87 =C2=B1 22%      -0.0        0.85 =C2=B1  8%      -0.0     =
   0.85 =C2=B1 11%      -0.0        0.86 =C2=B1  9%  perf-profile.children.=
cycles-pp.kmem_cache_free
> > >       0.15 =C2=B1 23%      -0.0        0.13 =C2=B1 16%      -0.0     =
   0.14 =C2=B1  9%      -0.0        0.14 =C2=B1 11%  perf-profile.children.=
cycles-pp.set_root
> > >       0.02 =C2=B1200%      -0.0        0.00            +0.0        0.=
02 =C2=B1142%      -0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.inode_init_once
> > >       0.19 =C2=B1 11%      -0.0        0.17 =C2=B1 16%      -0.0     =
   0.18 =C2=B1 30%      -0.1        0.13 =C2=B1  8%  perf-profile.children.=
cycles-pp.hrtimer_wakeup
> > >       0.36 =C2=B1 11%      -0.0        0.34 =C2=B1  6%      -0.0     =
   0.31 =C2=B1 10%      -0.0        0.33 =C2=B1  7%  perf-profile.children.=
cycles-pp.rcu_report_exp_cpu_mult
> > >       0.35 =C2=B1 17%      -0.0        0.33 =C2=B1 10%      +0.0     =
   0.35 =C2=B1 16%      +0.0        0.35 =C2=B1  3%  perf-profile.children.=
cycles-pp.__kmem_cache_free
> > >       0.02 =C2=B1125%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.mounts_open_common
> > >       0.02 =C2=B1125%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.02 =C2=B1141%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.fsnotify_sb_delete
> > >       0.02 =C2=B1125%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.03 =C2=B1100%      +0.0        0.03 =C2=B1123%  perf-profile.children.=
cycles-pp.try_charge_memcg
> > >       0.03 =C2=B1 82%      -0.0        0.02 =C2=B1142%      -0.0     =
   0.02 =C2=B1142%      -0.0        0.00        perf-profile.children.cycle=
s-pp.__socket
> > >       0.09 =C2=B1 20%      -0.0        0.08 =C2=B1 22%      -0.0     =
   0.09 =C2=B1 33%      -0.0        0.08 =C2=B1 17%  perf-profile.children.=
cycles-pp.__fget_light
> > >       0.03 =C2=B1 82%      -0.0        0.02 =C2=B1141%      -0.0     =
   0.02 =C2=B1142%      -0.0        0.00        perf-profile.children.cycle=
s-pp.__sys_socket
> > >       0.16 =C2=B1 20%      -0.0        0.14 =C2=B1 11%      -0.0     =
   0.13 =C2=B1 24%      -0.0        0.13 =C2=B1 12%  perf-profile.children.=
cycles-pp.mangle_path
> > >       0.16 =C2=B1 53%      -0.0        0.14 =C2=B1 29%      +0.0     =
   0.16 =C2=B1 15%      -0.0        0.15 =C2=B1 15%  perf-profile.children.=
cycles-pp.__lookup_mnt
> > >       0.17 =C2=B1 19%      -0.0        0.16 =C2=B1 21%      -0.0     =
   0.16 =C2=B1  9%      -0.0        0.16 =C2=B1 11%  perf-profile.children.=
cycles-pp.nd_jump_root
> > >       0.30 =C2=B1 35%      -0.0        0.28 =C2=B1 14%      -0.0     =
   0.28 =C2=B1 12%      +0.0        0.31 =C2=B1 15%  perf-profile.children.=
cycles-pp.vfs_parse_fs_string
> > >       0.09 =C2=B1 56%      -0.0        0.07 =C2=B1 20%      -0.0     =
   0.08 =C2=B1 24%      +0.0        0.09 =C2=B1 15%  perf-profile.children.=
cycles-pp.strspn@plt
> > >       0.06 =C2=B1 58%      -0.0        0.04 =C2=B1 72%      -0.0     =
   0.04 =C2=B1 71%      -0.0        0.03 =C2=B1 82%  perf-profile.children.=
cycles-pp.syscall_exit_to_user_mode_prepare
> > >       0.31 =C2=B1 19%      -0.0        0.29 =C2=B1 12%      +0.0     =
   0.31 =C2=B1 16%      -0.0        0.29 =C2=B1  9%  perf-profile.children.=
cycles-pp.down_read
> > >       0.16 =C2=B1 23%      -0.0        0.15 =C2=B1 25%      -0.0     =
   0.14 =C2=B1 29%      -0.0        0.12 =C2=B1  6%  perf-profile.children.=
cycles-pp.rcu_sched_clock_irq
> > >       0.02 =C2=B1125%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.02 =C2=B1144%      +0.0        0.04 =C2=B1 82%  perf-profile.children.=
cycles-pp.task_tick_fair
> > >       0.17 =C2=B1 24%      -0.0        0.16 =C2=B1 11%      +0.0     =
   0.18 =C2=B1 15%      +0.0        0.18 =C2=B1 10%  perf-profile.children.=
cycles-pp.__update_load_avg_se
> > >       0.11 =C2=B1  6%      -0.0        0.10 =C2=B1 23%      -0.0     =
   0.10 =C2=B1 30%      -0.0        0.10 =C2=B1 16%  perf-profile.children.=
cycles-pp.__update_blocked_fair
> > >       0.05 =C2=B1 90%      -0.0        0.04 =C2=B1 72%      -0.0     =
   0.04 =C2=B1105%      -0.0        0.03 =C2=B1123%  perf-profile.children.=
cycles-pp.mnt_fstype_is_pseudofs
> > >       0.03 =C2=B1 82%      -0.0        0.02 =C2=B1142%      -0.0     =
   0.02 =C2=B1142%      -0.0        0.00        perf-profile.children.cycle=
s-pp.__x64_sys_socket
> > >       0.02 =C2=B1123%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.02 =C2=B1142%      -0.0        0.00        perf-profile.children.cycle=
s-pp.rcu_gp_kthread
> > >       0.09 =C2=B1 23%      -0.0        0.08 =C2=B1  8%      -0.0     =
   0.07 =C2=B1 47%      -0.0        0.08 =C2=B1 19%  perf-profile.children.=
cycles-pp.generic_fillattr
> > >       0.39 =C2=B1 17%      -0.0        0.38 =C2=B1 20%      -0.0     =
   0.36 =C2=B1 22%      -0.0        0.36 =C2=B1 13%  perf-profile.children.=
cycles-pp.schedule_idle
> > >       0.40 =C2=B1 22%      -0.0        0.39 =C2=B1  9%      -0.0     =
   0.38 =C2=B1  9%      +0.0        0.43 =C2=B1  9%  perf-profile.children.=
cycles-pp.vfs_fstat
> > >       0.03 =C2=B1 81%      -0.0        0.02 =C2=B1141%      +0.0     =
   0.05 =C2=B1 48%      -0.0        0.02 =C2=B1122%  perf-profile.children.=
cycles-pp.handle_dots
> > >       0.35 =C2=B1 23%      -0.0        0.33 =C2=B1  7%      -0.0     =
   0.34 =C2=B1 13%      +0.0        0.38 =C2=B1  7%  perf-profile.children.=
cycles-pp.writeback_inodes_sb
> > >       0.02 =C2=B1122%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.02 =C2=B1 99%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp._dbus_marshal_read_uint32
> > >       0.07 =C2=B1 32%      -0.0        0.06 =C2=B1 52%      +0.0     =
   0.08 =C2=B1 16%      +0.0        0.09 =C2=B1  9%  perf-profile.children.=
cycles-pp.__wrgsbase_inactive
> > >       0.15 =C2=B1 20%      -0.0        0.14 =C2=B1 18%      -0.0     =
   0.13 =C2=B1 12%      +0.0        0.17 =C2=B1  7%  perf-profile.children.=
cycles-pp.kernfs_iop_getattr
> > >       0.17 =C2=B1 23%      -0.0        0.16 =C2=B1 17%      +0.0     =
   0.17 =C2=B1 13%      -0.0        0.15 =C2=B1  9%  perf-profile.children.=
cycles-pp._copy_to_user
> > >       0.04 =C2=B1 50%      -0.0        0.03 =C2=B1101%      -0.0     =
   0.02 =C2=B1 99%      +0.0        0.06 =C2=B1 14%  perf-profile.children.=
cycles-pp.may_open
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.xas_e=
xpand
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.map_i=
d_range_down
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
reweight_entity
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
rb_insert_color
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
02 =C2=B1141%      -0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.check_spread
> > >       0.02 =C2=B1122%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.00        perf-profile.children.cycles-pp.=
tick_nohz_idle_enter
> > >       0.02 =C2=B1122%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      +0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.radix_tree_delete_item
> > >       0.02 =C2=B1122%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.siphash24_compress@plt
> > >       0.05 =C2=B1 55%      -0.0        0.04 =C2=B1 75%      +0.0     =
   0.07 =C2=B1 27%      +0.0        0.06 =C2=B1 12%  perf-profile.children.=
cycles-pp.getdelim
> > >       0.11 =C2=B1 20%      -0.0        0.10 =C2=B1 26%      -0.0     =
   0.10 =C2=B1  6%      -0.0        0.07 =C2=B1 55%  perf-profile.children.=
cycles-pp.syscall_enter_from_user_mode
> > >       0.06 =C2=B1 57%      -0.0        0.05 =C2=B1 77%      +0.0     =
   0.08 =C2=B1 24%      +0.0        0.07 =C2=B1 20%  perf-profile.children.=
cycles-pp.xas_start
> > >       0.04 =C2=B1 83%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.strncmp
> > >       0.09 =C2=B1 19%      -0.0        0.08 =C2=B1  9%      +0.0     =
   0.09 =C2=B1 30%      -0.0        0.09 =C2=B1 15%  perf-profile.children.=
cycles-pp.pcpu_block_update
> > >       3.69 =C2=B1 15%      -0.0        3.68 =C2=B1  9%      +0.2     =
   3.86 =C2=B1 12%      -0.0        3.65 =C2=B1  6%  perf-profile.children.=
cycles-pp.__schedule
> > >       0.07 =C2=B1 58%      -0.0        0.06 =C2=B1 53%      +0.0     =
   0.08 =C2=B1 14%      +0.0        0.08 =C2=B1 19%  perf-profile.children.=
cycles-pp.__srcu_read_unlock
> > >       0.41 =C2=B1 19%      -0.0        0.40 =C2=B1  9%      -0.0     =
   0.41 =C2=B1 13%      +0.0        0.45 =C2=B1 10%  perf-profile.children.=
cycles-pp.mod_objcg_state
> > >       0.22 =C2=B1 23%      -0.0        0.21 =C2=B1 10%      -0.0     =
   0.20 =C2=B1 11%      -0.0        0.19 =C2=B1 12%  perf-profile.children.=
cycles-pp.__sysvec_call_function_single
> > >       0.15 =C2=B1 16%      -0.0        0.14 =C2=B1 21%      +0.0     =
   0.18 =C2=B1 15%      +0.0        0.16 =C2=B1 13%  perf-profile.children.=
cycles-pp.mutex_lock
> > >       0.04 =C2=B1 85%      -0.0        0.03 =C2=B1101%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.__mem_cgroup_uncharge_list
> > >       0.02 =C2=B1122%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycle=
s-pp.kmem_cache_alloc_node
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp._dbus=
_type_reader_recurse
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.dentr=
y_path
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.appar=
mor_inode_getattr
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.timek=
eeping_advance
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.updat=
e_wall_time
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.hashm=
ap_get2@plt
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.updat=
e_rt_rq_load_avg
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.delet=
e_trailing_chars
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp._IO_s=
etb
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.srcu_=
gp_start
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.sipha=
sh24_init@plt
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.strse=
p
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.error=
_entry
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.radix=
_tree_node_rcu_free
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.make_=
kuid
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.skb_r=
elease_head_state
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.unix_=
destruct_scm
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.rcu_s=
ync_init
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.sock_=
wfree
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.children.cycles-pp.__mod=
_lruvec_page_state
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.=
autoremove_wake_function
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.=
security_path_mkdir
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.=
seq_open
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.=
mem_cgroup_handle_over_high
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.=
object_path_is_valid
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.=
__poll
> > >       0.02 =C2=B1122%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.02 =C2=B1142%      -0.0        0.00        perf-profile.children.cycle=
s-pp.putname
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
__errno_location
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
irq_work_run_list
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
rcu_gp_fqs_loop
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
sd_bus_message_open_container
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
rb_next
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
arch_cpu_idle_enter
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
tsc_verify_tsc_adjust
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.stress_ramfs_umount
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      +0.0        0.02 =C2=B1123%  perf-profile.children.cycle=
s-pp._hashmap_size
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
connect
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycles-pp.=
page_counter_uncharge
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.__mark_inode_dirty
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
02 =C2=B1144%      -0.0        0.00        perf-profile.children.cycles-pp.=
security_path_unlink
> > >       0.03 =C2=B1130%      -0.0        0.02 =C2=B1142%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.strnlen
> > >       0.07 =C2=B1 53%      -0.0        0.06 =C2=B1 48%      -0.0     =
   0.06 =C2=B1 18%      -0.0        0.05 =C2=B1 56%  perf-profile.children.=
cycles-pp.readlink
> > >       0.05 =C2=B1 53%      -0.0        0.04 =C2=B1 72%      -0.0     =
   0.04 =C2=B1 72%      +0.0        0.05 =C2=B1 54%  perf-profile.children.=
cycles-pp.cpuidle_governor_latency_req
> > >       0.29 =C2=B1 22%      -0.0        0.28 =C2=B1  9%      -0.0     =
   0.28 =C2=B1  8%      -0.0        0.24 =C2=B1 11%  perf-profile.children.=
cycles-pp.security_file_alloc
> > >       0.03 =C2=B1123%      -0.0        0.02 =C2=B1141%      +0.0     =
   0.03 =C2=B1100%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.hashmap_get2
> > >       0.08 =C2=B1 19%      -0.0        0.07 =C2=B1 50%      +0.0     =
   0.09 =C2=B1 18%      +0.0        0.09 =C2=B1 22%  perf-profile.children.=
cycles-pp.common_perm_cond
> > >       0.04 =C2=B1 83%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.00            -0.0        0.00        perf-profile.children.cycles-pp.=
_hashmap_get
> > >       0.04 =C2=B1 83%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.02 =C2=B1145%      +0.0        0.04 =C2=B1 83%  perf-profile.children.=
cycles-pp.deactivate_super
> > >       0.27 =C2=B1 23%      -0.0        0.26 =C2=B1 13%      -0.0     =
   0.24 =C2=B1 15%      -0.0        0.24 =C2=B1 13%  perf-profile.children.=
cycles-pp.sysvec_call_function_single
> > >       0.08 =C2=B1 59%      -0.0        0.08 =C2=B1 55%      -0.0     =
   0.08 =C2=B1 23%      +0.0        0.10 =C2=B1 13%  perf-profile.children.=
cycles-pp.path_mount
> > >       0.06 =C2=B1 58%      -0.0        0.06 =C2=B1 47%      -0.0     =
   0.04 =C2=B1104%      -0.0        0.06 =C2=B1 10%  perf-profile.children.=
cycles-pp.rwsem_wake
> > >       0.10 =C2=B1 35%      -0.0        0.10 =C2=B1 28%      -0.0     =
   0.09 =C2=B1 26%      -0.1        0.05 =C2=B1 55%  perf-profile.children.=
cycles-pp.arch_scale_freq_tick
> > >       1.08 =C2=B1 17%      -0.0        1.07 =C2=B1  9%      -0.0     =
   1.04 =C2=B1  7%      -0.1        1.01 =C2=B1  5%  perf-profile.children.=
cycles-pp.vfs_statx
> > >       0.05 =C2=B1 53%      -0.0        0.04 =C2=B1 72%      -0.0     =
   0.03 =C2=B1100%      -0.0        0.05 =C2=B1 52%  perf-profile.children.=
cycles-pp.__mnt_want_write
> > >       0.05 =C2=B1 56%      -0.0        0.04 =C2=B1 73%      -0.0     =
   0.05 =C2=B1 51%      +0.0        0.07 =C2=B1 23%  perf-profile.children.=
cycles-pp.lookup_constant
> > >       0.05 =C2=B1 92%      -0.0        0.04 =C2=B1 75%      +0.0     =
   0.07 =C2=B1 15%      +0.0        0.05 =C2=B1 50%  perf-profile.children.=
cycles-pp.raw_spin_rq_lock_nested
> > >       0.10 =C2=B1 28%      -0.0        0.09 =C2=B1 19%      -0.0     =
   0.08 =C2=B1 20%      -0.0        0.09 =C2=B1  9%  perf-profile.children.=
cycles-pp._hashmap_iterate
> > >       0.06 =C2=B1 54%      -0.0        0.05 =C2=B1 49%      -0.0     =
   0.05 =C2=B1 46%      -0.0        0.04 =C2=B1 53%  perf-profile.children.=
cycles-pp.__x64_sys_readlink
> > >       0.12 =C2=B1 24%      -0.0        0.11 =C2=B1 17%      +0.0     =
   0.13 =C2=B1 18%      -0.0        0.11 =C2=B1 15%  perf-profile.children.=
cycles-pp.lockref_get
> > >       0.21 =C2=B1 14%      -0.0        0.20 =C2=B1 12%      +0.0     =
   0.22 =C2=B1 11%      +0.0        0.21 =C2=B1  5%  perf-profile.children.=
cycles-pp.__switch_to
> > >       1.33 =C2=B1 16%      -0.0        1.32 =C2=B1  8%      -0.0     =
   1.29 =C2=B1  5%      -0.1        1.27 =C2=B1  3%  perf-profile.children.=
cycles-pp.vfs_fstatat
> > >       0.14 =C2=B1 43%      -0.0        0.13 =C2=B1 17%      -0.0     =
   0.12 =C2=B1 23%      -0.0        0.13 =C2=B1 19%  perf-profile.children.=
cycles-pp.memdup_user
> > >       0.05 =C2=B1 53%      -0.0        0.04 =C2=B1 75%      -0.0     =
   0.04 =C2=B1 71%      -0.0        0.04 =C2=B1 82%  perf-profile.children.=
cycles-pp.copy_from_kernel_nofault
> > >       0.09 =C2=B1 23%      -0.0        0.08 =C2=B1 25%      +0.0     =
   0.09 =C2=B1 12%      -0.0        0.08 =C2=B1 50%  perf-profile.children.=
cycles-pp.chacha_block_generic
> > >       0.12 =C2=B1 33%      -0.0        0.11 =C2=B1 27%      -0.0     =
   0.11 =C2=B1 14%      +0.0        0.13 =C2=B1 20%  perf-profile.children.=
cycles-pp._get_random_bytes
> > >       0.15 =C2=B1 39%      -0.0        0.14 =C2=B1 15%      +0.0     =
   0.15 =C2=B1 21%      +0.0        0.16 =C2=B1 20%  perf-profile.children.=
cycles-pp.memcg_init_list_lru_one
> > >       0.06 =C2=B1 53%      -0.0        0.06 =C2=B1 53%      -0.0     =
   0.05 =C2=B1 48%      +0.0        0.07 =C2=B1 18%  perf-profile.children.=
cycles-pp.kernfs_fop_open
> > >       0.04 =C2=B1 88%      -0.0        0.04 =C2=B1 73%      -0.0     =
   0.03 =C2=B1100%      -0.0        0.02 =C2=B1122%  perf-profile.children.=
cycles-pp._copy_to_iter
> > >       0.98 =C2=B1 22%      -0.0        0.98 =C2=B1  8%      +0.0     =
   1.01 =C2=B1  6%      -0.0        0.98 =C2=B1  7%  perf-profile.children.=
cycles-pp.__do_sys_newlstat
> > >       0.19 =C2=B1 31%      -0.0        0.18 =C2=B1 11%      -0.0     =
   0.18 =C2=B1 21%      +0.0        0.19 =C2=B1 13%  perf-profile.children.=
cycles-pp._copy_from_user
> > >       0.83 =C2=B1 21%      -0.0        0.82 =C2=B1  4%      -0.0     =
   0.80 =C2=B1 10%      -0.1        0.75 =C2=B1  8%  perf-profile.children.=
cycles-pp.alloc_empty_file
> > >       0.22 =C2=B1 24%      -0.0        0.21 =C2=B1 28%      -0.0     =
   0.21 =C2=B1 13%      +0.0        0.24 =C2=B1 11%  perf-profile.children.=
cycles-pp.srcu_funnel_gp_start
> > >       0.24 =C2=B1 22%      -0.0        0.23 =C2=B1 16%      -0.0     =
   0.22 =C2=B1  7%      -0.0        0.23 =C2=B1 12%  perf-profile.children.=
cycles-pp.seq_escape_mem
> > >       0.10 =C2=B1 29%      -0.0        0.09 =C2=B1 31%      -0.0     =
   0.10 =C2=B1 41%      +0.0        0.10 =C2=B1 24%  perf-profile.children.=
cycles-pp.generic_exec_single
> > >       0.16 =C2=B1 10%      -0.0        0.15 =C2=B1 12%      +0.0     =
   0.16 =C2=B1 20%      -0.0        0.15 =C2=B1 19%  perf-profile.children.=
cycles-pp.terminate_walk
> > >       0.20 =C2=B1 35%      -0.0        0.19 =C2=B1 21%      +0.0     =
   0.21 =C2=B1 19%      +0.0        0.22 =C2=B1 16%  perf-profile.children.=
cycles-pp.ramfs_mknod
> > >       0.15 =C2=B1 11%      -0.0        0.14 =C2=B1 12%      +0.0     =
   0.16 =C2=B1 30%      -0.0        0.13 =C2=B1 16%  perf-profile.children.=
cycles-pp.update_rq_clock_task
> > >       0.67 =C2=B1 23%      -0.0        0.66 =C2=B1  8%      -0.0     =
   0.65 =C2=B1  9%      +0.0        0.69 =C2=B1  7%  perf-profile.children.=
cycles-pp.__do_sys_newfstat
> > >       0.14 =C2=B1 20%      -0.0        0.13 =C2=B1 29%      -0.0     =
   0.12 =C2=B1 48%      -0.0        0.11 =C2=B1  9%  perf-profile.children.=
cycles-pp.rcu_pending
> > >       0.16 =C2=B1 27%      -0.0        0.15 =C2=B1 13%      +0.0     =
   0.16 =C2=B1 13%      +0.0        0.16 =C2=B1 28%  perf-profile.children.=
cycles-pp.___perf_sw_event
> > >       0.07 =C2=B1 53%      -0.0        0.06 =C2=B1 46%      +0.0     =
   0.08 =C2=B1 29%      +0.0        0.08 =C2=B1 24%  perf-profile.children.=
cycles-pp.folio_alloc
> > >       0.06 =C2=B1 62%      -0.0        0.05 =C2=B1 47%      -0.0     =
   0.04 =C2=B1 73%      -0.0        0.05 =C2=B1 50%  perf-profile.children.=
cycles-pp.shmem_unlink
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.malloc@plt
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.mntput
> > >       0.12 =C2=B1 46%      -0.0        0.12 =C2=B1 12%      -0.0     =
   0.12 =C2=B1 18%      +0.0        0.13 =C2=B1 17%  perf-profile.children.=
cycles-pp.change_mnt_propagation
> > >       0.08 =C2=B1 12%      -0.0        0.08 =C2=B1  8%      +0.0     =
   0.10 =C2=B1 14%      -0.0        0.08 =C2=B1 24%  perf-profile.children.=
cycles-pp.schedule_preempt_disabled
> > >       0.33 =C2=B1 33%      -0.0        0.33 =C2=B1 19%      +0.0     =
   0.36 =C2=B1 16%      -0.0        0.32 =C2=B1 12%  perf-profile.children.=
cycles-pp.shmem_alloc_inode
> > >       0.39 =C2=B1 22%      -0.0        0.39 =C2=B1 12%      -0.0     =
   0.38 =C2=B1 12%      -0.0        0.36 =C2=B1  5%  perf-profile.children.=
cycles-pp.d_alloc
> > >       0.05 =C2=B1 53%      -0.0        0.05 =C2=B1 71%      -0.0     =
   0.05 =C2=B1 46%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.rb_erase
> > >       0.02 =C2=B1123%      -0.0        0.02 =C2=B1141%      +0.0     =
   0.07 =C2=B1 50%      +0.0        0.03 =C2=B1127%  perf-profile.children.=
cycles-pp.os_xsave
> > >       0.12 =C2=B1 22%      -0.0        0.12 =C2=B1 25%      +0.0     =
   0.13 =C2=B1 18%      +0.0        0.13 =C2=B1 20%  perf-profile.children.=
cycles-pp.idle_cpu
> > >       0.06 =C2=B1 14%      -0.0        0.06 =C2=B1 47%      -0.0     =
   0.06 =C2=B1 15%      +0.0        0.06 =C2=B1 18%  perf-profile.children.=
cycles-pp.prepend_copy
> > >       0.36 =C2=B1 28%      -0.0        0.36 =C2=B1 10%      +0.0     =
   0.40 =C2=B1 10%      +0.1        0.44 =C2=B1 12%  perf-profile.children.=
cycles-pp.list_lru_destroy
> > >       0.16 =C2=B1 17%      -0.0        0.15 =C2=B1 14%      -0.0     =
   0.15 =C2=B1 15%      -0.0        0.14 =C2=B1 14%  perf-profile.children.=
cycles-pp.task_work_add
> > >       0.26 =C2=B1 17%      -0.0        0.25 =C2=B1 17%      -0.0     =
   0.25 =C2=B1 15%      -0.0        0.23 =C2=B1  7%  perf-profile.children.=
cycles-pp.sched_clock_cpu
> > >       0.34 =C2=B1 23%      -0.0        0.33 =C2=B1  6%      -0.0     =
   0.33 =C2=B1 11%      +0.0        0.37 =C2=B1  5%  perf-profile.children.=
cycles-pp.get_nr_dirty_inodes
> > >       0.11 =C2=B1 27%      -0.0        0.10 =C2=B1 20%      +0.0     =
   0.11 =C2=B1 15%      +0.0        0.13 =C2=B1 19%  perf-profile.children.=
cycles-pp.destroy_inode
> > >       0.05 =C2=B1 86%      -0.0        0.04 =C2=B1 72%      -0.0     =
   0.03 =C2=B1105%      -0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.exp_funnel_lock
> > >       0.07 =C2=B1 53%      -0.0        0.06 =C2=B1 47%      -0.0     =
   0.06 =C2=B1 50%      -0.0        0.05 =C2=B1 53%  perf-profile.children.=
cycles-pp.sock_alloc_send_pskb
> > >       0.07 =C2=B1 63%      -0.0        0.06 =C2=B1 21%      +0.0     =
   0.07 =C2=B1 23%      +0.0        0.08 =C2=B1 17%  perf-profile.children.=
cycles-pp.mnt_release_group_id
> > >       0.14 =C2=B1 24%      -0.0        0.13 =C2=B1 14%      -0.0     =
   0.12 =C2=B1 28%      -0.0        0.11 =C2=B1 18%  perf-profile.children.=
cycles-pp.vfs_getattr_nosec
> > >       0.19 =C2=B1 24%      -0.0        0.18 =C2=B1 13%      -0.0     =
   0.17 =C2=B1 14%      +0.0        0.19 =C2=B1 19%  perf-profile.children.=
cycles-pp.show_type
> > >       0.08 =C2=B1 51%      -0.0        0.07 =C2=B1 21%      +0.0     =
   0.08 =C2=B1 17%      -0.0        0.05 =C2=B1 51%  perf-profile.children.=
cycles-pp.kernfs_fop_release
> > >       0.14 =C2=B1 31%      -0.0        0.13 =C2=B1 20%      +0.0     =
   0.15 =C2=B1 23%      -0.0        0.12 =C2=B1 30%  perf-profile.children.=
cycles-pp.xas_create
> > >       0.04 =C2=B1 89%      -0.0        0.04 =C2=B1 72%      +0.0     =
   0.06 =C2=B1 55%      -0.0        0.03 =C2=B1122%  perf-profile.children.=
cycles-pp.shuffle_freelist
> > >       0.03 =C2=B1 82%      -0.0        0.03 =C2=B1101%      +0.0     =
   0.04 =C2=B1 71%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.build_open_flags
> > >       0.07 =C2=B1 52%      -0.0        0.07 =C2=B1 48%      +0.0     =
   0.09 =C2=B1 23%      +0.0        0.08 =C2=B1 20%  perf-profile.children.=
cycles-pp.xas_descend
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycle=
s-pp.handle_mm_fault
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycle=
s-pp.__handle_mm_fault
> > >       0.15 =C2=B1 16%      -0.0        0.15 =C2=B1 16%      +0.0     =
   0.16 =C2=B1 18%      +0.0        0.16 =C2=B1 18%  perf-profile.children.=
cycles-pp.syscall_return_via_sysret
> > >       0.10 =C2=B1 22%      -0.0        0.10 =C2=B1  7%      -0.0     =
   0.09 =C2=B1 21%      -0.0        0.09 =C2=B1 14%  perf-profile.children.=
cycles-pp.__srcu_read_lock
> > >       0.16 =C2=B1 14%      -0.0        0.16 =C2=B1 14%      -0.0     =
   0.14 =C2=B1 20%      -0.0        0.15 =C2=B1 14%  perf-profile.children.=
cycles-pp.prepend_path
> > >       0.09 =C2=B1 15%      -0.0        0.09 =C2=B1 41%      -0.0     =
   0.08 =C2=B1 50%      -0.0        0.08 =C2=B1  9%  perf-profile.children.=
cycles-pp._find_next_and_bit
> > >       0.09 =C2=B1 33%      -0.0        0.09 =C2=B1 29%      -0.0     =
   0.08 =C2=B1 37%      -0.0        0.09 =C2=B1 32%  perf-profile.children.=
cycles-pp.select_task_rq
> > >       0.08 =C2=B1 22%      -0.0        0.08 =C2=B1 31%      +0.0     =
   0.09 =C2=B1 14%      +0.0        0.09 =C2=B1  4%  perf-profile.children.=
cycles-pp.entry_SYSCALL_64_safe_stack
> > >       0.28 =C2=B1 23%      -0.0        0.28 =C2=B1 16%      +0.0     =
   0.30 =C2=B1  9%      +0.0        0.29 =C2=B1  9%  perf-profile.children.=
cycles-pp.generic_permission
> > >       0.06 =C2=B1 54%      -0.0        0.06 =C2=B1  9%      +0.0     =
   0.06 =C2=B1 47%      -0.0        0.04 =C2=B1 50%  perf-profile.children.=
cycles-pp.m_start
> > >       0.79 =C2=B1 31%      -0.0        0.78 =C2=B1 15%      +0.1     =
   0.84 =C2=B1 15%      +0.0        0.81 =C2=B1 18%  perf-profile.children.=
cycles-pp.alloc_inode
> > >       0.04 =C2=B1 85%      -0.0        0.04 =C2=B1 71%      -0.0     =
   0.02 =C2=B1141%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.copyout
> > >       0.07 =C2=B1 24%      -0.0        0.06 =C2=B1 46%      -0.0     =
   0.04 =C2=B1109%      -0.0        0.05 =C2=B1 50%  perf-profile.children.=
cycles-pp.pick_next_entity
> > >       0.09 =C2=B1 29%      -0.0        0.08 =C2=B1 14%      -0.0     =
   0.08 =C2=B1 19%      +0.0        0.09 =C2=B1 18%  perf-profile.children.=
cycles-pp.security_inode_permission
> > >       0.27 =C2=B1 22%      -0.0        0.26 =C2=B1 10%      -0.0     =
   0.26 =C2=B1 17%      +0.0        0.27 =C2=B1 14%  perf-profile.children.=
cycles-pp.get_obj_cgroup_from_current
> > >       0.29 =C2=B1 18%      -0.0        0.28 =C2=B1 12%      +0.0     =
   0.30 =C2=B1 16%      +0.0        0.31 =C2=B1 11%  perf-profile.children.=
cycles-pp.lockref_put_return
> > >       0.59 =C2=B1 26%      -0.0        0.59 =C2=B1 12%      +0.0     =
   0.64 =C2=B1 12%      +0.0        0.63 =C2=B1 16%  perf-profile.children.=
cycles-pp.__sync_rcu_exp_select_node_cpus
> > >       0.16 =C2=B1 17%      -0.0        0.16 =C2=B1 16%      -0.0     =
   0.15 =C2=B1 19%      -0.0        0.15 =C2=B1 16%  perf-profile.children.=
cycles-pp.__d_path
> > >       0.05 =C2=B1 54%      -0.0        0.05 =C2=B1 49%      -0.0     =
   0.04 =C2=B1 79%      -0.0        0.05 =C2=B1 52%  perf-profile.children.=
cycles-pp.readlink_copy
> > >       0.08 =C2=B1 51%      -0.0        0.08 =C2=B1 29%      +0.0     =
   0.09 =C2=B1 24%      +0.0        0.11 =C2=B1 20%  perf-profile.children.=
cycles-pp.crng_make_state
> > >       0.12 =C2=B1 23%      -0.0        0.12 =C2=B1 18%      -0.0     =
   0.10 =C2=B1 25%      -0.0        0.11 =C2=B1 25%  perf-profile.children.=
cycles-pp.pcpu_block_update_hint_free
> > >       0.03 =C2=B1 82%      -0.0        0.03 =C2=B1101%      -0.0     =
   0.02 =C2=B1 99%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp._IO_feof
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.unit_name_escape
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      +0.0        0.04 =C2=B1 83%  perf-profile.children.=
cycles-pp.__put_mountpoint
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.02 =C2=B1142%      -0.0        0.00        perf-profile.children.cycle=
s-pp.exc_page_fault
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.02 =C2=B1142%      -0.0        0.00        perf-profile.children.cycle=
s-pp.do_user_addr_fault
> > >       0.02 =C2=B1123%      -0.0        0.02 =C2=B1144%      +0.0     =
   0.03 =C2=B1100%      -0.0        0.02 =C2=B1122%  perf-profile.children.=
cycles-pp.__radix_tree_lookup
> > >       0.02 =C2=B1123%      -0.0        0.02 =C2=B1144%      +0.0     =
   0.04 =C2=B1 73%      +0.0        0.04 =C2=B1 53%  perf-profile.children.=
cycles-pp.should_failslab
> > >       0.14 =C2=B1 27%      -0.0        0.14 =C2=B1 12%      -0.0     =
   0.13 =C2=B1 22%      +0.0        0.15 =C2=B1 26%  perf-profile.children.=
cycles-pp.rcu_segcblist_enqueue
> > >       0.14 =C2=B1 21%      -0.0        0.14 =C2=B1 20%      +0.0     =
   0.14 =C2=B1 20%      -0.0        0.12 =C2=B1 26%  perf-profile.children.=
cycles-pp.__get_obj_cgroup_from_memcg
> > >       3.02 =C2=B1 15%      -0.0        3.02 =C2=B1 11%      +0.2     =
   3.21 =C2=B1 14%      -0.0        3.01 =C2=B1  7%  perf-profile.children.=
cycles-pp.schedule
> > >       0.06 =C2=B1 55%      -0.0        0.06 =C2=B1 49%      -0.0     =
   0.05 =C2=B1 50%      -0.0        0.03 =C2=B1 82%  perf-profile.children.=
cycles-pp.__alloc_skb
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.00        perf-profile.children.cycles-pp.=
timerqueue_del
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.00        perf-profile.children.cycles-pp.=
unit_type_from_string
> > >       0.02 =C2=B1122%      -0.0        0.02 =C2=B1142%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.uncharge_batch
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.place_entity
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.seq_release_private
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycle=
s-pp.ramfs_parse_param
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.01 =C2=B1223%      +0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.propagate_mount_unlock
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.02 =C2=B1141%      +0.0        0.02 =C2=B1122%  perf-profile.children.=
cycles-pp.proc_self_get_link
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.02 =C2=B1142%      +0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.touch_atime
> > >       0.16 =C2=B1 29%      -0.0        0.16 =C2=B1 26%      +0.0     =
   0.16 =C2=B1 18%      +0.0        0.17 =C2=B1 14%  perf-profile.children.=
cycles-pp.queue_delayed_work_on
> > >       0.34 =C2=B1 33%      -0.0        0.34 =C2=B1 14%      +0.0     =
   0.36 =C2=B1 16%      +0.0        0.34 =C2=B1 24%  perf-profile.children.=
cycles-pp.xas_store
> > >       0.79 =C2=B1 29%      -0.0        0.79 =C2=B1 12%      +0.1     =
   0.86 =C2=B1 14%      +0.1        0.89 =C2=B1 13%  perf-profile.children.=
cycles-pp.propagate_mount_busy
> > >       0.06 =C2=B1 58%      -0.0        0.06 =C2=B1 48%      +0.0     =
   0.09 =C2=B1 17%      +0.0        0.06 =C2=B1 52%  perf-profile.children.=
cycles-pp.propagation_next
> > >       0.08 =C2=B1 59%      -0.0        0.08 =C2=B1 25%      -0.0     =
   0.08 =C2=B1 25%      -0.0        0.07 =C2=B1 25%  perf-profile.children.=
cycles-pp.xa_load
> > >       0.08 =C2=B1 61%      -0.0        0.08 =C2=B1 24%      -0.0     =
   0.08 =C2=B1 19%      +0.0        0.10 =C2=B1 25%  perf-profile.children.=
cycles-pp.shmem_parse_one
> > >       0.21 =C2=B1 20%      -0.0        0.20 =C2=B1 13%      -0.0     =
   0.18 =C2=B1 20%      -0.0        0.18 =C2=B1  4%  perf-profile.children.=
cycles-pp.strchr
> > >       0.10 =C2=B1 25%      -0.0        0.10 =C2=B1 19%      -0.0     =
   0.07 =C2=B1 10%      -0.0        0.07 =C2=B1 53%  perf-profile.children.=
cycles-pp.swake_up_one
> > >       0.11 =C2=B1 24%      -0.0        0.10 =C2=B1 16%      +0.0     =
   0.11 =C2=B1 27%      +0.0        0.12 =C2=B1 16%  perf-profile.children.=
cycles-pp.__memset
> > >       0.06 =C2=B1 56%      -0.0        0.06 =C2=B1 47%      -0.0     =
   0.05 =C2=B1 51%      -0.0        0.03 =C2=B1 82%  perf-profile.children.=
cycles-pp.alloc_skb_with_frags
> > >       0.06 =C2=B1 54%      -0.0        0.06 =C2=B1 52%      +0.0     =
   0.08 =C2=B1 31%      +0.0        0.08 =C2=B1 24%  perf-profile.children.=
cycles-pp.folio_batch_move_lru
> > >       0.08 =C2=B1 51%      -0.0        0.08 =C2=B1 25%      +0.0     =
   0.08 =C2=B1 20%      +0.0        0.10 =C2=B1 25%  perf-profile.children.=
cycles-pp.crng_fast_key_erasure
> > >       0.17 =C2=B1 23%      -0.0        0.16 =C2=B1 10%      +0.0     =
   0.20 =C2=B1 22%      -0.0        0.16 =C2=B1 16%  perf-profile.children.=
cycles-pp.__update_load_avg_cfs_rq
> > >       0.03 =C2=B1123%      -0.0        0.02 =C2=B1 99%      +0.0     =
   0.03 =C2=B1101%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp._dbus_first_type_in_signature
> > >       0.23 =C2=B1 30%      -0.0        0.23 =C2=B1 11%      -0.0     =
   0.23 =C2=B1 11%      -0.0        0.22 =C2=B1 12%  perf-profile.children.=
cycles-pp.__close_nocancel
> > >       0.20 =C2=B1 33%      -0.0        0.20 =C2=B1 22%      +0.0     =
   0.22 =C2=B1 13%      +0.0        0.23 =C2=B1 18%  perf-profile.children.=
cycles-pp.__list_del_entry_valid
> > >       2.21 =C2=B1 16%      -0.0        2.21 =C2=B1  4%      -0.0     =
   2.17 =C2=B1  5%      -0.1        2.12 =C2=B1  3%  perf-profile.children.=
cycles-pp.filename_lookup
> > >       0.10 =C2=B1 32%      -0.0        0.10 =C2=B1 25%      -0.0     =
   0.10 =C2=B1 29%      -0.0        0.08 =C2=B1 13%  perf-profile.children.=
cycles-pp.__d_add
> > >       0.29 =C2=B1 36%      -0.0        0.29 =C2=B1 11%      -0.0     =
   0.29 =C2=B1 13%      -0.0        0.29 =C2=B1 17%  perf-profile.children.=
cycles-pp.vfs_unlink
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.mount=
_too_revealing
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp._orde=
red_hashmap_ensure_allocated
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.__x64=
_sys_exit_group
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.bprm_=
execve
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.do_gr=
oup_exit
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.do_ex=
it
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.exec_=
binprm
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.searc=
h_binary_handler
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.load_=
elf_binary
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.stres=
s_mwc1
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.rcu_e=
xp_jiffies_till_stall_check
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.__seq=
_open_private
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.seq_o=
pen_private
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.__x64=
_sys_poll
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.appar=
mor_sb_mount
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.do_sy=
s_poll
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.from_=
kuid_munged
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.locks=
_remove_posix
> > >       0.24 =C2=B1 18%      +0.0        0.24 =C2=B1 13%      +0.0     =
   0.24 =C2=B1 11%      +0.0        0.26 =C2=B1  4%  perf-profile.children.=
cycles-pp.strlen
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.__f=
snotify_parent
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.fre=
e_and_strdup
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.sim=
ple_strntoull
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.hrt=
imer_get_next_event
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.mem=
parse
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.tic=
k_nohz_tick_stopped
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.asm=
_sysvec_irq_work
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.sys=
vec_irq_work
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.__s=
ysvec_irq_work
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.irq=
_work_run
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.irq=
_work_single
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp._pr=
intk
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.vpr=
intk_emit
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.con=
sole_unlock
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.con=
sole_flush_all
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.sch=
ed_clock
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.spr=
intf
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.rea=
d_counters
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.__x=
64_sys_connect
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.__s=
ys_connect
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.che=
ck_cfs_rq_runtime
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.__t=
raverse_mounts
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.__p=
ut_super
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.i_c=
allback
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-p=
p.security_inode_init_security
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-p=
p.default_send_IPI_single_phys
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-p=
p.insert_work
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-p=
p.xas_find_marked
> > >       0.02 =C2=B1122%      +0.0        0.02 =C2=B1141%      +0.0     =
   0.03 =C2=B1100%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.local_clock
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.wak=
e_up_bit
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.vma=
p_pages_pud_range
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.all=
oc_pages
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-p=
p.simple_unlink
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.02 =C2=B1122%  perf-profile.children.cycles-p=
p.free_unref_page_list
> > >       0.02 =C2=B1122%      +0.0        0.02 =C2=B1144%      +0.0     =
   0.03 =C2=B1100%      +0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.__unfreeze_partials
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1141%      +0.0        0.00        perf-profile.children.cycles-pp.__b=
itmap_set
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1141%      +0.0        0.00        perf-profile.children.cycles-pp.cmd=
_stat
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1141%      +0.0        0.00        perf-profile.children.cycles-pp.iho=
ld
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1141%      +0.0        0.00        perf-profile.children.cycles-pp.dis=
patch_events
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1141%      +0.0        0.00        perf-profile.children.cycles-pp.pro=
cess_interval
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1141%      +0.0        0.02 =C2=B1123%  perf-profile.children.cycles-p=
p.__calc_delta
> > >       0.01 =C2=B1200%      +0.0        0.01 =C2=B1223%      +0.0     =
   0.03 =C2=B1102%      +0.0        0.04 =C2=B1 85%  perf-profile.children.=
cycles-pp.__mod_memcg_lruvec_state
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1144%      +0.0        0.00        perf-profile.children.cycles-pp.cpu=
_stopper_thread
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1 99%      +0.0        0.00        perf-profile.children.cycles-pp.inv=
ent_group_ids
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1 99%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-p=
p.clear_page_erms
> > >       0.37 =C2=B1 22%      +0.0        0.37 =C2=B1  9%      -0.0     =
   0.34 =C2=B1  7%      -0.0        0.33 =C2=B1 11%  perf-profile.children.=
cycles-pp.init_file
> > >       0.52 =C2=B1 24%      +0.0        0.52 =C2=B1 11%      -0.0     =
   0.50 =C2=B1 16%      -0.1        0.46 =C2=B1 10%  perf-profile.children.=
cycles-pp.rdrand
> > >       0.18 =C2=B1 36%      +0.0        0.18 =C2=B1 21%      -0.0     =
   0.17 =C2=B1 23%      -0.0        0.17 =C2=B1 15%  perf-profile.children.=
cycles-pp.strndup_user
> > >       0.12 =C2=B1 27%      +0.0        0.12 =C2=B1 18%      +0.0     =
   0.12 =C2=B1 27%      +0.0        0.12 =C2=B1 12%  perf-profile.children.=
cycles-pp.fput
> > >       2.10 =C2=B1 25%      +0.0        2.10 =C2=B1  9%      -0.0     =
   2.08 =C2=B1 13%      -0.1        2.00 =C2=B1 10%  perf-profile.children.=
cycles-pp.openat64
> > >       0.02 =C2=B1125%      +0.0        0.02 =C2=B1 99%      -0.0     =
   0.02 =C2=B1142%      -0.0        0.00        perf-profile.children.cycle=
s-pp.inode_maybe_inc_iversion
> > >       0.08 =C2=B1 54%      +0.0        0.08 =C2=B1 24%      +0.0     =
   0.09 =C2=B1 22%      +0.0        0.11 =C2=B1 18%  perf-profile.children.=
cycles-pp.uuid_gen
> > >       0.01 =C2=B1200%      +0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      +0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.inode_sb_list_add
> > >       0.20 =C2=B1 36%      +0.0        0.20 =C2=B1  9%      -0.0     =
   0.19 =C2=B1 25%      +0.0        0.22 =C2=B1 10%  perf-profile.children.=
cycles-pp.commit_tree
> > >       0.26 =C2=B1 33%      +0.0        0.26 =C2=B1 11%      +0.0     =
   0.30 =C2=B1  5%      +0.0        0.29 =C2=B1 11%  perf-profile.children.=
cycles-pp.kernfs_iop_permission
> > >       0.11 =C2=B1 16%      +0.0        0.11 =C2=B1 19%      -0.0     =
   0.10 =C2=B1 21%      -0.0        0.10 =C2=B1  9%  perf-profile.children.=
cycles-pp.strcmp
> > >       0.01 =C2=B1200%      +0.0        0.01 =C2=B1223%      -0.0     =
   0.00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.dbus_message_get_interface
> > >       0.01 =C2=B1200%      +0.0        0.01 =C2=B1223%      -0.0     =
   0.00            +0.0        0.02 =C2=B1123%  perf-profile.children.cycle=
s-pp.ep_item_poll
> > >       0.09 =C2=B1 58%      +0.0        0.09 =C2=B1 14%      +0.0     =
   0.10 =C2=B1  7%      +0.0        0.12 =C2=B1 16%  perf-profile.children.=
cycles-pp.shmem_parse_options
> > >       0.13 =C2=B1 31%      +0.0        0.13 =C2=B1 17%      +0.0     =
   0.14 =C2=B1 18%      +0.0        0.14 =C2=B1 21%  perf-profile.children.=
cycles-pp._hashmap_first_key_and_value
> > >       0.15 =C2=B1 35%      +0.0        0.15 =C2=B1 13%      +0.0     =
   0.16 =C2=B1 18%      +0.0        0.16 =C2=B1 16%  perf-profile.children.=
cycles-pp.siphash24_init
> > >       0.10 =C2=B1 21%      +0.0        0.10 =C2=B1 25%      +0.0     =
   0.10 =C2=B1 13%      +0.0        0.12 =C2=B1 22%  perf-profile.children.=
cycles-pp.__destroy_inode
> > >       0.04 =C2=B1 83%      +0.0        0.04 =C2=B1 71%      -0.0     =
   0.00            +0.0        0.04 =C2=B1 83%  perf-profile.children.cycle=
s-pp.xas_clear_mark
> > >       0.07 =C2=B1 67%      +0.0        0.08 =C2=B1 14%      -0.0     =
   0.06 =C2=B1 46%      -0.0        0.05 =C2=B1 53%  perf-profile.children.=
cycles-pp.string_table_lookup
> > >       0.14 =C2=B1 25%      +0.0        0.15 =C2=B1 24%      +0.0     =
   0.15 =C2=B1 16%      +0.0        0.16 =C2=B1 20%  perf-profile.children.=
cycles-pp.security_inode_getattr
> > >       0.18 =C2=B1 30%      +0.0        0.19 =C2=B1 14%      +0.0     =
   0.21 =C2=B1 18%      +0.0        0.23 =C2=B1 11%  perf-profile.children.=
cycles-pp.ida_free
> > >       0.06 =C2=B1 57%      +0.0        0.06 =C2=B1 19%      -0.0     =
   0.06 =C2=B1 75%      -0.0        0.06 =C2=B1 21%  perf-profile.children.=
cycles-pp._hashmap_clear
> > >       0.16 =C2=B1 30%      +0.0        0.16 =C2=B1 21%      +0.0     =
   0.19 =C2=B1 17%      +0.0        0.16 =C2=B1 12%  perf-profile.children.=
cycles-pp.__percpu_counter_init
> > >       0.17 =C2=B1 36%      +0.0        0.18 =C2=B1 15%      +0.0     =
   0.19 =C2=B1 16%      +0.0        0.20 =C2=B1 11%  perf-profile.children.=
cycles-pp.__kmalloc
> > >       0.36 =C2=B1 16%      +0.0        0.36 =C2=B1 11%      -0.0     =
   0.34 =C2=B1 14%      +0.0        0.39 =C2=B1  9%  perf-profile.children.=
cycles-pp.__d_lookup_rcu
> > >       0.21 =C2=B1 24%      +0.0        0.21 =C2=B1 13%      -0.0     =
   0.19 =C2=B1 12%      -0.0        0.20 =C2=B1 15%  perf-profile.children.=
cycles-pp.string_escape_mem
> > >       0.06 =C2=B1 61%      +0.0        0.06 =C2=B1 52%      +0.0     =
   0.07 =C2=B1 16%      +0.0        0.06 =C2=B1 54%  perf-profile.children.=
cycles-pp.delete_from_page_cache_batch
> > >       0.04 =C2=B1 90%      +0.0        0.04 =C2=B1 73%      +0.0     =
   0.08 =C2=B1 20%      +0.0        0.07 =C2=B1 28%  perf-profile.children.=
cycles-pp.set_anon_super_fc
> > >       0.13 =C2=B1 30%      +0.0        0.13 =C2=B1 20%      -0.0     =
   0.11 =C2=B1 20%      +0.0        0.13 =C2=B1 25%  perf-profile.children.=
cycles-pp.up_write
> > >       0.24 =C2=B1 36%      +0.0        0.24 =C2=B1 18%      +0.1     =
   0.29 =C2=B1 17%      +0.0        0.26 =C2=B1 16%  perf-profile.children.=
cycles-pp.shrink_dcache_for_umount
> > >       0.22 =C2=B1 28%      +0.0        0.22 =C2=B1 15%      -0.0     =
   0.22 =C2=B1 10%      -0.0        0.20 =C2=B1 11%  perf-profile.children.=
cycles-pp.number
> > >       0.14 =C2=B1 18%      +0.0        0.14 =C2=B1 10%      +0.0     =
   0.15 =C2=B1 10%      +0.0        0.16 =C2=B1 13%  perf-profile.children.=
cycles-pp.mutex_unlock
> > >       0.06 =C2=B1 51%      +0.0        0.07 =C2=B1 30%      +0.0     =
   0.07 =C2=B1 13%      -0.0        0.06 =C2=B1 51%  perf-profile.children.=
cycles-pp.chacha_permute
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1141%      -0.0     =
   0.00            -0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.simple_write_end
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1141%      -0.0     =
   0.01 =C2=B1223%      +0.0        0.02 =C2=B1125%  perf-profile.children.=
cycles-pp.__rdgsbase_inactive
> > >       0.06 =C2=B1 51%      +0.0        0.07 =C2=B1 53%      +0.0     =
   0.07 =C2=B1 18%      +0.0        0.07 =C2=B1 23%  perf-profile.children.=
cycles-pp.mnt_want_write
> > >       0.06 =C2=B1 82%      +0.0        0.07 =C2=B1 47%      +0.0     =
   0.08 =C2=B1 20%      +0.0        0.09 =C2=B1 25%  perf-profile.children.=
cycles-pp.zero_user_segments
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1141%      +0.0     =
   0.05 =C2=B1 46%      +0.0        0.02 =C2=B1122%  perf-profile.children.=
cycles-pp.d_delete
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1141%      +0.0     =
   0.05 =C2=B1 48%      +0.0        0.04 =C2=B1 83%  perf-profile.children.=
cycles-pp.update_min_vruntime
> > >       0.02 =C2=B1123%      +0.0        0.03 =C2=B1100%      -0.0     =
   0.00            -0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.m_next
> > >       0.03 =C2=B1 82%      +0.0        0.04 =C2=B1 73%      +0.0     =
   0.05 =C2=B1 45%      -0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.__hrtimer_next_event_base
> > >       0.15 =C2=B1 25%      +0.0        0.16 =C2=B1 19%      +0.0     =
   0.15 =C2=B1 24%      +0.0        0.17 =C2=B1 13%  perf-profile.children.=
cycles-pp.copy_mount_options
> > >       0.07 =C2=B1 56%      +0.0        0.08 =C2=B1 35%      +0.0     =
   0.10 =C2=B1 20%      +0.0        0.09 =C2=B1 18%  perf-profile.children.=
cycles-pp.free@plt
> > >       0.11 =C2=B1 20%      +0.0        0.12 =C2=B1 14%      +0.0     =
   0.12 =C2=B1 21%      +0.0        0.12 =C2=B1 13%  perf-profile.children.=
cycles-pp.refill_obj_stock
> > >       0.13 =C2=B1 32%      +0.0        0.14 =C2=B1 16%      -0.0     =
   0.12 =C2=B1 26%      -0.0        0.11 =C2=B1 12%  perf-profile.children.=
cycles-pp.simple_lookup
> > >       0.10 =C2=B1 32%      +0.0        0.10 =C2=B1 12%      +0.0     =
   0.10 =C2=B1 16%      +0.0        0.10 =C2=B1 11%  perf-profile.children.=
cycles-pp.iput
> > >       0.03 =C2=B1122%      +0.0        0.03 =C2=B1111%      +0.0     =
   0.05 =C2=B1 74%      +0.0        0.05 =C2=B1 52%  perf-profile.children.=
cycles-pp.kmalloc_slab
> > >       0.04 =C2=B1 83%      +0.0        0.04 =C2=B1 71%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.wake_up_q
> > >       0.04 =C2=B1 85%      +0.0        0.04 =C2=B1 73%      +0.0     =
   0.04 =C2=B1 72%      +0.0        0.04 =C2=B1 82%  perf-profile.children.=
cycles-pp.__fs_parse
> > >       0.04 =C2=B1 87%      +0.0        0.04 =C2=B1 75%      -0.0     =
   0.03 =C2=B1101%      +0.0        0.05 =C2=B1 53%  perf-profile.children.=
cycles-pp.synchronize_srcu
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1141%      +0.0     =
   0.02 =C2=B1144%      +0.0        0.03 =C2=B1 82%  perf-profile.children.=
cycles-pp.find_lock_entries
> > >       0.07 =C2=B1 60%      +0.0        0.08 =C2=B1 28%      +0.0     =
   0.08 =C2=B1 22%      -0.0        0.06 =C2=B1 12%  perf-profile.children.=
cycles-pp.shmem_file_read_iter
> > >       0.09 =C2=B1 25%      +0.0        0.10 =C2=B1 18%      +0.0     =
   0.10 =C2=B1 11%      +0.0        0.10 =C2=B1 19%  perf-profile.children.=
cycles-pp._IO_default_xsputn
> > >       0.07 =C2=B1 57%      +0.0        0.08 =C2=B1 42%      +0.0     =
   0.08 =C2=B1 36%      +0.0        0.07 =C2=B1 87%  perf-profile.children.=
cycles-pp.ktime_get_update_offsets_now
> > >       0.06 =C2=B1 57%      +0.0        0.07 =C2=B1 49%      +0.0     =
   0.07 =C2=B1 14%      -0.0        0.06 =C2=B1 12%  perf-profile.children.=
cycles-pp.rcu_exp_handler
> > >       0.19 =C2=B1 21%      +0.0        0.20 =C2=B1 15%      +0.0     =
   0.20 =C2=B1 21%      +0.0        0.23 =C2=B1 24%  perf-profile.children.=
cycles-pp.__filemap_get_folio
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1141%      +0.0     =
   0.01 =C2=B1223%      +0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.autofs_show_options
> > >       0.02 =C2=B1122%      +0.0        0.03 =C2=B1100%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cycle=
s-pp.note_gp_changes
> > >       0.28 =C2=B1 28%      +0.0        0.28 =C2=B1 20%      +0.0     =
   0.30 =C2=B1 18%      +0.0        0.29 =C2=B1  7%  perf-profile.children.=
cycles-pp.set_next_entity
> > >       0.10 =C2=B1 23%      +0.0        0.10 =C2=B1 18%      -0.0     =
   0.09 =C2=B1 15%      +0.0        0.11 =C2=B1 26%  perf-profile.children.=
cycles-pp.filemap_add_folio
> > >       0.07 =C2=B1 57%      +0.0        0.07 =C2=B1 10%      +0.0     =
   0.09 =C2=B1 33%      -0.0        0.06 =C2=B1 54%  perf-profile.children.=
cycles-pp.xas_alloc
> > >       0.11 =C2=B1 25%      +0.0        0.12 =C2=B1 28%      +0.0     =
   0.12 =C2=B1 15%      +0.0        0.12 =C2=B1 18%  perf-profile.children.=
cycles-pp.realloc
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1146%      +0.0     =
   0.03 =C2=B1101%      -0.0        0.00        perf-profile.children.cycle=
s-pp.check_cpu_stall
> > >       0.06 =C2=B1 50%      +0.0        0.07 =C2=B1 45%      +0.0     =
   0.08 =C2=B1 21%      +0.0        0.06 =C2=B1 18%  perf-profile.children.=
cycles-pp.__lookup_slow
> > >       0.11 =C2=B1 38%      +0.0        0.12 =C2=B1 23%      +0.0     =
   0.12 =C2=B1 23%      +0.0        0.12 =C2=B1 14%  perf-profile.children.=
cycles-pp.rwsem_spin_on_owner
> > >       0.06 =C2=B1 85%      +0.0        0.07 =C2=B1 20%      +0.0     =
   0.08 =C2=B1 30%      -0.0        0.06 =C2=B1 56%  perf-profile.children.=
cycles-pp.stress_ramfs_child
> > >       1.14 =C2=B1 25%      +0.0        1.15 =C2=B1  9%      +0.0     =
   1.17 =C2=B1  6%      -0.0        1.13 =C2=B1  6%  perf-profile.children.=
cycles-pp.__lxstat64
> > >       0.03 =C2=B1 81%      +0.0        0.04 =C2=B1 75%      +0.0     =
   0.04 =C2=B1 45%      +0.0        0.07 =C2=B1 23%  perf-profile.children.=
cycles-pp.strscpy
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.memcm=
p@plt
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.copy_=
msghdr_from_user
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.genui=
ne_random_bytes
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.avail=
able_idle_cpu
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.put_c=
pu_partial
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.set_s=
trjoin
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.cap_c=
apable
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.mnt_t=
able_next_fs
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.do_mm=
ap
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.ksys_=
write
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.vfs_w=
rite
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.vm_mm=
ap_pgoff
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.mmap_=
region
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.ct_ke=
rnel_exit
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.=
string
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.=
from_kgid_munged
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.=
pick_file
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.children.cycles-pp.=
security_sb_mount
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.02 =C2=B1123%  perf-profile.children.cycles-pp.=
mnt_reset_fs
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.=
strdup@plt
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.=
rcu_sync_dtor
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.=
_IO_link_in
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.security_path_mknod
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.=
lru_add_fn
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.x86_pmu_disable
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
02 =C2=B1141%      +0.0        0.00        perf-profile.children.cycles-pp.=
call_cpuidle
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
02 =C2=B1141%      +0.0        0.00        perf-profile.children.cycles-pp.=
devpts_show_options
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
02 =C2=B1141%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.switch_fpu_return
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
03 =C2=B1101%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.__vmap_pages_range_noflush
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1142%      +0.0     =
   0.05 =C2=B1 46%      +0.0        0.02 =C2=B1122%  perf-profile.children.=
cycles-pp.hrtimer_update_next_event
> > >       0.17 =C2=B1 27%      +0.0        0.18 =C2=B1 11%      +0.0     =
   0.17 =C2=B1 10%      -0.0        0.15 =C2=B1  9%  perf-profile.children.=
cycles-pp.apparmor_file_alloc_security
> > >       0.12 =C2=B1 56%      +0.0        0.13 =C2=B1 18%      -0.0     =
   0.11 =C2=B1 20%      -0.0        0.11 =C2=B1 26%  perf-profile.children.=
cycles-pp.strlcat
> > >       0.05 =C2=B1 53%      +0.0        0.06 =C2=B1 47%      +0.0     =
   0.07 =C2=B1 15%      +0.0        0.05 =C2=B1 55%  perf-profile.children.=
cycles-pp.rcu_nocb_try_bypass
> > >       0.05 =C2=B1 84%      +0.0        0.06 =C2=B1 50%      +0.0     =
   0.08 =C2=B1 22%      -0.0        0.05 =C2=B1 90%  perf-profile.children.=
cycles-pp.d_set_mounted
> > >       0.24 =C2=B1109%      +0.0        0.25 =C2=B1 91%      -0.0     =
   0.21 =C2=B1133%      +0.0        0.27 =C2=B1 89%  perf-profile.children.=
cycles-pp.irq_enter_rcu
> > >       0.33 =C2=B1 32%      +0.0        0.34 =C2=B1 17%      +0.0     =
   0.33 =C2=B1 13%      +0.0        0.34 =C2=B1  9%  perf-profile.children.=
cycles-pp.__kmalloc_node_track_caller
> > >       0.07 =C2=B1 53%      +0.0        0.08 =C2=B1 26%      -0.0     =
   0.03 =C2=B1100%      -0.0        0.04 =C2=B1 85%  perf-profile.children.=
cycles-pp.switch_mm_irqs_off
> > >       0.10 =C2=B1 37%      +0.0        0.10 =C2=B1 20%      +0.0     =
   0.11 =C2=B1 18%      +0.0        0.12 =C2=B1 22%  perf-profile.children.=
cycles-pp.ramfs_mkdir
> > >       0.23 =C2=B1114%      +0.0        0.24 =C2=B1 92%      -0.0     =
   0.19 =C2=B1145%      +0.0        0.26 =C2=B1 91%  perf-profile.children.=
cycles-pp.tick_irq_enter
> > >       0.06 =C2=B1 30%      +0.0        0.07 =C2=B1 25%      +0.0     =
   0.08 =C2=B1 57%      +0.0        0.06 =C2=B1 12%  perf-profile.children.=
cycles-pp.chase_symlinks
> > >       0.03 =C2=B1 82%      +0.0        0.04 =C2=B1 71%      -0.0     =
   0.03 =C2=B1100%      +0.0        0.03 =C2=B1 82%  perf-profile.children.=
cycles-pp.memcg_account_kmem
> > >       0.06 =C2=B1 12%      +0.0        0.07 =C2=B1 20%      -0.0     =
   0.05 =C2=B1 73%      -0.0        0.05 =C2=B1 51%  perf-profile.children.=
cycles-pp.security_file_open
> > >       0.09 =C2=B1 81%      +0.0        0.10 =C2=B1 19%      +0.0     =
   0.10 =C2=B1 22%      +0.0        0.12 =C2=B1 26%  perf-profile.children.=
cycles-pp.may_delete
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.set_c=
ached_acl
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.pcpu_=
chunk_relocate
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1144%      +0.0     =
   0.02 =C2=B1143%      +0.0        0.03 =C2=B1 82%  perf-profile.children.=
cycles-pp.vmalloc_to_page
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
02 =C2=B1142%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.pick_link
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
04 =C2=B1101%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.clear_inode
> > >       0.23 =C2=B1 20%      +0.0        0.24 =C2=B1 14%      -0.0     =
   0.22 =C2=B1 19%      -0.0        0.22 =C2=B1 12%  perf-profile.children.=
cycles-pp.pcpu_free_area
> > >       0.08 =C2=B1 51%      +0.0        0.09 =C2=B1 23%      +0.0     =
   0.10 =C2=B1 21%      +0.0        0.11 =C2=B1 15%  perf-profile.children.=
cycles-pp.lockref_put_or_lock
> > >       0.19 =C2=B1 30%      +0.0        0.20 =C2=B1 13%      +0.0     =
   0.20 =C2=B1 10%      -0.0        0.19 =C2=B1 20%  perf-profile.children.=
cycles-pp.prepare_task_switch
> > >       0.66 =C2=B1 29%      +0.0        0.67 =C2=B1 15%      +0.0     =
   0.69 =C2=B1 18%      +0.0        0.67 =C2=B1  7%  perf-profile.children.=
cycles-pp.lookup_open
> > >       0.06 =C2=B1 58%      +0.0        0.07 =C2=B1 14%      +0.0     =
   0.07 =C2=B1 14%      +0.0        0.06 =C2=B1 50%  perf-profile.children.=
cycles-pp.d_instantiate
> > >       0.03 =C2=B1123%      +0.0        0.04 =C2=B1 71%      -0.0     =
   0.02 =C2=B1146%      +0.0        0.03 =C2=B1 82%  perf-profile.children.=
cycles-pp.seq_dentry
> > >       0.29 =C2=B1 16%      +0.0        0.30 =C2=B1 24%      +0.0     =
   0.32 =C2=B1  9%      +0.0        0.31 =C2=B1 14%  perf-profile.children.=
cycles-pp._raw_spin_lock_irq
> > >       0.07 =C2=B1 57%      +0.0        0.08 =C2=B1 28%      +0.0     =
   0.10 =C2=B1 31%      +0.0        0.08 =C2=B1 15%  perf-profile.children.=
cycles-pp.shmem_put_super
> > >       0.16 =C2=B1 23%      +0.0        0.18 =C2=B1  5%      +0.0     =
   0.17 =C2=B1  9%      +0.0        0.20 =C2=B1 11%  perf-profile.children.=
cycles-pp.get_nr_inodes
> > >       0.27 =C2=B1 14%      +0.0        0.28 =C2=B1 10%      +0.0     =
   0.28 =C2=B1 10%      -0.0        0.26 =C2=B1  9%  perf-profile.children.=
cycles-pp.native_sched_clock
> > >       0.04 =C2=B1 85%      +0.0        0.05 =C2=B1 49%      -0.0     =
   0.02 =C2=B1144%      -0.0        0.03 =C2=B1127%  perf-profile.children.=
cycles-pp.select_task_rq_fair
> > >       0.10 =C2=B1 28%      +0.0        0.11 =C2=B1 10%      -0.0     =
   0.10 =C2=B1 26%      +0.0        0.11 =C2=B1 25%  perf-profile.children.=
cycles-pp.add_uevent_var
> > >       0.07 =C2=B1 25%      +0.0        0.08 =C2=B1 20%      +0.0     =
   0.07 =C2=B1 21%      -0.0        0.05 =C2=B1 56%  perf-profile.children.=
cycles-pp.map_id_up
> > >       0.70 =C2=B1 28%      +0.0        0.71 =C2=B1 16%      +0.0     =
   0.71 =C2=B1 16%      -0.0        0.70 =C2=B1  8%  perf-profile.children.=
cycles-pp.filename_create
> > >       0.27 =C2=B1 25%      +0.0        0.28 =C2=B1 17%      +0.1     =
   0.32 =C2=B1 13%      +0.1        0.32 =C2=B1 17%  perf-profile.children.=
cycles-pp.__switch_to_asm
> > >       0.11 =C2=B1 36%      +0.0        0.12 =C2=B1 17%      +0.0     =
   0.12 =C2=B1 29%      +0.0        0.11 =C2=B1 17%  perf-profile.children.=
cycles-pp.shmem_evict_inode
> > >       0.13 =C2=B1 33%      +0.0        0.14 =C2=B1  9%      -0.0     =
   0.12 =C2=B1 18%      +0.0        0.14 =C2=B1  7%  perf-profile.children.=
cycles-pp.seq_puts
> > >       1.86 =C2=B1 23%      +0.0        1.87 =C2=B1 10%      -0.2     =
   1.70 =C2=B1 13%      -0.1        1.76 =C2=B1  8%  perf-profile.children.=
cycles-pp.show_mountinfo
> > >       1.43 =C2=B1 23%      +0.0        1.45 =C2=B1  7%      -0.1     =
   1.36 =C2=B1 14%      -0.1        1.34 =C2=B1  7%  perf-profile.children.=
cycles-pp.siphash24_compress
> > >       0.13 =C2=B1 22%      +0.0        0.15 =C2=B1 12%      -0.0     =
   0.12 =C2=B1 21%      -0.0        0.13 =C2=B1 19%  perf-profile.children.=
cycles-pp.alloc_fd
> > >       0.01 =C2=B1200%      +0.0        0.03 =C2=B1100%      +0.0     =
   0.04 =C2=B1103%      +0.1        0.07 =C2=B1 12%  perf-profile.children.=
cycles-pp.__bitmap_clear
> > >       0.09 =C2=B1 39%      +0.0        0.11 =C2=B1 40%      -0.0     =
   0.08 =C2=B1 58%      +0.0        0.09 =C2=B1 18%  perf-profile.children.=
cycles-pp.llist_add_batch
> > >       0.06 =C2=B1 59%      +0.0        0.08 =C2=B1 27%      +0.0     =
   0.09 =C2=B1 32%      +0.0        0.07 =C2=B1 19%  perf-profile.children.=
cycles-pp.percpu_counter_destroy
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1145%      +0.0     =
   0.03 =C2=B1100%      +0.0        0.03 =C2=B1 81%  perf-profile.children.=
cycles-pp.path_compare@plt
> > >       0.07 =C2=B1 57%      +0.0        0.08 =C2=B1 44%      -0.0     =
   0.07 =C2=B1 16%      -0.0        0.06 =C2=B1 12%  perf-profile.children.=
cycles-pp.path_hash_func
> > >       0.08 =C2=B1 23%      +0.0        0.10 =C2=B1 16%      +0.0     =
   0.08 =C2=B1 11%      +0.0        0.11 =C2=B1 26%  perf-profile.children.=
cycles-pp.__filemap_add_folio
> > >       0.03 =C2=B1 81%      +0.0        0.04 =C2=B1 73%      -0.0     =
   0.00            +0.0        0.05 =C2=B1 51%  perf-profile.children.cycle=
s-pp.cpuacct_charge
> > >       0.10 =C2=B1 26%      +0.0        0.11 =C2=B1 14%      -0.0     =
   0.10 =C2=B1 24%      +0.0        0.11 =C2=B1 23%  perf-profile.children.=
cycles-pp.hashmap_replace
> > >       0.05 =C2=B1 52%      +0.0        0.06 =C2=B1 17%      +0.0     =
   0.05 =C2=B1 47%      -0.0        0.04 =C2=B1 50%  perf-profile.children.=
cycles-pp.kmemdup_nul
> > >       0.04 =C2=B1 82%      +0.0        0.05 =C2=B1 71%      +0.0     =
   0.06 =C2=B1 46%      +0.0        0.05 =C2=B1 52%  perf-profile.children.=
cycles-pp._raw_read_lock_irqsave
> > >       0.07 =C2=B1 61%      +0.0        0.08 =C2=B1 16%      -0.0     =
   0.06 =C2=B1 45%      +0.0        0.09 =C2=B1 30%  perf-profile.children.=
cycles-pp.strcspn@plt
> > >       0.04 =C2=B1 83%      +0.0        0.05 =C2=B1 47%      +0.0     =
   0.06 =C2=B1 47%      +0.0        0.04 =C2=B1 50%  perf-profile.children.=
cycles-pp.shmem_free_in_core_inode
> > >       0.65 =C2=B1 19%      +0.0        0.66 =C2=B1 15%      +0.0     =
   0.67 =C2=B1 13%      +0.0        0.68 =C2=B1 12%  perf-profile.children.=
cycles-pp.memcg_slab_post_alloc_hook
> > >       0.05 =C2=B1 82%      +0.0        0.07 =C2=B1 15%      +0.0     =
   0.10 =C2=B1 42%      +0.0        0.08 =C2=B1 52%  perf-profile.children.=
cycles-pp.prealloc_shrinker
> > >       0.11 =C2=B1 20%      +0.0        0.13 =C2=B1 15%      +0.0     =
   0.12 =C2=B1  6%      +0.0        0.14 =C2=B1 17%  perf-profile.children.=
cycles-pp.kernfs_get_target_path
> > >       0.05 =C2=B1 81%      +0.0        0.07 =C2=B1 14%      +0.0     =
   0.09 =C2=B1 43%      +0.0        0.08 =C2=B1 51%  perf-profile.children.=
cycles-pp.__prealloc_shrinker
> > >       0.07 =C2=B1 57%      +0.0        0.09 =C2=B1 17%      +0.0     =
   0.10 =C2=B1 25%      +0.0        0.08 =C2=B1 25%  perf-profile.children.=
cycles-pp.allocate_slab
> > >       0.09 =C2=B1 57%      +0.0        0.10 =C2=B1 18%      +0.0     =
   0.10 =C2=B1 30%      +0.0        0.13 =C2=B1 14%  perf-profile.children.=
cycles-pp.release_pages
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1 99%      +0.0     =
   0.02 =C2=B1143%      -0.0        0.00        perf-profile.children.cycle=
s-pp.strnlen_user
> > >       0.24 =C2=B1 17%      +0.0        0.26 =C2=B1 18%      +0.0     =
   0.26 =C2=B1 13%      +0.0        0.27 =C2=B1 12%  perf-profile.children.=
cycles-pp.update_curr
> > >       0.18 =C2=B1 20%      +0.0        0.19 =C2=B1 16%      +0.0     =
   0.18 =C2=B1 21%      +0.0        0.22 =C2=B1 24%  perf-profile.children.=
cycles-pp.pagecache_get_page
> > >       0.11 =C2=B1 38%      +0.0        0.12 =C2=B1 40%      -0.0     =
   0.10 =C2=B1 33%      +0.0        0.11 =C2=B1 22%  perf-profile.children.=
cycles-pp.__smp_call_single_queue
> > >       0.05 =C2=B1 52%      +0.0        0.06 =C2=B1 11%      +0.0     =
   0.05 =C2=B1 47%      +0.0        0.05 =C2=B1 53%  perf-profile.children.=
cycles-pp.vscnprintf
> > >       0.09 =C2=B1 29%      +0.0        0.10 =C2=B1 26%      +0.0     =
   0.10 =C2=B1 19%      +0.0        0.10 =C2=B1 20%  perf-profile.children.=
cycles-pp.string_hash_func
> > >       0.53 =C2=B1 33%      +0.0        0.55 =C2=B1 17%      +0.1     =
   0.59 =C2=B1 20%      +0.0        0.54 =C2=B1 15%  perf-profile.children.=
cycles-pp.rwsem_optimistic_spin
> > >       0.06 =C2=B1 58%      +0.0        0.08 =C2=B1 23%      +0.0     =
   0.07 =C2=B1 15%      +0.0        0.07 =C2=B1 33%  perf-profile.children.=
cycles-pp.path_simplify
> > >       0.12 =C2=B1 27%      +0.0        0.14 =C2=B1 11%      +0.0     =
   0.14 =C2=B1 17%      +0.0        0.14 =C2=B1 22%  perf-profile.children.=
cycles-pp.dev_uevent
> > >       1.00 =C2=B1 15%      +0.0        1.02 =C2=B1 13%      +0.0     =
   1.04 =C2=B1  6%      +0.0        1.01 =C2=B1  8%  perf-profile.children.=
cycles-pp.__cond_resched
> > >       0.03 =C2=B1 82%      +0.0        0.05 =C2=B1 77%      +0.0     =
   0.06 =C2=B1 11%      +0.0        0.04 =C2=B1 50%  perf-profile.children.=
cycles-pp.strlcpy
> > >       0.00            +0.0        0.02 =C2=B1141%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.kernf=
s_unlink_open_file
> > >       0.00            +0.0        0.02 =C2=B1141%      +0.0        0.=
01 =C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.=
d_same_name
> > >       0.00            +0.0        0.02 =C2=B1141%      +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.resched_curr
> > >       0.04 =C2=B1 88%      +0.0        0.06 =C2=B1 49%      +0.0     =
   0.04 =C2=B1 73%      -0.0        0.04 =C2=B1 83%  perf-profile.children.=
cycles-pp.btrfs_show_options
> > >       0.01 =C2=B1200%      +0.0        0.03 =C2=B1100%      +0.0     =
   0.03 =C2=B1102%      +0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.__rw_verify_area
> > >       0.05 =C2=B1 90%      +0.0        0.06 =C2=B1 46%      +0.0     =
   0.07 =C2=B1 54%      -0.0        0.02 =C2=B1122%  perf-profile.children.=
cycles-pp.tick_sched_do_timer
> > >       0.56 =C2=B1 26%      +0.0        0.58 =C2=B1 15%      +0.0     =
   0.59 =C2=B1 17%      +0.0        0.61 =C2=B1 13%  perf-profile.children.=
cycles-pp.vfs_create_mount
> > >       0.01 =C2=B1200%      +0.0        0.03 =C2=B1101%      +0.0     =
   0.03 =C2=B1101%      +0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.apparmor_file_open
> > >       0.16 =C2=B1 17%      +0.0        0.18 =C2=B1 22%      +0.0     =
   0.17 =C2=B1 28%      +0.0        0.17 =C2=B1 14%  perf-profile.children.=
cycles-pp.update_rq_clock
> > >       3.71 =C2=B1 16%      +0.0        3.73 =C2=B1  4%      +0.1     =
   3.76 =C2=B1  9%      -0.1        3.64 =C2=B1  2%  perf-profile.children.=
cycles-pp.path_openat
> > >       0.00            +0.0        0.02 =C2=B1142%      +0.0        0.=
00            +0.0        0.00        perf-profile.children.cycles-pp.cgrou=
p_show_path
> > >       0.00            +0.0        0.02 =C2=B1142%      +0.0        0.=
00            +0.0        0.04 =C2=B1 51%  perf-profile.children.cycles-pp.=
cgroup_rstat_updated
> > >       0.09 =C2=B1 28%      +0.0        0.11 =C2=B1 19%      +0.0     =
   0.10 =C2=B1 14%      +0.0        0.10 =C2=B1 17%  perf-profile.children.=
cycles-pp.make_vfsuid
> > >       3.80 =C2=B1 16%      +0.0        3.82 =C2=B1  4%      +0.0     =
   3.85 =C2=B1  9%      -0.1        3.71 =C2=B1  2%  perf-profile.children.=
cycles-pp.do_filp_open
> > >       0.44 =C2=B1 24%      +0.0        0.46 =C2=B1 11%      +0.0     =
   0.45 =C2=B1 16%      +0.1        0.52 =C2=B1 17%  perf-profile.children.=
cycles-pp.ramfs_symlink
> > >       0.33 =C2=B1 19%      +0.0        0.34 =C2=B1 19%      +0.0     =
   0.36 =C2=B1 17%      +0.0        0.36 =C2=B1  7%  perf-profile.children.=
cycles-pp.check_heap_object
> > >       0.15 =C2=B1 32%      +0.0        0.16 =C2=B1 16%      +0.0     =
   0.16 =C2=B1 37%      +0.0        0.17 =C2=B1 17%  perf-profile.children.=
cycles-pp.wq_worker_sleeping
> > >       0.12 =C2=B1 24%      +0.0        0.14 =C2=B1 17%      +0.0     =
   0.14 =C2=B1 13%      +0.0        0.13 =C2=B1 10%  perf-profile.children.=
cycles-pp._raw_spin_unlock_irqrestore
> > >       0.02 =C2=B1122%      +0.0        0.04 =C2=B1104%      +0.0     =
   0.04 =C2=B1 71%      +0.0        0.06 =C2=B1 18%  perf-profile.children.=
cycles-pp.__libc_calloc
> > >       0.00            +0.0        0.02 =C2=B1141%      +0.0        0.=
05 =C2=B1 45%      +0.0        0.01 =C2=B1200%  perf-profile.children.cycle=
s-pp.__alloc_pages_bulk
> > >       0.00            +0.0        0.02 =C2=B1141%      +0.0        0.=
05 =C2=B1 46%      +0.0        0.02 =C2=B1125%  perf-profile.children.cycle=
s-pp.__vmalloc_area_node
> > >       0.06 =C2=B1 58%      +0.0        0.08 =C2=B1 16%      +0.0     =
   0.06 =C2=B1 51%      +0.0        0.07 =C2=B1 12%  perf-profile.children.=
cycles-pp.dentry_unlink_inode
> > >       1.99 =C2=B1 24%      +0.0        2.01 =C2=B1 10%      +0.2     =
   2.16 =C2=B1 10%      +0.2        2.23 =C2=B1 10%  perf-profile.children.=
cycles-pp.deactivate_locked_super
> > >       0.13 =C2=B1 21%      +0.0        0.15 =C2=B1 15%      -0.0     =
   0.12 =C2=B1 25%      +0.0        0.15 =C2=B1 12%  perf-profile.children.=
cycles-pp.check_preempt_curr
> > >       0.09 =C2=B1 25%      +0.0        0.12 =C2=B1 12%      -0.0     =
   0.09 =C2=B1 21%      -0.0        0.09 =C2=B1 19%  perf-profile.children.=
cycles-pp.d_walk
> > >       0.16 =C2=B1 33%      +0.0        0.18 =C2=B1 11%      +0.0     =
   0.18 =C2=B1 17%      +0.0        0.20 =C2=B1 11%  perf-profile.children.=
cycles-pp.lockref_get_not_dead
> > >       0.73 =C2=B1 22%      +0.0        0.75 =C2=B1 13%      +0.1     =
   0.79 =C2=B1  9%      +0.1        0.79 =C2=B1  5%  perf-profile.children.=
cycles-pp.__check_object_size
> > >       0.00            +0.0        0.02 =C2=B1142%      +0.1        0.=
06 =C2=B1 45%      +0.0        0.04 =C2=B1 53%  perf-profile.children.cycle=
s-pp.__vmalloc_node
> > >       0.00            +0.0        0.02 =C2=B1142%      +0.1        0.=
06 =C2=B1 45%      +0.0        0.04 =C2=B1 53%  perf-profile.children.cycle=
s-pp.pcpu_alloc_chunk
> > >       0.58 =C2=B1 37%      +0.0        0.60 =C2=B1 17%      +0.0     =
   0.62 =C2=B1 20%      +0.0        0.61 =C2=B1 13%  perf-profile.children.=
cycles-pp.shmem_get_inode
> > >       0.05 =C2=B1 54%      +0.0        0.07 =C2=B1 11%      +0.0     =
   0.06 =C2=B1 47%      +0.0        0.05 =C2=B1 53%  perf-profile.children.=
cycles-pp.sysfs_emit_at
> > >       0.05 =C2=B1 53%      +0.0        0.07 =C2=B1 11%      +0.0     =
   0.07 =C2=B1 14%      +0.0        0.07 =C2=B1  7%  perf-profile.children.=
cycles-pp.path_startswith
> > >       0.59 =C2=B1 24%      +0.0        0.61 =C2=B1 11%      +0.0     =
   0.61 =C2=B1 15%      +0.1        0.64 =C2=B1 14%  perf-profile.children.=
cycles-pp.delayed_free_vfsmnt
> > >       0.65 =C2=B1 25%      +0.0        0.67 =C2=B1  5%      +0.0     =
   0.67 =C2=B1 17%      +0.0        0.67 =C2=B1 15%  perf-profile.children.=
cycles-pp.__slab_free
> > >       0.06 =C2=B1 53%      +0.0        0.08 =C2=B1 15%      +0.0     =
   0.07 =C2=B1 47%      +0.0        0.08 =C2=B1 26%  perf-profile.children.=
cycles-pp.memcpy@plt
> > >       0.09 =C2=B1 34%      +0.0        0.11 =C2=B1 14%      +0.0     =
   0.12 =C2=B1 15%      +0.0        0.12 =C2=B1  3%  perf-profile.children.=
cycles-pp.lookup_dcache
> > >       0.07 =C2=B1 55%      +0.0        0.10 =C2=B1 15%      -0.0     =
   0.06 =C2=B1 49%      +0.0        0.08 =C2=B1 13%  perf-profile.children.=
cycles-pp.path_equal
> > >       0.25 =C2=B1 28%      +0.0        0.28 =C2=B1 14%      +0.0     =
   0.26 =C2=B1 19%      +0.1        0.31 =C2=B1 20%  perf-profile.children.=
cycles-pp.simple_write_begin
> > >       0.27 =C2=B1 36%      +0.0        0.30 =C2=B1  9%      +0.0     =
   0.29 =C2=B1  9%      +0.0        0.30 =C2=B1  8%  perf-profile.children.=
cycles-pp.__check_heap_object
> > >       0.05 =C2=B1 55%      +0.0        0.08 =C2=B1 24%      +0.0     =
   0.09 =C2=B1 27%      +0.0        0.09 =C2=B1 27%  perf-profile.children.=
cycles-pp.lru_add_drain_cpu
> > >       0.01 =C2=B1200%      +0.0        0.04 =C2=B1101%      +0.0     =
   0.02 =C2=B1142%      +0.0        0.03 =C2=B1 82%  perf-profile.children.=
cycles-pp.unlock_mount
> > >       0.05 =C2=B1 90%      +0.0        0.07 =C2=B1 12%      -0.0     =
   0.03 =C2=B1100%      -0.0        0.04 =C2=B1 82%  perf-profile.children.=
cycles-pp.unit_file_find_dropin_paths
> > >       0.08 =C2=B1 53%      +0.0        0.10 =C2=B1 22%      +0.0     =
   0.09 =C2=B1  9%      +0.0        0.10 =C2=B1 18%  perf-profile.children.=
cycles-pp.apparmor_file_free_security
> > >       0.09 =C2=B1 52%      +0.0        0.11 =C2=B1 22%      +0.0     =
   0.10 =C2=B1 17%      +0.0        0.10 =C2=B1 17%  perf-profile.children.=
cycles-pp.security_file_free
> > >       0.35 =C2=B1 33%      +0.0        0.37 =C2=B1 18%      +0.0     =
   0.39 =C2=B1 17%      +0.0        0.37 =C2=B1  7%  perf-profile.children.=
cycles-pp.lookup_one_qstr_excl
> > >       0.12 =C2=B1 32%      +0.0        0.14 =C2=B1 27%      +0.0     =
   0.14 =C2=B1 16%      +0.0        0.12 =C2=B1 12%  perf-profile.children.=
cycles-pp.propagate_umount
> > >       0.03 =C2=B1123%      +0.0        0.05 =C2=B1 46%      +0.0     =
   0.06 =C2=B1 47%      +0.0        0.06 =C2=B1  6%  perf-profile.children.=
cycles-pp.__d_instantiate
> > >       0.04 =C2=B1 87%      +0.0        0.06 =C2=B1 16%      +0.0     =
   0.05 =C2=B1 71%      +0.0        0.07 =C2=B1 15%  perf-profile.children.=
cycles-pp.shmem_getattr
> > >       2.53 =C2=B1 25%      +0.0        2.56 =C2=B1 16%      +0.1     =
   2.66 =C2=B1 10%      +0.3        2.81 =C2=B1 13%  perf-profile.children.=
cycles-pp.attach_recursive_mnt
> > >       0.17 =C2=B1 28%      +0.0        0.20 =C2=B1 12%      +0.0     =
   0.19 =C2=B1 13%      +0.0        0.19 =C2=B1 13%  perf-profile.children.=
cycles-pp._find_next_zero_bit
> > >       0.08 =C2=B1 59%      +0.0        0.10 =C2=B1 13%      +0.0     =
   0.09 =C2=B1 27%      +0.0        0.11 =C2=B1 14%  perf-profile.children.=
cycles-pp.check_preempt_wakeup
> > >       0.19 =C2=B1 22%      +0.0        0.22 =C2=B1 12%      +0.0     =
   0.21 =C2=B1 17%      +0.0        0.20 =C2=B1 16%  perf-profile.children.=
cycles-pp.obj_cgroup_charge
> > >       0.01 =C2=B1200%      +0.0        0.04 =C2=B1 71%      +0.0     =
   0.01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.children.=
cycles-pp.filemap_get_entry
> > >       0.18 =C2=B1 27%      +0.0        0.21 =C2=B1 29%      +0.0     =
   0.20 =C2=B1 14%      +0.0        0.20 =C2=B1  9%  perf-profile.children.=
cycles-pp.__virt_addr_valid
> > >       0.01 =C2=B1200%      +0.0        0.04 =C2=B1 75%      +0.0     =
   0.02 =C2=B1142%      +0.0        0.02 =C2=B1123%  perf-profile.children.=
cycles-pp.strextend_with_separator
> > >       0.05 =C2=B1 82%      +0.0        0.08 =C2=B1 37%      +0.0     =
   0.08 =C2=B1 16%      +0.1        0.11 =C2=B1 13%  perf-profile.children.=
cycles-pp.put_fs_context
> > >       0.14 =C2=B1 24%      +0.0        0.17 =C2=B1 15%      +0.0     =
   0.16 =C2=B1 27%      +0.0        0.16 =C2=B1 13%  perf-profile.children.=
cycles-pp.filp_close
> > >       0.04 =C2=B1 93%      +0.0        0.07 =C2=B1 22%      +0.0     =
   0.05 =C2=B1 78%      +0.0        0.07 =C2=B1 24%  perf-profile.children.=
cycles-pp.shmem_undo_range
> > >       0.00            +0.0        0.03 =C2=B1100%      +0.0        0.=
01 =C2=B1223%      +0.0        0.00        perf-profile.children.cycles-pp.=
wq_worker_running
> > >       0.11 =C2=B1 19%      +0.0        0.14 =C2=B1 11%      +0.0     =
   0.12 =C2=B1 12%      +0.0        0.12 =C2=B1 15%  perf-profile.children.=
cycles-pp.memcpy_orig
> > >       0.33 =C2=B1 28%      +0.0        0.36 =C2=B1 14%      +0.0     =
   0.33 =C2=B1 18%      +0.1        0.39 =C2=B1 21%  perf-profile.children.=
cycles-pp.page_symlink
> > >       0.14 =C2=B1 25%      +0.0        0.16 =C2=B1  4%      +0.0     =
   0.14 =C2=B1 17%      +0.1        0.19 =C2=B1 11%  perf-profile.children.=
cycles-pp.kfree
> > >       0.63 =C2=B1 29%      +0.0        0.65 =C2=B1 17%      +0.1     =
   0.70 =C2=B1 15%      +0.0        0.67 =C2=B1  8%  perf-profile.children.=
cycles-pp.evict
> > >       0.04 =C2=B1 83%      +0.0        0.06 =C2=B1 25%      +0.0     =
   0.08 =C2=B1 15%      +0.0        0.07 =C2=B1 12%  perf-profile.children.=
cycles-pp.pcpu_next_fit_region
> > >       0.29 =C2=B1 37%      +0.0        0.32 =C2=B1 13%      -0.0     =
   0.29 =C2=B1 13%      +0.0        0.31 =C2=B1 14%  perf-profile.children.=
cycles-pp.complete_walk
> > >       0.10 =C2=B1 39%      +0.0        0.13 =C2=B1 21%      +0.0     =
   0.12 =C2=B1 15%      +0.0        0.15 =C2=B1 24%  perf-profile.children.=
cycles-pp.mutex_lock_killable
> > >       0.22 =C2=B1 18%      +0.0        0.25 =C2=B1 12%      +0.0     =
   0.23 =C2=B1 12%      +0.0        0.25 =C2=B1 17%  perf-profile.children.=
cycles-pp.kernfs_iop_get_link
> > >       0.11 =C2=B1 24%      +0.0        0.14 =C2=B1 24%      +0.0     =
   0.13 =C2=B1 30%      +0.0        0.14 =C2=B1 12%  perf-profile.children.=
cycles-pp.inode_init_always
> > >       0.07 =C2=B1 55%      +0.0        0.10 =C2=B1 23%      +0.0     =
   0.08 =C2=B1 29%      +0.0        0.10 =C2=B1 17%  perf-profile.children.=
cycles-pp.show_mnt_opts
> > >       0.01 =C2=B1200%      +0.0        0.04 =C2=B1 75%      +0.0     =
   0.03 =C2=B1100%      +0.0        0.04 =C2=B1 51%  perf-profile.children.=
cycles-pp.get_partial_node
> > >       0.00            +0.0        0.03 =C2=B1102%      +0.1        0.=
06 =C2=B1 56%      +0.0        0.03 =C2=B1 82%  perf-profile.children.cycle=
s-pp.pcpu_map_pages
> > >       0.62 =C2=B1 25%      +0.0        0.65 =C2=B1 18%      +0.1     =
   0.67 =C2=B1 14%      +0.1        0.70 =C2=B1  9%  perf-profile.children.=
cycles-pp.do_rmdir
> > >       0.26 =C2=B1 26%      +0.0        0.28 =C2=B1  5%      +0.0     =
   0.28 =C2=B1 16%      +0.0        0.28 =C2=B1 19%  perf-profile.children.=
cycles-pp.sysfs_kf_seq_show
> > >       0.15 =C2=B1 41%      +0.0        0.18 =C2=B1 17%      +0.0     =
   0.19 =C2=B1 18%      +0.0        0.16 =C2=B1 20%  perf-profile.children.=
cycles-pp.shmem_symlink
> > >       0.08 =C2=B1 56%      +0.0        0.11 =C2=B1 17%      +0.0     =
   0.12 =C2=B1 23%      +0.0        0.11 =C2=B1 22%  perf-profile.children.=
cycles-pp.__list_add_valid
> > >       0.57 =C2=B1 32%      +0.0        0.60 =C2=B1 16%      +0.1     =
   0.64 =C2=B1 19%      +0.0        0.60 =C2=B1 17%  perf-profile.children.=
cycles-pp.rwsem_down_write_slowpath
> > >       0.12 =C2=B1 40%      +0.0        0.15 =C2=B1 21%      +0.0     =
   0.13 =C2=B1 17%      +0.0        0.15 =C2=B1 11%  perf-profile.children.=
cycles-pp.synchronize_rcu_expedited_wait
> > >       0.05 =C2=B1 83%      +0.0        0.08 =C2=B1 10%      +0.0     =
   0.08 =C2=B1 17%      +0.0        0.07 =C2=B1 16%  perf-profile.children.=
cycles-pp._atomic_dec_and_lock
> > >       0.00            +0.0        0.03 =C2=B1101%      +0.1        0.=
06 =C2=B1 45%      +0.0        0.04 =C2=B1 53%  perf-profile.children.cycle=
s-pp.pcpu_create_chunk
> > >       0.00            +0.0        0.03 =C2=B1101%      +0.1        0.=
06 =C2=B1 45%      +0.0        0.04 =C2=B1 53%  perf-profile.children.cycle=
s-pp.__vmalloc_node_range
> > >       0.66 =C2=B1 27%      +0.0        0.69 =C2=B1 13%      +0.1     =
   0.74 =C2=B1 14%      +0.1        0.71 =C2=B1 11%  perf-profile.children.=
cycles-pp.do_mkdirat
> > >       0.16 =C2=B1 21%      +0.0        0.19 =C2=B1 25%      +0.0     =
   0.18 =C2=B1 12%      +0.0        0.17 =C2=B1 17%  perf-profile.children.=
cycles-pp.put_prev_entity
> > >       0.84 =C2=B1 25%      +0.0        0.88 =C2=B1 16%      -0.0     =
   0.84 =C2=B1 16%      +0.1        0.90 =C2=B1 12%  perf-profile.children.=
cycles-pp.stress_mwc32
> > >       0.10 =C2=B1 40%      +0.0        0.13 =C2=B1 21%      +0.0     =
   0.11 =C2=B1 20%      +0.0        0.11 =C2=B1 15%  perf-profile.children.=
cycles-pp.synchronize_rcu_expedited_wait_once
> > >       0.01 =C2=B1200%      +0.0        0.04 =C2=B1 71%      +0.0     =
   0.05 =C2=B1 50%      +0.1        0.07 =C2=B1 11%  perf-profile.children.=
cycles-pp.ktime_get_mono_fast_ns
> > >       0.31 =C2=B1 28%      +0.0        0.34 =C2=B1 18%      +0.0     =
   0.34 =C2=B1 15%      +0.0        0.35 =C2=B1  4%  perf-profile.children.=
cycles-pp.rcu_exp_wait_wake
> > >       0.52 =C2=B1 18%      +0.0        0.55 =C2=B1 12%      +0.0     =
   0.55 =C2=B1 11%      +0.0        0.54 =C2=B1 11%  perf-profile.children.=
cycles-pp.__call_rcu_common
> > >       0.34 =C2=B1 19%      +0.0        0.37 =C2=B1 12%      -0.0     =
   0.34 =C2=B1  9%      -0.0        0.33 =C2=B1 11%  perf-profile.children.=
cycles-pp.access
> > >       0.59 =C2=B1 21%      +0.0        0.62 =C2=B1  6%      +0.0     =
   0.62 =C2=B1 11%      +0.0        0.63 =C2=B1  5%  perf-profile.children.=
cycles-pp.step_into
> > >       0.07 =C2=B1 63%      +0.0        0.10 =C2=B1 30%      -0.0     =
   0.06 =C2=B1 48%      +0.0        0.07 =C2=B1 20%  perf-profile.children.=
cycles-pp.ttwu_queue_wakelist
> > >       0.01 =C2=B1200%      +0.0        0.05 =C2=B1 47%      +0.0     =
   0.06 =C2=B1 23%      +0.0        0.06 =C2=B1 23%  perf-profile.children.=
cycles-pp.__kmalloc_node
> > >       0.24 =C2=B1 14%      +0.0        0.28 =C2=B1  9%      +0.0     =
   0.26 =C2=B1 12%      +0.0        0.25 =C2=B1 22%  perf-profile.children.=
cycles-pp.kernfs_dop_revalidate
> > >       1.47 =C2=B1 28%      +0.0        1.50 =C2=B1 13%      +0.2     =
   1.63 =C2=B1 10%      +0.2        1.71 =C2=B1  7%  perf-profile.children.=
cycles-pp._find_next_bit
> > >       0.11 =C2=B1 28%      +0.0        0.14 =C2=B1 23%      +0.0     =
   0.12 =C2=B1 30%      +0.0        0.13 =C2=B1 10%  perf-profile.children.=
cycles-pp.alloc_fs_context
> > >       0.49 =C2=B1 30%      +0.0        0.52 =C2=B1 19%      +0.0     =
   0.54 =C2=B1 19%      +0.0        0.53 =C2=B1 12%  perf-profile.children.=
cycles-pp.__flush_work
> > >       0.73 =C2=B1 27%      +0.0        0.76 =C2=B1 11%      +0.1     =
   0.82 =C2=B1 12%      +0.1        0.79 =C2=B1 12%  perf-profile.children.=
cycles-pp.__x64_sys_mkdir
> > >       0.18 =C2=B1 29%      +0.0        0.22 =C2=B1  9%      -0.0     =
   0.18 =C2=B1 21%      +0.0        0.19 =C2=B1  6%  perf-profile.children.=
cycles-pp.strchr@plt
> > >       0.10 =C2=B1 21%      +0.0        0.14 =C2=B1 27%      +0.0     =
   0.13 =C2=B1 21%      +0.0        0.14 =C2=B1 20%  perf-profile.children.=
cycles-pp.__strdup
> > >       0.03 =C2=B1123%      +0.0        0.06 =C2=B1 21%      +0.0     =
   0.05 =C2=B1 49%      +0.0        0.05 =C2=B1 53%  perf-profile.children.=
cycles-pp.percpu_counter_add_batch
> > >       0.33 =C2=B1 33%      +0.0        0.36 =C2=B1 16%      +0.0     =
   0.36 =C2=B1 14%      +0.1        0.38 =C2=B1  5%  perf-profile.children.=
cycles-pp.truncate_inode_pages_range
> > >       0.08 =C2=B1 27%      +0.0        0.11 =C2=B1 13%      +0.0     =
   0.12 =C2=B1 30%      +0.0        0.11 =C2=B1 13%  perf-profile.children.=
cycles-pp._raw_spin_trylock
> > >       0.14 =C2=B1 28%      +0.0        0.18 =C2=B1 17%      +0.0     =
   0.16 =C2=B1 23%      +0.0        0.14 =C2=B1 27%  perf-profile.children.=
cycles-pp.device_read_uevent_file
> > >       0.24 =C2=B1 24%      +0.0        0.28 =C2=B1  5%      +0.0     =
   0.26 =C2=B1 15%      +0.0        0.27 =C2=B1 21%  perf-profile.children.=
cycles-pp.dev_attr_show
> > >       0.70 =C2=B1 25%      +0.0        0.74 =C2=B1 16%      +0.1     =
   0.75 =C2=B1 15%      +0.1        0.78 =C2=B1 12%  perf-profile.children.=
cycles-pp.unregister_shrinker
> > >       0.53 =C2=B1 25%      +0.0        0.56 =C2=B1  9%      -0.0     =
   0.53 =C2=B1 15%      +0.0        0.53 =C2=B1 11%  perf-profile.children.=
cycles-pp.device_read_db_internal_filename
> > >       0.32 =C2=B1 20%      +0.0        0.36 =C2=B1 11%      +0.0     =
   0.33 =C2=B1  9%      -0.0        0.31 =C2=B1 10%  perf-profile.children.=
cycles-pp.do_faccessat
> > >       0.02 =C2=B1200%      +0.0        0.05 =C2=B1 49%      +0.0     =
   0.02 =C2=B1144%      +0.0        0.04 =C2=B1 82%  perf-profile.children.=
cycles-pp.simple_acl_create
> > >       0.30 =C2=B1 27%      +0.0        0.34 =C2=B1 22%      +0.0     =
   0.32 =C2=B1 20%      +0.0        0.34 =C2=B1 11%  perf-profile.children.=
cycles-pp.vfs_rmdir
> > >       0.12 =C2=B1 44%      +0.0        0.16 =C2=B1 12%      +0.1     =
   0.17 =C2=B1 17%      +0.0        0.15 =C2=B1 21%  perf-profile.children.=
cycles-pp.shmem_mkdir
> > >       0.14 =C2=B1 25%      +0.0        0.18 =C2=B1  9%      +0.0     =
   0.18 =C2=B1 21%      +0.0        0.17 =C2=B1 16%  perf-profile.children.=
cycles-pp.get_mountpoint
> > >       1.75 =C2=B1 23%      +0.0        1.79 =C2=B1 17%      +0.1     =
   1.82 =C2=B1 12%      +0.1        1.88 =C2=B1 11%  perf-profile.children.=
cycles-pp.namespace_unlock
> > >       0.23 =C2=B1 23%      +0.0        0.27 =C2=B1  5%      +0.0     =
   0.26 =C2=B1 16%      +0.0        0.27 =C2=B1 22%  perf-profile.children.=
cycles-pp.uevent_show
> > >       0.31 =C2=B1 23%      +0.0        0.35 =C2=B1  9%      +0.0     =
   0.32 =C2=B1 10%      +0.0        0.34 =C2=B1 16%  perf-profile.children.=
cycles-pp.vfs_readlink
> > >       0.65 =C2=B1 22%      +0.0        0.69 =C2=B1 12%      -0.0     =
   0.61 =C2=B1 16%      -0.0        0.64 =C2=B1  6%  perf-profile.children.=
cycles-pp.seq_printf
> > >       1.45 =C2=B1 19%      +0.0        1.49 =C2=B1  6%      +0.1     =
   1.56 =C2=B1  7%      +0.1        1.54 =C2=B1  8%  perf-profile.children.=
cycles-pp._raw_spin_lock
> > >       0.49 =C2=B1 30%      +0.0        0.53 =C2=B1 15%      +0.1     =
   0.54 =C2=B1 13%      +0.1        0.55 =C2=B1 10%  perf-profile.children.=
cycles-pp.umount_tree
> > >       0.29 =C2=B1 21%      +0.0        0.34 =C2=B1 17%      +0.1     =
   0.38 =C2=B1 10%      +0.1        0.40 =C2=B1 11%  perf-profile.children.=
cycles-pp.ida_alloc_range
> > >       3.72 =C2=B1 26%      +0.0        3.76 =C2=B1 14%      +0.2     =
   3.94 =C2=B1 13%      +0.3        4.05 =C2=B1 11%  perf-profile.children.=
cycles-pp.path_umount
> > >       0.21 =C2=B1 23%      +0.0        0.25 =C2=B1 11%      +0.0     =
   0.22 =C2=B1 18%      +0.0        0.21 =C2=B1 22%  perf-profile.children.=
cycles-pp.device_properties_prepare
> > >       0.39 =C2=B1 20%      +0.0        0.43 =C2=B1 14%      +0.1     =
   0.44 =C2=B1 16%      +0.0        0.42 =C2=B1 16%  perf-profile.children.=
cycles-pp.enqueue_entity
> > >       0.03 =C2=B1124%      +0.0        0.07 =C2=B1 48%      +0.0     =
   0.05 =C2=B1 77%      +0.0        0.06 =C2=B1 18%  perf-profile.children.=
cycles-pp.file_free_rcu
> > >       0.15 =C2=B1 27%      +0.0        0.19 =C2=B1 18%      +0.0     =
   0.16 =C2=B1 35%      +0.0        0.16 =C2=B1 27%  perf-profile.children.=
cycles-pp.flush_smp_call_function_queue
> > >       0.34 =C2=B1 16%      +0.0        0.39 =C2=B1 10%      +0.0     =
   0.37 =C2=B1 15%      +0.0        0.39 =C2=B1 13%  perf-profile.children.=
cycles-pp.entry_SYSRETQ_unsafe_stack
> > >       0.22 =C2=B1 37%      +0.0        0.26 =C2=B1 18%      +0.0     =
   0.24 =C2=B1 12%      +0.0        0.26 =C2=B1 15%  perf-profile.children.=
cycles-pp.kstrdup
> > >       0.14 =C2=B1 35%      +0.0        0.18 =C2=B1 18%      +0.0     =
   0.16 =C2=B1 22%      +0.1        0.19 =C2=B1 13%  perf-profile.children.=
cycles-pp.__pagevec_release
> > >       0.43 =C2=B1 33%      +0.0        0.48 =C2=B1 10%      +0.0     =
   0.47 =C2=B1 17%      -0.0        0.41 =C2=B1 15%  perf-profile.children.=
cycles-pp.siphash24_finalize
> > >       0.94 =C2=B1 10%      +0.0        0.98 =C2=B1  4%      -0.0     =
   0.94 =C2=B1 14%      +0.0        0.98 =C2=B1  6%  perf-profile.children.=
cycles-pp.lookup_fast
> > >       0.07 =C2=B1 25%      +0.0        0.12 =C2=B1 39%      +0.0     =
   0.10 =C2=B1 41%      +0.0        0.10 =C2=B1 30%  perf-profile.children.=
cycles-pp.native_queued_spin_lock_slowpath
> > >       0.99 =C2=B1 19%      +0.0        1.04 =C2=B1  5%      +0.0     =
   1.01 =C2=B1  7%      +0.0        1.04 =C2=B1  6%  perf-profile.children.=
cycles-pp.__fxstat64
> > >       0.69 =C2=B1 25%      +0.0        0.74 =C2=B1 18%      +0.1     =
   0.76 =C2=B1 15%      +0.1        0.77 =C2=B1 11%  perf-profile.children.=
cycles-pp.__x64_sys_rmdir
> > >       0.12 =C2=B1 28%      +0.0        0.16 =C2=B1 20%      +0.0     =
   0.12 =C2=B1 27%      +0.0        0.13 =C2=B1 20%  perf-profile.children.=
cycles-pp.sched_ttwu_pending
> > >       3.33 =C2=B1 26%      +0.0        3.38 =C2=B1 15%      +0.2     =
   3.55 =C2=B1 13%      +0.3        3.63 =C2=B1 11%  perf-profile.children.=
cycles-pp.do_umount
> > >       0.09 =C2=B1 33%      +0.0        0.14 =C2=B1 16%      +0.0     =
   0.14 =C2=B1 14%      +0.0        0.14 =C2=B1 18%  perf-profile.children.=
cycles-pp.strlen@plt
> > >       0.11 =C2=B1 38%      +0.0        0.16 =C2=B1 17%      +0.1     =
   0.18 =C2=B1 20%      +0.1        0.17 =C2=B1  7%  perf-profile.children.=
cycles-pp.d_lookup
> > >       0.04 =C2=B1 83%      +0.0        0.08 =C2=B1 21%      -0.0     =
   0.03 =C2=B1101%      +0.0        0.07 =C2=B1 25%  perf-profile.children.=
cycles-pp.shrink_dcache_parent
> > >       0.74 =C2=B1 30%      +0.0        0.78 =C2=B1 16%      +0.0     =
   0.78 =C2=B1 13%      +0.1        0.84 =C2=B1 14%  perf-profile.children.=
cycles-pp.path_parentat
> > >       0.80 =C2=B1 29%      +0.0        0.85 =C2=B1 15%      +0.0     =
   0.85 =C2=B1 12%      +0.1        0.92 =C2=B1 13%  perf-profile.children.=
cycles-pp.__filename_parentat
> > >       0.06 =C2=B1 51%      +0.1        0.11 =C2=B1 11%      +0.0     =
   0.10 =C2=B1 16%      +0.0        0.10 =C2=B1 20%  perf-profile.children.=
cycles-pp.close_fd
> > >       2.39 =C2=B1 23%      +0.1        2.44 =C2=B1  9%      -0.1     =
   2.26 =C2=B1 13%      -0.1        2.31 =C2=B1  9%  perf-profile.children.=
cycles-pp.seq_read_iter
> > >       0.30 =C2=B1 41%      +0.1        0.36 =C2=B1 16%      +0.1     =
   0.36 =C2=B1 18%      +0.0        0.34 =C2=B1 14%  perf-profile.children.=
cycles-pp.shmem_mknod
> > >       1.08 =C2=B1 10%      +0.1        1.13 =C2=B1  4%      +0.0     =
   1.09 =C2=B1 12%      +0.0        1.13 =C2=B1  6%  perf-profile.children.=
cycles-pp.walk_component
> > >       1.61 =C2=B1 32%      +0.1        1.66 =C2=B1 10%      +0.1     =
   1.72 =C2=B1 12%      +0.2        1.77 =C2=B1 12%  perf-profile.children.=
cycles-pp.unlink
> > >       0.55 =C2=B1 22%      +0.1        0.60 =C2=B1  3%      +0.0     =
   0.56 =C2=B1 12%      +0.0        0.57 =C2=B1 10%  perf-profile.children.=
cycles-pp.__entry_text_start
> > >       0.70 =C2=B1 31%      +0.1        0.75 =C2=B1 16%      +0.1     =
   0.77 =C2=B1 18%      +0.0        0.73 =C2=B1 15%  perf-profile.children.=
cycles-pp.down_write
> > >       2.59 =C2=B1 24%      +0.1        2.64 =C2=B1  9%      -0.1     =
   2.48 =C2=B1 13%      -0.1        2.48 =C2=B1  7%  perf-profile.children.=
cycles-pp.ksys_read
> > >       0.56 =C2=B1 24%      +0.1        0.62 =C2=B1 16%      +0.1     =
   0.62 =C2=B1 19%      +0.1        0.64 =C2=B1 11%  perf-profile.children.=
cycles-pp.__synchronize_srcu
> > >       0.37 =C2=B1 21%      +0.1        0.42 =C2=B1  7%      +0.0     =
   0.39 =C2=B1 20%      +0.0        0.38 =C2=B1 12%  perf-profile.children.=
cycles-pp.cfree
> > >       0.53 =C2=B1 18%      +0.1        0.58 =C2=B1 10%      +0.1     =
   0.60 =C2=B1 15%      +0.0        0.56 =C2=B1 13%  perf-profile.children.=
cycles-pp.enqueue_task_fair
> > >       0.88 =C2=B1 25%      +0.1        0.93 =C2=B1 15%      +0.1     =
   0.93 =C2=B1 11%      +0.1        0.96 =C2=B1 13%  perf-profile.children.=
cycles-pp.sync_rcu_exp_select_cpus
> > >       0.26 =C2=B1 38%      +0.1        0.32 =C2=B1 10%      +0.1     =
   0.35 =C2=B1 12%      +0.0        0.31 =C2=B1 20%  perf-profile.children.=
cycles-pp.vfs_mkdir
> > >       2.53 =C2=B1 16%      +0.1        2.59 =C2=B1  5%      +0.1     =
   2.63 =C2=B1  7%      +0.1        2.60        perf-profile.children.cycle=
s-pp.link_path_walk
> > >       0.19 =C2=B1 27%      +0.1        0.25 =C2=B1 16%      +0.0     =
   0.23 =C2=B1 11%      +0.0        0.22 =C2=B1 14%  perf-profile.children.=
cycles-pp.percpu_free_rwsem
> > >       0.00            +0.1        0.06 =C2=B1 52%      +0.1        0.=
08 =C2=B1 19%      +0.1        0.06 =C2=B1 53%  perf-profile.children.cycle=
s-pp.init_timer_key
> > >       0.22 =C2=B1 26%      +0.1        0.27 =C2=B1 22%      -0.0     =
   0.21 =C2=B1 22%      +0.0        0.23 =C2=B1  6%  perf-profile.children.=
cycles-pp.device_add_property_aux
> > >       0.80 =C2=B1 27%      +0.1        0.85 =C2=B1 14%      +0.1     =
   0.86 =C2=B1 17%      +0.1        0.86 =C2=B1  9%  perf-profile.children.=
cycles-pp.open_last_lookups
> > >       0.43 =C2=B1 31%      +0.1        0.48 =C2=B1 13%      +0.1     =
   0.50 =C2=B1 15%      +0.0        0.44 =C2=B1 21%  perf-profile.children.=
cycles-pp.do_lock_mount
> > >       0.18 =C2=B1 31%      +0.1        0.24 =C2=B1 20%      +0.0     =
   0.20 =C2=B1 20%      +0.0        0.20 =C2=B1 15%  perf-profile.children.=
cycles-pp.__legitimize_mnt
> > >       0.78 =C2=B1 26%      +0.1        0.84 =C2=B1 12%      +0.1     =
   0.88 =C2=B1 12%      +0.1        0.85 =C2=B1 12%  perf-profile.children.=
cycles-pp.mkdir
> > >       0.54 =C2=B1 27%      +0.1        0.60 =C2=B1  8%      +0.0     =
   0.56 =C2=B1 15%      -0.0        0.53 =C2=B1  8%  perf-profile.children.=
cycles-pp.path_compare
> > >       2.80 =C2=B1 25%      +0.1        2.86 =C2=B1  8%      -0.0     =
   2.80 =C2=B1 13%      -0.1        2.73 =C2=B1  9%  perf-profile.children.=
cycles-pp.device_set_syspath
> > >       0.17 =C2=B1 15%      +0.1        0.22 =C2=B1 39%      +0.0     =
   0.20 =C2=B1 24%      +0.1        0.23 =C2=B1 23%  perf-profile.children.=
cycles-pp.complete
> > >       2.57 =C2=B1 24%      +0.1        2.63 =C2=B1  9%      -0.1     =
   2.45 =C2=B1 13%      -0.1        2.46 =C2=B1  8%  perf-profile.children.=
cycles-pp.vfs_read
> > >       0.19 =C2=B1 27%      +0.1        0.25 =C2=B1 16%      +0.0     =
   0.23 =C2=B1 11%      +0.0        0.22 =C2=B1 14%  perf-profile.children.=
cycles-pp.destroy_super_work
> > >       0.88 =C2=B1 25%      +0.1        0.94 =C2=B1 16%      +0.1     =
   0.94 =C2=B1 12%      +0.1        0.97 =C2=B1 13%  perf-profile.children.=
cycles-pp.wait_rcu_exp_gp
> > >       0.52 =C2=B1 22%      +0.1        0.58 =C2=B1 10%      +0.0     =
   0.57 =C2=B1 13%      +0.0        0.55 =C2=B1 15%  perf-profile.children.=
cycles-pp.free_percpu
> > >       0.26 =C2=B1 20%      +0.1        0.32 =C2=B1 13%      -0.0     =
   0.26 =C2=B1 21%      +0.0        0.28 =C2=B1 11%  perf-profile.children.=
cycles-pp.format_decode
> > >       5.39 =C2=B1 26%      +0.1        5.45 =C2=B1 14%      +0.3     =
   5.71 =C2=B1 11%      +0.4        5.83 =C2=B1 11%  perf-profile.children.=
cycles-pp.__x64_sys_umount
> > >       2.65 =C2=B1 28%      +0.1        2.71 =C2=B1 13%      +0.2     =
   2.82 =C2=B1 15%      +0.3        2.94 =C2=B1 11%  perf-profile.children.=
cycles-pp.stress_rndstr
> > >       0.87 =C2=B1 28%      +0.1        0.93 =C2=B1 15%      +0.1     =
   0.96 =C2=B1 17%      +0.1        1.00 =C2=B1 13%  perf-profile.children.=
cycles-pp.process_srcu
> > >       0.22 =C2=B1 33%      +0.1        0.28 =C2=B1 12%      +0.1     =
   0.31 =C2=B1 12%      +0.1        0.29 =C2=B1 10%  perf-profile.children.=
cycles-pp.___slab_alloc
> > >       0.76 =C2=B1 24%      +0.1        0.83 =C2=B1 10%      -0.0     =
   0.74 =C2=B1 14%      -0.0        0.76 =C2=B1  9%  perf-profile.children.=
cycles-pp.vsnprintf
> > >       0.64 =C2=B1 28%      +0.1        0.70 =C2=B1  8%      +0.0     =
   0.68 =C2=B1 11%      +0.1        0.74 =C2=B1 15%  perf-profile.children.=
cycles-pp.vfs_symlink
> > >       2.59 =C2=B1 19%      +0.1        2.65 =C2=B1  8%      +0.2     =
   2.74 =C2=B1  7%      +0.1        2.66 =C2=B1  7%  perf-profile.children.=
cycles-pp.user_path_at_empty
> > >       0.23 =C2=B1 21%      +0.1        0.29 =C2=B1  8%      +0.0     =
   0.27 =C2=B1 14%      +0.0        0.28 =C2=B1 14%  perf-profile.children.=
cycles-pp.__x64_sys_close
> > >       0.74 =C2=B1 25%      +0.1        0.81 =C2=B1 18%      +0.1     =
   0.81 =C2=B1 15%      +0.1        0.83 =C2=B1 12%  perf-profile.children.=
cycles-pp.rmdir
> > >       0.74 =C2=B1 27%      +0.1        0.80 =C2=B1 15%      +0.1     =
   0.80 =C2=B1  8%      +0.1        0.81 =C2=B1 13%  perf-profile.children.=
cycles-pp.synchronize_rcu_expedited
> > >       0.55 =C2=B1 18%      +0.1        0.61 =C2=B1 10%      +0.1     =
   0.63 =C2=B1 15%      +0.0        0.59 =C2=B1 14%  perf-profile.children.=
cycles-pp.activate_task
> > >       2.78 =C2=B1 17%      +0.1        2.85 =C2=B1  6%      +0.1     =
   2.90 =C2=B1  7%      +0.1        2.87 =C2=B1  5%  perf-profile.children.=
cycles-pp.open64
> > >       0.32 =C2=B1 20%      +0.1        0.39 =C2=B1  6%      +0.1     =
   0.39 =C2=B1 19%      +0.1        0.40 =C2=B1  9%  perf-profile.children.=
cycles-pp.__d_lookup
> > >       4.47 =C2=B1 16%      +0.1        4.54 =C2=B1  4%      +0.1     =
   4.57 =C2=B1  8%      -0.0        4.45 =C2=B1  2%  perf-profile.children.=
cycles-pp.do_sys_openat2
> > >       4.50 =C2=B1 16%      +0.1        4.58 =C2=B1  4%      +0.1     =
   4.61 =C2=B1  8%      -0.0        4.49 =C2=B1  2%  perf-profile.children.=
cycles-pp.__x64_sys_openat
> > >       1.60 =C2=B1 22%      +0.1        1.68 =C2=B1 14%      +0.2     =
   1.78 =C2=B1  7%      +0.2        1.79 =C2=B1  8%  perf-profile.children.=
cycles-pp.strncpy_from_user
> > >       0.37 =C2=B1 31%      +0.1        0.45 =C2=B1 13%      +0.0     =
   0.41 =C2=B1 14%      +0.0        0.41 =C2=B1  7%  perf-profile.children.=
cycles-pp.__legitimize_path
> > >       1.34 =C2=B1 31%      +0.1        1.42 =C2=B1 11%      +0.1     =
   1.47 =C2=B1 13%      +0.2        1.50 =C2=B1 12%  perf-profile.children.=
cycles-pp.do_unlinkat
> > >       0.00            +0.1        0.08 =C2=B1 16%      +0.1        0.=
08 =C2=B1 52%      +0.1        0.07 =C2=B1 20%  perf-profile.children.cycle=
s-pp.pcpu_next_md_free_region
> > >       0.11 =C2=B1 26%      +0.1        0.19 =C2=B1 42%      +0.1     =
   0.17 =C2=B1 31%      +0.1        0.20 =C2=B1 31%  perf-profile.children.=
cycles-pp.srcu_invoke_callbacks
> > >       0.09 =C2=B1 33%      +0.1        0.17 =C2=B1 43%      +0.1     =
   0.16 =C2=B1 84%      +0.1        0.16 =C2=B1 59%  perf-profile.children.=
cycles-pp.srcu_gp_end
> > >       0.43 =C2=B1 30%      +0.1        0.52 =C2=B1 13%      +0.0     =
   0.46 =C2=B1 15%      +0.1        0.49 =C2=B1 11%  perf-profile.children.=
cycles-pp.try_to_unlazy
> > >       2.65 =C2=B1 24%      +0.1        2.74 =C2=B1  9%      -0.1     =
   2.56 =C2=B1 13%      -0.1        2.55 =C2=B1  7%  perf-profile.children.=
cycles-pp.read
> > >       0.75 =C2=B1 21%      +0.1        0.84 =C2=B1  3%      +0.1     =
   0.83 =C2=B1 12%      -0.0        0.75 =C2=B1 10%  perf-profile.children.=
cycles-pp.do_readlinkat
> > >       1.47 =C2=B1 32%      +0.1        1.56 =C2=B1 12%      +0.1     =
   1.62 =C2=B1 12%      +0.2        1.65 =C2=B1 12%  perf-profile.children.=
cycles-pp.__x64_sys_unlink
> > >       0.15 =C2=B1 24%      +0.1        0.24 =C2=B1 13%      +0.1     =
   0.24 =C2=B1 19%      +0.1        0.24 =C2=B1  5%  perf-profile.children.=
cycles-pp.rcu_cblist_dequeue
> > >       1.30 =C2=B1 31%      +0.1        1.39 =C2=B1  9%      +0.0     =
   1.32 =C2=B1 12%      +0.0        1.32 =C2=B1 12%  perf-profile.children.=
cycles-pp.malloc
> > >       1.10 =C2=B1 29%      +0.1        1.19 =C2=B1 10%      +0.1     =
   1.16 =C2=B1  9%      +0.1        1.19 =C2=B1 14%  perf-profile.children.=
cycles-pp.do_symlinkat
> > >       0.01 =C2=B1200%      +0.1        0.10 =C2=B1 13%      +0.1     =
   0.12 =C2=B1 31%      +0.1        0.09 =C2=B1 18%  perf-profile.children.=
cycles-pp.pcpu_chunk_refresh_hint
> > >       0.47 =C2=B1 27%      +0.1        0.56 =C2=B1 18%      +0.1     =
   0.56 =C2=B1 16%      +0.1        0.60 =C2=B1 28%  perf-profile.children.=
cycles-pp.intel_idle_irq
> > >       0.00            +0.1        0.09 =C2=B1 28%      +0.1        0.=
11 =C2=B1 14%      +0.1        0.10 =C2=B1 14%  perf-profile.children.cycle=
s-pp.rmqueue_bulk
> > >       3.15 =C2=B1 24%      +0.1        3.24 =C2=B1  8%      +0.0     =
   3.15 =C2=B1 13%      -0.1        3.08 =C2=B1  9%  perf-profile.children.=
cycles-pp.sd_device_new_from_syspath
> > >       2.14 =C2=B1 19%      +0.1        2.23 =C2=B1 14%      +0.2     =
   2.35 =C2=B1  6%      +0.2        2.33 =C2=B1  8%  perf-profile.children.=
cycles-pp.getname_flags
> > >       0.27 =C2=B1 23%      +0.1        0.37 =C2=B1 40%      +0.0     =
   0.28 =C2=B1 27%      +0.0        0.30 =C2=B1 26%  perf-profile.children.=
cycles-pp.irqentry_exit_to_user_mode
> > >       0.69 =C2=B1 21%      +0.1        0.79 =C2=B1  3%      +0.1     =
   0.78 =C2=B1 12%      +0.0        0.71 =C2=B1 11%  perf-profile.children.=
cycles-pp.__x64_sys_readlinkat
> > >       0.68 =C2=B1 18%      +0.1        0.78 =C2=B1 11%      +0.1     =
   0.75 =C2=B1 16%      +0.1        0.77 =C2=B1 13%  perf-profile.children.=
cycles-pp.ttwu_do_activate
> > >       0.49 =C2=B1 23%      +0.1        0.59 =C2=B1 14%      +0.1     =
   0.61 =C2=B1 23%      +0.1        0.59 =C2=B1 14%  perf-profile.children.=
cycles-pp.schedule_timeout
> > >       2.45 =C2=B1 18%      +0.1        2.55 =C2=B1  6%      +0.1     =
   2.54 =C2=B1 12%      +0.1        2.56 =C2=B1  7%  perf-profile.children.=
cycles-pp.__do_softirq
> > >       1.08 =C2=B1 21%      +0.1        1.19 =C2=B1 12%      +0.1     =
   1.16 =C2=B1 12%      +0.2        1.26 =C2=B1 10%  perf-profile.children.=
cycles-pp._raw_spin_lock_irqsave
> > >       0.52 =C2=B1 26%      +0.1        0.63 =C2=B1 13%      +0.1     =
   0.64 =C2=B1 22%      +0.2        0.68 =C2=B1 18%  perf-profile.children.=
cycles-pp.__queue_work
> > >       1.24 =C2=B1 29%      +0.1        1.36 =C2=B1 11%      +0.1     =
   1.30 =C2=B1 10%      +0.1        1.35 =C2=B1 14%  perf-profile.children.=
cycles-pp.__x64_sys_symlink
> > >       0.44 =C2=B1 27%      +0.1        0.56 =C2=B1 11%      +0.1     =
   0.57 =C2=B1 23%      +0.1        0.57 =C2=B1 23%  perf-profile.children.=
cycles-pp.queue_work_on
> > >       0.71 =C2=B1 21%      +0.1        0.83 =C2=B1  4%      +0.1     =
   0.82 =C2=B1 13%      +0.0        0.74 =C2=B1 11%  perf-profile.children.=
cycles-pp.readlinkat
> > >       1.47 =C2=B1 17%      +0.1        1.59 =C2=B1  5%      +0.1     =
   1.56 =C2=B1 10%      +0.0        1.49 =C2=B1  7%  perf-profile.children.=
cycles-pp.__close
> > >       1.02 =C2=B1 18%      +0.1        1.14 =C2=B1 14%      +0.1     =
   1.09 =C2=B1 18%      +0.1        1.11 =C2=B1 13%  perf-profile.children.=
cycles-pp.try_to_wake_up
> > >       0.54 =C2=B1 25%      +0.1        0.66 =C2=B1  9%      +0.1     =
   0.69 =C2=B1 14%      +0.2        0.71 =C2=B1  8%  perf-profile.children.=
cycles-pp.pcpu_alloc_area
> > >       0.00            +0.1        0.12 =C2=B1118%      +0.0        0.=
05 =C2=B1182%      +0.1        0.10 =C2=B1122%  perf-profile.children.cycle=
s-pp.asm_sysvec_reschedule_ipi
> > >       1.31 =C2=B1 28%      +0.1        1.44 =C2=B1 11%      +0.1     =
   1.38 =C2=B1  9%      +0.1        1.44 =C2=B1 12%  perf-profile.children.=
cycles-pp.symlink
> > >       2.08 =C2=B1 22%      +0.1        2.20 =C2=B1  5%      +0.1     =
   2.22 =C2=B1 12%      +0.2        2.27 =C2=B1  8%  perf-profile.children.=
cycles-pp.rcu_do_batch
> > >       0.66 =C2=B1 24%      +0.1        0.79 =C2=B1 15%      +0.1     =
   0.78 =C2=B1 21%      +0.1        0.76 =C2=B1 11%  perf-profile.children.=
cycles-pp.__wait_for_common
> > >       0.23 =C2=B1 18%      +0.1        0.37 =C2=B1 47%      +0.1     =
   0.30 =C2=B1 82%      +0.1        0.28 =C2=B1 62%  perf-profile.children.=
cycles-pp.poll_idle
> > >       0.45 =C2=B1 15%      +0.1        0.60 =C2=B1 13%      +0.1     =
   0.58 =C2=B1 10%      +0.2        0.60 =C2=B1  4%  perf-profile.children.=
cycles-pp.kmalloc_trace
> > >       2.13 =C2=B1 22%      +0.1        2.28 =C2=B1  5%      +0.1     =
   2.27 =C2=B1 12%      +0.2        2.31 =C2=B1  8%  perf-profile.children.=
cycles-pp.rcu_core
> > >       0.77 =C2=B1 32%      +0.1        0.92 =C2=B1 19%      +0.2     =
   1.00 =C2=B1 22%      +0.3        1.10 =C2=B1 25%  perf-profile.children.=
cycles-pp.x86_64_start_kernel
> > >       0.77 =C2=B1 32%      +0.1        0.92 =C2=B1 19%      +0.2     =
   1.00 =C2=B1 22%      +0.3        1.10 =C2=B1 25%  perf-profile.children.=
cycles-pp.x86_64_start_reservations
> > >       0.77 =C2=B1 32%      +0.1        0.92 =C2=B1 19%      +0.2     =
   1.00 =C2=B1 22%      +0.3        1.10 =C2=B1 25%  perf-profile.children.=
cycles-pp.start_kernel
> > >       0.77 =C2=B1 32%      +0.1        0.92 =C2=B1 19%      +0.2     =
   1.00 =C2=B1 22%      +0.3        1.10 =C2=B1 25%  perf-profile.children.=
cycles-pp.arch_call_rest_init
> > >       0.77 =C2=B1 32%      +0.1        0.92 =C2=B1 19%      +0.2     =
   1.00 =C2=B1 22%      +0.3        1.10 =C2=B1 25%  perf-profile.children.=
cycles-pp.rest_init
> > >       0.00            +0.2        0.17 =C2=B1 16%      +0.2        0.=
20 =C2=B1 22%      +0.2        0.19 =C2=B1 14%  perf-profile.children.cycle=
s-pp.rcu_segcblist_init
> > >       0.86 =C2=B1 22%      +0.2        1.03 =C2=B1 11%      +0.2     =
   1.02 =C2=B1  6%      +0.2        1.07 =C2=B1  4%  perf-profile.children.=
cycles-pp.__kmem_cache_alloc_node
> > >       0.01 =C2=B1200%      +0.2        0.19 =C2=B1 22%      +0.2     =
   0.21 =C2=B1 14%      +0.2        0.20 =C2=B1  7%  perf-profile.children.=
cycles-pp.rmqueue
> > >       0.03 =C2=B1 82%      +0.2        0.23 =C2=B1 25%      +0.2     =
   0.24 =C2=B1 17%      +0.2        0.23 =C2=B1 12%  perf-profile.children.=
cycles-pp.get_page_from_freelist
> > >       0.00            +0.2        0.22 =C2=B1 24%      +0.2        0.=
23 =C2=B1 20%      +0.2        0.23 =C2=B1 11%  perf-profile.children.cycle=
s-pp.pcpu_alloc_pages
> > >       0.05 =C2=B1 55%      +0.2        0.28 =C2=B1 22%      +0.2     =
   0.29 =C2=B1 22%      +0.2        0.29 =C2=B1 12%  perf-profile.children.=
cycles-pp.__alloc_pages
> > >       0.00            +0.3        0.27 =C2=B1 23%      +0.3        0.=
30 =C2=B1 22%      +0.3        0.27 =C2=B1 11%  perf-profile.children.cycle=
s-pp.pcpu_populate_chunk
> > >       0.00            +0.3        0.32 =C2=B1 19%      +0.4        0.=
36 =C2=B1 21%      +0.3        0.33 =C2=B1 14%  perf-profile.children.cycle=
s-pp.pcpu_balance_populated
> > >       0.00            +0.3        0.32 =C2=B1 19%      +0.4        0.=
36 =C2=B1 21%      +0.3        0.33 =C2=B1 15%  perf-profile.children.cycle=
s-pp.pcpu_balance_workfn
> > >       3.48 =C2=B1 25%      +0.6        4.08 =C2=B1 14%      +0.7     =
   4.19 =C2=B1 11%      +0.8        4.23 =C2=B1 10%  perf-profile.children.=
cycles-pp.process_one_work
> > >       4.38 =C2=B1 24%      +0.7        5.10 =C2=B1 13%      +0.8     =
   5.19 =C2=B1 10%      +0.9        5.26 =C2=B1 10%  perf-profile.children.=
cycles-pp.worker_thread
> > >       0.47 =C2=B1 21%      +0.7        1.19 =C2=B1 67%      +0.4     =
   0.84 =C2=B1 66%      +0.7        1.15 =C2=B1 78%  perf-profile.children.=
cycles-pp.smpboot_thread_fn
> > >       0.39 =C2=B1 24%      +0.7        1.13 =C2=B1 69%      +0.4     =
   0.76 =C2=B1 68%      +0.7        1.09 =C2=B1 82%  perf-profile.children.=
cycles-pp.run_ksoftirqd
> > >       1.28 =C2=B1 23%      +0.9        2.18 =C2=B1 14%      +0.9     =
   2.16 =C2=B1  9%      +0.9        2.20 =C2=B1  9%  perf-profile.children.=
cycles-pp.memset_orig
> > >       4.92 =C2=B1 21%      +1.4        6.32 =C2=B1 11%      +1.2     =
   6.09 =C2=B1  9%      +1.5        6.46 =C2=B1 16%  perf-profile.children.=
cycles-pp.ret_from_fork
> > >       4.92 =C2=B1 21%      +1.4        6.32 =C2=B1 11%      +1.2     =
   6.09 =C2=B1  9%      +1.5        6.46 =C2=B1 16%  perf-profile.children.=
cycles-pp.kthread
> > >       0.09 =C2=B1 35%      +1.5        1.55 =C2=B1 44%      +2.1     =
   2.16 =C2=B1 21%      +2.3        2.43 =C2=B1  5%  perf-profile.children.=
cycles-pp.pcpu_find_block_fit
> > >       2.83 =C2=B1 27%      +3.9        6.73 =C2=B1 20%      +5.3     =
   8.09 =C2=B1 15%      +5.8        8.66 =C2=B1  6%  perf-profile.children.=
cycles-pp.pcpu_alloc
> > >       2.84 =C2=B1 30%      +4.6        7.44 =C2=B1 18%      +6.1     =
   8.92 =C2=B1 16%      +6.6        9.42 =C2=B1  6%  perf-profile.children.=
cycles-pp.vfs_get_super
> > >       2.85 =C2=B1 30%      +4.6        7.46 =C2=B1 18%      +6.1     =
   8.94 =C2=B1 16%      +6.6        9.44 =C2=B1  6%  perf-profile.children.=
cycles-pp.vfs_get_tree
> > >       7.93 =C2=B1 28%      +4.7       12.61 =C2=B1 14%      +6.3     =
  14.26 =C2=B1 13%      +7.0       14.98 =C2=B1  8%  perf-profile.children.=
cycles-pp.__x64_sys_mount
> > >       1.56 =C2=B1 30%      +4.7        6.23 =C2=B1 21%      +6.0     =
   7.55 =C2=B1 16%      +6.5        8.05 =C2=B1  5%  perf-profile.children.=
cycles-pp.alloc_super
> > >       8.03 =C2=B1 28%      +4.7       12.71 =C2=B1 14%      +6.3     =
  14.36 =C2=B1 13%      +7.1       15.09 =C2=B1  8%  perf-profile.children.=
cycles-pp.mount
> > >       1.68 =C2=B1 30%      +4.7        6.37 =C2=B1 21%      +6.0     =
   7.72 =C2=B1 16%      +6.5        8.20 =C2=B1  5%  perf-profile.children.=
cycles-pp.sget_fc
> > >       7.20 =C2=B1 28%      +4.7       11.90 =C2=B1 15%      +6.3     =
  13.53 =C2=B1 13%      +7.0       14.20 =C2=B1  9%  perf-profile.children.=
cycles-pp.do_new_mount
> > >      35.29 =C2=B1 18%      +4.7       40.03 =C2=B1  7%      +7.1     =
  42.35 =C2=B1  8%      +7.6       42.87 =C2=B1  5%  perf-profile.children.=
cycles-pp.do_syscall_64
> > >      35.50 =C2=B1 18%      +4.7       40.25 =C2=B1  7%      +7.1     =
  42.56 =C2=B1  8%      +7.6       43.07 =C2=B1  6%  perf-profile.children.=
cycles-pp.entry_SYSCALL_64_after_hwframe
> > >       0.00            +4.9        4.91 =C2=B1 25%      +6.2        6.=
18 =C2=B1 16%      +6.6        6.61 =C2=B1  5%  perf-profile.children.cycle=
s-pp.init_srcu_struct_fields
> > >      37.09 =C2=B1 26%      -6.1       30.96 =C2=B1 10%      -8.1     =
  28.98 =C2=B1 12%      -8.5       28.64 =C2=B1  8%  perf-profile.self.cycl=
es-pp.intel_idle
> > >       0.80 =C2=B1 15%      -0.1        0.70 =C2=B1 17%      +0.0     =
   0.84 =C2=B1 24%      -0.1        0.73 =C2=B1 21%  perf-profile.self.cycl=
es-pp.update_sg_lb_stats
> > >       0.40 =C2=B1 19%      -0.1        0.32 =C2=B1  8%      -0.0     =
   0.37 =C2=B1 19%      -0.1        0.33 =C2=B1 17%  perf-profile.self.cycl=
es-pp.cpuidle_enter_state
> > >       0.48 =C2=B1 24%      -0.1        0.41 =C2=B1 16%      -0.1     =
   0.40 =C2=B1 16%      -0.1        0.38 =C2=B1 12%  perf-profile.self.cycl=
es-pp.path_init
> > >       0.57 =C2=B1 24%      -0.1        0.51 =C2=B1 12%      -0.0     =
   0.57 =C2=B1 15%      +0.0        0.59 =C2=B1  8%  perf-profile.self.cycl=
es-pp.mnt_get_writers
> > >       0.58 =C2=B1 24%      -0.1        0.53 =C2=B1 19%      +0.0     =
   0.58 =C2=B1 18%      +0.0        0.60 =C2=B1 16%  perf-profile.self.cycl=
es-pp.try_check_zero
> > >       0.08 =C2=B1 27%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.07 =C2=B1 23%      -0.0        0.04 =C2=B1 87%  perf-profile.self.cycl=
es-pp.llist_reverse_order
> > >       1.16 =C2=B1 23%      -0.0        1.12 =C2=B1 14%      -0.0     =
   1.16 =C2=B1 15%      +0.1        1.29 =C2=B1 12%  perf-profile.self.cycl=
es-pp.mnt_get_count
> > >       0.17 =C2=B1 11%      -0.0        0.12 =C2=B1 15%      -0.0     =
   0.14 =C2=B1 28%      -0.0        0.14 =C2=B1 35%  perf-profile.self.cycl=
es-pp.read_tsc
> > >       0.44 =C2=B1  5%      -0.0        0.40 =C2=B1 10%      +0.0     =
   0.45 =C2=B1 15%      -0.0        0.43 =C2=B1  9%  perf-profile.self.cycl=
es-pp.perf_adjust_freq_unthr_context
> > >       0.28 =C2=B1  8%      -0.0        0.24 =C2=B1 19%      -0.0     =
   0.27 =C2=B1 19%      -0.0        0.25 =C2=B1 12%  perf-profile.self.cycl=
es-pp.__intel_pmu_enable_all
> > >       0.07 =C2=B1 16%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.05 =C2=B1 74%      -0.0        0.04 =C2=B1 88%  perf-profile.self.cycl=
es-pp.__pthread_mutex_unlock_usercnt
> > >       0.05 =C2=B1 57%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.05 =C2=B1 48%      +0.0        0.06 =C2=B1 14%  perf-profile.self.cycl=
es-pp.strspn@plt
> > >       0.13 =C2=B1 17%      -0.0        0.09 =C2=B1 23%      -0.0     =
   0.11 =C2=B1 22%      -0.0        0.09 =C2=B1 15%  perf-profile.self.cycl=
es-pp.ct_kernel_exit_state
> > >       0.21 =C2=B1 13%      -0.0        0.17 =C2=B1 22%      +0.0     =
   0.22 =C2=B1 20%      -0.0        0.19 =C2=B1 21%  perf-profile.self.cycl=
es-pp.lapic_next_deadline
> > >       0.05 =C2=B1 56%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.02 =C2=B1142%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp._ext4_show_options
> > >       0.06 =C2=B1 10%      -0.0        0.02 =C2=B1 99%      -0.0     =
   0.03 =C2=B1101%      -0.0        0.03 =C2=B1 81%  perf-profile.self.cycl=
es-pp.load_balance
> > >       0.04 =C2=B1 88%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.03 =C2=B1108%      -0.0        0.02 =C2=B1123%  perf-profile.self.cycl=
es-pp.strjoin_real
> > >       0.03 =C2=B1200%      -0.0        0.00            +0.0        0.=
04 =C2=B1147%      +0.0        0.07 =C2=B1 81%  perf-profile.self.cycles-pp=
.timekeeping_max_deferment
> > >       0.04 =C2=B1 82%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp=
.calc_global_load_tick
> > >       0.27 =C2=B1 35%      -0.0        0.24 =C2=B1 14%      -0.1     =
   0.21 =C2=B1 17%      -0.1        0.20 =C2=B1 15%  perf-profile.self.cycl=
es-pp.unit_name_is_valid
> > >       0.08 =C2=B1 32%      -0.0        0.06 =C2=B1 47%      -0.0     =
   0.06 =C2=B1 48%      -0.0        0.06 =C2=B1 18%  perf-profile.self.cycl=
es-pp.slab_pre_alloc_hook
> > >       0.17 =C2=B1 45%      -0.0        0.14 =C2=B1 21%      -0.0     =
   0.14 =C2=B1 15%      -0.0        0.16 =C2=B1  8%  perf-profile.self.cycl=
es-pp.apparmor_capable
> > >       0.09 =C2=B1 23%      -0.0        0.06 =C2=B1 11%      -0.0     =
   0.07 =C2=B1 53%      -0.0        0.04 =C2=B1 85%  perf-profile.self.cycl=
es-pp.__pthread_mutex_lock
> > >       0.17 =C2=B1 38%      -0.0        0.14 =C2=B1 11%      -0.0     =
   0.16 =C2=B1  9%      -0.0        0.16 =C2=B1 20%  perf-profile.self.cycl=
es-pp.up_read
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.sched_clo=
ck_cpu
> > >       0.09 =C2=B1 17%      -0.0        0.07 =C2=B1 47%      -0.0     =
   0.08 =C2=B1 52%      -0.0        0.08 =C2=B1 17%  perf-profile.self.cycl=
es-pp.__fget_light
> > >       0.04 =C2=B1 50%      -0.0        0.02 =C2=B1141%      -0.0     =
   0.02 =C2=B1141%      -0.0        0.00        perf-profile.self.cycles-pp=
.seq_printf
> > >       0.02 =C2=B1123%      -0.0        0.00            -0.0        0.=
00            -0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.asm_=
sysvec_apic_timer_interrupt
> > >       0.02 =C2=B1123%      -0.0        0.00            -0.0        0.=
00            +0.0        0.02 =C2=B1122%  perf-profile.self.cycles-pp.___d=
_drop
> > >       0.05 =C2=B1 90%      -0.0        0.03 =C2=B1102%      -0.0     =
   0.03 =C2=B1106%      -0.0        0.02 =C2=B1123%  perf-profile.self.cycl=
es-pp.mnt_fstype_is_pseudofs
> > >       0.06 =C2=B1 53%      -0.0        0.04 =C2=B1109%      -0.0     =
   0.03 =C2=B1106%      -0.0        0.03 =C2=B1122%  perf-profile.self.cycl=
es-pp.sync_regs
> > >       0.05 =C2=B1 55%      -0.0        0.03 =C2=B1105%      +0.0     =
   0.07 =C2=B1 28%      +0.0        0.06 =C2=B1 12%  perf-profile.self.cycl=
es-pp.getdelim
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.vfs_read
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.__d_rehas=
h
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp.pcpu=
_free_area
> > >       0.02 =C2=B1122%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp.rcu_=
note_context_switch
> > >       0.03 =C2=B1130%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.shmem_show_options
> > >       0.04 =C2=B1 90%      -0.0        0.02 =C2=B1142%      -0.0     =
   0.00            -0.0        0.00        perf-profile.self.cycles-pp.trun=
cate_inode_pages_range
> > >       0.04 =C2=B1 83%      -0.0        0.02 =C2=B1142%      -0.0     =
   0.02 =C2=B1 99%      +0.0        0.04 =C2=B1 50%  perf-profile.self.cycl=
es-pp.ep_poll_callback
> > >       0.03 =C2=B1122%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.03 =C2=B1101%      -0.0        0.00        perf-profile.self.cycles-pp=
.trigger_load_balance
> > >       0.07 =C2=B1 57%      -0.0        0.05 =C2=B1 74%      +0.0     =
   0.08 =C2=B1 18%      +0.0        0.08 =C2=B1 19%  perf-profile.self.cycl=
es-pp.__srcu_read_unlock
> > >       0.11 =C2=B1 15%      -0.0        0.09 =C2=B1 34%      +0.0     =
   0.12 =C2=B1 36%      -0.0        0.09 =C2=B1 19%  perf-profile.self.cycl=
es-pp.update_sd_lb_stats
> > >       0.05 =C2=B1 86%      -0.0        0.03 =C2=B1102%      +0.0     =
   0.05 =C2=B1  8%      -0.0        0.03 =C2=B1 82%  perf-profile.self.cycl=
es-pp.do_idle
> > >       0.09 =C2=B1 35%      -0.0        0.08 =C2=B1 25%      -0.0     =
   0.08 =C2=B1 14%      -0.0        0.07 =C2=B1 18%  perf-profile.self.cycl=
es-pp.exit_to_user_mode_prepare
> > >       0.17 =C2=B1 26%      -0.0        0.15 =C2=B1 13%      -0.0     =
   0.16 =C2=B1 15%      -0.0        0.15 =C2=B1  7%  perf-profile.self.cycl=
es-pp.rcu_all_qs
> > >       0.15 =C2=B1 48%      -0.0        0.13 =C2=B1 30%      +0.0     =
   0.15 =C2=B1 14%      -0.0        0.15 =C2=B1 15%  perf-profile.self.cycl=
es-pp.__lookup_mnt
> > >       0.13 =C2=B1 15%      -0.0        0.11 =C2=B1 26%      +0.0     =
   0.14 =C2=B1 18%      +0.0        0.14 =C2=B1 16%  perf-profile.self.cycl=
es-pp.check_heap_object
> > >       0.24 =C2=B1 15%      -0.0        0.22 =C2=B1 11%      -0.0     =
   0.22 =C2=B1 20%      -0.0        0.21 =C2=B1 11%  perf-profile.self.cycl=
es-pp.native_irq_return_iret
> > >       0.02 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp.__fl=
ush_work
> > >       0.21 =C2=B1 21%      -0.0        0.20 =C2=B1 14%      +0.0     =
   0.24 =C2=B1 13%      +0.0        0.23 =C2=B1 12%  perf-profile.self.cycl=
es-pp.generic_permission
> > >       0.24 =C2=B1 34%      -0.0        0.22 =C2=B1 10%      -0.0     =
   0.21 =C2=B1 21%      -0.0        0.21 =C2=B1 17%  perf-profile.self.cycl=
es-pp.vsnprintf
> > >       0.09 =C2=B1 21%      -0.0        0.07 =C2=B1  9%      -0.0     =
   0.07 =C2=B1 55%      -0.0        0.07 =C2=B1 15%  perf-profile.self.cycl=
es-pp.update_irq_load_avg
> > >       0.21 =C2=B1 17%      -0.0        0.20 =C2=B1  8%      -0.0     =
   0.19 =C2=B1 19%      -0.0        0.20 =C2=B1 15%  perf-profile.self.cycl=
es-pp.menu_select
> > >       0.04 =C2=B1 53%      -0.0        0.03 =C2=B1101%      -0.0     =
   0.04 =C2=B1 75%      -0.0        0.02 =C2=B1122%  perf-profile.self.cycl=
es-pp.terminate_walk
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      +0.0        0.02 =C2=B1125%  perf-profile.self.cycles-pp=
.tick_nohz_next_event
> > >       0.08 =C2=B1 25%      -0.0        0.07 =C2=B1 14%      -0.0     =
   0.05 =C2=B1 73%      -0.0        0.05 =C2=B1 85%  perf-profile.self.cycl=
es-pp.mangle_path
> > >       0.02 =C2=B1123%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp=
.check_stack_object
> > >       0.02 =C2=B1123%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.02 =C2=B1142%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp._dbus_first_type_in_signature
> > >       0.03 =C2=B1122%      -0.0        0.02 =C2=B1141%      -0.0     =
   0.03 =C2=B1101%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.open64
> > >       0.04 =C2=B1 85%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.02 =C2=B1142%      +0.0        0.04 =C2=B1 85%  perf-profile.self.cycl=
es-pp.__wake_up_common_lock
> > >       0.14 =C2=B1 20%      -0.0        0.13 =C2=B1 24%      -0.0     =
   0.14 =C2=B1 17%      -0.0        0.12 =C2=B1 21%  perf-profile.self.cycl=
es-pp.__get_obj_cgroup_from_memcg
> > >       0.06 =C2=B1 54%      -0.0        0.04 =C2=B1 77%      +0.0     =
   0.06 =C2=B1 48%      +0.0        0.06 =C2=B1 53%  perf-profile.self.cycl=
es-pp.xas_start
> > >       0.03 =C2=B1123%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.04 =C2=B1 72%      -0.0        0.02 =C2=B1122%  perf-profile.self.cycl=
es-pp.perf_pmu_nop_void
> > >       0.07 =C2=B1 32%      -0.0        0.06 =C2=B1 52%      +0.0     =
   0.08 =C2=B1 16%      +0.0        0.09 =C2=B1  9%  perf-profile.self.cycl=
es-pp.__wrgsbase_inactive
> > >       0.16 =C2=B1 18%      -0.0        0.15 =C2=B1 21%      -0.0     =
   0.16 =C2=B1 18%      -0.0        0.15 =C2=B1  7%  perf-profile.self.cycl=
es-pp.update_load_avg
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.__get_fs_=
type
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.map_id_ra=
nge_down
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp.xa_l=
oad
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp.rewe=
ight_entity
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.change_mnt_propagation
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.fput
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
02 =C2=B1146%      -0.0        0.00        perf-profile.self.cycles-pp.upda=
te_process_times
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
02 =C2=B1 99%      -0.0        0.00        perf-profile.self.cycles-pp.hash=
map_get2
> > >       0.04 =C2=B1 85%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.02 =C2=B1 99%      -0.0        0.03 =C2=B1 84%  perf-profile.self.cycl=
es-pp.update_cfs_group
> > >       0.02 =C2=B1122%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.00        perf-profile.self.cycles-pp.comp=
lete_walk
> > >       0.02 =C2=B1122%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp=
._dbus_marshal_read_uint32
> > >       0.03 =C2=B1130%      -0.0        0.02 =C2=B1141%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.strnlen
> > >       0.04 =C2=B1 81%      -0.0        0.02 =C2=B1 99%      -0.0     =
   0.00            -0.0        0.03 =C2=B1 82%  perf-profile.self.cycles-pp=
.seq_puts
> > >       0.16 =C2=B1 33%      -0.0        0.15 =C2=B1 11%      -0.0     =
   0.16 =C2=B1 19%      -0.0        0.13 =C2=B1 27%  perf-profile.self.cycl=
es-pp.smp_call_function_single
> > >       0.07 =C2=B1 20%      -0.0        0.06 =C2=B1 50%      +0.0     =
   0.08 =C2=B1 20%      +0.0        0.08 =C2=B1 20%  perf-profile.self.cycl=
es-pp.common_perm_cond
> > >       0.21 =C2=B1 15%      -0.0        0.20 =C2=B1 12%      -0.0     =
   0.18 =C2=B1 14%      -0.0        0.19 =C2=B1 12%  perf-profile.self.cycl=
es-pp.rcu_report_exp_cpu_mult
> > >       0.20 =C2=B1 15%      -0.0        0.19 =C2=B1 12%      +0.0     =
   0.21 =C2=B1 10%      -0.0        0.20 =C2=B1  6%  perf-profile.self.cycl=
es-pp.__switch_to
> > >       0.05 =C2=B1 56%      -0.0        0.04 =C2=B1 72%      -0.0     =
   0.03 =C2=B1103%      +0.0        0.07 =C2=B1 11%  perf-profile.self.cycl=
es-pp.check_preempt_wakeup
> > >       0.04 =C2=B1 50%      -0.0        0.03 =C2=B1101%      -0.0     =
   0.03 =C2=B1101%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.alloc_empty_file
> > >       0.04 =C2=B1 50%      -0.0        0.03 =C2=B1101%      -0.0     =
   0.03 =C2=B1101%      +0.0        0.06 =C2=B1 51%  perf-profile.self.cycl=
es-pp.memcg_destroy_list_lru
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.seq_read_=
iter
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.asm_sysve=
c_call_function_single
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp._dbus_typ=
e_reader_recurse
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.update_rt=
_rq_load_avg
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.__list_lr=
u_init
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.iput
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.mntput
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.xas_expan=
d
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.delete_tr=
ailing_chars
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.sd_bus_me=
ssage_open_container
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.siphash24=
_init@plt
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.strsep
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.copy_tree
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.radix_tre=
e_node_rcu_free
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.xas_creat=
e
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.select_ta=
sk_rq
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.filemap_g=
et_entry
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            -0.0        0.00        perf-profile.self.cycles-pp.page_coun=
ter_uncharge
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.srcu=
_advance_state
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.__d_=
alloc
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
00            +0.0        0.02 =C2=B1122%  perf-profile.self.cycles-pp.put_=
fs_context
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp.rb_i=
nsert_color
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp.do_u=
mount
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp.vfs_=
unlink
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp.rb_n=
ext
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.greedy_realloc
> > >       0.01 =C2=B1200%      -0.0        0.00            -0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.inode_init_once
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp.look=
up_open
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.kmalloc_trace
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.deactivate_super
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.try_charge_memcg
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.should_failslab
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
02 =C2=B1142%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.xas_load
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
02 =C2=B1 99%      -0.0        0.00        perf-profile.self.cycles-pp.hrti=
mer_interrupt
> > >       0.01 =C2=B1200%      -0.0        0.00            +0.0        0.=
03 =C2=B1103%      +0.0        0.02 =C2=B1122%  perf-profile.self.cycles-pp=
.newidle_balance
> > >       0.38 =C2=B1 22%      -0.0        0.37 =C2=B1  8%      -0.0     =
   0.38 =C2=B1 13%      +0.0        0.41 =C2=B1 10%  perf-profile.self.cycl=
es-pp.mod_objcg_state
> > >       0.11 =C2=B1 50%      -0.0        0.10 =C2=B1 21%      +0.0     =
   0.12 =C2=B1 16%      +0.0        0.13 =C2=B1 31%  perf-profile.self.cycl=
es-pp.xas_store
> > >       0.06 =C2=B1 54%      -0.0        0.05 =C2=B1 46%      -0.0     =
   0.05 =C2=B1 51%      -0.0        0.05 =C2=B1 54%  perf-profile.self.cycl=
es-pp.memcg_list_lru_alloc
> > >       0.05 =C2=B1 51%      -0.0        0.04 =C2=B1 72%      -0.0     =
   0.04 =C2=B1 72%      +0.0        0.06 =C2=B1 53%  perf-profile.self.cycl=
es-pp.worker_thread
> > >       0.14 =C2=B1 26%      -0.0        0.13 =C2=B1 14%      +0.0     =
   0.15 =C2=B1 14%      +0.0        0.14 =C2=B1 25%  perf-profile.self.cycl=
es-pp.___perf_sw_event
> > >       0.03 =C2=B1123%      -0.0        0.02 =C2=B1141%      -0.0     =
   0.02 =C2=B1141%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.__wake_up_common
> > >       0.04 =C2=B1 83%      -0.0        0.03 =C2=B1100%      +0.0     =
   0.04 =C2=B1 71%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.d_walk
> > >       0.08 =C2=B1 36%      -0.0        0.08 =C2=B1 21%      +0.0     =
   0.09 =C2=B1 23%      +0.0        0.09 =C2=B1 19%  perf-profile.self.cycl=
es-pp.__fput
> > >       0.08 =C2=B1 17%      -0.0        0.08 =C2=B1 10%      +0.0     =
   0.09 =C2=B1 30%      +0.0        0.08 =C2=B1 16%  perf-profile.self.cycl=
es-pp.pcpu_block_update
> > >       0.10 =C2=B1 35%      -0.0        0.10 =C2=B1 28%      -0.0     =
   0.09 =C2=B1 26%      -0.1        0.05 =C2=B1 55%  perf-profile.self.cycl=
es-pp.arch_scale_freq_tick
> > >       0.10 =C2=B1 22%      -0.0        0.09 =C2=B1 25%      -0.0     =
   0.08 =C2=B1 49%      -0.0        0.10 =C2=B1 12%  perf-profile.self.cycl=
es-pp.rcu_pending
> > >       0.09 =C2=B1 27%      -0.0        0.08 =C2=B1 20%      -0.0     =
   0.09 =C2=B1 18%      -0.0        0.08 =C2=B1 14%  perf-profile.self.cycl=
es-pp._copy_to_user
> > >       0.06 =C2=B1 51%      -0.0        0.05 =C2=B1 49%      -0.0     =
   0.02 =C2=B1144%      -0.0        0.04 =C2=B1 83%  perf-profile.self.cycl=
es-pp.pcpu_block_update_hint_free
> > >       0.05 =C2=B1 52%      -0.0        0.04 =C2=B1 72%      -0.0     =
   0.03 =C2=B1100%      -0.0        0.05 =C2=B1 51%  perf-profile.self.cycl=
es-pp.__mnt_want_write
> > >       0.03 =C2=B1122%      -0.0        0.02 =C2=B1142%      -0.0     =
   0.03 =C2=B1100%      -0.0        0.02 =C2=B1123%  perf-profile.self.cycl=
es-pp.syscall_exit_to_user_mode_prepare
> > >       0.02 =C2=B1122%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.03 =C2=B1100%      +0.0        0.02 =C2=B1122%  perf-profile.self.cycl=
es-pp.__radix_tree_lookup
> > >       0.07 =C2=B1 22%      -0.0        0.06 =C2=B1 19%      -0.0     =
   0.06 =C2=B1 48%      -0.0        0.06 =C2=B1 54%  perf-profile.self.cycl=
es-pp.generic_fillattr
> > >       0.12 =C2=B1 29%      -0.0        0.11 =C2=B1 14%      +0.0     =
   0.12 =C2=B1 18%      +0.0        0.13 =C2=B1 23%  perf-profile.self.cycl=
es-pp._hashmap_first_key_and_value
> > >       0.03 =C2=B1130%      -0.0        0.02 =C2=B1144%      -0.0     =
   0.02 =C2=B1141%      -0.0        0.02 =C2=B1125%  perf-profile.self.cycl=
es-pp.strcspn@plt
> > >       0.17 =C2=B1 24%      -0.0        0.16 =C2=B1 11%      +0.0     =
   0.17 =C2=B1 15%      +0.0        0.18 =C2=B1 12%  perf-profile.self.cycl=
es-pp.__update_load_avg_se
> > >       0.04 =C2=B1 83%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.00            -0.0        0.03 =C2=B1 82%  perf-profile.self.cycles-pp=
.xas_clear_mark
> > >       0.02 =C2=B1125%      -0.0        0.02 =C2=B1141%      -0.0     =
   0.00            -0.0        0.00        perf-profile.self.cycles-pp._has=
hmap_get
> > >       0.07 =C2=B1 52%      -0.0        0.07 =C2=B1 48%      +0.0     =
   0.09 =C2=B1 23%      +0.0        0.08 =C2=B1 20%  perf-profile.self.cycl=
es-pp.xas_descend
> > >       0.03 =C2=B1 82%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.00            -0.0        0.02 =C2=B1123%  perf-profile.self.cycles-pp=
.strncmp
> > >       0.12 =C2=B1 22%      -0.0        0.12 =C2=B1 26%      +0.0     =
   0.13 =C2=B1 17%      +0.0        0.13 =C2=B1 21%  perf-profile.self.cycl=
es-pp.idle_cpu
> > >       0.27 =C2=B1 17%      -0.0        0.26 =C2=B1 12%      +0.0     =
   0.28 =C2=B1 16%      +0.0        0.28 =C2=B1 14%  perf-profile.self.cycl=
es-pp.lockref_put_return
> > >       0.11 =C2=B1 26%      -0.0        0.10 =C2=B1 33%      -0.0     =
   0.11 =C2=B1 20%      +0.0        0.11 =C2=B1 22%  perf-profile.self.cycl=
es-pp.realloc
> > >       0.03 =C2=B1123%      -0.0        0.02 =C2=B1144%      -0.0     =
   0.02 =C2=B1141%      +0.0        0.03 =C2=B1 81%  perf-profile.self.cycl=
es-pp.fsnotify_destroy_marks
> > >       0.15 =C2=B1 10%      -0.0        0.14 =C2=B1 18%      +0.0     =
   0.15 =C2=B1 19%      -0.0        0.13 =C2=B1  8%  perf-profile.self.cycl=
es-pp.filename_lookup
> > >       0.24 =C2=B1 17%      -0.0        0.24 =C2=B1  7%      -0.0     =
   0.24 =C2=B1  7%      -0.0        0.24 =C2=B1 11%  perf-profile.self.cycl=
es-pp.rep_movs_alternative
> > >       0.11 =C2=B1 22%      -0.0        0.11 =C2=B1 16%      +0.0     =
   0.12 =C2=B1 10%      +0.0        0.11 =C2=B1 10%  perf-profile.self.cycl=
es-pp.set_root
> > >       0.03 =C2=B1 82%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.02 =C2=B1142%      +0.0        0.04 =C2=B1 83%  perf-profile.self.cycl=
es-pp.copy_from_kernel_nofault
> > >       0.02 =C2=B1123%      -0.0        0.02 =C2=B1141%      +0.0     =
   0.07 =C2=B1 50%      +0.0        0.03 =C2=B1127%  perf-profile.self.cycl=
es-pp.os_xsave
> > >       0.08 =C2=B1 34%      -0.0        0.08 =C2=B1 22%      -0.0     =
   0.07 =C2=B1 54%      -0.0        0.07 =C2=B1 20%  perf-profile.self.cycl=
es-pp.__flush_smp_call_function_queue
> > >       0.25 =C2=B1 25%      -0.0        0.24 =C2=B1 11%      +0.0     =
   0.25 =C2=B1 12%      -0.0        0.23 =C2=B1 12%  perf-profile.self.cycl=
es-pp.inode_permission
> > >       0.08 =C2=B1 28%      -0.0        0.07 =C2=B1 18%      -0.0     =
   0.08 =C2=B1 12%      +0.0        0.09 =C2=B1 14%  perf-profile.self.cycl=
es-pp.__memset
> > >       0.06 =C2=B1 21%      -0.0        0.06 =C2=B1 51%      -0.0     =
   0.05 =C2=B1 71%      -0.0        0.05 =C2=B1 54%  perf-profile.self.cycl=
es-pp.try_to_wake_up
> > >       0.03 =C2=B1 82%      -0.0        0.03 =C2=B1101%      -0.0     =
   0.02 =C2=B1 99%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.build_open_flags
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.00        perf-profile.self.cycles-pp.pcpu=
_block_refresh_hint
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.unit_name_escape
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.__lxstat64
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      +0.0        0.02 =C2=B1123%  perf-profile.self.cycl=
es-pp.irqtime_account_irq
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.xas_find
> > >       0.03 =C2=B1128%      -0.0        0.03 =C2=B1102%      -0.0     =
   0.03 =C2=B1101%      +0.0        0.06 =C2=B1 12%  perf-profile.self.cycl=
es-pp.cpuidle_idle_call
> > >       0.50 =C2=B1 24%      -0.0        0.50 =C2=B1 11%      -0.0     =
   0.49 =C2=B1 16%      -0.1        0.45 =C2=B1  8%  perf-profile.self.cycl=
es-pp.rdrand
> > >       0.11 =C2=B1 21%      -0.0        0.11 =C2=B1 24%      +0.0     =
   0.13 =C2=B1 11%      +0.0        0.13 =C2=B1 13%  perf-profile.self.cycl=
es-pp.mutex_lock
> > >       0.03 =C2=B1 81%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.02 =C2=B1 99%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp._IO_feof
> > >       0.09 =C2=B1 15%      -0.0        0.09 =C2=B1 41%      -0.0     =
   0.08 =C2=B1 50%      -0.0        0.07 =C2=B1 10%  perf-profile.self.cycl=
es-pp._find_next_and_bit
> > >       0.19 =C2=B1 25%      -0.0        0.19 =C2=B1 13%      -0.0     =
   0.18 =C2=B1 13%      -0.0        0.18 =C2=B1 13%  perf-profile.self.cycl=
es-pp.number
> > >       0.08 =C2=B1 22%      -0.0        0.08 =C2=B1 31%      +0.0     =
   0.09 =C2=B1 16%      +0.0        0.09 =C2=B1  4%  perf-profile.self.cycl=
es-pp.entry_SYSCALL_64_safe_stack
> > >       0.06 =C2=B1 82%      -0.0        0.05 =C2=B1 80%      -0.0     =
   0.06 =C2=B1 81%      -0.0        0.05 =C2=B1 91%  perf-profile.self.cycl=
es-pp.ktime_get_update_offsets_now
> > >       0.27 =C2=B1  5%      -0.0        0.26 =C2=B1  9%      +0.0     =
   0.28 =C2=B1 13%      +0.0        0.27 =C2=B1 15%  perf-profile.self.cycl=
es-pp.__cond_resched
> > >       0.09 =C2=B1 17%      -0.0        0.09 =C2=B1 11%      -0.0     =
   0.08 =C2=B1 20%      -0.0        0.09 =C2=B1 17%  perf-profile.self.cycl=
es-pp.__srcu_read_lock
> > >       0.11 =C2=B1 28%      -0.0        0.11 =C2=B1 17%      +0.0     =
   0.12 =C2=B1 16%      -0.0        0.10 =C2=B1 17%  perf-profile.self.cycl=
es-pp.lockref_get
> > >       0.03 =C2=B1 82%      -0.0        0.03 =C2=B1100%      -0.0     =
   0.02 =C2=B1 99%      +0.0        0.04 =C2=B1 82%  perf-profile.self.cycl=
es-pp.may_delete
> > >       0.16 =C2=B1 24%      -0.0        0.16 =C2=B1 13%      +0.0     =
   0.19 =C2=B1 21%      +0.0        0.16 =C2=B1 17%  perf-profile.self.cycl=
es-pp.__update_load_avg_cfs_rq
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      +0.0        0.02 =C2=B1122%  perf-profile.self.cycl=
es-pp.show_type
> > >       0.02 =C2=B1123%      -0.0        0.02 =C2=B1141%      +0.0     =
   0.04 =C2=B1 45%      +0.0        0.02 =C2=B1123%  perf-profile.self.cycl=
es-pp.rcu_nocb_try_bypass
> > >       0.06 =C2=B1 23%      -0.0        0.06 =C2=B1 45%      -0.0     =
   0.03 =C2=B1106%      -0.0        0.04 =C2=B1 50%  perf-profile.self.cycl=
es-pp.pick_next_entity
> > >       0.05 =C2=B1 50%      -0.0        0.05 =C2=B1 47%      -0.0     =
   0.04 =C2=B1 47%      +0.0        0.05 =C2=B1 54%  perf-profile.self.cycl=
es-pp.__update_blocked_fair
> > >       0.09 =C2=B1 58%      -0.0        0.09 =C2=B1 11%      +0.0     =
   0.11 =C2=B1 17%      +0.0        0.10 =C2=B1 21%  perf-profile.self.cycl=
es-pp.do_dentry_open
> > >       0.02 =C2=B1122%      -0.0        0.02 =C2=B1142%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.propagate_mnt
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.00        perf-profile.self.cycles-pp.mall=
oc@plt
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.00        perf-profile.self.cycles-pp.memc=
g_init_list_lru_one
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.00        perf-profile.self.cycles-pp.plac=
e_entity
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp=
.siphash24_compress@plt
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.01 =C2=B1223%      +0.0        0.02 =C2=B1122%  perf-profile.self.cycl=
es-pp.namespace_unlock
> > >       0.01 =C2=B1200%      -0.0        0.01 =C2=B1223%      +0.0     =
   0.03 =C2=B1100%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.__queue_work
> > >       0.09 =C2=B1 17%      -0.0        0.09 =C2=B1 20%      -0.0     =
   0.08 =C2=B1 23%      -0.0        0.08 =C2=B1 27%  perf-profile.self.cycl=
es-pp.prepend_path
> > >       0.09 =C2=B1 47%      -0.0        0.09 =C2=B1 24%      +0.0     =
   0.10 =C2=B1 24%      +0.0        0.10 =C2=B1 19%  perf-profile.self.cycl=
es-pp.lookup_fast
> > >       0.03 =C2=B1127%      -0.0        0.02 =C2=B1 99%      +0.0     =
   0.03 =C2=B1100%      +0.0        0.04 =C2=B1 50%  perf-profile.self.cycl=
es-pp.vfs_create_mount
> > >       0.23 =C2=B1 25%      -0.0        0.22 =C2=B1  9%      +0.0     =
   0.24 =C2=B1 17%      +0.0        0.24 =C2=B1  4%  perf-profile.self.cycl=
es-pp.__kmem_cache_free
> > >       0.03 =C2=B1 82%      -0.0        0.03 =C2=B1 70%      -0.0     =
   0.03 =C2=B1100%      +0.0        0.05 =C2=B1 57%  perf-profile.self.cycl=
es-pp.ida_free
> > >       0.08 =C2=B1 33%      -0.0        0.08 =C2=B1 16%      -0.0     =
   0.08 =C2=B1 21%      +0.0        0.08 =C2=B1 17%  perf-profile.self.cycl=
es-pp.security_inode_permission
> > >       0.06 =C2=B1 56%      -0.0        0.06 =C2=B1 50%      +0.0     =
   0.07 =C2=B1 25%      -0.0        0.06 =C2=B1 53%  perf-profile.self.cycl=
es-pp.dequeue_entity
> > >       0.12 =C2=B1 15%      +0.0        0.12 =C2=B1 13%      -0.0     =
   0.11 =C2=B1 12%      +0.0        0.13 =C2=B1 16%  perf-profile.self.cycl=
es-pp.string_escape_mem
> > >       0.01 =C2=B1200%      +0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.00        perf-profile.self.cycles-pp.secu=
rity_capable
> > >       0.01 =C2=B1200%      +0.0        0.01 =C2=B1223%      -0.0     =
   0.00            -0.0        0.00        perf-profile.self.cycles-pp.ttwu=
_queue_wakelist
> > >       0.01 =C2=B1200%      +0.0        0.01 =C2=B1223%      +0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp=
.put_prev_entity
> > >       0.01 =C2=B1200%      +0.0        0.01 =C2=B1223%      +0.0     =
   0.01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.nd_jump_root
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.object_pa=
th_is_valid
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.pick_file
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.mem_cgrou=
p_handle_over_high
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.release_p=
ages
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.shmem_get=
attr
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp._hashmap_=
size
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.security_=
inode_init_security
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.switch_fp=
u_return
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.lookup_co=
nstant
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.locks_rem=
ove_posix
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.stress_mw=
c1
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.d_alloc_p=
arallel
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.ktime_get=
_mono_fast_ns
> > >       0.00            +0.0        0.00            +0.0        0.00   =
         +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.apparmor_=
sb_mount
> > >       0.01 =C2=B1200%      +0.0        0.01 =C2=B1223%      +0.0     =
   0.02 =C2=B1141%      -0.0        0.00        perf-profile.self.cycles-pp=
.putname
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.__fsnot=
ify_parent
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.srcu_gp=
_start_if_needed
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.deactiv=
ate_locked_super
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.unlink
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.evict
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.lookup_=
one_qstr_excl
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.__kmall=
oc_node_track_caller
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.chacha_=
block_generic
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.dentry_=
kill
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.perf_ro=
tate_context
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.shmem_f=
ree_in_core_inode
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.shmem_e=
vict_inode
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.cpuidle=
_governor_latency_req
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.ihold
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.timerqu=
eue_add
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.i_callb=
ack
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.st=
ress_ramfs_umount
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.xa=
s_find_marked
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.02 =C2=B1123%  perf-profile.self.cycles-pp.__=
mod_memcg_lruvec_state
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.02 =C2=B1123%  perf-profile.self.cycles-pp.__=
calc_delta
> > >       0.00            +0.0        0.00            +0.0        0.01 =
=C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.wake_up=
_bit
> > >       0.07 =C2=B1 12%      +0.0        0.07 =C2=B1 16%      +0.0     =
   0.08 =C2=B1 20%      -0.0        0.06 =C2=B1 53%  perf-profile.self.cycl=
es-pp.path_lookupat
> > >       0.01 =C2=B1200%      +0.0        0.01 =C2=B1223%      +0.0     =
   0.02 =C2=B1142%      +0.0        0.02 =C2=B1123%  perf-profile.self.cycl=
es-pp.vmalloc_to_page
> > >       0.14 =C2=B1 19%      +0.0        0.14 =C2=B1 14%      +0.0     =
   0.16 =C2=B1 19%      +0.0        0.15 =C2=B1 16%  perf-profile.self.cycl=
es-pp.syscall_return_via_sysret
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1141%      +0.0        0.00        perf-profile.self.cycles-pp.__bitma=
p_set
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1141%      +0.0        0.00        perf-profile.self.cycles-pp.call_cp=
uidle
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1141%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.cl=
ear_page_erms
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1144%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.do=
_open
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1146%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.rw=
sem_spin_on_owner
> > >       0.00            +0.0        0.00            +0.0        0.02 =
=C2=B1 99%      +0.0        0.00        perf-profile.self.cycles-pp.__dentr=
y_kill
> > >       0.08 =C2=B1 26%      +0.0        0.08 =C2=B1 27%      +0.0     =
   0.11 =C2=B1 11%      +0.0        0.10 =C2=B1 13%  perf-profile.self.cycl=
es-pp.__check_object_size
> > >       0.00            +0.0        0.00            +0.0        0.04 =
=C2=B1 71%      +0.0        0.02 =C2=B1122%  perf-profile.self.cycles-pp.__=
x64_sys_umount
> > >       0.05 =C2=B1 53%      +0.0        0.05 =C2=B1 46%      +0.0     =
   0.08 =C2=B1 14%      +0.0        0.05 =C2=B1 56%  perf-profile.self.cycl=
es-pp.propagation_next
> > >       0.06 =C2=B1 53%      +0.0        0.06 =C2=B1 47%      +0.0     =
   0.07 =C2=B1 20%      +0.0        0.07 =C2=B1 23%  perf-profile.self.cycl=
es-pp.lockref_put_or_lock
> > >       0.02 =C2=B1125%      +0.0        0.02 =C2=B1145%      +0.0     =
   0.04 =C2=B1 72%      +0.0        0.04 =C2=B1 85%  perf-profile.self.cycl=
es-pp.umount_tree
> > >       0.02 =C2=B1125%      +0.0        0.02 =C2=B1 99%      -0.0     =
   0.02 =C2=B1142%      -0.0        0.00        perf-profile.self.cycles-pp=
.inode_maybe_inc_iversion
> > >       0.08 =C2=B1 17%      +0.0        0.08 =C2=B1 21%      +0.0     =
   0.08 =C2=B1  5%      +0.0        0.09 =C2=B1 19%  perf-profile.self.cycl=
es-pp.walk_component
> > >       0.04 =C2=B1 82%      +0.0        0.04 =C2=B1 72%      +0.0     =
   0.04 =C2=B1 71%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.rb_erase
> > >       0.13 =C2=B1 22%      +0.0        0.13 =C2=B1  8%      +0.0     =
   0.14 =C2=B1 13%      +0.0        0.14 =C2=B1 11%  perf-profile.self.cycl=
es-pp.get_nr_inodes
> > >       0.12 =C2=B1 29%      +0.0        0.12 =C2=B1 24%      +0.0     =
   0.13 =C2=B1 11%      +0.0        0.12 =C2=B1 17%  perf-profile.self.cycl=
es-pp.update_curr
> > >       0.14 =C2=B1 16%      +0.0        0.14 =C2=B1 15%      +0.0     =
   0.14 =C2=B1 20%      +0.0        0.14 =C2=B1 14%  perf-profile.self.cycl=
es-pp.task_work_add
> > >       0.14 =C2=B1 25%      +0.0        0.14 =C2=B1 10%      -0.0     =
   0.12 =C2=B1 22%      +0.0        0.14 =C2=B1 25%  perf-profile.self.cycl=
es-pp.rcu_segcblist_enqueue
> > >       0.13 =C2=B1 29%      +0.0        0.13 =C2=B1 22%      +0.0     =
   0.13 =C2=B1 14%      +0.0        0.13 =C2=B1  6%  perf-profile.self.cycl=
es-pp.get_nr_dirty_inodes
> > >       0.02 =C2=B1200%      +0.0        0.02 =C2=B1142%      +0.0     =
   0.03 =C2=B1100%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.rcu_do_batch
> > >       0.12 =C2=B1 32%      +0.0        0.12 =C2=B1 22%      -0.0     =
   0.11 =C2=B1 21%      +0.0        0.14 =C2=B1 26%  perf-profile.self.cycl=
es-pp.get_obj_cgroup_from_current
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1141%      +0.0     =
   0.02 =C2=B1141%      -0.0        0.00        perf-profile.self.cycles-pp=
.__wait_for_common
> > >       0.07 =C2=B1 23%      +0.0        0.08 =C2=B1 12%      -0.0     =
   0.07 =C2=B1 24%      -0.0        0.06 =C2=B1 53%  perf-profile.self.cycl=
es-pp.task_work_run
> > >       0.08 =C2=B1 20%      +0.0        0.08 =C2=B1 24%      +0.0     =
   0.08 =C2=B1 27%      -0.0        0.08 =C2=B1 25%  perf-profile.self.cycl=
es-pp.do_filp_open
> > >       0.06 =C2=B1 14%      +0.0        0.06 =C2=B1 14%      -0.0     =
   0.06 =C2=B1 46%      -0.0        0.05 =C2=B1 50%  perf-profile.self.cycl=
es-pp.syscall_enter_from_user_mode
> > >       0.13 =C2=B1 17%      +0.0        0.13 =C2=B1 16%      +0.0     =
   0.14 =C2=B1 15%      +0.0        0.15 =C2=B1 12%  perf-profile.self.cycl=
es-pp.dput
> > >       0.11 =C2=B1 19%      +0.0        0.11 =C2=B1 26%      +0.0     =
   0.12 =C2=B1 12%      +0.0        0.13 =C2=B1 23%  perf-profile.self.cycl=
es-pp.clone_mnt
> > >       0.40 =C2=B1 26%      +0.0        0.40 =C2=B1  9%      -0.0     =
   0.38 =C2=B1 13%      +0.0        0.40 =C2=B1 16%  perf-profile.self.cycl=
es-pp.device_read_db_internal_filename
> > >       0.27 =C2=B1 13%      +0.0        0.27 =C2=B1 12%      +0.0     =
   0.28 =C2=B1 10%      -0.0        0.25 =C2=B1  8%  perf-profile.self.cycl=
es-pp.native_sched_clock
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1142%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.check_preempt_curr
> > >       0.06 =C2=B1 65%      +0.0        0.07 =C2=B1 15%      -0.0     =
   0.05 =C2=B1 48%      -0.0        0.03 =C2=B1 82%  perf-profile.self.cycl=
es-pp.string_table_lookup
> > >       0.06 =C2=B1 51%      +0.0        0.07 =C2=B1 30%      +0.0     =
   0.07 =C2=B1 13%      -0.0        0.06 =C2=B1 51%  perf-profile.self.cycl=
es-pp.chacha_permute
> > >       0.22 =C2=B1 20%      +0.0        0.23 =C2=B1 13%      +0.0     =
   0.23 =C2=B1 10%      +0.0        0.25 =C2=B1  4%  perf-profile.self.cycl=
es-pp.strlen
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1141%      -0.0     =
   0.01 =C2=B1223%      +0.0        0.02 =C2=B1125%  perf-profile.self.cycl=
es-pp.__rdgsbase_inactive
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1141%      +0.0     =
   0.05 =C2=B1 47%      +0.0        0.03 =C2=B1 84%  perf-profile.self.cycl=
es-pp.update_min_vruntime
> > >       0.11 =C2=B1 24%      +0.0        0.12 =C2=B1 13%      -0.0     =
   0.11 =C2=B1 28%      -0.0        0.10 =C2=B1 20%  perf-profile.self.cycl=
es-pp.vfs_getattr_nosec
> > >       0.03 =C2=B1 81%      +0.0        0.04 =C2=B1101%      -0.0     =
   0.00            +0.0        0.05 =C2=B1 51%  perf-profile.self.cycles-pp=
.cpuacct_charge
> > >       0.08 =C2=B1 54%      +0.0        0.08 =C2=B1 20%      +0.0     =
   0.08 =C2=B1 22%      -0.0        0.07 =C2=B1 13%  perf-profile.self.cycl=
es-pp._hashmap_iterate
> > >       0.12 =C2=B1 38%      +0.0        0.12 =C2=B1 14%      +0.0     =
   0.14 =C2=B1 17%      +0.0        0.12 =C2=B1 18%  perf-profile.self.cycl=
es-pp.siphash24_init
> > >       0.06 =C2=B1 56%      +0.0        0.06 =C2=B1 14%      -0.0     =
   0.05 =C2=B1 74%      -0.0        0.04 =C2=B1 83%  perf-profile.self.cycl=
es-pp._hashmap_clear
> > >       0.06 =C2=B1 59%      +0.0        0.06 =C2=B1 14%      +0.0     =
   0.06 =C2=B1 14%      +0.0        0.07 =C2=B1 25%  perf-profile.self.cycl=
es-pp.__do_sys_newfstat
> > >       1.37 =C2=B1 23%      +0.0        1.38 =C2=B1  7%      -0.1     =
   1.30 =C2=B1 14%      -0.1        1.27 =C2=B1  7%  perf-profile.self.cycl=
es-pp.siphash24_compress
> > >       0.09 =C2=B1 14%      +0.0        0.10 =C2=B1 23%      +0.0     =
   0.10 =C2=B1 18%      +0.0        0.10 =C2=B1 20%  perf-profile.self.cycl=
es-pp.exit_to_user_mode_loop
> > >       0.10 =C2=B1 20%      +0.0        0.11 =C2=B1 13%      +0.0     =
   0.11 =C2=B1 14%      +0.0        0.12 =C2=B1 27%  perf-profile.self.cycl=
es-pp.do_syscall_64
> > >       0.06 =C2=B1 50%      +0.0        0.07 =C2=B1 47%      +0.0     =
   0.08 =C2=B1 24%      +0.0        0.07 =C2=B1 21%  perf-profile.self.cycl=
es-pp.propagate_umount
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1142%      +0.0     =
   0.02 =C2=B1144%      +0.0        0.03 =C2=B1 82%  perf-profile.self.cycl=
es-pp.current_time
> > >       0.06 =C2=B1 57%      +0.0        0.07 =C2=B1 49%      +0.0     =
   0.06 =C2=B1 45%      -0.0        0.06 =C2=B1 12%  perf-profile.self.cycl=
es-pp.rcu_exp_handler
> > >       0.45 =C2=B1 16%      +0.0        0.46 =C2=B1 15%      +0.0     =
   0.46 =C2=B1 12%      -0.0        0.44 =C2=B1 10%  perf-profile.self.cycl=
es-pp.memcg_slab_post_alloc_hook
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1141%      -0.0     =
   0.01 =C2=B1223%      +0.0        0.03 =C2=B1 82%  perf-profile.self.cycl=
es-pp.alloc_super
> > >       0.06 =C2=B1 54%      +0.0        0.07 =C2=B1 16%      -0.0     =
   0.05 =C2=B1 72%      +0.0        0.07 =C2=B1 12%  perf-profile.self.cycl=
es-pp.path_equal
> > >       0.04 =C2=B1 83%      +0.0        0.05 =C2=B1 71%      +0.0     =
   0.06 =C2=B1 11%      -0.0        0.03 =C2=B1 84%  perf-profile.self.cycl=
es-pp.kernfs_iop_permission
> > >       0.06 =C2=B1 61%      +0.0        0.06 =C2=B1 24%      +0.0     =
   0.07 =C2=B1 20%      +0.0        0.08 =C2=B1 13%  perf-profile.self.cycl=
es-pp.syscall_exit_to_user_mode
> > >       0.03 =C2=B1123%      +0.0        0.03 =C2=B1111%      +0.0     =
   0.05 =C2=B1 73%      +0.0        0.05 =C2=B1 52%  perf-profile.self.cycl=
es-pp.kmalloc_slab
> > >       0.05 =C2=B1 86%      +0.0        0.05 =C2=B1 49%      +0.0     =
   0.07 =C2=B1 24%      +0.0        0.05 =C2=B1 54%  perf-profile.self.cycl=
es-pp.stress_ramfs_child
> > >       0.18 =C2=B1 33%      +0.0        0.18 =C2=B1 27%      +0.0     =
   0.19 =C2=B1 14%      +0.0        0.20 =C2=B1 20%  perf-profile.self.cycl=
es-pp.__list_del_entry_valid
> > >       0.24 =C2=B1 20%      +0.0        0.25 =C2=B1  7%      -0.0     =
   0.23 =C2=B1 21%      +0.0        0.25 =C2=B1  9%  perf-profile.self.cycl=
es-pp.__entry_text_start
> > >       0.05 =C2=B1 58%      +0.0        0.06 =C2=B1 21%      -0.0     =
   0.04 =C2=B1 78%      -0.0        0.05 =C2=B1 52%  perf-profile.self.cycl=
es-pp._copy_from_user
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1146%      +0.0     =
   0.03 =C2=B1101%      -0.0        0.00        perf-profile.self.cycles-pp=
.check_cpu_stall
> > >       0.06 =C2=B1 23%      +0.0        0.07 =C2=B1 23%      +0.0     =
   0.08 =C2=B1 10%      +0.0        0.08 =C2=B1 31%  perf-profile.self.cycl=
es-pp.kernfs_dop_revalidate
> > >       0.09 =C2=B1 25%      +0.0        0.10 =C2=B1 20%      -0.0     =
   0.08 =C2=B1 21%      +0.0        0.09 =C2=B1 23%  perf-profile.self.cycl=
es-pp.up_write
> > >       0.10 =C2=B1 30%      +0.0        0.11 =C2=B1 10%      +0.0     =
   0.12 =C2=B1 13%      +0.0        0.12 =C2=B1 25%  perf-profile.self.cycl=
es-pp.kmem_cache_alloc_lru
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1144%      +0.0     =
   0.02 =C2=B1142%      +0.0        0.04 =C2=B1 83%  perf-profile.self.cycl=
es-pp.try_to_unlazy
> > >       0.34 =C2=B1 16%      +0.0        0.35 =C2=B1 12%      -0.0     =
   0.33 =C2=B1 16%      +0.0        0.37 =C2=B1  9%  perf-profile.self.cycl=
es-pp.__d_lookup_rcu
> > >       0.21 =C2=B1 26%      +0.0        0.22 =C2=B1  6%      -0.0     =
   0.20 =C2=B1 17%      -0.0        0.19 =C2=B1 15%  perf-profile.self.cycl=
es-pp.entry_SYSCALL_64_after_hwframe
> > >       0.10 =C2=B1 23%      +0.0        0.11 =C2=B1 16%      +0.0     =
   0.12 =C2=B1 27%      +0.0        0.12 =C2=B1 16%  perf-profile.self.cycl=
es-pp.refill_obj_stock
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1142%      -0.0     =
   0.00            +0.0        0.02 =C2=B1122%  perf-profile.self.cycles-pp=
.kernfs_iop_getattr
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.seq_escap=
e_mem
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.memcg_acc=
ount_kmem
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.find_busi=
est_group
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.get_parti=
al_node
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.available=
_idle_cpu
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.put_cpu_p=
artial
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.get_page_=
from_freelist
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.pcpu_chun=
k_relocate
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.get_mount=
point
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.dbus_mess=
age_get_interface
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.stri=
ng
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp.perc=
pu_free_rwsem
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.02 =C2=B1123%  perf-profile.self.cycles-pp.prop=
agate_one
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.atta=
ch_recursive_mnt
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp._IO_=
link_in
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.02 =C2=B1122%  perf-profile.self.cycles-pp=
.show_mnt_opts
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.__alloc_pages
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.x86_pmu_disable
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1142%      +0.0     =
   0.03 =C2=B1100%      +0.0        0.05 =C2=B1 50%  perf-profile.self.cycl=
es-pp.__hrtimer_run_queues
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
02 =C2=B1141%      +0.0        0.00        perf-profile.self.cycles-pp.path=
_openat
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
02 =C2=B1141%      +0.0        0.02 =C2=B1123%  perf-profile.self.cycles-pp=
.path_umount
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1142%      +0.0     =
   0.03 =C2=B1 70%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.__hrtimer_next_event_base
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
03 =C2=B1100%      +0.0        0.00        perf-profile.self.cycles-pp.__un=
freeze_partials
> > >       0.05 =C2=B1 57%      +0.0        0.06 =C2=B1 47%      -0.0     =
   0.03 =C2=B1103%      -0.0        0.02 =C2=B1123%  perf-profile.self.cycl=
es-pp.alloc_fd
> > >       0.14 =C2=B1 20%      +0.0        0.15 =C2=B1 23%      +0.0     =
   0.16 =C2=B1 21%      +0.0        0.16 =C2=B1 20%  perf-profile.self.cycl=
es-pp.free_percpu
> > >       0.10 =C2=B1 16%      +0.0        0.11 =C2=B1 20%      -0.0     =
   0.09 =C2=B1 19%      +0.0        0.10 =C2=B1  9%  perf-profile.self.cycl=
es-pp.strcmp
> > >       0.07 =C2=B1 17%      +0.0        0.08 =C2=B1 25%      +0.0     =
   0.09 =C2=B1 26%      -0.0        0.06 =C2=B1 51%  perf-profile.self.cycl=
es-pp.update_rq_clock_task
> > >       0.09 =C2=B1 26%      +0.0        0.10 =C2=B1 17%      +0.0     =
   0.09 =C2=B1 11%      +0.0        0.10 =C2=B1 21%  perf-profile.self.cycl=
es-pp._IO_default_xsputn
> > >       0.07 =C2=B1 53%      +0.0        0.08 =C2=B1 26%      -0.0     =
   0.03 =C2=B1100%      -0.0        0.04 =C2=B1 85%  perf-profile.self.cycl=
es-pp.switch_mm_irqs_off
> > >       0.26 =C2=B1 94%      +0.0        0.26 =C2=B1 84%      -0.0     =
   0.24 =C2=B1115%      +0.0        0.30 =C2=B1 78%  perf-profile.self.cycl=
es-pp.ktime_get
> > >       0.03 =C2=B1 84%      +0.0        0.04 =C2=B1 73%      -0.0     =
   0.02 =C2=B1144%      -0.0        0.03 =C2=B1 82%  perf-profile.self.cycl=
es-pp.sync_rcu_exp_select_cpus
> > >       0.06 =C2=B1 30%      +0.0        0.07 =C2=B1 20%      -0.0     =
   0.06 =C2=B1 17%      -0.0        0.05 =C2=B1 54%  perf-profile.self.cycl=
es-pp.map_id_up
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.__legitim=
ize_path
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.srcu_invoke_callbacks
> > >       0.00            +0.0        0.01 =C2=B1223%      +0.0        0.=
01 =C2=B1223%      +0.0        0.02 =C2=B1122%  perf-profile.self.cycles-pp=
.__x64_sys_openat
> > >       0.11 =C2=B1 30%      +0.0        0.12 =C2=B1 17%      +0.0     =
   0.11 =C2=B1 23%      +0.0        0.12 =C2=B1  9%  perf-profile.self.cycl=
es-pp.show_mountinfo
> > >       0.06 =C2=B1 61%      +0.0        0.07 =C2=B1 25%      +0.0     =
   0.07 =C2=B1 11%      +0.0        0.07 =C2=B1 16%  perf-profile.self.cycl=
es-pp.finish_task_switch
> > >       0.08 =C2=B1 13%      +0.0        0.09 =C2=B1 18%      -0.0     =
   0.06 =C2=B1 48%      +0.0        0.08 =C2=B1 16%  perf-profile.self.cycl=
es-pp.init_file
> > >       0.10 =C2=B1 33%      +0.0        0.12 =C2=B1 22%      +0.0     =
   0.12 =C2=B1 20%      +0.0        0.12 =C2=B1 17%  perf-profile.self.cycl=
es-pp.cp_new_stat
> > >       0.01 =C2=B1200%      +0.0        0.02 =C2=B1 99%      +0.0     =
   0.04 =C2=B1 77%      -0.0        0.00        perf-profile.self.cycles-pp=
.tick_sched_do_timer
> > >       0.32 =C2=B1 17%      +0.0        0.33 =C2=B1 12%      +0.0     =
   0.35 =C2=B1  8%      +0.0        0.34 =C2=B1 14%  perf-profile.self.cycl=
es-pp.__call_rcu_common
> > >       0.18 =C2=B1 19%      +0.0        0.19 =C2=B1 14%      -0.0     =
   0.17 =C2=B1 18%      -0.0        0.16 =C2=B1  6%  perf-profile.self.cycl=
es-pp.strchr
> > >       0.15 =C2=B1 25%      +0.0        0.17 =C2=B1 12%      -0.0     =
   0.15 =C2=B1 13%      -0.0        0.14 =C2=B1  7%  perf-profile.self.cycl=
es-pp.apparmor_file_alloc_security
> > >       0.05 =C2=B1 53%      +0.0        0.07 =C2=B1 57%      +0.0     =
   0.08 =C2=B1 14%      +0.0        0.08 =C2=B1 23%  perf-profile.self.cycl=
es-pp.pcpu_block_update_hint_alloc
> > >       0.01 =C2=B1200%      +0.0        0.03 =C2=B1100%      +0.0     =
   0.04 =C2=B1103%      +0.1        0.07 =C2=B1 12%  perf-profile.self.cycl=
es-pp.__bitmap_clear
> > >       0.09 =C2=B1 28%      +0.0        0.10 =C2=B1 14%      -0.0     =
   0.08 =C2=B1 29%      +0.0        0.10 =C2=B1 26%  perf-profile.self.cycl=
es-pp.hashmap_replace
> > >       0.26 =C2=B1 26%      +0.0        0.28 =C2=B1 16%      +0.1     =
   0.32 =C2=B1 13%      +0.1        0.32 =C2=B1 17%  perf-profile.self.cycl=
es-pp.__switch_to_asm
> > >       0.06 =C2=B1 10%      +0.0        0.07 =C2=B1 51%      +0.0     =
   0.08 =C2=B1 27%      +0.0        0.09 =C2=B1 18%  perf-profile.self.cycl=
es-pp.inode_init_always
> > >       0.04 =C2=B1 82%      +0.0        0.05 =C2=B1 71%      +0.0     =
   0.06 =C2=B1 45%      +0.0        0.05 =C2=B1 52%  perf-profile.self.cycl=
es-pp._raw_read_lock_irqsave
> > >       0.08 =C2=B1 24%      +0.0        0.09 =C2=B1 11%      +0.0     =
   0.08 =C2=B1 13%      -0.0        0.08 =C2=B1 21%  perf-profile.self.cycl=
es-pp.__fxstat64
> > >       0.10 =C2=B1  9%      +0.0        0.11 =C2=B1 28%      +0.0     =
   0.10 =C2=B1 12%      +0.0        0.11 =C2=B1 19%  perf-profile.self.cycl=
es-pp.pick_next_task_fair
> > >       0.42 =C2=B1  9%      +0.0        0.43 =C2=B1  6%      +0.0     =
   0.44 =C2=B1  6%      -0.0        0.41 =C2=B1  4%  perf-profile.self.cycl=
es-pp.kmem_cache_alloc
> > >       0.03 =C2=B1123%      +0.0        0.04 =C2=B1 73%      -0.0     =
   0.02 =C2=B1144%      +0.0        0.04 =C2=B1 83%  perf-profile.self.cycl=
es-pp.shmem_get_inode
> > >       0.04 =C2=B1 83%      +0.0        0.05 =C2=B1 46%      +0.0     =
   0.05 =C2=B1 45%      +0.0        0.04 =C2=B1 83%  perf-profile.self.cycl=
es-pp.queue_work_on
> > >       0.56 =C2=B1 25%      +0.0        0.58 =C2=B1 10%      -0.0     =
   0.56 =C2=B1 12%      -0.0        0.55 =C2=B1  9%  perf-profile.self.cycl=
es-pp.kmem_cache_free
> > >       0.10 =C2=B1 13%      +0.0        0.12 =C2=B1  7%      +0.0     =
   0.12 =C2=B1 26%      +0.0        0.12 =C2=B1 28%  perf-profile.self.cycl=
es-pp.enqueue_entity
> > >       0.05 =C2=B1 50%      +0.0        0.07 =C2=B1 19%      +0.0     =
   0.06 =C2=B1 54%      +0.0        0.08 =C2=B1 22%  perf-profile.self.cycl=
es-pp.__filename_parentat
> > >       0.01 =C2=B1200%      +0.0        0.03 =C2=B1100%      -0.0     =
   0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles-pp=
.strcmp@plt
> > >       0.12 =C2=B1 22%      +0.0        0.14 =C2=B1  9%      +0.0     =
   0.14 =C2=B1  8%      +0.0        0.15 =C2=B1 13%  perf-profile.self.cycl=
es-pp.mutex_unlock
> > >       0.06 =C2=B1 56%      +0.0        0.08 =C2=B1 46%      +0.0     =
   0.07 =C2=B1 15%      +0.0        0.08 =C2=B1 17%  perf-profile.self.cycl=
es-pp.set_next_entity
> > >       0.14 =C2=B1 26%      +0.0        0.15 =C2=B1 16%      +0.0     =
   0.14 =C2=B1 13%      -0.0        0.11 =C2=B1 11%  perf-profile.self.cycl=
es-pp.getname_flags
> > >       0.05 =C2=B1 52%      +0.0        0.06 =C2=B1 48%      +0.0     =
   0.05 =C2=B1 75%      -0.0        0.03 =C2=B1 82%  perf-profile.self.cycl=
es-pp.openat64
> > >       0.27 =C2=B1 13%      +0.0        0.28 =C2=B1 25%      +0.0     =
   0.30 =C2=B1 10%      +0.0        0.29 =C2=B1 13%  perf-profile.self.cycl=
es-pp._raw_spin_lock_irq
> > >       0.06 =C2=B1 50%      +0.0        0.08 =C2=B1 23%      +0.0     =
   0.07 =C2=B1 16%      -0.0        0.06 =C2=B1 53%  perf-profile.self.cycl=
es-pp.schedule
> > >       0.06 =C2=B1 56%      +0.0        0.08 =C2=B1 22%      +0.0     =
   0.07 =C2=B1 16%      +0.0        0.07 =C2=B1 36%  perf-profile.self.cycl=
es-pp.path_simplify
> > >       0.11 =C2=B1 25%      +0.0        0.13 =C2=B1 21%      +0.0     =
   0.13 =C2=B1 14%      +0.0        0.11 =C2=B1 11%  perf-profile.self.cycl=
es-pp._raw_spin_unlock_irqrestore
> > >       0.00            +0.0        0.02 =C2=B1141%      +0.0        0.=
00            +0.0        0.00        perf-profile.self.cycles-pp.close_fd
> > >       0.02 =C2=B1122%      +0.0        0.04 =C2=B1101%      +0.0     =
   0.02 =C2=B1 99%      +0.0        0.05 =C2=B1 52%  perf-profile.self.cycl=
es-pp.__libc_calloc
> > >       0.00            +0.0        0.02 =C2=B1141%      +0.0        0.=
01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycles-pp=
.resched_curr
> > >       0.00            +0.0        0.02 =C2=B1141%      +0.0        0.=
01 =C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.do_s=
ys_openat2
> > >       0.01 =C2=B1200%      +0.0        0.03 =C2=B1100%      +0.0     =
   0.01 =C2=B1223%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.synchronize_rcu_expedited
> > >       0.18 =C2=B1 24%      +0.0        0.20 =C2=B1 14%      +0.0     =
   0.18 =C2=B1 10%      +0.0        0.20 =C2=B1 12%  perf-profile.self.cycl=
es-pp.pcpu_alloc_area
> > >       0.11 =C2=B1 24%      +0.0        0.12 =C2=B1 15%      +0.0     =
   0.12 =C2=B1 17%      +0.0        0.12 =C2=B1 25%  perf-profile.self.cycl=
es-pp.obj_cgroup_charge
> > >       0.09 =C2=B1 41%      +0.0        0.10 =C2=B1 37%      -0.0     =
   0.08 =C2=B1 58%      +0.0        0.09 =C2=B1 18%  perf-profile.self.cycl=
es-pp.llist_add_batch
> > >       0.08 =C2=B1 22%      +0.0        0.10 =C2=B1 31%      +0.0     =
   0.08 =C2=B1 34%      -0.0        0.07 =C2=B1 34%  perf-profile.self.cycl=
es-pp.__close
> > >       0.08 =C2=B1 27%      +0.0        0.10 =C2=B1 19%      +0.0     =
   0.09 =C2=B1 18%      +0.0        0.09 =C2=B1  8%  perf-profile.self.cycl=
es-pp.make_vfsuid
> > >       0.65 =C2=B1 25%      +0.0        0.66 =C2=B1  6%      +0.0     =
   0.67 =C2=B1 17%      +0.0        0.67 =C2=B1 14%  perf-profile.self.cycl=
es-pp.__slab_free
> > >       0.01 =C2=B1200%      +0.0        0.03 =C2=B1101%      +0.0     =
   0.02 =C2=B1142%      +0.0        0.02 =C2=B1123%  perf-profile.self.cycl=
es-pp.strextend_with_separator
> > >       0.00            +0.0        0.02 =C2=B1142%      +0.0        0.=
00            +0.0        0.03 =C2=B1 82%  perf-profile.self.cycles-pp.cgro=
up_rstat_updated
> > >       0.00            +0.0        0.02 =C2=B1142%      +0.0        0.=
01 =C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.comm=
it_tree
> > >       0.00            +0.0        0.02 =C2=B1142%      +0.0        0.=
02 =C2=B1142%      +0.0        0.02 =C2=B1123%  perf-profile.self.cycles-pp=
.update_rq_clock
> > >       0.01 =C2=B1200%      +0.0        0.03 =C2=B1100%      +0.0     =
   0.04 =C2=B1 72%      +0.0        0.03 =C2=B1 82%  perf-profile.self.cycl=
es-pp.rcu_exp_wait_wake
> > >       0.02 =C2=B1122%      +0.0        0.04 =C2=B1 75%      +0.0     =
   0.04 =C2=B1 44%      +0.0        0.06 =C2=B1 54%  perf-profile.self.cycl=
es-pp.strscpy
> > >       0.14 =C2=B1 17%      +0.0        0.16 =C2=B1 10%      +0.0     =
   0.16 =C2=B1 17%      +0.0        0.15 =C2=B1 18%  perf-profile.self.cycl=
es-pp.enqueue_task_fair
> > >       0.06 =C2=B1 59%      +0.0        0.08 =C2=B1 44%      -0.0     =
   0.06 =C2=B1 46%      -0.0        0.05 =C2=B1 51%  perf-profile.self.cycl=
es-pp.path_hash_func
> > >       0.45 =C2=B1 32%      +0.0        0.47 =C2=B1 15%      +0.0     =
   0.50 =C2=B1 18%      +0.0        0.47 =C2=B1 15%  perf-profile.self.cycl=
es-pp.rwsem_optimistic_spin
> > >       0.08 =C2=B1 30%      +0.0        0.10 =C2=B1 25%      +0.0     =
   0.10 =C2=B1 18%      +0.0        0.10 =C2=B1 22%  perf-profile.self.cycl=
es-pp.string_hash_func
> > >       0.01 =C2=B1200%      +0.0        0.03 =C2=B1101%      +0.0     =
   0.03 =C2=B1100%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.apparmor_file_open
> > >       0.00            +0.0        0.02 =C2=B1144%      +0.0        0.=
01 =C2=B1223%      +0.0        0.03 =C2=B1127%  perf-profile.self.cycles-pp=
.__do_sys_newlstat
> > >       0.08 =C2=B1 52%      +0.0        0.10 =C2=B1 18%      +0.0     =
   0.12 =C2=B1 13%      +0.0        0.12 =C2=B1 21%  perf-profile.self.cycl=
es-pp.ida_alloc_range
> > >       0.10 =C2=B1 21%      +0.0        0.12 =C2=B1 19%      +0.0     =
   0.10 =C2=B1 18%      +0.0        0.11 =C2=B1 10%  perf-profile.self.cycl=
es-pp.down_write
> > >       0.00            +0.0        0.02 =C2=B1146%      +0.0        0.=
02 =C2=B1141%      +0.0        0.02 =C2=B1122%  perf-profile.self.cycles-pp=
.rmqueue
> > >       0.02 =C2=B1200%      +0.0        0.04 =C2=B1 72%      +0.0     =
   0.03 =C2=B1100%      +0.0        0.04 =C2=B1 87%  perf-profile.self.cycl=
es-pp.security_inode_getattr
> > >       0.16 =C2=B1 28%      +0.0        0.18 =C2=B1 10%      +0.0     =
   0.18 =C2=B1 12%      +0.0        0.17 =C2=B1 10%  perf-profile.self.cycl=
es-pp._find_next_zero_bit
> > >       0.04 =C2=B1 50%      +0.0        0.06 =C2=B1 17%      +0.0     =
   0.07 =C2=B1 10%      +0.0        0.06 =C2=B1  7%  perf-profile.self.cycl=
es-pp.path_startswith
> > >       0.56 =C2=B1 17%      +0.0        0.58 =C2=B1  5%      +0.0     =
   0.59 =C2=B1  6%      +0.0        0.58 =C2=B1  4%  perf-profile.self.cycl=
es-pp.link_path_walk
> > >       0.45 =C2=B1 26%      +0.0        0.47 =C2=B1  9%      +0.0     =
   0.48 =C2=B1 13%      -0.0        0.44 =C2=B1  6%  perf-profile.self.cycl=
es-pp.path_compare
> > >       0.14 =C2=B1 25%      +0.0        0.16 =C2=B1 14%      +0.0     =
   0.16 =C2=B1 26%      +0.0        0.15 =C2=B1 21%  perf-profile.self.cycl=
es-pp.mntput_no_expire
> > >       0.10 =C2=B1 37%      +0.0        0.13 =C2=B1 32%      +0.0     =
   0.13 =C2=B1  9%      +0.0        0.13 =C2=B1 19%  perf-profile.self.cycl=
es-pp.alloc_vfsmnt
> > >       0.07 =C2=B1 55%      +0.0        0.10 =C2=B1 23%      +0.0     =
   0.09 =C2=B1  9%      +0.0        0.09 =C2=B1 23%  perf-profile.self.cycl=
es-pp.apparmor_file_free_security
> > >       0.04 =C2=B1 85%      +0.0        0.06 =C2=B1 32%      +0.0     =
   0.07 =C2=B1 21%      +0.0        0.06 =C2=B1 53%  perf-profile.self.cycl=
es-pp.free@plt
> > >       0.00            +0.0        0.02 =C2=B1 99%      +0.0        0.=
01 =C2=B1223%      +0.0        0.00        perf-profile.self.cycles-pp.allo=
c_fs_context
> > >       0.00            +0.0        0.02 =C2=B1 99%      +0.0        0.=
02 =C2=B1143%      +0.0        0.00        perf-profile.self.cycles-pp.strn=
len_user
> > >       0.16 =C2=B1 22%      +0.0        0.18 =C2=B1 15%      +0.0     =
   0.18 =C2=B1 10%      +0.0        0.17 =C2=B1  8%  perf-profile.self.cycl=
es-pp.down_read
> > >       0.03 =C2=B1 84%      +0.0        0.06 =C2=B1 13%      +0.0     =
   0.04 =C2=B1 45%      +0.0        0.04 =C2=B1 50%  perf-profile.self.cycl=
es-pp._atomic_dec_and_lock
> > >       0.29 =C2=B1 29%      +0.0        0.32 =C2=B1 12%      +0.0     =
   0.34 =C2=B1 10%      +0.1        0.36 =C2=B1 13%  perf-profile.self.cycl=
es-pp.__sync_rcu_exp_select_node_cpus
> > >       0.10 =C2=B1 17%      +0.0        0.13 =C2=B1 10%      +0.0     =
   0.11 =C2=B1 15%      +0.0        0.11 =C2=B1 15%  perf-profile.self.cycl=
es-pp.memcpy_orig
> > >       0.27 =C2=B1 32%      +0.0        0.30 =C2=B1 11%      +0.0     =
   0.28 =C2=B1  9%      +0.0        0.29 =C2=B1  7%  perf-profile.self.cycl=
es-pp.__check_heap_object
> > >       0.04 =C2=B1 85%      +0.0        0.06 =C2=B1 14%      +0.0     =
   0.07 =C2=B1 14%      +0.0        0.07 =C2=B1 34%  perf-profile.self.cycl=
es-pp.strlen@plt
> > >       0.07 =C2=B1 86%      +0.0        0.09 =C2=B1 23%      +0.0     =
   0.08 =C2=B1 23%      +0.0        0.07 =C2=B1 18%  perf-profile.self.cycl=
es-pp.umount2
> > >       0.04 =C2=B1 83%      +0.0        0.06 =C2=B1 25%      +0.0     =
   0.08 =C2=B1 15%      +0.0        0.07 =C2=B1 12%  perf-profile.self.cycl=
es-pp.pcpu_next_fit_region
> > >       0.13 =C2=B1 27%      +0.0        0.15 =C2=B1  9%      +0.0     =
   0.13 =C2=B1 18%      +0.0        0.18 =C2=B1 14%  perf-profile.self.cycl=
es-pp.kfree
> > >       0.34 =C2=B1 14%      +0.0        0.37 =C2=B1  8%      +0.0     =
   0.36 =C2=B1 16%      +0.0        0.38 =C2=B1 11%  perf-profile.self.cycl=
es-pp.entry_SYSRETQ_unsafe_stack
> > >       0.17 =C2=B1 33%      +0.0        0.20 =C2=B1 29%      +0.0     =
   0.18 =C2=B1 16%      +0.0        0.19 =C2=B1  5%  perf-profile.self.cycl=
es-pp.__virt_addr_valid
> > >       0.17 =C2=B1 36%      +0.0        0.20 =C2=B1  9%      -0.0     =
   0.16 =C2=B1 22%      +0.0        0.17 =C2=B1 10%  perf-profile.self.cycl=
es-pp.strchr@plt
> > >       0.07 =C2=B1 25%      +0.0        0.10 =C2=B1 13%      +0.0     =
   0.11 =C2=B1 35%      +0.0        0.11 =C2=B1 13%  perf-profile.self.cycl=
es-pp._raw_spin_trylock
> > >       0.15 =C2=B1 34%      +0.0        0.18 =C2=B1 11%      +0.0     =
   0.17 =C2=B1 17%      +0.0        0.19 =C2=B1 11%  perf-profile.self.cycl=
es-pp.lockref_get_not_dead
> > >       0.01 =C2=B1200%      +0.0        0.04 =C2=B1 73%      +0.0     =
   0.02 =C2=B1141%      +0.0        0.01 =C2=B1200%  perf-profile.self.cycl=
es-pp.prepare_task_switch
> > >       0.01 =C2=B1200%      +0.0        0.04 =C2=B1 75%      +0.0     =
   0.04 =C2=B1 71%      +0.0        0.02 =C2=B1122%  perf-profile.self.cycl=
es-pp.strlcpy
> > >       0.09 =C2=B1 79%      +0.0        0.12 =C2=B1 16%      +0.0     =
   0.10 =C2=B1 14%      +0.0        0.10 =C2=B1 26%  perf-profile.self.cycl=
es-pp.strlcat
> > >       0.07 =C2=B1 57%      +0.0        0.10 =C2=B1 18%      +0.0     =
   0.11 =C2=B1 19%      +0.0        0.10 =C2=B1 26%  perf-profile.self.cycl=
es-pp.__list_add_valid
> > >       0.11 =C2=B1 54%      +0.0        0.14 =C2=B1 25%      +0.0     =
   0.14 =C2=B1 23%      +0.0        0.15 =C2=B1 16%  perf-profile.self.cycl=
es-pp.process_one_work
> > >       0.04 =C2=B1 85%      +0.0        0.07 =C2=B1 14%      +0.0     =
   0.06 =C2=B1 46%      +0.0        0.07 =C2=B1 56%  perf-profile.self.cycl=
es-pp.memcpy@plt
> > >       0.08 =C2=B1 25%      +0.0        0.12 =C2=B1 22%      +0.0     =
   0.10 =C2=B1 23%      +0.0        0.11 =C2=B1 24%  perf-profile.self.cycl=
es-pp.__strdup
> > >       0.13 =C2=B1 27%      +0.0        0.16 =C2=B1 15%      +0.0     =
   0.15 =C2=B1 21%      +0.0        0.14 =C2=B1 23%  perf-profile.self.cycl=
es-pp.device_read_uevent_file
> > >       0.03 =C2=B1127%      +0.0        0.06 =C2=B1 17%      +0.0     =
   0.04 =C2=B1 77%      +0.0        0.04 =C2=B1 50%  perf-profile.self.cycl=
es-pp.kernfs_get_target_path
> > >       0.40 =C2=B1 33%      +0.0        0.44 =C2=B1 11%      +0.0     =
   0.44 =C2=B1 19%      -0.0        0.39 =C2=B1 17%  perf-profile.self.cycl=
es-pp.siphash24_finalize
> > >       0.03 =C2=B1122%      +0.0        0.06 =C2=B1 17%      +0.1     =
   0.09 =C2=B1 21%      +0.1        0.08 =C2=B1 24%  perf-profile.self.cycl=
es-pp.dequeue_task_fair
> > >       0.31 =C2=B1 22%      +0.0        0.34 =C2=B1  6%      +0.0     =
   0.31 =C2=B1 21%      -0.0        0.30 =C2=B1  9%  perf-profile.self.cycl=
es-pp.cfree
> > >       0.02 =C2=B1200%      +0.0        0.05 =C2=B1 50%      +0.0     =
   0.06 =C2=B1 54%      +0.0        0.06 =C2=B1  8%  perf-profile.self.cycl=
es-pp.chase_symlinks
> > >       0.02 =C2=B1122%      +0.0        0.06 =C2=B1 21%      +0.0     =
   0.05 =C2=B1 47%      +0.0        0.05 =C2=B1 53%  perf-profile.self.cycl=
es-pp.percpu_counter_add_batch
> > >       0.65 =C2=B1 27%      +0.0        0.68 =C2=B1 16%      -0.0     =
   0.64 =C2=B1 16%      +0.1        0.71 =C2=B1 10%  perf-profile.self.cycl=
es-pp.stress_mwc32
> > >       0.05 =C2=B1 82%      +0.0        0.09 =C2=B1 15%      +0.0     =
   0.08 =C2=B1 17%      +0.1        0.10 =C2=B1 27%  perf-profile.self.cycl=
es-pp.mutex_lock_killable
> > >       0.03 =C2=B1124%      +0.0        0.07 =C2=B1 48%      +0.0     =
   0.05 =C2=B1 77%      +0.0        0.06 =C2=B1 14%  perf-profile.self.cycl=
es-pp.file_free_rcu
> > >       0.03 =C2=B1 81%      +0.0        0.07 =C2=B1 20%      +0.0     =
   0.08 =C2=B1 49%      +0.1        0.08 =C2=B1 24%  perf-profile.self.cycl=
es-pp.delayed_free_vfsmnt
> > >       1.34 =C2=B1 18%      +0.0        1.38 =C2=B1  6%      +0.1     =
   1.47 =C2=B1  6%      +0.1        1.43 =C2=B1  8%  perf-profile.self.cycl=
es-pp._raw_spin_lock
> > >       0.30 =C2=B1 32%      +0.0        0.35 =C2=B1  7%      +0.0     =
   0.34 =C2=B1  6%      +0.1        0.36 =C2=B1  4%  perf-profile.self.cycl=
es-pp.__kmem_cache_alloc_node
> > >       0.07 =C2=B1 23%      +0.0        0.12 =C2=B1 39%      +0.0     =
   0.10 =C2=B1 41%      +0.0        0.10 =C2=B1 32%  perf-profile.self.cycl=
es-pp.native_queued_spin_lock_slowpath
> > >       0.19 =C2=B1 30%      +0.0        0.24 =C2=B1 20%      +0.0     =
   0.19 =C2=B1 22%      +0.0        0.19 =C2=B1  8%  perf-profile.self.cycl=
es-pp.device_add_property_aux
> > >       0.09 =C2=B1 60%      +0.0        0.14 =C2=B1 16%      +0.1     =
   0.15 =C2=B1 19%      +0.1        0.14 =C2=B1 14%  perf-profile.self.cycl=
es-pp.___slab_alloc
> > >       0.17 =C2=B1 29%      +0.1        0.22 =C2=B1 19%      +0.0     =
   0.19 =C2=B1 20%      +0.0        0.18 =C2=B1 14%  perf-profile.self.cycl=
es-pp.__legitimize_mnt
> > >       0.00            +0.1        0.05 =C2=B1 50%      +0.1        0.=
07 =C2=B1 15%      +0.1        0.06 =C2=B1 53%  perf-profile.self.cycles-pp=
.init_timer_key
> > >       0.27 =C2=B1 22%      +0.1        0.32 =C2=B1  9%      +0.0     =
   0.30 =C2=B1  8%      +0.1        0.32 =C2=B1 10%  perf-profile.self.cycl=
es-pp.step_into
> > >       0.24 =C2=B1 21%      +0.1        0.30 =C2=B1 15%      +0.0     =
   0.25 =C2=B1 21%      +0.0        0.27 =C2=B1  9%  perf-profile.self.cycl=
es-pp.format_decode
> > >       0.00            +0.1        0.06 =C2=B1 49%      +0.1        0.=
09 =C2=B1 21%      +0.1        0.09 =C2=B1 11%  perf-profile.self.cycles-pp=
.rmqueue_bulk
> > >       0.26 =C2=B1 10%      +0.1        0.33 =C2=B1 23%      +0.1     =
   0.33 =C2=B1 21%      +0.1        0.31 =C2=B1 11%  perf-profile.self.cycl=
es-pp.__schedule
> > >       0.18 =C2=B1 24%      +0.1        0.26 =C2=B1  9%      +0.1     =
   0.25 =C2=B1 25%      +0.1        0.26 =C2=B1 16%  perf-profile.self.cycl=
es-pp.__d_lookup
> > >       0.91 =C2=B1 22%      +0.1        0.99 =C2=B1 15%      +0.1     =
   1.05 =C2=B1  5%      +0.2        1.08 =C2=B1 12%  perf-profile.self.cycl=
es-pp.strncpy_from_user
> > >       0.00            +0.1        0.08 =C2=B1 16%      +0.1        0.=
08 =C2=B1 52%      +0.1        0.07 =C2=B1 20%  perf-profile.self.cycles-pp=
.pcpu_next_md_free_region
> > >       1.18 =C2=B1 28%      +0.1        1.26 =C2=B1 13%      +0.2     =
   1.35 =C2=B1  9%      +0.2        1.41 =C2=B1  6%  perf-profile.self.cycl=
es-pp._find_next_bit
> > >       1.03 =C2=B1 22%      +0.1        1.11 =C2=B1 13%      +0.1     =
   1.09 =C2=B1 10%      +0.2        1.18 =C2=B1  9%  perf-profile.self.cycl=
es-pp._raw_spin_lock_irqsave
> > >       0.15 =C2=B1 23%      +0.1        0.23 =C2=B1 14%      +0.1     =
   0.23 =C2=B1 18%      +0.1        0.23 =C2=B1  7%  perf-profile.self.cycl=
es-pp.rcu_cblist_dequeue
> > >       1.24 =C2=B1 32%      +0.1        1.33 =C2=B1  8%      +0.0     =
   1.25 =C2=B1 13%      +0.0        1.26 =C2=B1 12%  perf-profile.self.cycl=
es-pp.malloc
> > >       0.39 =C2=B1 31%      +0.1        0.49 =C2=B1 24%      +0.1     =
   0.47 =C2=B1 20%      +0.2        0.55 =C2=B1 32%  perf-profile.self.cycl=
es-pp.intel_idle_irq
> > >       2.44 =C2=B1 28%      +0.1        2.55 =C2=B1 11%      +0.2     =
   2.63 =C2=B1 13%      +0.3        2.78 =C2=B1 10%  perf-profile.self.cycl=
es-pp.stress_rndstr
> > >       0.21 =C2=B1 18%      +0.2        0.36 =C2=B1 48%      +0.1     =
   0.28 =C2=B1 84%      +0.1        0.27 =C2=B1 62%  perf-profile.self.cycl=
es-pp.poll_idle
> > >       0.00            +0.2        0.16 =C2=B1 14%      +0.2        0.=
20 =C2=B1 20%      +0.2        0.19 =C2=B1 13%  perf-profile.self.cycles-pp=
.rcu_segcblist_init
> > >       0.00            +0.3        0.25 =C2=B1 13%      +0.2        0.=
25 =C2=B1 19%      +0.2        0.23 =C2=B1 12%  perf-profile.self.cycles-pp=
.init_srcu_struct_fields
> > >       1.16 =C2=B1 22%      +0.9        2.05 =C2=B1 13%      +0.9     =
   2.04 =C2=B1  9%      +0.9        2.06 =C2=B1  9%  perf-profile.self.cycl=
es-pp.memset_orig
> > >       0.57 =C2=B1 27%      +1.3        1.86 =C2=B1 28%      +1.8     =
   2.39 =C2=B1 15%      +2.1        2.70 =C2=B1  6%  perf-profile.self.cycl=
es-pp.pcpu_alloc
> > >       0.02 =C2=B1125%      +1.5        1.49 =C2=B1 45%      +2.1     =
   2.08 =C2=B1 21%      +2.3        2.37 =C2=B1  5%  perf-profile.self.cycl=
es-pp.pcpu_find_block_fit
> > >
> > >
> > >
> > > >
> > > > Thanks!
> > > > Amir.
> > > >
> > > > > testcase: stress-ng
> > > > > test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE C=
PU @ 3.00GHz (Cascade Lake) with 128G memory
> > > > > parameters:
> > > > >
> > > > >         nr_threads: 1
> > > > >         disk: 1HDD
> > > > >         testtime: 60s
> > > > >         fs: ext4
> > > > >         class: os
> > > > >         test: ramfs
> > > > >         cpufreq_governor: performance
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-lkp/202306192245.d77d7216-ol=
iver.sang@intel.com
> > > > >
> > > > >
> > > > > Details are as below:
> > > > > -----------------------------------------------------------------=
--------------------------------->
> > > > >
> > > > >
> > > > > To reproduce:
> > > > >
> > > > >         git clone https://github.com/intel/lkp-tests.git
> > > > >         cd lkp-tests
> > > > >         sudo bin/lkp install job.yaml           # job file is att=
ached in this email
> > > > >         bin/lkp split-job --compatible job.yaml # generate the ya=
ml file for lkp run
> > > > >         sudo bin/lkp run generated-yaml-file
> > > > >
> > > > >         # if come across any failure that blocks the test,
> > > > >         # please remove ~/.lkp and /lkp dir to run from a clean s=
tate.
> > > > >
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs=
/tbox_group/test/testcase/testtime:
> > > > >   os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x=
86_64-20220510.cgz/lkp-csl-d02/ramfs/stress-ng/60s
> > > > >
> > > > > commit:
> > > > >   1af0557e94 ("fanotify: report file range info with FAN_ACCESSS_=
PERM")
> > > > >   e796a59711 ("vfs: implement 'vfs write barriers'")
> > > > >
> > > > > 1af0557e94fc3d07 e796a59711433d5400947b2dbfa
> > > > > ---------------- ---------------------------
> > > > >          %stddev     %change         %stddev
> > > > >              \          |                \
> > > > >       0.14 =C4=85  4%      -0.0        0.13 =C4=85  5%  mpstat.cp=
u.all.soft%
> > > > >     144866 =C4=85  5%     -17.1%     120041 =C4=85  5%  turbostat=
.C1
> > > > >      10.15           +15.2%      11.70        turbostat.RAMWatt
> > > > >     187740 =C4=85  2%     -10.7%     167653 =C4=85  2%  vmstat.sy=
stem.cs
> > > > >      82600            -5.3%      78240        vmstat.system.in
> > > > >    1371303           -13.0%    1193418 =C4=85  2%  stress-ng.ramf=
s.ops
> > > > >      22854           -13.0%      19890 =C4=85  2%  stress-ng.ramf=
s.ops_per_sec
> > > > >    2747427           -11.6%    2429872 =C4=85  2%  stress-ng.time=
.involuntary_context_switches
> > > > >    3637751          +234.9%   12182075        meminfo.Memused
> > > > >      17971        +48231.5%    8685746        meminfo.Percpu
> > > > >      90936          +318.7%     380776        meminfo.SUnreclaim
> > > > >      38661 =C4=85  9%     -15.1%      32830        meminfo.Shmem
> > > > >     185820          +155.8%     475366        meminfo.Slab
> > > > >      20482         +2199.2%     470939        meminfo.VmallocUsed
> > > > >    4118313          +196.0%   12189340        meminfo.max_used_kB
> > > > >    3173298            -6.7%    2960000        proc-vmstat.nr_dirt=
y_background_threshold
> > > > >    6354356            -6.7%    5927238        proc-vmstat.nr_dirt=
y_threshold
> > > > >   31991368            -6.7%   29855261        proc-vmstat.nr_free=
_pages
> > > > >      84482            -1.8%      82927        proc-vmstat.nr_inac=
tive_anon
> > > > >       9666 =C4=85  9%     -15.1%       8208        proc-vmstat.nr=
_shmem
> > > > >      22729          +318.8%      95193        proc-vmstat.nr_slab=
_unreclaimable
> > > > >      84482            -1.8%      82927        proc-vmstat.nr_zone=
_inactive_anon
> > > > >    1201688          +345.6%    5354530 =C4=85  2%  proc-vmstat.nu=
ma_hit
> > > > >    1197711          +347.0%    5353325 =C4=85  2%  proc-vmstat.nu=
ma_local
> > > > >     117966            -5.9%     110951        proc-vmstat.pgactiv=
ate
> > > > >    1887107 =C4=85  2%    +211.6%    5880960 =C4=85  2%  proc-vmst=
at.pgalloc_normal
> > > > >    1867687 =C4=85  2%     -23.1%    1435439 =C4=85  4%  proc-vmst=
at.pgfree
> > > > >       3.47 =C4=85  2%     +13.1%       3.92        perf-stat.i.MP=
KI
> > > > >    2.7e+09            -1.4%  2.661e+09        perf-stat.i.branch-=
instructions
> > > > >       2.94 =C4=85  2%      +9.7       12.62 =C4=85  2%  perf-stat=
.i.cache-miss-rate%
> > > > >    1385785 =C4=85  2%    +377.9%    6622542        perf-stat.i.ca=
che-misses
> > > > >   45772191           +14.2%   52251891        perf-stat.i.cache-r=
eferences
> > > > >     196041 =C4=85  2%     -10.7%     174973 =C4=85  2%  perf-stat=
.i.context-switches
> > > > >     781.05 =C4=85  2%      -8.0%     718.25 =C4=85  3%  perf-stat=
.i.cpu-migrations
> > > > >      26083 =C4=85 14%     -94.4%       1461        perf-stat.i.cy=
cles-between-cache-misses
> > > > >     162575 =C4=85  7%     +30.9%     212809 =C4=85  3%  perf-stat=
.i.dTLB-load-misses
> > > > >       0.01 =C4=85  4%      +0.0        0.01 =C4=85  3%  perf-stat=
.i.dTLB-store-miss-rate%
> > > > >     102941 =C4=85  3%    +119.0%     225459 =C4=85  2%  perf-stat=
.i.dTLB-store-misses
> > > > >  1.719e+09            +4.1%   1.79e+09        perf-stat.i.dTLB-st=
ores
> > > > >      64.33            -1.6       62.68        perf-stat.i.iTLB-lo=
ad-miss-rate%
> > > > >    3323983 =C4=85  3%      -7.4%    3079335 =C4=85  2%  perf-stat=
.i.iTLB-load-misses
> > > > >       4052 =C4=85  2%      +8.0%       4375 =C4=85  2%  perf-stat=
.i.instructions-per-iTLB-miss
> > > > >       0.07 =C4=85 48%    +306.5%       0.27 =C4=85 23%  perf-stat=
.i.major-faults
> > > > >      91.27 =C4=85  3%     +85.0%     168.88 =C4=85  7%  perf-stat=
.i.metric.K/sec
> > > > >     167705 =C4=85  5%     +83.6%     307965 =C4=85  3%  perf-stat=
.i.node-loads
> > > > >     294581 =C4=85  8%    +866.8%    2848095 =C4=85 12%  perf-stat=
.i.node-stores
> > > > >       3.45           +14.3%       3.95        perf-stat.overall.M=
PKI
> > > > >       3.03 =C4=85  3%      +9.7       12.68 =C4=85  2%  perf-stat=
.overall.cache-miss-rate%
> > > > >       6505 =C4=85  3%     -79.1%       1359        perf-stat.over=
all.cycles-between-cache-misses
> > > > >       0.01 =C4=85  8%      +0.0        0.01 =C4=85  3%  perf-stat=
.overall.dTLB-load-miss-rate%
> > > > >       0.01 =C4=85  3%      +0.0        0.01 =C4=85  3%  perf-stat=
.overall.dTLB-store-miss-rate%
> > > > >      64.58            -1.7       62.93        perf-stat.overall.i=
TLB-load-miss-rate%
> > > > >       3994 =C4=85  3%      +7.7%       4301 =C4=85  2%  perf-stat=
.overall.instructions-per-iTLB-miss
> > > > >  2.657e+09            -1.4%  2.619e+09        perf-stat.ps.branch=
-instructions
> > > > >    1364289 =C4=85  2%    +377.7%    6517813        perf-stat.ps.c=
ache-misses
> > > > >   45049468           +14.1%   51423471        perf-stat.ps.cache-=
references
> > > > >     192941 =C4=85  2%     -10.8%     172197 =C4=85  2%  perf-stat=
.ps.context-switches
> > > > >     768.70 =C4=85  2%      -8.0%     706.85 =C4=85  3%  perf-stat=
.ps.cpu-migrations
> > > > >     160021 =C4=85  7%     +30.9%     209447 =C4=85  3%  perf-stat=
.ps.dTLB-load-misses
> > > > >     101316 =C4=85  3%    +119.0%     221881 =C4=85  2%  perf-stat=
.ps.dTLB-store-misses
> > > > >  1.692e+09            +4.1%  1.761e+09        perf-stat.ps.dTLB-s=
tores
> > > > >    3271471 =C4=85  3%      -7.4%    3030527 =C4=85  2%  perf-stat=
.ps.iTLB-load-misses
> > > > >       0.07 =C4=85 48%    +306.3%       0.27 =C4=85 23%  perf-stat=
.ps.major-faults
> > > > >     165092 =C4=85  5%     +83.6%     303115 =C4=85  3%  perf-stat=
.ps.node-loads
> > > > >     290015 =C4=85  8%    +866.5%    2802974 =C4=85 12%  perf-stat=
.ps.node-stores
> > > > >      10.46 =C4=85  7%      -1.9        8.54 =C4=85 16%  perf-prof=
ile.calltrace.cycles-pp.umount2
> > > > >      10.08 =C4=85  7%      -1.8        8.23 =C4=85 16%  perf-prof=
ile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.umount2
> > > > >      10.03 =C4=85  7%      -1.8        8.19 =C4=85 16%  perf-prof=
ile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount=
2
> > > > >       6.16 =C4=85  8%      -1.1        5.06 =C4=85 17%  perf-prof=
ile.calltrace.cycles-pp.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe.umount2
> > > > >       4.23 =C4=85  7%      -0.8        3.46 =C4=85 17%  perf-prof=
ile.calltrace.cycles-pp.path_umount.__x64_sys_umount.do_syscall_64.entry_SY=
SCALL_64_after_hwframe.umount2
> > > > >       4.74 =C4=85  7%      -0.8        3.98 =C4=85  7%  perf-prof=
ile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.sy=
scall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > > >       3.82 =C4=85  7%      -0.8        3.07 =C4=85 15%  perf-prof=
ile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode=
.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> > > > >       3.84 =C4=85  7%      -0.7        3.09 =C4=85 15%  perf-prof=
ile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe.umount2
> > > > >       4.62 =C4=85  7%      -0.7        3.88 =C4=85  8%  perf-prof=
ile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_m=
ode_prepare.syscall_exit_to_user_mode.do_syscall_64
> > > > >       3.80 =C4=85  7%      -0.7        3.14 =C4=85 16%  perf-prof=
ile.calltrace.cycles-pp.do_umount.path_umount.__x64_sys_umount.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
> > > > >       3.07 =C4=85  6%      -0.6        2.45 =C4=85 14%  perf-prof=
ile.calltrace.cycles-pp.attach_recursive_mnt.do_new_mount.__x64_sys_mount.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe
> > > > >       2.64 =C4=85  6%      -0.5        2.10 =C4=85 13%  perf-prof=
ile.calltrace.cycles-pp.propagate_mnt.attach_recursive_mnt.do_new_mount.__x=
64_sys_mount.do_syscall_64
> > > > >       2.53 =C4=85  6%      -0.5        2.02 =C4=85 13%  perf-prof=
ile.calltrace.cycles-pp.propagate_one.propagate_mnt.attach_recursive_mnt.do=
_new_mount.__x64_sys_mount
> > > > >       2.83 =C4=85  7%      -0.5        2.32 =C4=85 12%  perf-prof=
ile.calltrace.cycles-pp.stress_rndstr
> > > > >       2.48 =C4=85  7%      -0.5        1.96 =C4=85 12%  perf-prof=
ile.calltrace.cycles-pp.copy_tree.propagate_one.propagate_mnt.attach_recurs=
ive_mnt.do_new_mount
> > > > >       2.44 =C4=85  7%      -0.5        1.94 =C4=85 13%  perf-prof=
ile.calltrace.cycles-pp.clone_mnt.copy_tree.propagate_one.propagate_mnt.att=
ach_recursive_mnt
> > > > >       2.39 =C4=85  8%      -0.5        1.91 =C4=85 16%  perf-prof=
ile.calltrace.cycles-pp.deactivate_locked_super.cleanup_mnt.task_work_run.e=
xit_to_user_mode_loop.exit_to_user_mode_prepare
> > > > >       2.11 =C4=85  7%      -0.4        1.68 =C4=85 12%  perf-prof=
ile.calltrace.cycles-pp.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one.prop=
agate_mnt
> > > > >       1.31 =C4=85  9%      -0.4        0.88 =C4=85 16%  perf-prof=
ile.calltrace.cycles-pp.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_sup=
er.vfs_get_tree
> > > > >       1.85 =C4=85  8%      -0.4        1.46 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.unlink
> > > > >       1.20 =C4=85  9%      -0.4        0.81 =C4=85 16%  perf-prof=
ile.calltrace.cycles-pp.pcpu_alloc.__percpu_init_rwsem.alloc_super.sget_fc.=
vfs_get_super
> > > > >       1.77 =C4=85  9%      -0.4        1.39 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
> > > > >       1.77 =C4=85  8%      -0.4        1.40 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
> > > > >       1.74 =C4=85  9%      -0.4        1.38 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe.unlink
> > > > >       1.40 =C4=85  9%      -0.3        1.05 =C4=85 15%  perf-prof=
ile.calltrace.cycles-pp.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree.propaga=
te_one
> > > > >       1.59 =C4=85  8%      -0.3        1.26 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SY=
SCALL_64_after_hwframe.unlink
> > > > >       0.66 =C4=85 12%      -0.3        0.37 =C4=85 70%  perf-prof=
ile.calltrace.cycles-pp.vfs_create_mount.do_new_mount.__x64_sys_mount.do_sy=
scall_64.entry_SYSCALL_64_after_hwframe
> > > > >       0.86 =C4=85 12%      -0.3        0.58 =C4=85 46%  perf-prof=
ile.calltrace.cycles-pp.srcu_advance_state.process_srcu.process_one_work.wo=
rker_thread.kthread
> > > > >       0.87 =C4=85  9%      -0.3        0.60 =C4=85 46%  perf-prof=
ile.calltrace.cycles-pp.unregister_shrinker.deactivate_locked_super.cleanup=
_mnt.task_work_run.exit_to_user_mode_loop
> > > > >       0.83 =C4=85  6%      -0.2        0.58 =C4=85 45%  perf-prof=
ile.calltrace.cycles-pp.shmem_fill_super.vfs_get_super.vfs_get_tree.do_new_=
mount.__x64_sys_mount
> > > > >       0.78 =C4=85 12%      -0.2        0.54 =C4=85 45%  perf-prof=
ile.calltrace.cycles-pp.try_check_zero.srcu_advance_state.process_srcu.proc=
ess_one_work.worker_thread
> > > > >       0.75 =C4=85  7%      -0.2        0.51 =C4=85 45%  perf-prof=
ile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_o=
pen.do_sys_openat2
> > > > >       1.07 =C4=85  7%      -0.2        0.84 =C4=85 17%  perf-prof=
ile.calltrace.cycles-pp.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_on=
e_work.worker_thread.kthread
> > > > >       0.59 =C4=85  2%      -0.2        0.36 =C4=85 70%  perf-prof=
ile.calltrace.cycles-pp.__sync_rcu_exp_select_node_cpus.process_one_work.wo=
rker_thread.kthread.ret_from_fork
> > > > >       1.08 =C4=85  6%      -0.2        0.85 =C4=85 17%  perf-prof=
ile.calltrace.cycles-pp.wait_rcu_exp_gp.process_one_work.worker_thread.kthr=
ead.ret_from_fork
> > > > >       1.03 =C4=85 11%      -0.2        0.80 =C4=85 16%  perf-prof=
ile.calltrace.cycles-pp.strncpy_from_user.getname_flags.user_path_at_empty.=
__x64_sys_umount.do_syscall_64
> > > > >       0.73 =C4=85  4%      -0.2        0.52 =C4=85 46%  perf-prof=
ile.calltrace.cycles-pp.mnt_get_count.mntput_no_expire.namespace_unlock.do_=
umount.path_umount
> > > > >       0.69 =C4=85  7%      -0.2        0.49 =C4=85 44%  perf-prof=
ile.calltrace.cycles-pp.do_rmdir.__x64_sys_rmdir.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe.rmdir
> > > > >       1.03 =C4=85  3%      -0.2        0.84 =C4=85 16%  perf-prof=
ile.calltrace.cycles-pp.mntput_no_expire.namespace_unlock.do_umount.path_um=
ount.__x64_sys_umount
> > > > >       0.92 =C4=85  7%      -0.2        0.75 =C4=85  9%  perf-prof=
ile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_o=
penat2.__x64_sys_openat
> > > > >       1.09            -0.2        0.92 =C4=85  6%  perf-profile.c=
alltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
> > > > >       1.10            -0.2        0.94 =C4=85  5%  perf-profile.c=
alltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__lxstat64
> > > > >       1.19            -0.2        1.04 =C4=85  6%  perf-profile.c=
alltrace.cycles-pp.__lxstat64
> > > > >       0.85 =C4=85 11%      -0.2        0.69 =C4=85  7%  perf-prof=
ile.calltrace.cycles-pp.rmdir
> > > > >       1.06            -0.2        0.90 =C4=85  6%  perf-profile.c=
alltrace.cycles-pp.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.__lxstat64
> > > > >       0.78 =C4=85 10%      -0.1        0.63 =C4=85  6%  perf-prof=
ile.calltrace.cycles-pp.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.rmdir
> > > > >       0.79 =C4=85 11%      -0.1        0.65 =C4=85  5%  perf-prof=
ile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.rmdir
> > > > >       0.79 =C4=85 11%      -0.1        0.65 =C4=85  5%  perf-prof=
ile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
> > > > >       0.94 =C4=85  3%      -0.1        0.80 =C4=85  8%  perf-prof=
ile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_S=
YSCALL_64_after_hwframe.__lxstat64
> > > > >       0.74 =C4=85  3%      -0.1        0.64 =C4=85  7%  perf-prof=
ile.calltrace.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
> > > > >       0.64 =C4=85 12%      +0.1        0.78 =C4=85 14%  perf-prof=
ile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_=
group.load_balance.newidle_balance
> > > > >       1.07 =C4=85 10%      +0.2        1.24 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsle=
ep.__x64_sys_clock_nanosleep
> > > > >       1.06 =C4=85  9%      +0.2        1.24 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.=
common_nsleep
> > > > >       1.18 =C4=85  9%      +0.2        1.37 =C4=85  9%  perf-prof=
ile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_=
sys_clock_nanosleep.do_syscall_64
> > > > >       1.20 =C4=85 10%      +0.2        1.40 =C4=85  9%  perf-prof=
ile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nan=
osleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > > >       1.20 =C4=85 10%      +0.2        1.40 =C4=85  9%  perf-prof=
ile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_=
64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> > > > >       1.24 =C4=85 11%      +0.2        1.45 =C4=85 10%  perf-prof=
ile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe.clock_nanosleep
> > > > >       1.26 =C4=85 11%      +0.2        1.47 =C4=85 10%  perf-prof=
ile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_=
nanosleep
> > > > >       1.27 =C4=85 11%      +0.2        1.48 =C4=85 10%  perf-prof=
ile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> > > > >       1.34 =C4=85 11%      +0.2        1.58 =C4=85  9%  perf-prof=
ile.calltrace.cycles-pp.clock_nanosleep
> > > > >       0.00            +0.8        0.79 =C4=85 20%  perf-profile.c=
alltrace.cycles-pp.memset_orig.pcpu_alloc.init_srcu_struct_fields.alloc_sup=
er.sget_fc
> > > > >       0.00            +1.6        1.61 =C4=85 31%  perf-profile.c=
alltrace.cycles-pp.pcpu_find_block_fit.pcpu_alloc.init_srcu_struct_fields.a=
lloc_super.sget_fc
> > > > >       9.19 =C4=85  7%      +3.2       12.40 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.mount
> > > > >       9.28 =C4=85  7%      +3.2       12.49 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.mount
> > > > >       9.21 =C4=85  7%      +3.2       12.43 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
> > > > >       9.23 =C4=85  7%      +3.2       12.44 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mount
> > > > >       8.33 =C4=85  7%      +3.4       11.70 =C4=85 11%  perf-prof=
ile.calltrace.cycles-pp.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SY=
SCALL_64_after_hwframe.mount
> > > > >       3.18 =C4=85  6%      +4.3        7.52 =C4=85 14%  perf-prof=
ile.calltrace.cycles-pp.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_m=
ount.do_syscall_64
> > > > >       3.19 =C4=85  6%      +4.3        7.54 =C4=85 14%  perf-prof=
ile.calltrace.cycles-pp.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
> > > > >       0.00            +4.5        4.48 =C4=85 22%  perf-profile.c=
alltrace.cycles-pp.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc.v=
fs_get_super
> > > > >       1.87 =C4=85  8%      +4.6        6.48 =C4=85 15%  perf-prof=
ile.calltrace.cycles-pp.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount.__x=
64_sys_mount
> > > > >       1.73 =C4=85  9%      +4.6        6.37 =C4=85 16%  perf-prof=
ile.calltrace.cycles-pp.alloc_super.sget_fc.vfs_get_super.vfs_get_tree.do_n=
ew_mount
> > > > >       0.00            +5.1        5.13 =C4=85 19%  perf-profile.c=
alltrace.cycles-pp.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_supe=
r.vfs_get_tree
> > > > >      10.53 =C4=85  7%      -1.9        8.60 =C4=85 16%  perf-prof=
ile.children.cycles-pp.umount2
> > > > >       6.16 =C4=85  8%      -1.1        5.06 =C4=85 17%  perf-prof=
ile.children.cycles-pp.__x64_sys_umount
> > > > >       4.24 =C4=85  7%      -0.8        3.46 =C4=85 17%  perf-prof=
ile.children.cycles-pp.path_umount
> > > > >       4.77 =C4=85  7%      -0.7        4.09 =C4=85  6%  perf-prof=
ile.children.cycles-pp.task_work_run
> > > > >       3.07 =C4=85  6%      -0.6        2.46 =C4=85 14%  perf-prof=
ile.children.cycles-pp.attach_recursive_mnt
> > > > >       2.71 =C4=85  7%      -0.6        2.13 =C4=85 12%  perf-prof=
ile.children.cycles-pp.alloc_vfsmnt
> > > > >       3.03 =C4=85  7%      -0.5        2.48 =C4=85 12%  perf-prof=
ile.children.cycles-pp.stress_rndstr
> > > > >       2.64 =C4=85  6%      -0.5        2.10 =C4=85 13%  perf-prof=
ile.children.cycles-pp.propagate_mnt
> > > > >       2.54 =C4=85  7%      -0.5        2.02 =C4=85 13%  perf-prof=
ile.children.cycles-pp.propagate_one
> > > > >       2.48 =C4=85  7%      -0.5        1.97 =C4=85 12%  perf-prof=
ile.children.cycles-pp.copy_tree
> > > > >       2.45 =C4=85  7%      -0.5        1.96 =C4=85 12%  perf-prof=
ile.children.cycles-pp.clone_mnt
> > > > >       2.39 =C4=85  8%      -0.5        1.91 =C4=85 16%  perf-prof=
ile.children.cycles-pp.deactivate_locked_super
> > > > >       1.31 =C4=85  9%      -0.4        0.89 =C4=85 16%  perf-prof=
ile.children.cycles-pp.__percpu_init_rwsem
> > > > >       1.86 =C4=85  8%      -0.4        1.47 =C4=85 11%  perf-prof=
ile.children.cycles-pp.unlink
> > > > >       2.50 =C4=85  8%      -0.4        2.12 =C4=85  8%  perf-prof=
ile.children.cycles-pp.getname_flags
> > > > >       1.75 =C4=85  9%      -0.4        1.38 =C4=85 11%  perf-prof=
ile.children.cycles-pp.__x64_sys_unlink
> > > > >       1.76 =C4=85  8%      -0.3        1.41 =C4=85 15%  perf-prof=
ile.children.cycles-pp.mnt_get_count
> > > > >       1.59 =C4=85  8%      -0.3        1.26 =C4=85 11%  perf-prof=
ile.children.cycles-pp.do_unlinkat
> > > > >       1.90 =C4=85  8%      -0.3        1.59 =C4=85  7%  perf-prof=
ile.children.cycles-pp.strncpy_from_user
> > > > >       1.33 =C4=85  8%      -0.3        1.07 =C4=85  3%  perf-prof=
ile.children.cycles-pp._raw_spin_lock_irqsave
> > > > >       1.36 =C4=85  9%      -0.3        1.10 =C4=85 14%  perf-prof=
ile.children.cycles-pp.kmem_cache_alloc_lru
> > > > >       0.89 =C4=85 13%      -0.2        0.64 =C4=85 20%  perf-prof=
ile.children.cycles-pp.__wait_for_common
> > > > >       1.07 =C4=85  7%      -0.2        0.84 =C4=85 17%  perf-prof=
ile.children.cycles-pp.sync_rcu_exp_select_cpus
> > > > >       1.08 =C4=85  6%      -0.2        0.85 =C4=85 17%  perf-prof=
ile.children.cycles-pp.wait_rcu_exp_gp
> > > > >       0.97 =C4=85  5%      -0.2        0.74 =C4=85 13%  perf-prof=
ile.children.cycles-pp.__filename_parentat
> > > > >       0.90 =C4=85  5%      -0.2        0.68 =C4=85 13%  perf-prof=
ile.children.cycles-pp.path_parentat
> > > > >       0.86 =C4=85 11%      -0.2        0.67 =C4=85 15%  perf-prof=
ile.children.cycles-pp.srcu_advance_state
> > > > >       0.82 =C4=85 12%      -0.2        0.64 =C4=85 15%  perf-prof=
ile.children.cycles-pp.try_check_zero
> > > > >       0.93 =C4=85  8%      -0.2        0.74 =C4=85 14%  perf-prof=
ile.children.cycles-pp.slab_pre_alloc_hook
> > > > >       0.67 =C4=85 14%      -0.2        0.49 =C4=85 18%  perf-prof=
ile.children.cycles-pp.schedule_timeout
> > > > >       0.93 =C4=85 10%      -0.2        0.75 =C4=85 17%  perf-prof=
ile.children.cycles-pp.alloc_inode
> > > > >       0.83 =C4=85  6%      -0.2        0.65 =C4=85 17%  perf-prof=
ile.children.cycles-pp.shmem_fill_super
> > > > >       0.93 =C4=85  7%      -0.2        0.76 =C4=85  8%  perf-prof=
ile.children.cycles-pp.open_last_lookups
> > > > >       1.24            -0.2        1.07 =C4=85  6%  perf-profile.c=
hildren.cycles-pp.__lxstat64
> > > > >       0.88 =C4=85  5%      -0.2        0.71 =C4=85 11%  perf-prof=
ile.children.cycles-pp.__check_object_size
> > > > >       0.75 =C4=85  7%      -0.2        0.60 =C4=85 10%  perf-prof=
ile.children.cycles-pp.lookup_open
> > > > >       0.86 =C4=85 10%      -0.2        0.70 =C4=85  6%  perf-prof=
ile.children.cycles-pp.rmdir
> > > > >       0.66 =C4=85 12%      -0.2        0.51 =C4=85 15%  perf-prof=
ile.children.cycles-pp.vfs_create_mount
> > > > >       1.07            -0.2        0.92 =C4=85  7%  perf-profile.c=
hildren.cycles-pp.__do_sys_newlstat
> > > > >       0.78 =C4=85 10%      -0.1        0.63 =C4=85  6%  perf-prof=
ile.children.cycles-pp.__x64_sys_rmdir
> > > > >       0.69 =C4=85  5%      -0.1        0.56 =C4=85 11%  perf-prof=
ile.children.cycles-pp.__d_alloc
> > > > >       0.73 =C4=85  2%      -0.1        0.60 =C4=85 15%  perf-prof=
ile.children.cycles-pp.__sync_rcu_exp_select_node_cpus
> > > > >       0.69 =C4=85  7%      -0.1        0.57 =C4=85  8%  perf-prof=
ile.children.cycles-pp.do_rmdir
> > > > >       0.41 =C4=85  4%      -0.1        0.30 =C4=85 17%  perf-prof=
ile.children.cycles-pp.xas_store
> > > > >       0.16 =C4=85 22%      -0.1        0.06 =C4=85 60%  perf-prof=
ile.children.cycles-pp.pcpu_block_refresh_hint
> > > > >       0.47 =C4=85  9%      -0.1        0.38 =C4=85 13%  perf-prof=
ile.children.cycles-pp.d_alloc
> > > > >       0.41 =C4=85 10%      -0.1        0.33 =C4=85 12%  perf-prof=
ile.children.cycles-pp.truncate_inode_pages_range
> > > > >       0.39 =C4=85  5%      -0.1        0.32 =C4=85 13%  perf-prof=
ile.children.cycles-pp.check_heap_object
> > > > >       0.39 =C4=85  4%      -0.1        0.32 =C4=85 15%  perf-prof=
ile.children.cycles-pp.list_lru_destroy
> > > > >       0.33 =C4=85  5%      -0.1        0.27 =C4=85 14%  perf-prof=
ile.children.cycles-pp.memcg_destroy_list_lru
> > > > >       0.24 =C4=85  7%      -0.1        0.17 =C4=85 14%  perf-prof=
ile.children.cycles-pp.finish_task_switch
> > > > >       0.16 =C4=85  9%      -0.1        0.10 =C4=85 28%  perf-prof=
ile.children.cycles-pp.change_mnt_propagation
> > > > >       0.60 =C4=85  8%      -0.1        0.54 =C4=85  5%  perf-prof=
ile.children.cycles-pp.__dentry_kill
> > > > >       0.24 =C4=85 11%      -0.1        0.18 =C4=85 21%  perf-prof=
ile.children.cycles-pp.__virt_addr_valid
> > > > >       0.24 =C4=85 15%      -0.1        0.18 =C4=85 12%  perf-prof=
ile.children.cycles-pp.security_capable
> > > > >       0.23 =C4=85  3%      -0.1        0.17 =C4=85  9%  perf-prof=
ile.children.cycles-pp.copy_mount_options
> > > > >       0.18 =C4=85  5%      -0.1        0.12 =C4=85 21%  perf-prof=
ile.children.cycles-pp.memcg_init_list_lru_one
> > > > >       0.09 =C4=85 15%      -0.0        0.04 =C4=85 73%  perf-prof=
ile.children.cycles-pp.mnt_release_group_id
> > > > >       0.22 =C4=85  6%      -0.0        0.18 =C4=85 21%  perf-prof=
ile.children.cycles-pp.fsnotify_grab_connector
> > > > >       0.11 =C4=85 16%      -0.0        0.07 =C4=85 24%  perf-prof=
ile.children.cycles-pp.syscall_enter_from_user_mode
> > > > >       0.12 =C4=85 25%      -0.0        0.08 =C4=85 21%  perf-prof=
ile.children.cycles-pp.__smp_call_single_queue
> > > > >       0.18 =C4=85  5%      -0.0        0.14 =C4=85 23%  perf-prof=
ile.children.cycles-pp.wq_worker_sleeping
> > > > >       0.12 =C4=85 11%      +0.0        0.16 =C4=85 15%  perf-prof=
ile.children.cycles-pp.read_tsc
> > > > >       0.08 =C4=85  9%      +0.1        0.14 =C4=85 28%  perf-prof=
ile.children.cycles-pp.tick_nohz_next_event
> > > > >       0.15 =C4=85  6%      +0.1        0.22 =C4=85 18%  perf-prof=
ile.children.cycles-pp.tick_nohz_get_sleep_length
> > > > >       0.00            +0.1        0.07 =C4=85 20%  perf-profile.c=
hildren.cycles-pp.pcpu_chunk_refresh_hint
> > > > >       0.00            +0.1        0.08 =C4=85 14%  perf-profile.c=
hildren.cycles-pp.init_timer_key
> > > > >       0.00            +0.1        0.10 =C4=85 29%  perf-profile.c=
hildren.cycles-pp.rmqueue_bulk
> > > > >       0.04 =C4=85 50%      +0.2        0.21 =C4=85 19%  perf-prof=
ile.children.cycles-pp.get_page_from_freelist
> > > > >       0.00            +0.2        0.18 =C4=85 19%  perf-profile.c=
hildren.cycles-pp.rcu_segcblist_init
> > > > >       0.00            +0.2        0.18 =C4=85 20%  perf-profile.c=
hildren.cycles-pp.rmqueue
> > > > >       0.08 =C4=85  9%      +0.2        0.26 =C4=85 11%  perf-prof=
ile.children.cycles-pp.__alloc_pages
> > > > >       1.18 =C4=85  9%      +0.2        1.37 =C4=85  9%  perf-prof=
ile.children.cycles-pp.do_nanosleep
> > > > >       1.20 =C4=85 10%      +0.2        1.40 =C4=85  9%  perf-prof=
ile.children.cycles-pp.hrtimer_nanosleep
> > > > >       1.21 =C4=85 10%      +0.2        1.41 =C4=85  9%  perf-prof=
ile.children.cycles-pp.common_nsleep
> > > > >       1.24 =C4=85 11%      +0.2        1.45 =C4=85 10%  perf-prof=
ile.children.cycles-pp.__x64_sys_clock_nanosleep
> > > > >       0.00            +0.2        0.22 =C4=85 19%  perf-profile.c=
hildren.cycles-pp.pcpu_alloc_pages
> > > > >       1.35 =C4=85 11%      +0.2        1.59 =C4=85  9%  perf-prof=
ile.children.cycles-pp.clock_nanosleep
> > > > >       0.00            +0.3        0.27 =C4=85 18%  perf-profile.c=
hildren.cycles-pp.pcpu_populate_chunk
> > > > >       0.00            +0.3        0.33 =C4=85 16%  perf-profile.c=
hildren.cycles-pp.pcpu_balance_populated
> > > > >       0.00            +0.3        0.34 =C4=85 15%  perf-profile.c=
hildren.cycles-pp.pcpu_balance_workfn
> > > > >       1.41 =C4=85  7%      +0.5        1.95 =C4=85 12%  perf-prof=
ile.children.cycles-pp.memset_orig
> > > > >       0.12 =C4=85 21%      +1.6        1.70 =C4=85 30%  perf-prof=
ile.children.cycles-pp.pcpu_find_block_fit
> > > > >       9.20 =C4=85  7%      +3.2       12.41 =C4=85 11%  perf-prof=
ile.children.cycles-pp.__x64_sys_mount
> > > > >       9.29 =C4=85  7%      +3.2       12.51 =C4=85 11%  perf-prof=
ile.children.cycles-pp.mount
> > > > >       8.34 =C4=85  7%      +3.4       11.70 =C4=85 11%  perf-prof=
ile.children.cycles-pp.do_new_mount
> > > > >       3.22 =C4=85  9%      +3.6        6.81 =C4=85 15%  perf-prof=
ile.children.cycles-pp.pcpu_alloc
> > > > >       3.18 =C4=85  6%      +4.3        7.52 =C4=85 14%  perf-prof=
ile.children.cycles-pp.vfs_get_super
> > > > >       3.19 =C4=85  6%      +4.3        7.54 =C4=85 14%  perf-prof=
ile.children.cycles-pp.vfs_get_tree
> > > > >       1.87 =C4=85  8%      +4.6        6.48 =C4=85 15%  perf-prof=
ile.children.cycles-pp.sget_fc
> > > > >       1.73 =C4=85  9%      +4.6        6.37 =C4=85 16%  perf-prof=
ile.children.cycles-pp.alloc_super
> > > > >       0.00            +5.1        5.14 =C4=85 19%  perf-profile.c=
hildren.cycles-pp.init_srcu_struct_fields
> > > > >       2.80 =C4=85  7%      -0.5        2.30 =C4=85 13%  perf-prof=
ile.self.cycles-pp.stress_rndstr
> > > > >       1.30 =C4=85  6%      -0.3        1.04 =C4=85 16%  perf-prof=
ile.self.cycles-pp.mnt_get_count
> > > > >       1.25 =C4=85  7%      -0.2        1.02 =C4=85  4%  perf-prof=
ile.self.cycles-pp._raw_spin_lock_irqsave
> > > > >       1.08 =C4=85 10%      -0.1        0.93 =C4=85  7%  perf-prof=
ile.self.cycles-pp.strncpy_from_user
> > > > >       0.61 =C4=85 12%      -0.1        0.48 =C4=85 16%  perf-prof=
ile.self.cycles-pp.try_check_zero
> > > > >       0.63 =C4=85  8%      -0.1        0.50 =C4=85 17%  perf-prof=
ile.self.cycles-pp.mnt_get_writers
> > > > >       0.68 =C4=85  6%      -0.1        0.58 =C4=85  4%  perf-prof=
ile.self.cycles-pp.link_path_walk
> > > > >       0.40 =C4=85  3%      -0.1        0.32 =C4=85 15%  perf-prof=
ile.self.cycles-pp.__sync_rcu_exp_select_node_cpus
> > > > >       0.15 =C4=85 14%      -0.1        0.08 =C4=85 51%  perf-prof=
ile.self.cycles-pp.xas_store
> > > > >       0.29 =C4=85  6%      -0.1        0.22 =C4=85 18%  perf-prof=
ile.self.cycles-pp.inode_permission
> > > > >       0.16 =C4=85 12%      -0.0        0.12 =C4=85 18%  perf-prof=
ile.self.cycles-pp.filename_lookup
> > > > >       0.06 =C4=85  6%      -0.0        0.03 =C4=85 70%  perf-prof=
ile.self.cycles-pp.cpuidle_idle_call
> > > > >       0.12 =C4=85 11%      +0.0        0.15 =C4=85 16%  perf-prof=
ile.self.cycles-pp.read_tsc
> > > > >       0.04 =C4=85 83%      +0.0        0.08 =C4=85 12%  perf-prof=
ile.self.cycles-pp.delayed_free_vfsmnt
> > > > >       0.00            +0.1        0.07 =C4=85 15%  perf-profile.s=
elf.cycles-pp.init_timer_key
> > > > >       0.00            +0.2        0.16 =C4=85 19%  perf-profile.s=
elf.cycles-pp.rcu_segcblist_init
> > > > >       0.00            +0.2        0.24 =C4=85 14%  perf-profile.s=
elf.cycles-pp.init_srcu_struct_fields
> > > > >       1.28 =C4=85  8%      +0.5        1.79 =C4=85 11%  perf-prof=
ile.self.cycles-pp.memset_orig
> > > > >       0.69 =C4=85 17%      +1.3        2.00 =C4=85 26%  perf-prof=
ile.self.cycles-pp.pcpu_alloc
> > > > >       0.04 =C4=85 85%      +1.6        1.62 =C4=85 31%  perf-prof=
ile.self.cycles-pp.pcpu_find_block_fit
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > Disclaimer:
> > > > > Results have been estimated based on internal Intel analysis and =
are provided
> > > > > for informational purposes only. Any difference in system hardwar=
e or software
> > > > > design or configuration may affect actual performance.
> > > > >
> > > > >
> > > > > --
> > > > > 0-DAY CI Kernel Test Service
> > > > > https://github.com/intel/lkp-tests/wiki
> > > > >
> > > > >
> > > >
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
