Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9204C85
	for <oe-lkp@lists.linux.dev>; Thu,  7 Aug 2025 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754588839; cv=none; b=kmoAN7nnKGWGP8Q5FQ6yOaanjGalBQ4t8TNldLPrACKtbrpMt40AgZsZAfIB3bXo+A0PZW9TzIsZqYF4xSU+E2b+1104AjaQlvQ8v72P8ICxEHY6Nd/f5v4TWAsUNky18j+YiauFpzmwv1/zqVbFMG+xolXa4wStmrzjerbZgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754588839; c=relaxed/simple;
	bh=bxkn7i2AaddKJTrBuQ4SxegpUk68fzfrs9vOHQQz7TY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxJ70CGAL4HgMYb4/ub+nmY7Oj4o/wO4mjXB3bLZbL54AQet1yjfWlvvB1Q+319ERQtTIzYWkULgf4JB6j7hxWcG4JYPf0dk2adt80U+HxGv7m4yWzNEVs3DEtWP71MVXqXkRJDUlkF2usV1emGXJpM1hQJidFj7Ke/jsmfFur4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uTOdJaa9; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uTOdJaa9"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6154c7b3ee7so1299a12.0
        for <oe-lkp@lists.linux.dev>; Thu, 07 Aug 2025 10:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754588836; x=1755193636; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDJdMpTFc0KMKXcRTALWA1S9ovbUgwwdEZq6bXr34JU=;
        b=uTOdJaa92FAs+IwTL78/NAPxhn8aHISSqdZkHApobV3byalEowmKlTmlnThtcwMDbu
         E9DumafYzC0/Jr9ryzmorUkWOU8fC7qgRw6NmDuyOYxfK2qSOxMQkewdPEcotS08z+ld
         fOlhUuTDC8D0zo0QUouMXQpvBDKvue4H5C0p7xVzLlMUN6ujMRY+mlsxUlJIdd8vlHv1
         SWnoAoPjaprQkshDkn55pO0h95uX+VZP/FgLo9WsXqI3EAudMoBrXDOwgQj/qmJncX6I
         hLiyBSZSSU8Dg7cabDxaTIcxHZy22i3dQm24gsEo4rNr4u4aFDYK1njA2++9IFZCsDsW
         z/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754588836; x=1755193636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDJdMpTFc0KMKXcRTALWA1S9ovbUgwwdEZq6bXr34JU=;
        b=Q3WFp8AZItA86EqGN7v3QKxMaVu3QVy6K5xrQJPi0C+EBwu6dSBSQhldTAVWOLBfde
         J0pg0a0kpIErhwC/omn8Ux/rsXpE+MyGsdm/mJ3C58w1GWWdA5Cqt3nEX9CajmRw2+dF
         lzUBDsOg/dW8oqUAMb8uBs/Uze4/n2V/iaVzaLw7EoKa3BfT6wdiVrNz59bZ6f8VGolh
         FvenDZDwHuv8aVJQHY4Exh+UcO6IX1LInq5KkMc1PjLTTgpURExPRRNKzoB8qe2parOI
         Q8Ao+WgB8E/O1Q7HYsrIAgKHtubQIb1yYPFAw1nrHzloqk9nDh4rc0ejcVt+Ci01cR/o
         UYaw==
X-Forwarded-Encrypted: i=1; AJvYcCXtGHyszn3f/OsxoYGAJPLWb1vyMnNBVpQ6RnzK6Pd8kSvRp9OwipJEXwPPPKUWZ7pzWLgTchw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXruoZnGwRqSNboG0Zucy7M1oUqdp9kmZQ6JToKPvH4jaJZr6Z
	8PV/gKDALOFRm5nE99+ShC0vByfQ0fR3mkiVS1jnz3kOwILzrVrs8axFmmThU6O0ojUWaAw4bVt
	FKUXQeI9XN6XE6TClVZoyxlvIJoJ5jnotfQObOq2Y
X-Gm-Gg: ASbGnctCVdAQ692bKS1BITPvd77ldmAZJ/EnS0NUUM+si1UDN3deyiTzpEJesJbwL4N
	pVImrFjhcHnEy2sFCfYu1LtSTRqxce3VVdiBNadBRvFDmSaff3ywY7t396BKWaNloYvU6epN5Um
	IUm7wbkOJw28lF9EKFjDXNnTOkqGxApuP3bERMZec/h/QVQfRQ80v8xPNb9elX71I+8psz1Tlfu
	NdMt3/oRkfuDqBZwaOX9RN08YAI6UwDbs0=
X-Google-Smtp-Source: AGHT+IFVAwixRVEdAdG9acHP30gULaJwSYNDDdAwpFBfQR2iG91VTEgNHzYlsENI7tXxpeqYxK8IG0xUMq0IsdLdjZM=
X-Received: by 2002:a05:6402:292f:b0:615:63af:84c7 with SMTP id
 4fb4d7f45d1cf-617e0c2fea6mr1229a12.0.1754588835703; Thu, 07 Aug 2025 10:47:15
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508071609.4e743d7c-lkp@intel.com> <9e3a59b2-11c0-43ca-aff3-414091f04aa4@lucifer.local>
 <CAG48ez3=8f3eShjAe9hrvivP+Dvyisw=X_Tr_phc-OX_4MzeDw@mail.gmail.com> <be074809-e1fd-43a2-9396-8f7264532c4d@lucifer.local>
In-Reply-To: <be074809-e1fd-43a2-9396-8f7264532c4d@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Thu, 7 Aug 2025 19:46:39 +0200
X-Gm-Features: Ac12FXz0pqhZ5ZXNMYXrgkg69OVAPBJ7j_8d24_PRsIXf3jxPz6zdWEIncqLCrg
Message-ID: <CAG48ez3=kLL4wBxAVSa2Ugrws+-RFQMdNY9jx5FAdbhpNt8fGg@mail.gmail.com>
Subject: Re: [linus:master] [mm] f822a9a81a: stress-ng.bigheap.realloc_calls_per_sec
 37.3% regression
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: kernel test robot <oliver.sang@intel.com>, Dev Jain <dev.jain@arm.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Bang Li <libang.li@antgroup.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	bibo mao <maobibo@loongson.cn>, David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Lance Yang <ioworker0@gmail.com>, 
	Liam Howlett <liam.howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Peter Xu <peterx@redhat.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Yang Shi <yang@os.amperecomputing.com>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 7, 2025 at 7:41=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Thu, Aug 07, 2025 at 07:37:38PM +0200, Jann Horn wrote:
> > On Thu, Aug 7, 2025 at 10:28=E2=80=AFAM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > > On Thu, Aug 07, 2025 at 04:17:09PM +0800, kernel test robot wrote:
> > > > 94dab12d86cf77ff f822a9a81a31311d67f260aea96
> > > > ---------------- ---------------------------
> > > >          %stddev     %change         %stddev
> > > >              \          |                \
> > > >      13777 =C4=85 37%     +45.0%      19979 =C4=85 27%  numa-vmstat=
.node1.nr_slab_reclaimable
> > > >     367205            +2.3%     375703        vmstat.system.in
> > > >      55106 =C4=85 37%     +45.1%      79971 =C4=85 27%  numa-meminf=
o.node1.KReclaimable
> > > >      55106 =C4=85 37%     +45.1%      79971 =C4=85 27%  numa-meminf=
o.node1.SReclaimable
> > > >     559381           -37.3%     350757        stress-ng.bigheap.rea=
lloc_calls_per_sec
> > > >      11468            +1.2%      11603        stress-ng.time.system=
_time
> > > >     296.25            +4.5%     309.70        stress-ng.time.user_t=
ime
> > > >       0.81 =C4=85187%    -100.0%       0.00        perf-sched.sch_d=
elay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
> > > >       9.36 =C4=85165%    -100.0%       0.00        perf-sched.sch_d=
elay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
> > > >       0.81 =C4=85187%    -100.0%       0.00        perf-sched.wait_=
time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
> > > >       9.36 =C4=85165%    -100.0%       0.00        perf-sched.wait_=
time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
> > > >       5.50 =C4=85 17%    +390.9%      27.00 =C4=85 56%  perf-c2c.DR=
AM.local
> > > >     388.50 =C4=85 10%    +114.7%     834.17 =C4=85 33%  perf-c2c.DR=
AM.remote
> > > >       1214 =C4=85 13%    +107.3%       2517 =C4=85 31%  perf-c2c.HI=
TM.local
> > > >     135.00 =C4=85 19%    +130.9%     311.67 =C4=85 32%  perf-c2c.HI=
TM.remote
> > > >       1349 =C4=85 13%    +109.6%       2829 =C4=85 31%  perf-c2c.HI=
TM.total
> > >
> > > Yeah this also looks pretty consistent too...
> >
> > FWIW, HITM hat different meanings depending on exactly which
> > microarchitecture that test happened on; the message says it is from
> > Sapphire Rapids, which is a successor of Ice Lake, so HITM is less
> > meaningful than if it came from a pre-IceLake system (see
> > https://lore.kernel.org/all/CAG48ez3RmV6SsVw9oyTXxQXHp3rqtKDk2qwJWo9TGv=
XCq7Xr-w@mail.gmail.com/).
> >
> > To me those numbers mainly look like you're accessing a lot more
> > cache-cold data. (On pre-IceLake they would indicate cacheline
> > bouncing, but I guess here they probably don't.) And that makes sense,
> > since before the patch, this path was just moving PTEs around without
> > looking at the associated pages/folios; basically more or less like a
> > memcpy() on x86-64. But after the patch, for every 8 bytes that you
> > copy, you have to load a cacheline from the vmemmap to get the page.
>
> Yup this is representative of what my investigation is showing.
>
> I've narrowed it down but want to wait to report until I'm sure...
>
> But yeah we're doing a _lot_ more work.
>
> I'm leaning towards disabling except for arm64 atm tbh, seems mremap is
> especially sensitive to this (I found issues with this with my abortive m=
remap
> anon merging stuff too, but really expected it there...)

Another approach would be to always read and write PTEs in
contpte-sized chunks here, without caring whether they're actually
contiguous or whatever, or something along those lines.
