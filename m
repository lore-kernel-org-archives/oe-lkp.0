Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E801847
	for <oe-lkp@lists.linux.dev>; Fri,  7 Jul 2023 04:55:53 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-44357f34e2dso563691137.3
        for <oe-lkp@lists.linux.dev>; Thu, 06 Jul 2023 21:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688705752; x=1691297752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MW2KiYUIgVekE1NSRb6z4pd6YpTBZ4cgpMpltdrRGqQ=;
        b=FxFfxI0zkT9i01KbfuBTkflz4O6jrpbfN6vn/Dk0aSUUQP/A7WT781PNnFCDiZGM39
         ap8jbRys1ZLrk7v1u/b0Ul/o75W34Db/p8qJoEitP9JaHgUtZ1bO3/Tbx7e4+k1Pwusp
         9w+ACcUoIkOx+UOT5tzNqXFzLYPTyuGoMaK3SxmaTznsflUkXBS2ZaGFH+Pu2RCI6pKa
         MXyup/HuX3jb8BIP9poJ3YLxcIJrl/YOsST3/ztbFL4tMzt4AZWsDCTefA4gxz3n/3Qq
         IrwIEjKzhrgZFJmd4nKTa5CZYAs/Ne9eDemXiOdaHHh+ive7qKRubN6DSO2eYeR019AB
         VgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688705752; x=1691297752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MW2KiYUIgVekE1NSRb6z4pd6YpTBZ4cgpMpltdrRGqQ=;
        b=SRafkhc8ZZhVfCTqx3lXrqpgS/U5BgJ92QGw4ioaYMjrCa/jE5P+HiBpuKMXMB/XaF
         N5/ZspkZRsCCDzF7cvsfMFQx/Myzl6k4a6quLg0eIQc+HCPata85dfFVnBQA55PyJGjM
         I6H/FsmwCrttDgv6h7so6cSX7HA4uq3LrclXQ4sCN+xVZjzkvOM7JOgMVB1DE2Dheoko
         X5JYDQ+Rj3lIBzwnMFO04G/XURB9DUHcBsa31dGaUrD6O6ZGhRiPnH3HW1SK+ZuZySjn
         dezUAiM+X0TEoWy7Lt5i4sGxEM7HvkZ+ZnIAmxuSQXGUzwtOYwET8gPAr8uUV81KLHMD
         v/DQ==
X-Gm-Message-State: ABy/qLaAIXrzSCPyPWtjc4CmWD5tGhaqtDwZqLijioVcuBbIHBbS+Upe
	MkwSZn1XQRFgx/F8yGsW3Fjxy8DQa9xh72tKNnQ=
X-Google-Smtp-Source: APBJJlFn3O2CqbOz40RdYoQ19Jz3kc/TqmMHEjpfx9G4GXXAfRyWRDF8Xwg8bouJ6kVdEf0sD4Gl3JYeAUeUrQWK9nE=
X-Received: by 2002:a05:6102:499:b0:443:91a7:766c with SMTP id
 n25-20020a056102049900b0044391a7766cmr1594616vsa.27.1688705752353; Thu, 06
 Jul 2023 21:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230626133142.xdcwu7akidnftrla@quack3> <CAOQ4uxhf2UkZUtrB42d=5Nti1eS3Fn_Jg7gsqNRkQVS=GWmPTQ@mail.gmail.com>
 <20230627075457.fymnpqn3vrjxjs2u@quack3> <CAOQ4uxi4KmMD0xh6Mfk-Rqb_Rwyfb0WL_yiWmonb6qQswNNG=g@mail.gmail.com>
 <ZJ5BT57HFAa52hB8@xsang-OptiPlex-9020> <CAOQ4uxgjc4eLvMtKd0yLktinZWfC_Zt9h9YjaOH5+2C9e-GLKw@mail.gmail.com>
 <ZKJ17aRBNGryOvQD@xsang-OptiPlex-9020> <CAOQ4uxh_xHTtT77+_+P3hmvFs72C=FccJVU8eWi=uK+RHtuL+g@mail.gmail.com>
 <ZKTexGQMR0Z90yPN@xsang-OptiPlex-9020> <CAOQ4uxgwDNW0SQH5snDHFqHOQAXPDNyPOuhNDb6buEreVPxQKg@mail.gmail.com>
 <ZKd9VrL/4dKApLz2@xsang-OptiPlex-9020>
In-Reply-To: <ZKd9VrL/4dKApLz2@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 7 Jul 2023 07:55:41 +0300
Message-ID: <CAOQ4uxikDagpJzXO9qrLxOAb3-k2e_j6C=-pjLfJC5QxMoj0Rw@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711: stress-ng.ramfs.ops_per_sec
 -13.0% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 7, 2023 at 5:50=E2=80=AFAM Oliver Sang <oliver.sang@intel.com> =
wrote:
>
> hi, Amir,
>
> On Wed, Jul 05, 2023 at 05:15:56PM +0300, Amir Goldstein wrote:
>
> ...
>
> > That's great :)
> >
> > Let's try sb_write_barrier-rc6:
> >
> > * ec6062fa6287 - (sb_write_barrier-rc6) vfs: prepare for pre-modify
> > permission events on aio write
> > * c0499c6ccdb7 - vfs: prepare for pre-modify permission events on write
> > * 0bc594342542 - vfs: add srcu variants for mnt_{want,drop}_write() hel=
pers
> > * 286af98e1d76 - fanotify: activate sb write barriers for pre-modify
> > event watchers
> > * 90a5c1147030 - vfs: implement 'vfs write barriers'
> >
> > Changes since sb_write_barrier-rc5:
> > - Removed the "fsnotify: optimize ..." patch - I don't think it is need=
ed
> > - s_write_srcu is allocated lazily on first activation
> > - safe activate/cleanup of s_write_srcu (hopefully)
> >
> > IOW, rc6 could be the final version if it passes the performance
> > regression test.
>
> we confirmed there is no regression by this sb_write_barrier-rc6 branch:
>
> commit:
>   81c0fe022bd6e (amir73il/fan_pre_access) fanotify: report file range inf=
o with FAN_PRE_ACCESSS event
>   f7adc6e4bdc0c fsnotify: define flag for pre-modify permission events
>   90a5c1147030d vfs: implement 'vfs write barriers'
>   ec6062fa62872 (amir73il/sb_write_barrier-rc6, amir73il/sb_write_barrier=
) vfs: prepare for pre-modify permission events on aio write
>
> 81c0fe022bd6ebae f7adc6e4bdc0cfbd1c970a8455c 90a5c1147030dfbc24dd96267ba =
ec6062fa62872cdd2c8d8a0658d
> ---------------- --------------------------- --------------------------- =
---------------------------
>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev
>              \          |                \          |                \   =
       |                \
>    1445389            +0.5%    1453256            +0.7%    1456049       =
     +0.2%    1448979        stress-ng.ramfs.ops
>      24089            +0.5%      24220            +0.7%      24267       =
     +0.2%      24149        stress-ng.ramfs.ops_per_sec
>
> detail data is attached as sb_write_barrier-rc6-tip-ec6062fa62872
>

Thank you!

Nipping the regression before they are merged is super helpful
but it has the unfortunate side effect of fewer Reported-by credits
to kernel test robot.

I would like to give you credit for testing the 'vfs write barriers' commit
if that is ok with you, like this?

Tested-by: kernel test robot <oliver.sang@intel.com>
Link: https://lore.kernel.org/oe-lkp/202306192245.d77d7216-oliver.sang@inte=
l.com

Maybe consider adding a recommendation of how to tag a new
version of patch that the kernel test bot helped to improve?

Cheers,
Amir.
