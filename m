Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6981EE7DC
	for <oe-lkp@lists.linux.dev>; Thu,  1 May 2025 04:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746072664; cv=none; b=in8M29Hbmu2WM7rfSryKOrkOjOQ0K1H5KlhOsPVepau4XOLRnTxov8qr1e7MUzz65RMhcvOdLwGnLgUpf8oUdrcAYdTHjrp1zVdC2eKfgGe3q7E53+P4oIrEgroPvLpXzswKq+BRx9liFkRtqaxjH3tc8OBuZLG712vUHvR1x6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746072664; c=relaxed/simple;
	bh=cglhck3ZVlSAKkENCvkXY5/2fG1tC16s4xQjru2vpAw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KB1y9J5aiwQ4c4JjrsdY2tj1adISw0LQBAsVfwSNXEjJvKjq12niBcqiBX7jaCkGQqXqbF/ASR5Ov1eKOrSWvxH6fEYRIP04FMDCUc9tetRkw0gNq2N0MC7e8e4qvcEXXdmi8nfXNZGvgFC9xVOnZt0hxGFIxgkshhmkt+7Luzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aysnWxFL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aysnWxFL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22c33e4fdb8so4963285ad.2
        for <oe-lkp@lists.linux.dev>; Wed, 30 Apr 2025 21:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746072662; x=1746677462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cglhck3ZVlSAKkENCvkXY5/2fG1tC16s4xQjru2vpAw=;
        b=aysnWxFLqacN0YmI59NMuva4crYd9cvmJMghlGImD+Dn4aNfqn/ywqst7Rh+/cxeop
         saIS6aehgviZq4VVF5FqkEXeq3QQrV1X8ZjJmDR7l+FvtnE82azpgTXcB7jouYUvqKTb
         Rsj87ItHBOcfH6ImtHHNEomW7ACT69y/Zee2uQsqlTKIOdCpjalc5inNBT0EXubGDTZy
         fYefAPKC4PTQGMoCOEbSV1Q1MeQazBO+H/egFFrQ9OIGb/yweoCRE9olsOvwk3CaDDHh
         2t8B1XtYCjBm3kWEfdWaYiFF9fGdq3gk3yeYTKiUHhX3dxPmJmJw1D5NMjpnSo3LIf6/
         xEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746072662; x=1746677462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cglhck3ZVlSAKkENCvkXY5/2fG1tC16s4xQjru2vpAw=;
        b=ZTleHGMVeCvscqXEw2XrwwpkizeAZiq4poqMQX8GID/xpiei5P+FHphMGg3gKMYJ+5
         0l7xWxquNsOAGDlDozd0uaLnUqof4LpKdXHakzoCNof3kFjMiVYXYPar/LUwkGSvPMqz
         FuqS5FsQjKmxu8GBCX7eqhDDPRUEqaiPPhSb0CyjMWjXmhI6XDeQTKNJc8Nt8s4Qg2/Z
         DQPwS1X9vOSx5AlFUlhg4E0Cy6BefDd+Zm7spz29/E0/FAdXrA0fLlLhJ5KwM/ntmD3g
         R20XHoUoadzN2juIVhH1tY4qDUsuokwDr7lUnauYcpsHpAI9wAayTDdSVidVqFn3k0na
         kYQw==
X-Forwarded-Encrypted: i=1; AJvYcCU0wLlVHCmH2O42XG2eRxYEzlWd89TxiNVHzqPBuEYM/P1VUxKcEZcou7zymsf7s4VqV+9MVHY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQy5NkmdaM9oFoFPJbhqlaDm0AvCcV3pmX5vEuFbz5H2HafWfB
	Pd09/G/YY5zc5KtjFbESaodeTQzVy8IHPG+2Ot77lvVbuNMmpcp7
X-Gm-Gg: ASbGncurjFMBJfqvpUqbDHXo5WPN1KFI9AE3QfcH07YkkZPRZ0OPuupB+TBFFWiGIFr
	PoQxhSeuN3h4sobcuk/cqeuS2/CerbD+AcXbJlXpRvgH1FrlECv3n+0lGgD3SyCb/TbjqLb1ICG
	9v90psn7Y+2zP+PXt9IgBFFoZz+mhwiYQFiMbHxE5ovqF1C+lTeiv3XoluhX+Jyj3pzoEXe8Fp9
	lCrfmODynyHiOyBIr43prRUiz5xF5yPXNJdjdou6b+B6xpeMpmwnwKowRo+Nr8mq8ej0Qd1kj7w
	yfxL8vVXzhsMAfenlgjgxTU584aPIJn0lerQOhgRtLyEjDu/mBlkL+9OJIR669uY023Ip4vfeMp
	ODb2qhn5jPi4=
X-Google-Smtp-Source: AGHT+IEy/jmpGgpIyizyxFYlKl0htHFpZ7soOfbtZASR7k6jSxVTqIU2w/1i4rQkzFMZ/p1as5YCOQ==
X-Received: by 2002:a17:90b:2750:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-30a41eb505amr2272046a91.33.1746072662145;
        Wed, 30 Apr 2025 21:11:02 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.local.valinux.co.jp (vagw.valinux.co.jp. [210.128.90.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5f86esm2563115a91.44.2025.04.30.21.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 21:11:01 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: john.ogness@linutronix.de,
	pmladek@suse.com
Cc: Jason@zx2c4.com,
	gregkh@linuxfoundation.org,
	linux-serial@vger.kernel.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	oliver.sang@intel.com,
	ryotkkr98@gmail.com
Subject: Re: [linux-next:master] [serial]  b63e6f60ea: BUG:soft_lockup-CPU##stuck_for#s![modprobe:#]
Date: Thu,  1 May 2025 13:10:55 +0900
Message-Id: <20250501041055.6504-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <84y0vhodwy.fsf@jogness.linutronix.de>
References: <84y0vhodwy.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 30 Apr 2025 17:47:01 +0206, John Ogness wrote:
>On 2025-04-30, Ryo Takakura <ryotkkr98@gmail.com> wrote:
>>>> The touch_nmi_watchdog() resets the softlockup watchdog. It might
>>>> hide that the CPU did not schedule for a long time.
>>
>> To test the above, I run the rslib test using legacy console(without
>> the John's series) with the touch_nmi_watchdog()s removed as
>> following.
>>
>> The result is that it triggered the softlockup as expected. So I guess
>> we can say that the legacy console was indeed hiding the softlockup
>> scenario as suggested by Petr.
>
>Excellent.
>
>>> With the John's series appied, I guess the kthread were running on a
>>> cpu other than the one running the rslib test as John said[0], and
>>> neither of touch_nmi_watchdog() nor cond_resched() were called that
>>> could prevent the softlockup.
>>
>> To test the above, I removed the touch_nmi_watchdog() mentioned by John[0]
>> on top of the John's series with the printing forced to be done on the same
>> cpu running the rslib test by marking emergency section(below change applied).
>>
>> The result is that it triggered the softlockup as expected. Similar to
>> the first test, the touch_nmi_watchdog() was preventing the softlockup
>> when its marked with emergency section.
>
>Excellent.
>
>> And I believe this implies that the kthread was running on some other cpu
>> as stated above as it should also be calling the touch_nmi_watchdog()
>> when it does printing.
>
>Agreed.
>
>> If sounds good, I will prepare a fix adding cond_resched() to the
>> rslib test later on.
>
>Yes, please add a cond_resched() to the rslib test.

Thank you for checking the results, Got it!

>> I tested with Linus' master on x86 qemu. I was able to see the rslib
>> tests prone to softlockup and the John's series exaggerating it, same
>> as raspberry pi.
>>
>> But I couldn't see the softlockup go away by marking the emergency
>> section around the printk call within the rslib test. Looks like it
>> never calls the touch_nmi_watchdog() in wait_for_lsr(). Maybe because
>> trasmission gets immediatly completed on qemu board?
>
>qemu does not emulate a baudrate, so indeed transmission completes
>immediately. It would need to be tested on real hardware. But I am

Oh I see, that makes sense.

>certain we found the cause and explanation. Thank you for digging into
>this!

Great, my pleasure!

Sincerely,
Ryo Takakura

>John
