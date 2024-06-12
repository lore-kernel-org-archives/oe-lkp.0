Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E7812F5A1
	for <oe-lkp@lists.linux.dev>; Wed, 12 Jun 2024 06:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718175292; cv=none; b=XPuR6VeCU//RGhwwq6hoQrZd6ayRvKUzadKK58qsEFAdBACErZUpWmPlbKBg0AUVmqcWSMCl3E21xZbchTDElacOxdAuzIQcdRElg41kDpooRakKUELfrnHMN0yRNPscEV+WTofi13hzEydmimw9lkqGf3Z/8ayfAaKK2LUFBn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718175292; c=relaxed/simple;
	bh=1x92UVLO6Zm1BBXohbiIKD04uujZoxq08kIsSviX7lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftTUM7V+rcgvLeviwhMCAQwCeIIs+s+d4yCF2Cs6XsySE00aQN4G/ukIsdqepFj85w3wgXxm60CgjhyfasFHng3JoFcVm73X8TzlOSb4FEFVO84cL0iIdNKuj72bejp+tqIFb1Xtw5IPe5/tvKndtngHppXgKRcxUaONEGpW9bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jr4UkZQz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jr4UkZQz"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a63359aaacaso253490766b.1
        for <oe-lkp@lists.linux.dev>; Tue, 11 Jun 2024 23:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718175288; x=1718780088; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COynuuXFoNAcN7msczlzS7Et0yaJoF2KcsOhxmHgOdE=;
        b=Jr4UkZQzTcgHpsTeeu6/EaFQzSXiv4K0/YiRE3dKMBE0mMh+OQFhVJEKEPQKNqqH0j
         Xz1aviBgVUrxAEvJ5JRWlhMGquixL4woI2f5FRk0eQsyruKM3aT1XJs/kDAE6DuJeteW
         h+VzUxhYH/7cQJrNyI6UIJWNDpYqHkQte/re8dIqAq3TgT33hKgx/BV0AsyFwvh5FbhA
         vJwQNyMMM5IQOU4eC+2YgVe8thVcigHr2M2TWb1KXjx59zmquHrKYp8XAikU5OMZ8c6h
         TxvtwZ7K+0fb2Mgtnlcyb4sj3/88BpXBeVE2aU6CgCRGUD486k/ytBrpomDCxoeUSQhu
         RlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718175288; x=1718780088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COynuuXFoNAcN7msczlzS7Et0yaJoF2KcsOhxmHgOdE=;
        b=qTR7mFMxsamWaeMq9tpkjunVjwn2p76ZE1bQSlHWT6m8lDA3hHqRRFxXKY/VcRMW96
         la36A1FaHYX7l+DBSrL2USUg4X9yTLqX8uo5btDatPA2ZXotWDbJUKLsboxogs84/OGa
         tgjE/rF9Vx61gn0V86i5CDsQwP8pY04WW1t+QJd+VavuvLS05GGMLEec/V7gfHNk6jFM
         FfUeZ+kQuEufxKxaJ1sBDmIfhVv1t2cuw5APeC55zkAjJnPmc8GqJlUpJpvx8yXgrW8W
         efdpEtnD3dsoh07/gk4+m8KEM3RKI+uApMDe8cpV4+3aqO8uRlXaAHyymOEYeUWjWbYh
         o6tA==
X-Gm-Message-State: AOJu0YwqglRM755UlwWBVmf3wnsdhtaGftGEAHHMfTLDSs/YxsU/HVrg
	CbzURREit/A9KaVhlyom6DGWARKPTaihHciG2rN44+RBL2YC2pPqtbdoOgZh6awsy1mpT9e49F7
	wZ9OfpkadRMi4v114VpOSg8jHt3K0d0nvw9HB
X-Google-Smtp-Source: AGHT+IEDBPHbysLpi38T6xlqvj3QkmpmSOXHhL9SfSB+G2eCluvtJZtuRkRM82LfGaAhs5m0jZKVImHw05CkDIG6Mvg=
X-Received: by 2002:a17:906:6ad5:b0:a6f:13fe:75d1 with SMTP id
 a640c23a62f3a-a6f47f80448mr54169266b.64.1718175288353; Tue, 11 Jun 2024
 23:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406121026.579593f2-oliver.sang@intel.com>
In-Reply-To: <202406121026.579593f2-oliver.sang@intel.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 11 Jun 2024 23:54:12 -0700
Message-ID: <CAJD7tkYPV=FvnYNkr3H9GUhJXKy45G6=9vrG6Hb2mh6HzoL=1A@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 5d4a36365b: kernel-selftests.cgroup.test_kmem.test_kmem_memcg_deletion.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 9:49=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "kernel-selftests.cgroup.test_kmem.test_kmem_me=
mcg_deletion.fail" on:
>
> commit: 5d4a36365be0fc9085c192b0015b789ddfaca1f8 ("mm: rmap: abstract upd=
ating per-node and per-memcg stats")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master d35b2284e966c0bef3e2182a5c5ea02177dd32e=
4]
>
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-977d51cf-1_20240508
> with following parameters:
>
>         group: cgroup
>
>
>
> compiler: gcc-13
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-3770K CPU @ 3.50GH=
z (Ivy Bridge) with 16G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> bc80784601ad8fd8 5d4a36365be0fc9085c192b0015
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6          100%           6:6     kernel-selftests.cgroup.tes=
t_kmem.test_kmem_memcg_deletion.fail
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202406121026.579593f2-oliver.san=
g@intel.com

I believe Hugh just sent a fix for this [1]. He intends for it to be
squashed into the original patch (still in mm-unstable), so I think we
don't need Reported-by and Closes there.

[1]https://lore.kernel.org/linux-mm/49914517-dfc7-e784-fde0-0e08fafbecc2@go=
ogle.com/
