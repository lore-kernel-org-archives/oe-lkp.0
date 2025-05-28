Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE9C26A0AF
	for <oe-lkp@lists.linux.dev>; Wed, 28 May 2025 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748421804; cv=none; b=epLhz2di1TnSm/rg2iEonVB7prvIwNfblkBL4kuNn4SWoDGxM3JHMkyFO7ICvKMqPa72xssomO4NC5aF+5kpS2rBls2Ymj2D4N+VX8L+l4hlYhO0DpisOnWr4SvjuTpd/1/JyLb7WT22gDfG/g2R2fh7LLH/XhYuxqgA1l9Gpt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748421804; c=relaxed/simple;
	bh=yxhEhoBz7qaYw/XJRNIf6vAQy7M0FuDpNnOOHahDEr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I9XWl0vSXJclRrxNezQjnNPTm8aqobRuhx4BI+5NFdsleKdHGo+y6C6kPqmXlwV1s4HbkZl2Z3w3cC9zz4Hb+mgCP8N+bHWLQhG7n34qkt9uiB+tb/7NZhVtCR+wwx7UZ5JagEDiMas0NgrSc2kAiCyE/UC3ielokNmRU4lSX4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJQIv3IY; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJQIv3IY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3109fb9f941so4581402a91.3
        for <oe-lkp@lists.linux.dev>; Wed, 28 May 2025 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748421802; x=1749026602; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g888CBxOK3KTLCYB5LemVbXDX0bJq5p0h5vR7u+0bvg=;
        b=HJQIv3IYzMsT1Xe3723o5mwNITAxT5P3V5nimtZNr1czZKvPLqZXKLnBvb1Gv7ug3r
         WfGhzPYSebkSNu2rQRF0L6SsuEz7K8kJzGECfu3EX5Dj96zTtH9japOk934IG0b7RqRb
         J3ERcHlRfoOGRj5TQ1bsHqsHDMLE4yPPLRvyyGWKL26FPoBkRTMnyCO4XtogI/t2rQmE
         OFuQeftbynyBlTjLE5RD88H4L8s4ImHsckVLaJZcFgygPGcWGZeGaY7ZHQHuFD5qiYaf
         kB29Q7C4iVJA1tl8STmFD0O8nupqV3a+1zXoaNSC99rW9Ca0eCHq2SfoJ3LMiVxNC8wV
         VPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748421802; x=1749026602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g888CBxOK3KTLCYB5LemVbXDX0bJq5p0h5vR7u+0bvg=;
        b=YmXJW2Dce/Ooksc7SMbXWxeq9c6YOYRCsFt15MobpxPKGHuhoPo5KRTn6sPLorp48S
         S+M/EUx3tz3S40/0X6x6R3jyWKYDAPJVmEECLdroBKy9ZL8TEzdAGZbu1K3FayDZ7jsh
         pCsnAvoN/EFzk3N/bUD6OyrMljyhk4CnUPy4vmpbO0VPWZljqG+FnwZCwavdUt71jQu8
         Y4z+Dg6Nnj6VKYxYNi2jEK2B/IVU8lXIdQlEVizLu2XCqebVH2QWpvDn+AATSIQBg3n5
         A3OzS+SuEzj8jCN8eU2baepAcH4lTwPnh+jFVKoKozXLW0tqhXU8l2HcFqTALR+pmMAa
         qtzg==
X-Gm-Message-State: AOJu0Yw+gdTFF0RbjK08HFia6cT2NVYQfvvBgvFait67+gCzsLsvnS6R
	Ncg7KCAKKFEPil1uxZ65ll7rY1ObCLZiARP7Sx/G2IBX/hwzSbaXifyi
X-Gm-Gg: ASbGnctRdkEqiP958/+Ht71zZOr3L2opUtZuLaho3bUwZPyub69NxwTtn6qZA+ZMNTu
	Zi4EMYcTWshZ49ppcExFERpUM6VfIrwy1INxkSGEV78jt3ccPY+nUtr2cVQM4EFZoIkYFwvoLqF
	gz4Y8ewBXVc9c97+9LvjHdGEp57IgmIMt9W0tnZKtwQpf+BVhhyQRoVr6vUslSXYlFnysLB1Cdw
	ZlKBsjdsi4zmxc5SiXKuLC8j0PgmVpIbHuG4s10WN9MP0t0q07PI8yPBddg1idV8qy4huggg/dD
	prvbCDJU45dRiaDsTGLDbamAZ2dh6exvTkiQPQvedvN5wPpHAdw2aB0JnNAhy0GPDaYMwhKz0rB
	q7c5win29HNh431ViaMSGURDS1az/eDGQfFXtWpPT
X-Google-Smtp-Source: AGHT+IE4e5WRNj+Klg1eLOb3Kn0QHnfZXPiISRnfdLcRp7Xcbhy+m52GO9srbabitegeavu2bfCf3A==
X-Received: by 2002:a17:90b:3ec1:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-3110f72c9ccmr21964510a91.30.1748421802457;
        Wed, 28 May 2025 01:43:22 -0700 (PDT)
Received: from ?IPV6:2001:ee0:4f0e:fb30:a891:19f9:7518:3664? ([2001:ee0:4f0e:fb30:a891:19f9:7518:3664])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-311a4f6c4absm2737921a91.0.2025.05.28.01.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 01:43:22 -0700 (PDT)
Message-ID: <0bcbab9b-79c7-4396-8eb4-4ca3ebe274bc@gmail.com>
Date: Wed, 28 May 2025 15:43:17 +0700
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [selftests] 59dd07db92:
 kernel-selftests.drivers/net.queues.py.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Jakub Kicinski <kuba@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org
References: <202505281004.6c3d0188-lkp@intel.com>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <202505281004.6c3d0188-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/25 11:57, kernel test robot wrote:
>
> Hello,
>
> kernel test robot noticed "kernel-selftests.drivers/net.queues.py.fail" on:
>
> commit: 59dd07db92c166ca3947d2a1bf548d57b7f03316 ("selftests: net: move xdp_helper to net/lib")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 176e917e010cb7dcc605f11d2bc33f304292482b]
>
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-7ff71e6d9239-1_20250215
> with following parameters:
>
> 	group: drivers
>
>
>
> config: x86_64-rhel-9.4-kselftests
> compiler: gcc-12
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.00GHz (Skylake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202505281004.6c3d0188-lkp@intel.com
>
>
>
> # timeout set to 300
> # selftests: drivers/net: queues.py
> # TAP version 13
> # 1..4
> # ok 1 queues.get_queues
> # ok 2 queues.addremove_queues
> # ok 3 queues.check_down
> # # Exception| Traceback (most recent call last):
> # # Exception|   File "/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-59dd07db92c166ca3947d2a1bf548d57b7f03316/tools/testing/selftests/net/lib/py/ksft.py", line 223, in ksft_run
> # # Exception|     case(*args)
> # # Exception|   File "/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-59dd07db92c166ca3947d2a1bf548d57b7f03316/tools/testing/selftests/drivers/net/./queues.py", line 33, in check_xsk
> # # Exception|     raise KsftFailEx('unable to create AF_XDP socket')
> # # Exception| net.lib.py.ksft.KsftFailEx: unable to create AF_XDP socket
> # not ok 4 queues.check_xsk
> # # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0
> not ok 7 selftests: drivers/net: queues.py # exit=1
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250528/202505281004.6c3d0188-lkp@intel.com

Looking at the log file, it seems like the xdp_helper in net/lib is not 
compiled so calling this helper from the test fails. There is similar 
failures where xdp_dummy.bpf.o in net/lib is not compiled either.

Error opening object 
/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-59dd07db92c166ca3947d2a1bf548d57b7f03316/tools/testing/selftests/net/lib/xdp_dummy.bpf.o: 
No such file or directory

I'm still not sure what the root cause is. On my machine, these files 
are compiled correctly.

Thanks,
Quang Minh.
