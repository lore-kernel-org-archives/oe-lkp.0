Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D34F5647E
	for <oe-lkp@lists.linux.dev>; Fri, 15 Mar 2024 19:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710532524; cv=none; b=FtLXsNMiwBSxfvx1XI0AvgDXKkm6/dFamFsQ2xlvBKZqD1e3SMxZscgW/RFbuJdNLmmbGNJM+hH9wkMEsLwZ8vZAAbJ8eMAaa0zBd4Fdvc1PNNDTLLnyiSRZu1pKWEoVe4JWgB+gQ7ha/MpfqoVaeRf6YQf/wQjLXUd07TBSVvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710532524; c=relaxed/simple;
	bh=J6PKphrZR06vT6aM+gdKE+v15HtoN6dbFcpt+pGRX+o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UyZVGw099on/dDbIyBUvNgCNVUyqZ0rSj8HsPhNE1mbwQg2P/Nm/Unp7B8ncE7QPbx09U5kt8NzDG/TczN029xGc0ZnFeOWosxcP/lebZTSVnUUqXFIz3f7JxjEwdLvXHMLn0D0IpXfx7UbjJ5agBYAJd3qABXBP/cXhNLaBJo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sEIwHEwT; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sEIwHEwT"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-6e6b6de7383so2116876b3a.1
        for <oe-lkp@lists.linux.dev>; Fri, 15 Mar 2024 12:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710532522; x=1711137322; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yxyVTUGycMtYWiSqNQA2N1Tj7Ge76hIQfNcRcR5oHf8=;
        b=sEIwHEwTSpEVbABoGRMHLSgaSw30iof59AWY0KWQIQUY4r10MA8skBznBqwaelrF4d
         jzoUNclNz6ZvHxBQWbvk13QG+pRTc8F4j2mK98RQF6vDhYklG9TUBEv6mfyb5yI3HlZz
         l2UmcxbdPnzE70lSQ4pmrm4fHrlSunqjZ9/0ngaXKw5zEvo1KpdbVRp8XGhQOhm3/zKd
         Khzl1wnkHhK4LUvgBECVWOH8Tz70BAVVB69RTwFx5xyQQMAtDKPEjlDJInBMb6kTtXAz
         vLn6u0ZZp0eM2hVwoUeRT5mLHUy95VSOilObNIwISB4zT7EOt/CIyh0tn4vz0PMor/wo
         n9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710532522; x=1711137322;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxyVTUGycMtYWiSqNQA2N1Tj7Ge76hIQfNcRcR5oHf8=;
        b=UCsDichWJA+0tukJ5URj+70Zj2PNsn7lMe81wkEjKi0ql0ZJErlBhsv2WJFN0ZOjEN
         wnFnBTEB2PcoClVAAvlbD7GH/Wcijqj9hr0CXRSOEJEmbwEq/L72jCXHWnvcrzLis5ij
         ylBzAFfwUwb9fnUQHTqGWWQNZFZIUg71mXRuMAf93bQOhlmMvumwUhKg2XhnQkbSzGmN
         BaoOez0NhBwLq4NrZrBE3qNrhcsg1+JAg+iZztujKo/Poj/yJLZv9W7mUwQf/Y0wgPlK
         QRg8zcbuF61pc+uzz/ZIuaq9+6Icwf8cZ/INMlYR87c2QRcxcxUC9bTDwAfky+FUkyg0
         iFyQ==
X-Gm-Message-State: AOJu0YyV0ZsxXqxw5G3YCy7TkszPLyKv9yFdItPXkuJWb0KkqjkivWcn
	7q6CrDNZnIa1JgtgiN6zETDwLWh65X65VGqHrDOujtNS40hMtn9Xcp3+/GVvBxm7GbBT8XuwnRS
	aZQ==
X-Google-Smtp-Source: AGHT+IEMtCqxevjMlBgShcDqmIvoX0aabbMfq9kTGHCGc9Q0Ud9Vyavfn60pnT3bfVR8zK01ozt0Yd1y/sM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:84c4:0:b0:6e6:985c:987e with SMTP id
 x4-20020aa784c4000000b006e6985c987emr38651pfn.3.1710532522246; Fri, 15 Mar
 2024 12:55:22 -0700 (PDT)
Date: Fri, 15 Mar 2024 12:55:20 -0700
In-Reply-To: <202403151639.371a9400-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202403151639.371a9400-oliver.sang@intel.com>
Message-ID: <ZfSnqIu3qw_pC7_O@google.com>
Subject: Re: [sean-jc:x86/disable_adaptive_pebs] [KVM]  ade86174dc: kvm-unit-tests.pmu_pebs.fail
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Like Xu <like.xu.linux@gmail.com>, 
	Mingwei Zhang <mizhang@google.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
	Zhang Xiong <xiong.y.zhang@intel.com>, Lv Zhiyuan <zhiyuan.lv@intel.com>, 
	Dapeng Mi <dapeng1.mi@intel.com>, Jim Mattson <jmattson@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 15, 2024, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "kvm-unit-tests.pmu_pebs.fail" on:
> 
> commit: ade86174dc69254b50a67f836b2b8ac2c5644e11 ("KVM: x86/pmu: Disable support for adaptive PEBS")
> https://github.com/sean-jc/linux x86/disable_adaptive_pebs
> 
> in testcase: kvm-unit-tests
> version: kvm-unit-tests-x86_64-023002d-1_20230714
> with following parameters:

This is expected, pmu_pebs incorrectly assumes adaptive PEBS is supported in
certain flows.  It simply wasn't hit until now because all hardware that is
compatible with the test supports adaptive PEBS.  KUT patches are posted:

https://lore.kernel.org/all/20240306230153.786365-1-seanjc@google.com
