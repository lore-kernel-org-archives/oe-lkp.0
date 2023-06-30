Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E88F10796
	for <oe-lkp@lists.linux.dev>; Fri, 30 Jun 2023 12:59:56 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-791c27bb91dso1304256241.0
        for <oe-lkp@lists.linux.dev>; Fri, 30 Jun 2023 05:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688129995; x=1690721995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pExmQoe+Tr1ipaYajH+55rN57jCCz+Jk23m1bUs7ZPw=;
        b=kmEd2cYGzSZdRbDbrOB7Tr30YphucUsQzoaNVwkqGdVI6J8cG0TUdFWCvzIiAXSeXZ
         vN++PDHhJVYhqerh5bKjPVF99PNZdSOnk0aeKwmek2/2YNfuhbr19YVx2QFAu3FL9PlS
         YVtQCg21z3MvXKT3S+wH7t/xvjUjAQvneX9SoHJdRTsow4ICqCGZcpC+tH4JgIK4QS7A
         yWY6317s10gZ3tzOHgBwbYB28fA5dsO45TV5tcgTMJfjgaEz6kMpAMNZhRHzJ64VG03a
         mQlfkBdk7xyTS5G1jLqxPgDEGFSThEiZAfew8AZwZXYfd7ipuf9c1mOvc50vZTyaq5b9
         EmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688129995; x=1690721995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pExmQoe+Tr1ipaYajH+55rN57jCCz+Jk23m1bUs7ZPw=;
        b=GoGWG0Zr2BJZU9X2FRir7g9XJnoxZM+PcQdBFF2DCQk66Bgoqi/ijYBt3Tzvz5RS1K
         DkawWR+NgUjTo2N7G3G9RZPbbfxrnZlfFdR8MdmirTxjsMIGinPf7wCuCxEtI9s2G845
         Zpe3HJKRlm5R/B3c6sSbIWl/UNPWY9uRsPzSKvS0baWTZ+nocXGjSzdLPx3w4MCYWfLg
         5YiUEfRAiOYkLLB5+GgKBjv+1HvqywAskHRFthKzoPiTmQx0qSfFVF4VbNn2Is2WWvT+
         KOQrXHtFsCi8Y/cLEFZcau09/F7GKJnYba9WFX+qFwxPoGPPUgTC9ypHNFb+s3OF+8cc
         5uCQ==
X-Gm-Message-State: AC+VfDzJdZzTBeSLvLo+K01BdHnerz5UJM/ezbMweFnjk+eN7whKVqlX
	jpbf6wMvH2z3dtPGfwq/2bmo2YperBJuAZK8eXc=
X-Google-Smtp-Source: ACHHUZ7+6I/yrGZLpXj7rbnzQEP2HmCC/r1NqZmPUbcHCsWVOERupTFKOqNDVypSXTV88abrdmbWwh2+zT5ZOjNkO48=
X-Received: by 2002:a05:6102:3e29:b0:443:5524:8f8b with SMTP id
 j41-20020a0561023e2900b0044355248f8bmr3414519vsv.4.1688129994980; Fri, 30 Jun
 2023 05:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306192245.d77d7216-oliver.sang@intel.com> <CAOQ4uxj_md8KqiQ=TTMC7Kv5VFtREfB8T3agB+pVH8STye_5Vw@mail.gmail.com>
 <ZJWwrHozI2GkRnJ6@xsang-OptiPlex-9020> <CAOQ4uxg8rr-uHUo62nrZzfp14UpNAz1K9YxyaAq7D2ggAFLHMg@mail.gmail.com>
 <20230626133142.xdcwu7akidnftrla@quack3> <CAOQ4uxhf2UkZUtrB42d=5Nti1eS3Fn_Jg7gsqNRkQVS=GWmPTQ@mail.gmail.com>
 <20230627075457.fymnpqn3vrjxjs2u@quack3> <CAOQ4uxi4KmMD0xh6Mfk-Rqb_Rwyfb0WL_yiWmonb6qQswNNG=g@mail.gmail.com>
 <ZJ5BT57HFAa52hB8@xsang-OptiPlex-9020>
In-Reply-To: <ZJ5BT57HFAa52hB8@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 30 Jun 2023 15:59:43 +0300
Message-ID: <CAOQ4uxgjc4eLvMtKd0yLktinZWfC_Zt9h9YjaOH5+2C9e-GLKw@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711: stress-ng.ramfs.ops_per_sec
 -13.0% regression
To: Oliver Sang <oliver.sang@intel.com>, Jan Kara <jack@suse.cz>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 5:43=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Amir,
>
> On Tue, Jun 27, 2023 at 12:51:00PM +0300, Amir Goldstein wrote:
> > On Tue, Jun 27, 2023 at 10:54=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> > >
> > > On Mon 26-06-23 18:13:55, Amir Goldstein wrote:
> > > > On Mon, Jun 26, 2023 at 4:31=E2=80=AFPM Jan Kara <jack@suse.cz> wro=
te:
> > > > >
> > > > > Hi Amir!
> > > > >
> > > > > On Sat 24-06-23 16:18:14, Amir Goldstein wrote:
> > > > > > On Fri, Jun 23, 2023 at 5:48=E2=80=AFPM Oliver Sang <oliver.san=
g@intel.com> wrote:
> > > > > > > On Tue, Jun 20, 2023 at 02:36:51PM +0300, Amir Goldstein wrot=
e:
> > > > > > > > On Tue, Jun 20, 2023 at 4:44=E2=80=AFAM kernel test robot <=
oliver.sang@intel.com> wrote:
> > > > > > > > > kernel test robot noticed a -13.0% regression of stress-n=
g.ramfs.ops_per_sec on:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > commit: e796a59711433d5400947b2dbfaf35d465840842 ("vfs: i=
mplement 'vfs write barriers'")
> > > > > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > > > > >
> > > > > > > >
> > > > > > > > Considering that this commit only adds helpers but never us=
es them
> > > > > > > > this regression is a bit surprising.
> > > > > > > >
> > > > > > > > You had reported regressions in the past on the next commit=
:
> > > > > > > > "vfs: prepare for pre-modify permission events on write"
> > > > > > > >
> > > > > > > > which made sense and I had since fixed and you verified.
> > > > > > > >
> > > > > > > > The only suspect I can think of is that adding the new s_wr=
ite_*
> > > > > > > > members to struct super_block had split the frequently acce=
ss
> > > > > > > > members s_fsnotify_connectors and s_readonly_remount into
> > > > > > > > different cachelines.
> > > > > > > >
> > > > > > > > I've moved those new members to another location in the
> > > > > > > > super_block struct and pushed the new branch to:
> > > > > > > >
> > > > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > > > >
> > > > > > > > I've added another commit at the tip of this branch:
> > > > > > > > 67d1802889f0 ("fsnotify: activate sb write barriers for per=
mission
> > > > > > > > event watchers")
> > > > > > > >
> > > > > > > > This commit also adds a new member to struct super_block,
> > > > > > > > next to s_fsnotify_connectors and s_readonly_remount, but t=
his
> > > > > > > > new member is also frequently accessed.
> > > > > > > >
> > > > > > > > I am hoping that you can also verify that the tip commit do=
es not
> > > > > > > > cause a regression.
> > > > > > >
> > > > > > > I finished the test on updated branch, but seems regression n=
ot be fixed.
> > > > > > >
> > > > > > >   d0c30b5ebd657 (amir73il/fan_access_range) fanotify: report =
file range info with FAN_ACCESSS_PERM
> > > > > > >   f995c9620bfd7 vfs: implement 'vfs write barriers'
> > > > > > >   309b0dd357c60 vfs: prepare for pre-modify permission events=
 on write
> > > > > > >   67d1802889f02 (amir73il/sb_write_barrier) fsnotify: activat=
e sb write barriers for permission event watchers
> > > > > > >
> > > > > > > d0c30b5ebd6579cc f995c9620bfd75a07a2c8a8d70c 309b0dd357c60a5e=
541766ef097 67d1802889f02cd626d5924339a
> > > > > > > ---------------- --------------------------- ----------------=
----------- ---------------------------
> > > > > > >          %stddev     %change         %stddev     %change     =
    %stddev     %change         %stddev
> > > > > > >              \          |                \          |        =
        \          |                \
> > > > > > >    1377718           -13.8%    1187511 =C2=B1  2%     -14.4% =
   1179629           -14.0%    1185167        stress-ng.ramfs.ops
> > > > > > >      22961           -13.8%      19791 =C2=B1  2%     -14.4% =
     19660           -14.0%      19752        stress-ng.ramfs.ops_per_sec
> > > > > > >
> > > > > > > all detail comparison is as below, I also attached the config=
 to build all
> > > > > > > these four kernels.
> > > > > > >
> > > > > >
> > > > > > Thank you Oliver!
> > > > > >
> > > > > > Jan,
> > > > > >
> > > > > > Do you have an idea of what might be going on here?
> > > > >
> > > > > Not really.
> > > > >
> > > > > > The only code change in the regressing commit is the addition
> > > > > > of the s_write_* members to super_block and the addition of
> > > > > > init_srcu_struct() call in alloc_super().
> > > > > >
> > > > > > Unless I am missing something.
> > > > >
> > > > > No, you are right. But it could also be some code alignment chang=
ing after
> > > > > adding those new functions. Can you reproduce the regression on y=
our
> > > > > machine?
> > > >
> > > > I have not tried yet.
> > > >
> > > > > If yes, you could have a look at some micro-architectural perf
> > > > > counters like iTLB misses or similar to see e.g. whether code of =
some hot
> > > > > function didn't get split among two cachelines or similar issue. =
There's
> > > > > also CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B which can help in dete=
rmining
> > > > > whether function alignment is the issue or not.
> > > > >
> > > >
> > > > There is a lot of perf information in the report below, e.g.:
> > > >
> > > > >    1259329 =C2=B1  2%    +405.3%    6363306          +404.5%    6=
353871          +408.1%    6398089        perf-stat.ps.cache-misses
> > > > >     182239 =C2=B1  2%     +40.1%     255227 =C2=B1  9%     +38.0%=
     251400 =C2=B1 14%     +23.9%     225874 =C2=B1  6%  perf-stat.ps.dTLB-=
load-misses
> > > > >      98768 =C2=B1  6%    +131.3%     228477          +130.1%     =
227267 =C2=B1  3%    +126.1%     223327        perf-stat.ps.dTLB-store-miss=
es
> > >
> > > Ah, OK. I got bored by turbostat, vmstat and other counters before
> > > scrolling down to these ;). So looking at these stats it seems that
> > > data accesses are incurring more cache misses. The truth is that stru=
ct
> > > srcu_struct is huge (some 112 bytes) so maybe some frequently accesse=
d
> > > fields got split into different cachelines with its addition. Have yo=
u
> > > tried putting it at the end of struct super_block just to rule this o=
ut? I
> > > know you already had it elsewhere in struct super_block but I don't t=
hink
> > > it was at the end.
> >
> > You are right.
> > Let's try that.
> >
> > Oliver can you please re-test:
> >
> > * aeeb99484d27 - (sb_write_barrier) fsnotify: activate sb write
> > barriers for permission event watchers
> > * be794cb66c8f - vfs: prepare for pre-modify permission events on aio w=
rite
> > * 010093856383 - vfs: prepare for pre-modify permission events on write
> > * b31ab27476aa - vfs: implement 'vfs write barriers'
>
> we observed the regression still exists
>
> c739513bb7c55afd b31ab27476aad4585990f14fff9 01009385638362b28c86922863b =
aeeb99484d2743fe77b4fa7efae
> ---------------- --------------------------- --------------------------- =
---------------------------
>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev
>              \          |                \          |                \   =
       |                \
>    1494636           -14.6%    1276216 =C2=B1  2%     -15.4%    1264758  =
         -15.4%    1264992 =C2=B1  2%  stress-ng.ramfs.ops
>      24910           -14.6%      21270 =C2=B1  2%     -15.4%      21079  =
         -15.4%      21083 =C2=B1  2%  stress-ng.ramfs.ops_per_sec
>
> detail data are as below [1] (in order to avoid that table looks messy, I
> ignored the data for be794cb66c8f since it's similar to 010093856383,
> if you still need it, please let me know)
>
>
> >
> > BTW, Oliver, from your experience, are the following reports of memory
> > usage increase reliable:
> >
> > >      17796        +48024.2%    8564575        +47827.4%    8529539   =
     +48034.7%    8566438        meminfo.Percpu
> > >      91742          +311.6%     377568          +310.0%     376107   =
       +311.2%     377278        meminfo.SUnreclaim
> > >     187447          +152.3%     472983          +151.6%     471592   =
       +152.1%     472612        meminfo.Slab
> > >      20441         +2173.2%     464664         +2164.2%     462832   =
      +2173.5%     464731        meminfo.VmallocUsed
>
> let me highlight what we got this time:
>
>      17916        +52463.1%    9417643        +52127.1%    9357436       =
 +51529.3%    9250341        meminfo.Percpu
>      91506          +343.7%     405984          +341.4%     403941       =
   +337.6%     400384        meminfo.SUnreclaim
>     187356          +167.7%     501479          +166.5%     499365       =
   +164.7%     495855        meminfo.Slab
>      20457         +2388.0%     508989         +2372.4%     505807       =
  +2345.3%     500259        meminfo.VmallocUsed
>

Well that can't be good..
Found one problem with the patch - is that it is missing:

/*
 * cleanup_srcu_struct - deconstruct a sleep-RCU structure
 * @ssp: structure to clean up.
 *
 * Must invoke this after you are finished using a given srcu_struct that
 * was initialized via init_srcu_struct(), else you leak memory.
 */
void cleanup_srcu_struct(struct srcu_struct *ssp)

That could explain the increase in memory usage and maybe
the performance regression as a result of that.

However, I do not see that cleanup_srcu_struct() has any
effect if srcu was never used and when
CONFIG_DEBUG_OBJECTS is not defined and according
to the config file attached to the report it wasn't defined.

However, maybe I am missing something, so is here a branch
with the missing cleanup_srcu_struct().

I've split the branch to smaller patches and re-ordered them to
give us finer grain bisection.

The patch which may regress (hopefully not) is now the second
in the series. The rest are not likely to have an impact.

* c587795908ea - (sb_write_barrier) vfs: prepare for pre-modify
permission events on aio write
* 5af3ebb1340f - vfs: prepare for pre-modify permission events on write
* 503d2addcf46 - vfs: add srcu variants for mnt_{want,drop}_write() helpers
* 72f17d85a0ad - fsnotify: activate sb write barriers for permission
event watchers
* 2d9ffee9b227 - vfs: implement 'vfs write barriers'
* bab966719c0d - fsnotify: optimize the case of no permission event watcher=
s

Oliver,

Can you please re-test?

Jan,

If this doesn't work, I am going to move s_write_srcu into the
s_fsnotify_marks connector.

If there is ever any user for sb write barriers other than fsnotify,
we could have sb_write_barrier_activate() allocate a never-detached
connector, same as we planned to do for the "default event mask".

I do not see value in ever detaching a connector from an active sb,
so a READ_ONCE() dereference to the connector from sb should
be enough for the *write_srcu helpers, right? like this:

static inline struct srcu_struct *sb_write_srcu(struct super_block *sb)
{
        return atomic_read(&sb->s_writers.srcu_active) ?
                   &READ_ONCE(sb->s_fsnotify_marks)->s_write_srcu : NULL;
}


Thanks,
Amir.
