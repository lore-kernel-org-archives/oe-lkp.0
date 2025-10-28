Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6200E2C3770
	for <oe-lkp@lists.linux.dev>; Tue, 28 Oct 2025 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761646525; cv=none; b=n6sR9D+wd+N04R7uKDZbXBKC/mDOrWUMlTZp9KK3lro+jX13clbP61m43dN5PQf24rR8RCW4GPhTT/e2+B3137iKmb03r/uFGYCdJOQSaK8yajCXWLgek25KjFLd+Ltg5HibcUaWlL5ZRtcS/Dm8YSejt0UVOtm7swRpmox9PAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761646525; c=relaxed/simple;
	bh=UoCiXQvj2Sq2/NL426GwurR0ILlmVvAH/lPEt50Ux1M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IML7+r0SysV2F9B3P5wReciaJMcVHcsLodjuNKDXZFpZoU8hkqB5l0tMoZG6i6Y9AvMNUOW0na4IIVTtM8LTkrrxI/HbivZlUZ6FkMW+q9bbEEIHvLYZ7DJa4yVyfN2WjKUdoijujOVnp3YckK90WYytVwckMiJgiXV8Fd14X2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f7qDCFop; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f7qDCFop"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso5149063f8f.1
        for <oe-lkp@lists.linux.dev>; Tue, 28 Oct 2025 03:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761646521; x=1762251321; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RcF8Ar5LLr9hzVZDlVHpiZbKzJd4GeP+gldVmCFN2rk=;
        b=f7qDCFop6D+VOROcpEwMtEFSOkK1eChyjeBzQYD0yPYJF0OLCIHEyOfqfGniehzcmp
         wuUBF5mjqqTNfuCSpXf80XThJBkJ0HChftA3CNBsVJOqNVo989E7TyhxkzWD0T9dBxLt
         rkYA+TTUU3UTTXoevy/6CD4ZwVEdK4WSqOBDwiFdLC9yLUxbUnEnHihXKCHGoS/bZup2
         nWZs/LqYZnlcqUjRYWRoVgcWLk2Eeptg0rwDmprb8MtF5/vzIlD55H0RwpdSkv4j3G5o
         hdH4IhPgNkhS3Sn+uB+bgv4Dh977R94EKyIG77/+5D+ZAlLQFom/jsAH5O41eGQAuM8k
         FBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761646521; x=1762251321;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcF8Ar5LLr9hzVZDlVHpiZbKzJd4GeP+gldVmCFN2rk=;
        b=Pm8UfXYbfjZBYWJFUt6awb/fnCqaPzCYLOKF+oddtvFVmsmxTozCwbF0MqPM6zCnj1
         GP8kVTPyBEcAwFYDduQr8ux2oPP1sx6ivtBQObSxGBdn510Fw58E/jdkviHIi0nJEkZT
         LWMPKXh6is9sEv+3vuSSGEnFfEkxc5oW7MMlzfFTNkiQvIEi5OcVN4xT5CePaoHZfnUT
         g51jzfbKAVyxO/BEUBokmQQg0eH47EZz6BtmFzQThYTEDcCob6WCJaF/ZoZsndfZBJ8T
         jYq0VZY/6INw6sRm7Zk146kmrkEEXEtWX2vW7gsHoky32ZQ5zjXF03XWK4uyXYQp+GV8
         2xcw==
X-Gm-Message-State: AOJu0YwbCLH7ZwiFk0REoEbTdAZwYhXnKa4nAHlPHA2HyeeBRVNH60XD
	7RJcs1gydpjMmheZHM0bDR89Eo3tAafsA0V1fdoeXgpcLGvEjMRGb1jMCJAXrEuDy2U=
X-Gm-Gg: ASbGnctmC+a+/MZezXb65GJIhM+VYO/0gITVHZ2XTmzezf7ZN9Y8BPO5ImRc6glfw/J
	ciOZe3gZ8nERVhffbpRXht3uAvbnBfVSO4xAC1Iyq5BUj8XMxAASulzqFjEbI7pJUijpVJbzibs
	ggIJk/hqObG2l6vJbST3uF/qM7r2Rw9RkhohTEUypc3QxtzpDZ+mN9g/6rNdPcyK6hQ8nUU09FW
	ggMBeTi1BCKc/wTINHeATIYbSXqyBLGh77Jntu0zMBTNSVBTGwozCraUM7Onsr+nYF8oP80445M
	hGWzEdbUpLO6axevj4g/wan46i0B6LmlxaOK3g3yYbztss4wf6/t653XvEEcZX8PRb/p6fNMYpi
	P2pTvKPOwRq2b35bkUv6JNwdcOr2lqwW4jPbkGG49xIuGQDg12WzDyy05muehaa6bHCAy+qoLx6
	5khRcRpQPGiy1pb9ArsLDt2GwoX8gV
X-Google-Smtp-Source: AGHT+IHPIlnZrrOdPRqyG1OjAT6/4AWS79Y7AzoL5XY82z8qq8Ksp3eDhmntS1lNzLzXcY/BAK+NiQ==
X-Received: by 2002:a5d:64c3:0:b0:3ec:dfe5:17d0 with SMTP id ffacd0b85a97d-429a7e35d0cmr1819229f8f.9.1761646520499;
        Tue, 28 Oct 2025 03:15:20 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41408757csm11054208b3a.59.2025.10.28.03.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:15:19 -0700 (PDT)
Message-ID: <7e73f89d-ecc4-4adc-a151-1eca9f199c8f@suse.com>
Date: Tue, 28 Oct 2025 20:45:15 +1030
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] btrfs: introduce btrfs_bio::async_csum
From: Qu Wenruo <wqu@suse.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-btrfs@vger.kernel.org
References: <202510281522.d23994ae-lkp@intel.com>
 <124eef27-79d1-40ec-9f54-f94509f904fb@suse.com>
Content-Language: en-US
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <124eef27-79d1-40ec-9f54-f94509f904fb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/10/28 18:36, Qu Wenruo 写道:
> 
> 
> 在 2025/10/28 17:49, kernel test robot 写道:
>>
>>
>> Hello,
>>
>> kernel test robot noticed "xfstests.btrfs.026.fail" on:
>>
>> commit: d72352d1c3a3a201dcd3684b05987f281b1d66aa ("[PATCH 4/4] btrfs: 
>> introduce btrfs_bio::async_csum")
>> url: https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs- 
>> make-sure-all-btrfs_bio-end_io-is-called-in-task-context/20251024-185435
>> base: https://git.kernel.org/cgit/linux/kernel/git/kdave/linux.git 
>> for-next
>> patch link: https://lore.kernel.org/ 
>> all/44a1532190aee561c2a8ae7af9f84fc1e092ae9e.1761302592.git.wqu@suse.com/
>> patch subject: [PATCH 4/4] btrfs: introduce btrfs_bio::async_csum
>>
>> in testcase: xfstests
>> version: xfstests-x86_64-2cba4b54-1_20251020
>> with following parameters:
>>
>>     disk: 6HDD
>>     fs: btrfs
>>     test: btrfs-026
>>
>>
>>
>> config: x86_64-rhel-9.4-func
>> compiler: gcc-14
>> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 
>> 3.40GHz (Haswell) with 8G memory
>>
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: https://lore.kernel.org/oe-lkp/202510281522.d23994ae- 
>> lkp@intel.com
> 
> Unfortunately I'm unable to reproduce the failure here.
> 100+ runs no reproduce.
> 
> Thus I guess it may be some incompatibility with the series and the base 
> (which is for-next branch, not the btrfs for-next branch).
> 
> Just to rule out the possibility, mind to re-test using my branch directly?
> 
> https://github.com/adam900710/linux/tree/async_csum
> 
> 
>  From the assets, the dmesg shows that all data checksum are zeros:
> 
> [   62.192305][  T269] BTRFS warning (device sdb2): csum failed root 5 
> ino 258 off 275644416 csum 0xa54e4c94 expected csum 0x00000000 mirror 1
> [   62.192397][   T12] BTRFS warning (device sdb2): csum failed root 5 
> ino 258 off 275775488 csum 0xa54e4c94 expected csum 0x00000000 mirror 1
> [   62.192470][ T5037] BTRFS warning (device sdb2): csum failed root 5 
> ino 258 off 275906560 csum 0xa54e4c94 expected csum 0x00000000 mirror 1
> 
> This means we're running the end_io() functions before the csum is fully 
> calculated.
> 
> If that's the case, it will eventually hits some use-after-free at other 
> tests, which I hit too many times during development due to incorrect 
> wait timing.

My bad, and after looking into my local runs, there are some tests that 
fails with the same dmesg errors.

It turns out that there is a race on bi_iter, where csum_one_bio_work() 
and lower storage layer can try to grab the same bi_iter.

On much newer hardware like zen5, the checksum calculation is way faster 
than IO, thus under most cases csum_one_bio_work() can get the bi_iter 
before lower layer advancing it.

But if lower layer advanced it before csum_one_bio_work(), then 
csum_one_bio_work() will skip the calculation completely resulting the 
csums to be all zero.

Thanks for detecting this bug, I'll update the fix to add a new 
saved_iter so that csum_one_bio_work() can always grab the correct iter.

Thanks,
Qu

> 
> But I'm only seeing this single report, which is pretty weird.
> 
> I hope it's just some bad code base.
> 
> Thanks,
> Qu
>>
>> 2025-10-27 23:06:41 cd /lkp/benchmarks/xfstests
>> 2025-10-27 23:06:42 export TEST_DIR=/fs/sda1
>> 2025-10-27 23:06:42 export TEST_DEV=/dev/sda1
>> 2025-10-27 23:06:42 export FSTYP=btrfs
>> 2025-10-27 23:06:42 export SCRATCH_MNT=/fs/scratch
>> 2025-10-27 23:06:42 mkdir /fs/scratch -p
>> 2025-10-27 23:06:42 export SCRATCH_DEV_POOL="/dev/sda2 /dev/sda3 /dev/ 
>> sda4 /dev/sda5 /dev/sda6"
>> 2025-10-27 23:06:42 echo btrfs/026
>> 2025-10-27 23:06:42 ./check btrfs/026
>> FSTYP         -- btrfs
>> PLATFORM      -- Linux/x86_64 lkp-hsw-d01 6.18.0-rc1-00265- 
>> gd72352d1c3a3 #1 SMP PREEMPT_DYNAMIC Tue Oct 28 06:52:50 CST 2025
>> MKFS_OPTIONS  -- /dev/sda2
>> MOUNT_OPTIONS -- /dev/sda2 /fs/scratch
>>
>> btrfs/026       - output mismatch (see /lkp/benchmarks/xfstests/ 
>> results//btrfs/026.out.bad)
>>      --- tests/btrfs/026.out    2025-10-20 16:48:15.000000000 +0000
>>      +++ /lkp/benchmarks/xfstests/results//btrfs/026.out.bad    
>> 2025-10-27 23:06:53.540513519 +0000
>>      @@ -12,4 +12,4 @@
>>       5876dba1217b4c2915cda86f4c67640e  SCRATCH_MNT/bar
>>       File digests after remounting the file system:
>>       647d815906324ccdf288c7681f900ec0  SCRATCH_MNT/foo
>>      -5876dba1217b4c2915cda86f4c67640e  SCRATCH_MNT/bar
>>      +md5sum: /fs/scratch/bar: Input/output error
>>      ...
>>      (Run 'diff -u /lkp/benchmarks/xfstests/tests/btrfs/026.out /lkp/ 
>> benchmarks/xfstests/results//btrfs/026.out.bad'  to see the entire diff)
>> Ran: btrfs/026
>> Failures: btrfs/026
>> Failed 1 of 1 tests
>>
>>
>>
>>
>> The kernel config and materials to reproduce are available at:
>> https://download.01.org/0day-ci/ 
>> archive/20251028/202510281522.d23994ae-lkp@intel.com
>>
>>
>>
> 
> 

