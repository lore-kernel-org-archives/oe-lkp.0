Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DE41917F3
	for <oe-lkp@lists.linux.dev>; Tue, 20 Aug 2024 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724164125; cv=none; b=As4gA7ga5jx1EP6ZOD3SeszroGu3BWvZI466mPsj/aqYHP29xl2DVvMQtlOFMbFX+3djQUaF3DvDpk4qMVhMauRKKUYoBzh0N491KgVNcYafqM7thqmcnoa9aoLAQeZIu4Rk4yu8zU3skJ/3CPo7k193i77ZAf6O9g/3JLtEQc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724164125; c=relaxed/simple;
	bh=ZG04avZc7BTUfE1X3TEPn9G5pZc73Dv0EPNY9/SDKkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjAQ3JfiUZ/n8scebSPfOLhO2rFQ1DNGPm1v1stnVnn7SeIkM9eXBvPiLgoq9nO+lR8RSIKJdZ/g74kDHqHxFC/Br5IBMXltvE3JFO/TpY0/5JzE5A3DEjypb3coFYS99gwQ6FaUZYNDRfh4M2f+GxOaR5qY/bR27mVdWDN+hDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPv6KCPq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPv6KCPq"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7aa4ca9d72so725157866b.0
        for <oe-lkp@lists.linux.dev>; Tue, 20 Aug 2024 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164121; x=1724768921; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZG04avZc7BTUfE1X3TEPn9G5pZc73Dv0EPNY9/SDKkI=;
        b=UPv6KCPqXzEE0PvE8WsnMblFn/JNBaS3mJljQFaQpLdNzE6FbpdbqROG16ZqYfbQ/s
         zaX9ZFGdZwLc9sWJBxwGQRXjONU/P4B9UATa/Tp3iEU5Q2w6okCtwl1TQP/o6KpsVjHH
         w1//nFwTPCY+4LopQJlbGGu++bRC4hWrtydvp7u/ZeiJKvqzWLoaRKAM4aZbuTcUFG0B
         c2+YyyLHfcYlI9tLWBGiv9eZiacq0ihyIDBIYC1bvcBfXuILh3j3kb/dSkw9rr4jhBPl
         4tcEjPJmUwLQwQZcDHq5cWvcbo2DSrkqbzpdZp5NP9Rte71cXRNrIUtoUokhzzqF2fqr
         4lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164121; x=1724768921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZG04avZc7BTUfE1X3TEPn9G5pZc73Dv0EPNY9/SDKkI=;
        b=Qel3bjeJbEzkDY/7cMuinx/y2R5ieQLMNLkrh+FmnhwgvfvUBr5BoTwLl+m6Of/f2g
         znFvoMjRXG/jYDXYe+hu7Ewvrk0BByfuNx078utrxmxio6mhvW9U9eTt73WIDFsAwd4K
         yaf4dO5mDb/Je6CHlPcTjfku1hUU2AhPPhhTiZxLV6x5gTsH+Vmn4dUjE9HqZxE80pbB
         c5S+TSbQ9iToIA5SZjBjk5w154KDczm/I1F53RmtarJBv8BK1xKmx6hDPdvLjZ12dWGY
         rI31WtbAfvdxwRAybd8AHgBD1/Djk860R6BjVaHwDw5JRvUjaEBk79bkiDBDrRGB180w
         i5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWqNRicUEmpHllyvrNQ1+ltIG1MblwuwOK+mbrnOlLQVLBJJXJFy76hwU/H0vsb7xmMUoaHlqo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzVn4HETrlm3SKWtfBH9T273gAShlNbXtphSQ8kKVGT/H89nKD
	NR6lsqIXdS7DyuTBYLi+MF7j2KbtubK2guRcnaEl928NUXTNSs4QmFkbv/559c1pQUC3WYyxWnh
	AL2Syno8e1DIwnL7NIFnr+4kWZls=
X-Google-Smtp-Source: AGHT+IH5BLe/b6qwC8eDUAUgekSeQo6beS9hkcSRUg0LvnG+XFfzaap0yK/51pZDZE4ztAQJU2uLdvsGrBFUtM5MuNI=
X-Received: by 2002:a17:907:d2d3:b0:a7a:84f8:eaef with SMTP id
 a640c23a62f3a-a83929547b0mr1122069166b.35.1724164121194; Tue, 20 Aug 2024
 07:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJuCfpFsMjxh0kHnt4crwXRVh6_FoO=GXMwrqed-i+mFk-kmTQ@mail.gmail.com>
 <Zr2zuS5BLeJQB20e@xsang-OptiPlex-9020> <CAJuCfpHpmaJybByGoBUUVvs9k7_s0gBdOaOVG5G3OePwB66fBw@mail.gmail.com>
 <ZsQyI/087V34JoIt@xsang-OptiPlex-9020>
In-Reply-To: <ZsQyI/087V34JoIt@xsang-OptiPlex-9020>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 20 Aug 2024 16:28:29 +0200
Message-ID: <CAGudoHHBm8ufJ_PD9i-ANRJVFStrBbpAGKA3fmQzvZ3UT7ui9A@mail.gmail.com>
Subject: Re: Need your help to check perf of a patch on different archs
To: Oliver Sang <oliver.sang@intel.com>
Cc: Suren Baghdasaryan <surenb@google.com>, oe-lkp@lists.linux.dev, 
	kbuild test robot <lkp@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Mel Gorman <mgorman@suse.de>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lstoakes@gmail.com>, pedro.falcato@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 8:05=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Suren Baghdasaryan,
>
> On Thu, Aug 15, 2024 at 06:47:17AM -0700, Suren Baghdasaryan wrote:
> > On Thu, Aug 15, 2024 at 12:52=E2=80=AFAM Oliver Sang <oliver.sang@intel=
.com> wrote:
> > >
> > > hi, Suren Baghdasaryan,
> > >
> > > On Wed, Aug 14, 2024 at 12:53:52PM -0700, Suren Baghdasaryan wrote:
> > > > Hi Oliver and LKP folks,
> > > > In the thread [1] Mateusz and I were investigating performance
> > > > regression caused by adjacent cacheline prefetching when we try to
> > > > move vm_lock into vm_area_struct. Mateusz thinks that my Broadwell
> > > > machine is the reason this regression is so pronounced and other
> > > > microarchitectures would not suffer as much. Would it be possible t=
o
> > > > use your infrastructure to check that claim?
> > > > In technical terms what I need is to get results of PFT (pagefault
> > > > test) benchmark from mmtests suite [2] with and w/o the patch from =
[1]
> > > > from different microarchitectures. If your infra is not setup to ru=
n
> > > > PFT then any test that measures pagefault path performance would do=
.
> > > > Please let me know if you can help me collect this data and if you
> > > > need additional information.
> > > > Thanks,
> > > > Suren.
> > > >
> > > > [1] https://lore.kernel.org/all/20240808185949.1094891-1-mjguzik@gm=
ail.com/
> > >
> > > what's the base? I tried to apply it upon latest mainline.
> > > 1fb918967b56d Merge tag 'for-6.11-rc3-tag' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/kdave/linux
> > >
> > > but fail
> >
> > Hi Oliver,
> > Sorry about that. I think it was applied over mm-unstable. Attaching
> > the patch that cleanly applies over the latest Linus' ToT
> > (1fb918967b56).
>
> we applied patch upon 1fb918967b56, found 9 platforms to run pft [3]
> (unfortunately, we don't have Broadwell machine now)
>
> we run pft with two different configs - nr_task: 50% or 100%
> runtime keeps as 300s
>
> we run 5 times for either commit.
> the kpi for pft is 'faults_per_sec_per_cpu'
>
> we didn't observe obvious difference between with or without the patch.
>

Thanks for testing!

Suren, given the result below I presume the matter of whether to put
the lock back in is settled.

Per one of my previous messages while the patch is technically mine it
is not in a committable state and you already had an equivalent, so
whatever variant which lands wont be mine either and consequently no
authorship credit is warranted. On second look I don't think
"suggested-by" or similar is warranted either, but if you insist on
crediting me I think it will be fine to note I mentioned the issue may
be the adjacent cacheline prefetcher on Broadwell and it happened to
be the case.

I had dealings with a 4 socket 128-way Broadwell setup some years back
and the cacheline bouncing on it was massive, significantly worse than
on other systems I tested.

Given Broadwell's old age (and the above problem) my suggestion is to
ditch it for something newer. I would argue the oldest uarch which
makes sense to bench on is Skylake, but presumably you can get
something newer no problem. fwiw given the Intel-only state at lkp I
would argue the best way forward is to grab either a fresh-ey amd or
arm64 cpu, preferably 4 socket.

On that note, Oliver:

> 6. Ivy Bridge-EP (ivb)
> model: Ivy Bridge-EP
> nr_node: 2
> nr_cpu: 48
> memory: 64G
> brand: Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz
>

May I suggest retiring Ivy Bridge? :) The answer is probably "no", but
perhaps it would be possible for you to replace it with an arm64 box?
if Intel is open to it I doubt there would be trouble arranging one
for free (admittedly I would not take any part in any of it)

--=20
Mateusz Guzik <mjguzik gmail.com>
