Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15DA27B34D
	for <oe-lkp@lists.linux.dev>; Wed, 17 Sep 2025 07:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758092622; cv=none; b=la+hVbD7GQGc+rq1CVCUFRiUa3KIvf5SobCuEnxJ2QpY+LhnZiT9gQ1oWgcDCGPk9836wRXb9tiOYquN4qXY7IxenjvJdTjz546548vDDNYqN0/3g0W2EufwxHJvzlVuMfjgdI0fWb6C+fv+ZVNoRK139Y6ef7ycRxxFol7Rrvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758092622; c=relaxed/simple;
	bh=ZtJdwHsCQacx7vT+1PGPgg7gCIp7k++eP+19pc8gOjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpdJoU2aDP5w6bFN1JAhvNYpKgxb9p0Nbemx3ikNBiKGJzsIUBoG8ZHYv32W7sXbGBzTP6qx+2ZIuEQt2CAGiqtmobdmIvdmQAl3w5EpvCtFABJp84Szysp1JudleaI1gJdFiJjVb9s1ncGdFTctsoPOuOaZekF3YKyMVbnkQ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c3xHn7M2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c3xHn7M2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2445805aa2eso56735005ad.1
        for <oe-lkp@lists.linux.dev>; Wed, 17 Sep 2025 00:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758092620; x=1758697420; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J1YBD35YzME4fUnRREYzYzV7J9Xh5Amzs6Qryaeq1c=;
        b=c3xHn7M2/eDd2VumEwl63XaVAsK2FkTlHn+W60lt0G1XxmWEikPHhPnu1m0I/y+SuY
         yDu+b0AIHC0FDZYg3R30eqgIJ2OmPUSrElQ0evo0NZxGafhxuQMEO//Pe12y2V5TNr51
         KHvUPsyq32MB72x4kqYccvGdw58rNIkdkq/KlitwpWcNKhs/K/Ylfrki3OvKdUex5X1l
         tifhwey8CpuJWy0y/E4eWGw8mUHWj+fvrT7zDF4Arpr2WCzIedEyVSIr7DdAjPXSJ4so
         XnuRPkNoiGYr967mdlUn9xiquc330jVJSECWRPxEZ5TWibxfJ+DTfSO3rP6DudGSyP9h
         numg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758092620; x=1758697420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5J1YBD35YzME4fUnRREYzYzV7J9Xh5Amzs6Qryaeq1c=;
        b=pyV1Mc3eRo8PL22cHlh/tXskxcha4bV2yUpq+QlOqwDcLzNyyvVuA/n5iV4NRGawGs
         qxPVxS8NIhjIuFNdOzg4RtVGKZDuNQf2u2UPT8nzpaEeEUtjgfqyA28CrAeisl6ZKUT7
         +P9MHu8ojt1f81O0bqX1fswRkAF2DG2Vfz9K5P5mbuQPPI+0Kb8NjXfdJXdOp6sJ/J5M
         PpIBcr7BgQ2aSANa0RB/8cxh4w6KIOLQi3vtXKKMWm4WjaX91dUUILg4oJzfkgxhIGnT
         P4TEz8Cx9SQwfCdqvaEu3LpwELuq73qwBkkg82BCmDQKId5+YAHSs92Mh5mYUf1sGRQb
         jq9A==
X-Gm-Message-State: AOJu0YzCeYRHnsxnbkJZCZ4ew++OtO1XXYLI1tv1/IONiclVHPnjEf1O
	zmy3hVIYF47DyT+MH3w7qW/pWMt1I7kPtvAaBnDOG/Y2M0BPk1hTcmG2rs5u6JK/u3SIZTGF9IW
	TOWDXl0+1RZOo8gAip1HAth9Ba2JEkivl/siCAHVv
X-Gm-Gg: ASbGncsopgCJwctENWV5wigOiErF0aciEfY49mElgUCEjVxmeg9XnmNhnpfq8Vf93Ii
	/vmE62/dzDpSmh5eHnpgYoLVyGoamnIdZGDOfkJ2IRAZYXm9GKTYIlTej26ElN+TWf8aOdRBg8T
	VHNXgvPSM8dumH0Ya0vDRdnxZrcYkLCbDQ9uvJxxRQfAitZkZWV9ZAt7oJX9PMAx+ccg2FyIryQ
	IyxCD0Bar8ml61I/Ap8pterUTBEFzV8bAKIvKZVZCi9gwSulQ9Ldh68lTqTfaSs07U=
X-Google-Smtp-Source: AGHT+IFHqqSb0iZeLJZY85eRucnrDK2myNCsnrye3aGyc3jn1Chr0LEkdru+rbzxnAqB29LvtQoRAz7rfDOuHcs9NJY=
X-Received: by 2002:a17:902:dac4:b0:248:f84f:fd3c with SMTP id
 d9443c01a7336-26812166d0cmr13573895ad.13.1758092619855; Wed, 17 Sep 2025
 00:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910192057.1045711-2-kuniyu@google.com> <202509171359.658ddb38-lkp@intel.com>
In-Reply-To: <202509171359.658ddb38-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 17 Sep 2025 00:03:28 -0700
X-Gm-Features: AS18NWCDLFhRi5V-YAZb1sP659_dYtJBp3pw_GvlN50RKdZinoKi4N8ZdQCAG4E
Message-ID: <CAAVpQUBZT4dX9hU8h6s8ew5BYX9C6yBPaRODP4zM3F-=BB4Dtw@mail.gmail.com>
Subject: Re: [PATCH v8 bpf-next/net 1/6] tcp: Save lock_sock() for memcg in inet_csk_accept().
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, ltp@lists.linux.it, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neal Cardwell <ncardwell@google.com>, Willem de Bruijn <willemb@google.com>, 
	Mina Almasry <almasrymina@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 11:37=E2=80=AFPM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
> Hello,
>
> kernel test robot noticed "BUG:KASAN:slab-out-of-bounds_in__inet_accept" =
on:
>
> commit: d465aa09942825d93a377c3715c464e8f6827f13 ("[PATCH v8 bpf-next/net=
 1/6] tcp: Save lock_sock() for memcg in inet_csk_accept().")
> url: https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/tcp=
-Save-lock_sock-for-memcg-in-inet_csk_accept/20250911-032312
> base: https://git.kernel.org/cgit/linux/kernel/git/bpf/bpf-next.git net
> patch link: https://lore.kernel.org/all/20250910192057.1045711-2-kuniyu@g=
oogle.com/
> patch subject: [PATCH v8 bpf-next/net 1/6] tcp: Save lock_sock() for memc=
g in inet_csk_accept().
>
> in testcase: ltp
> version: ltp-x86_64-c6660a3e0-1_20250913
> with following parameters:
>
>         test: net.features
>
>
>
> config: x86_64-rhel-9.4-ltp
> compiler: gcc-14
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790T CPU @ 2.70GH=
z (Haswell) with 16G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202509171359.658ddb38-lkp@intel.=
com
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250917/202509171359.658ddb38-lk=
p@intel.com
>
>
> we saw a lot of "BUG:KASAN:slab-out-of-bounds_in__inet_accept" issue in d=
mesg
> uploaded to above link, below is just one example:
>
>
> [  468.984291][T30180] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  468.992753][T30180] BUG: KASAN: slab-out-of-bounds in __inet_accept+0x=
5c6/0x640

Oh I misused sk_is_mptcp() which assumes that sk_is_tcp()
is always true and should not be used if sk_is_tcp() is false for
SCTP, so sk_is_mptcp() test was unnecessary

I'll remove it, thanks!
