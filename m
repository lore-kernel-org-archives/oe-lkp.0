Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27EB13ADA
	for <oe-lkp@lists.linux.dev>; Fri,  5 Jul 2024 05:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158523; cv=none; b=nyjXWOY1sI+kNemY5jHE5U8az/u/o5/NYGSw+kw3/TLBX8DyRYZ0L+yLA5b46JAydVk9LA8PTvzlwl6i1r3FTBBW9ta+xgRVmiNkVF1rlujciX6hfpw4AKYJqoHB97qrBY4Ipq1+E4GW+YQXp2YER52nrsrBgh7v2WDEA343zU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158523; c=relaxed/simple;
	bh=KyZKvZLrZeKa19Y77xRg9VVnpaDfGqtvTrh+ha8KDBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lu2VqzYGL70EYNoQjOgOBsCSyMrDGcPB64qfLNWmMCXvucatc4rxCuskAftTYxR0kG/Txu11IgJqB3RP9krZlIV1BWmC4+JdQIlTkPK33vRug9cM7rtpcQuXoTjnZAEubTMx6V56dSoirU+wGZcbs5X+GINXYP+207LkXCEbDoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RN4/S+3U; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RN4/S+3U"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-44634afb2e7so10571441cf.1
        for <oe-lkp@lists.linux.dev>; Thu, 04 Jul 2024 22:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720158521; x=1720763321; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4xOYpRxQ7VXHGVZWfNkLlVOUpk0/F7EOJ8PMIKzBHs=;
        b=RN4/S+3UVCOi1XA/jv+lSkwZLEfdxsmlP96ojJHcqz08qXKCSE89n59WWMFb3G3zjm
         lGxF9wNSD6RrfpA2oJ20XBL1BtMjnQOfzVGFjFIKo/cOg6jtwXZPAMtxyXh8kw/B2STz
         b+Fdx1wfMDHpDrY9uUufCTDZPrtgr+yMF0cWiKft9eDNJ/CFRLJ/3xOKMfjD3xeveQun
         eDSzeUor5bQHik9JwA2nPkAv2NsFYOYF+FrRjlwmSSC+H4rBOI0FlbKQ1ELpGbH/lB9j
         OpiwvDdaJve7XpDQMyoBSDsZxLxwk5yO0AfiM2cwBKIuRpXFhj0xEHTW5TzUiYK3dYPh
         +3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720158521; x=1720763321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4xOYpRxQ7VXHGVZWfNkLlVOUpk0/F7EOJ8PMIKzBHs=;
        b=eF0cv0bua1CsSfMmMJ04KK6IUYVspFO/f5TdAHxlF04nc67ycLdh+rGSmhoEty2YzS
         SxQT/JKci1dDYTFPaxC3Er2WkP/vgLtCl8VOaoWNOINnE/ajyI1hDOUeL4WN9cpRqeWz
         bIsQ0AvNmhlv/QkkMx+BF7OzMdjsEAw0mzZgpJ+yvJ2s/Hg1QSEhtn+/Ra+O8qeeC4oo
         Vo+QLPp47segBFrQKv/cvD+Q/d6vrON48dxBkmIEDinJbBn7vFr5W6RIvf/1syFuwIFp
         On3TSYp9jD4OX9UuA1j6M6onuwtaVS6nPd6zOgsa1U0+t9aI7B6ppl5dRdnxkUvcjPOy
         9Sfw==
X-Forwarded-Encrypted: i=1; AJvYcCWjvg/UxU4L//I6uspfdP87LhuLOIqVpFHM7IIy4tMAi84RZ7jZPqbZ4NLtZJgjR7abWb3k8MmOcZA8ZPel8aZu2GbLh6Pm
X-Gm-Message-State: AOJu0YxwykP3IxOtHHv8DKozcg8pxmJFLZkblUIvdr4Qdv5HDCc/BqA3
	RBuUE2/bVcMmLrzaNtI4qlWJTIVnoHgHtcniamITbVhQGXKZ6q3wmpU0NlE/eEjK15GfqZCmP4V
	y3yEPL22Lg54FFkYjujK2+fMcX2U=
X-Google-Smtp-Source: AGHT+IG6WyMG+AhflAx4NFy0TgOE8CT9fGeqQDx5NlhnIr8gZ1RYJh2KyPbQm8u3/gD/hdstZgLl7Q7ubgujJR8nj4E=
X-Received: by 2002:ac8:7f42:0:b0:445:32b:df03 with SMTP id
 d75a77b69052e-447cbf3cc92mr43696691cf.33.1720158520507; Thu, 04 Jul 2024
 22:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405291640.2016ebfe-oliver.sang@intel.com> <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
 <ZllA260+kaBSKrPD@xsang-OptiPlex-9020> <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020> <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
 <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020> <CAOQ4uxhsdiR_CtYxu4FchWVCO6OpzkdtQksJrzsehhXeG2gp1w@mail.gmail.com>
 <ZoT78AZAoscvNZTv@xsang-OptiPlex-9020> <CAOQ4uxgk1mGf20=XVkJ6x-YTPaoww6d=v-ViD4Espu7EE+yQcg@mail.gmail.com>
 <ZodVyZd2esYH/tFu@xsang-OptiPlex-9020>
In-Reply-To: <ZodVyZd2esYH/tFu@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 5 Jul 2024 08:48:28 +0300
Message-ID: <CAOQ4uxitXLvHgug08zbYRgyy+wNnd_aw8Kr1zcFWwsRLeFf7SA@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 5:09=E2=80=AFAM Oliver Sang <oliver.sang@intel.com> =
wrote:
>
> hi, Amir,
>
> On Wed, Jul 03, 2024 at 07:20:49PM +0300, Amir Goldstein wrote:
>
> [...]
>
> > > the data in our tests seem quite stable for a commit, such like for v=
6.10-rc1:
> > >   "unixbench.throughput": [
> > >     121545292.8,
> > >     121629889.4,
> > >     121598992.0,
> > >     121492095.5,
> > >     121645038.1,
> > >     121556286.9
> > >   ],
> > >
> >
> > Are all those runs from the same boot?
>
> no. we reboot machine before each run.
>
> >
> > > for the branch tip a82fd282befc7:
> > >   "unixbench.throughput": [
> > >     116675606.7,
> > >     116840611.2,
> > >     116738966.0,
> > >     116956953.1,
> > >     116704901.9,
> > >     116997628.3,
> > >     117141733.7,
> > >     116660495.4
> > >   ],
> > >
> >
> > And these run?
>
> same.
>
> >
> > Otherwise, we might have a fluctuation that happens at boot time
> > or at mount time or something.
> >
> > >
> > > let me combine the results from this branch together:
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/t=
est/testcase:
> > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.c=
gz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > >
> > > commit:
> > >   v6.10-rc1
> > >   68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
> > >   94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
> > >   64108c0b47db9 fanotify: pass optional file access range in pre-cont=
ent event
> > >   a82fd282befc7 fanotify: report file range info with pre-content
> > >
> > >        v6.10-rc1 68e04c2451ba03a18ccb1192890 94167e071109d573a5fc1ff3=
061 64108c0b47db91b20d658a89969 a82fd282befc71d99106bf31066
> > > ---------------- --------------------------- ------------------------=
--- --------------------------- ---------------------------
> > >          %stddev     %change         %stddev     %change         %std=
dev     %change         %stddev     %change         %stddev
> > >              \          |                \          |                =
\          |                \          |                \
> > >  1.216e+08            -3.5%  1.174e+08            -4.3%  1.163e+08   =
         -6.6%  1.135e+08            -3.9%  1.168e+08        unixbench.thro=
ughput
> > >
> > >
> > > one thing I want to mention is the "%change" is always comparing to t=
he first
> > > column (v6.10-rc1 here). so 68e04c2451ba0 has a -3.5% regression comp=
aring to
> > > v6.10-rc1; 94167e071109d has a -4.3% regression also comparing to v6.=
10-rc1,
> > > and so on.
> >
> > Thanks for clarifying - I did not read it this way.
> >
> > >
> > > then if just comparing 94167e071109d and 64108c0b47db9, 64108c0b47db9=
 has about
> > > -2.4% regression compareing to 94167e071109d.
> > >
> > > from above table, along the branch, the performance is kind of fluctu=
ating,
> > > dropped most on 64108c0b47db9, but then recovered a little on tip.
> > >
> >
> > I can understand why 64108c0b47db91b would regress performance, but I
> > cannot think
> > of any possible explanation why a82fd282befc should improve performance=
,
> > so I have to wonder if the regression to -6.6% is not a fluke of some
> > specific boot/mount?
> >
> > I pushed a test branch to
> > https://github.com/amir73il/linux/commits/fsnotify_for_lkp
> > with an extra patch that un-inlines some helpers to help bisect the
> > perf report better.
> > Maybe produce the report with this commit and it sheds some light.
>
> since
>
> * 388baed2ddef7 (amir73il/fsnotify_for_lkp) fsnotify: un-inline fsnotify =
helpers
> * a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file range in=
fo with pre-content events
> * f301cd18006c3 fanotify: rename a misnamed constant
> * 64108c0b47db9 fanotify: pass optional file access range in pre-content =
event
> * 94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
> * 68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
> * 83af0c89527ab fsnotify: generate pre-content permission event on exec
> * aca4084213276 fsnotify: generate pre-content permission event on open
> * 93656e196b006 fsnotify: introduce pre-content permission event
> * 1613e604df0cd (tag: v6.10-rc1,
>
> we run tests upon new commit. summary report is as below:
>
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
>   a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file range in=
fo with pre-content events
>   388baed2ddef7 (amir73il/fsnotify_for_lkp) fsnotify: un-inline fsnotify =
helpers
>
>        v6.10-rc1 a82fd282befc71d99106bf31066 388baed2ddef701fe2f07ea0360
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>  1.216e+08            -3.9%  1.168e+08            -4.1%  1.166e+08       =
 unixbench.throughput
>:
>
> since Jan mentioned in a later mail that perf profiles are useful, I put =
details
> as below

Thanks.
That clarifies that the cycles are spent in the "optimization code" itself.

I pushed a new version to the fsnotify_for_lkp branch with a possible fix c=
ommit
at the base of the branch.

Hopefully, with this fix, the compiler will be able to optimize smarter and
the generated fast path code will be less sensitive to code alignment ???

If it works, it may eliminate some of the regressions throughout this branc=
h and
may also improve the stress-ng regression that you reported on v6.10-rc1 [1=
].

* e0aaae806edc - (fsnotify_for_lkp) fanotify: report file range info
with pre-content events
* a28c32866bb3 - fanotify: rename a misnamed constant
* 61baabbdceaa - fanotify: pass optional file access range in pre-content e=
vent
* 72e76d909afd - fanotify: introduce FAN_PRE_MODIFY permission event
* 1c71a12ff3ce - fanotify: introduce FAN_PRE_ACCESS permission event
* 38a903de931a - fsnotify: generate pre-content permission event on exec
* 70be29706389 - fsnotify: generate pre-content permission event on open
* 96768b7d6721 - fsnotify: introduce pre-content permission event
* 28d5b4a88241 - fsnotify: avoid multiple fsnotify_sb_info() access in
permission hooks

Fingers crossed...

Thanks,
Amir.

[1] https://lore.kernel.org/all/202404101624.85684be8-oliver.sang@intel.com=
/
