Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C652F70805
	for <oe-lkp@lists.linux.dev>; Sun, 26 Jan 2025 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737881395; cv=none; b=CFIDkf4mt9p80xAznea0SDn8J0wUJvsTnZTE2bkRzBPoOtW1a57BKLkTan8d8AoZB/dvGchuju4LqlleudcDztZBPQQevEzN3w7Uz1EqdlRxXrI5KySbMAyfRYels1s4cWBwOarbyX4F7fjNtWjo96Bg6keeT5wWXAiJKWZuXS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737881395; c=relaxed/simple;
	bh=AMFPi86GG75ePAlO70JW0HOzwi2MdoBF0k541T6jnyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GabODLV/NkXlkXAfE5ngwHZnK3hWW5D5eQOu01lVT5+D8nLwhyKXQmk0A68sS1A6B4DMP0prTdqGyK2+Nb2tqI9RdKcaHTZswDpWj3VnMIht0yS9GCoilUL0mJqsc8GOENGpcLYYxI6ZC5jTFV14yyrDvPR5T0QmV4ot2byByBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlJUssh8; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlJUssh8"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a813899384so8573195ab.1
        for <oe-lkp@lists.linux.dev>; Sun, 26 Jan 2025 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737881393; x=1738486193; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBuZ1Xz/Z+VftvmIpRqBRhK9GCtM2HvGZd92IHISFNE=;
        b=IlJUssh8fLouK8ge7eIEEHibJOcQweuXRAQ50wsXdCcLvWJxtz+jJ3PtDTGFgNQ+Jc
         IH4xIVFO7fq7atbn0tFMNbWDzHyRmYCbGs+EZm3nzbPh3ogIkaV6VOmWJwN5UCbfUA34
         tHjOUxnwOjW6OuCRHExZ0oazBFUBP7QXtVPonY5Gm6OijTxn5K2bo0+vlKvwpkYuAbLx
         qxpKYWYqC4AGs3Pq4KCSgiVkeK1IP7xu68OihxWkia/l87HXLKYsKCqkIYRVyVnKfhEC
         mxmm69W+fIrQQ3Xx4R/1/50Arp6a4ht3A7TeL9HaZDOhqP/yQcx6IfcU68Tn1fT/tYxr
         730A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737881393; x=1738486193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBuZ1Xz/Z+VftvmIpRqBRhK9GCtM2HvGZd92IHISFNE=;
        b=pSyfZMK+hkFA0thi10qbVF7JLmDGPvlISMgGzzP92WATZYUEF02wXr6Opx3LB0Wdkb
         TEzozdMZFeoTjVuyTsWxFPOgyFx0UXhHLnT3+0TmNfIm1JvHCAIiI8Is2tYSF7SI57fY
         5MwysriR2wRCBqedIn2yDlaARSmFOmSRcjmb13K4XPBm31R1Da/2yk1h/Cnug/IGgvlW
         Qsht3YsET5lAVLLoUBu4LuUU46Ks8dOjeWJG/MBkSRCGBN+Tv3TfSn76Ziu6IPTZQVTa
         wd5QzdZJnjaXyNdiD9D6OwtkphULKEhGIwPgVsbrbQ5J2gyYREKHEnuyoP3BZos5hDH2
         2UXg==
X-Forwarded-Encrypted: i=1; AJvYcCXvIEa0xmzjd3df5YscitqTxCGAZtF9dmyCjI//+ejtB11YOGZ76VEyyg+Z2nwTNDfAUaO9sQA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDcPf+tcO21POkVlJ1f8Ug7oACpjVySDyVCS5tmt/7Rd8hJAUR
	2RLHpxyWYmJZDIIUxkUjnDl9oadSF2K50C/KppAPGpAZK8eLUwW4p23Gc8yD3MYfw2+f38jw77S
	1x8Lsz0MdVBcGntgKyMI0mVQLRjo=
X-Gm-Gg: ASbGnct3qgzqy/hFfUaJgopKVxTkN7dX/foliRryyq9JDVfOaNKVKOHLC23Q8lwSJfZ
	mvTbasaEWKqGYuiCzus4LA5AN+K+aM12mu1T74GZMc0j/iaY62UY6y4mWinux
X-Google-Smtp-Source: AGHT+IH9IFo3U5eVjnGCMJw6TXyhgapZEGYnIq/Uui/5PLey81s8XQomxyKOsOFpWYpwR0P6GC0za8L1arz5uWBmm7s=
X-Received: by 2002:a05:6e02:19c5:b0:3ce:8ed9:ca81 with SMTP id
 e9e14a558f8ab-3cf743d912bmr303149995ab.5.1737881392824; Sun, 26 Jan 2025
 00:49:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501261315.c6c7dbb4-lkp@intel.com>
In-Reply-To: <202501261315.c6c7dbb4-lkp@intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 26 Jan 2025 16:49:16 +0800
X-Gm-Features: AWEUYZnJrHvu3ywaEtOrkLS8ezRSktPOq7CR8KmCAEFphS5QIGVZLpOxW50oUVw
Message-ID: <CAL+tcoBBjLsmWUt9PkzDhVtGLm-s53EyTzcHhpTkVnLpgz0FXw@mail.gmail.com>
Subject: Re: [linus:master] [tcp_cubic] 25c1a9ca53: packetdrill.packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: Mahdi Arghavani <ma.arghavani@yahoo.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Neal Cardwell <ncardwell@google.com>, Eric Dumazet <edumazet@google.com>, 
	Haibo Zhang <haibo.zhang@otago.ac.nz>, David Eyers <david.eyers@otago.ac.nz>, 
	Abbas Arghavani <abbas.arghavani@mdu.se>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 26, 2025 at 2:30=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "packetdrill.packetdrill/gtests/net/tcp/cubic/c=
ubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail" on:
>
> (
> in fact, there are other failed cases which can pass on parent:
>
> 4395a44acb15850e 25c1a9ca53db5780757e7f53e68
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6          100%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail
>            :6          100%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4.fail
>            :6          100%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv6.fail
>            :6          100%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/cubic/cubic-bulk-166k_ipv4-mapped-v6.fail
>            :6          100%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/cubic/cubic-bulk-166k_ipv4.fail
>            :6          100%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/cubic/cubic-bulk-166k_ipv6.fail

Thanks for the report. I remembered that Mahdi once modified/adjusted
some of them, please see the link[1].

[1]: https://lore.kernel.org/all/223960459.607292.1737102176209@mail.yahoo.=
com/

I think we're supposed to update them altogether?

Thanks,
Jason

> )
>
> commit: 25c1a9ca53db5780757e7f53e688b8f916821baa ("tcp_cubic: fix incorre=
ct HyStart round start detection")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linus/master      405057718a1f9074133979a9f2ff0c9fa4a1994=
8]
> [test failed on linux-next/master 5ffa57f6eecefababb8cbe327222ef171943b18=
3]
>
> in testcase: packetdrill
> version: packetdrill-x86_64-8d63bbc-1_20250115
> with following parameters:
>
>
> config: x86_64-rhel-9.4-func
> compiler: gcc-12
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz=
 (Haswell) with 8G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202501261315.c6c7dbb4-lkp@intel.=
com
>
>
>
> FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k-id=
le-restart.pkt (ipv4-mapped-v6)]
> stdout:
> 20
> 30
> 36
> stderr:
> FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k-id=
le-restart.pkt (ipv6)]
> stdout:
> 20
> 30
> 36
> stderr:
>
> ...
>
> FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k-id=
le-restart.pkt (ipv4)]
> stdout:
> 20
> 30
> 36
> stderr:
>
> ...
>
> FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k.pk=
t (ipv4)]
> stdout:
> 20
> 30
> 36
> stderr:
>
> ...
>
> FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k.pk=
t (ipv4-mapped-v6)]
> stdout:
> 20
> 30
> 36
> stderr:
>
> ...
>
> FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k.pk=
t (ipv6)]
> stdout:
> 20
> 30
> 36
> stderr:
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250126/202501261315.c6c7dbb4-lk=
p@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
