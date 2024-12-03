Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390732BD1D
	for <oe-lkp@lists.linux.dev>; Tue,  3 Dec 2024 04:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733198524; cv=none; b=Pnq5WYLfwGoVXbVOLWdQDsAT77+/C9vqPDRNVPxE8g0cNJOGdHZ404LnKVNV0/CMa9VjlI7mN67tQuBPd0d2+9QB8CgAA+xdjW1hxsXVTCHrfOlDss836YxGINqtB713uisaXs1UCP5EfoPTxZYChaVsUHLW8XTilPmf8g9mlms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733198524; c=relaxed/simple;
	bh=Tm/yEmz3IrLylog3g/nFD1HOP3ktclopH8zdPWsSzeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ojYvSOaOSqYgkaa20wmdCHXQPYvlec9wX0bVE77CxXoClyS4ccAtdkGMxL0xIIFZ+dohbXkT1K1sJMmP6A4qtgAdvJesKL62Kf64bF5JplMta+xmXwdRoT3boI+cAtgqg029v+c0xPrvhqcXp1xgkKvAwEU94EWCeQrcYPIbxEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSbAjaAB; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSbAjaAB"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d888fc8300so20351646d6.3
        for <oe-lkp@lists.linux.dev>; Mon, 02 Dec 2024 20:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733198522; x=1733803322; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2X8Y07U9yxHamIdypE6q792whpe9/ZxQOzclBHHAZOQ=;
        b=SSbAjaABuqTqeuYFtdrCqUZgYBeXqf5GGrSaizp3NbfhJOpLsKlHOyqHmqkl+BD8ku
         dsL2d7c+MfCaRSGwR7GeJxAi78tivDrVbTQdRqklzO20yJr0UXbT+0pxx9M9aubprJ0z
         bUwFBJe4lzdoYzNdMX8zkpqr+104Zw3+VZGA8FEtOUO4oKw41RDuGwOrWY9UoOXF4zvX
         SEOR955DmH1xwOepdNDUaiObCFwvab/jHMpsd7v/3PV8o3Vo/qcwdgNt3IjU1bVF3pIo
         +KOxdtu4a4/gABvWsckjjrdKsEbLdkQjhB2vfiejSmyQtCsALT5tZUYyDPprANDI7S2C
         S0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733198522; x=1733803322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2X8Y07U9yxHamIdypE6q792whpe9/ZxQOzclBHHAZOQ=;
        b=F89AgBN1uk4UZRCu4/9oyY4YBxEqgVZMJva+F++uvp+0Ftdjb7G94wkkkjm/fgXCGK
         d2vTaX2n16I1RiFrNkMRaR1yOUhYTbxljQ7kvAlEh05YmBgauPLeV4UYS5dy87Z4ytpc
         cZ+WAqRRletoMdvVhMIAPwEldyBCKulPI8Mmd9Hp9zOXjEuM/6nuYGOydueqVDIBY+q2
         bkTqvsbqJN/01xWNEnTy3VyqSjDbNTvj2Ze+0lUBXDAha0IfEVlbVUsGcugAm68tI7vq
         6QB+IQ3MtucTj3clYFAWARmM/ddPBIN67WV+yfga0aWVBMrhnMOCunpEPYrRvjknJwlB
         7xEA==
X-Gm-Message-State: AOJu0YyetRm++Ml4n9IHvlP0hi8z37IotRvRo80VnEjkfx+QqE+GA7aP
	+xbyrSerVu3HCxcl4bJVTaTGPTYVpyR64ORUG51ELwGGA4vm1+5PjGCn22T8JzdApP2tiRX+Op2
	2a0pvvER77ivxrjDSEOqosZ0XxSA=
X-Gm-Gg: ASbGncti8j9vF6hISWzbXn5xBYX3B3POJMfTAFKUGxtlvHYEwBBgLexOL9qKPdPu4nE
	tfdJWc7ag90p96SYnfK+xAaoj9K/pVCaiXQ==
X-Google-Smtp-Source: AGHT+IEXBzm/tLO6RiqlhAJPHmbaD0LqRdtH35Qzpu3o4ZsoXCeFufIruh3si7nzifKpNcQnj6YSveHdkgzbLwaGRY4=
X-Received: by 2002:a05:6214:518e:b0:6d8:ae2c:503a with SMTP id
 6a1803df08f44-6d8b74320ebmr16394506d6.48.1733198522190; Mon, 02 Dec 2024
 20:02:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411292300.61edbd37-lkp@intel.com> <CALOAHbABe2DFLWboZ7KF-=d643keJYBx0Es=+aF-J=GxqLXHAA@mail.gmail.com>
 <Z051LzN/qkrHrAMh@xsang-OptiPlex-9020>
In-Reply-To: <Z051LzN/qkrHrAMh@xsang-OptiPlex-9020>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 3 Dec 2024 12:01:26 +0800
Message-ID: <CALOAHbADgrzykLPHqukZB1mtT10=fNm41hb0k_ONKJHqw3To_A@mail.gmail.com>
Subject: Re: [linux-next:master] [mm/readahead] 13da30d6f9: BUG:soft_lockup-CPU##stuck_for#s![usemem:#]
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:04=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Yafang,
>
> On Tue, Dec 03, 2024 at 10:14:50AM +0800, Yafang Shao wrote:
> > On Fri, Nov 29, 2024 at 11:19=E2=80=AFPM kernel test robot
> > <oliver.sang@intel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed "BUG:soft_lockup-CPU##stuck_for#s![usemem:#=
]" on:
> > >
> > > commit: 13da30d6f9150dff876f94a3f32d555e484ad04f ("mm/readahead: fix =
large folio support in async readahead")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > >
> > > [test failed on linux-next/master cfba9f07a1d6aeca38f47f1f472cfb0ba13=
3d341]
> > >
> > > in testcase: vm-scalability
> > > version: vm-scalability-x86_64-6f4ef16-0_20241103
> > > with following parameters:
> > >
> > >         runtime: 300s
> > >         test: mmap-xread-seq-mt
> > >         cpufreq_governor: performance
> > >
> > >
> > >
> > > config: x86_64-rhel-9.4
> > > compiler: gcc-12
> > > test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H C=
PU @ 2.90GHz (Cooper Lake) with 192G memory
> > >
> > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > >
> > >
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202411292300.61edbd37-lkp@in=
tel.com
> > >
> > >
>
> [...]
>
> >
> > Is this issue consistently reproducible?
> > I attempted to reproduce it using the mmap-xread-seq-mt test case but
> > was unsuccessful.
>
> in our tests, the issue is quite persistent. as below, 100% reproduced in=
 all
> 8 runs, keeps clean on parent.
>
> d1aa0c04294e2988 13da30d6f9150dff876f94a3f32
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :8          100%           8:8     dmesg.BUG:soft_lockup-CPU##=
stuck_for#s![usemem:#]
>            :8          100%           8:8     dmesg.Kernel_panic-not_sync=
ing:softlockup:hung_tasks
>
> to avoid any env issue, we rebuild kernel and rerun more to check. if sti=
ll
> consistently reproduced, we will follow your further requests. thanks

In your environment, can this issue be reproduced using the following
simple command?

 vm-scalability/run -c case-mmap-xread-seq-mt



--
Regards
Yafang
