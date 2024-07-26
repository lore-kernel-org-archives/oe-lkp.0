Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61CA156677
	for <oe-lkp@lists.linux.dev>; Fri, 26 Jul 2024 06:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721974298; cv=none; b=FqshQAftZJRMYksQz7WLXp5VuBktPsu7Vg4VA38wGbjj7K6l4nF7+odCgSkVu9Nw0IEYhWSibyPnPFt6WcxJp5J09hNKu/86LbBOyxK60M/+6zXxnmNhh5tVGoitSoPQcQjlAUwoYyhz3T69Tav/0YB0Iy8ZOCf6Se+mMKlr4C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721974298; c=relaxed/simple;
	bh=EmJe3D1bXD/2gneHHdq6mYyUzAbJGoBzTjETmdS0aeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRRlkiMLP7mwwmj3+MQKHLcJyEw4BjceOwaIPQ1ZNIPFqwYPSwbUpmmW0MZOSUVkKkaahu9kB/1/QSYsQN/lp7kguZVLp2XlXD8ZAjodPXXA2oAQEZ/svpDYAGbUKPxT5hB7/PEBrRTh6icdhLeo+tXaKwzS+iMN1BjmQ7bUYL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WL5Af1tD; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WL5Af1tD"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-709340f1cb1so262179a34.3
        for <oe-lkp@lists.linux.dev>; Thu, 25 Jul 2024 23:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721974296; x=1722579096; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcYYPAG6IdzBLeAi209u5r0ILn1CzN8epM7dkDvfCNE=;
        b=WL5Af1tDu2/cpUtcomkSLPvA9MHECWUZMC9BqVkv+zEBQ28H+uUXA1U6vpHbgJJaNe
         fwQrbc0yA3xNqmUciuFimWfYZ+nob1IGgy85IDNDD2HlXEM8vncuWBpgPgMd/d32ukSo
         N1YU/6H1RGznyylQfXvFPveQHzHhup/m68AKkBoWzRrYaDV3gIbMz/IQHZjNAWwL3Ra3
         64Nul8LXsScWC3Gjh/aezvvMlRzCvrXbiOjg/OsmMI4mQCScoz9kyjaYG7taTP5nQLxR
         yW/kCOsl0ztwpokQUkjfLS7pez2e2Th1d7s7NWHPlq8j9ksmJElL/uVkYyLvhYo6tSt7
         AFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721974296; x=1722579096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcYYPAG6IdzBLeAi209u5r0ILn1CzN8epM7dkDvfCNE=;
        b=bB/ZsV9QCp7I1+jkJrYc99QY7b2glJKYRiDvomgpqNRGInMTtCrTYBl8sBwPCBSrZC
         ECzv6aE7ZFKHCG3rkijnA4fHbHB+PBBpl5TSuPUSFRPSpRsTleTBH7rhH35F7wdCLVhN
         iDrg6DX2a9qX1Wpr4yqMgNnh1atEreQVaWyynau04P3yPjMZs7r2xux9FjsYZ+Be1u1N
         Jr8SuG1frLDZGMLiheLPb4QLUeeOqBI5tWfY3gKrLKXwTk9txn0vcUOEPCDOjZBHAbZt
         vM1A4qBwl9r4VH/3v9LR26ZkA5GXizcfAp5TJXk4Ctc3ccNLmYGtJTt2CxybWAggcdKF
         bIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7s6cKCPnPO2R4pIblqcaGFAf+yues5kgf61JoiCmheSyM/5EweqEv8rh3tyBAiGizhyp7jpIckF7ZEfeqMFpXGpkJPXRH
X-Gm-Message-State: AOJu0YzXHxfax1Yk32Yi63Z8qJN2IEAxT9OfqnlbhgqkCC1DQ7DX/NsR
	35hIw+KDz6HecjMfX1Fuv3cGV0SbK0qitQjeW4+fOJyDq2jbLzxh
X-Google-Smtp-Source: AGHT+IHw1Cjs+3K64BZwFTD53doafg+wR1ix2dtUFk/7grHr815fnV7ZU3SWRdhvvtE2qnybvMjEOA==
X-Received: by 2002:a05:6830:668f:b0:709:3b06:d578 with SMTP id 46e09a7af769-7093b06dc6bmr1198418a34.26.1721974295753;
        Thu, 25 Jul 2024 23:11:35 -0700 (PDT)
Received: from [192.168.255.10] (23.105.223.42.16clouds.com. [23.105.223.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8a35ddsm2023061b3a.202.2024.07.25.23.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 23:11:35 -0700 (PDT)
Message-ID: <6fd3684b-1b92-4a26-ae3b-98e5c1800d40@gmail.com>
Date: Fri, 26 Jul 2024 14:11:31 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [alexshi:mmunstable2] 934c05f8c5:
 BUG:unable_to_handle_page_fault_for_address
To: Oliver Sang <oliver.sang@intel.com>
Cc: Alex Shi <alexs@kernel.org>, oe-lkp@lists.linux.dev, lkp@intel.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <202407221607.49138a71-oliver.sang@intel.com>
 <a634bf58-9195-4c6f-b3d8-468d47e71033@gmail.com>
 <Zp8h/ZZTQ0lwmcJa@xsang-OptiPlex-9020>
 <bd36db00-5464-4eb5-adb1-0ddfd3be1cfa@gmail.com>
 <ZqJZNqq74NSAI8vS@xsang-OptiPlex-9020>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <ZqJZNqq74NSAI8vS@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/25/24 9:55 PM, Oliver Sang wrote:
> hi, Alex,
> 
> On Tue, Jul 23, 2024 at 04:23:00PM +0800, Alex Shi wrote:
>>
>>
>> On 7/23/24 11:22 AM, Oliver Sang wrote:
>>> hi, Alex,
>>>
>>> On Tue, Jul 23, 2024 at 09:58:25AM +0800, Alex Shi wrote:
>>>>
>>>> On 7/23/24 9:05 AM, kernel test robot wrote:
>>>>> hi, Alex Shi,
>>>>>
>>>>> we noticed there is a mmunstable3 branch now, but there is no same title patch
>>>>> there. not sure if this report is still useful, below report just FYI.
>>>> Hi Oliver,
>>>>
>>>> Thanks a lot for your testing and founding on my unreleased code branch!
>>>> The problem should be resolved on my latest code yesterday.
>>>> But multiple archs maybe still are fragile in the branch. Are there bootable in virtual machine, like arm, s390, etc?
>>> we did boot test in vm, but only for x86_64 or i386.
>>>
>>> you may notice we also send another report
>>> "[alexshi:mmunstable3] [mm/memory]  f6ba7ce983: kernel_BUG_at_mm/page_alloc.c"
>>
>> this problem was fixed too. Anyway thanks a lot notice me of this.
> 
> thanks a lot for information! just was wondering which branch contains the fixes?
> 
> I ask this because we still have some bisect results pointing the commits in
>   mmunstable
>   mmunstable2
>   mmunstable3
> branches in https://github.com/alexshi/linux.git
> 
> are they still useful? if they are out-of-date branches, we won't send reports
> to you upon them. thanks

Hi Olive,

Sorry for response late, I have some issue to deal with lately. 
The mmunstable2/3 are removed a couple days ago.

Thanks again for your great job!

Alex
> 
>>
>>>
>>> for both commit, we made some further check and cofirmed they cannot boot
>>> successfully on both vm/bm, again, we only test x86_64/i386 for now.
>>
>> Thanks a lot for the info!
>>
>> Alex
