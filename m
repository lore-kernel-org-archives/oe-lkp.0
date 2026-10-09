Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F54F489FCD
	for <oe-lkp@lists.linux.dev>; Fri,  9 Oct 2026 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537421; cv=none; b=lDvmQOZwkpvpIeIe3tDxN5uUizfozhvDy1pjwe7yM2c2uC+Co7/rFgDa9RJyLZmNp7KUHqAvcBDA5bhZ6cuSj+XL9cjAPhv9L6hfQDQkZEJ5aWFrFOIlodWd55HdQm25pdNwa2ybzElWplptL5V8PWX+MTMfE8FYXR2MiMPTquw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537421; c=relaxed/simple;
	bh=hjUeeF84zGQeCguNxWT1DSh/V288K62/667n4VCMYNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGrzrFNgpegcY3ZziH4XDiSaH6fast7BuyrTtFN3ka8l9QZJeNOMExDSPu1vKwM2/Z3EU2Zpr9UbQk3v7khAIvopMjFrSS5SyiD9hDYJqUvUPw2j2iJsWaAv0pq4qE8+KcD3piWWlavzjDdZLpmdEUyO28QrtcWCxXtC+2dZNgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DWejspkR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DWejspkR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so53607885e9.3
        for <oe-lkp@lists.linux.dev>; Fri, 09 Oct 2026 02:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791537416; x=1792142216; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtSEU7OloYM/ik260iA76jMOjTaXd/5ywnlmhTJRsTM=;
        b=DWejspkRqnkh5xt9Ul9CxzA0cbFeKY3TbIR+bvLKkiWDpZJ3aiajhRFQRJSMEpJsaI
         QCJcAqy76vApMKYFodZZIIb/aaVmjfzSK50wkqdWfBTuEduBsClG7IuWTgzRub32200e
         5qeF0Vfya3TqMu1jgS/7uDiO/l3rVO7+r+UKjJ2mK5I5glTugNcypR9WlhSidHg+gtld
         kaWrFxbopJo4KAXlZ9+Y5t1dksrF4JzqHtFymDzWdnoyIFTe2n58nZ9+pPOg9SgkuZBn
         73f6wsVrYAYu2E/92zWKPduUd+lfnmqpDeSeyMCaCR1opYVsnPCcxWTdoPIUr7aKJOvK
         JRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791537416; x=1792142216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtSEU7OloYM/ik260iA76jMOjTaXd/5ywnlmhTJRsTM=;
        b=t7vRG2ua6iQlInRg60mOGSHpBR2Lo6By6EBZen4V1k03HySKOLBEZC9vJTw9dyMcO2
         Ye2UWvoukgKf6XjvSUgb4zccKX6SMDkQmOkA3xYz25TJFF+7gxKOGrfSlFUVQvBrRMn/
         sNJY6IxMmBwpQ8fLvGVF8Waey+U4nY6FzMdy5Yw3Kaj2VciBnJwcbKrwwQYe2raAjZw7
         tuM1/jsS5/uqYXVbslAVbiZb5Ky6PH2U2ByAe1+btBgu+/saO5TqAGsDMB6AhQ+o3HnT
         9YV/BgF0Iavstx0teIgT58CLaS/oHNTf26o+5E3kjFfHqSxnu7a4wqSDe2c+qgVk0Rul
         qhmg==
X-Forwarded-Encrypted: i=1; AKwUvBzXZTnwEwK5QIIW8c/+fYIuabJbNAKrEaVtmpfCthg+HxEpsQ/Ou+MNWy0JOP4XGcbH4h5J4bA=@lists.linux.dev
X-Gm-Message-State: AFuF++kmAWdGv+BJTuLOqpcys8WIoKyxkgCR7BZASfHU0sXVHRuzr+wi
	Ur7/J9/qQnPSFXAshhTXFgGFG+jhujpnyAefKXL/62wmtzY+vXbOqmfXHp6dMBPNx/0=
X-Gm-Gg: AYBFou2cC/vtsppfKJfWqr1ueP4BppKFlNuZh0+qqdLrn2oKbnKbd78UaNCEKejuzyP
	iElO27CCcivbwbIi2A4XJdSfbCunZFZb71q+Z+idpEstZ93ZLHb8HsKm2MKr2QWtHO5v2NS1kmx
	Jfh78D4O7aOzXXTLdjMeMRMTxHOEYKiu4Nmx7JMSDvJJo3WgpnqREmbi39HW1VHUOENVX++SSYz
	LLq741Jq9fhNSOUzQCaKsZ5VSJjSKpNUNHfpYpEEGsAcmiCPQLHEvrckIs9S9GG0EA+olY83frW
	p5UxyEnonN64HEHsTa+bFy9jQ+mgBIzfpyogi/prp5+qZMUYCXDo5QADj3AVE3myZoFpAnvmGLt
	VIx4NmU2FSg+mw7RoHtRnMF3i6qpjQsYLv7eTuXwWbC5CvBbJsnLfgro9JJWzo+Ssp2CxRRsjM+
	UqIPdJGW1csVc4mzp2r4j3nHHl246+KRg9EJDOT34FLr0FxoCLEJvqxGmbkrq4d0YIaI2AO6Wf8
	g==
X-Received: by 2002:a05:600c:a00f:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a18e4e24c7mr24231075e9.28.1791537415265;
        Fri, 09 Oct 2026 02:16:55 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea1021sm42237545e9.10.2026.10.09.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:16:54 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:16:51 +0200
From: Petr Mladek <pmladek@suse.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: bigeasy@linutronix.de, brauner@kernel.org, john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	lkp@intel.com, oe-lkp@lists.linux.dev, oleg@redhat.com,
	oliver.sang@intel.com, ptikhomirov@virtuozzo.com,
	rostedt@goodmis.org, senozhatsky@chromium.org
Subject: Re: [PATCH] nbcon/reboot: Flush nbcon consoles synchronously on
 reboot
Message-ID: <asixA20sG8QHH7hf@pathway.suse.cz>
References: <20261008150852.8286-1-pmladek@suse.com>
 <CD188453-7954-45B3-8501-FE9574D5FF1A@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CD188453-7954-45B3-8501-FE9574D5FF1A@mainlining.org>

On Thu 2026-10-08 16:19:03, Bradley Morgan wrote:
> On 8 October 2026 16:08:52 BST, Petr Mladek <pmladek@suse.com> wrote:
> >NBCON consoles emit messages in a dedicated kthreads when the system
> >is working properly. printk() tries to flush them synchronously in
> >explicitly marked emergency context and in panic().
> >
> >Another situation where printk() could not rely on kthreads are the
> >various
> >reboot and halt code paths. They can be detected by the `system_state`
> >variable.
> >
> >Let's default to NBCON_PRIO_EMERGENCY for the post-running states.
> >printk() will automatically try flushing the consoles synchronously.
> >Also do not rely on printk() and explicitly flush the consoles
> >after these states are set.
> >
> >Note that suspend code paths have already been handled, see
> >console_suspend_all() and console_suspend().
> >
> >Reported-by: kernel test robot <lkp@intel.com>
> >Closes: https://lore.kernel.org/all/202608061008.48a1e76e-lkp@intel.com/
> >Suggested-by: John Ogness <john.ogness@linutronix.de>
> 
> Hi, this looks good to me reboot.c ended! :)
> 
> Reviewed-by: Bradley Morgan <brads@mainlining.org>

Honestly, I am more or less ignoring Reviewed-by: Bradley Morgan.
I can't recall any problem reported by this person. And the excited,
AI-generated, acks do not add much value.

> >Signed-off-by: Petr Mladek <pmladek@suse.com>
> >---
> >Hi,
> >
> >ah, this somehow fallen through cracks.
> >I am sending it as a proper patch finally.
> >
> >I am sorry I have been somehow too busy before
> >the Plumbers conference.
> 
> That's ok :) I'm too unlucky as to not go to any conferences :c

I am not sure if there will be any conferences when robots will
be ready to attend them.

Best Regards,
Petr
