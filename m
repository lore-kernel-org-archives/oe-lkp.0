Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE691947D
	for <oe-lkp@lists.linux.dev>; Mon,  4 Mar 2024 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709543226; cv=none; b=fRUzePYQqR4WoY0qGXCOg1UFb8IpP0wSrTr4mjNPFlqF+D8fFRp000Q84SVoFokKV6FDOtR8O1xauE6hDILCJPtzmYV5cplNeT9tKMzUbDbicl4cjfMeM6gmtSkxhoqPiZcBhgOKH1x4j5k+KfeUl90qjNvEF1NC4NMpM8VBNLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709543226; c=relaxed/simple;
	bh=Zhhhdp/M6ZsLOqNS4ytbZTNOWoOtqdm2hbqiIKw8p1s=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b24uShSLnmOGUQmERAsgyJZ34cAsi5RBwTzJKLr6d5HxNdUbhQQ7tGwa1xNpfQC7t2x0wJmGgAWI5zIpRFB7ysFxHEhgUOjW5wc60QxAwH52JGfipZDakJryBy0nK+Zp1R8DgVL6R6O9yo0cUHQ2o6ZXBSdv4GbQCr+c3zGhe+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Voc6Td5I; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Voc6Td5I"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-512e39226efso3964245e87.0
        for <oe-lkp@lists.linux.dev>; Mon, 04 Mar 2024 01:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709543222; x=1710148022; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4DqcilsZP9EhZLGnuBOtOr+cfSGsEERN5zh397oSQO0=;
        b=Voc6Td5IoEExud5lRty4caN1LjgMQiV8iRUgWJCTnFnNnqZMAwae98B5ua4zuF22LA
         jv/EFgOyvb+JtQ+J4fXO0UZ0ajM/xKfSLbNeAdGUF8H5TY+beGijggsZdDxfzGmTe+GL
         NZ0IvlGCLa3NpT6d4Ie/Y/LFneViZwv8om7TaxBUqJFiaWx0l9avEgmFxEmx/wjLM/6W
         OoNTuNeVO5suo3pNwASr/1OhG1zEHZhzNDZUkgPSnoAIyM+ngxbDnSi1uIUrXAIEkDHF
         vMmZ4P+Hk6iaJ8xGE/4J+rqrTrn6bajB5/k7TVGUghR/FzzTG/mouxzjdIEm+tGxFn2X
         dzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709543222; x=1710148022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DqcilsZP9EhZLGnuBOtOr+cfSGsEERN5zh397oSQO0=;
        b=HVoC6UsvO8lmOtDeNotuwWRLmeM0XxJUigUz36UszAMDcqf3gJwBtc7A5lgZl3wrAH
         cu7/7CHlEisc5WaWbG4SuZWPIGZ88zQQraa8CS7/oH8dGFKAMYZ1lNMuBkgKiVjWW7UT
         HdDNHdY7e+DzNqnuzMm/wR7CCXjz1A8/rssYb76c2n6JgMUtplTBPbULgk9jFT28/rWn
         Ff/dG1+zOuYauOU09Y+ZR0hsdSjVQPw/D7TfxzbDFlYJxqAj50q3ki+05D7R9TF1CzIq
         UkIgmTRZ134rsK730Xt4muYF8s/raZFpByfAbe4UgRRHJ1HgJRpvrmZ+Mw7qcvcFxO6f
         IpWw==
X-Forwarded-Encrypted: i=1; AJvYcCVqEnRmm0LNOtYx759h6eyVtezwQNpppylCSRkSzOS+Y8tumFSHOpGSQ5MKaYktvZBx7gBDk+UERSW/7f8LOa+Bw3lryc0d
X-Gm-Message-State: AOJu0Yy1zV9AkpaAvKnPTdd1khs++y5HyrlJhmGMGrMVOgwL/XO7b+cq
	UdnlgOfF4gblww+KUS3ks1oqV2w8cOt936//b6qC8lu/Ba3z5roD
X-Google-Smtp-Source: AGHT+IHBUBv0In8u7A05VapXG8lPFOs9sg9a6V3dz1tXpQY1T0ylBgCdoYTCaOfGBWPedz92HXljJg==
X-Received: by 2002:ac2:5929:0:b0:513:28c1:99fe with SMTP id v9-20020ac25929000000b0051328c199femr5047817lfi.37.1709543222111;
        Mon, 04 Mar 2024 01:07:02 -0800 (PST)
Received: from pc636 (host-90-235-1-20.mobileonline.telia.com. [90.235.1.20])
        by smtp.gmail.com with ESMTPSA id r12-20020a19ac4c000000b005134b21892csm149169lfc.223.2024.03.04.01.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:07:01 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 4 Mar 2024 10:06:58 +0100
To: kernel test robot <oliver.sang@intel.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Christoph Hellwig <hch@lst.de>,
	Dave Chinner <david@fromorbit.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Kazuhito Hagio <k-hagio-ab@nec.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, ying.huang@intel.com,
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linux-next:master] [mm]  8f33a2ff30:
  stress-ng.resched.ops_per_sec -10.3% regression
Message-ID: <ZeWPMmwjWjGRsXMj@pc636>
References: <202402292306.8520763a-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202402292306.8520763a-oliver.sang@intel.com>

Hello.

> 
> Hello,
> 
> kernel test robot noticed a -10.3% regression of stress-ng.resched.ops_per_sec on:
> 
> 
> commit: 8f33a2ff307248c3e55a7696f60b3658b28edb57 ("mm: vmalloc: set nr_nodes based on CPUs in a system")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> testcase: stress-ng
> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
> parameters:
> 
> 	nr_threads: 100%
> 	testtime: 60s
> 	test: resched
> 	cpufreq_governor: performance
> 
> 
> In addition to that, the commit also has significant impact on the following tests:
> 
> +------------------+-------------------------------------------------------------------------------------------+
> | testcase: change | stress-ng: stress-ng.pthread.ops_per_sec 23.0% improvement                                |
> | test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory |
> | test parameters  | cpufreq_governor=performance                                                              |
> |                  | nr_threads=100%                                                                           |
> |                  | test=pthread                                                                              |
> |                  | testtime=60s                                                                              |
> +------------------+-------------------------------------------------------------------------------------------+
> | testcase: change | stress-ng: stress-ng.fstat.ops_per_sec 14.2% improvement                                  |
> | test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory |
> | test parameters  | cpufreq_governor=performance                                                              |
> |                  | disk=1HDD                                                                                 |
> |                  | fs=xfs                                                                                    |
> |                  | nr_threads=100%                                                                           |
> |                  | test=fstat                                                                                |
> |                  | testtime=60s                                                                              |
> +------------------+-------------------------------------------------------------------------------------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202402292306.8520763a-oliver.sang@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240229/202402292306.8520763a-oliver.sang@intel.com
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>   gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/resched/stress-ng/60s
> 
> commit: 
>   8e1d743f2c ("mm: vmalloc: support multiple nodes in vmallocinfo")
>   8f33a2ff30 ("mm: vmalloc: set nr_nodes based on CPUs in a system")
>
8e1d743f2c ("mm: vmalloc: support multiple nodes in vmallocinfo") this
commit has nothing to do with this test.

> 
> 8e1d743f2c2671aa 8f33a2ff307248c3e55a7696f60 
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
>       7.48            -0.8        6.73        mpstat.cpu.all.nice%
>   10439977           -10.4%    9351864        vmstat.system.cs
>   14670714 ±  3%     +18.1%   17330709 ±  5%  numa-numastat.node0.local_node
>   14688319 ±  3%     +18.1%   17348214 ±  5%  numa-numastat.node0.numa_hit
>   14538034 ±  3%     +15.7%   16824234 ±  4%  numa-numastat.node1.local_node
>   14556613 ±  3%     +15.6%   16834659 ±  4%  numa-numastat.node1.numa_hit
>   14685240 ±  3%     +18.0%   17334251 ±  5%  numa-vmstat.node0.numa_hit
>   14667635 ±  3%     +18.1%   17316745 ±  5%  numa-vmstat.node0.numa_local
>   14551744 ±  3%     +15.6%   16815047 ±  4%  numa-vmstat.node1.numa_hit
>   14533165 ±  3%     +15.6%   16804623 ±  4%  numa-vmstat.node1.numa_local
>  9.153e+08           -10.3%  8.208e+08        stress-ng.resched.ops
>   15220752           -10.3%   13651349        stress-ng.resched.ops_per_sec
>  6.584e+08           -10.8%  5.871e+08        stress-ng.time.involuntary_context_switches
>
I tested the "resched" use case on my setup to check the commit:

8f33a2ff30 ("mm: vmalloc: set nr_nodes based on CPUs in a system")

n=0; while [ $n -lt 20 ]; do stress-ng --timeout 60 --times --verify --metrics --no-rand-seed --resched 64; n=$(( $n + 1 )); done

1) One socket system 32 CPUS, 64 threads, 128G of memory:

 (revert 8f33a2ff30)         (with 8f33a2ff30)
  resched   bogo ops/s      resched   bogo ops/s     resched diff %
1105043856   18404843      1110469441  18491268          -0.49
1094766811   18231572      1117884383  18616359          -2.11
1103621287   18376740      1105661054  18411893          -0.18
1079532022   17973123      1101247950  18337844          -2.01
1099874899   18316050      1089695381  18144556           0.93
1076430974   17921542      1074824321  17899317           0.15
1071025136   17835263      1097552346  18276981          -2.48
1092038983   18182772      1103594553  18377955          -1.06
1099140652   18299703      1080602374  17994387           1.69
1100454122   18324364      1094512741  18227744           0.54
1092551777   18195189      1099387884  18305866          -0.63
1098877800   18297198      1095319518  18240721           0.32
1103042823   18366819      1086364199  18090137           1.51
1083722244   18046970      1073436871  17876677           0.95
1101988080   18350823      1080819704  17996891           1.92
1086171084   18087685      1080936227  17998387           0.48
1106178491   18419226      1078155643  17953565           2.53
1084124963   18053216      1087789728  18111601          -0.34
1076017418   17916972      1090240538  18153644          -1.32
1091438151   18174424      1094233215  18221998          -0.26

no difference.

2) Simulated a NUMA system same as your configuration, two nodes with
   16 CPUs each, in total 64 threads:

Do not post result here since no difference.

--
Uladzislau Rezki
