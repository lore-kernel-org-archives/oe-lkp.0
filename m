Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23582B9AC
	for <oe-lkp@lists.linux.dev>; Thu,  1 Feb 2024 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706797881; cv=none; b=AiW6PvDhIg9i5FzFHrhyoXjaZTaRK1H6kcEf/sHcxd3lW4R42sQ3bkaagtWNs3UKoOw4qWAn4/L7xTTVy9TTZj9+HlFT6ZPs5MmlTA72NPGo4CdAfDdHQOFh2Lcu07dWTxNUTv4NmmLpbYXVuUyfpd/FshwvBcaJ/jyJoWAOQbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706797881; c=relaxed/simple;
	bh=z/1qgTBjUJDYfxho5eXhrzlM37jcKxlm7QYoQEDlACI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qB9LLRzExbUg3FYqwsrD3arVR36l/OyIlfdYy7LTfa6vz11oRBTD0GjSzR5+s9qvrdJX/bQNCQCJEm6a0ntQ5BD7EQot74THuz2ssuvR9dwDwpxQIoowhWIjk+VM5kq9ObR1C5OplY68WtB0H4Ys4gtepDLjhyWaZ6ZqMc1Fj8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=gjK1nX4U; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="gjK1nX4U"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-29601e2d95aso267294a91.1
        for <oe-lkp@lists.linux.dev>; Thu, 01 Feb 2024 06:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1706797876; x=1707402676; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/dTVX6pxClkgwrpo39ncDD6CaHIctKZeaWD9GIB9NW4=;
        b=gjK1nX4UVYcEvldXo9ny3yZYC/EBVBUxbiukg+UHr3/7AvYlTGi67L+ZB3vSmD3FXp
         DFWe1u+PpvbwbZCAouotgOmU4of73X7N0CagrSZ5AjlGvQ29wQWc3h1ug2lwFn50kfCk
         GKrUtiwPnx3VqbQToLxABqTNjU0W3liG+pzh9gBJUB+fHOYfcSy/yCYvIFdgftA7gbc6
         QSlxgV0CKYYJBZ/Hys8n9+Chg5Hu9Ki5abzOsrv6amnOEiDpT4inp0m3Kf73xFN/v0mM
         zi/Lhu2Iqc7LUFFI9v4vvZocCHWAkmoudPrZxsNqRDWOUXREx1xKoPJuXY8wZW3O7lAk
         gdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706797876; x=1707402676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dTVX6pxClkgwrpo39ncDD6CaHIctKZeaWD9GIB9NW4=;
        b=aIA+qc27cNlWMaCWSXLQ1SdvIOExEw4OUAOm5EBF9b9VRIRjKvLcT+l5fV9TkhVUi9
         GTa9+tiqunFZ/rPe4CkrQZfDwAJn4b38Z3m2aqIdkIdoQlPuAGubwa/k2oBSSXYRE5Vd
         ciAtFkIdgKHqtJcKo2imlVDhAdT/tZFmTM4akS5yzttbEltj4LRM2l0sm/XfPYBrvsC1
         bLCt498rl6rmQH712m9wbIvpCrBSXceNGB9DdgLqp7ilaBBZqc7NUpjcqhgsfWtQzE3W
         VP7/VOGZEummXstxHoE7Am0Fn55tQMp2xRIkMySOlxAA4SPefpWei2iAyszUA3Bbux4q
         aTlQ==
X-Forwarded-Encrypted: i=0; AJvYcCUiiXVVuKdNJsaXwgmO6NBVoWmvAE68TnYwuAv3gl3YkquimECkGlpc/CoGCq3CUqGZXxUIZoesyjU00OabwiyGp32CPuPz
X-Gm-Message-State: AOJu0YwJCaEAxaHu6HTs75fbLFc0m8L21Ak9VbOXL9jIClS+qKSryf7F
	y9ytN44YLuLWZVkVPmSML+8tmNb0N2yzQoYmOdnif7ng0Pi3q8sYw+tslEb5Gpb6Lc70v7O/T6n
	KT3k=
X-Google-Smtp-Source: AGHT+IGjr3PB2u1hCazqyl/UID6CCPDJrrHd/ws2fUwZZdQsBc8VTptmDs1ULWba0p866rTSTOBJpQ==
X-Received: by 2002:a6b:c9d8:0:b0:7bf:cc4d:ea53 with SMTP id z207-20020a6bc9d8000000b007bfcc4dea53mr5626454iof.0.1706797854684;
        Thu, 01 Feb 2024 06:30:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVkvQdv9mMB4YBGEqQrVv/NU9tOrIDvVNLdF8HpP1cvgR5XF4fhdQ9uPu6z/meAnFpyTizrBa0QM2ZrPid9NDyqCL4TPyhZQq+WdClsBrISSLctRgpAUSOGd2hX5C1NzHZBKbiKivk1f/Y6UWNeJWIR+W+UahWqqBKo0XYJM0fIE0rv7WYUsUrS4hmPJvXy6y+1m3bcePJRIV0fdgp0aU3YCTZWc9W5ZgFx7uxfVeIUnRuo1RFjznhexTesohTPph2bCdlcg1KpgWXXu8b18loX3FyMgLlr7HZVe2Q6KM7+AEWxgKHyuKBH60sdVVCx6HnS39bx0IYJuf+tSkN8WQ==
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id g8-20020a6b7608000000b007bffb82bfcfsm2252911iom.11.2024.02.01.06.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 06:30:54 -0800 (PST)
Message-ID: <cf5236e6-a79b-455a-9afe-b5dbf27d33e9@kernel.dk>
Date: Thu, 1 Feb 2024 07:30:53 -0700
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
 <d15a1759-1abf-47aa-8766-88c531023164@kernel.dk>
 <ZbukvbmE3K8y+JdJ@xsang-OptiPlex-9020>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZbukvbmE3K8y+JdJ@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/1/24 7:03 AM, Oliver Sang wrote:
> hi, Jens Axboe,
> 
> On Thu, Feb 01, 2024 at 06:40:07AM -0700, Jens Axboe wrote:
>> On 2/1/24 12:18 AM, Oliver Sang wrote:
>>> hi, Jens Axboe,
>>>
>>> On Wed, Jan 31, 2024 at 11:42:46AM -0700, Jens Axboe wrote:
>>>> On 1/31/24 11:17 AM, Bart Van Assche wrote:
>>>>> On 1/31/24 07:42, kernel test robot wrote:
>>>>>> kernel test robot noticed a -72.9% regression of fio.write_iops on:
>>>>>>
>>>>>>
>>>>>> commit: 574e7779cf583171acb5bf6365047bb0941b387c ("block/mq-deadline: use separate insertion lists")
>>>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>>>>
>>>>>> testcase: fio-basic
>>>>>> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
>>>>>> parameters:
>>>>>>
>>>>>>     runtime: 300s
>>>>>>     disk: 1HDD
>>>>>>     fs: xfs
>>>>>>     nr_task: 100%
>>>>>>     test_size: 128G
>>>>>>     rw: write
>>>>>>     bs: 4k
>>>>>>     ioengine: io_uring
>>>>>>     direct: direct
>>>>>>     cpufreq_governor: performance
>>>>>
>>>>> The actual test is available in this file:
>>>>> https://download.01.org/0day-ci/archive/20240131/202401312320.a335db14-oliver.sang@intel.com/repro-script
>>>>>
>>>>> I haven't found anything in that file for disabling merging. Merging
>>>>> requests decreases IOPS. Does this perhaps mean that this test is
>>>>> broken?
>>>>
>>>> It's hard to know as nothing in this email or links include the actual
>>>> output of the job...
>>>
>>> I attached a dmesg and 2 outputs while running tests on 574e7779cf.
>>> not sure if they are helpful?
>>
>> Both fio outputs is all I need, but I only see one of them attached?
> 
> while we running fio, there are below logs captured:
> fio
> fio.output
> fio.task
> fio.time
> 
> I tar them in fio.tar.gz as attached.
> you can get them by 'tar xzvf fio.tar.gz'

Right, but I need BOTH outputs - one from before the commit and the one
on the commit. The report is a regression, hence there must be both a
good and a bad run output... This looks like just the same output again,
I can't really do much with just one output.

-- 
Jens Axboe

