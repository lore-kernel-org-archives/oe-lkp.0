Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903211D5CC7
	for <oe-lkp@lists.linux.dev>; Thu, 29 May 2025 04:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748491584; cv=none; b=lXRIWA7cUzR0iI6UqyZAirCBnvlCXlLmEvkIAJdn4wZ4O6qgKDt3cTxzuMXPJBkf0m7EIRUn7MUDWozFYxcvCa63y5Pai76DBpmQhkIhSAF2sIzDuDor68Uq8wChC6BQ9HrrRPxsjU6k/LN8x9lz/wM0lMiqk8M0u85vDZRjDU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748491584; c=relaxed/simple;
	bh=TF3rbKEr7u8TwhjkYuhhiy3ax+5w+OH9QRtAVzF7xco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqkgQw0UjhLHdxadH8C4P+3KGYwwJsYm2sLwBU1jYB9pcIFuXoemKdC1sRRyp+9sYpHpaJ/jsHxK8RTLOuLP1iRMoCZN44H92jpW6CgoWNw9rPDqKG7sAnonOUjfBhIgksdUxSVudemqeQEu/gUjsszDOjk8E+I8f+Z62PKSYKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wf80Lae9; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wf80Lae9"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74264d1832eso424279b3a.0
        for <oe-lkp@lists.linux.dev>; Wed, 28 May 2025 21:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748491582; x=1749096382; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=en1TuzA2jcDXl6/d8Wq7yY92hh5djDIHVZnzRgKkq4I=;
        b=Wf80Lae9ZzMWP4Fw3hEQTT2Y7GbYnXxYK/O9oOvY/JNv7qFsHQwi13gafR10hhvy4R
         dP/4YE2M4HcSBedW7VZ8L9RxAUGOiyOrJSCx9F6xCJUI6XJCZoEowCRHZ4897PQPccc2
         8mXfqb+377SG8L84ddWwoZz5c6H19XbFa9LXw08BnQueoyj7dyP5eUw1MlVKWbKyDXCr
         RRmVvyYAvJSfdb+9Xj5d12iCasYxchWFoVgv9fcNRO1SBP7Z9L9GeTpMJIyFOhbVqi4A
         xSmjDjwIb2htS7LDhWm7vxx+IDQn22H34GfnodxSTIq7GrGYhYqEniVt00bcY4UrWtVP
         vMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748491582; x=1749096382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=en1TuzA2jcDXl6/d8Wq7yY92hh5djDIHVZnzRgKkq4I=;
        b=mqQvvi5wW0KH4SzR3HiWJHUMA0W4MR3mjThiXBr8DjvSV8szMiTRckOX/CF+NIuDjy
         ucenwjEFsOvZoRSnT2e/6uHJtWvIQ/HmasuPgLg395Ol/2KaC6gczs8qJlljVAUXZDrQ
         uUGfn5dhtaf88d14CYcVUub66Duoqme9n4oup0gvYL2paEBGqCw7j2MVHWovZi5I0ju/
         NAcy+gDy1cJEnBwn2Vtc2GR0S8h3ho40JrycopEMIxag5Yen2VMvytzBtjWS0CDQ16C2
         UWJ/FIOL7puB22mCXpQY5SRjMQe/gElQbNTTgalQjCgGvmxgC3oj3ywB0gdcU8b0OV9D
         Sjcw==
X-Gm-Message-State: AOJu0YzZyNlHxhSJP0rF1mKwhsXkM5Uy3GEcSa7gBdy8359sORp7JWzw
	8kZ3/XiF0xuX7xut6Uym5eHaeCpwIl2tuIfV3IOcCakNmjHWNX4HDRkR
X-Gm-Gg: ASbGncs0WrtHe40N5tIiODVUs3Kzf0AVmX3vEwwZ0VrkHaaAyAhN8LhXuedd2SFuvn4
	FkYnSLHufjhENZtnwOyMrxiNaF++Fw/PpXoAGedNWaCW3/GM/AlNbaPsoYBNMDJ6qj1fhmGu71C
	shqWuP3KvvA0AorPbcreOwqXhvPZU2ZdAjDi6G34rf6MqxultAPLYJXN+0OoUfmOYHylZE1brDG
	ZQNtIiogqMDJpOaRqJymz1Yd9SK21wEW7iZIMkeDRaXNqgDt5o0q91CrT2SQHJixhbIy/u9fcsx
	19ulWHd7Eg/6vXswkKAUHyZrhgW6LUFhWPAmLSAJ8bPTInF9qeOqfijR0J8HFHJvZucI0WQnbCh
	Jk+uPy/j3KaHQeEjjXDNMzJ3Ojqw=
X-Google-Smtp-Source: AGHT+IGAJwA5Vw2P7enkBsL7PjKwvi8TvszQaTChXH2WOuL99LPZ256zzf6KFJ70blpyA9/DySgTBQ==
X-Received: by 2002:a05:6a00:22cd:b0:73e:970:731 with SMTP id d2e1a72fcca58-745fe035f23mr26544577b3a.16.1748491581701;
        Wed, 28 May 2025 21:06:21 -0700 (PDT)
Received: from ?IPV6:2001:ee0:4f0e:fb30:76aa:9d32:607:b042? ([2001:ee0:4f0e:fb30:76aa:9d32:607:b042])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafa42sm406123b3a.92.2025.05.28.21.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 21:06:21 -0700 (PDT)
Message-ID: <bf24709c-41a0-4975-98cd-651181d33b75@gmail.com>
Date: Thu, 29 May 2025 11:06:17 +0700
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [selftests] 59dd07db92:
 kernel-selftests.drivers/net.queues.py.fail
To: Jakub Kicinski <kuba@kernel.org>,
 kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, "Michael S. Tsirkin"
 <mst@redhat.com>, netdev@vger.kernel.org
References: <202505281004.6c3d0188-lkp@intel.com>
 <0bcbab9b-79c7-4396-8eb4-4ca3ebe274bc@gmail.com>
 <20250528175811.5ff14ab0@kernel.org>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <20250528175811.5ff14ab0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/25 07:58, Jakub Kicinski wrote:
> On Wed, 28 May 2025 15:43:17 +0700 Bui Quang Minh wrote:
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>>> | Closes: https://lore.kernel.org/oe-lkp/202505281004.6c3d0188-lkp@intel.com
>>>
>>>
>>>
>>> # timeout set to 300
>>> # selftests: drivers/net: queues.py
>>> # TAP version 13
>>> # 1..4
>>> # ok 1 queues.get_queues
>>> # ok 2 queues.addremove_queues
>>> # ok 3 queues.check_down
>>> # # Exception| Traceback (most recent call last):
>>> # # Exception|   File "/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-59dd07db92c166ca3947d2a1bf548d57b7f03316/tools/testing/selftests/net/lib/py/ksft.py", line 223, in ksft_run
>>> # # Exception|     case(*args)
>>> # # Exception|   File "/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-59dd07db92c166ca3947d2a1bf548d57b7f03316/tools/testing/selftests/drivers/net/./queues.py", line 33, in check_xsk
>>> # # Exception|     raise KsftFailEx('unable to create AF_XDP socket')
>>> # # Exception| net.lib.py.ksft.KsftFailEx: unable to create AF_XDP socket
>>> # not ok 4 queues.check_xsk
>>> # # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0
>>> not ok 7 selftests: drivers/net: queues.py # exit=1
>>>
>>>
>>>
>>> The kernel config and materials to reproduce are available at:
>>> https://download.01.org/0day-ci/archive/20250528/202505281004.6c3d0188-lkp@intel.com
>> Looking at the log file, it seems like the xdp_helper in net/lib is not
>> compiled so calling this helper from the test fails. There is similar
>> failures where xdp_dummy.bpf.o in net/lib is not compiled either.
>>
>> Error opening object
>> /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-59dd07db92c166ca3947d2a1bf548d57b7f03316/tools/testing/selftests/net/lib/xdp_dummy.bpf.o:
>> No such file or directory
>>
>> I'm still not sure what the root cause is. On my machine, these files
>> are compiled correctly.
> Same here. The get built and installed correctly for me.
> Oliver Sang, how does LKP build the selftests? I've looked at the
> artifacts and your repo for 10min, I can't find it.
> The net/lib has a slightly special way of getting included, maybe
> something goes wrong with that.

I understand why now. Normally, this command is used to run test
pwd: tools/testing/selftests
make TARGETS="drivers/net" run_tests

The LKP instead runs this
make quicktest=1 run_tests -C drivers/net

So the Makefile in tools/testing/selftests is not triggered and net/lib 
is not included either.

Thanks,
Quang Minh.


