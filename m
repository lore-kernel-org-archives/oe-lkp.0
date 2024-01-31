Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C8E135412
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706725034; cv=none; b=UcCIb3VotvfvOstJ70Iin1DOSzEdnY19+25ePnRR2RTqvOqZZpfvYpSmgCwsG4SvaJ/arSdH5hBE2OZlxx4khWqLRDVqvdNg4ClmZssqZA1hxdIw6Hp3MGrSkXwBWVcSzs7c4ERm9j7FSbqfgqCnxDFTEsMQOSamg8xVJKeVa8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706725034; c=relaxed/simple;
	bh=LwcvarmvTq0SpQELkGAC4h7wKQTh3jcH3Oq3GOcdYEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUhgVfO34BITB8dCl9o+JS2EezAOwb1c9ouwlahAMtYUJG4br6RhbNxvDC6kJvAS65V9IpHmuJNEQqQ8QddBJ6hoTBGax1cTbvQHMqEB4tcNOPNZqZ390otlA4zXzEu0VHYP3rblI02+O81Qncr5G+/s/i+9T4Okn0sWSNXgo80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so111667a12.1
        for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 10:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706725032; x=1707329832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PA3XRl0mz498+Ej+1fuhjJ0OgFg4P0iQOiXSgU0TrvU=;
        b=IuAAHt5mvYwRcok910jju3HGc3LkSJGwwDyD4kvGllKBEeQWpkFCqzj03we40D7KVG
         ADx5WFEIvwSqOYWg42CzkyJrcI65wGEslJdk9YY78WeoOTAkt3v9XzV5lu5pM2XtFI7g
         BhmsjK+FERt/vkEkcNzHN8v0ScoNzfjBwUMaOdxHt8d4VSdrVRxIY1kKDBZHUypf1UU+
         lbdPj7DFi7IHOQBNgQZIhLldeH1koBOQqSLNA4MOJw9m5aB+taWBHtefcaJaMfVUGrDY
         7C7sfz8HdAwL0+gavvsTg9BI8R4nU8LmLvybYGPHUuZYGmBGdDkwUzc6zPv/eOARpZba
         TMug==
X-Gm-Message-State: AOJu0Yx6EBuQJnPv1ZYf3i2ONfOYe4qIq/+Nys/eiVxMDBzlzXJlrzxl
	a08Snuf8xM48ikQkhR1aFPPMYUjh5fQO5YDcg4JTamXa8BcqqBC9
X-Google-Smtp-Source: AGHT+IEbCmjom3mOczOnDlhu/2ZFc7jOChtagVDH9vSM6jIJgqxsYqOk6YUHPHpv4JFRsCmP8e326w==
X-Received: by 2002:a05:6a20:3ca7:b0:19c:997e:c1a7 with SMTP id b39-20020a056a203ca700b0019c997ec1a7mr2745296pzj.9.1706725032196;
        Wed, 31 Jan 2024 10:17:12 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:1d95:ca94:1cbe:1409? ([2620:0:1000:8411:1d95:ca94:1cbe:1409])
        by smtp.gmail.com with ESMTPSA id w11-20020a17090aea0b00b00295b93bfb24sm1834779pjy.22.2024.01.31.10.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 10:17:11 -0800 (PST)
Message-ID: <da4c78c1-a9d4-4a57-9765-2e6c35fa1062@acm.org>
Date: Wed, 31 Jan 2024 10:17:09 -0800
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
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Jens Axboe <axboe@kernel.dk>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-block@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com,
 fengwei.yin@intel.com
References: <202401312320.a335db14-oliver.sang@intel.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202401312320.a335db14-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/24 07:42, kernel test robot wrote:
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

The actual test is available in this file:
https://download.01.org/0day-ci/archive/20240131/202401312320.a335db14-oliver.sang@intel.com/repro-script

I haven't found anything in that file for disabling merging. Merging
requests decreases IOPS. Does this perhaps mean that this test is
broken?

Thanks,

Bart.
