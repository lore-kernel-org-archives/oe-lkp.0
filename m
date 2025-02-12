Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98241F0E55
	for <oe-lkp@lists.linux.dev>; Wed, 12 Feb 2025 06:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739341386; cv=none; b=l6zbggxdJcUwGOkoKURCOussHG9a+npWTYq/wFMT44UjRkzx8F5jRvG61HsECmfYXbEE8essopIBgO6rhCESvqxRaichoIGcf4h64bthXYl41OlkaZsL/ZqxmrxzvmPY8Ftp3W38MTzA9KD4G8q4h4pLslQXYgz5vOMhk9DLrCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739341386; c=relaxed/simple;
	bh=W0NpBZMTTWFSesZiZbSwN5iKUIg3upK6dxKS6wSnDx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZcVA+CT60gE43ipB5S6YUvokxyKI1EB2uQoRhK/OrUJDUJer0cYQJDOnwNJdR4dS4L1P6e6yrUemf2r0HqEPmTloVzMzF1FZURu/VfbP48iTENn64kONlQssEAqZaeBK7Uyw10bbXVQ1Fx8ZKiGajjbj4Tb6MvWZWmrHDNxFTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WqpFZv98; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WqpFZv98"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4394829ef0fso2590995e9.0
        for <oe-lkp@lists.linux.dev>; Tue, 11 Feb 2025 22:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739341382; x=1739946182; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5eZl+Lm+eNF5vV/lYzaAH8+uqzZkVXJRZUaZFAcWr+M=;
        b=WqpFZv98rY+EgwU1+9n9B9tKnVwPExiLviLgFuLZgI8nMpehpPc7Plf/qw4PP846Pe
         MKTFKJMQX2NwZhcwUZsByWP8DmSnpYmSS0gBcGTbfku6TNc9IIjjAhiqlIEiCHvfMLvW
         0DiHo8v/s3U+PmUxZSrayR2K/2U/o/bOgK8RXtpEmFj6AmS9nKMwqH6ltV6DwLl/zo3I
         XxnaEg6fUP27l9sZqSLLWSMD4UZszpYY6eg/hCBsVMwunUEB2XilGW9/Fzq/PPNi79de
         jOqEhQU4cjKY4OuuCDdf0UpUiWI+ebdSsuN1MUg4pXiZvjgrvlR0bZZDRk/yDV/moFDT
         5fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739341382; x=1739946182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eZl+Lm+eNF5vV/lYzaAH8+uqzZkVXJRZUaZFAcWr+M=;
        b=UBWNN/teSWFlFfMswQ9iUBq5qpBW0dpmPQTlZ9gBK//o46cw9eCzUHfpqVxGzZHKyn
         /5DPDDN/ZjMCLoKVJIOjqp61b6eQmVwnkH0HtL6MhUu2qpRB4Mi7Lrrn7aPcruPXhhcX
         hhUk5PhGZKeTSeCvaSV6d01Vox3/H2+IsbjqmfePGda8zhtUIsPlhmUg3KmDC9S5562l
         P/QQeMIMF3QH3a0gGw7YrEX72kHYlaz4gkKnINNoIz6yoQbycRGl6Fshuec/yqG6DhOS
         ZrXh5iJQBG9nTuxxmmoOKEH80vHgVfKyx1Y8u6HszAl0OIklobIJ5yUUnkCNBQJJYXE2
         Hy/A==
X-Gm-Message-State: AOJu0Ywx85Lk5jXsS1bkdBTZAivLtGmyYCQWkRN0mJSQ2m3HX4slJCjc
	pvSvFPvGgb+eLCiadaDaO+2vFKhlrN9lYGUeJINT2J1lPvQ9juq779pnl+TE/R0=
X-Gm-Gg: ASbGncvgRyWqsithA2t0NFFglBSQzl2oH5TeTnktLPg8Oub7j3KO36+lQHvHC+qJwcr
	OC9WNl3HsbMBeI8OX7jVUF9ykjiOIlSnopkmEGdru2NZZfUUwKkCbFAwlEdaSoB7zvmSdwFVCQU
	2HwsScNIFHAlNX60WeEsThtJ4WDZBsXqKtv9kpkgzUKYa97jcyxOArwXQVL33P70JGBMFPlg+1n
	lEDAKLbywWnNAHckdiY4IwicZ+1VEJY1S2oFZgXg+cttNWj39hrV2Qz+1/0FaXQGqLb016/fzai
	dGRL8UoiQMirsvrkX40AG9qy3p34FX9lRI6ooqKKhQg=
X-Google-Smtp-Source: AGHT+IGvyDbwTuL65YPFFznO2ohKRnsCuHBRtsqpeHy0jfeaMB3HhKxjeUQ1Ff5of74r5fodNtMwLg==
X-Received: by 2002:a05:6000:4009:b0:38d:db2c:26be with SMTP id ffacd0b85a97d-38de43a5c98mr4631504f8f.14.1739341381819;
        Tue, 11 Feb 2025 22:23:01 -0800 (PST)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7322d4c2f56sm572302b3a.118.2025.02.11.22.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 22:23:01 -0800 (PST)
Message-ID: <d9720346-bf14-440c-9a57-8e8c25864059@suse.com>
Date: Wed, 12 Feb 2025 16:52:56 +1030
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [btrfs] 92a6e5b713: xfstests.btrfs.226.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, David Sterba <dsterba@suse.com>,
 "hch@infradead.org" <hch@infradead.org>, Filipe Manana <fdmanana@suse.com>,
 linux-btrfs@vger.kernel.org
References: <202502121035.e70df273-lkp@intel.com>
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
In-Reply-To: <202502121035.e70df273-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/2/12 15:14, kernel test robot 写道:
> 
> 
> Hello,
> 
> kernel test robot noticed "xfstests.btrfs.226.fail" on:
> 
> commit: 92a6e5b7138df60388f43065b22d0fd846ab8802 ("btrfs: always fallback to buffered write if the inode requires checksum")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master df5d6180169ae06a2eac57e33b077ad6f6252440]

This is a known one, please update the test case, see this fstests patch:

https://lore.kernel.org/linux-btrfs/6b66d881e152296eab70acc19991d9a611aefde6.1738792721.git.wqu@suse.com/


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
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202502121035.e70df273-lkp@intel.com
> 
> 2025-02-11 13:28:35 export TEST_DIR=/fs/sdb1
> 2025-02-11 13:28:35 export TEST_DEV=/dev/sdb1
> 2025-02-11 13:28:35 export FSTYP=btrfs
> 2025-02-11 13:28:35 export SCRATCH_MNT=/fs/scratch
> 2025-02-11 13:28:35 mkdir /fs/scratch -p
> 2025-02-11 13:28:35 export SCRATCH_DEV_POOL="/dev/sdb2 /dev/sdb3 /dev/sdb4 /dev/sdb5 /dev/sdb6"
> 2025-02-11 13:28:35 echo btrfs/226
> 2025-02-11 13:28:35 ./check btrfs/226
> FSTYP         -- btrfs
> PLATFORM      -- Linux/x86_64 lkp-hsw-d01 6.14.0-rc1-00040-g92a6e5b7138d #1 SMP PREEMPT_DYNAMIC Tue Feb 11 21:13:29 CST 2025
> MKFS_OPTIONS  -- /dev/sdb2
> MOUNT_OPTIONS -- /dev/sdb2 /fs/scratch
> 
> btrfs/226       - output mismatch (see /lkp/benchmarks/xfstests/results//btrfs/226.out.bad)
>      --- tests/btrfs/226.out	2024-12-15 06:14:52.000000000 +0000
>      +++ /lkp/benchmarks/xfstests/results//btrfs/226.out.bad	2025-02-11 13:28:41.437083025 +0000
>      @@ -39,14 +39,11 @@
>       Testing write against prealloc extent at eof
>       wrote 65536/65536 bytes at offset 0
>       XXX Bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>      -wrote 65536/65536 bytes at offset 65536
>      -XXX Bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>      +pwrite: Resource temporarily unavailable
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
> https://download.01.org/0day-ci/archive/20250212/202502121035.e70df273-lkp@intel.com
> 
> 
> 

