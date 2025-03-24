Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52B71F3D5D
	for <oe-lkp@lists.linux.dev>; Mon, 24 Mar 2025 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808792; cv=none; b=MTKIx2GyiTimugoRihdFRZWGN51vK3gDzYztOvvrCvvQ0Uw35AIbhKab7AQ3walU87+sxlcvnVSV3NXxNeAiFOPjHXgxApqI/pNI/AZ9TQzJmw9DDvkmsrSh0glNAUUb8qrJWlK/M+Uod1BsAnD/P3kbZvyHHHBK72S6yTPVPOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808792; c=relaxed/simple;
	bh=uRvFLVNMEM4g4PryJiKbZcddMzcPS+20Bc48Sgo6u1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4TpIJF4Pu+Dt3T34LLG2uZhv4/zP1aHxfSVGpu16bzGdhTHPktqiEfSznt1cpQSUOGWrNC7cqtaUaXTJa0C/QX6od/GzpelOVf9XQADCOSDpgqYbvfEUE1uSnWCDJ1anDmYGKpYAYnNa+dr6fKBONGrm+Gt+sJIqqprmCuVloM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XewrUf9/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XewrUf9/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-399749152b4so1215860f8f.3
        for <oe-lkp@lists.linux.dev>; Mon, 24 Mar 2025 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742808788; x=1743413588; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sYPFnmatdEC2jaYKJ2PQ0L61fcr9EfY3NcYk9dAoMX8=;
        b=XewrUf9/QsDfjxc74q2qrCgJdqKeuCjBHHEJBw3ft+CUpfrWJnsgL+QQVZp/ZPIxs8
         d+WI2mRqCAccQLIcKxNIkOIlNpyS1dqvO4KVWuRPaUxZDu814O9xs/r0m1NfmKoag9tR
         qDd/AdiEbWEfvgpDQSYv9UipPHbmSGAObV0q7vHxhxNY1u3wuowIkOG1vyDU65ikvptO
         DrMohZcLUHd/VcI4IE4yHHemBvtYFek2tBhICfz4UHyt2gNIsOUUUf8/QfZeooSIe5LM
         6h3ndBhaTRWY3aYumgLdBFj0H2z1AU6K6cXalNaeMQAwH0CJGzewA1IOhQxP93lb52Uc
         bmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742808788; x=1743413588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYPFnmatdEC2jaYKJ2PQ0L61fcr9EfY3NcYk9dAoMX8=;
        b=fAGYs8N4gSBKRdCKXtWqpH5law3VESl92Nk7NdxkzzY2KqmpoBgR5PdOAGmABkQUJx
         r0IF+YVHWn9JyOR9YKbmgvD2qZQBii/ThHDf3RaAph3sO+h/bdZj7LGknB6aMXFGJk7F
         CfWG/chRL1Qj72mfG7LjQbawZ3Gn11RucsrJPQM3p/yX2Yo1ZvNPrZAdrmCkBV8eQiSF
         InXHXcqw9X9+bH3ROXlXHlL/YlaRreU/1iyFzMlm5dAEfA2B1UNYKM2MRsnOFPQcNlob
         K89q00POTYRBMrsnImKGuUtJAvyUChOLlYARBe/C/yzNcaHwCgm+4LbmLvEWXawvVziq
         dFKQ==
X-Gm-Message-State: AOJu0YxqijFY0gBrtrueBL2F5hp4A5DBW0jXbGr3nmhEyuXY/QcrHC7a
	sooHFKaU/bjnb2m+zmBQ6+lyH/Z9ZSL5t7/J+H3QPAghTDySQv7tMapovPm93VM=
X-Gm-Gg: ASbGnct0vi0+CQ8f2t4eUhHb3KpZfq/qhDBa6KA4wfDFk4SQf2Uct8c1iOLHaMLz+jJ
	aCPV7ihGvnkmcF/UoXYNvoIepmonGckT9qhy92Yuuxb3IDZdgLrhMORmPBt6Kt6XU4Ub/5KOko+
	kMBEvOahtKpjZzfAb1gLEOZPAivZAycXcMyLnH3hhw5DA6buGhme3l3JaRAnOChrSRIzNV4+KFm
	WDeb2P5+Jy2dxSLIvU8gth7sxXPFqqdg4cCfn0hqBZKpA00HCgGVNDdlf9B64RWlcu5jexxD5kB
	swA0vH+1qGXZcrsx7l3lG9vYGUwgjT1Nd0LId8hbSkz6D+4V7u8jVBGytTALUhgIlGzxJalS
X-Google-Smtp-Source: AGHT+IH5oHHBER08ah2i0IDaqI+3iXCtyYMXTHCh3YDoWnWqTBGSsphm3nCZLlAJR+/x+Sdpml/CYw==
X-Received: by 2002:a05:6000:2103:b0:391:2954:de27 with SMTP id ffacd0b85a97d-3997f93c2b0mr8304059f8f.45.1742808787934;
        Mon, 24 Mar 2025 02:33:07 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811daa2dsm66238425ad.171.2025.03.24.02.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 02:33:07 -0700 (PDT)
Message-ID: <883442fa-e398-4d56-a7cc-a7fdfbadfd53@suse.com>
Date: Mon, 24 Mar 2025 20:03:02 +1030
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [btrfs] 968f19c5b1: xfstests.btrfs.226.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, David Sterba <dsterba@suse.com>,
 Christoph Hellwig <hch@infradead.org>, Filipe Manana <fdmanana@suse.com>,
 linux-btrfs@vger.kernel.org
References: <202503241538.dbc17bf9-lkp@intel.com>
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
In-Reply-To: <202503241538.dbc17bf9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/3/24 18:15, kernel test robot 写道:
> 
> 
> Hello,
> 
> kernel test robot noticed "xfstests.btrfs.226.fail" on:
> 
> commit: 968f19c5b1b7d5595423b0ac0020cc18dfed8cb5 ("btrfs: always fallback to buffered write if the inode requires checksum")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 9388ec571cb1adba59d1cded2300eeb11827679c]
> 
> in testcase: xfstests
> version: xfstests-x86_64-8467552f-1_20241215
> with following parameters:
> 
> 	disk: 6HDD
> 	fs: btrfs
> 	test: btrfs-226
> 
> 
> 
> config: x86_64-rhel-9.4-func
> compiler: gcc-12
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 8G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202503241538.dbc17bf9-lkp@intel.com
> 
> 2025-03-22 11:44:50 export TEST_DIR=/fs/sdb1
> 2025-03-22 11:44:50 export TEST_DEV=/dev/sdb1
> 2025-03-22 11:44:50 export FSTYP=btrfs
> 2025-03-22 11:44:50 export SCRATCH_MNT=/fs/scratch
> 2025-03-22 11:44:50 mkdir /fs/scratch -p
> 2025-03-22 11:44:50 export SCRATCH_DEV_POOL="/dev/sdb2 /dev/sdb3 /dev/sdb4 /dev/sdb5 /dev/sdb6"
> 2025-03-22 11:44:50 echo btrfs/226
> 2025-03-22 11:44:50 ./check btrfs/226
> FSTYP         -- btrfs
> PLATFORM      -- Linux/x86_64 lkp-hsw-d01 6.14.0-rc7-00005-g968f19c5b1b7 #1 SMP PREEMPT_DYNAMIC Sat Mar 22 19:24:48 CST 2025
> MKFS_OPTIONS  -- /dev/sdb2
> MOUNT_OPTIONS -- /dev/sdb2 /fs/scratch
> 
> btrfs/226       - output mismatch (see /lkp/benchmarks/xfstests/results//btrfs/226.out.bad)
>      --- tests/btrfs/226.out	2024-12-15 06:14:52.000000000 +0000
>      +++ /lkp/benchmarks/xfstests/results//btrfs/226.out.bad	2025-03-22 11:44:56.303230706 +0000
>      @@ -39,14 +39,11 @@
>       Testing write against prealloc extent at eof
>       wrote 65536/65536 bytes at offset 0
>       XXX Bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>      -wrote 65536/65536 bytes at offset 65536
>      -XXX Bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>      +pwrite: Resource temporarily unavailable

Please update the fstests project.

The commit 7e92cb991b0b ("fstests: btrfs/226: use nodatasum mount option 
to prevent false alerts") fixes the false alerts.

Thanks,
Qu

>       File after write:
>      ...
>      (Run 'diff -u /lkp/benchmarks/xfstests/tests/btrfs/226.out /lkp/benchmarks/xfstests/results//btrfs/226.out.bad'  to see the entire diff)
> Ran: btrfs/226
> Failures: btrfs/226
> Failed 1 of 1 tests
> 
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250324/202503241538.dbc17bf9-lkp@intel.com
> 
> 
> 

