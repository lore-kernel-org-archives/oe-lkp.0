Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B5C19DF4B
	for <oe-lkp@lists.linux.dev>; Mon,  9 Dec 2024 22:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733782821; cv=none; b=erWoEyhiGR1AaLo+pwrHc3oXMjsd4i6u/UwwYcAWb820va5AHEbQ/E9zSjJ1nHqDPrdOPPeL42gEshKGyE8MuhIrfRfTFYJPjfaNpt2aZy5MgB4wKcGtMUikzBO8Nmsvhfbi9Wt4rOQlUSUZsETm+8RwhFtS5R6hfQCYHTdyAVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733782821; c=relaxed/simple;
	bh=1CyMiD1T7cKwXyRcB9MbtDMbGuOgfuGFBLkRucfdvnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEPtgoAxxjXk399ip0ah8GanXxyxRkTwREIMQM809cbXusK6oZG/vp9AXjPJHIfl1odTmMRJNa7JYFIPm/G4tCHiPwA7iTA06T2/S6ruYKxGFPOIu4djnkscXy0LnwBUr2ZZSbQ5k3+zTiL2tBBIGzijcgwtP204PsPYtGrSROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sdyBGQF5; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sdyBGQF5"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4674c22c4afso49991cf.1
        for <oe-lkp@lists.linux.dev>; Mon, 09 Dec 2024 14:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733782818; x=1734387618; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5ww+FYyUuj9YZJs8l84tdzGI5HsRlAlNX8jCX6t2Ww=;
        b=sdyBGQF5svD26P3EKQbK2tQxSPUFLeYVzraBZ5GkU7aGoPjG22rTS+ejwREVp6MoBQ
         emXA0ChpU9thdUGSiQXVoi+dbrU1tddIiWKURs5ncAVnHblUycKVtI8VKEbyFLa5gZ/E
         UU0vaZmVibbZoYRv/x7q7cTcZBFBQxPE1srr88hcw599XNo8ITq26Fcs3CQzPVJg0jTb
         49HBUvc8zX7XKZC2D0PxzHUDUn2LKK2drrd58NePfmBQSSSwLJiXlqulOOB241fVewvV
         phbycURRlel+IsNVi5mHmtEh4QAdgeRMhkMTm/BDvxKD2QOOaB5qfYXlS6vzxrQO7jEp
         kUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733782818; x=1734387618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5ww+FYyUuj9YZJs8l84tdzGI5HsRlAlNX8jCX6t2Ww=;
        b=NnXM3Ley0D9Fm6GsLpSClxBCJAnDvYybpRPjKsRQZlxjHYZQiyf10o4OfDotlNhqW/
         G4wM/JdiXsyG/JUIl2UEiOXBnmiS+v8HzPn5JxsoOJAK2QQ2wsUrsegszPcBhysDl5OY
         XM0C0OtA2gNc6yAh7xfBhSy0EFPpt6fZfeH817IwmN/1X7SlSeqH5NCLkVaAPRIWJ6NN
         szZAkG6Y7fl79fqhCnCWany/1iFbk7GCCPvyxizeenofW7Eficw/6makccFBZHAczovb
         AFBQ+Z7fNEXN32hdEh0u/aQ9aHEOJihPwJiDhOQay6MlwAZZrcbVxXFG4nAo357HApuJ
         II4w==
X-Gm-Message-State: AOJu0Yx5HtuMn7q0NGVONjq4LJiXmrZM/OxCgmkkRfMNlkEpliCEhkuC
	6qdsYxXYEEJlVdDnRzLSNG5p3pp9HE0tmeDueynRfwTBZ2HcXYZfHgjkL7YiIDUKegcYePCW3fY
	s6OWQt458iclOIKB9gmdsL+y5nVQ/RMRLgmCX
X-Gm-Gg: ASbGnctrkX9EyiBQi0pd+9XnpRsNRYHBFfY/q6HjNJZjm8Aj3Pf6ZizNgVpAxiB4c95
	GYzgiLBj5o1CIpBhEsLvIjjmIcgIGWSStWc4=
X-Google-Smtp-Source: AGHT+IH78nTZ9DcmfapbaIU0Acq1Wlfjtc8axM0AHL8eeXBJQHPQKkL1IIhm/4+T2pbRn6gYSgwQZH6j6Df8/mVUYBA=
X-Received: by 2002:a05:622a:550a:b0:466:861a:f633 with SMTP id
 d75a77b69052e-4677757cac6mr198391cf.5.1733782817959; Mon, 09 Dec 2024
 14:20:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412082208.db1fb2c9-lkp@intel.com> <CAJuCfpGeKgOgqq69OD-TMoQLhyy+HuTKK=cQPHMY2DgNcJf5Xg@mail.gmail.com>
 <Z1Z5FbBHojF6ywfA@xsang-OptiPlex-9020>
In-Reply-To: <Z1Z5FbBHojF6ywfA@xsang-OptiPlex-9020>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 9 Dec 2024 14:20:07 -0800
Message-ID: <CAJuCfpGqauvtrVVqrf8ge7ba=AB3Jk7daRDdqYzOSxpB462i0w@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable] [mm] 85ad413389: BUG:kernel_NULL_pointer_dereference,address
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@redhat.com>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Hillf Danton <hdanton@sina.com>, Hugh Dickins <hughd@google.com>, 
	Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
	Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@suse.com>, 
	Minchan Kim <minchan@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Sourav Panda <souravpanda@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 8, 2024 at 8:59=E2=80=AFPM Oliver Sang <oliver.sang@intel.com> =
wrote:
>
> hi, Suren Baghdasaryan,
>
> On Sun, Dec 08, 2024 at 06:09:05PM -0800, Suren Baghdasaryan wrote:
> > On Sun, Dec 8, 2024 at 7:26=E2=80=AFAM kernel test robot <oliver.sang@i=
ntel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,addres=
s" on:
> > >
> > > commit: 85ad413389aec04cfaaba043caa8128b76c6e491 ("mm: make vma cache=
 SLAB_TYPESAFE_BY_RCU")
> > > https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-unstable
> > >
> > > in testcase: boot
> > >
> > > config: i386-randconfig-141-20241208
> > > compiler: gcc-11
> > > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 16G
> > >
> > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > >
> > >
> > > +------------------------------------------------+------------+------=
------+
> > > |                                                | 98d5eefb97 | 85ad4=
13389 |
> > > +------------------------------------------------+------------+------=
------+
> > > | BUG:kernel_NULL_pointer_dereference,address    | 0          | 12   =
      |
> > > | Oops                                           | 0          | 12   =
      |
> > > | EIP:lock_anon_vma_root                         | 0          | 12   =
      |
> > > | Kernel_panic-not_syncing:Fatal_exception       | 0          | 12   =
      |
> > > +------------------------------------------------+------------+------=
------+
> > >
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202412082208.db1fb2c9-lkp@in=
tel.com
> >
> > Thanks for the report!
> > It looks like anon_vma passed to lock_anon_vma_root() is NULL but it's
> > not obvious to me why my patch would cause that.
> >
> > Oliver, how can I reproduce this locally?
> >
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-6.13.0-rc1-00162-g85ad413389ae .config
>         make -j$(nproc) HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 olddefcon=
fig prepare modules_prepare bzImage modules
>         make -j$(nproc) HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 INSTALL_M=
OD_PATH=3D<mod-install-dir> modules_install
>         cd <mod-install-dir>
>         find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
> config and job-script files are attached in original report.
>
> one thing we want to mention is this seems only reproducible with i386 co=
nfig in
> our tests.

Thanks Oliver!
I think I found the issue and
https://lore.kernel.org/all/20241209221028.1644210-1-surenb@google.com/
should fix it. Could you please try it out?
