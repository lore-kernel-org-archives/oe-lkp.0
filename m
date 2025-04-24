Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B15227FD4D
	for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504039; cv=none; b=uMpSQa4pHUsvcDoT22miSa8RzQ+hq/pxIu2EOKJ7SYmhg5PEM9mEJPQhyEc8LPOa/Mcx/dXgLg36/vqrvC0I5RrxMgVVigCJVmkWhS/e80nKkL4TeknTU9w02a1WIUHrVU2axq6FgjRKZLXpyQ9D25xEOKhyIVz2/Le2Is1LIds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504039; c=relaxed/simple;
	bh=bEqpNki7jGGD4CCKcLuIXPBkDheH2qulR1vPkXOdIOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlC2QtmeYKVErkAXuH9yJqv7TzUF1hbOa/XQ3gH156l2KRwjt8Z3J2Pp/C7yPFuus2e+nfqXZWrGyMwbRaM3W4D3zzWZyfeeRmgiRsw//ysdgFJjQUA5SwtOSRDRw2XYBNklBayegPA5IzhZDxTpaKGuHYE9b6VSUfDFO0LFpkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg6f3Lsq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg6f3Lsq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2243803b776so18606715ad.0
        for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 07:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745504036; x=1746108836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEqpNki7jGGD4CCKcLuIXPBkDheH2qulR1vPkXOdIOM=;
        b=gg6f3LsqfFok/lGTG46aaybhNuNQ6hcZf/78o8kFgdt3I9EVb7bGd7qXJnsovYD6QJ
         BDd4+FckLLAEtxHUivNYB6o7N+08bc2UN0c/r9qKsXPCj/iGCN5jVDITB0b5mqWfNTN0
         RPpUiUkv/5/5sTPNmC0HbU87BZVMKd+alqildVSaAUGPltb1FksaTM100b2ulf6VMPKz
         Q/1xxO/+DYPMxmlHzumG7x6lJDOXCnXz4L7DeyOxXqg/IKJ0BgI9VipAjA4lCRvzyyf8
         2txpqQ7KA3eJbLusaUQHxbkjOL5dsGitfvE0Sf9P9sXm8IiHJPq3JleV6V1RyiUDpCkA
         Wh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504036; x=1746108836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEqpNki7jGGD4CCKcLuIXPBkDheH2qulR1vPkXOdIOM=;
        b=OnDJC7IlvY5gCcZxQjLdBh9ruSglDmJb39hi3GPXMZJP53fsPFtxyv4zJvjjs+RR/w
         5SecO32iOPdyWdW+7pEk6N+Y/msMeZyrhZGwq46G3Ep8LaIPRdyR9yfBR1MamRtZkLCB
         V4evgASDhHaPuj/aFtllItWdwGBPLog8FEYV2GW79Fvdh9vfLRtTkyO7Oo3iYTEjnRPA
         Qs0j8lXLogM9oY8cOJvVm/npaLoymDlpTGALmAqNEVt+s147N9pWPMlMh9x6vM4lUjPr
         s5nUo66Z0Yyj3XnVhUFpoqcmPWxIJ8UA1VAWr6qOFAnxQLySRy90tUn0Vf7FbodO22mT
         4ItA==
X-Forwarded-Encrypted: i=1; AJvYcCWQVUp0LZC0Y903BtPHQ0wjJDjrJmJfjkBvwm5b8UJBm1pkqqTJNS9AZ6iDWs8ttfzmdyXBQF4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuV1qNNSrvp09VKZj4qbfyaVUAldHCYUnPNIcLR9EeujxlFLMe
	v9vkWPF6m9KqnkKWJeShd7+X/fKPp/o08frdtGGpf5qvzqXMAFuv
X-Gm-Gg: ASbGncua/Zp0gpDgaRK95g90PGQ3A0zUXWCEMHQ5r0vAVkHFrLO4DF1w67wGRiY4+7Q
	8oCpyHmZOGa5Z6ClMycHfAByCMsFo3n3w36GhnctAsRa7lqW11GNcM+8R8zz0Fhd9xfo7FupmKa
	2fZYAnwfgnoz905SvIerhnadjtSP8dvwwe9W8FZq1xkbnLW1Zz3cU713f2Vfv5phnS6u0khJobK
	xrcZV8YfzI0h5vDrYAU17riMgntbOPuXxAX2H16KUTzu6GtMepViUm3TEKD7Mdxdpem5wuZJGg4
	DyvSVreJAGheUu3k7AyvjwEhYW4MWKn/oK71RH2iWjK5suXMGy7Mfy0A
X-Google-Smtp-Source: AGHT+IGVeoyB0CtF1JIBT/QIdiOCuc0hvo9bPO8kHlwKv6ZbpmQi14kg9HTEQ33x3IgXj1fNkM0diA==
X-Received: by 2002:a17:902:ef0b:b0:224:584:6f04 with SMTP id d9443c01a7336-22db3be4400mr38867505ad.18.1745504036256;
        Thu, 24 Apr 2025 07:13:56 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:a0e1:7d00:529e:8ad4:796c:105b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76c8bsm13764895ad.48.2025.04.24.07.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:55 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: john.ogness@linutronix.de
Cc: Jason@zx2c4.com,
	gregkh@linuxfoundation.org,
	linux-serial@vger.kernel.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	oliver.sang@intel.com,
	pmladek@suse.com,
	ryotkkr98@gmail.com
Subject: Re: [linux-next:master] [serial]  b63e6f60ea: BUG:soft_lockup-CPU##stuck_for#s![modprobe:#]
Date: Thu, 24 Apr 2025 14:13:51 +0000
Message-ID: <20250424141351.7674-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <84r01i0w9k.fsf@jogness.linutronix.de>
References: <84r01i0w9k.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 24 Apr 2025 11:06:23 +0206, John Ogness wrote:
>On 2025-04-24, Ryo Takakura <ryotkkr98@gmail.com> wrote:
>>> By other words, the rslib test should get fixed by adding
>>> cond_resched(). And the conversion of the 8250 serial console
>>> driver to nbcon is correct.
>>
>> I see, and agree! I'll test what's discussed here so that we can say
>> the above statement is true and the John's series can be brought back.
>
>I'm looking forward to seeing your test results. Note there is also 2

OK!

>more issues blocking the series:
>
>https://lore.kernel.org/linux-serial/80b020fc-c18a-4da4-b222-16da1cab2f4c@nvidia.com/
>
>and an offlist report from NXP relating to not being able to suspend on
>ARMv8 due to printk irq work IPIs.

Oh, I wasn't aware of those two...
I may look into them as well after this!

Sincerely,
Ryo Takakura

>John
