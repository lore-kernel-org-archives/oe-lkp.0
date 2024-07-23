Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18B614E2DA
	for <oe-lkp@lists.linux.dev>; Tue, 23 Jul 2024 08:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721722988; cv=none; b=jOUDfHQWkvEGNE3BkPNJ7YxdKMqzfR/571ZNSHgYkVKvpNUuD0Dw77oPd/5JHcgtU+Ec+wfa+ZE+9dNQ3e43a138Lsbu7d7Rx4ImX2Qe26SrY/kDTw89KcyH+5P59MIXgW7jfTzMz1VdxzyD9QbYD6J4FcaCkSxPOWgoL/TEdTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721722988; c=relaxed/simple;
	bh=yiD1Yvi1ZE9QNvroZdUc1EcHgOWM7mxmMWLED8Vy1ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQF5aZ51Kmz5P2kgmmLuTKdTcLaSjW/bIYT/uAHsN7dezKZ9P9PezHdVwPmBI0SrQu1tRoMUAvHip5BGI0SPUJLtGDUTrXkfoHYQI+u95hbENDz6RU3TlS624r0DSMvIBTydbpzwEGfeq06NFhOr78s1H5dL7h2i6kwaDUBpjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfvmtAgZ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfvmtAgZ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2cb50bcabd1so2799343a91.2
        for <oe-lkp@lists.linux.dev>; Tue, 23 Jul 2024 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721722986; x=1722327786; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQRavVjrAVA/k1fD3x96f9wCcknVkCt9b/ogig2zTSQ=;
        b=ZfvmtAgZuhSsMPLhYoe2E1vIeX43PqoCihZPRrV0t5AHiOwwv2TvgFguWIfDnPzdO6
         KwAbaarbsx8oYeXwzlTVMs+grKqzkJ6sve+YqMzGLr9TM+Nc+c8vPnjyD6nrwJE2e/6J
         nIz0K0wnvvwPhy5zSH5ZmI1rXBmKBbzBPr3nbCE5Wiue/1yFtoh5Zz0d185ePESXZW1o
         Ga8XO3e+ZL/IUcECfXIvLVEGfqLr1lHhVz+FI1ySXqz9g+smGykt8ZrwDacvl5WnLDi5
         cd0be7o6btY9iJHSu13O8qz0oLI2DJlIcFCzl/59XEDyrz3GkME5BUVh1zlm0roMo88K
         mXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721722986; x=1722327786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQRavVjrAVA/k1fD3x96f9wCcknVkCt9b/ogig2zTSQ=;
        b=PI54TcbwnW+Dc9sE71zXpnrj42crRHVSCRP6Hf5zOcc2HbdOrkM9c8RBDl+X1Y7tVR
         i53zwuBLJ60FGy18Nk5baPAlsbPPnB78a8xJ0IoJ4XI5nPK3NyBMSMJKgqStSf+ZYL37
         SlPO/Pyvw3MYlPLXCwwczVy8s1Nr/FWcK6HdwXb4ooI9zPXvzZ65CvYRfUz4JYkBeNDH
         kQIjxaRAwKw+VX155/OXd2iu0ayzMPqAuoX5asm7IgnlxGlsXarsK4LIlHalangdN+la
         rabFi8JjZ6YyxY+PxpyPWMeEz/7iLOe9vfSAYsOSajfUCG/Pr9amMQG2PVsuSCsU4em3
         XtOw==
X-Forwarded-Encrypted: i=1; AJvYcCXdnHqyhwUQdfrOjFGM+iGSQ2hTu4lvPG9IZ681zUkRZQ7U1xaHR5XMd7L3v6324kDJh+XjMVIc/DtUnOEu5C1pP7cf9y9j
X-Gm-Message-State: AOJu0Yy0/EVttr+tQXujJfnA6kefa9IaaXDi9NiFOnmsc3hSS10oHqKD
	1C46/wmiRC7b4nD9kvZm92KSLR1G3YCuzT/JFWwfiOTm4Fc11DQr
X-Google-Smtp-Source: AGHT+IE3SkgRs2aAwGEYJvvZ8DOocvL0c1mLCviVpZrLrYMDwLE14oS1NHUWcTOkKb5cr0jYDal9aA==
X-Received: by 2002:a17:90a:d711:b0:2c8:820:71c4 with SMTP id 98e67ed59e1d1-2cd274a8b13mr5370453a91.29.1721722986119;
        Tue, 23 Jul 2024 01:23:06 -0700 (PDT)
Received: from [192.168.255.10] (23.105.223.42.16clouds.com. [23.105.223.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm9530824a91.57.2024.07.23.01.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 01:23:05 -0700 (PDT)
Message-ID: <bd36db00-5464-4eb5-adb1-0ddfd3be1cfa@gmail.com>
Date: Tue, 23 Jul 2024 16:23:00 +0800
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
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <Zp8h/ZZTQ0lwmcJa@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/23/24 11:22 AM, Oliver Sang wrote:
> hi, Alex,
> 
> On Tue, Jul 23, 2024 at 09:58:25AM +0800, Alex Shi wrote:
>>
>> On 7/23/24 9:05 AM, kernel test robot wrote:
>>> hi, Alex Shi,
>>>
>>> we noticed there is a mmunstable3 branch now, but there is no same title patch
>>> there. not sure if this report is still useful, below report just FYI.
>> Hi Oliver,
>>
>> Thanks a lot for your testing and founding on my unreleased code branch!
>> The problem should be resolved on my latest code yesterday.
>> But multiple archs maybe still are fragile in the branch. Are there bootable in virtual machine, like arm, s390, etc?
> we did boot test in vm, but only for x86_64 or i386.
> 
> you may notice we also send another report
> "[alexshi:mmunstable3] [mm/memory]  f6ba7ce983: kernel_BUG_at_mm/page_alloc.c"

this problem was fixed too. Anyway thanks a lot notice me of this.

> 
> for both commit, we made some further check and cofirmed they cannot boot
> successfully on both vm/bm, again, we only test x86_64/i386 for now.

Thanks a lot for the info!

Alex
