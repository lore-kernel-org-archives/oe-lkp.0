Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D80D1990DD
	for <oe-lkp@lists.linux.dev>; Mon, 26 Aug 2024 20:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724703545; cv=none; b=Ep3bkNQ+AoLauIysXrGs4fTYnOY7Mn7hDMSG270nKzKRD0JkEkBonpPsEk2dBGcpR0V9Ogi2CCRys6+lqvt3txEczYFcUXlQa5GtRhpdS1zAWTGKPQPsDlzDlgN8BH83dedwUIl4qz1jfncLrg12FV85pO1fguiZXvsISXkUTHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724703545; c=relaxed/simple;
	bh=CA4W1L70iji7rStJbgavACLmTHI7CSKpKxtCiH60qew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzuTmERZF195TgZfZ2hQzkP8oBek1ov+Ps/QxVm5QSvsmxVbpA7rbW34wpN2Jh8qCQn9YQYGNjtLdYgSoYOpkoD83DQDRPUTs7WoR06vdoVGI9Vp2KwdGtopYXJPcqKwQNz3D8eoBvas/BdCGXIg+u1X/ukvUHTNa3pvLmeKaFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FPO9An07; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FPO9An07"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5bebb241fddso1159a12.1
        for <oe-lkp@lists.linux.dev>; Mon, 26 Aug 2024 13:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724703542; x=1725308342; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fH/f0aeeE0GvpHSIy7huShE6UD/+U+Xn9Ls2T2sTWWU=;
        b=FPO9An079Oy48x/UqsQZnCCKnZwD3lvqpGxdL7LNylT4SZlweAvsukgrFldEMlcyaS
         myt8wIyUET1MZl9NlFYxb1yWy7Ln2BIfDajA7ZCtS43GFTmhtxI1FUDqlGKPi2tR9xQZ
         KxaWJQjBdP22PR11qaGM6BdX4gAc6KX3cakv1jX/BNGz17T5ySapEQHOlxOdR15LuXBF
         WSXp8FI6dyTjAFa10q33UMYg3X/ifRmIqcoM6dwBHjxL63wTddKw7fzHteib0BU9n1pJ
         aVS9ubwiKp5jI+y33EftlOpR4LBtUK7FAvxemLqwlxIdgZrNN0udlJoO0bWZyQ+fUZxN
         nmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724703542; x=1725308342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fH/f0aeeE0GvpHSIy7huShE6UD/+U+Xn9Ls2T2sTWWU=;
        b=oO6ZJoIulYgMMweWlAHCxiMbBb4QlFAdV+FysYwcOXRmT+kwixToJL0Xwa1yPmUpdk
         Ds04oNernAtklp9C+OqPVSs74XFNmKBcTHwlkEyBcHfn7gsXs+FgmhxBhMhtzzpC8aWo
         HfbAWgFWaAjHH1DvTOyJerlEo00RtLpxYNaG/O5/ArlNfxZLrXt2EC3SHNfYB9aM5juh
         Q+K7x9CYsqPeyJUBRSDKzaPqK5ciKhZbovpLWeSed1iWUqNE4aJKr0JrR1CzvKBMCoHF
         3IAf8CCkcSlSw5XXbTAT3+8UqmIVQ/hv0UyasLv3f/Q16vne8OWcOtmHDFzFfqZPMTF1
         23SQ==
X-Gm-Message-State: AOJu0YxkfW0Im0wXeZ2Qp0IcRpUPrauMgVETrAPds8ffcf5OKN0uCW0M
	fgq4lMyUyNqEku0casT2h6pX/yUzNBc+vzjJUVVfP8miE9Xx/udsgAcPPryRdv6NviGM9MGXbfz
	vU2DwEAOPpv8GMTZ3vUqwIIFp2mklLBr4U2aG
X-Google-Smtp-Source: AGHT+IF2rQAEInkMMIRofuR7KoWqNLDEtN7yEWZaPL+L5pmc5Vy01wfIlhxGOrjBz4370jUoljFtMrFdLxxtxkc74r4=
X-Received: by 2002:a05:6402:510f:b0:58b:15e4:d786 with SMTP id
 4fb4d7f45d1cf-5c0c0b167d8mr602a12.5.1724703541888; Mon, 26 Aug 2024 13:19:01
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408251741.4ce3b34e-oliver.sang@intel.com>
In-Reply-To: <202408251741.4ce3b34e-oliver.sang@intel.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 26 Aug 2024 22:18:23 +0200
Message-ID: <CAG48ez1o2GvYuMxox5HngG57CFcZYVJ02PxF_20ELN7e29epCA@mail.gmail.com>
Subject: Re: [linux-next:master] [slub] 3a34e8ea62: BUG:KASAN:slab-use-after-free_in_kmem_cache_rcu_uaf
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Sun, Aug 25, 2024 at 11:45=E2=80=AFAM kernel test robot
<oliver.sang@intel.com> wrote:
> Hello,
>
> kernel test robot noticed "BUG:KASAN:slab-use-after-free_in_kmem_cache_rc=
u_uaf" on:
>
> commit: 3a34e8ea62cdeba64a66fa4489059c59ba4ec285 ("slub: Introduce CONFIG=
_SLUB_RCU_DEBUG")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master c79c85875f1af04040fe4492ed94ce37ad729c4=
d]
>
> in testcase: kunit
> version:
> with following parameters:
>
>         group: group-00
>
>
>
> compiler: gcc-12
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.0=
0GHz (Cascade Lake) with 128G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202408251741.4ce3b34e-oliver.san=
g@intel.com
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240825/202408251741.4ce3b34e-ol=
iver.sang@intel.com

Oh, this is a weird one...

Do you happen to have either the vmlinux ELF file that this issue
happened with, or a version of the bug report that's been run through
scripts/decode_stacktrace.sh, so that we can tell whether the reported
slab-use-after-free is on line 1029 (which would mean that either ASAN
is not tracking the state of the object correctly or the object is
freed earlier than it should) or line 1039 (which would mean the
KUNIT_EXPECT_KASAN_FAIL() is not working at it should)?
