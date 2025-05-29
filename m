Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03941A2643
	for <oe-lkp@lists.linux.dev>; Thu, 29 May 2025 04:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748494164; cv=none; b=JyYkEfS0r+N3an537++aM8gItx3w2NOeiHf5jjqGpnaWqTgTJFmy2m5ndYl6TjCnlZd6FywUfWDy4iOaTlAjjUZpvsOhf6J9Ms3kH6R9P9sl5oJ0mI0dNTaHxYFjIMx6wQt+Dspe4566d+y84Su2CEy2XlAJrkuTvxv0yboSPEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748494164; c=relaxed/simple;
	bh=KuIyapUJOtw3Yf1WElONkoBSM/dkSF+iqc1V+0HiFeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwUK+oX/Z6kzg4MuyTAQH6R0rAlIC6con4KgrOyuhJa9srTRtbjc+8iYMjA6CbIPhIEzdNmPYnFcm4EHv8t6s9edu9ocFarYxshwtN/b57nnXquEIqw5ppISvxRyPgnOz9ydgIzHmLogJd5ObL62dq+uA4+VYXU/KcEQrca6rKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+sXOmya; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+sXOmya"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c46611b6so545119b3a.1
        for <oe-lkp@lists.linux.dev>; Wed, 28 May 2025 21:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748494162; x=1749098962; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KTgJbCERSHdgIE7+4s3Qkj0l29r+g1ZPn6a/TqEhts4=;
        b=Y+sXOmyaJvgD3uUcxDN7658beJ9oa/umbTSzSlZMmcb2cJYx4WHwuLIMrwhFNboJQR
         FC0O2Ypmp7X2sB9oM88bsc4J6KcR39/ikAlanMJDuVlVEXeyWQZOIagIDw0UI1lEjYLC
         GJ7FkKAHlXvuiEeU7/QFkX+cO43oK6Bn+69QotFcqE1JL7yPvlMMZOc8dYDUlAbafoU5
         U4CGC81tIux8k3g+2eI1zY4ZnPiN/XFTA4RAwGUQF/3ZDf6oNPZF6zBh2DfTybF3sNpx
         wBORmUkFowI68QcorOMvchdGk1YHGo2Yc1OP0PcX1nWGyntmUY6hwp0274BE/vF/KWS/
         CQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748494162; x=1749098962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTgJbCERSHdgIE7+4s3Qkj0l29r+g1ZPn6a/TqEhts4=;
        b=XUKt9KkYl3kNieS5HNhA9QSLbZbN1hRbFWO1LcrNBtECaSgtzXKNEu++T+y0K6Ky9w
         DOnRpLbUP4fWoItN1qorGCG4zVRrR3x8nPbb+1ODCoZB7MPXdSza30oMdipejAIaD12p
         vobZwL4AYjb6vMM0z4Jyy7jcbRd09m1rJ2+q4UgNwsUIa428+G+260cdqhSF9tpBIW93
         v53+c8fmNPZltRkf66xrq/uo9+0Gxx1YfDzZAL4s0bXIi4TawOF3kOrz3o/QtvgFmm8T
         zmgSWIGS6QqpgCk/8EVeIH3lp16OUrJ5nT6ZA8y/bw9b++ni1eBW/j5aI4Se/XEc1uc6
         TjoA==
X-Forwarded-Encrypted: i=1; AJvYcCXW0e4Syx+Ku0B2Qw7ruJkJrWBl099jlBvJgnKoFcnfsS8PkCGEAOifVyzqABykKBWyFmDiq5A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ+IhLG4LmwgfnRgqZ2b2vAqdbZIG7Cb3Ef/ksuaZevqgc/lux
	p401fw6l8dsKvcc2nlmIsq4xwgsWTTPYHt2HAeRAm0CGLYXkanExRgga
X-Gm-Gg: ASbGnctP6asvJvELOiBLmoztSwzieeUdkZqi8KVdvW6WzTVYs2Mp2F+jUoDf5RpYIkG
	6iNPYqfC1WH8sFiViVEQCslg8ek98jlmoS/aUU3es2YbCF2bfbep8Zn2PAe7IrEV5n43UA/VZXK
	OPNwRREBF4LkvGR+90pXizWC4+DlmOJskuMhBjHJkH97tWyor7ACam7dEsKgx4IbvSEiRC2Q1q9
	eun3Gw76lK3ebhTaQ+QhioRXhGCfGC4shwHAGZqJe831V97sIwOzp/qafeeGOu0BVBvifIQBLLl
	3etm5TF75YBeSfzhAEaCQ6ccI+DzMeWDAx4kZRwM4kIV9vNnoUZ+R8I4cMud+q12TLzQhzjZ4Cu
	E/6NKR3HP36R7N6T1f/iQPR+i4wf8h/cs/kheNg==
X-Google-Smtp-Source: AGHT+IGJUq/3x6zmGN2r4k3qEc9eVrk5tWOyUsZncH3eedaLv36DBIitp/2O4+32DfIKRfvtSCqUew==
X-Received: by 2002:a05:6a00:b89:b0:747:a049:d570 with SMTP id d2e1a72fcca58-747a049d761mr5876457b3a.10.1748494162056;
        Wed, 28 May 2025 21:49:22 -0700 (PDT)
Received: from ?IPV6:2001:ee0:4f0e:fb30:76aa:9d32:607:b042? ([2001:ee0:4f0e:fb30:76aa:9d32:607:b042])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff7e3bsm463894b3a.175.2025.05.28.21.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 21:49:21 -0700 (PDT)
Message-ID: <0b86612e-591b-46c3-adbe-538a1f1b0cba@gmail.com>
Date: Thu, 29 May 2025 11:49:17 +0700
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [selftests] 59dd07db92:
 kernel-selftests.drivers/net.queues.py.fail
To: Philip Li <philip.li@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
 kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org
References: <202505281004.6c3d0188-lkp@intel.com>
 <0bcbab9b-79c7-4396-8eb4-4ca3ebe274bc@gmail.com>
 <20250528175811.5ff14ab0@kernel.org>
 <bf24709c-41a0-4975-98cd-651181d33b75@gmail.com> <aDfiTYmW1mHBEjg6@rli9-mobl>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <aDfiTYmW1mHBEjg6@rli9-mobl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/25 11:27, Philip Li wrote:
> On Thu, May 29, 2025 at 11:06:17AM +0700, Bui Quang Minh wrote:
>> On 5/29/25 07:58, Jakub Kicinski wrote:
>>> On Wed, 28 May 2025 15:43:17 +0700 Bui Quang Minh wrote:
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>>> the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>>>>> | Closes: https://lore.kernel.org/oe-lkp/202505281004.6c3d0188-lkp@intel.com
>>>>>
>>>>>
>>>>>
>>>>> # timeout set to 300
>>>>> # selftests: drivers/net: queues.py
>>>>> # TAP version 13
>>>>> # 1..4
>>>>> # ok 1 queues.get_queues
>>>>> # ok 2 queues.addremove_queues
>>>>> # ok 3 queues.check_down
>>>>> # # Exception| Traceback (most recent call last):
>>>>> # # Exception|   File "/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-59dd07db92c166ca3947d2a1bf548d57b7f03316/tools/testing/selftests/net/lib/py/ksft.py", line 223, in ksft_run
>>>>> # # Exception|     case(*args)
>>>>> # # Exception|   File "/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-59dd07db92c166ca3947d2a1bf548d57b7f03316/tools/testing/selftests/drivers/net/./queues.py", line 33, in check_xsk
>>>>> # # Exception|     raise KsftFailEx('unable to create AF_XDP socket')
>>>>> # # Exception| net.lib.py.ksft.KsftFailEx: unable to create AF_XDP socket
>>>>> # not ok 4 queues.check_xsk
>>>>> # # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0
>>>>> not ok 7 selftests: drivers/net: queues.py # exit=1
>>>>>
>>>>>
>>>>>
>>>>> The kernel config and materials to reproduce are available at:
>>>>> https://download.01.org/0day-ci/archive/20250528/202505281004.6c3d0188-lkp@intel.com
>>>> Looking at the log file, it seems like the xdp_helper in net/lib is not
>>>> compiled so calling this helper from the test fails. There is similar
>>>> failures where xdp_dummy.bpf.o in net/lib is not compiled either.
>>>>
>>>> Error opening object
>>>> /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-59dd07db92c166ca3947d2a1bf548d57b7f03316/tools/testing/selftests/net/lib/xdp_dummy.bpf.o:
>>>> No such file or directory
>>>>
>>>> I'm still not sure what the root cause is. On my machine, these files
>>>> are compiled correctly.
>>> Same here. The get built and installed correctly for me.
>>> Oliver Sang, how does LKP build the selftests? I've looked at the
>>> artifacts and your repo for 10min, I can't find it.
>>> The net/lib has a slightly special way of getting included, maybe
>>> something goes wrong with that.
>> I understand why now. Normally, this command is used to run test
>> pwd: tools/testing/selftests
>> make TARGETS="drivers/net" run_tests
>>
>> The LKP instead runs this
>> make quicktest=1 run_tests -C drivers/net
>>
>> So the Makefile in tools/testing/selftests is not triggered and net/lib is
>> not included either.
> hi Jakub and Quang Minh, sorry for the false positive report. And thanks for
> helping root cause the issue in LKP side. We will fix the bot asap to avoid
> missing the required dependencies during the kselftest.

I've created a pull request, please help me to review it: 
https://github.com/intel/lkp-tests/pull/514.

Thanks,
Quang Minh.


