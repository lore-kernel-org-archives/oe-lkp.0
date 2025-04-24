Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0270E19E7F9
	for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504256; cv=none; b=F4RBPgrF5pGmOWJOpL1nlBtncU5pJo7IqrB9r9xcYQO8MjdjEuzIwH/KIrbRm2yUWnCOa1R2WXtWNhQisiWAsr6PcLF377z7YB/53OFIjd0MmWwu6AR0LdjopnYdlbr+t/CEduCi7D6QETiAfRRJOFujYJ/+R9HHgR45iCeGRN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504256; c=relaxed/simple;
	bh=35O+eXZY3DntnXcoScC+cgKTYZRl9WtcNpQPiQcipuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+HlGgAMhSqx5dRv2G1r0gXbYe4m4/IPOxUms8dGIXmHP/Li7mdS0jrJ+b8eAjiToe06m6nlPPNTC/AHB8deYIQ+6YsJmgKgrFEEZ5evgQP74JyOPPqx0EW9l+OWYMAnD5upLrcj914KSVTBTY0yyXGljYiiIs+uCHYPmvyPpic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huwqhcU9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huwqhcU9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22da3b26532so10928895ad.0
        for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 07:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745504254; x=1746109054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z+evxns/Bjoiul5QbaAUNVJI+dR1D6acIWhDeMpntY=;
        b=huwqhcU9bLxu6yIIJE+zLJCDFiSV4JpEc8l2AZtYXbW2vHw+hTsan9sK8FUUdE7akj
         mLeIKWeI6cQBCDbw44jgjaeG8NiTV4sHEnxNUAQsxPbkAU/5brJ8QoOnOqqZvecHbSBd
         OO1G1/SOxsl4960bQBb+JHpxqJ9piaCYQtBlLSH0E8oVuuPycuFZYhmU13XOYLP1jleR
         fh95ni3oT9kKFbzq/gqXaR/p+D0X6B9eZKmkVuIN7+pinSQFH05EP8hU0GlTOWJHoryD
         P7z1XgHj3xIFs7Amg+ttYl66SxZFoeW3rD+S8E/6xixnsWNQ6oAfwW5XrK4Hdu6IBXWA
         qOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504254; x=1746109054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0z+evxns/Bjoiul5QbaAUNVJI+dR1D6acIWhDeMpntY=;
        b=KtlpMhFH5pvxoflfJVJE4ft9fziPG9zmsFPi8z/8b6iuk5E1+Pc10fvSldIhUOko1W
         EHxhABiFBTWcmqkRcAOEFPNYIzWsCK2hL7IQ7oGlORBQ2ljnE/bsXL5Eytqp2mgUfL0C
         D0fBYRAkadnw9XD00x2YA4Q/0vcN11O9xkOgAfitjbzrKVgKtlF/IIoCuFyNPDszu7/1
         eJzcFYQqRP/z9fll45T77EOQgpG7WmRGPj0y8h4Mc5AcukeJvfKWawuOdWW9j2T6yGWb
         5GjK7xeZcvIEVGXN/p31kbW6abF+ZAyN844ExT9BaBYOSZChKBq38mv3oRPbTFoRDT0y
         KWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx2ipf5ou1FlCcrjGcxlVxeAk81DI7uymKKEhj7dh6aWRHuGRTPCWYUrD/VQjG6fiVXMlgpEI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTtvhi4Xgf7EdsAUEWqMG6n5RtmEarefaP1AU4Y0UBEgkBehac
	ZQOSKJolj3W6TFxVYfcqzbzh/m6oOaM/VET9MZX0h4KR48bnAoX/
X-Gm-Gg: ASbGncv/R/x6tZEp+SDalc+kZDU5LyVt3oaR5Zix29UNQsPl8W8wm+DVGt+0NfNRn6e
	B2hDI/yocjA8r0HKXGxBMkJgGzdlNtz1LxTgYjxBpgL9LUQGCus39UnnknvBhEbMFlek+0NRda/
	zF5S4e8Dm5FPgRJ8LSeBz2lm7zBInwk1FSxrcVOjqbxmxp8PyMBD0RoIBREQDrS4/k9un3flXux
	Mdy9VHMZ9y45ukYlBSidSkek5Bf2fxB9opc7OyGY/igHxOFuy/mlp0Q/Av1gCm1ULHiofxXA/nk
	KMJCNiXzbKNz8GbrtvYXcT+oqXShWXzLKQLKTgjZV4bX2xicLAGvt4GW
X-Google-Smtp-Source: AGHT+IF8usctblLAnINg4TnTnQrVnn39vt8hoeGJDJEx4okN1SFMxnOPPtCRy6Y/LdW4YicZvSuIUw==
X-Received: by 2002:a17:902:d2cb:b0:22c:2492:b96b with SMTP id d9443c01a7336-22db3bde36bmr39814175ad.15.1745504254192;
        Thu, 24 Apr 2025 07:17:34 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:a0e1:7d00:529e:8ad4:796c:105b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d74c93sm13760085ad.11.2025.04.24.07.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:17:33 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: pmladek@suse.com
Cc: Jason@zx2c4.com,
	gregkh@linuxfoundation.org,
	john.ogness@linutronix.de,
	linux-serial@vger.kernel.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	oliver.sang@intel.com,
	ryotkkr98@gmail.com
Subject: Re: [linux-next:master] [serial]  b63e6f60ea: BUG:soft_lockup-CPU##stuck_for#s![modprobe:#]
Date: Thu, 24 Apr 2025 14:17:28 +0000
Message-ID: <20250424141728.7949-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <aAn-PkxRAz34tTPR@pathway.suse.cz>
References: <aAn-PkxRAz34tTPR@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 24 Apr 2025 11:02:54 +0200, Petr Mladek wrote:
>On Thu 2025-04-24 17:11:01, Ryo Takakura wrote:
>> Hi Petr and John!
>> 
>> On Tue, 22 Apr 2025 14:15:01 +0200, Petr Mladek wrote:
>> >On Mon 2025-04-21 12:41:50, Ryo Takakura wrote:
>> >> Hi!
>> >> 
>> >> I would like to follow up the last email that I sent.
>> >> 
>> >> First, I'm sorry that I later realized that I should have tested
>> >> the rslib test as an inserted module, as how the robot does, by
>> >> choosing CONFIG_REED_SOLOMON_TEST=m.
>> >> Not as a boottime test by enabling CONFIG_REED_SOLOMON_TEST=y.
>> >> 
>> >> Running the rslib test as an inserted module without the John's series
>> >> was less prone to softlockup. Without the John's series, softlockup shows
>> >> up once in a test or not at all. With the John's series, softlockup can
>> >> be observed constanly over the test.
>> >
>> >> >>Thanks Ryo for looking into this! I think we need to have a technical
>> >> >>explanation/understanding of the problem so that it is clear how my
>> >> >>series triggers or exaggerates the issue.
>> >> 
>> >> As mentioned earlier, I'm sorry that I should have run the test as
>> >> inserted module... It seems the series does make the test more prone
>> >> to softlockups.
>> >
>> >IMHO, the main difference is that the patch "serial: 8250: Switch to
>> >nbcon console" removes touch_nmi_watchdog() from
>> >serial8250_console_write().
>> >
>> >The touch_nmi_watchdog() resets the softlockup watchdog. It might
>> >hide that the CPU did not schedule for a long time.
>> >
>> >The touch_nmi_watchdog() was there because the console_lock() owner,
>> >used by the legacy loop, was responsible for flushing all pending
>> >messages. And there might be many pending messages when new ones
>> >were added by other CPUs in parallel. And the legacy loop
>> >could not call cond_resched() when called from printk() because
>> >printk() might be called in atomic context.
>> 
>> I see. Without the John's series, the cond_resched() in the mention
>> code path should be called during the rslib test as it's not in atomic
>> context in addition to the touch_nmi_watchdog().
>
>Just to be sure. The right fix is to add cond_resched() to rslib test.
>The code should allow scheduling and do not block the CPU for too
>long.
>
>touch_nmi_watchdog() just hides the problem. It was used in printk()
>because there was no better solution.

Understood!

>> I used this kernel[1] which is for raspberry pi. Let me recheck
>> with some other machine with Linus' master and linux-next to see
>> if the behavior is raspberry pi specific.
>
>John explained why the emergency context helped. I think that we have
>a pretty good understating of what is going on there.
>
>I believe that the problem will be the same in all code streams.
>It might be enough to check one of them (Linus' tree or linux-next)
>just to be sure that the fix applies and it has not been already
>fixed.

Thanks for clarifying.
I'll make sure that the problem can also be observed on either of
Linus' tree or linux-next and they still needs the fix.

Sincerely,
Ryo Takakura

>Best Regards,
>Petr
