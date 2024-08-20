Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E327E1990B5
	for <oe-lkp@lists.linux.dev>; Tue, 20 Aug 2024 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724177934; cv=none; b=JTzi7N3Rw9qbXU0XJ4YsZMyusrjjKvamWMZuc2vIhJViQQBZId1V7XNmta8M7NUnxH50JfB5h+qsgZEbMyAN3ZxuhLp57/rxot7iiE20PpA3DtRL6RQhKzixg1ida6uS7ADvRJocmBFaangk6Bp9S9x4A4CmUhchiOXeLe+Qqq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724177934; c=relaxed/simple;
	bh=xbKL1hm8LUji4pSycHK7AbGDa+6AqEjnT3VIQpGzldI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIk5jVr+8mj6vYFev35x5IuPw1CKWKqtwMeUMZzuEX9UYUYv/f4B/ApgvEr7b02jlyj5rNtyTDhoJMMegyE5BRQgUgj7PlkeFNwKUsenbLpU6ubilSi8hl0v5/4UdxiykgmQTMrCvITFpFG9Kj/TQqYSA+c74cFRAQBqE2ozQIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CaLcqpxg; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CaLcqpxg"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-39d2cad030cso21825ab.0
        for <oe-lkp@lists.linux.dev>; Tue, 20 Aug 2024 11:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724177932; x=1724782732; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbKL1hm8LUji4pSycHK7AbGDa+6AqEjnT3VIQpGzldI=;
        b=CaLcqpxgprXzpDkVX8BZao1F+ncP/ZE+xFgTiDr0VZDxp7d4wZ6WH4pia6KnrajAz8
         ZF89hPhi3Pk5B0Vl5tg/CEPIiy8v1GKCJAt3O+N1MtzgqBLVxdIlJs9QTj0O2ecpkVyf
         wXkCCrc3p6X9kiT5IY7kIAxqX2ZAoTu+qJ7sKA/3tgMkxiEIkMwXcEWc6yGk36B9QjfW
         RENViXk5iIGJiSWU/+tHa8d+Yb0wkScnhmiO1tP4VKr1jA9Sm1MdiWt1CU1D9a/gGOqC
         nEAR9nN085FFogwd/HfCp1nX0XoVV8eiY6dFnqFl+o8csDfH2cOLzQQAJoME2h/tB/4D
         eqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724177932; x=1724782732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbKL1hm8LUji4pSycHK7AbGDa+6AqEjnT3VIQpGzldI=;
        b=sZR30KoGlFwtmgr2ECEG6eI3p0NPoxdiQ3j9mNVeEzLX5xj1Hhioh7Skq2Y3ScNXR1
         +Fmv+4D3Yo1tPDpLMc9MdBwlMOXDLzjSBhS+gL8LVxSp81EBgYQxdjA5hYKIHVFUd42c
         hkKisqhnfOwvUisZP4rAr3KJO81Xyu/TXQ0ocx86YdH84PSnb++15ud0N4ice88VrbWG
         MoOIezSy+1GMKw1fPZeqRZn0sXXARtT2CS/jH2n3TuDgSmyE5eMZib0D6UgV2l5iPTTi
         IIeU5IOq+GZgAxsjfVTXp8/aqgSULHnbfrN7yY6p7sFSSUAYsu8qea7a3T8wUOYiO00Y
         KYqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZp+48dKUnX3kWxrbnc6+o2/smdphUVKWRIvB2UAEK58iaXHOzTFXHr8R3l8HPbe/kQdnlEwo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLLuQ0TJj7N0q7jk2DrsNFoLK+nRowfUyUt4hGUFIWeKjv0DSM
	OjINSTp6cAIWXIF0C1PtMMewMuwwFMxMrdmZuUakqwCVvIih1N3QOe/Rw8QD1ubTvEOJcgNfoZP
	LG81phFHzbI49Xoqp75CMSYe4AFS40AIbCrgu
X-Google-Smtp-Source: AGHT+IFHyQEluYMRJWAbNnsPuZKmpJNRW7MSpDyr6H2EVv/MTrfNJVb1GVAtRuIvxMaCcYGoB3ZJXKLNdTyudp1Ye+Y=
X-Received: by 2002:a05:6e02:214e:b0:39d:2555:aa3e with SMTP id
 e9e14a558f8ab-39d591f9277mr2275475ab.17.1724177931659; Tue, 20 Aug 2024
 11:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJuCfpFsMjxh0kHnt4crwXRVh6_FoO=GXMwrqed-i+mFk-kmTQ@mail.gmail.com>
 <Zr2zuS5BLeJQB20e@xsang-OptiPlex-9020> <CAJuCfpHpmaJybByGoBUUVvs9k7_s0gBdOaOVG5G3OePwB66fBw@mail.gmail.com>
 <ZsQyI/087V34JoIt@xsang-OptiPlex-9020> <CAGudoHHBm8ufJ_PD9i-ANRJVFStrBbpAGKA3fmQzvZ3UT7ui9A@mail.gmail.com>
In-Reply-To: <CAGudoHHBm8ufJ_PD9i-ANRJVFStrBbpAGKA3fmQzvZ3UT7ui9A@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 20 Aug 2024 11:18:37 -0700
Message-ID: <CAJuCfpFGjV63fBcGutM=NN73D9RZJsdazy1ZBbyTEWQs=wYPgQ@mail.gmail.com>
Subject: Re: Need your help to check perf of a patch on different archs
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	kbuild test robot <lkp@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Mel Gorman <mgorman@suse.de>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lstoakes@gmail.com>, pedro.falcato@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 7:28=E2=80=AFAM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> On Tue, Aug 20, 2024 at 8:05=E2=80=AFAM Oliver Sang <oliver.sang@intel.co=
m> wrote:
> >
> > hi, Suren Baghdasaryan,
> >
> > On Thu, Aug 15, 2024 at 06:47:17AM -0700, Suren Baghdasaryan wrote:
> > > On Thu, Aug 15, 2024 at 12:52=E2=80=AFAM Oliver Sang <oliver.sang@int=
el.com> wrote:
> > > >
> > > > hi, Suren Baghdasaryan,
> > > >
> > > > On Wed, Aug 14, 2024 at 12:53:52PM -0700, Suren Baghdasaryan wrote:
> > > > > Hi Oliver and LKP folks,
> > > > > In the thread [1] Mateusz and I were investigating performance
> > > > > regression caused by adjacent cacheline prefetching when we try t=
o
> > > > > move vm_lock into vm_area_struct. Mateusz thinks that my Broadwel=
l
> > > > > machine is the reason this regression is so pronounced and other
> > > > > microarchitectures would not suffer as much. Would it be possible=
 to
> > > > > use your infrastructure to check that claim?
> > > > > In technical terms what I need is to get results of PFT (pagefaul=
t
> > > > > test) benchmark from mmtests suite [2] with and w/o the patch fro=
m [1]
> > > > > from different microarchitectures. If your infra is not setup to =
run
> > > > > PFT then any test that measures pagefault path performance would =
do.
> > > > > Please let me know if you can help me collect this data and if yo=
u
> > > > > need additional information.
> > > > > Thanks,
> > > > > Suren.
> > > > >
> > > > > [1] https://lore.kernel.org/all/20240808185949.1094891-1-mjguzik@=
gmail.com/
> > > >
> > > > what's the base? I tried to apply it upon latest mainline.
> > > > 1fb918967b56d Merge tag 'for-6.11-rc3-tag' of git://git.kernel.org/=
pub/scm/linux/kernel/git/kdave/linux
> > > >
> > > > but fail
> > >
> > > Hi Oliver,
> > > Sorry about that. I think it was applied over mm-unstable. Attaching
> > > the patch that cleanly applies over the latest Linus' ToT
> > > (1fb918967b56).
> >
> > we applied patch upon 1fb918967b56, found 9 platforms to run pft [3]
> > (unfortunately, we don't have Broadwell machine now)
> >
> > we run pft with two different configs - nr_task: 50% or 100%
> > runtime keeps as 300s
> >
> > we run 5 times for either commit.
> > the kpi for pft is 'faults_per_sec_per_cpu'
> >
> > we didn't observe obvious difference between with or without the patch.
> >
>
> Thanks for testing!

Hi Oliver,
Thanks for testing!

>
> Suren, given the result below I presume the matter of whether to put
> the lock back in is settled.

Yeah, I guess so. Although I would feel better testing on non-x86 archs.

>
> Per one of my previous messages while the patch is technically mine it
> is not in a committable state and you already had an equivalent, so
> whatever variant which lands wont be mine either and consequently no
> authorship credit is warranted. On second look I don't think
> "suggested-by" or similar is warranted either, but if you insist on
> crediting me I think it will be fine to note I mentioned the issue may
> be the adjacent cacheline prefetcher on Broadwell and it happened to
> be the case.

Ok, will do that then. Thanks!

>
> I had dealings with a 4 socket 128-way Broadwell setup some years back
> and the cacheline bouncing on it was massive, significantly worse than
> on other systems I tested.
>
> Given Broadwell's old age (and the above problem) my suggestion is to
> ditch it for something newer. I would argue the oldest uarch which
> makes sense to bench on is Skylake, but presumably you can get
> something newer no problem. fwiw given the Intel-only state at lkp I
> would argue the best way forward is to grab either a fresh-ey amd or
> arm64 cpu, preferably 4 socket.

I'll see what I can find.
Thanks for the help everyone! I'll CC you on the patch once it's ready.
Suren.

>
> On that note, Oliver:
>
> > 6. Ivy Bridge-EP (ivb)
> > model: Ivy Bridge-EP
> > nr_node: 2
> > nr_cpu: 48
> > memory: 64G
> > brand: Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz
> >
>
> May I suggest retiring Ivy Bridge? :) The answer is probably "no", but
> perhaps it would be possible for you to replace it with an arm64 box?
> if Intel is open to it I doubt there would be trouble arranging one
> for free (admittedly I would not take any part in any of it)
>
> --
> Mateusz Guzik <mjguzik gmail.com>
