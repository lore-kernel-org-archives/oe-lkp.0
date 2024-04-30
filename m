Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E019D77115
	for <oe-lkp@lists.linux.dev>; Tue, 30 Apr 2024 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485844; cv=none; b=iguzwgE1fV1eFnU8tYzFdrQU8/Usxz0QzfPoClx2EOJl5OcONjDUH5vfhEuM6GITgw5MBVkwZ++CqN9jKstkxxS0uzLfGpWUkhD6te1TZWzb2j7pVz+enTKarMUlhXWmdWnKl7xRgAbhimAu+a/9KHUMGFbyOg/03cX4LgeZzE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485844; c=relaxed/simple;
	bh=doM9DE5AdkdX778oVeh2pNLahD9SgseLXDbYGsYQQBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDEy5pa8K2O9kjsO4OJp4rIgRmCP+aYNzJkuPObmFMazokp1bCj17i6q3zLeDqPjb4uI4FdCbqz5A/3lEZKFCGiFlPZ1wQzLef+kL4NGNQM0E68aP5VUOZwabWO7fEZgKldaUrjBaaJFjweRkvBqhyuZyxzj3O949UcwdXfGNl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4Y/B0zth; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4Y/B0zth"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5722eb4f852so11794a12.0
        for <oe-lkp@lists.linux.dev>; Tue, 30 Apr 2024 07:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714485840; x=1715090640; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6o6m2z1nraUEbkc5iFx1PfQfkjbyaGlyCn/YlhNo4I=;
        b=4Y/B0zthRN28qdaRytTFvD0l1oiZwlm7TVRmgpRhb2PJcTJK19n1GARaMNcu56p1X5
         UiEyQ8+TgNMg8PaT13kQjGraM8LofuSVgK46IhscewUqdwMF3kT1RV76r+CD6V4NaA/T
         la9bkegYw3fw9aXVv7r9YgGCdNvOQoT+bD/sbBJ4CG7GG7O4WpBSzQO0sIyv+24PsrB6
         Z5dKDDswOBrr7rdhUPmOFzPpp9ZetH1ZtxPrKYvOR8AQVZcGZaLLHzTIsOnIom0wI66f
         wx8TJhZQQmi48HZIUpyTb0vAUX5ezezqDC+1LWH13c7SGevJI/5lPC3NkkYrQ48plVgk
         WE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485840; x=1715090640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6o6m2z1nraUEbkc5iFx1PfQfkjbyaGlyCn/YlhNo4I=;
        b=faIpYkSUMbcOpx8i3RSjZgMXonuEa4hgq/y+hJrH2K7S7G2Jwr0i+Ty8mr/CVVOgzR
         ZUKCixHRcQP2Iu74vHSLq3KHMsRW051kHImK6lDc+LaFk4EVTY9UEl5ybBUu/X4D8klX
         celVeGT7Tx1aVhhaLRHisMCwRZSLBnvtLYaO8hU21mSUM6yORvkTU+llGF7jCv9hCt8j
         co9HUbbf3HxJlCJeLrYFIaCNyPNEl9607UJzmV1Za8+0k1ZM+dG/ObT14OV/pCh1bOZ/
         A/sOsd33o8jEGq3X/gReGSSNgPgmNCX2yBK9SAhgW8jwq1HOn85rPAUagoJPXbfy45IE
         0obQ==
X-Gm-Message-State: AOJu0YwGYyNgpagGhRYMtb93+m8pxhELXZOIASRPKxYMZ88nRcUdFoc/
	7vzX2gHQCgTvaLn/BHHMq6aK9h0Xe2pxTqswt1qxUuxDfb3Mx8uYE/XRYlRXjOTjyZdgaJTQ2oD
	A6ctU/EDEfDKoHgd36VMKtDZDwoqLuD2ZWT4l
X-Google-Smtp-Source: AGHT+IHBhdC6bIu+OUvh2/9MUIfVZ4322MIziLWRSqqoyhN8m3aSUYdBf6eczrknAyRrGPzpddise14uOfk/VInbMs8=
X-Received: by 2002:a05:6402:4304:b0:572:988f:2f38 with SMTP id
 m4-20020a056402430400b00572988f2f38mr106828edc.6.1714485839629; Tue, 30 Apr
 2024 07:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404302139.175c602f-oliver.sang@intel.com>
In-Reply-To: <202404302139.175c602f-oliver.sang@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 30 Apr 2024 16:03:45 +0200
Message-ID: <CANn89iJh7L_2b4YfMAcjrOF9-PSqTYA6XYNjjLmVFT8MBg60fg@mail.gmail.com>
Subject: Re: [linux-next:master] [tcp] 8ee602c635: lmbench3.TCP.socket.bandwidth.10MB.MB/sec
 -21.8% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 3:45=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -21.8% regression of lmbench3.TCP.socket.band=
width.10MB.MB/sec on:
>
>
> commit: 8ee602c635206ed012f979370094015857c02359 ("tcp: try to send bigge=
r TSO packets")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [still regression on linux-next/master bb7a2467e6beef44a80a17d45ebf2931e7=
631083]
>
>
> testcase: lmbench3
> test machine: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70=
GHz (Ivy Bridge-EP) with 64G memory
> parameters:

I do not think I can spend time on this regression.

TCP performance is very sensitive to various factors, like packet
sizes, cache sizes,
sysctl settings (/proc/sys/net/ipv4/*), application design.

Making TSO packets bigger can increase p99 latencies, that is for sure.

>
>         test_memory_size: 50%
>         nr_threads: 100%
>         mode: development
>         test: TCP
>         cpufreq_governor: performance
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202404302139.175c602f-oliver.san=
g@intel.com
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240430/202404302139.175c602f-ol=
iver.sang@intel.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_threads/rootfs/tbox_group/test/=
test_memory_size/testcase:
>   gcc-13/performance/x86_64-rhel-8.3/development/100%/debian-12-x86_64-20=
240206.cgz/lkp-ivb-2ep2/TCP/50%/lmbench3
>
> commit:
>   d5b38a71d3 ("tcp: call tcp_set_skb_tso_segs() from tcp_write_xmit()")
>   8ee602c635 ("tcp: try to send bigger TSO packets")
>
> d5b38a71d3334bc8 8ee602c635206ed012f97937009
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>      50684           -21.8%      39620        lmbench3.TCP.socket.bandwid=
th.10MB.MB/sec
>      10.17 =C4=85 41%     +83.6%      18.67 =C4=85 15%  perf-c2c.HIT.remo=
te
>       0.10 =C4=85 71%      +0.1        0.22 =C4=85 16%  perf-profile.self=
.cycles-pp.__tcp_push_pending_frames
>       0.66 =C4=85 72%      +0.6        1.24 =C4=85 14%  perf-profile.self=
.cycles-pp.tcp_write_xmit
>     965580 =C4=85 83%    +150.9%    2422689 =C4=85 51%  numa-meminfo.node=
1.FilePages
>    1617434 =C4=85 52%     +91.0%    3089919 =C4=85 40%  numa-meminfo.node=
1.MemUsed
>       3863 =C4=85 14%     +24.5%       4810 =C4=85 11%  numa-meminfo.node=
1.PageTables
>     612236 =C4=85149%    +218.4%    1949210 =C4=85 61%  numa-meminfo.node=
1.Unevictable
>     241348 =C4=85 83%    +150.9%     605612 =C4=85 51%  numa-vmstat.node1=
.nr_file_pages
>     964.36 =C4=85 14%     +24.7%       1202 =C4=85 10%  numa-vmstat.node1=
.nr_page_table_pages
>     153059 =C4=85149%    +218.4%     487302 =C4=85 61%  numa-vmstat.node1=
.nr_unevictable
>     153059 =C4=85149%    +218.4%     487302 =C4=85 61%  numa-vmstat.node1=
.nr_zone_unevictable
>   51738871 =C4=85 15%     +27.3%   65841641        perf-stat.i.cache-miss=
es
>       0.45 =C4=85  7%      -7.5%       0.41        perf-stat.i.ipc
>       1.29 =C4=85  2%     +17.0%       1.51        perf-stat.overall.MPKI
>       9.45            +1.9       11.39        perf-stat.overall.cache-mis=
s-rate%
>       2.67            +3.2%       2.75        perf-stat.overall.cpi
>       2064 =C4=85  2%     -11.8%       1820        perf-stat.overall.cycl=
es-between-cache-misses
>       0.37            -3.1%       0.36        perf-stat.overall.ipc
>   51471548 =C4=85 15%     +27.5%   65638078        perf-stat.ps.cache-mis=
ses
>
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
