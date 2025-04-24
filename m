Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA4520FA81
	for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745485380; cv=none; b=c/7pnDZvlHpGo4xZblzeDZWtQcKZY5aIb0jWK0m5I/D9pc1C2MmASq5gh7XhYEWAI9z817NLXSKGfqFZlNp58e7zgPp1m7gOfgNjNkE6lykbSxy7eJcTbT3Ew7goWLU75ufUzYoWSwiGq/FdeHdIKE+6rOk4G9KAhVjd0x0Me0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745485380; c=relaxed/simple;
	bh=w54GuZQEv1bG1cyiJvNDE0F/k24RtaQcjLahg53aQCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnNZ66JhGffO6/XEqAEVEHaBjiCDA5aQrDo/ORR3XrAEAPHqHvZdjR5OggdszvicXHcm+td2wqxOVNJiA1A3uO+eP07HbuCugtOfJqdiPixVq95MPwnYzhcV0utJZy14qTSzYcbcENzOCEX4gvbqtODtJCtE5rlzQqnChnUJg6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FRfWUyoZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FRfWUyoZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso430180f8f.2
        for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745485377; x=1746090177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ6P1Y14p2jfp2sUFZ/eBTnX2KLVjb5n8pxkhU3F8C0=;
        b=FRfWUyoZSZbcPMdoP+p9DiQjRR4mpQobeUrzXc8vuJ5b53OumFEFf2AhRFDJ9nBZ+9
         f0mYsj7l6ZHAGVu/CZvLd8dOpCnMQMsSllsx/s9yT+juR5WmQDGw9kILjeZNC3Ik13DK
         E8UQJKJP+8vEf/kImiKF12pxHRr/dhb5VBmb6Agi+2Myg2nETOxfLpKvNWjqOIiYiBO0
         P4CfnS7NGC82VCF7zv59mnpaSdISB/s6brCzdg7OhN/3Cp5Rx0GSkWvlJREH6dwoX3YP
         3GIeUJXQK92ctlne8euqRfBjLsKsi/FXrHZpTn+kmKWswvf9qq6w/A0XvZiAhBpjMfyf
         VOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745485377; x=1746090177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQ6P1Y14p2jfp2sUFZ/eBTnX2KLVjb5n8pxkhU3F8C0=;
        b=UChVMuySXSMPcZhVdt1V2m/4xRjMjIMCa+n4Sjr+H9v2T89lpv+gKkx5K4NCvLoFCN
         FvTFYEmve+N4Z2MkyLabDHhTUpNeHOif9+5uw3gLC5WLBLPEIGPVpGvcyaRp+ZbcEGhC
         mrVNoZL+mWnkywpFlmcdOTMTsRXEbrQXvoWrCwxtGY6msJ3HNsX4hDztsR+IcLnffb7f
         QLx8QNtDUC/Z2JjZm4oiRCx2tyNxLgWYtZROi5a18x1CR2gTgQpFP7kcH2V38THqaLng
         /GhB4iIN6hOgmhCzAtaGnnjJewdwd/9UJcewYhBpvtmWOdJ8AK6jZdkLKAF6/Zq7eb4A
         l7qA==
X-Forwarded-Encrypted: i=1; AJvYcCXxAcP0qzaCw3ACg3vbEQ5uAR76AIwKzywHFELkwDz3qLfn+HEGyBt+GmjWUtWPB2dENxcOfM8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlNWWpUcbR05MUSZBI3up0jWNLBVzn4eL6HdHJXfnQTEU42znC
	15/Xf5koBFP0QmFhlsFf8mMAO+jDzfa95waf/EFnKAKNgfvRQ7WK2lQks2tDOD4=
X-Gm-Gg: ASbGncsDfRGewhKJMd7qgDfSKzLk1bizkMtOjgSOkosn++Xmqz6f1AGcVTAbB3hE+WA
	IB4ZVzaqFiCSml996N7JbwkJhWXKlqE0kidSWL0pJKyC+hi6cQbPIHpcPM+5gZqsELyitHf2PaD
	bZm9XPNidkof90kmnnj6QJ94N3rmyCXJppFkDwHmC/sC9o4xjMwifYba6tI8brWFS2FmTlAHk+r
	Epg4FuYJzpyS+CdPwQocVTn/4n+8fQYjcsJiOIPxdUXRfiPIlu9sJbgTTQIwsHmlw9pagEGbWO9
	uTEnFSJSPvKL+plpQ4havBa0Fjfhpi+AIWP+p2UA2PA=
X-Google-Smtp-Source: AGHT+IE5NAuY4qR5YiFVNQhXPQVS5TC7fMz6BpBBJgWqjn21tuMPOH9u/dnlWEQCIWrzI/+4huk7RA==
X-Received: by 2002:a05:6000:2582:b0:39c:1f10:ba54 with SMTP id ffacd0b85a97d-3a06cf6c1b1mr1457736f8f.35.1745485376883;
        Thu, 24 Apr 2025 02:02:56 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54f162sm1390896f8f.99.2025.04.24.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:02:56 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:02:54 +0200
From: Petr Mladek <pmladek@suse.com>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: john.ogness@linutronix.de, Jason@zx2c4.com, gregkh@linuxfoundation.org,
	linux-serial@vger.kernel.org, lkp@intel.com, oe-lkp@lists.linux.dev,
	oliver.sang@intel.com
Subject: Re: [linux-next:master] [serial]  b63e6f60ea:
 BUG:soft_lockup-CPU##stuck_for#s![modprobe:#]
Message-ID: <aAn-PkxRAz34tTPR@pathway.suse.cz>
References: <aAeIRZH_VD0mai0V@pathway.suse.cz>
 <20250424081101.110914-1-ryotkkr98@gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424081101.110914-1-ryotkkr98@gmail.com>

On Thu 2025-04-24 17:11:01, Ryo Takakura wrote:
> Hi Petr and John!
> 
> On Tue, 22 Apr 2025 14:15:01 +0200, Petr Mladek wrote:
> >On Mon 2025-04-21 12:41:50, Ryo Takakura wrote:
> >> Hi!
> >> 
> >> I would like to follow up the last email that I sent.
> >> 
> >> First, I'm sorry that I later realized that I should have tested
> >> the rslib test as an inserted module, as how the robot does, by
> >> choosing CONFIG_REED_SOLOMON_TEST=m.
> >> Not as a boottime test by enabling CONFIG_REED_SOLOMON_TEST=y.
> >> 
> >> Running the rslib test as an inserted module without the John's series
> >> was less prone to softlockup. Without the John's series, softlockup shows
> >> up once in a test or not at all. With the John's series, softlockup can
> >> be observed constanly over the test.
> >
> >> >>Thanks Ryo for looking into this! I think we need to have a technical
> >> >>explanation/understanding of the problem so that it is clear how my
> >> >>series triggers or exaggerates the issue.
> >> 
> >> As mentioned earlier, I'm sorry that I should have run the test as
> >> inserted module... It seems the series does make the test more prone
> >> to softlockups.
> >
> >IMHO, the main difference is that the patch "serial: 8250: Switch to
> >nbcon console" removes touch_nmi_watchdog() from
> >serial8250_console_write().
> >
> >The touch_nmi_watchdog() resets the softlockup watchdog. It might
> >hide that the CPU did not schedule for a long time.
> >
> >The touch_nmi_watchdog() was there because the console_lock() owner,
> >used by the legacy loop, was responsible for flushing all pending
> >messages. And there might be many pending messages when new ones
> >were added by other CPUs in parallel. And the legacy loop
> >could not call cond_resched() when called from printk() because
> >printk() might be called in atomic context.
> 
> I see. Without the John's series, the cond_resched() in the mention
> code path should be called during the rslib test as it's not in atomic
> context in addition to the touch_nmi_watchdog().

Just to be sure. The right fix is to add cond_resched() to rslib test.
The code should allow scheduling and do not block the CPU for too
long.

touch_nmi_watchdog() just hides the problem. It was used in printk()
because there was no better solution.

> I used this kernel[1] which is for raspberry pi. Let me recheck
> with some other machine with Linus' master and linux-next to see
> if the behavior is raspberry pi specific.

John explained why the emergency context helped. I think that we have
a pretty good understating of what is going on there.

I believe that the problem will be the same in all code streams.
It might be enough to check one of them (Linus' tree or linux-next)
just to be sure that the fix applies and it has not been already
fixed.

Best Regards,
Petr
