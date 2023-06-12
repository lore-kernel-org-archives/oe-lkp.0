Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3B11F189
	for <oe-lkp@lists.linux.dev>; Mon, 12 Jun 2023 17:42:09 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-25695bb6461so2614937a91.1
        for <oe-lkp@lists.linux.dev>; Mon, 12 Jun 2023 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686591728; x=1689183728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/jEqixu5EgSmfAcdSh1PYvew2E/XKFx7tx/2WzoNUo=;
        b=Gkp/FjG/xSSGmMWiGzOzvfx8E+01kgc9R74OpFhtf+WCR0xt+h1imxO27iibcBFEdg
         eJdRwXbZFVBUyV/hSkRRtM/zpxACD6UfTVDFOR1g2YLF01cRDFPtgQIHt/ybEEKkTZoT
         SDAu148cudwjrCT6f7vlVr3Kr/4ibdO7bJzgCU9LNA33CJ4S4w8yVnI7C6NHU4F4DhgQ
         WngMaJXUFDJwowDQAKad1I8cXVQK93Ru/q+c68rvtZFm6RANiDfr8RTxFImsGupr91fU
         h9NT1LChKCF5TLuwU2W1pYb5Knus0gliWPpPHZqWt2RaFfWfHnh5fVXaH6e83IRv3kMz
         NZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686591728; x=1689183728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/jEqixu5EgSmfAcdSh1PYvew2E/XKFx7tx/2WzoNUo=;
        b=kkMFZ3vQv+pfjThAAHFMTXfd4H+qpx3BxijdEF6voOvlRysmXgJAftAgvUQmcL6DG7
         IHZQyPysoVQjsUkoYphv/e38KWChPQ+UYoidTh6AlfNgy1+2W3Z5Xtm13XOrzSAxsiON
         gPVGk+xFlqCqNNZh95Q43/zPnGLenC+NgBnriaEEfLPGO56SYzRMOuAX7dC1MF3FBvbD
         So9Op+iVJthe9gy8jBUMFdQ2FhZi6zHwNVQG0WURedujWSj+rYHDrZNnaKctqQ509B+4
         o0nc6LOB8Qd7HQurWnZqIApGzaFNQ5DKgdxDZHcdtWg2kZS3opkqogBjnrQIBFy8f+k7
         5Ybg==
X-Gm-Message-State: AC+VfDy4lrU1P+4fnUaR3x9asTOBP67V0aa3KbpitAtgrmQVAZzipsQv
	oSFD4hBZe0lrzo+pJTiFDYd+bOL1hybMIg==
X-Google-Smtp-Source: ACHHUZ61spadDNIsHBcM/RTeTBUdyaH5lJckb6pVCK0NpfjRH0peC2kBZ5K0yycfBUU5riq0ZRK/Eg==
X-Received: by 2002:a17:90b:314c:b0:25b:83ca:2b75 with SMTP id ip12-20020a17090b314c00b0025b83ca2b75mr13034779pjb.3.1686591728306;
        Mon, 12 Jun 2023 10:42:08 -0700 (PDT)
Received: from localhost (dhcp-72-235-13-41.hawaiiantel.net. [72.235.13.41])
        by smtp.gmail.com with ESMTPSA id c15-20020a17090abf0f00b0025645d118adsm7792149pjs.14.2023.06.12.10.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 10:42:07 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 12 Jun 2023 07:42:11 -1000
From: Tejun Heo <tj@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [tj-wq:affinity-scopes-dbg-invalid-cpu] [workqueue] e3485721f9:
 WARNING:at_kernel/workqueue.c:#workqueue_online_cpu
Message-ID: <ZIdY8-aOIR3lQI3M@slm.duckdns.org>
References: <202306120920.a932842-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306120920.a932842-oliver.sang@intel.com>

On Mon, Jun 12, 2023 at 10:04:02AM +0800, kernel test robot wrote:
> [    3.388228][   T21] ------------[ cut here ]------------
> [ 3.394990][ T21] WARNING: CPU: 1 PID: 21 at kernel/workqueue.c:5393 workqueue_online_cpu (kernel/workqueue.c:5393 kernel/workqueue.c:5481) 
...
> [ 3.584746][ T21] ? workqueue_prepare_cpu (kernel/workqueue.c:5470) 
> [ 3.591752][ T21] ? local_clock (kernel/sched/clock.c:270 kernel/sched/clock.c:307) 
> [ 3.596749][ T21] cpuhp_invoke_callback (arch/x86/include/asm/jump_label.h:27 include/linux/jump_label.h:207 include/trace/events/cpuhp.h:65 kernel/cpu.c:193) 
> [ 3.603751][ T21] ? try_to_wake_up (include/linux/sched.h:2254 kernel/sched/core.c:4312) 
> [ 3.610751][ T21] cpuhp_thread_fun (kernel/cpu.c:815) 

This is set_cpus_allowed_ptr() failing on kworkers when workqueue tries to
put back the per-cpu kworkers on the onlining CPU, which is rather
unexpected. Let me include the error code in the warning message so that we
can understand why it fails the next time.

Thanks.

-- 
tejun
