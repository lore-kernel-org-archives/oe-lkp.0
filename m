Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D56B28E7
	for <oe-lkp@lists.linux.dev>; Thu, 15 Dec 2022 09:00:34 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id t5so2293799vsh.8
        for <oe-lkp@lists.linux.dev>; Thu, 15 Dec 2022 01:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsInr2USek1qSJWWGgVzeafVVNnyzxk0tTSpB8JnMlI=;
        b=VOxDxjk1/X2k8LtSvIGNYaaxhcVGrOyOuh5GaShQlLvmhdZxJbBsCI6D7CxxpvLr63
         SL4Snz9ihl8gqq1JP8DXMa0tBAM0UmOaNgd9CjR2WhplhJVi9kZ6CCqQWU2xiUvBtyHk
         hlMfy7MiLF71twQDT5MVndfEVjb1P7pFNApIA/YD1Vj3XGQDM7bz7s3/G44Ypf6BuVLG
         Gc+a0enMmhtGMJGr65meWOXqx6jv++ACdDDY5Sba1z1sKa3OHaOsfHbP3LvpSBT07w+g
         DmX9NxgawF+sQULi6XdPaj0p92kD025avH2vFgIzwZMBkjzEfK5j1lqBc4MLd9hbbVGQ
         T4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsInr2USek1qSJWWGgVzeafVVNnyzxk0tTSpB8JnMlI=;
        b=EwgWxRsv6xd98lbS/qLuRbDgok+/VO71mx4tMM7Y7yKJ7ZIpESVXOJLrrRp5YKKoma
         8wOT7oMhYDO6gbZc4pH95ZlA/ErF4KusDumXu0KGvUy1Qbufuh50kJkuPO5IQyYXLEwW
         6YhQ+9P37zTvAdaQIAJv+19VTRZ1ejGFYCrk2Fz14VbPf+s/bB0ELDP4HmMvrXi/wnkW
         LAgCgYNc3TqmPNCg/B1y4b9fHmY90nekiZ20XHy6kHp3HcQrwiZ2qqRaegDGfU/infVN
         +rbw23ag9ujgYUgMK5TxG1VeTAXn49tXhSmNTTzAeXUzF3VO9gaJfP4oX27oAZvKMrL8
         WPOQ==
X-Gm-Message-State: ANoB5pmDEDG+C5BSWrmJKplsZTVjIl4hStWMnxjzgEcX64EieIgSyngs
	RrkH0h1nhzox4GmEI5/YfBH+weWMQetgpKVFNs+JTMuJ9bo=
X-Google-Smtp-Source: AA0mqf5WEYVrw6Pa+8/A8TG7MI6AYfXg5KLxsZEO6E6YCIbDxDtmTzaNJDVFZ3R3dyTzcGE8JNLBnHfmCtH7qU7ariU=
X-Received: by 2002:a67:fc51:0:b0:3b1:48c:8218 with SMTP id
 p17-20020a67fc51000000b003b1048c8218mr18914684vsq.71.1671094833103; Thu, 15
 Dec 2022 01:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212081500.58dd9ea4-yujie.liu@intel.com> <CAOQ4uxh-TDSwxOHc2aL3HpiC_Pd_qNaWCLLe1SUgfOZF7DQ6_w@mail.gmail.com>
 <Y5qJ3xPqvYmysOIr@yujie-X299>
In-Reply-To: <Y5qJ3xPqvYmysOIr@yujie-X299>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Dec 2022 11:00:21 +0200
Message-ID: <CAOQ4uxgSd1xFG3J9ae2Krc59wuJEcj_O_sMWzsfCb7O6Zhq3Vw@mail.gmail.com>
Subject: Re: [amir73il:fan_pre_modify] [fanotify] 884a248730: unixbench.score
 -1.4% regression
To: Yujie Liu <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2022 at 4:46 AM Yujie Liu <yujie.liu@intel.com> wrote:
>
> Hi Amir,
>

Hi Yulie,

> On Fri, Dec 09, 2022 at 01:30:44PM +0200, Amir Goldstein wrote:
> > ..
> >
> > On Fri, Dec 9, 2022 at 8:46 AM kernel test robot <yujie.liu@intel.com> =
wrote:
> > >
> > > Hi Amir,
> > >
> > > We noticed a minor performance change on your fan_pre_modify branch.
> > > We tested commit 884a248730 and its parent 99f3242105 each for 8 runs=
,
> > > and the data is stable.
> >
> > Thank you for testing this branch!
> > It was a good choice.
> >
> > I am curious how do you choose which branches to test from my github,
> > because sometimes I push WIP or old backup branches which are not very
> > interesting to test.
>
> Sorry for late reply.
>
> For now, we don't have preference in choosing branches. All branches
> from you github repo will be tested. It would be nice if you could give
> some info like which branches are expected to be tested and which
> could be ingored (regexp pattern is supported), then we can setup branch
> filter for you.
>

You may set an ignore filter for branch names ending with -wip
and for branch names ending with -v<number> or just -<number>
(like fsnotify_pre_modify-20200709).

> > >
> > > commit 884a248730:
> > > - 3453.2
> > > - 3454.0
> > > - 3463.3
> > > - 3466.0
> > > - 3470.9
> > > - 3478.6
> > > - 3485.7
> > > - 3488.2
> > >
> > > commit 99f3242105:
> > > - 3515.5
> > > - 3518.5
> > > - 3531.8
> > > - 3536.6
> > > - 3543.8
> > > - 3545.7
> > > - 3556.0
> > > - 3562.0
> > >
> > > Please check below report for details.
> >
> > I pushed a new head 90b7623e35a9 to branch fan_pre_modify.
> >
> > Added an optimization commit before the reported regression:
> >  eb235508a99b fanotify: introduce FAN_PRE_MODIFY permission event
> >  42f4f971729e fsnotify: optimize the case of no permission marks of any=
 type
> >  ffb549cff3df fsnotify: define flags for pre-modify permission events
> >
> > My expectation is that the optimization commit will improve performance
> > compared to its parent (and to Linus master) and that the rest of the c=
ommits
> > on branch fan_pre_modify will not loose any of the performance win.
> >
> > My assumption is that the filesystem on which unixbench is executed
> > has some inotify watches (probably systemd) and that it does not have
> > any fanotify permission watches (i.e. no Anti-Malware installed).
> >
> > Please re-test.
> > Thanks,
> > Amir.
>
> The branch has below structure when we started retesting:
>
> 55b152460a1348 (amir73il/fan_pre_modify) fanotify: introduce FAN_MARK_SYN=
C flag
> e466b00a05141f nfsd: generate pre-modify path permission events
> 6afa7ff562d610 fanotify: introduce directory entry pre-modify permission =
events
> 0d926ca959b14d fsnotify: prepare for directory entry pre-modify permissio=
n events
> 5294322406fc39 fanotify: introduce FAN_PRE_ATTRIB permission event
> 5b8915ed5531ff fanotify: introduce FAN_PRE_MODIFY permission event
> d6126aa1fc8db3 fsnotify: optimize the case of no permission marks of any =
type
> ffb549cff3dfb4 fsnotify: define flags for pre-modify permission events
> ...
>
>
> The score of "fsnotify: define flags for pre-modify permission events"
> dropped from 3535 to 3474 after this branch was updated.
>

I assume this drop is not related to previous patches on my branch?

> Seems both the optimization commit and the regression commit we reported
> don't affect the score after the branch was updated.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase:
>   gcc-11/performance/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/30=
0s/lkp-icl-2sp2/fstime/unixbench
>
> commit:
>   ffb549cff3dfb4 ("fsnotify: define flags for pre-modify permission event=
s")
>   5b8915ed5531ff ("fanotify: introduce FAN_PRE_MODIFY permission event")
>   d6126aa1fc8db3 ("fsnotify: optimize the case of no permission marks of =
any type")
>
> ffb549cff3dfb4d7 5b8915ed5531ff290bdcf18f05e d6126aa1fc8db332ad0cf607ff4
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>       3474            +0.2%       3481            -0.1%       3472       =
 unixbench.score
>     480.40            -0.0%     480.33            +1.5%     487.68 =C2=B1=
  3%  unixbench.time.elapsed_time
>     480.40            -0.0%     480.33            +1.5%     487.68 =C2=B1=
  3%  unixbench.time.elapsed_time.max
>     560.83 =C2=B1  4%      -2.3%     547.67 =C2=B1  4%      +2.5%     574=
.67 =C2=B1  3%  unixbench.time.involuntary_context_switches
>      10499            -0.1%      10489            -0.0%      10496       =
 unixbench.time.maximum_resident_set_size
>      20708            +0.2%      20759            -0.2%      20676       =
 unixbench.time.minor_page_faults
>       4096            +0.0%       4096            +0.0%       4096       =
 unixbench.time.page_size
>      70.00            +0.0%      70.00            -1.4%      69.00 =C2=B1=
  3%  unixbench.time.percent_of_cpu_this_job_got
>     303.32            -0.1%     303.13            -0.2%     302.76       =
 unixbench.time.system_time
>      33.71            +0.5%      33.88            +1.0%      34.05       =
 unixbench.time.user_time
>     543.33 =C2=B1  9%      -3.2%     526.17 =C2=B1  8%      +7.0%     581=
.17 =C2=B1  9%  unixbench.time.voluntary_context_switches
>  6.604e+08            +0.2%   6.62e+08            +0.0%  6.606e+08       =
 unixbench.workload
>
>
> The unixbench score is persistent on the head of fan_pre_modify branch,
> which means the rest of the commits don't impact the score.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase:
>   gcc-11/performance/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/30=
0s/lkp-icl-2sp2/fstime/unixbench
>
> commit:
>   5b8915ed5531ff ("fanotify: introduce FAN_PRE_MODIFY permission event")
>   55b152460a1348 ("fanotify: introduce FAN_MARK_SYNC flag")
>
> 5b8915ed5531ff29 55b152460a13486e5525f2d56d0
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       3481            -0.2%       3475        unixbench.score
>     480.33            -0.0%     480.32        unixbench.time.elapsed_time
>     480.33            -0.0%     480.32        unixbench.time.elapsed_time=
.max
>     547.67 =C2=B1  4%      -2.6%     533.67 =C2=B1  2%  unixbench.time.in=
voluntary_context_switches
>      10489            +0.3%      10525        unixbench.time.maximum_resi=
dent_set_size
>      20759            +0.1%      20781        unixbench.time.minor_page_f=
aults
>       4096            +0.0%       4096        unixbench.time.page_size
>      70.00            +0.0%      70.00        unixbench.time.percent_of_c=
pu_this_job_got
>     303.13            -0.2%     302.66        unixbench.time.system_time
>      33.88            +1.1%      34.26 =C2=B1  3%  unixbench.time.user_ti=
me
>     526.17 =C2=B1  8%      +3.3%     543.67 =C2=B1  9%  unixbench.time.vo=
luntary_context_switches
>   6.62e+08            -0.2%  6.606e+08        unixbench.workload
>
>

Thank you for re-testing!
Amir.
