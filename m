Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A309262B1
	for <oe-lkp@lists.linux.dev>; Thu, 26 Oct 2023 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHNyLzcL"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9b9faf05f51so95971066b.2
        for <oe-lkp@lists.linux.dev>; Thu, 26 Oct 2023 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698311888; x=1698916688; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6nuLOS7wDoKlnDkXtdydYb6hexMKNmC87DB8tE5krw=;
        b=YHNyLzcLf69Sjg/nmB8BG81FZQk2KHSsXjlQljqEf05hi+QfmEw4lre4xDJpXBy5Lc
         PiYS10/xqyAUaL0C52KFTf/aCLJ2N6tuzGGDGtTmUB7M06vdq8qVj68neGnsK3N0KdCS
         z7Cy9VxrSWGBp2VVnuhZUukGrg88c6Okxw0f6GJProbJ+Vvnt6WDI//fSbkgVhPkrOT8
         phLlfghCuM82+0zCyZjJ9KSfW7WB4JOst7pDFGBhPiXgellfOQc0d5iGX721A74ve4WG
         UqToRA1HSwRW1DkKBELI6+YHeqfOJ3NiTbZqn4CfVPk326YUaoW3OKeMGEP8TT8cVI68
         Jb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698311888; x=1698916688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6nuLOS7wDoKlnDkXtdydYb6hexMKNmC87DB8tE5krw=;
        b=KTLzJTKhbsuy+potgURU1GPyLl0BihNrU2mzvL3xDuSuEZPPPxZnFOJuHsJC5K+dp7
         QzOqYtYBrSHsEEhO1Z4E+EfigPT2Hs00qF3UVsL9otYpJMp9zRJOrwVJX1vzn9UWTMhn
         SRXs6tn6o+FyU0P/WAKDTfVJw1/f9EwWSEaVmoJ1Io0SgMyv1UvAgHDGoPuF7NIaqI5R
         dO3+c0TN2gyOFhQj8SrdPOGvYBVtwRInAPA029r8SXSjVgOzVFfhNVUpgLMERq2whhYY
         Qp0x+YgV54aUeyIrSWPrSgixtcvIQJGucA48L194ZR6rUlMT5xDnwkauOSBWx3kfJlVT
         V5yg==
X-Gm-Message-State: AOJu0YxDE1M+CjK2UF+z/2J1RmHuqjQHaVZ8Ax8E+PM4YgRvKKsMeE0W
	1pk0AZWTGOQFC6DZhKY4Xlo=
X-Google-Smtp-Source: AGHT+IFUj0ZwzMqvzblTku38GxJhnhNqeKFJ4qBJ7vzPyENk5CFk+IZqAkM1Ev1wM4iYn12dUVkyGg==
X-Received: by 2002:a17:906:dc89:b0:9bf:ad86:ece8 with SMTP id cs9-20020a170906dc8900b009bfad86ece8mr15166381ejc.25.1698311887468;
        Thu, 26 Oct 2023 02:18:07 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:aa18:f9fe:f627:2a46? (2a02-8389-41cf-e200-aa18-f9fe-f627-2a46.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:aa18:f9fe:f627:2a46])
        by smtp.gmail.com with ESMTPSA id kf14-20020a17090776ce00b0099bd7b26639sm11333238ejc.6.2023.10.26.02.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 02:18:06 -0700 (PDT)
Message-ID: <415694cb-5041-41d7-9ff3-eb93a7730622@gmail.com>
Date: Thu, 26 Oct 2023 11:18:04 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [selftests] 5b45a75377:
 kernel-selftests.uevent.uevent_filtering.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org
References: <202310261454.46082aaa-oliver.sang@intel.com>
Content-Language: en-US
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <202310261454.46082aaa-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26.10.23 09:11, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "kernel-selftests.uevent.uevent_filtering.fail" on:
> 
> commit: 5b45a753776be5d21cf395ec97e81c9187fbeaca ("selftests: uevent filtering: fix return on error in uevent_listener")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 2030579113a1b1b5bfd7ff24c0852847836d8fd1]
> 
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-60acb023-1_20230329
> with following parameters:
> 
> 	group: group-03
> 
> 
> 
> compiler: gcc-12
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 32G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> we also noticed this issue does not always happen. as below, we saw 15 failures
> out of 50 runs. however, parent keeps passing.
> 
> 
> 37013b557b7f39e6 5b45a753776be5d21cf395ec97e
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :50          30%          15:50    kernel-selftests.uevent.uevent_filtering.fail
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202310261454.46082aaa-oliver.sang@intel.com
> 
> 
> 
> TAP version 13
> 1..1
> # timeout set to 300
> # selftests: uevent: uevent_filtering
> # TAP version 13
> # 1..1
> # # Starting 1 tests from 1 test cases.
> # #  RUN           global.uevent_filtering ...
> # add@/devices/virtual/mem/fullACTION=addDEVPATH=/devices/virtual/mem/fullSUBSYSTEM=memSYNTH_UUID=0MAJOR=1MINOR=7DEVNAME=fullDEVMODE=0666SEQNUM=3532
> # add@/devices/virtual/mem/fullACTION=addDEVPATH=/devices/virtual/mem/fullSUBSYSTEM=memSYNTH_UUID=0MAJOR=1MINOR=7DEVNAME=fullDEVMODE=0666SEQNUM=3546
> # add@/devices/virtual/mem/fullACTION=addDEVPATH=/devices/virtual/mem/fullSUBSYSTEM=memSYNTH_UUID=0MAJOR=1MINOR=7DEVNAME=fullDEVMODE=0666SEQNUM=3556
> # add@/devices/virtual/mem/fullACTION=addDEVPATH=/devices/virtual/mem/fullSUBSYSTEM=memSYNTH_UUID=0MAJOR=1MINOR=7DEVNAME=fullDEVMODE=0666SEQNUM=3585
> # add@/devices/virtual/mem/fullACTION=addDEVPATH=/devices/virtual/mem/fullSUBSYSTEM=memSYNTH_UUID=0MAJOR=1MINOR=7DEVNAME=fullDEVMODE=0666SEQNUM=3595
> # No buffer space available - Failed to receive uevent
> # # uevent_filtering.c:479:uevent_filtering:Expected 0 (0) == ret (-1)
> # # uevent_filtering: Test failed at step #10
> # #          FAIL  global.uevent_filtering
> # not ok 1 global.uevent_filtering
> # # FAILED: 0 / 1 tests passed.
> # # Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0
> not ok 1 selftests: uevent: uevent_filtering # exit=1
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20231026/202310261454.46082aaa-oliver.sang@intel.com
> 
> 
> 
What is apparently happening here is that the test returns now a proper
error value in the uevent_listener function. In this case recvmsg() is
returning ENOBUFS - No buffer space available. This occurs because
buf[_UEVENT_BUFFER_SIZE] is not big enough, being _UEVENT_BUFFER_SIZE =
(2048 *2).

Therefore the error is not in the fix commit as such because the error
was happening and it was not returned properly (previously ret was
assigned to -1 but it was not returned).

The obvious fix would be a larger buffer, but when I see de definition
of UEVENT_BUFFER_SIZE in kobject.h, its value is just 2048. Then I
wonder why 2048 *2 was used in the first place, why that is not enough
and what size is then meaningful.

After a quick search I found a discussion on Bugzilla about the
UEVENT_BUFFER_SIZE being resized to 4096:

https://bugzilla.kernel.org/show_bug.cgi?id=207695

But apparently it has not been resized upstream.

Best regards,
Javier Carrasco
