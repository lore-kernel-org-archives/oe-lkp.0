Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C4C13E02D
	for <oe-lkp@lists.linux.dev>; Thu,  7 Aug 2025 17:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754588299; cv=none; b=m3aqqEJhwHG32ri8oVHrhLmKldaAJ5Dn1Q1rJbRTPbnZnp25Pep+6jbdLZgkrxNfyg/uJRqxxh4DTEggPF3WxYavk1v3T93Xi4IU2i7wooEDOy7HfF7RbXnaUR+275tfFXjkZGdkyXdPvbGBDTqo92Oz+52r5kpX7aHuYRKivZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754588299; c=relaxed/simple;
	bh=q/Jq0GgttUlLfhZ00HgngnqjM1aNEj36/CvvVjcMf0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyA150OCDVqmo8c+09hGJMkGdAiaQkq4P5TLtI6Lkxn/HeDixQ/vFZHDNKYQxVGa5lmnfQBy9V/48Ph92fwtQ1qOsg8tH+sWtBZlnn7p0yIj4htws7bMUavvwXTy9yt542I+yoDuhbYi6mI2nrXE7Td77IaNHONp9sPoSDxE1dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N2hyJilh; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N2hyJilh"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61543b05b7cso1121a12.0
        for <oe-lkp@lists.linux.dev>; Thu, 07 Aug 2025 10:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754588295; x=1755193095; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7q3Q6iUm+lHnGSyrlBHDosOzs9eiv0aa0pxVcHH9CQ=;
        b=N2hyJilhNnPsr9B97oVeiEkVTmH3TltVGwPuzMwTIkqvj3Kk9FLTvxjRLeRS/bAjng
         6IfKiYmZNnWS71wn/17By6JOzjm/fzAlB65zhaov30HLJACvM1iSDWGaW0c9/hXpD2B8
         cl40MlfJju2TA8UJ189fX4OJODe36oJFtUn6vxorQq76gl4ipeaZiR1K6oyAe1M0n9RX
         9vAT1fzP3u4PUN7MtkJFFJeDII5/b6B05oiaA+GfMgls6XSfHt7ZxImR2a8sch2ryk1x
         FL5luR7dL6ato+aoOYDHYqbuse3rEe3+gzzUZnBELj0FLKa+AsnEMwpiyb+nZNo+mOLJ
         VIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754588295; x=1755193095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7q3Q6iUm+lHnGSyrlBHDosOzs9eiv0aa0pxVcHH9CQ=;
        b=bb2RJ1/uu1iFs/icRh+/pCTffMfREiwm6Bj+ZBbhiuxq0afkzSiNqaU8bPO9i6LOuo
         5o+syCZNDwoxv6nC0m+uivXfuWpaMRaxikWef/E7N3p3ZiMn4u3HUHa1bOczfoGcCcW7
         Rgk4ijNLo2enXeKcbziJCouy9dgoTu9weBDOXjE5R/NgSwe2eM69XBAVpZlExQG1si28
         8ZiWRSjEM49lBZFXVcM6lNKEa4mJKeASkXxSp6JjU1rGSYlsuij+DBIb1GZyBOPKrxv+
         vNLSc9R+WP5YyLlNa7x2K56aCA3QNvWKwtxFNa89KynA8Bxl2mXaQHCKPk9ZuK/CZWfC
         xloA==
X-Forwarded-Encrypted: i=1; AJvYcCUyANpDGAyN4T+f6DtYPl3LUAFAKvh1tWXwXdwUI19QN3RhzxpYnFMR1ju76YQuZJTFJ1OYRZo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/bV42W9DTXGy1LlEqpIAYq4HndLcxOlGlDxFx1LFE+L/3fTg1
	mwtpQU5FXzh/kMX/C6A4SqZ2cEOMwnMjPSFrHTadeWmdeKlUIKk91eUD4JBQ+xQymArVGpQa0lk
	FKVMVgVMD0p1EkaL2c9f7aibsQBJE/8rlDj4SJe3l
X-Gm-Gg: ASbGncvF94hV1qzJI8INamrLFSyHp9b6bqgBD3Scq0KfFF3c/55urr6aawrOTNWq1iG
	KoepYFJU3KEMRQsytFLTUXqA6fpzRB1wGSrUbFS8YKtqVrK4UPAx7ZmwvfLvcZ5D93li+RAZQkc
	LJ0Mpe70/bj2v10hLbm9/T6ha3s7zdAejkytj3akHxbcxNTrHDIyoqIFfaahgh3KcJIm/f729TG
	07g2C6TlRxNECmwyVxl/xlzxkhf9SAiz1Q=
X-Google-Smtp-Source: AGHT+IEvIyaewpd1z50G14jfP2i5jSv0GcxRpXNr+oXtWD/QgpMt2hhkcUb0kWVZEwAn2vN3hoIdh8YmyHA5+kYPcBI=
X-Received: by 2002:a50:aa95:0:b0:607:d206:7657 with SMTP id
 4fb4d7f45d1cf-617e152e274mr1175a12.2.1754588294999; Thu, 07 Aug 2025 10:38:14
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508071609.4e743d7c-lkp@intel.com> <9e3a59b2-11c0-43ca-aff3-414091f04aa4@lucifer.local>
In-Reply-To: <9e3a59b2-11c0-43ca-aff3-414091f04aa4@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Thu, 7 Aug 2025 19:37:38 +0200
X-Gm-Features: Ac12FXzlXycSMR6_C9Cle-BO1qGA01-IsNhuqseD9fQKbf1SHEDGINCkLu6Sek0
Message-ID: <CAG48ez3=8f3eShjAe9hrvivP+Dvyisw=X_Tr_phc-OX_4MzeDw@mail.gmail.com>
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

On Thu, Aug 7, 2025 at 10:28=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Thu, Aug 07, 2025 at 04:17:09PM +0800, kernel test robot wrote:
> > 94dab12d86cf77ff f822a9a81a31311d67f260aea96
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >      13777 =C4=85 37%     +45.0%      19979 =C4=85 27%  numa-vmstat.nod=
e1.nr_slab_reclaimable
> >     367205            +2.3%     375703        vmstat.system.in
> >      55106 =C4=85 37%     +45.1%      79971 =C4=85 27%  numa-meminfo.no=
de1.KReclaimable
> >      55106 =C4=85 37%     +45.1%      79971 =C4=85 27%  numa-meminfo.no=
de1.SReclaimable
> >     559381           -37.3%     350757        stress-ng.bigheap.realloc=
_calls_per_sec
> >      11468            +1.2%      11603        stress-ng.time.system_tim=
e
> >     296.25            +4.5%     309.70        stress-ng.time.user_time
> >       0.81 =C4=85187%    -100.0%       0.00        perf-sched.sch_delay=
.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
> >       9.36 =C4=85165%    -100.0%       0.00        perf-sched.sch_delay=
.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
> >       0.81 =C4=85187%    -100.0%       0.00        perf-sched.wait_time=
.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
> >       9.36 =C4=85165%    -100.0%       0.00        perf-sched.wait_time=
.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
> >       5.50 =C4=85 17%    +390.9%      27.00 =C4=85 56%  perf-c2c.DRAM.l=
ocal
> >     388.50 =C4=85 10%    +114.7%     834.17 =C4=85 33%  perf-c2c.DRAM.r=
emote
> >       1214 =C4=85 13%    +107.3%       2517 =C4=85 31%  perf-c2c.HITM.l=
ocal
> >     135.00 =C4=85 19%    +130.9%     311.67 =C4=85 32%  perf-c2c.HITM.r=
emote
> >       1349 =C4=85 13%    +109.6%       2829 =C4=85 31%  perf-c2c.HITM.t=
otal
>
> Yeah this also looks pretty consistent too...

FWIW, HITM hat different meanings depending on exactly which
microarchitecture that test happened on; the message says it is from
Sapphire Rapids, which is a successor of Ice Lake, so HITM is less
meaningful than if it came from a pre-IceLake system (see
https://lore.kernel.org/all/CAG48ez3RmV6SsVw9oyTXxQXHp3rqtKDk2qwJWo9TGvXCq7=
Xr-w@mail.gmail.com/).

To me those numbers mainly look like you're accessing a lot more
cache-cold data. (On pre-IceLake they would indicate cacheline
bouncing, but I guess here they probably don't.) And that makes sense,
since before the patch, this path was just moving PTEs around without
looking at the associated pages/folios; basically more or less like a
memcpy() on x86-64. But after the patch, for every 8 bytes that you
copy, you have to load a cacheline from the vmemmap to get the page.
