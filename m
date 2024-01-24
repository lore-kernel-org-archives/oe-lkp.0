Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E35628
	for <oe-lkp@lists.linux.dev>; Wed, 24 Jan 2024 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706087558; cv=none; b=kHHrfN8+ROdziX/qeJ39LZ3VKwlLXpew8BF/3ggEw+CSKtDdvOgqFgl9bD8P+qJbbTTtdEEMB+jzGddyH7X8QxCLxf93llrsPX6ZfNsMSGmZz3hXwoW1vUnS2ueHUc/qvqHcp4tM07WxE8cfkAlM4faL9RCOIXcY1DUg87p1lrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706087558; c=relaxed/simple;
	bh=sg2x6RglKOa/ZHOjgcmXB6to1BOsPavab2cnbypTlek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrJYwW8x5g+azAMNGG9QAtaKhVu+nKFKuFPPUxcUwR1JBMq3XZY72YiuGZM+UNwBgpj9FsbzG6d26W/ytzVI6U6LyHfPgcU4pcIyN61b2VC2IfXBZtubQp9sKdyryxHiPiuEAhJMnguckQZUTSTNiQmow8sXo5zuDmUPrtXNpI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f5Vs6o2f; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f5Vs6o2f"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so6481630e87.0
        for <oe-lkp@lists.linux.dev>; Wed, 24 Jan 2024 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706087555; x=1706692355; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDGWWvngYrXMHFwGpStoErGRJgClfXa6zjwKTrnmtoY=;
        b=f5Vs6o2fZTKJvzu9Mgbn2u6VRSbslXKW2+6M+75iVxOeUIJJH4A3t3NVJ3Tuh5+78b
         tgGlwrQbmOMs8mpMVx9E5uY+LnkKgjPLrN8YpxFulywixGEEtNEgI4vcAXHnQGvC1rm5
         aeuibL5UMkR4fWj5ajPiHuFBAAtNGWsQK4Kiz5D0mB0OfeFajPKUf3faIlDqM0PZ7k2G
         M6+I4KxwG1k2CfOTo1XZyER93c1s8+8XbLJCE1CIEOcIi222BbMGds/gn5UhIMCjswqb
         AxtTO2foYqSYlVPUX6s9o71Ew07JOwjK2aerh+EqNSb2qlocHFiiZ9eROvcahjVJUy7K
         gdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706087555; x=1706692355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDGWWvngYrXMHFwGpStoErGRJgClfXa6zjwKTrnmtoY=;
        b=VjkWP1uK6TJ2u6A9MPaLrWufOZk/pi7IAwhP03ueVZri9sbln3uVhlet/cufdTbJaF
         Mu+tfUciDUojFWvD4J372vqkBVhACfBewwcRQOE/L8/3Kk4vpqeDrsziLyTWlr6r7V98
         X/taUa+i22qzTWIOPBVYHzvr0E3hJr5QAFvcPRdRYFCadRIYcD7HSoc8vn+GZOvTOhRv
         7DW5v1AHQv9ZFoiNodq9auIAFhVgWvPdnzls70snxWQc6zfKNbJd6vCrrqkuUBPPkost
         Jjujl9tVC2rYv0/wrzZX8d+XItCVpovzavPI8Jb/a4UfYeR2PHeyn3JgaYx/S6WUvVV+
         l5fg==
X-Gm-Message-State: AOJu0YyUYQSk/AmXr+/uk8pIVkT7KfGcK5HUU8Py4fNGHdHTtLWTMdF5
	mQFoL7uPuf6tzwZgh00WaF5ojeTjZlyWO8Qk2dxN3BojGN0oFGNFWecMPid37BmqfTLFBewGFJb
	aIzlHnnSWv7Ue86+7T/BzFz9V/YsQM/28spif
X-Google-Smtp-Source: AGHT+IFfLbd/FARYk6hM3cTdPgBQ12QvsaQkut9PupCddCOicPnR9Oc8j2wvTSCWe9Y4/ZeUwERHZdpt7K9X51TdCA8=
X-Received: by 2002:ac2:5384:0:b0:50f:732:c4d5 with SMTP id
 g4-20020ac25384000000b0050f0732c4d5mr2849591lfh.64.1706087555324; Wed, 24 Jan
 2024 01:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401221624.cb53a8ca-oliver.sang@intel.com> <CAJD7tka0o+jn3UkXB+ZfZvRw1v+KysJbaGQvJdHcSmAhYC5TQA@mail.gmail.com>
 <Za9pB928KjSORPw+@xsang-OptiPlex-9020> <CAJD7tkYtKdLccKbFVoVo9DH8VtHHAXNMEz5D-Ww5jHhDy-QxbA@mail.gmail.com>
 <ZbDJsfsZt2ITyo61@xsang-OptiPlex-9020>
In-Reply-To: <ZbDJsfsZt2ITyo61@xsang-OptiPlex-9020>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 24 Jan 2024 01:11:59 -0800
Message-ID: <CAJD7tkYdvnOhj4a_mzx-w9Zzx8Eg8zFjQxi2+kxR0hD05b3GTg@mail.gmail.com>
Subject: Re: [linus:master] [mm] 8d59d2214c: vm-scalability.throughput -36.6% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, Shakeel Butt <shakeelb@google.com>, 
	Chris Li <chrisl@kernel.org>, Greg Thelen <gthelen@google.com>, 
	Ivan Babrou <ivan@cloudflare.com>, Michal Hocko <mhocko@kernel.org>, 
	Michal Koutny <mkoutny@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Waiman Long <longman@redhat.com>, Wei Xu <weixugc@google.com>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 12:26=E2=80=AFAM Oliver Sang <oliver.sang@intel.com=
> wrote:
>
> hi, Yosry Ahmed,
>
> On Mon, Jan 22, 2024 at 11:42:04PM -0800, Yosry Ahmed wrote:
> > > > Oliver, would you be able to test if the attached patch helps? It's
> > > > based on 8d59d2214c236.
> > >
> > > the patch failed to compile:
> > >
> > > build_errors:
> > >   - "mm/memcontrol.c:731:38: error: 'x' undeclared (first use in this=
 function)"
> >
> > Apologizes, apparently I sent the patch with some pending diff in my
> > tree that I hadn't committed. Please find a fixed patch attached.
>
> the regression disappears after applying the patch.
>
> Tested-by: kernel test robot <oliver.sang@intel.com>

Awesome! Thanks for testing. I will formalize the patch and send it
out for review.
