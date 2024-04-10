Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EF717BB17
	for <oe-lkp@lists.linux.dev>; Wed, 10 Apr 2024 17:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712770855; cv=none; b=NQ+1uBtYEYOUlQ/MNYZ2TFFIKKxOOlsttvodNb46BRC4F3w/k+UzKbaHs5T1KA8x4w9+YmAJExu5A/weliRItt3U6pi0uYnenZI0dsCZ0jDM6+W8Kwfg8sOMxEtSATJs2p5cDWWb70CfaCPidsz4fN9TwhhJUYKajCXt/MtBqF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712770855; c=relaxed/simple;
	bh=1DeEdnTeIQz8/ytwdDvqfDoGyITY0d5ePIQsNHOvZbY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CmpSvIxT0c1C237XTMLqsrzppFmjM+dueBw+BgFtUsfssivoG/nr+h/Zb8hbUywvEsaIKLrgwVHXTh5su6nsw6s9MpZCivqnXuS0NGd+Qf3eym+1M7vfp/mOp58Uh0H+gTNeAGyh8/uuO6lR3/1bSmsnwNpMxNMHuvjeFgypb1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=WwnU1fev; arc=none smtp.client-ip=99.78.197.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="WwnU1fev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1712770854; x=1744306854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4SVmcBggwpqkzVI+Ox1qlpt5og72hA3UyEi8kqsUhes=;
  b=WwnU1fevqnKhVp4ObgiOOIAtBzGLy6UFpdTVdOnQ9Pub5/U6I1AMv9Jn
   kvQob5Es6csmSuXIVGdC2EE9dWD2MeAahmsPOLADGAKsUFvXwVmqNfd9h
   d4K2n5BJx3g1uwXOi6qXwtcWV9BArHQfUedagRvaKZmd7rYzFoE4RH1lP
   E=;
X-IronPort-AV: E=Sophos;i="6.07,191,1708387200"; 
   d="scan'208";a="80254628"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 17:40:47 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:36555]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.38.10:2525] with esmtp (Farcaster)
 id b06cd9b4-8f35-4baa-84fa-8758acfd6360; Wed, 10 Apr 2024 17:40:47 +0000 (UTC)
X-Farcaster-Flow-ID: b06cd9b4-8f35-4baa-84fa-8758acfd6360
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 10 Apr 2024 17:40:36 +0000
Received: from 88665a182662.ant.amazon.com (10.187.170.44) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 10 Apr 2024 17:40:34 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <oliver.sang@intel.com>
CC: <feng.tang@intel.com>, <fengwei.yin@intel.com>, <kuba@kernel.org>,
	<kuniyu@amazon.com>, <linux-mm@kvack.org>, <lkp@intel.com>,
	<netdev@vger.kernel.org>, <oe-lkp@lists.linux.dev>, <pabeni@redhat.com>,
	<ying.huang@intel.com>
Subject: Re: [linux-next:master] [af_unix]  dcf70df204: stress-ng.epoll.ops_per_sec -92.6% regression
Date: Wed, 10 Apr 2024 10:40:26 -0700
Message-ID: <20240410174026.9989-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <202404101427.92a08551-oliver.sang@intel.com>
References: <202404101427.92a08551-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

From: kernel test robot <oliver.sang@intel.com>
Date: Wed, 10 Apr 2024 16:08:00 +0800
> Hello,
> 
> kernel test robot noticed a -92.6% regression of stress-ng.epoll.ops_per_sec on:
> 
> 
> commit: dcf70df2048d27c5d186f013f101a4aefd63aa41 ("af_unix: Fix up unix_edge.successor for embryo socket.")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> testcase: stress-ng
> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
> parameters:
> 
> 	nr_threads: 100%
> 	testtime: 60s
> 	test: epoll
> 	cpufreq_governor: performance

I'll add few checks so that non-inflight listener need not
hold gc lock during accept().

Thanks!
