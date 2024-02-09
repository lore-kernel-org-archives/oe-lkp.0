Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059E216426
	for <oe-lkp@lists.linux.dev>; Fri,  9 Feb 2024 21:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707512770; cv=none; b=ZpTAON3bkwxOIipuUrKYY3GWCGjMLfsbUj/p9GUJKU5/4MDDrc4gz7zn2MmTnxPSya2Hc/FN95oId+Oea8b0tDuezMhhaDllMkGiX5gFV/XZydK/ULbMKBzzqgfSD+zjuIEu6eHdadC0AwyhSEbOsxNqBb966JVmU620K+pU6QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707512770; c=relaxed/simple;
	bh=UO1A3Fct17+/hJd8or2MUtzr0RTkRI4EFJgLeSzlNSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njgdUmahzPY1Z6+UyNAhMXcXMafnf6SYtccbHP9HYQvBiJohg6AkUftZ6ftVpCoA2S60kt400XTQhlMwF9GKIDQCaxuz/2A1vVPnN7TV7UaNJne1xbzkTyUrK0aPUAoj2N4UzfZjKyhMTBmO4Lv0dJKjXBuX9VbugCwsm4EL27g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=XYeM3paz; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="XYeM3paz"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7bbdd28a52aso25246339f.1
        for <oe-lkp@lists.linux.dev>; Fri, 09 Feb 2024 13:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1707512765; x=1708117565; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TX8kZJ4jfhuvDuckYH8MKVN4C0WBzbq4xbrMJJT/w90=;
        b=XYeM3pazgOBHBWwuwGbCDmMPzC1U3WDQAiTuMYNLyR0YOpmEqq4qvTNd8XioqJQRZF
         PomoeDtubKOJaytxe4huE/D1s7ZLuEE4PCXT8+/Q2JBQGhUN8b5csrcV4D9mYnyVrCle
         ptlq5vMSaGRzkXQXOlFIayhsYXaY/MRXmzGPPJNCvk166XAZPfOrjzgC+9OoM21fiPSq
         vTuwrO07pDilsS89/a5RRk/7+tsYRct0+O70x3S3at6OSXD584HD8+ngJBmTdew67+pj
         p7y7UYksqkX9RguGqd5exr0QDuTEF1JYixIB/6G7DmUzp9t6lCrT79x7pl/KmH+Q3rHI
         slAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707512765; x=1708117565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TX8kZJ4jfhuvDuckYH8MKVN4C0WBzbq4xbrMJJT/w90=;
        b=PULidYXvU1WNRkzIxQG5qWiSzrFBgsiHPld+Akjl+U0VHuekcTbtwV0P/Qvdx+Wy8k
         tJUvPF0qG//CdPnRdP6sZ+8mZGBXZ5d/J0LMQq8WZVtMGRSM5x57zo0UWzejgJF6lg+w
         gesMN7flpw/6tjp+lAgS+X73Qm3MTFccUrPa6wk96+vU7pZK2+a2iCHcBsTruLFA8ZZC
         TvcLotIFn5gk6BW+fFUJhshtR3xcK7N4+H3nrCRJsZoW5F08M8hBMF5V3myPYZjQk7f9
         GhSoV8lXC8hWfQkHB/mWLV9G1wHvkl0Nv6ZvjTbVE+OSE5JYuIJjOL7iiayvj7NftDB0
         lt9g==
X-Gm-Message-State: AOJu0Yy0z2WspmtF+KKCuzyJaK9yeodsh4GW8DqQVyilnY1VVmF3ON5Y
	ydLhsRO0eRo3q7e7sn98QdiqSvMELFDRU3tBp/cZ6wwl5Ewmsli/DbmPbn8KGmJtEIKvl0w1+Ya
	Hois=
X-Google-Smtp-Source: AGHT+IG95+JDEa+gHhRbNQy0UP1KGGwCed76qGySgxKJ2T/oR18AoeRQqXBNBZUT4wqRzIG9cGuscA==
X-Received: by 2002:a6b:3f08:0:b0:7c4:655:6e05 with SMTP id m8-20020a6b3f08000000b007c406556e05mr514508ioa.2.1707512765133;
        Fri, 09 Feb 2024 13:06:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW07vEn8HZ60Z4H7r5mCWcnVCXKNpcE4FhapsNAyty8vDlL29suKKWuje2252Pawcm034h3sOQ4+Tj7plSU2eol0G+VMUvqLgMSuJtL89jsB3LjjXv7kfgFSjufmRFudTbgNgkiAIKKWWmqhzxJJzXco18yKIUFwR9cfrMP9M0rSOPp1mHDdsU3J1vdpvucWbdzRidA5/V3DaCIpvSBZqaTeObWpGytGSRNcVYpqAIcD6EatbetMt6LKYQKIZAmvFXc78Ou9dT/tJtMfQG4417ma38ogHxJ/WMxLl8xWJwPJeMSQas5CabR+fitrHREYBuUdpeJdnezXwHP
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id n8-20020a02a908000000b0047153f09f83sm62054jam.13.2024.02.09.13.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 13:06:04 -0800 (PST)
Message-ID: <35989f82-3c6b-4c91-ae9b-db8791895b19@kernel.dk>
Date: Fri, 9 Feb 2024 14:06:03 -0700
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [block/mq] 574e7779cf: fio.write_iops -72.9%
 regression
Content-Language: en-US
To: kernel test robot <oliver.sang@intel.com>,
 Bart Van Assche <bvanassche@acm.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-block@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com,
 fengwei.yin@intel.com
References: <202401312320.a335db14-oliver.sang@intel.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202401312320.a335db14-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/31/24 8:42 AM, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a -72.9% regression of fio.write_iops on:
> 
> 
> commit: 574e7779cf583171acb5bf6365047bb0941b387c ("block/mq-deadline: use separate insertion lists")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> testcase: fio-basic
> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
> parameters:
> 
> 	runtime: 300s
> 	disk: 1HDD
> 	fs: xfs
> 	nr_task: 100%
> 	test_size: 128G
> 	rw: write
> 	bs: 4k
> 	ioengine: io_uring
> 	direct: direct
> 	cpufreq_governor: performance

I looked into this, and I think I see what is happening. We do still do
insertion merges, but it's now postponed to dispatch time. This means
that for this crazy case, where you have 64 threads doing sequential
writes, we run out of tags (which is 64 by default) and hence dispatch
sooner than we would've before. Before, we would've queued one request,
then allocated a new one, and queued that. When that queue event
happened, we would merge with the previous - either upfront, or when the
request is inserted. In any case, we now have 1 bigger request, rather
than two smaller ones that still need merging.

This leaves more requests free.

I think we can solve this by doing smarter merging at insertion time.
I've dropped the series from my for-next branch for now, will need
revisiting and then I'll post it again.

-- 
Jens Axboe

