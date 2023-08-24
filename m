Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C309134A1
	for <oe-lkp@lists.linux.dev>; Thu, 24 Aug 2023 20:25:35 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5657add1073so219577a12.0
        for <oe-lkp@lists.linux.dev>; Thu, 24 Aug 2023 13:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692908735; x=1693513535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cFJmG532/HPrRYioCuTk24wDgNpYX0BgfAByTQWgk1M=;
        b=hcYfs51+SXXdiuzfra3zBaVWjYAKmLEEu4HyBnj77dLyAB+5NHqIw5vtGWJSUa4Wkq
         9tpVFHW/u9pi3bBXquub9ifJFGLeoM3kym4INXeUVKwXLQll1QeiG9tx+psfSO+BB4Wk
         +6xpzwVXtOvtWU+3f2a1wipUMGGDRQMOEz9YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692908735; x=1693513535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFJmG532/HPrRYioCuTk24wDgNpYX0BgfAByTQWgk1M=;
        b=QUQNFrrNxSzOGEICZeQrLYYhjT0zyyl0NHQutPGXIryo0z1nSHL4vqv6bWDXI7yZdZ
         1K7Lcb4ZGIyjv+Ew2acTTZJypH42ccVC43rf8H/rjCl+4RSQxXOF+S+cU8rGZ1SspAIq
         2cSdriD7JY7IRL57fW38hXkLw4m0Hu+3HiXNiag7d77cLUlWFWLQfzIMwqni5PeHimI4
         QYJuHu+qvn2/MOWRo9apvNUrVkgD64vlk8yyHpC+WTdLOVhH5EU7Cg8UjyOcTqUsqmmo
         n32JX7pahmQcT+bXP7lPugHU3kh+12uBcEZ7moU9mA1rFUhGvVO9tIFC7wbPAJbkttBd
         cqRQ==
X-Gm-Message-State: AOJu0Yxn5CtwH8Tv+2rfeNv8e9dzbpBPAGw6uZfz+PJscvN6jhbfFFVs
	DBj9QBz7LFMg0rNrAwl8IMntxw==
X-Google-Smtp-Source: AGHT+IFDXM7s9KQxsf1VNjwyTfPp9NokbBCnA0JlZH0mI8k2jO5MowzUQ/Rg4DxQnxD+bS+ULgkGrQ==
X-Received: by 2002:a05:6a20:158f:b0:137:c971:6a0c with SMTP id h15-20020a056a20158f00b00137c9716a0cmr20659159pzj.31.1692908734819;
        Thu, 24 Aug 2023 13:25:34 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j12-20020aa7800c000000b00653fe2d527esm141767pfi.32.2023.08.24.13.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 13:25:34 -0700 (PDT)
Date: Thu, 24 Aug 2023 13:25:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Yonghong Song <yhs@fb.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Song Liu <song@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [linus:master] [kallsyms]  8cc32a9bbf:
 Kernel_panic-not_syncing:stack-protector:Kernel_stack_is_corrupted_in:test_entry
Message-ID: <202308241323.ABBE0B09B@keescook>
References: <202308232200.1c932a90-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308232200.1c932a90-oliver.sang@intel.com>

I was able to reproduce this failure. Yonghong, any ideas what's going
on here? I'm still trying to figure out what part of the
kallsyms_selftest actually failed (there are about 4 places that all
lead to this error message).

-Kees

On Wed, Aug 23, 2023 at 10:48:58PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "Kernel_panic-not_syncing:stack-protector:Kernel_stack_is_corrupted_in:test_entry" on:
> 
> commit: 8cc32a9bbf2934d90762d9de0187adcb5ad46a11 ("kallsyms: strip LTO-only suffixes from promoted global functions")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linus/master f7757129e3dea336c407551c98f50057c22bb266]
> [test failed on linux-next/master 28c736b0e92e11bfe2b9997688213dc43cb22182]
> 
> in testcase: boot
> 
> compiler: clang-16
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202308232200.1c932a90-oliver.sang@intel.com
> 
> 
> 
> [   28.923687][    T1] systemd[1]: RTC configured in localtime, applying delta of 0 minutes to system time.
> [   28.926842][    T1] systemd[1]: Failed to find module 'autofs4'
> 
> Welcome to Debian GNU/Linux 11 (bullseye)!
> 
> [   30.135342][  T115] kallsyms_selftest: Test for 1153th symbol failed: (show_trace_log_lvl) addr=c1033b00
> [   30.135366][  T115] kallsyms_selftest: abort
> [   30.137440][  T115] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: test_entry+0x1419/0x1430
> [   30.138878][  T115] CPU: 0 PID: 115 Comm: kallsyms_test Tainted: G                T  6.5.0-rc1-00002-g8cc32a9bbf29 #1
> [   30.140321][  T115] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [   30.141688][  T115] Call Trace:
> [   30.142207][  T115]  panic+0xf4/0x31c
> [   30.142789][  T115]  __stack_chk_fail+0x10/0x10
> [   30.143470][  T115]  ? test_entry+0x1419/0x1430
> [   30.144141][  T115]  test_entry+0x1419/0x1430
> [   30.144802][  T115]  ? __die_body+0xb0/0xb0
> [   30.145432][  T115]  ? 0xc1000000
> [   30.145962][  T115]  ? __die_body+0xb0/0xb0
> [   30.146642][  T115]  kthread+0x203/0x220
> [   30.147262][  T115]  ? sprint_backtrace_build_id+0x20/0x20
> [   30.148032][  T115]  ? kthreadd+0x2f0/0x2f0
> [   30.148656][  T115]  ret_from_fork+0x19/0x24
> [   30.149412][  T115] Kernel Offset: disabled
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20230823/202308232200.1c932a90-oliver.sang@intel.com
> 
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
Kees Cook
