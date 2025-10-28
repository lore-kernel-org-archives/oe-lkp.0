Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63519212566
	for <oe-lkp@lists.linux.dev>; Tue, 28 Oct 2025 08:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761638789; cv=none; b=J1Q6eqIqxcAbxI3s38UZFH6DeJjgpBHxrDfZh90z9Wu41Slydq8nVOD0tIww3YMJu4M/CXFmMYLVlHuxqypwxBq8WawAwVkKOSBPpSurp3SPHCA8CHw7MS9H2piidSHzZHuHtDHh7+t1TKOSdAmjP0RhYY4X4cIbmTmMNUmzVAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761638789; c=relaxed/simple;
	bh=g1P6cQpGTmAt7T00edJcViaF3mXzPxMRR754WeoryXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEvYgbo4fNWPBtMIehb4x1um0iWy0O/k6ZpyLqNRN3ZxTF2kUo8Z1OKJLexyE7gQZtPilxPDjv3dvLzFWZfeAamNh1oT3slsilXqSHtE+n3AYQy1zhxQvqH3rDKRpC+w8061ANicMDRsNmbgGWLh8kW43jrjGBkw9KkhaU4IG6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SU0qJKf4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SU0qJKf4"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-427060bc0f5so3056975f8f.3
        for <oe-lkp@lists.linux.dev>; Tue, 28 Oct 2025 01:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761638784; x=1762243584; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d49qfBTvJpDphrP827FIf1FZ7LzD+w6W6hgcnykOGzk=;
        b=SU0qJKf4ST2gs3/9CsMwyHRkLfFmGTrDTTcnQkRsxpzwBOGoefRp5jLWofbdId2QfK
         fCnkC71UDM44UcNT8yW+bmoyScYsWKrWFsmOR32orn0mubyMaF3ztlVaiNehzksMsr/+
         e33ZhQUEsiuprWgPUpNh6eJwTPoiTIJHKpp6fRBrYRFLc4ba7hHYZhgmlK8vXT2AyLYv
         gQ5VgQizgL9xJO+KDhFAo+5bAARNS87w3hJ3A1HceNcYMVTrnUTZUJQs59mipDfiwx1+
         tK1aUNnK483/HXsE9ZvLONxtwJvT/vmi5DcXn1XTywVff9gnQQ4OzycAT8YjmD8DGhrj
         1aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761638784; x=1762243584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d49qfBTvJpDphrP827FIf1FZ7LzD+w6W6hgcnykOGzk=;
        b=RxQHH82RZHfr/xVVbteoO0rP9eSCfbG2ecigjynN17XDGHcdPl2kzwnH8Po2g1hixF
         OpKhccafrh6coyCsN+c9AdR9p19yOxod3Elu7Y3kK5FSqA3PA94N73uVhDjASYmE27Hn
         9RtHHSkfFpjey8qjEqUadqk+MH9fZ27O5xhgBtq3u7VjKrIsRsXIM1G6+aG2fsqjJUBU
         WMc7G5zdvGwtDT7eDd7IElsm9k/iPIC9oWQXKsm3UR7KxNB4Uaq7+5uWhjJd/fCTdMFA
         vZMmqdWTIfDqJ71euTIIOuSh74f/bAz5eu8OqO3kp5ngd4t9MtZlo3BQRMR6RUU/o46N
         GYdA==
X-Gm-Message-State: AOJu0YwciB56m5jrCCmiX6BvU/G8IG1N9JkkChsLcD4Ndmu3noqtP59Z
	PZIzjMtTUCJM/LPuFLgnmI4GELQP33JIEMQ6U6l1kY3RGPxmdsBDR1U2kFFZawNWtXg=
X-Gm-Gg: ASbGncv27O77xMQKDYVXs52IBlRVoWGWY+TTGhoLV+T1iKGGr7Nx80Fq5NJm6bO4l4z
	nMBWXWIYsjyR+FeFNTg123ji4WJ7waDUXr9aQPaMIFhA6SpeOOXxYlNSRJz+1l3h9a2SGIXWrx2
	BJ5W9qRO2QThlVEjLjOG5n1d4qFNJ2nShAoacRGRjYd2Uf9IMNe+NGzw8STGZZcfF+jHuOVpEXD
	EKqTGL1+ODSpMWCIWNJqU67fxGhc5FH2K5pLHL25kVGZDLlpNaSxC+NX3oP7oYxJaOazD/xM7mi
	9HyRochjy6sc6zxk7aHtvjJdQuC2Mu+5B9OyAfujP0X1mi1Sjn7UeJVCtHHNOj7LREuxrmf06SJ
	ZHzfUloNfyrAfBrKYWVyEFqqEovhp/a1EQc9cAIh26VUTB5r95sqn76Nn9zw1BwaCbxb8LjlwQ2
	ZZXkIUW7TmpAdCDRmtjThyN4Y7emCwHjK4JD5ooYpgMVZT4WCLtAHOmMn7NaUXjUetNNzCzEu4r
	VnjDyJINYV4nO4hPHufLsXw
X-Google-Smtp-Source: AGHT+IEZeb5K/wNFOst15sMqVX5NjO8WdtQ0MPwYYPcjOZiy+Zn9drb1J/s6UUuP77ispLtRkH1jLA==
X-Received: by 2002:a5d:5849:0:b0:429:8c4e:b0c8 with SMTP id ffacd0b85a97d-429a7e577a1mr2535564f8f.27.1761638783464;
        Tue, 28 Oct 2025 01:06:23 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1:0:2bb5:f164:6e6a:38d8? (2403-580d-fda1-0-2bb5-f164-6e6a-38d8.ip6.aussiebb.net. [2403:580d:fda1:0:2bb5:f164:6e6a:38d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed70a86fsm11202740a91.1.2025.10.28.01.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 01:06:22 -0700 (PDT)
Message-ID: <124eef27-79d1-40ec-9f54-f94509f904fb@suse.com>
Date: Tue, 28 Oct 2025 18:36:18 +1030
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] btrfs: introduce btrfs_bio::async_csum
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-btrfs@vger.kernel.org
References: <202510281522.d23994ae-lkp@intel.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
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
In-Reply-To: <202510281522.d23994ae-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/10/28 17:49, kernel test robot 写道:
> 
> 
> Hello,
> 
> kernel test robot noticed "xfstests.btrfs.026.fail" on:
> 
> commit: d72352d1c3a3a201dcd3684b05987f281b1d66aa ("[PATCH 4/4] btrfs: introduce btrfs_bio::async_csum")
> url: https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-make-sure-all-btrfs_bio-end_io-is-called-in-task-context/20251024-185435
> base: https://git.kernel.org/cgit/linux/kernel/git/kdave/linux.git for-next
> patch link: https://lore.kernel.org/all/44a1532190aee561c2a8ae7af9f84fc1e092ae9e.1761302592.git.wqu@suse.com/
> patch subject: [PATCH 4/4] btrfs: introduce btrfs_bio::async_csum
> 
> in testcase: xfstests
> version: xfstests-x86_64-2cba4b54-1_20251020
> with following parameters:
> 
> 	disk: 6HDD
> 	fs: btrfs
> 	test: btrfs-026
> 
> 
> 
> config: x86_64-rhel-9.4-func
> compiler: gcc-14
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 8G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202510281522.d23994ae-lkp@intel.com

Unfortunately I'm unable to reproduce the failure here.
100+ runs no reproduce.

Thus I guess it may be some incompatibility with the series and the base 
(which is for-next branch, not the btrfs for-next branch).

Just to rule out the possibility, mind to re-test using my branch directly?

https://github.com/adam900710/linux/tree/async_csum


 From the assets, the dmesg shows that all data checksum are zeros:

[   62.192305][  T269] BTRFS warning (device sdb2): csum failed root 5 
ino 258 off 275644416 csum 0xa54e4c94 expected csum 0x00000000 mirror 1
[   62.192397][   T12] BTRFS warning (device sdb2): csum failed root 5 
ino 258 off 275775488 csum 0xa54e4c94 expected csum 0x00000000 mirror 1
[   62.192470][ T5037] BTRFS warning (device sdb2): csum failed root 5 
ino 258 off 275906560 csum 0xa54e4c94 expected csum 0x00000000 mirror 1

This means we're running the end_io() functions before the csum is fully 
calculated.

If that's the case, it will eventually hits some use-after-free at other 
tests, which I hit too many times during development due to incorrect 
wait timing.

But I'm only seeing this single report, which is pretty weird.

I hope it's just some bad code base.

Thanks,
Qu
> 
> 2025-10-27 23:06:41 cd /lkp/benchmarks/xfstests
> 2025-10-27 23:06:42 export TEST_DIR=/fs/sda1
> 2025-10-27 23:06:42 export TEST_DEV=/dev/sda1
> 2025-10-27 23:06:42 export FSTYP=btrfs
> 2025-10-27 23:06:42 export SCRATCH_MNT=/fs/scratch
> 2025-10-27 23:06:42 mkdir /fs/scratch -p
> 2025-10-27 23:06:42 export SCRATCH_DEV_POOL="/dev/sda2 /dev/sda3 /dev/sda4 /dev/sda5 /dev/sda6"
> 2025-10-27 23:06:42 echo btrfs/026
> 2025-10-27 23:06:42 ./check btrfs/026
> FSTYP         -- btrfs
> PLATFORM      -- Linux/x86_64 lkp-hsw-d01 6.18.0-rc1-00265-gd72352d1c3a3 #1 SMP PREEMPT_DYNAMIC Tue Oct 28 06:52:50 CST 2025
> MKFS_OPTIONS  -- /dev/sda2
> MOUNT_OPTIONS -- /dev/sda2 /fs/scratch
> 
> btrfs/026       - output mismatch (see /lkp/benchmarks/xfstests/results//btrfs/026.out.bad)
>      --- tests/btrfs/026.out	2025-10-20 16:48:15.000000000 +0000
>      +++ /lkp/benchmarks/xfstests/results//btrfs/026.out.bad	2025-10-27 23:06:53.540513519 +0000
>      @@ -12,4 +12,4 @@
>       5876dba1217b4c2915cda86f4c67640e  SCRATCH_MNT/bar
>       File digests after remounting the file system:
>       647d815906324ccdf288c7681f900ec0  SCRATCH_MNT/foo
>      -5876dba1217b4c2915cda86f4c67640e  SCRATCH_MNT/bar
>      +md5sum: /fs/scratch/bar: Input/output error
>      ...
>      (Run 'diff -u /lkp/benchmarks/xfstests/tests/btrfs/026.out /lkp/benchmarks/xfstests/results//btrfs/026.out.bad'  to see the entire diff)
> Ran: btrfs/026
> Failures: btrfs/026
> Failed 1 of 1 tests
> 
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20251028/202510281522.d23994ae-lkp@intel.com
> 
> 
> 

