Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2A1210E7
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706726572; cv=none; b=Y3oTRSgUFhvvCSkvfetvcy94mwOIxCPP47SVUXuVecvrwXJkG2/9JFcm3ooj+pbNY0lJNou8QeCkeTfknfy+kij43PPSQMa6wHej/w01v0g2pSvw0BHNOUW6xRMUu88Zc6XbPE8z897/PfRvSzPB95LhIo/uP0puXa2IOuSO7U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706726572; c=relaxed/simple;
	bh=g+95offPxJ64LZzxB+gaQvWSHhG4N0spr/h/1jn42UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjnOrgjRp8R7aaHKcI/J4gvO5Wo/q1Ij4slvom2rMajh4p7XQzGlvZdXQK74UCrsKf4qfdx0hOLNpkvOcezZiI5og6e5fX2bEqPrffEGJH0oJ0M6ZDW2u1X6I7EFDobeXpS4I8tRzmwngqbUAAsUOk+vi5+lSPa5l1YQiKWNHtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Vb6wcvpo; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Vb6wcvpo"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7c00a2cbcf6so236039f.1
        for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 10:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1706726568; x=1707331368; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZgL5P8g30IZu5klPkGNY/NRSwCJ5aP7SFCOzIS4LR8E=;
        b=Vb6wcvpokIgu1Cv3vA9M7BpFfmnjzlZbyM/SkMJWqb8nfuVZHB/1KSqy5kJYhOnUoG
         Yrc/9hadl80O1GPn1lc+1g9Y/8UFUdwqPnWZ28W7HSSmUuTWIlhPuIPt4s/6X1rVPL0o
         ikU3Gr/EVxwqpHmosV2knzfg/kJmaNtPwNvDdZtemjkNeCUbFjOQeTFoQSSXjV3mJ3cT
         WPaPprhTXMFANcB1wD2q8JCzYbVh4WcgJkrmRKeI2cIYaYlzrI5bQq1kLw+3GRhBeLr3
         OZRdmgkiFo21BPNgkLJfD7EZ0c0j9288iVjZfBypB8WnD2OaaosUILpO8JEiRpMcui3V
         gWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706726568; x=1707331368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgL5P8g30IZu5klPkGNY/NRSwCJ5aP7SFCOzIS4LR8E=;
        b=Fdp38IQRI8zdeuiXK5/q5G3+BbU+9HApPd9dJxUEXcKY77XDQhLEsdkBJ1L6riaJxB
         J9G4gp7wW/1/PKaszbnxp6TToYupjvnwisRbUZbc/0DO2SsE07vokvIWHGEO+D/ER6Xc
         w2jt/1TN2UVk91mSfsZcJUIg7wXGDH6AevkBtBeSHKJGhXzMFv4ylI3u7P3xCiYBlJcZ
         WHBcW7gxahLN7d5bNKa3/A0Dsbp2SpgXkuG0UbBscF83eChyTLAr17r8tDtmGDrEwKXK
         PYT+P4kFubWaOT4gzQkDYqsDv11ailjx4SOa2k5Gf05J97IX8s70pbly/mcInhjnAb3i
         ljqg==
X-Gm-Message-State: AOJu0Yz4zghegW1+eq4Ss0mpNqt95UqVCoIfuz5pf4dc2dcVX6yiYjvF
	XVHX7ULBzlvW8NeHdNLK9cG9t6O1gJe4iD3X6QvqGFsqRZTDEBjOfwgDWnMjye0=
X-Google-Smtp-Source: AGHT+IFDK/JhsIHBaCKUbglY7f+q7PzhFMFkcVFU4b2TomNZpKjKx05Soo4VP27ZNNL1f2oQZHc+4w==
X-Received: by 2002:a5e:db49:0:b0:7bf:b18e:fccc with SMTP id r9-20020a5edb49000000b007bfb18efcccmr444783iop.1.1706726568053;
        Wed, 31 Jan 2024 10:42:48 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id a14-20020a6b660e000000b007bf7be3dd69sm3327513ioc.7.2024.01.31.10.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 10:42:47 -0800 (PST)
Message-ID: <9d2f99d8-ecd2-413e-b910-18e05239a2b8@kernel.dk>
Date: Wed, 31 Jan 2024 11:42:46 -0700
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
To: Bart Van Assche <bvanassche@acm.org>,
 kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-block@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com,
 fengwei.yin@intel.com
References: <202401312320.a335db14-oliver.sang@intel.com>
 <da4c78c1-a9d4-4a57-9765-2e6c35fa1062@acm.org>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <da4c78c1-a9d4-4a57-9765-2e6c35fa1062@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/31/24 11:17 AM, Bart Van Assche wrote:
> On 1/31/24 07:42, kernel test robot wrote:
>> kernel test robot noticed a -72.9% regression of fio.write_iops on:
>>
>>
>> commit: 574e7779cf583171acb5bf6365047bb0941b387c ("block/mq-deadline: use separate insertion lists")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>> testcase: fio-basic
>> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
>> parameters:
>>
>>     runtime: 300s
>>     disk: 1HDD
>>     fs: xfs
>>     nr_task: 100%
>>     test_size: 128G
>>     rw: write
>>     bs: 4k
>>     ioengine: io_uring
>>     direct: direct
>>     cpufreq_governor: performance
> 
> The actual test is available in this file:
> https://download.01.org/0day-ci/archive/20240131/202401312320.a335db14-oliver.sang@intel.com/repro-script
> 
> I haven't found anything in that file for disabling merging. Merging
> requests decreases IOPS. Does this perhaps mean that this test is
> broken?

It's hard to know as nothing in this email or links include the actual
output of the job...

But if it's fio IOPS, then those are application side and don't
necessarily correlate to drive IOPS due to merging. Eg for fio iops, if
it does 4k sequential and we merge to 128k, then the fio perceived iops
will be 32 times larger than the device side.

I'll take a look, but seems like there might be something there. By
inserting into the other list, the request is also not available for
merging. And the test in question does single IOs at the time.

-- 
Jens Axboe

