Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB7914D2B3
	for <oe-lkp@lists.linux.dev>; Mon, 16 Sep 2024 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477865; cv=none; b=hxUe8pA7jXLHIbZxpBrPDyGsD46W0oYH86YZYBNVYuZEmyMWWegQ4vLOBLlrpC9gl+HRsv8q/+Wj/16jUD7a4ibXBJylyeLfzygGH6PzwWnTbcbrsS9QiyAMntQU/BuLApFW331UMzWsqxdkmwzjrKPHvAVxCTZDjhzU0KhKMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477865; c=relaxed/simple;
	bh=oKv1j2zjEgbUuEBo8uTbPvQcbqaTBQ0Tfje6V1vCbLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAR1xYMkYrfjElZiik9Iqde2ESbgyzz1SQTw8e5Pj5tkzn9aHEwDgiw+xGBNrNxiP7XyPB30mPjKQpRDHo3l378Z76xgURJ0Og7o51NyoNHsur5rWszp8xSDHPdXl4cASROqkWh+OPJnivWmEhgJZlDVQDDCwXApDVtAOrOsN4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=pFJYVd40; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="pFJYVd40"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7093b53f315so408555a34.2
        for <oe-lkp@lists.linux.dev>; Mon, 16 Sep 2024 02:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1726477863; x=1727082663; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iB0iLT/8TvTmHJn9WRSQVtiSgNMjO9zWYPE4mvQ/O/U=;
        b=pFJYVd40dboZI5lLp6lAP69gL2SulamowTHQAXe/jhoFSU+o59bQ+j3CufjmrmspQo
         Sv5/5UtvnX6fbcwS4LzjbdEKQuyzJYyMGpmArYmp3FBzN+5ZcjsIQi9arV5O1/as7BXB
         tvoG4TNdi4CUw4W72HBhmcSvw92orr3PxNij+lVKjASkjlqUAPPUdKoaX5YSuF3usTFG
         xdAVy6Fllc8a1qug8lZOPe+AjHLFYQ/s9iwgXEvQcJB1qIKvymoMU3JJgrUWOJAV7VO3
         fKKj8BpyibJJo11EdFfXdhthsmPFqRl4Y/tixmssFXaiDCp4wECnaxprEure15XfYCQr
         xdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726477863; x=1727082663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iB0iLT/8TvTmHJn9WRSQVtiSgNMjO9zWYPE4mvQ/O/U=;
        b=EqLYX5tfG0jat03NE5UJPjfklszb6OWVVYYCf6SQ5/K3sH9wzfGB5n6oaDtZGxBjTz
         96aEGVL+mChAIxRZSS9ihHxmAoQLoelKqMOd6KRJo0lAvva35rQxmWrkyhVgr7ZDvnXX
         QBXMTFT0OvOsuqFGfSOvVp15r+pioAbCo/tpjQi6aTHlC5bkq6XH+Y5nogZNElOM/JaA
         9bniyO0bUdokj9smHtioF7+9jsWuGlDrIteou6T9Oi2XAZh3U6RQQYakB6SVbHxt8xYj
         gpGOP1FnhFzfTo7Cc43nEc44bV3N1pKOea82rTwRFpOc7hyzQraLtNX7rQ1q3Kw7RisD
         x0jA==
X-Gm-Message-State: AOJu0YwoTkAN2BmLYl0a6yUoU/gIctYRfQ2c1grlEQ368quVdx+mEhEp
	sXI7RQXrS2jLcFgHs6NZvuJbTeJOINYVHLtZFaamjchgsUJoy0Znmo78NlNH4bc=
X-Google-Smtp-Source: AGHT+IG18RdOm0vbAKJkm4n4+MaSSOZH1X3lKxpugiFqOkoBdF4w8BZj/FNu0e6PRg7IZRuZ22LDlg==
X-Received: by 2002:a05:6830:2113:b0:710:bffc:a28e with SMTP id 46e09a7af769-71116c0d855mr5273746a34.19.1726477862747;
        Mon, 16 Sep 2024 02:11:02 -0700 (PDT)
Received: from ?IPV6:2600:380:6345:6937:6815:e2a7:e82c:fd22? ([2600:380:6345:6937:6815:e2a7:e82c:fd22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71239eccdf4sm1026813a34.36.2024.09.16.02.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 02:11:02 -0700 (PDT)
Message-ID: <da3f34b8-220c-4951-835e-a9036e79f47f@kernel.dk>
Date: Mon, 16 Sep 2024 03:10:58 -0600
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe-block:for-6.12/io_uring] [io_uring/sqpoll] f011c9cf04:
 BUG:KASAN:slab-out-of-bounds_in_io_sq_offload_create
To: "MOESSBAUER, Felix" <felix.moessbauer@siemens.com>,
 "oliver.sang@intel.com" <oliver.sang@intel.com>
Cc: "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
 "lkp@intel.com" <lkp@intel.com>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
References: <202409161632.cbeeca0d-lkp@intel.com>
 <59e44de9-8194-4817-b910-0de89fea1452@kernel.dk>
 <1c5f77a9253ac3a56a1e00f7b588d86d447a54c5.camel@siemens.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1c5f77a9253ac3a56a1e00f7b588d86d447a54c5.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/16/24 3:09 AM, MOESSBAUER, Felix wrote:
> Thanks for fixing. While we are at it, I noticed that putting the
> cpumask on the stack is discouraged. We should better allocate it like
> in my other patches. Shall I send a fixup patch?

Yes probably not a bad idea, some systems configure with a large number
of possible CPUs.

-- 
Jens Axboe
