Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229FD1802E
	for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 19:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RuxzxyWW"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so3073a12.0
        for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 12:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697831550; x=1698436350; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSWDeA6cj4GbjOeiQsRECSOs7fXEzILOKhKiNyEQFfg=;
        b=RuxzxyWWjFm/Y079noP/7nvWpk2Vv46BLyJcNClgtTpoYue/LGOQqNz8MnmfUh0mvH
         789hRF2hhK5LHClzyvM3twMBivsguu5q4hxXhQwNkMxKnqkDk5tBfv7S4gdVHa1ll59h
         zCrFcPgNsfcgxKygjyS2pJUSFb5tApvW+mF4OMOHf+kSj9an8zymyKm8jttf9/qcsIvM
         +ft2tJP0oM+S+tdZmAUh9/oAWVpD9B+8xD1ls11ZVsGDjFd4Is+fkRcQgvf0tCasAZqR
         R9qVTBvEgM2/Zofs1iSmZ8prxxqQOZPCB1hhIfo1c2vxsRzaxH3laecCNc1ZA3pGP8fB
         T32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697831550; x=1698436350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSWDeA6cj4GbjOeiQsRECSOs7fXEzILOKhKiNyEQFfg=;
        b=YdZE2wlopMSNybAHf1RlzpGMdul21gzpLLNLWy3SZEsqtYXRqHbiw0Afd3obAUIuhT
         He2VeYtKoVFO9CCjpoJOgIcDyLF2ChaXwXUEhw6i2bjMSDx7qh7tfmeGj7VM8qZdUe3s
         RSH+VHoB8EPDfMc69/j8wSupOTEztdOkcDfBkW7DLSERQSuS+Q0PbY+yFpnwXrePZJzq
         d/B9zDlASreFjbCX15e2QFB0b9yOSSzqdraGEiwdN5b3k/7nPCuXK2Y6kGpd0JQu+BOZ
         ULmw0uhPLuBssNexE+SmU+z0xuS8bz1huXs/2Gu2u8nCe1Qmj00vibU317Tl0mw9qiO3
         iDKg==
X-Gm-Message-State: AOJu0YxxQsJbvt/pZUoSQmLMHoo62Zj8RNl3PaR1AiMVES5DGl5wQh2W
	dCICamaNqyg+oeEE1TcAc0Bz2ujjYXmknPYY7/MgVg==
X-Google-Smtp-Source: AGHT+IHGyh2xVOVlGe60EMeCFm+QCMN2V7ofFQcGLzOeEt1UUciBn5flJkJP4ABhrqmhQ1KcSRqaYQ2AUgpN9O5g7jY=
X-Received: by 2002:a50:9f41:0:b0:53f:91cb:6904 with SMTP id
 b59-20020a509f41000000b0053f91cb6904mr204723edf.4.1697831549963; Fri, 20 Oct
 2023 12:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310201422.a22b0999-oliver.sang@intel.com>
In-Reply-To: <202310201422.a22b0999-oliver.sang@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 20 Oct 2023 21:52:16 +0200
Message-ID: <CANn89iKXU4Fj0oiBa6atA+fo7OtBTJ28EpEbu=5Li+gFbKk6gw@mail.gmail.com>
Subject: Re: [linux-next:master] [net_sched] 29f834aa32: kernel-selftests.net.so_txtime.sh.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Paolo Abeni <pabeni@redhat.com>, Dave Taht <dave.taht@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Soheil Hassas Yeganeh <soheil@google.com>, 
	=?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	netdev@vger.kernel.org, aubrey.li@linux.intel.com, yu.c.chen@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 9:18=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "kernel-selftests.net.so_txtime.sh.fail" on:
>
> commit: 29f834aa326e659ed354c406056e94ea3d29706a ("net_sched: sch_fq: add=
 3 bands and WRR scheduling")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master e3b18f7200f45d66f7141136c25554ac1e82009=
b]
>
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-60acb023-1_20230329
> with following parameters:
>
>         group: net
>
>
>
> compiler: gcc-12
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.0=
0GHz (Cascade Lake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202310201422.a22b0999-oliver.san=
g@intel.com
>
>
> besides, we also noticed kernel-selftests.net.cmsg_time.sh.fail which doe=
s not
> happen on parent.
>
> 5579ee462dfe7682 29f834aa326e659ed354c406056
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6          100%           6:6     kernel-selftests.net.cmsg_t=
ime.sh.fail
>            :6          100%           6:6     kernel-selftests.net.so_txt=
ime.sh.fail
>
>
>
> # timeout set to 1500
> # selftests: net: so_txtime.sh
> #
> # SO_TXTIME ipv4 clock monotonic
> # payload:a delay:296 expected:0 (us)
> #
> # SO_TXTIME ipv6 clock monotonic
> # payload:a delay:279 expected:0 (us)
> #
> # SO_TXTIME ipv6 clock monotonic
> # ./so_txtime: recv: timeout: Resource temporarily unavailable
> not ok 30 selftests: net: so_txtime.sh # exit=3D1
>
> ....
>
> # timeout set to 1500
> # selftests: net: cmsg_time.sh
> #   Case UDPv4  - TXTIME abs returned '', expected 'OK'
> # FAIL - 1/36 cases failed
> not ok 59 selftests: net: cmsg_time.sh # exit=3D1
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20231020/202310201422.a22b0999-ol=
iver.sang@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

Silly me....

I will send this fix:

diff --git a/net/sched/sch_fq.c b/net/sched/sch_fq.c
index 8eacdb54e72f4412af1834bfdb2c387d41516349..f6fd0de293e583ad6ba505060ce=
12c74f349a1a2
100644
--- a/net/sched/sch_fq.c
+++ b/net/sched/sch_fq.c
@@ -651,7 +651,7 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
 begin:
        head =3D fq_pband_head_select(pband);
        if (!head) {
-               while (++retry < FQ_BANDS) {
+               while (++retry <=3D FQ_BANDS) {
                        if (++q->band_nr =3D=3D FQ_BANDS)
                                q->band_nr =3D 0;
                        pband =3D &q->band_flows[q->band_nr];

Thanks !
