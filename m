Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB737319D
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706704112; cv=none; b=O9KhoxDc++Jvxwh5107ilESLUD7UNPjPGWeCcA7WOdmsBNm0fWFgem20o9Zc2UkbOonaGqAnaosdJWnGOMIJ8HmYUvQnALODtaE1EUVefWawTRpBCeFi5sf0WrjJf1HMwd/rPDm3Ssb6Qdmts4H8ThQxJ80GSwmGw4cfPajrcf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706704112; c=relaxed/simple;
	bh=tfmIVzpbc4f8nhcF44Q2JTtDgeYljS2rCMhGYPSASCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUC6wZpsLtAGo2oa+hCUuEsQUqqecoAdfi3udvmZOE/wRfCpUKAgzYRcdcRXp2V5cp3P8InfurVjeLBSAUJiLvDw0zFarvB8+0QF7GRhT/QSE+9ZeXQNzv6nf/FfKz2kwT32Y2OSs2RwOBggk5OH7hd/oMC7rJWr/0VZudduZmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SmL1vxLO; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SmL1vxLO"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6e1226b30ffso1768441a34.0
        for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 04:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1706704110; x=1707308910; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNxGBaaSxXg7VpaG5SnLb4vaf3Z3poEmNpgkXrljdPo=;
        b=SmL1vxLO/vYAzQzA50WgTXThjtTY6FoACdNKh0IM9KjS4KDXIADCvDdnGGzI1/Noqa
         yLSKpjvGD0qx8XkKMmEEQm/nwCBht+h1564zMxY+LLzMwzG3jaFZaUF5HPDya7byZIsy
         xyrTPHiM+2bE1iNC0iBTheBskuY21Crvs92GsDUBoUSLu7Z2A5itaFWkIS0YPZaNk5jG
         CaXnGrIN9Yfft7n4oroyFq7J5U3Lrdms/Cx70SlhSJewzp3ZYCYHW7bmT7z4yzJbqE8p
         mgb4O/OLqj7+yAYSz7EbPkvJJ8AYFG8OrK02CW+IfWhDCxk04rvWF6/PExSam/7N7a+a
         C5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706704110; x=1707308910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNxGBaaSxXg7VpaG5SnLb4vaf3Z3poEmNpgkXrljdPo=;
        b=NzsPQrj5H4ilUIViEbjMxbu+EAXS2nObNFCA75c/Cr5SnCH9SmjSS6t6XojWPCwofe
         GurwDiBcKC+dQV+NNK4aTlQ8MA06M9di8EKZT8Eg5G1aBh9i/FYwrnTJuu8tr6FhGHD9
         Afc2Rw4wzrDLBlG6N6R0/GA3RS49X1rbX8InQdsETE8iIzAmXgitnhIsQ+j0OWo5rtyI
         ub0fMAJA3Zy5F2X/3kq4Wxch0A2UJgGhXBwKFu9pO5pGyNeFV6QMJW0T+nBqBax6bYBb
         9EBBpZQfen4IA5Di+7n7c22JPgutyCOJIStIioKaf6XfquUp1LiX5ft7gJ5yCRur5yjd
         TVig==
X-Gm-Message-State: AOJu0YzwKIHgUb1+Wt2aq43uj+7+1hvqksBFpklDJ8jwFxCiH/YU/zK8
	NBCJsx2hy2Fb9BjMpML1LwnM2sM4Q0Z4JHDj5C9EOWUgobMx+feGRg/VdjzHI7g=
X-Google-Smtp-Source: AGHT+IEZwI90sSbUBYPDxpJwWWSo/z6iYol5bzvi1HebeQc65zRQWcisWYIArBzok8SBfYP1+lV7Aw==
X-Received: by 2002:a05:6358:190d:b0:176:ca53:39e7 with SMTP id w13-20020a056358190d00b00176ca5339e7mr1306083rwm.11.1706704109808;
        Wed, 31 Jan 2024 04:28:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVApRk+Nl6C7odE+YdD0sEDKLDB3ojxqLvTo22j0Qk+X5bOUHrEf04nQTk24XBC1zrHKZxVdyTN3eW/6gonz21ySmhdR+LKj3KGFIhWuA3AdbwqWX4VG5lJ6SxArzD8swpvZll0ArAVUXcBCbmgPvjIVAqQsIWUtBXS/yRI+l5cAC+LVW32VndULsWDH3CllD9bL0RtEksNbP3VMidcGapQnzdRuZzMNbJd1gb85Q8t5Bt3Km4RtGX2
Received: from [10.84.155.124] ([203.208.167.153])
        by smtp.gmail.com with ESMTPSA id u33-20020a056a0009a100b006d9aaee2f57sm9812307pfg.102.2024.01.31.04.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 04:28:29 -0800 (PST)
Message-ID: <5f8f4222-a706-45b1-8eb2-fd4553cc57d8@bytedance.com>
Date: Wed, 31 Jan 2024 20:28:19 +0800
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
To: Tiwei Bie <tiwei.btw@antgroup.com>,
 kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, aubrey.li@linux.intel.com,
 yu.c.chen@intel.com
References: <202401301012.2ed95df0-oliver.sang@intel.com>
 <23cbb613-c8a2-4f07-b83b-fa3104bef642@bytedance.com>
 <8b21e697-c9b9-49aa-a7ad-e88a5d7f9c92@antgroup.com>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <8b21e697-c9b9-49aa-a7ad-e88a5d7f9c92@antgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/31/24 8:10 PM, Tiwei Bie Wrote:
> On 1/30/24 6:13 PM, Abel Wu wrote:
>> On 1/30/24 3:24 PM, kernel test robot Wrote:
>>>
>>> [  512.079810][ T8305] BUG: kernel NULL pointer dereference, address: 0000002c
>>> [  512.080897][ T8305] #PF: supervisor read access in kernel mode
>>> [  512.081636][ T8305] #PF: error_code(0x0000) - not-present page
>>> [  512.082337][ T8305] *pde = 00000000
>>> [  512.082829][ T8305] Oops: 0000 [#1] PREEMPT SMP
>>> [  512.083407][ T8305] CPU: 1 PID: 8305 Comm: watchdog Tainted: G        W        N 6.7.0-rc1-00006-g2227a957e1d5 #1 819e6d1a8b887f5f97adb4aed77d98b15504c836
>>> [  512.084986][ T8305] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
>>> [ 512.086203][ T8305] EIP: set_next_entity (fair.c:?)
>>
>> There was actually a NULL-test in pick_eevdf() before this commit,
>> but I removed it by intent as I found it impossible to be NULL after
>> examining 'all' the cases.
>>
>> Also cc Tiwei who once proposed to add this check back.
>> https://lore.kernel.org/all/20231208112100.18141-1-tiwei.btw@antgroup.com/
> 
> Thanks for cc'ing me. That's the case I worried about and why I thought
> it might be worthwhile to add the sanity check back. I just sent out a
> new version of the above patch with updated commit log and error message.

I assuming the real problem is why it *can* be NULL at first place.
IMHO the NULL check with a fallback selection doesn't solve this, but
it indeed avoids kernel panic which is absolutely important.
