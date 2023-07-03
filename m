Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20449F9CB
	for <oe-lkp@lists.linux.dev>; Mon,  3 Jul 2023 15:09:55 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7919342c456so1047909241.2
        for <oe-lkp@lists.linux.dev>; Mon, 03 Jul 2023 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688396995; x=1690988995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUYzduO2fW7e2LuHNG1YO4DIQWHk8LBgb8gpQrJW6RE=;
        b=YuSBnN4WMSPFMJrnLQ900sacU7Dgzp4X0dD50DDnR4V2YUEYTeMHTt1GJJCZ8EPWal
         DZt7ATv4TojeZDAUcl8ZMIiK9OZMtywRxE8RUlgYvNhlzxqMO5bA7bvKDc9z7A2YMKqp
         nhqWbYneYeuRWJSUxwBNqRYRVzFKE20CklNlXSx/gJmvo02zqWJFINyhJpi++x37u7uW
         XJQ1WmWZPF29tFhbJqUUiVlnHumIWTM7hbUNPgsIlThQUUSWVpX3NFSEby3EPYVOYmfP
         9eEQHaEUXxWcoW988gFKaVWjsrbG1CDDGKwo2xIBL4JObDwjdrgr939kKvMQLpFbehGe
         zzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688396995; x=1690988995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUYzduO2fW7e2LuHNG1YO4DIQWHk8LBgb8gpQrJW6RE=;
        b=KjJyil82hvjQtIsqNyNc3wmE7RqrjgIDKMRf6duYBjiXTQb2dt2DZS69rjqfFQZJTP
         XB1pk0auxwI386ICo1CGvudjCq9gE3XAa35OLuY0DuGOn3HfcTNyyekQnPvgn/9QDInJ
         D4DYid0PJDSIluG9NIO8B6YosQX0AMrT/8UHv+5cLBkRzsvvpUaBLq4qxytmcJqJyeXE
         X1a4XyQFCmSgYWZ+X/6+leuiYldlWdf/D9J8f58N+GDchUH0S+61OuUFfslMNB286iQ7
         WZTEpXFdQx6luG1GBFwb4OVgrsKEyNx/EgSBMI/lpbhLt936nO2qlTHdR6X/YRrFbDPh
         nkqw==
X-Gm-Message-State: ABy/qLbFzxgDlTP0GH1prBn/RH3IJqr0E9Y0Zd3KPQpBSXaOMJNKOmj3
	+IoXhoxXrLJXOskUBQ4tvcz5+NbIS0LddLGkeD0=
X-Google-Smtp-Source: APBJJlHAw5mI3obb/QQluexoTfyi5FfaYhB7MAPjXT5GrgVYaoTYkNSTxSbeaTrhZBQE/7WRTapovJdPCTNEkHR6HaM=
X-Received: by 2002:a67:e88a:0:b0:443:78dd:447 with SMTP id
 x10-20020a67e88a000000b0044378dd0447mr3058753vsn.3.1688396994682; Mon, 03 Jul
 2023 08:09:54 -0700 (PDT)
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
 <ZJ5BT57HFAa52hB8@xsang-OptiPlex-9020> <CAOQ4uxgjc4eLvMtKd0yLktinZWfC_Zt9h9YjaOH5+2C9e-GLKw@mail.gmail.com>
 <ZKJ17aRBNGryOvQD@xsang-OptiPlex-9020>
In-Reply-To: <ZKJ17aRBNGryOvQD@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 3 Jul 2023 18:09:43 +0300
Message-ID: <CAOQ4uxh_xHTtT77+_+P3hmvFs72C=FccJVU8eWi=uK+RHtuL+g@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711: stress-ng.ramfs.ops_per_sec
 -13.0% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2023 at 10:17=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi Amir,
>
> On Fri, Jun 30, 2023 at 03:59:43PM +0300, Amir Goldstein wrote:
> > On Fri, Jun 30, 2023 at 5:43=E2=80=AFAM Oliver Sang <oliver.sang@intel.=
com> wrote:
> > >
>
> ...
>
> > > > You are right.
> > > > Let's try that.
> > > >
> > > > Oliver can you please re-test:
> > > >
> > > > * aeeb99484d27 - (sb_write_barrier) fsnotify: activate sb write
> > > > barriers for permission event watchers
> > > > * be794cb66c8f - vfs: prepare for pre-modify permission events on a=
io write
> > > > * 010093856383 - vfs: prepare for pre-modify permission events on w=
rite
> > > > * b31ab27476aa - vfs: implement 'vfs write barriers'
> > >
> > > we observed the regression still exists
> > >
> > > c739513bb7c55afd b31ab27476aad4585990f14fff9 01009385638362b28c869228=
63b aeeb99484d2743fe77b4fa7efae
> > > ---------------- --------------------------- ------------------------=
--- ---------------------------
> > >          %stddev     %change         %stddev     %change         %std=
dev     %change         %stddev
> > >              \          |                \          |                =
\          |                \
> > >    1494636           -14.6%    1276216 =C2=B1  2%     -15.4%    12647=
58           -15.4%    1264992 =C2=B1  2%  stress-ng.ramfs.ops
> > >      24910           -14.6%      21270 =C2=B1  2%     -15.4%      210=
79           -15.4%      21083 =C2=B1  2%  stress-ng.ramfs.ops_per_sec
> > >
> > > detail data are as below [1] (in order to avoid that table looks mess=
y, I
> > > ignored the data for be794cb66c8f since it's similar to 010093856383,
> > > if you still need it, please let me know)
> > >
> > >
> > > >
> > > > BTW, Oliver, from your experience, are the following reports of mem=
ory
> > > > usage increase reliable:
> > > >
> > > > >      17796        +48024.2%    8564575        +47827.4%    852953=
9        +48034.7%    8566438        meminfo.Percpu
> > > > >      91742          +311.6%     377568          +310.0%     37610=
7          +311.2%     377278        meminfo.SUnreclaim
> > > > >     187447          +152.3%     472983          +151.6%     47159=
2          +152.1%     472612        meminfo.Slab
> > > > >      20441         +2173.2%     464664         +2164.2%     46283=
2         +2173.5%     464731        meminfo.VmallocUsed
> > >
> > > let me highlight what we got this time:
> > >
> > >      17916        +52463.1%    9417643        +52127.1%    9357436   =
     +51529.3%    9250341        meminfo.Percpu
> > >      91506          +343.7%     405984          +341.4%     403941   =
       +337.6%     400384        meminfo.SUnreclaim
> > >     187356          +167.7%     501479          +166.5%     499365   =
       +164.7%     495855        meminfo.Slab
> > >      20457         +2388.0%     508989         +2372.4%     505807   =
      +2345.3%     500259        meminfo.VmallocUsed
> > >
> >
> > Well that can't be good..
> > Found one problem with the patch - is that it is missing:
> >
> > /*
> >  * cleanup_srcu_struct - deconstruct a sleep-RCU structure
> >  * @ssp: structure to clean up.
> >  *
> >  * Must invoke this after you are finished using a given srcu_struct th=
at
> >  * was initialized via init_srcu_struct(), else you leak memory.
> >  */
> > void cleanup_srcu_struct(struct srcu_struct *ssp)
> >
> > That could explain the increase in memory usage and maybe
> > the performance regression as a result of that.
> >
> > However, I do not see that cleanup_srcu_struct() has any
> > effect if srcu was never used and when
> > CONFIG_DEBUG_OBJECTS is not defined and according
> > to the config file attached to the report it wasn't defined.
> >
> > However, maybe I am missing something, so is here a branch
> > with the missing cleanup_srcu_struct().
> >

Ah, what I was missing is that I was looking at srcutiny code and
the kernel is configured to using srcutree code...

> > I've split the branch to smaller patches and re-ordered them to
> > give us finer grain bisection.
> >
> > The patch which may regress (hopefully not) is now the second
> > in the series. The rest are not likely to have an impact.
> >
> > * c587795908ea - (sb_write_barrier) vfs: prepare for pre-modify
> > permission events on aio write
> > * 5af3ebb1340f - vfs: prepare for pre-modify permission events on write
> > * 503d2addcf46 - vfs: add srcu variants for mnt_{want,drop}_write() hel=
pers
> > * 72f17d85a0ad - fsnotify: activate sb write barriers for permission
> > event watchers
> > * 2d9ffee9b227 - vfs: implement 'vfs write barriers'
> > * bab966719c0d - fsnotify: optimize the case of no permission event wat=
chers
> >
> > Oliver,
> >
> > Can you please re-test?
>
> the new version seems better, but still with regression
> (I listed data for all commits this time)
>
> efc30bf815efbc76 bab966719c0d18247dbc47f3bbd 2d9ffee9b227e01c4c476583fac =
72f17d85a0adabfe8918244e0ff 503d2addcf4606d60784ff0ee35 5af3ebb1340f6eb014a=
c1311783 c587795908ea996065b73dd5926
> ---------------- --------------------------- --------------------------- =
--------------------------- --------------------------- -------------------=
-------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev     %change         %stddev     %change        =
 %stddev     %change         %stddev
>              \          |                \          |                \   =
       |                \          |                \          |           =
     \          |                \
>    1443209            +0.3%    1448023            -7.4%    1335977       =
     -6.7%    1346397            -6.8%    1344653            -6.6%    13483=
94            -7.0%    1342155        stress-ng.ramfs.ops
>      24053            +0.3%      24133            -7.4%      22266       =
     -6.7%      22439            -6.8%      22410            -6.6%      224=
73            -7.0%      22369        stress-ng.ramfs.ops_per_sec
>
> and there are also some changes on meminfo side
>
>      17904            +0.3%      17959           +45.7%      26083       =
    +45.5%      26044           +46.0%      26142           +44.7%      259=
00           +45.3%      26018        meminfo.Percpu
>      93698            +0.6%      94235            +0.9%      94538       =
     +1.7%      95251            +1.4%      94977            +1.1%      947=
51            +1.7%      95306        meminfo.SUnreclaim
>     190560            +0.3%     191220            +0.3%     191204       =
     +1.0%     192473            +0.6%     191785            +0.6%     1916=
76            +0.9%     192370        meminfo.Slab
>      20468            +0.1%      20495            +5.1%      21520       =
     +5.0%      21499            +5.2%      21538            +5.1%      215=
08            +5.0%      21492        meminfo.VmallocUsed
>
>

Excellent! We have finally made progress :)
I've pushed this branch to sb_write_barrier-rc4 for future reference.

I now also realize that stress-ng exercises fanotify permission events.
I was under the wrong impression that the patches are hurting performance
of workloads that do not include fanotify permission event watchers.

The optimization patches
"fsnotify: optimize the case of no permission event watchers" and
"fsnotify: activate sb write barriers for permission event watchers"
are therefore not effective with this workload.

sb_write_barrier() is not needed for the legacy fanotify permission events,
so I've changed the optimization patches to activate sb_write_barrier()
only for the new pre-modify event, which stress-ng is not aware of.

I also deferred init_srcu_struct() to sb_write_barrier_activate(), which is
not expected to happen in this workload at all.

The code is not fully correct, not checking error from init_srcu_struct()
and possibly needs synchronize_srcu() before cleanup_srcu_struct(),
but for the purpose of checking performance regressions for existing
workloads that do not use the new events, that should suffice.

I pushed these changes to branch sb_write_barrier-rc5:

* 18ab3ccc03f8 - (sb_write_barrier-rc5) vfs: prepare for pre-modify
permission events on aio write
* a6375febb518 - vfs: prepare for pre-modify permission events on write
* d4d8be7b9987 - vfs: add srcu variants for mnt_{want,drop}_write() helpers
* 92f4fe8a0643 - fsnotify: activate sb write barriers for pre-modify
event watchers
* 9de2ba3f2757 - vfs: implement 'vfs write barriers'
* 925188d1c20d - fsnotify: optimize the case of no pre-modify event watcher=
s

Oliver,

If you can re-test once again, that would be great.
Sorry that this is taking so long and thanks for your patience.

Amir.
