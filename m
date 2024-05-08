Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEE815AE0
	for <oe-lkp@lists.linux.dev>; Wed,  8 May 2024 04:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715140916; cv=none; b=q3CjRnNh5qT4NaiM9/aZ3Nx6uBNVSfnspu1xqKH8Y+AuRFv7CDHUhuI3H/ACa4qhGx80ZiKm/fUySKWZiKDi8wr5wJPnd7vd1gM18jyXAP5muPLxiU3hyU1HSRs1CIRMN6G21H+SQLtODUGQOYsHGc1en1XhWjvIw1PS1/aEfQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715140916; c=relaxed/simple;
	bh=5mOWhXmiBjBRWjxjdltSm8KebQmdYitBGVSNIEpyoyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QeLZC9wJSuCKAt3scmsfelbj2vc3sGEbHbXgM/8e0XcyV/L0Qox8xTXv0frqoSIj/hFSYY95ZwFBsBRX5gMU3nOTjm5tYa6T5YLxJ9THjVboZLmx+mMyiyaRbmGDDPPVIvT7gHDvcjB1GvSdz96sAQmLtyQ7nFpAnZ3348SkxEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ekEpg8ec; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ekEpg8ec"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f44d2b3130so3375608b3a.2
        for <oe-lkp@lists.linux.dev>; Tue, 07 May 2024 21:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715140914; x=1715745714; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4csb3+XH148pfuSrBrtrAfaSPWzUvqCK3Alojbb0bGI=;
        b=ekEpg8ecjVx3RvggaJOJHEfZjCaia5NL/mgC2IxEG/RS5hgOn8vSeS2bmqtzkNF62J
         Lqt4MoriNqzG/A2Lk/vNovludypDcLvoA7atY1CA8Xhs8HWOf4RI3nhPOn+AhveD32N7
         5BIryCuKxzJosEwHVaylPUDGAk43kHd1tGQss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715140914; x=1715745714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4csb3+XH148pfuSrBrtrAfaSPWzUvqCK3Alojbb0bGI=;
        b=cnTkUATp0xwX+BqIwKH7gKuvGzEGeLD9GLo7Jte7qqg5CNccpnpVoNeqweTauzDTM1
         exOfG1/5AFlGQx6MB/Sp0oOkRLTO3vpn42cua3jzWo0I8PVjFgoWKsSeYRXfLA/kjr8G
         cTNK+vYBvZHIACkxiQIjMzaCpngP2/4Bb9GRglKv4M1ZTcj4ZtAL7SkanFjo+T5xB5Kr
         UH6m/iHX6XdMM3hcnDeQ1qKRh30UN7VxgBN0cXDol95P0W/88VOkhozBJ8wl4uq+H7Bs
         BxX1O2qRtEuSI2zbyOZZkhWmIQXi0CpCjp54AM0cpTPqsmCREUHPz3HrDq3DpZKMxizU
         /hdA==
X-Forwarded-Encrypted: i=1; AJvYcCVltPWQbk4NUosCpOPivHi8Qf/mE+UYnyk1jldz2AfS7mVBfwUaOvW7pGToXfO4JXtmIaw7UXKggcJ8+0tYzNfsDVWr0o19
X-Gm-Message-State: AOJu0Yyk8nwvjJ/u8T87SJOSGkdPVw/UTzMzy+V5cqX2lOXXz0poCjON
	0Rm1h27uXIpQrQQywUvI7jdF3in4RRuh2Utn8MVo9sqbfoVwNmAwOzfTtCKaAg==
X-Google-Smtp-Source: AGHT+IExX2CuiWaMU8OnHwkAtO/XEH0IPXuUy2BsRsWBn8GMMwKGdsVVHZtF7ekbFkqV2Jo8a9w4Nw==
X-Received: by 2002:a05:6a21:3a83:b0:1af:997d:1788 with SMTP id adf61e73a8af0-1afc8dbe134mr1816377637.44.1715140914101;
        Tue, 07 May 2024 21:01:54 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id li6-20020a170903294600b001e5cadbdf8csm10791545plb.37.2024.05.07.21.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 21:01:53 -0700 (PDT)
Date: Tue, 7 May 2024 21:01:52 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
	Bill Wendling <morbo@google.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [linux-next:master] [selftests]  35c9dcde4e:
 kernel-selftests.exec.load_address_16777216.fail
Message-ID: <202405072057.1DD78A3EBB@keescook>
References: <202405081002.fc4eafcb-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405081002.fc4eafcb-oliver.sang@intel.com>

Hi Andrew,

Can you please drop commit 35c9dcde4ecb ("selftests: exec: make
binaries position independent")? It looks like it's broken under certain
conditions, and what's more, it seems it's been subtly half-broken since
commit 4d1cd3b2c5c1 ("tools/testing/selftests/exec: fix link error")
too. (Using -static changed the nature of the test since now it doesn't
have an INTERP program header.)

I'll be working to fix it up.

Thanks!

-Kees

On Wed, May 08, 2024 at 11:22:02AM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "kernel-selftests.exec.load_address_16777216.fail" on:
> 
> commit: 35c9dcde4ecb82ba4a46219a345c36054fd15454 ("selftests: exec: make binaries position independent")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 9221b2819b8a4196eecf5476d66201be60fbcf29]
> 
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-c7864053-1_20240419
> with following parameters:
> 
> 	group: group-01
> 
> 
> 
> compiler: gcc-13
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 32G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> we also found kernel-selftests.exec.load_address_2097152.fail
> which always pass on parent.
> 
> 200a289b342bae6c 35c9dcde4ecb82ba4a46219a345
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6          100%           6:6     kernel-selftests.exec.load_address_16777216.fail
>            :6          100%           6:6     kernel-selftests.exec.load_address_2097152.fail
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202405081002.fc4eafcb-oliver.sang@intel.com
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240508/202405081002.fc4eafcb-oliver.sang@intel.com
> 
> 
> # timeout set to 300
> # selftests: exec: load_address_2097152
> # TAP version 13
> # 1..1
> # Bail out! FAILED: alignment = 2097152, load_address = 140281068855296
> # # Planned tests != run tests (1 != 0)
> # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> not ok 3 selftests: exec: load_address_2097152 # exit=1
> # timeout set to 300
> # selftests: exec: load_address_16777216
> # TAP version 13
> # 1..1
> # Bail out! FAILED: alignment = 16777216, load_address = 139671213199360
> # # Planned tests != run tests (1 != 0)
> # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> not ok 4 selftests: exec: load_address_16777216 # exit=1
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 



-- 
Kees Cook
