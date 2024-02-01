Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472105CDE3
	for <oe-lkp@lists.linux.dev>; Thu,  1 Feb 2024 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706794814; cv=none; b=rzRsYSl6YI/QUxX0I75mfGhWvZgfc27CIK27Y06WmKZOexc2OhZQyX0KNh+cC69O2h0RQQU7YyeCWyl9HPFHt986oUwJMXoAionvlZIXCDIZRTQCwgTh5SMOlX4CB9f4OqruFrgN98ggP1obJ+2bjmiIZEnIbVklWlZZxl3AM2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706794814; c=relaxed/simple;
	bh=XQbH904LAY+JQnudw6Wgq/v8lL7Lc6EeA9b9hd2uu0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VI6D9VvU0F0jU+Bst6IxShMHQDwILAYxfPNNqIv4Kea2WmiV7o1pdrpRQLeZf510nknH7ls1UhThlNcNMul7asfkIv7f3vRfmjXHeHXHD9w5ANqy28mBiPJNBDsEUOzjL6VzMMx9mEuoYf9ACzC324xg2Wa5TgK5MDOIGQZDED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=iU+AVGpp; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="iU+AVGpp"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5cfcf509fbdso126378a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 01 Feb 2024 05:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1706794810; x=1707399610; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9Tl8kuFfclMhhTVxm/oWitPhp2Nx4l75IVTGKrZREI=;
        b=iU+AVGppCFvxazMycfln3qeIgDEj/f8U6WIaFAls91xHX6fOZTHJ1tkAk53B2K2zBm
         82Y6yGhIqsnzD5mg45l64MkJt7sc4ck5cBDPqFfgvNFfwxYFLtvGlE6zcjDnGRO2za0q
         WRMisD97pL6ZV3W5fP7f1q4p6x2AT/jtNA0LHiNnTma+GJpx5/LAdtoJpbL1S3Xufqi8
         hdgc8Po38OntGNsLcDKN2ZWyswRsU0XJ6bocAxNBO7ouFFEUOlAu1NaPruwR3d4g70EA
         h79pCCzFdgmAOEDfzUFOtqo3v8cq+3x4w77rG6MOOZ+VtAF4ZAJSzG6HyJlAOEaWubJf
         UBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706794810; x=1707399610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9Tl8kuFfclMhhTVxm/oWitPhp2Nx4l75IVTGKrZREI=;
        b=CtVnvnuHs4TV4pfp1M9+TSB6+XA9Ly4k2BYe6QS4DGfV+ofjJNZnpii22D43DgOlxd
         TiVZLTKl3K0tqHg4geVBKC99X+x1XSmVnUNgNZeZmDwFqd3CVCB2iyjNqCFN23RAvEC7
         z0z0WQ3Z+EShlkNSqfm5taLzexyyqTYxGw6FQb4HOjFwDyU8X0NXqZTL2gOfAhSqFBgX
         nXD+SwIe4kw7lsjX67kJ4CmoXW1pMPQPdgrlubIVJiQdvo+jrQBAW9JptTDK9e1QxpfK
         eJyZmViTJgoo467vHs0td2kE5CVDdhzYltcERRKkcWl1rbQ6l5hye6LpoPuoj6m2j6Pc
         09zA==
X-Forwarded-Encrypted: i=0; AJvYcCXaG7M4Qj6fKMWJXCFjtoHqgx8pejtK5VDTUex6i7TlQ40IMx3+cyjyo/TBMR7Hx5V3TPtVXmuB036O2i85xnV215V3a7x3
X-Gm-Message-State: AOJu0YxjgA3bcD6eHVr7JoiThDxgCG7RQYk83wk9DHMcLdT1FbGuHfqi
	zDIKzFybhY/6hcI+FXJbokMntIMLdjO2DBKmqIuFdHsoftljR1rP56wePj0N3A4=
X-Google-Smtp-Source: AGHT+IFw9K1O3lKafKcofcTeqHyWqk9t02ES2N7eBu525aHQTvzKt/oN04taiEnwdq3lggzDtRhSIQ==
X-Received: by 2002:a05:6a00:db:b0:6d9:383b:d91a with SMTP id e27-20020a056a0000db00b006d9383bd91amr2611229pfj.1.1706794810223;
        Thu, 01 Feb 2024 05:40:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXnSmrFf/l4827XxqXZcZoGtOvAf3BxO2fj6nMCEbrz64sCPLcYAKXtfcWd7LW1BDCtH/XycBlmSJ77679Bx9Xw/cidzoMONCOIsCnzi27CH9VaC1U4hL2IUQtw5ohwaWDY0yTP6cc0LxoB35qfetucXHyOUjq1wwIhB2itYtPu0vDcw32p54vvkbv7PiLFTpxTTN4gSpwi4soudTXxcIUbRRFrCq1vHrGOaGtPM2tMAsOdqn3b6YVwWwxWDWTYGgylda7LZm+5V/Xy4OFMcFOyDL6TVn4jtMx1F7TlIEr1nvQtJsJGSWhXHy4ybMc6rJf8mKqEJDcMJYsU3FDVOA==
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id h21-20020a056a00219500b006dd8985e7c6sm11737980pfi.1.2024.02.01.05.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 05:40:09 -0800 (PST)
Message-ID: <d15a1759-1abf-47aa-8766-88c531023164@kernel.dk>
Date: Thu, 1 Feb 2024 06:40:07 -0700
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
To: Oliver Sang <oliver.sang@intel.com>
Cc: Bart Van Assche <bvanassche@acm.org>, oe-lkp@lists.linux.dev,
 lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-block@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com,
 fengwei.yin@intel.com
References: <202401312320.a335db14-oliver.sang@intel.com>
 <da4c78c1-a9d4-4a57-9765-2e6c35fa1062@acm.org>
 <9d2f99d8-ecd2-413e-b910-18e05239a2b8@kernel.dk>
 <ZbtFqxCMkItFr6/5@xsang-OptiPlex-9020>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZbtFqxCMkItFr6/5@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/1/24 12:18 AM, Oliver Sang wrote:
> hi, Jens Axboe,
> 
> On Wed, Jan 31, 2024 at 11:42:46AM -0700, Jens Axboe wrote:
>> On 1/31/24 11:17 AM, Bart Van Assche wrote:
>>> On 1/31/24 07:42, kernel test robot wrote:
>>>> kernel test robot noticed a -72.9% regression of fio.write_iops on:
>>>>
>>>>
>>>> commit: 574e7779cf583171acb5bf6365047bb0941b387c ("block/mq-deadline: use separate insertion lists")
>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>>
>>>> testcase: fio-basic
>>>> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
>>>> parameters:
>>>>
>>>>     runtime: 300s
>>>>     disk: 1HDD
>>>>     fs: xfs
>>>>     nr_task: 100%
>>>>     test_size: 128G
>>>>     rw: write
>>>>     bs: 4k
>>>>     ioengine: io_uring
>>>>     direct: direct
>>>>     cpufreq_governor: performance
>>>
>>> The actual test is available in this file:
>>> https://download.01.org/0day-ci/archive/20240131/202401312320.a335db14-oliver.sang@intel.com/repro-script
>>>
>>> I haven't found anything in that file for disabling merging. Merging
>>> requests decreases IOPS. Does this perhaps mean that this test is
>>> broken?
>>
>> It's hard to know as nothing in this email or links include the actual
>> output of the job...
> 
> I attached a dmesg and 2 outputs while running tests on 574e7779cf.
> not sure if they are helpful?

Both fio outputs is all I need, but I only see one of them attached?

>> But if it's fio IOPS, then those are application side and don't
>> necessarily correlate to drive IOPS due to merging. Eg for fio iops,
>> if it does 4k sequential and we merge to 128k, then the fio perceived
>> iops will be 32 times larger than the device side.
>>
>> I'll take a look, but seems like there might be something there. By
>> inserting into the other list, the request is also not available for
>> merging. And the test in question does single IOs at the time.
> 
> if you have any debug patch want us to run, please just let us know.
> it will be our great pleasure!

Thanks, might take you up on that, probably won't have time for this
until next week however.

-- 
Jens Axboe

