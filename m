Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93DD8481
	for <oe-lkp@lists.linux.dev>; Tue, 27 Jun 2023 09:51:12 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-440ad576d87so1263636137.1
        for <oe-lkp@lists.linux.dev>; Tue, 27 Jun 2023 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687859471; x=1690451471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJNVNPj1SxFgWlAwy12JZSsG9te5kKXUYfTW5ZuBm7M=;
        b=ZPz3dy6BAVl1pnEoTsaSrtmIp0exfgfujHLz9zfgdbsSubOEem1F8jO6e9jTIuvEd6
         +0k5sSlhEOb6l43PQYr/UAW90G+o3ExX5wkV1GkSDAx3OuuUNPkPNxsFCSpL3BBVhv3b
         3AIVlTfLyw10DB6nfqje2zsYaqxo6k6CrqGDlUPaYvLmBhf5tffM12vrIJnT2eKdbK4x
         VE0APus2/HvbbhcJjAWlhgtKffohlJGgPAB+tnvxGF8fbC1ktMqm4GT9UtMLRqcjSPrr
         rRJ0JEIsGu96K/1+tGiUAubTpwXAChJQzzIasIif0yV3jJmxkeeoAUYk3blb1IDkJgTM
         pr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687859471; x=1690451471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJNVNPj1SxFgWlAwy12JZSsG9te5kKXUYfTW5ZuBm7M=;
        b=bYlifGw6kFN5APOlUASHKtD0cBmKcKni4FNEbW895yMeuYfaonDOp+B0rpYOxR6ClT
         KStOkDARl9ujhd3khGdBPIhUQGDPGO8LyDh+wFDHfCr+xAG2aMgFIqryL7KofirPWzYL
         krBl9fH47dYL2AHff4/fbkkwyO1W8pcImH8cQGP4Yw0Oy+4GL37rWvu3VHonRe3br9vY
         D7MI4u8eDr7vBtRrm25+ZGTCrcpTOIzWO9934PPiSkNfxSycV6Dn4Si1cz8Mr+Kjgbo4
         W5fywnPH0qE6oGJqLu8Obii021+4NwIiWTVTWEMJGDUYlLlwxZT/ynQNd543JJDazRHC
         79Jg==
X-Gm-Message-State: AC+VfDzKVjsiLTk413s+/IRMMbDLvNNDP0CdZngVg+OsB9zA58psRM6L
	OPzEkdIBJpVF7guGFnsO63Soud0WaOK9G34bcdA=
X-Google-Smtp-Source: ACHHUZ4Vwzx4mPhySTW8LVd/Tpo68tI+C8akw02qXndGxn1DDKI3+DYZSNWgJT/7lIHiyIlg/HdzA9ryRhTQb8RPl6E=
X-Received: by 2002:a05:6102:ce:b0:443:69fd:3628 with SMTP id
 u14-20020a05610200ce00b0044369fd3628mr2728286vsp.13.1687859471433; Tue, 27
 Jun 2023 02:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306192245.d77d7216-oliver.sang@intel.com> <CAOQ4uxj_md8KqiQ=TTMC7Kv5VFtREfB8T3agB+pVH8STye_5Vw@mail.gmail.com>
 <ZJWwrHozI2GkRnJ6@xsang-OptiPlex-9020> <CAOQ4uxg8rr-uHUo62nrZzfp14UpNAz1K9YxyaAq7D2ggAFLHMg@mail.gmail.com>
 <20230626133142.xdcwu7akidnftrla@quack3> <CAOQ4uxhf2UkZUtrB42d=5Nti1eS3Fn_Jg7gsqNRkQVS=GWmPTQ@mail.gmail.com>
 <20230627075457.fymnpqn3vrjxjs2u@quack3>
In-Reply-To: <20230627075457.fymnpqn3vrjxjs2u@quack3>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 27 Jun 2023 12:51:00 +0300
Message-ID: <CAOQ4uxi4KmMD0xh6Mfk-Rqb_Rwyfb0WL_yiWmonb6qQswNNG=g@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711: stress-ng.ramfs.ops_per_sec
 -13.0% regression
To: Jan Kara <jack@suse.cz>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 10:54=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Mon 26-06-23 18:13:55, Amir Goldstein wrote:
> > On Mon, Jun 26, 2023 at 4:31=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
> > >
> > > Hi Amir!
> > >
> > > On Sat 24-06-23 16:18:14, Amir Goldstein wrote:
> > > > On Fri, Jun 23, 2023 at 5:48=E2=80=AFPM Oliver Sang <oliver.sang@in=
tel.com> wrote:
> > > > > On Tue, Jun 20, 2023 at 02:36:51PM +0300, Amir Goldstein wrote:
> > > > > > On Tue, Jun 20, 2023 at 4:44=E2=80=AFAM kernel test robot <oliv=
er.sang@intel.com> wrote:
> > > > > > > kernel test robot noticed a -13.0% regression of stress-ng.ra=
mfs.ops_per_sec on:
> > > > > > >
> > > > > > >
> > > > > > > commit: e796a59711433d5400947b2dbfaf35d465840842 ("vfs: imple=
ment 'vfs write barriers'")
> > > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > > >
> > > > > >
> > > > > > Considering that this commit only adds helpers but never uses t=
hem
> > > > > > this regression is a bit surprising.
> > > > > >
> > > > > > You had reported regressions in the past on the next commit:
> > > > > > "vfs: prepare for pre-modify permission events on write"
> > > > > >
> > > > > > which made sense and I had since fixed and you verified.
> > > > > >
> > > > > > The only suspect I can think of is that adding the new s_write_=
*
> > > > > > members to struct super_block had split the frequently access
> > > > > > members s_fsnotify_connectors and s_readonly_remount into
> > > > > > different cachelines.
> > > > > >
> > > > > > I've moved those new members to another location in the
> > > > > > super_block struct and pushed the new branch to:
> > > > > >
> > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > >
> > > > > > I've added another commit at the tip of this branch:
> > > > > > 67d1802889f0 ("fsnotify: activate sb write barriers for permiss=
ion
> > > > > > event watchers")
> > > > > >
> > > > > > This commit also adds a new member to struct super_block,
> > > > > > next to s_fsnotify_connectors and s_readonly_remount, but this
> > > > > > new member is also frequently accessed.
> > > > > >
> > > > > > I am hoping that you can also verify that the tip commit does n=
ot
> > > > > > cause a regression.
> > > > >
> > > > > I finished the test on updated branch, but seems regression not b=
e fixed.
> > > > >
> > > > >   d0c30b5ebd657 (amir73il/fan_access_range) fanotify: report file=
 range info with FAN_ACCESSS_PERM
> > > > >   f995c9620bfd7 vfs: implement 'vfs write barriers'
> > > > >   309b0dd357c60 vfs: prepare for pre-modify permission events on =
write
> > > > >   67d1802889f02 (amir73il/sb_write_barrier) fsnotify: activate sb=
 write barriers for permission event watchers
> > > > >
> > > > > d0c30b5ebd6579cc f995c9620bfd75a07a2c8a8d70c 309b0dd357c60a5e5417=
66ef097 67d1802889f02cd626d5924339a
> > > > > ---------------- --------------------------- --------------------=
------- ---------------------------
> > > > >          %stddev     %change         %stddev     %change         =
%stddev     %change         %stddev
> > > > >              \          |                \          |            =
    \          |                \
> > > > >    1377718           -13.8%    1187511 =C2=B1  2%     -14.4%    1=
179629           -14.0%    1185167        stress-ng.ramfs.ops
> > > > >      22961           -13.8%      19791 =C2=B1  2%     -14.4%     =
 19660           -14.0%      19752        stress-ng.ramfs.ops_per_sec
> > > > >
> > > > > all detail comparison is as below, I also attached the config to =
build all
> > > > > these four kernels.
> > > > >
> > > >
> > > > Thank you Oliver!
> > > >
> > > > Jan,
> > > >
> > > > Do you have an idea of what might be going on here?
> > >
> > > Not really.
> > >
> > > > The only code change in the regressing commit is the addition
> > > > of the s_write_* members to super_block and the addition of
> > > > init_srcu_struct() call in alloc_super().
> > > >
> > > > Unless I am missing something.
> > >
> > > No, you are right. But it could also be some code alignment changing =
after
> > > adding those new functions. Can you reproduce the regression on your
> > > machine?
> >
> > I have not tried yet.
> >
> > > If yes, you could have a look at some micro-architectural perf
> > > counters like iTLB misses or similar to see e.g. whether code of some=
 hot
> > > function didn't get split among two cachelines or similar issue. Ther=
e's
> > > also CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B which can help in determin=
ing
> > > whether function alignment is the issue or not.
> > >
> >
> > There is a lot of perf information in the report below, e.g.:
> >
> > >    1259329 =C2=B1  2%    +405.3%    6363306          +404.5%    63538=
71          +408.1%    6398089        perf-stat.ps.cache-misses
> > >     182239 =C2=B1  2%     +40.1%     255227 =C2=B1  9%     +38.0%    =
 251400 =C2=B1 14%     +23.9%     225874 =C2=B1  6%  perf-stat.ps.dTLB-load=
-misses
> > >      98768 =C2=B1  6%    +131.3%     228477          +130.1%     2272=
67 =C2=B1  3%    +126.1%     223327        perf-stat.ps.dTLB-store-misses
>
> Ah, OK. I got bored by turbostat, vmstat and other counters before
> scrolling down to these ;). So looking at these stats it seems that
> data accesses are incurring more cache misses. The truth is that struct
> srcu_struct is huge (some 112 bytes) so maybe some frequently accessed
> fields got split into different cachelines with its addition. Have you
> tried putting it at the end of struct super_block just to rule this out? =
I
> know you already had it elsewhere in struct super_block but I don't think
> it was at the end.

You are right.
Let's try that.

Oliver can you please re-test:

* aeeb99484d27 - (sb_write_barrier) fsnotify: activate sb write
barriers for permission event watchers
* be794cb66c8f - vfs: prepare for pre-modify permission events on aio write
* 010093856383 - vfs: prepare for pre-modify permission events on write
* b31ab27476aa - vfs: implement 'vfs write barriers'

BTW, Oliver, from your experience, are the following reports of memory
usage increase reliable:

>      17796        +48024.2%    8564575        +47827.4%    8529539       =
 +48034.7%    8566438        meminfo.Percpu
>      91742          +311.6%     377568          +310.0%     376107       =
   +311.2%     377278        meminfo.SUnreclaim
>     187447          +152.3%     472983          +151.6%     471592       =
   +152.1%     472612        meminfo.Slab
>      20441         +2173.2%     464664         +2164.2%     462832       =
  +2173.5%     464731        meminfo.VmallocUsed

Thanks,
Amir.
