Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25C01C245C
	for <oe-lkp@lists.linux.dev>; Mon, 12 May 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058063; cv=none; b=p/dmhbw4l/sjHAWtHCMLATQQYVPTEO0ShHuHZcry75gLwxekEFimXD0wEHt4xodGvuEZA03G1YjM5LENTlLqFT/FmCbvgcctBjqzeWuRYe42XzrcMqBs+ocsC4Ic3UHHUYEAzXb+mGVq6XzESaxclMAxs1KU5Qoi/GnO6yUFo78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058063; c=relaxed/simple;
	bh=8GkWBNNnFESb8efDPn89Tm9awp56Urw0Vq6vCfo5XSs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qzj4CqofUmIoN0vRQUJ6ldOdworxmieDVwHAR+mwPsyo69b1ikIvjXvds5A7xEVknoUIn57mvsnX8HsrPQa0wlGjPyZV0rJvZoCJwn61qo5cwtKeiXWm9rJin3p82TKeZMqFDmHqew11IE/6vB4uoD6W4qqXCpOup90HBvoSVF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cs5uNQUD; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cs5uNQUD"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7398d65476eso3636059b3a.1
        for <oe-lkp@lists.linux.dev>; Mon, 12 May 2025 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747058059; x=1747662859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GkWBNNnFESb8efDPn89Tm9awp56Urw0Vq6vCfo5XSs=;
        b=Cs5uNQUDyv98qYL7ARkbGjCpEHdFl8shJbfnWsscKKsLTCXCj2thHtlXOoxshWZIKv
         qYS6g75PknuhqMvEtG8sBjOYfpHNFLSw5mnsoidyxkgYXpaDGExIR9UDzvccA1xQsrhV
         5aHF9gFnhlMFGeqcjp4CUtb1zdbgfpm8Sv95y1az4c4X1ZSeIpnPeIthub0r0VtU5cPx
         c43MPSIl+5xd6ZnxT5A4het+SXkt1I/PYmrrWaVT5hDsRje3PCs+I7v4/h6V8sJh9J3Y
         9wj8XfbcMqJWEMsd1X9IEpFdL19DKEtXj8MWvrXnggx2/2kFc3747qt3nafaDx/WqlCW
         h3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058059; x=1747662859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GkWBNNnFESb8efDPn89Tm9awp56Urw0Vq6vCfo5XSs=;
        b=PIFlc3/hp5bWn1bLUPJY0IFLw++B9nm25ao+UCMqSNuxG6nSXaGvfZvQMff6s9q9yf
         JiQ3IkywbWUwDNHB797NxFrW7x7rFGxAxhn0Gn3U222G/WwcvGmTfeTVThQbhjyzm1kY
         aECoyrTeNJj/8FJYOCM3tzJzvdVAszpgdW7a4k6sI9DcAhFFZlB24XYdFFTf59fR8Jrc
         uOmHI5AlubJ07WB8uvL0UNDEsKMM9jkkQL4eSR8oRo+sG8pz2yKEMbLVbFVDDBREiCrH
         hHXzqIqg8MjJDh4Wzo7ehmQ4SWbpTA94apVLErQRzI8csbt5W4TgCu5UP5oiTiyc01GC
         JjsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi+lZS6kaWCXAheCGL4VncqIBsi5/BorWEnGK2bo8stN2fJjQ390tAt2Dni3Ew2E5nVzeZihE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+LkoCHP0JotxaWQNHlb2f5seXUdBRFui/GcA6szcvOT36xa2r
	5vWlNcwYtwAw5YZQg5kE8M8tWu1uxFW9t4n1nSQib6ERGn1qnoea
X-Gm-Gg: ASbGncuSZhj36eJoonZF0LAmBZKp30QaAjC0KxuHPkd/PxNAMphO0sB2b+RHfGoW/GX
	AeAQ4bBU6+04OqUB3x5n/YlvZdPlalyrzu5Nyux3lO8xYbqus8OrJFvdZpGhB2awDA0xSARTEvB
	lnBfOTuMlXrF3fONrptmYvtH9VhDP5vpY+YVCCcRGurgNY7oy4/dToBlduQXTVG45yAYmGOer/V
	7l9Uv60RFtnlJaqAnWrUcbFsBgzuqWVZAA+2Mg0AJXWQ8PvWhfP+vvEArDvtdDnTsAgYdY/75eC
	ytUvj1B28S6B12+J+m43ShE1sUUeichAkQGF296V40crxVxFvmfIYdYvu9A5JbRvWraGqwSPSa8
	dZB+e1JSuNjxOZT4aWiH4vnZe9m+34D2hobp+hMbKshp/JLXX
X-Google-Smtp-Source: AGHT+IGcwH4xhgzu92EngbJgz8zitgY8MX8eSyq2ibCraSh/UyRp78E7gCvILjWHKR9masBZ0d4tkw==
X-Received: by 2002:a05:6a00:3e20:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-740a9316019mr30196519b3a.4.1747058059150;
        Mon, 12 May 2025 06:54:19 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0cdf0sm6245501b3a.98.2025.05.12.06.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:54:18 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: john.ogness@linutronix.de,
	pmladek@suse.com
Cc: Jason@zx2c4.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	oliver.sang@intel.com,
	ryotkkr98@gmail.com
Subject: Re: [PATCH] rslib: Add scheduling points during the test
Date: Mon, 12 May 2025 22:54:13 +0900
Message-Id: <20250512135413.4558-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <84ldr2xmz6.fsf@jogness.linutronix.de>
References: <84ldr2xmz6.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 12 May 2025 10:22:45 +0206, John Ogness wrote:
>On 2025-05-10, Ryo Takakura <ryotkkr98@gmail.com> wrote:
>> The test has been prone to softlockup but stayed unnoticed because
>> of the printk calls during the test resets the soflockup watchdog by
>> calling touch_nmi_watchdog(). With the commit b63e6f60eab4 ("serial:
>> 8250: Switch to nbcon console"), the printk calls no longer suppress
>> the softlockup and warnings can be observed more evidently that shows
>> the test needs more scheduling points.
>>
>> Provide scheduling points by adding cond_resched() for each test
>> iteration on their up to/beyond error correction capacity.
>>
>> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
>
>FWIW:
>
>Reviewed-by: John Ogness <john.ogness@linutronix.de>

I'll add it. Thanks!

>Thanks for getting to the bottom of this.

I found it was quite interesting.
So thanks John and Petr for many feedbacks!

Sincerely,
Ryo Takakura
