Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996351CFBA
	for <oe-lkp@lists.linux.dev>; Sat, 16 Aug 2025 02:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755311725; cv=none; b=q5317gouyH20/HYjs+DktnCvwiw8bdiCKuBAD0sW99VxxXeiS+Hs0zHDbDjbs1J3cdv78RyVh5JCChmvue3RHx6lsmqBmiSyZIJ7rQdT1FCSrMQ3KYvQp/h7l8ekLf0V/GYW0pMa18t0fszWFwvH/cxacbVeX1+MrKY+R6UnpLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755311725; c=relaxed/simple;
	bh=izKkYZyKE3NDGI1sM2L5pcWgCNJg3k/86kjkHcLqNgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPvgMSf/u1XJYUfBG+3e5uZTiQ8ti061y6Gc7zc2XrTeQyoV/kKWngmeoLCgIc//UDLUG2UeLyEJTjAY3DMAB7tDzK3I8BI7Bz8PLlcRPbbEg82RY0YkrIdeUkM3ohEfkBXCPGP/19IeLkSaZ3cxqa5dUkygNm4H0HGxUmFBPHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tMpHeCna; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tMpHeCna"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24457f3edd4so18252875ad.0
        for <oe-lkp@lists.linux.dev>; Fri, 15 Aug 2025 19:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755311723; x=1755916523; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYSYnsAnc4+Pe25joGiiZuFU50uPj3OZL8WRBpyuG54=;
        b=tMpHeCnaAJ6MZbIV46a+FlonYFJmSoWXUXz9V9T1lcKCLdVcfkmsgiajEkn6/W6Tx+
         pmvfB9ifubzKdaNrGSYFDOwxIuKhO7QMQq+BoNOBxidG/H9IO6PmrNFDCpxffXItZCOH
         NkSY9Eg7IKOeDwmazgMR25YKx4JcNTtsPmDl5FEHPojziW5IgwnwkADNdY8fsQGEKcOO
         UiwfReiDyEfmxCYlS1FeWOdey2grf/4Eon3/YYkaH3MVsWGEtjt/QGFpvm3PXdiMrY25
         odjtt5ggwPBXXju6ltVqW7RpqBPmeXrDZSLlUT+dYMJpVotMh2oJW0upSHZiNeMsX0RR
         dJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755311723; x=1755916523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYSYnsAnc4+Pe25joGiiZuFU50uPj3OZL8WRBpyuG54=;
        b=N+4ngacYvnxYv84Qb6k6N9byV4dqtPgTv0LwAJaP502LMUDh+ur1InAvwy1LXeVzS5
         1jx6FJwlJYl79o1N5xxOjYMSKQ9nm9aT1AVpHYv28V5SkiQrpka6uMVNxqC4aJJyXbF/
         wP01iLtR8RWmhtBIeRz7M60aPYkKiBWLHjbDu+wkk4jEb0sMX2tFHHm+y1xhAa1FgE6u
         gtWJx5EXUQOaoCHn+y7/BU68JKqdx5wN2tPZIFrYE0JLjcke90G1F6lVV1DtAukjljno
         Bcj+QWsbVgtnY5ce3lWVQmTXexKNCrwp6wKRmiNm9rzibDbCuAf3qlDvs6mL4/Ofwp8q
         9maQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3jp0NruqVqi1Os6bOMB1cxfW0KswaaRwrBzLADLXnwHHj/y1Bm7DBKuAo1XH3G6EG0RBtjm8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0kZAStw0q1mYr8fsrq/tmV+L3UeN+O9veZVx/g0GSvRoTWkd9
	7YFDdNrZYKAhegZ7ODBGsCxuRqqkjHMGQdkHkZ7nRzsymawj8H1uO1iphqohErQLX5+B7Aj77Ui
	al9n3ApwUQfYPQ6PILww48QyKymEtyNTiXN91a3fm
X-Gm-Gg: ASbGncuLM9uA1YoJ++mEUezeHLTLKh1n2F4So5lh9C9mufAYaB6rUVU24ejcYymHRG4
	tqkYXZ/c2X81jEzaMl14GYoTo1sOh0t/K4DSG5jfGChvclgQzA0mbazRgIHyqHAdoO0r1b9D+9P
	61gylu8L4P89i70g8NAgpeapoC9k12lUC5rBz41dpmRFLPaeXzZdkl1f6V3pVfxdQGAX2UASrSl
	g4kqa9a9emx/U2ewYsO7DK0MS9pVFPWdPrlOjw4xzKGDfY=
X-Google-Smtp-Source: AGHT+IEoa6K5VPw7SESWJcyry0r0EAmnREWUavxXpMAeN45Ss7wHcLf9j0oo8tGG9DPZYtegphKPTtIWix2PRHyIVkg=
X-Received: by 2002:a17:903:1967:b0:242:a0b0:3c12 with SMTP id
 d9443c01a7336-2446d9c534amr60239055ad.52.1755311722577; Fri, 15 Aug 2025
 19:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250801090949.129941-1-dongml2@chinatelecom.cn>
 <202508110750.a66a4225-lkp@intel.com> <aJ_qbZDvDJwVoZGA@localhost>
In-Reply-To: <aJ_qbZDvDJwVoZGA@localhost>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 15 Aug 2025 19:35:10 -0700
X-Gm-Features: Ac12FXxRtAJ-Rrz7HjZK8VbUPj4MqgpSheT6l3cFeoFUPq4dJKBOPfSiUKanWVU
Message-ID: <CAAVpQUCEGiRjoobf69Jd5M9vnZyi0N6crNUgSBpDTGNfrap1cA@mail.gmail.com>
Subject: Re: [LTP] [PATCH net v2] net: ip: order the reuseport socket in __inet_hash
To: Wei Gao <wegao@suse.com>
Cc: kernel test robot <oliver.sang@intel.com>, Menglong Dong <menglong8.dong@gmail.com>, kraig@google.com, 
	lkp@intel.com, netdev@vger.kernel.org, dsahern@kernel.org, 
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org, edumazet@google.com, 
	horms@kernel.org, oe-lkp@lists.linux.dev, kuba@kernel.org, pabeni@redhat.com, 
	ncardwell@google.com, davem@davemloft.net, ltp@lists.linux.it, 
	Menglong Dong <dongml2@chinatelecom.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 7:18=E2=80=AFPM Wei Gao <wegao@suse.com> wrote:
>
> On Mon, Aug 11, 2025 at 01:27:12PM +0800, kernel test robot wrote:
> >
> >
> > Hello,
> >
> > kernel test robot noticed "BUG:KASAN:slab-use-after-free_in__inet_hash"=
 on:
> >
> > commit: 859ca60b71ef223e210d3d003a225d9ca70879fd ("[PATCH net v2] net: =
ip: order the reuseport socket in __inet_hash")
> > url: https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/net-i=
p-order-the-reuseport-socket-in-__inet_hash/20250801-171131
> > base: https://git.kernel.org/cgit/linux/kernel/git/davem/net.git 010510=
12887329ea78eaca19b1d2eac4c9f601b5
> > patch link: https://lore.kernel.org/all/20250801090949.129941-1-dongml2=
@chinatelecom.cn/
> > patch subject: [PATCH net v2] net: ip: order the reuseport socket in __=
inet_hash
> >
> > in testcase: ltp
> > version: ltp-x86_64-6505f9e29-1_20250802
> > with following parameters:
> >
> >       disk: 1HDD
> >       fs: ext4
> >       test: fs_perms_simple
> >
> >
> >
> > config: x86_64-rhel-9.4-ltp
> > compiler: gcc-12
> > test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30G=
Hz (Ivy Bridge) with 8G memory
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202508110750.a66a4225-lkp@inte=
l.com
> >
> >
> > kern :err : [  128.186735] BUG: KASAN: slab-use-after-free in __inet_ha=
sh (net/ipv4/inet_hashtables.c:749 net/ipv4/inet_hashtables.c:800)
>
> This kasan error not related with LTP case, i guess it triggered by netwo=
rk
> related process such as bind etc. I try to give following patch to fix
> kasan error, correct me if any mistake, thanks.

Note that the report was for the patch in the mailing list
and the patch was not applied to net-next.git nor net.git.


>
> From: Wei Gao <wegao@suse.com>
> Date: Sat, 16 Aug 2025 09:32:56 +0800
> Subject: [PATCH v1] net: Fix BUG:KASAN:slab-use-after-free_in__inet_hash
>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202508110750.a66a4225-lkp@intel.co=
m
> Signed-off-by: Wei Gao <wegao@suse.com>
> ---
>  include/linux/rculist_nulls.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nulls.=
h
> index da500f4ae142..5def9009c507 100644
> --- a/include/linux/rculist_nulls.h
> +++ b/include/linux/rculist_nulls.h
> @@ -57,7 +57,7 @@ static inline void hlist_nulls_del_init_rcu(struct hlis=
t_nulls_node *n)
>   * @node: element of the list.
>   */
>  #define hlist_nulls_pprev_rcu(node) \
> -       (*((struct hlist_nulls_node __rcu __force **)&(node)->pprev))
> +       (*((struct hlist_nulls_node __rcu __force **)(node)->pprev))
>
>  /**
>   * hlist_nulls_del_rcu - deletes entry from hash list without re-initial=
ization
> @@ -175,7 +175,7 @@ static inline void hlist_nulls_add_before_rcu(struct =
hlist_nulls_node *n,
>  {
>         WRITE_ONCE(n->pprev, next->pprev);
>         n->next =3D next;
> -       rcu_assign_pointer(hlist_nulls_pprev_rcu(n), n);
> +       rcu_assign_pointer(hlist_nulls_pprev_rcu(next), n);
>         WRITE_ONCE(next->pprev, &n->next);
>  }
>
> --
> 2.43.0
>
