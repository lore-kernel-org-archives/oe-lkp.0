Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7836728B7F9
	for <oe-lkp@lists.linux.dev>; Wed, 28 May 2025 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445017; cv=none; b=jwltWbN0NsKeKFOpqb9VG35OLcz4hDUIx+N+o4oDxGBQfUqcWWttCEZMP9GMMqNIe9nNXdbuAx7DX1E/sGBWXpEVl1gw3PeSGctVaUIx7lGwp6yHB5LG3mqR/6YPupUANysQFrqqwIZ3QkRg3RS29TO3cviA4QmrACea4hsS720=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445017; c=relaxed/simple;
	bh=YX3cbfI3UDZr05QJ6sediK/4QgiEC77b2/6I38IoHJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4VG1DYQU7bSPPlpAxrjyudAUTWSVowLSCqx0TqPWSvyRGTIN7WXMD3FGfVwX1l1RZF+vtwPGlf5QKZMo0XptaB2Sg1NNuQaqiyPWiJhBDmKBExA5gNoKNHXytVYV4zwSqPQlM38wcE4yBkHe6bpFe9943hBXgo2NxBTOyW/gOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Le1g+P6V; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Le1g+P6V"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-232059c0b50so40086315ad.2
        for <oe-lkp@lists.linux.dev>; Wed, 28 May 2025 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748445015; x=1749049815; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lS+IITXVYbwmEt57Wt8xR3wd9E3w38pAQjroCrxWsXo=;
        b=Le1g+P6VbY9eyj6eaPfZiC0QyknOF1DJQEa6badiSZ9sY/6C65U2NN90oiyegLE1/I
         Q7Y0bZOP7At4kywoH6u8AV09jDR97cLhM5RDWcMDpZHWbxbtJKKQ43UWaPIFTU9AFDxE
         mm2DixH3NDWbajnmYIvMWQjSFtrAYq3vBiDk2tMXgHLwON85KDPmNpS2tVEuzp6rHit/
         oMUZmGoGBjxsHTT7avrJFkxBqvCMQyjQaJnlQVmRbm1Hqhxs5LlRoYQdMFVfo6/hY3ql
         52CQ1gw+ASL8SfM2+Cmp15YqKcqCBBW31ngyvDcXQWhGU8QXDkMsS/j3YQw2bqdvMN1D
         s9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748445015; x=1749049815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lS+IITXVYbwmEt57Wt8xR3wd9E3w38pAQjroCrxWsXo=;
        b=YFZgBZwWjY2e2TaETq83GR0EvypnUcfkHtzXFgTA1oKozI1hkiPddkwfRDEVgrwanL
         39VwIBVPJbNVkF4N0gn0Xe5P/Q9qRhpVzj2WyVOCvR9bXWpFdYJ9hTJBpQ1N60oZWIRl
         2qHPuDk3mtUZD7Yi7OcVDl+VkMOC/Lli5anRLQDeWHXLVosafy0QdJsi7/Xgzz+QJlyW
         rkHfBZ/h+gRfNJ7x2vm62J/CXmRCA/MDlIreF6WGFoAVyh4iWDpvoEQHHcgmR8Hs7de2
         6YLeKAIdsaxyMN4P1uyks78b1LMb/DYwHiTDJlnHvFdWwjdaP3GDMJuHV7NT+lPkTKxu
         anwQ==
X-Gm-Message-State: AOJu0Yyvvv508es9DK5vdoo09xgpkE+w/flJAyzrLFNv24YxPYdceWmr
	Ia9x0+abgyIeDMxfaR7eg50fdeCl8qWk4LxlgoOG74hKZNdWYkCe0r/N
X-Gm-Gg: ASbGncuh6djsA5GNqu/mei2+a2e7NSLaruokbvzb87TUDuScf1zKUCA9FWdzsBtjPWX
	riO7enq4uKQszUAmk3dWeqfDf4HuAMXYZPelnZETdlSEGWSKoKXWYg+qIlAoEp/tzpXNChPtfTn
	oJGJ7NNd0Ow9NPTg1fKInM/Io1G56Jv3FycUZBT2cg5n4ycy1KelaUZUBBLmG4YldQe8jSsX9GN
	H/o5q6koKHsAJKxMRMsXpz7uYWcm/ItxbCLpLm8TLdiSggw+MlIOe/VmwnlEJWAkTk/pX0ROn0S
	r4IrwD+Gsb+kCN/zJvBhv/+xHJukBD639iaEpuFp8ydlHHz54oDMTd+fvKP1BKDzvBGuWZTzk+7
	oClwsvMFuLIa90EEAKD/ysg==
X-Google-Smtp-Source: AGHT+IHDvzhWFGQ+EFsXZRgQfe3AKYf5iaLGg7mBUcY1L5P73eY06qAvwxkN4N5nJyglu8nMyieo7A==
X-Received: by 2002:a17:903:24d:b0:234:c549:da0e with SMTP id d9443c01a7336-234c549dce2mr61838205ad.47.1748445014597;
        Wed, 28 May 2025 08:10:14 -0700 (PDT)
Received: from [192.168.2.117] (c-67-188-127-15.hsd1.ca.comcast.net. [67.188.127.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d2fd2313sm13065915ad.8.2025.05.28.08.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 08:10:14 -0700 (PDT)
Message-ID: <9b500a3d-296b-4643-85d3-78d7bd6ec66b@gmail.com>
Date: Wed, 28 May 2025 08:10:12 -0700
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [cgroup] 731bdd9746:
 BUG:kernel_NULL_pointer_dereference,address
To: Waiman Long <llong@redhat.com>, kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Tejun Heo <tj@kernel.org>,
 Klara Modin <klarasmodin@gmail.com>, cgroups@vger.kernel.org
References: <202505281034.7ae1668d-lkp@intel.com>
 <15942ff6-a2d8-4f97-9818-1ff1b269428c@redhat.com>
Content-Language: en-US
From: JP Kobryn <inwardvessel@gmail.com>
In-Reply-To: <15942ff6-a2d8-4f97-9818-1ff1b269428c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/25 11:25 PM, Waiman Long wrote:
> On 5/28/25 1:00 AM, kernel test robot wrote:
>> Hello,
>>
>> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
>>
>> commit: 731bdd97466a280d6bdd8eceeb13d9fab6f26cbd ("cgroup: avoid per-cpu allocation of size zero rstat cpu locks")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>> [test failed on linux-next/master 176e917e010cb7dcc605f11d2bc33f304292482b]
>>
>> in testcase: boot
>>
>> config: x86_64-randconfig-123-20250522
>> compiler: clang-20
>> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>>
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> It is true that sizeof(arch_spinlock_t) is 0 for UP config. However, 
> sizeof(raw_spinlock_t) can be > sizeof(arch_spinlock_t) if some of the 
> lock debugging configs (like LOCKDEP or DEBUG_SPINLOCK) are enabled. So 
> commit 731bdd97466a2 should either be reverted or sizeof(raw_spinlock_t) 
> should be explicitly checked to see if alloc_percpu() should be called.

Good point on the non-zero state when debugging is enabled. I'll send a
patch today that changes from checking smp to checking size instead.
