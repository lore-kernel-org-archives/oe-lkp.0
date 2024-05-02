Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CDF17BA0
	for <oe-lkp@lists.linux.dev>; Thu,  2 May 2024 22:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714689602; cv=none; b=ptdVawRF3nxPRtx6JT6s9FRyO7dt/BtH6dIfuphRQC277dCw8Y8YQ8YwO/edwjLFoYqV1kuv0maG4BQTP/IgP0wWWx5KmoMSCofJseswN44UkxEW/jl8jIUohldz3Jze2DF3VSrVs7U0qekWfMsRte9C8WLPwnO1FvhnZbYt3Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714689602; c=relaxed/simple;
	bh=ta50FdtwBu0y4pHKcn/Qfi03YFBFeN2nzNoSc2md4rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TV9dxFW3+pcnnrKrraMKW8z4UtZofdyuysqe7un8+sjXd7A/Yu99Z1a2+TJ3qrTrIfWMvxq36rghEwA10I8ii4SdTwIojLWEG4Rj5Mfn3DMFFyPnSfb4hk+9iaIswKDeNMQby5JKCvEvESVTkhOFZVBH61Y7KREDyFv+mlhTArw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XJVhNaE4; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XJVhNaE4"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ed01c63657so8166458b3a.2
        for <oe-lkp@lists.linux.dev>; Thu, 02 May 2024 15:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714689600; x=1715294400; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XFKejRkpdUqALs7RRbss3x8E7ytYFe91um4evBhxt90=;
        b=XJVhNaE4CENLGwLlFxw4hK0BYnZ/E0qIwccIlYvyu3qG6Ajd0k1lGHWzLGgBZNw2M9
         bc1FUscvFC3MtG/Ry21jUkqNNc4NKtjJT2qN9KmIaTzovCHeByR+pgI7vAHYbO5cRcFX
         e3q0s/W2IV524XwjA2GNKkUlbr7d9u7s0YWDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714689600; x=1715294400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFKejRkpdUqALs7RRbss3x8E7ytYFe91um4evBhxt90=;
        b=uVR6NT4kglVks/gz+vHM54Sh0TViRYok72vumje7qMSy2Y81U98uzQn13lLpBGGPwQ
         g6bwLWxt/YbMdC4FT56QevB2mASWa8cYBQX5ypVZv4Cb0RW2rIqUbhJNCWau5aHHq5gw
         i5g0HbcvkB/K3h9HnsJSB9SxMFkg4MIMTbS+XmlUU/gvdV1t4h0eBMsBcdD64+Or7dkt
         hZsVe3d7kxIvbLr5W7fr2H0pY4oHAxjpL6eYj1va60WxvXcDEbLY1EmcLLOCtj2QsHWz
         f0DR3sptsoe0RQKqFKD6xcLFomDza2ZJg10qXfcgrxarTEZY+HERT8ncy0JJfAi4M5Xu
         bsWw==
X-Forwarded-Encrypted: i=1; AJvYcCViM7h/koGlrNXafxHbUvBPuFvKQdUd1fsNbrsYBr8gb9bkPQfSgNmLaPUM2GaP/rkJka7JbVwYviqZ9iJp05hJQC2/w7Zw
X-Gm-Message-State: AOJu0Yw8ixkmKqXXGqJiXgvLNYzuhvP+7EVIfIBE2Ff3EEb29d4eDub5
	y8a28xmtpaGKzG73WmRvIzrN26I+B2bqfLD8+/QG5S6zvtoTOniQbyWQQ4O2oQ==
X-Google-Smtp-Source: AGHT+IHZDYwJNE5fvscmVtdk5iGObl1CECGz4gO/Q2ayHOFmZuu6/FcbgJ5RUF+ig7m6xnqqjSb0qA==
X-Received: by 2002:a05:6a21:b10:b0:1ad:6e6:b4c7 with SMTP id lr16-20020a056a210b1000b001ad06e6b4c7mr898849pzb.46.1714689600376;
        Thu, 02 May 2024 15:40:00 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w11-20020aa7858b000000b006efd89cea71sm1784753pfn.84.2024.05.02.15.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 15:39:59 -0700 (PDT)
Date: Thu, 2 May 2024 15:39:59 -0700
From: Kees Cook <keescook@chromium.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: kernel test robot <oliver.sang@intel.com>,
	Edward Liaw <edliaw@google.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Bill Wendling <morbo@google.com>,
	David Hildenbrand <david@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Xu <peterx@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Will Drewry <wad@chromium.org>, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [linus:master] [selftests/harness] 8092162335:
 kernel-selftests.sgx.make.fail
Message-ID: <202405021539.F08251ED5C@keescook>
References: <202404301040.3bea5782-oliver.sang@intel.com>
 <202405011330.85D66871E@keescook>
 <c9ad463f-cc67-44eb-bf94-449144e3078b@collabora.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9ad463f-cc67-44eb-bf94-449144e3078b@collabora.com>

On Thu, May 02, 2024 at 11:33:17AM +0500, Muhammad Usama Anjum wrote:
> On 5/2/24 1:32 AM, Kees Cook wrote:
> > On Tue, Apr 30, 2024 at 11:02:36AM +0800, kernel test robot wrote:
> >> version: kernel-selftests-x86_64-c7864053-1_20240419
> >> [...]
> >> compiler: gcc-13
> >> 2024-04-29 15:02:59 make -j16 -C sgx
> >> [...]
> >> gcc -Wall -Werror -static-pie -nostdlib -ffreestanding -fPIE -fno-stack-protector -mrdrnd -I/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-8092162335554c8ef5e7f50eff68aa9cfbdbf865/tools/testing/selftests/../../../tools/include test_encl.c test_encl_bootstrap.S -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-8092162335554c8ef5e7f50eff68aa9cfbdbf865/tools/testing/selftests/sgx/test_encl.elf -Wl,-T,test_encl.lds,--build-id=none
> >> /usr/bin/ld: warning: /tmp/lkp/cct4g3SV.o: missing .note.GNU-stack section implies executable stack
> >> /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> >> In file included from main.c:21:
> >> ../kselftest_harness.h: In function ‘__run_test’:
> >> ../kselftest_harness.h:1166:13: error: implicit declaration of function ‘asprintf’; did you mean ‘vsprintf’? [-Werror=implicit-function-declaration]
> >>  1166 |         if (asprintf(&test_name, "%s%s%s.%s", f->name,
> >>       |             ^~~~~~~~
> >>       |             vsprintf
> >> cc1: all warnings being treated as errors
> > 
> > What environment is this being built in? "asprintf" should be available
> > via stdio.h, and "kselftest_harness.h" includes that (and _GNU_SOURCE).
> Sometimes the order of include is as following:
> 
> #inlucde <stdio.h>
> #define _GNU_SOURCE
> #inlucde <stdio.h>

Oh, ew. Yeah, I see what you mean.

> The _GNU_SOURCE wasn't defined the first time stdio.h was included hence
> the definition of asprintf isn't present. The second inclusion of stdio.h
> when _GNU_SOURCE is defined is ignored as it was already included.
> 
> This is being fixed in following series:
> https://lore.kernel.org/all/20240430235057.1351993-1-edliaw@google.com

I'll comment there. Thanks!

-- 
Kees Cook
