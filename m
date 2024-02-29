Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6400B70AE1
	for <oe-lkp@lists.linux.dev>; Thu, 29 Feb 2024 18:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230900; cv=none; b=pzMzFUtOn5beAdxLQkZDiIsPmVeesN5VDn7OcaM4epdMiFL/207dF7HagUSd4eTPgXgqgqugrQHPoK+6HWBbEy++OBAkZaGTFmVQOS834DxJDMJE8JbxMw+AVmtVRw71Ulvj35RatQZA3YP2ddYWPVT9RpP62hkKFBNf1sro46s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230900; c=relaxed/simple;
	bh=ePdbq3/yJRDC4q3G3UfaiDr+tZS/UA1gPJbdkOJZJSk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tk9iN4oQxgV1swkFp+10JvWVWkR3h2K0TobKb/6PTyqWKyHC7muhBGpXDjtjI/nw943aSULbenWmwCmtmeYRWd4Iqp5BjvOJv4iXJysc48MGLiw10CRVRbSPkTkd209cGMt8DAReOTwnZD4H41GDmGBumXCb7dsSpo9Xsdtbvm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcBnV7Nb; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcBnV7Nb"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513235b5975so1670382e87.2
        for <oe-lkp@lists.linux.dev>; Thu, 29 Feb 2024 10:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709230896; x=1709835696; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I7dUpA/JSnKM7NVeHbNRp8SZvT8BOwQ5zTunHH85Xrk=;
        b=PcBnV7NbN1TFffEXN0CjJCVlqPldgALUo7e/5n10/nGgHbWkRNtxOj4LaYA708PZ43
         xo5w810xhho+gn3bu2kU3F5ErVXZbFerDpY5BlDax9cYyN/6ONK74tQAqhBwBA/dtese
         bMYV+1zUDdLYaLD783l9LbIHOcrqTTMKpUxdgmndzs8GckVR0oFMoUYbb1AJS3+GIihZ
         dWttrDWn0QrnsXB5sqb8EqVpwm/RtOIf9oOAYSm8zIQiL96xc9kBULOW8WU33U0lzQBP
         /0Jwm+wct+2deQZHgTv4MfNNd+VXqjy1xyk5/v7rH5Pq9z4SFrUD8VJUqb1+/gVEG9JR
         /YrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709230896; x=1709835696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7dUpA/JSnKM7NVeHbNRp8SZvT8BOwQ5zTunHH85Xrk=;
        b=nqDZG+Le5aFOkm857/Y/ExcFWDo5jwjlhspCM43po2rYvGG8TZPe+1cpX1uRVzjBxe
         8pGcexJhNHgeG0PDDokqle08SLBgL2H0HigMaZYuBCYzTd3hK6xV68MAeOC1kE4IohF1
         bsA9sdbD2XB8x17nXetuBkFnl4D2mTHz2luB85N4kzcoC527m4ca5T6mvQS2a5CgOpuD
         girZKr/FZTeRUoNMKyFEF++Qm1GOJgySUaMRTiw6LlhPmGRMNfPSWHF0PEnAb2R3JDcY
         lY+u3MWDfml8KnLlCWdXCxp/HBxHRB2JkP7VNcOGbAkKtt4mDk9KAKF2FJIERMhW8fnt
         EeLw==
X-Forwarded-Encrypted: i=1; AJvYcCUnchhebFVkhOpz0XCCRF8AcgLz4tp+9j3oG9QgQz3vy4PgDRWXk8Oay9heQrRWo365XmUgeMJdjjye+D6zrFWYK3ZwIQsF
X-Gm-Message-State: AOJu0Yz4s4rTNzmAJpvG7lJwnE1NPM7P9PAEZMiQYk5vsgaCI4XBA5qJ
	M8mRobvy+JZ0pw8/rnp7CAnELavoDnQjv5rv29K6pG8vpg1xb/3g
X-Google-Smtp-Source: AGHT+IFDsFd4/tZDg+7g1Uw+07kJvN2hDuXs3TkdnsNqE1ZkUH8gnUNI0aYl2rbkQwX+cmcnP2q0Mg==
X-Received: by 2002:a19:f503:0:b0:512:f31c:f0c0 with SMTP id j3-20020a19f503000000b00512f31cf0c0mr1997808lfb.37.1709230896314;
        Thu, 29 Feb 2024 10:21:36 -0800 (PST)
Received: from pc636 (host-90-233-206-150.mobileonline.telia.com. [90.233.206.150])
        by smtp.gmail.com with ESMTPSA id m10-20020a05651202ea00b005131c050bf0sm329224lfq.207.2024.02.29.10.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 10:21:35 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 29 Feb 2024 19:21:32 +0100
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
Message-ID: <ZeDLLMAix0-zAe7J@pc636>
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
This is good if i understand this correctly.

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
This is not. I am working on it to figure out what happens.

--
Uladzislau Rezki
