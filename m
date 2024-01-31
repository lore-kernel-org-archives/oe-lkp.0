Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33D776C85
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706704461; cv=none; b=b340cWoP5+lwl5r4w2BUOP29/CUTaqxownNwLqtfrMiBY0JAyqFJNZuqzORnYYrrnNoziEmHPX9Mi9KoiO/g3WTROMxPWFakbBbBxs+spDluHGt6wloyz8pQFyKXBUXNRS59jfcJFbnZtswjy3lKuXer3htPxs1Y2az8ofqzOA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706704461; c=relaxed/simple;
	bh=yl7X/G/4MBAjUx+RX6EbliJqBCrIxX6dil7pQuxJagM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBtmxLhkptYZKyHOYDwbFCAun7mAHcXbPpGqTdLhuEfuovb1GHljBNCFecz/zkSetwUUMQcqtIqUOTkZd8GQ11LUhKIpXowrEVVqV3RP5+gUMUMaOqaUTV5V8e3FbGOP0A9ZRGzs/3PRuY4LT2T6HC3E4nBcEI11BypOSTe1tuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=R5/7qVG7; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="R5/7qVG7"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-295ff33ae32so33157a91.2
        for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 04:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1706704459; x=1707309259; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=So/uvJkDp4G4Nx+mQeNe/SDxpCPSp5I1+BiBqw9eNlo=;
        b=R5/7qVG7Pz/AIFrVoEx2B4Tvoi11zrWplN54NgeGoIV+OXcpPQ3N7WfXXOCq/HLD9Z
         JW3IuJRHi+i98529CKmwas7xhFvhjBb9EeY4sSat8HC+f7X7PemOcIRpT4Flr2inc4TT
         irev2tV5YdzCcqbXxALhwsRoC5Vh0FvB1PbJbsIFkSaq4u5kcGaCiZAzsb5rL/3PAeS5
         Lb72RKiLm/ZF6yiPMzITDkhc8olQpq3HbTnGFy50C9ZHPG4O7jUR28lbGHM9xbWFWU0O
         9rYKzcmYDd1IUut8BjwfQkvtk6KFWN4mmD49CpQVqFtgBSGTT7BNBa6y2BSlmbsdEx9P
         QoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706704459; x=1707309259;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=So/uvJkDp4G4Nx+mQeNe/SDxpCPSp5I1+BiBqw9eNlo=;
        b=r08inTBW5fBgDXMLk5BscUjyh5pg8M6obbxOpduVZNuRfNIF0ya63Vaum8ERUfjhIq
         /Spz5i/+dVg4MoiAAyXlcm8joy4mGUsAGkJ9N8O1xOmnzn/md9y538sJmtRG/8veRPLP
         7E6WwNy+XzKwOlsw0HRGFUr0LBRvrmCOHG46zW/veVmuOfrt8jYwyZ01Ps046utKd8Cs
         FKjVaoRn86LC0gbrXd23iDTCwS/2Wxd71xiTtL+Jl01sJCKD8PA/s5yKt9zZBebB10Oy
         TIPn2Rp5nHNUxZ7JtpSbTG51xspZUTGVP7UbSWa2YCBO8+YRpuFewyMS56FFmgXMJt72
         f1ow==
X-Gm-Message-State: AOJu0YziLva2Xhw+/LB8ATt+F720iNN1f+5Ijg1oTkaXx6GWXfTkAuK9
	a3iLixvYPhYXerR0p/n0l5cm5URILxNGbt755poOD+ozKdVZOlbXeKPT0Y87nrY=
X-Google-Smtp-Source: AGHT+IGsxfYEcpEBVgRjFA2wMEDD0Y1dmHe7mllxjn2xAjfd1wjBy8Ndmdo1creP5/Mlj3mLlqdE6Q==
X-Received: by 2002:a17:90a:6807:b0:290:347a:f270 with SMTP id p7-20020a17090a680700b00290347af270mr1388562pjj.42.1706704459049;
        Wed, 31 Jan 2024 04:34:19 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW7Q3iKi08RHom/1AC+kItSc8fI1JdcmQvqWrtaH1OTiYGaOoC7rWAbcsSI881DXrWVden1BBB4OK0Kc2T63TSUM5sR2YDBf/RFptMm1kXmGI1751SwZGY1HTU02uRl0rssqqL6vabgKbXPlO0BhVnoOsx1XRBnze+csYwlWgQz0mawXTI6Ut5skYLesOYwWzdaTV0g8iuTknXT82h1X47qrdne7t0vZQhGjY/aQi2gK1ea94aW7o/k/w==
Received: from [10.84.155.124] ([203.208.167.153])
        by smtp.gmail.com with ESMTPSA id pt16-20020a17090b3d1000b00293851b198csm1379458pjb.56.2024.01.31.04.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 04:34:18 -0800 (PST)
Message-ID: <a253ee7d-8351-4cd1-bebe-fca1370b4093@bytedance.com>
Date: Wed, 31 Jan 2024 20:34:09 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [linus:master] [sched/eevdf] 2227a957e1:
 BUG:kernel_NULL_pointer_dereference,address
Content-Language: en-US
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, aubrey.li@linux.intel.com,
 yu.c.chen@intel.com, Tiwei Bie <tiwei.btw@antgroup.com>
References: <202401301012.2ed95df0-oliver.sang@intel.com>
 <23cbb613-c8a2-4f07-b83b-fa3104bef642@bytedance.com>
 <ZbkDIlIR7qzPt7Vk@xsang-OptiPlex-9020>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <ZbkDIlIR7qzPt7Vk@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/24 10:09 PM, Oliver Sang Wrote:
> hi, Abel,
> 
> On Tue, Jan 30, 2024 at 06:13:32PM +0800, Abel Wu wrote:
>> On 1/30/24 3:24 PM, kernel test robot Wrote:
>>>
>>> we found this issue happens in very random way (23 out of 999 runs).
>>> but keeps clean on parent.
>>
>> Thanks for reporting, I will try to reproduce the issue. Does the 'parent'
>> mean the same code branch without this commit?
> 
> 
> it just means the parent in git log.
> 
> xsang@inn:/c/repo/linux$ git log --oneline --graph 2227a957e1
> * 2227a957e1d5b sched/eevdf: Sort the rbtree by virtual deadline
> * 84db47ca7146d sched/numa: Fix mm numa_scan_seq based unconditional scan  <-- parent

Thanks for clarifying, Oliver. And can you please check the parent's
dmesg for the log:

	pr_err("EEVDF scheduling fail, picking leftmost\n");

which potentially turns a kernel panic to a message.
