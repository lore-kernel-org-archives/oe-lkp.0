Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A9079EA
	for <oe-lkp@lists.linux.dev>; Wed,  5 Jul 2023 14:16:08 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-791b8500a1dso1670797241.1
        for <oe-lkp@lists.linux.dev>; Wed, 05 Jul 2023 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688566567; x=1691158567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vzc41jNIq/WZREvFh6Y8mjNXhrQO1XADNZiDOsR6Oc=;
        b=gEvHgTtylOs8Q9AnMlpj0th1hnU94A3sWYymrSYRN94MNNKBTXKt3PQV+nHQ5m3tG5
         Tmw38FkbwRuD/wCfTraEmMxltr1v4d2Ly667yUlBsnATjINcLPGK1p3jF2kmP7A87oSn
         uFvSS67DoZE30zTKYjn5wWUYUZ4Y5YJOUgNyD/I4wxLIAYVZXqOSTwF1qCfTpzkMGKpD
         4vELtJevQOgUErJFb70M1b+XDg2SckpGWmRuuJ5gEW9Aux+9qZlXO9t8+psqPOUVNH56
         3tqJR97uNQUCM8yBZYlpYr0Uvs83116cI3tfd/A/HiPlz0W6YfUGfELW4pXb+VQpGBjp
         dkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688566567; x=1691158567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vzc41jNIq/WZREvFh6Y8mjNXhrQO1XADNZiDOsR6Oc=;
        b=DsVzq16zVIzoN3u18wlYiQNOWR+DCg++HAYDKia5ycAHbB6Cq7I/LdrkkE6YIInCkk
         je/eSs5yvQorKXxlQgEJuUX7NcsyXkJB7nCxoG2amqCpW0Ctf1cvXajOapW74tE8VAt0
         W4eRslEGKlPOZWGjlNTkJkNjIc2V9yh5B44LUtZw46k05aCYM9DCIssz01x6LtTM733q
         GRnq4SPBuVRLIUlhL9/qELuAl6/HZyZl617wWDUGtCrwTyxH3pe7NHORQXh9Sr0GuYnU
         as4DI9oNt80lZzRwOzz2IYQmckR1fJ3G3KK23luf2sUmWbP4iEhUwhiVHWXdQAx69Ctp
         ZhPA==
X-Gm-Message-State: ABy/qLbw6bJqyZj/6dDYw2LOUnKlTsMMTuReGOZ+JatzQ/LZbDEJy4AQ
	cKH5ZMgfHQYCLihLv+w0w6SyGtpD3t8eLAAo1ew=
X-Google-Smtp-Source: APBJJlHPJBiuwoAQKIFqxymhYEA1jsrAuS86EZgjPgahi6amawePmvTzGhq51Qx5NAaDzngZMuAjMpF0EjrHp1HwHjU=
X-Received: by 2002:a67:b14b:0:b0:43f:4af8:d39d with SMTP id
 z11-20020a67b14b000000b0043f4af8d39dmr5175565vsl.4.1688566567404; Wed, 05 Jul
 2023 07:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZJWwrHozI2GkRnJ6@xsang-OptiPlex-9020> <CAOQ4uxg8rr-uHUo62nrZzfp14UpNAz1K9YxyaAq7D2ggAFLHMg@mail.gmail.com>
 <20230626133142.xdcwu7akidnftrla@quack3> <CAOQ4uxhf2UkZUtrB42d=5Nti1eS3Fn_Jg7gsqNRkQVS=GWmPTQ@mail.gmail.com>
 <20230627075457.fymnpqn3vrjxjs2u@quack3> <CAOQ4uxi4KmMD0xh6Mfk-Rqb_Rwyfb0WL_yiWmonb6qQswNNG=g@mail.gmail.com>
 <ZJ5BT57HFAa52hB8@xsang-OptiPlex-9020> <CAOQ4uxgjc4eLvMtKd0yLktinZWfC_Zt9h9YjaOH5+2C9e-GLKw@mail.gmail.com>
 <ZKJ17aRBNGryOvQD@xsang-OptiPlex-9020> <CAOQ4uxh_xHTtT77+_+P3hmvFs72C=FccJVU8eWi=uK+RHtuL+g@mail.gmail.com>
 <ZKTexGQMR0Z90yPN@xsang-OptiPlex-9020>
In-Reply-To: <ZKTexGQMR0Z90yPN@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 5 Jul 2023 17:15:56 +0300
Message-ID: <CAOQ4uxgwDNW0SQH5snDHFqHOQAXPDNyPOuhNDb6buEreVPxQKg@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711: stress-ng.ramfs.ops_per_sec
 -13.0% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 5, 2023 at 6:09=E2=80=AFAM Oliver Sang <oliver.sang@intel.com> =
wrote:
>
> hi, Amir,
>
> On Mon, Jul 03, 2023 at 06:09:43PM +0300, Amir Goldstein wrote:
>
> ...
>
> > >
> >
> > Excellent! We have finally made progress :)
> > I've pushed this branch to sb_write_barrier-rc4 for future reference.
> >
> > I now also realize that stress-ng exercises fanotify permission events.
> > I was under the wrong impression that the patches are hurting performan=
ce
> > of workloads that do not include fanotify permission event watchers.
> >
> > The optimization patches
> > "fsnotify: optimize the case of no permission event watchers" and
> > "fsnotify: activate sb write barriers for permission event watchers"
> > are therefore not effective with this workload.
> >
> > sb_write_barrier() is not needed for the legacy fanotify permission eve=
nts,
> > so I've changed the optimization patches to activate sb_write_barrier()
> > only for the new pre-modify event, which stress-ng is not aware of.
> >
> > I also deferred init_srcu_struct() to sb_write_barrier_activate(), whic=
h is
> > not expected to happen in this workload at all.
> >
> > The code is not fully correct, not checking error from init_srcu_struct=
()
> > and possibly needs synchronize_srcu() before cleanup_srcu_struct(),
> > but for the purpose of checking performance regressions for existing
> > workloads that do not use the new events, that should suffice.
> >
> > I pushed these changes to branch sb_write_barrier-rc5:
> >
> > * 18ab3ccc03f8 - (sb_write_barrier-rc5) vfs: prepare for pre-modify
> > permission events on aio write
> > * a6375febb518 - vfs: prepare for pre-modify permission events on write
> > * d4d8be7b9987 - vfs: add srcu variants for mnt_{want,drop}_write() hel=
pers
> > * 92f4fe8a0643 - fsnotify: activate sb write barriers for pre-modify
> > event watchers
> > * 9de2ba3f2757 - vfs: implement 'vfs write barriers'
> > * 925188d1c20d - fsnotify: optimize the case of no pre-modify event wat=
chers
> >
> > Oliver,
> >
> > If you can re-test once again, that would be great.
> > Sorry that this is taking so long and thanks for your patience.
>
> always our pleasure :)
>
> by new branch, we noticed the regression gone
> (I only list the branch base 81c0fe022bd6ebae,
> "vfs: implement 'vfs write barriers'" and its parent, and the branch tip,
> details are as attached, if you need data for other commits, please let
> me know, thanks):
>
> 81c0fe022bd6ebae 925188d1c20dde0a5c241100514 9de2ba3f275796bdad641b214a8 =
18ab3ccc03f835ae3f1fb1f5d98
> ---------------- --------------------------- --------------------------- =
---------------------------
>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev
>              \          |                \          |                \   =
       |                \
>    1445389            +0.1%    1447167            +1.0%    1460309       =
     -0.3%    1440392        stress-ng.ramfs.ops
>      24089            +0.1%      24119            +1.0%      24338       =
     -0.3%      24006        stress-ng.ramfs.ops_per_sec
>
> meminfo side:
>
>      17896            +0.2%      17935            +0.1%      17914       =
     -0.2%      17868        meminfo.Percpu
>      93922            +0.3%      94175            +0.5%      94388       =
     +0.6%      94531        meminfo.SUnreclaim
>     190672            +0.2%     191020            +0.4%     191360       =
     +0.5%     191608        meminfo.Slab
>      20651            +0.2%      20683            +0.1%      20664       =
     +0.1%      20665        meminfo.VmallocUsed
>

That's great :)

Let's try sb_write_barrier-rc6:

* ec6062fa6287 - (sb_write_barrier-rc6) vfs: prepare for pre-modify
permission events on aio write
* c0499c6ccdb7 - vfs: prepare for pre-modify permission events on write
* 0bc594342542 - vfs: add srcu variants for mnt_{want,drop}_write() helpers
* 286af98e1d76 - fanotify: activate sb write barriers for pre-modify
event watchers
* 90a5c1147030 - vfs: implement 'vfs write barriers'

Changes since sb_write_barrier-rc5:
- Removed the "fsnotify: optimize ..." patch - I don't think it is needed
- s_write_srcu is allocated lazily on first activation
- safe activate/cleanup of s_write_srcu (hopefully)

IOW, rc6 could be the final version if it passes the performance
regression test.

Thanks,
Amir.
