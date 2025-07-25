Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E80C23AE66
	for <oe-lkp@lists.linux.dev>; Fri, 25 Jul 2025 21:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753477549; cv=none; b=X2aqiiJAn5yXOL//P2SIbvGiJM2/Qr2TeaNQYMw/1cn6aSgBQn49lChVccy/3eKYxpHjFgrYnUtczwNUrB+PJBrave79Omb65fUXlIpkLam+IhXZk/qv9JPOAJwEhQ7LdzVm6mzcpnjzoxtMSNN+/w6XTKNIKWau03mD3Xx3W0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753477549; c=relaxed/simple;
	bh=nf+R02+pjhtsyUzumbeTBX0BQg3tdsTFzeaRhqxDnK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPmEOWB5WCSWceeX3ePWWKulYl14Bg62Ea0xhf2T3dELsjoMZpEyLaEzjSK+Yn0B5ZZkSBc8oIgO/mdcChYDnwRMw10yk/0a3eLYuzN7BW9zUl8EO03Oum786GmF/eqTXrccrZFdq1XeJmTeIgsKWu2/lHHwRIoDpp/J2xnZ4ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eJZjZbdM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eJZjZbdM"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so542520066b.1
        for <oe-lkp@lists.linux.dev>; Fri, 25 Jul 2025 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753477545; x=1754082345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf+R02+pjhtsyUzumbeTBX0BQg3tdsTFzeaRhqxDnK4=;
        b=eJZjZbdMs/EpgaYSIGhPgpTtxZ4KozeIStmgcJWCcV3iPwBESjPBFjvFD/aaiigg9R
         F/nzB0nkDLnNigBV/y3XirWADIPXBJsHF+4XGnR8T2dLQ6oZeoa6H9BgnP6/feZ8yRGg
         KYXlDY/XMSIWjWOy7GASLxh5YD2XhLAz1NV4yotwbfgspWw7q18VLgvzRUh/sZmIquSj
         fERUpRIStbRNOkHyz/egTp44N/6cPo4K9itRveMrK6CaBy+lkWO4swp5zq7xbJdo2c+a
         XYirgGglOcgMoNe0cY7FUVeO/obk9/9SC763MSgaX9frG65l4VXbpeqzxJCW6D8lnooV
         BjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753477545; x=1754082345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nf+R02+pjhtsyUzumbeTBX0BQg3tdsTFzeaRhqxDnK4=;
        b=KwLFFRTWQYraLxhd2obm26me1irnaRy6FHF0aNhOJ4EddDLiL1qAXixG+VAXiTqOuJ
         e30c/+N6UFX6rHkLtLHsEJdanquyfUZQdVHEFf19ghxv3Vue9d8+YIAheWBZqcV+9oFw
         oO08HLpbt004GZ9azNgYH5/Wg1zwIbK+jpVpYkT6+FDbiWTi5VJXU0wSUOhKM4AQYeSq
         7ZOO+iQiCwKOmGhnMjd7FpZghxz0ymCr5N+RQVNkzJ5rlj/hRfiQXHQJFbpReII154xK
         08CSUdGVybiG++RQMpaXm2oxR+rlaPhtVVKOVvTFi8yT0QxHJBuMZDon2tr7c9H49boq
         AOqQ==
X-Gm-Message-State: AOJu0YynsEwfeJd4aFwEf5zDVfdjxwbutw/MxwXylOgi0UITut7jCevI
	cwtAYiv8dIv+QyUml0NISIFBK3NubdT6g9pqGJDbly+v8Lz26jVyFCXx9lpnuFwwJASL/0qyey7
	YrzrhIbGcN0i0W3ZZ14R64UtJGy+YpRpT21hTp30B
X-Gm-Gg: ASbGncvDRBACfLLPhcJfPKFJ3dSg3K2eRZTx2FqahpCZ/CVrB1Ad021R2mY5Jpuzwuq
	cWdlOGq8VQUXXOqbhx8pCRr6biTU4AMJ+K9ZeZSQ2d1ab/3rQvSlRy7nSEfUqKCM9NadTaCHMI/
	UT5R6mhf9f17j1RQBxew1E3Ll+yRF7b9+Xk2s0ukBemqpOOvLPOxOoiqZC1FLRSRSna+s29EsMq
	dnvCs+29k5YFPlL1ofcQnnoWa44tpXlZqTR0b+bfWgkBp4K
X-Google-Smtp-Source: AGHT+IELAu9YuIK2gpEKQqlX6S6RNRCmG5Auv842Kcma0vF6HvouVSX2qV6UIVxCupefMMHOEt8vR1Wv6bnzwGZ3g9w=
X-Received: by 2002:a17:907:7743:b0:ae3:6dc7:1ac3 with SMTP id
 a640c23a62f3a-af4c3c4c1c5mr740099366b.15.1753477545147; Fri, 25 Jul 2025
 14:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701210230.2985885-4-zecheng@google.com> <202507161052.ed3213f4-lkp@intel.com>
In-Reply-To: <202507161052.ed3213f4-lkp@intel.com>
From: Zecheng Li <zecheng@google.com>
Date: Fri, 25 Jul 2025 17:05:32 -0400
X-Gm-Features: Ac12FXxmKByQmwfUb0QXa5wHOkURuD6CJej7ElHNuDTDyyw5-98nj6F_odDj5k0
Message-ID: <CAJUgMyKAcnJyZbKpZu=MxpSRav3KEr4n2U4-xZJ96QN_aHT8hQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] sched/fair: Allocate both cfs_rq and sched_entity
 with per-cpu
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	aubrey.li@linux.intel.com, yu.c.chen@intel.com, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Namhyung Kim <namhyung@kernel.org>, 
	Josh Don <joshdon@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, zli94@ncsu.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping on this patch series.

I'll be communicating from a new email address, zli94@ncsu.edu as I'll
soon lose access to my current corp account.

On Wed, Jul 16, 2025 at 4:51=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a 8.8% improvement of stress-ng.session.ops_per=
_sec on:
>
>
> commit: ac215b990e70e247344522e1736fd878cb3c25b6 ("[PATCH v3 3/3] sched/f=
air: Allocate both cfs_rq and sched_entity with per-cpu")
> url: https://github.com/intel-lab-lkp/linux/commits/Zecheng-Li/sched-fair=
-Co-locate-cfs_rq-and-sched_entity/20250702-050528
> patch link: https://lore.kernel.org/all/20250701210230.2985885-4-zecheng@=
google.com/
> patch subject: [PATCH v3 3/3] sched/fair: Allocate both cfs_rq and sched_=
entity with per-cpu

It's great to see the kernel test robot can measure the improvement of
this patch.
