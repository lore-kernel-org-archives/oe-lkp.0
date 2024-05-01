Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048941649DE
	for <oe-lkp@lists.linux.dev>; Wed,  1 May 2024 20:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714595580; cv=none; b=ZM172JgkWU6+Acgv0GK9hpU/wgCMBhs686kULKsFDlVLoGg/vfRzwh3mnFZLCWkQXEv1DFpaJgFnISPu2L3wr592qNZFXkjRtRYT0zpgo9bHBYIlw0hE8j02g8iAkfKpM4AHS8Z1jjHFd+xxlNao7lsr7o6S1JJ4f9MFCdji+Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714595580; c=relaxed/simple;
	bh=7u09dhiLhMiZkNIQVDdsM2vMvd2FkyZDIN6bSmYFGJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1cpm7K8Y1VFDu8cby9LSWlBRbqJap+5yDCmC38ThJhJR3blKQUEZx0+ER/OgWI/bl4FTEH78QpfaThJFatxGH9RflT6i4PGW1wexzQLIdjYQb41cDb2vFfVaCyW31GXTWc+mXc3Z6JEAoSosVayF3C197xBc7wWy5tbz/BlM48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k4Nk772s; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k4Nk772s"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f26588dd5eso6101238b3a.0
        for <oe-lkp@lists.linux.dev>; Wed, 01 May 2024 13:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714595578; x=1715200378; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Iqz8S2QdA0EJsKIz/4lOvCmgl9u2Epz/damWnWsK8Mg=;
        b=k4Nk772sAwMo3B6Vl02tC4uTpuHdW8KwfixdJSPxSukYYgRmiu1VMC0rn6uawzG1Iw
         wagkq+aJKPkDN7/amjTR+0bIePIvekYlPjgHWRM5SC65cfYx6nI8tJ6pDWiczQeTeCgL
         ISLD+LM6FZRV4lDcw4FceJCI+BPoaZ60DL1t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714595578; x=1715200378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iqz8S2QdA0EJsKIz/4lOvCmgl9u2Epz/damWnWsK8Mg=;
        b=GVIj9xDrVJ74KnGQ6OwfTM1FrVM/O5Rx1Sc5zDnLgteEklomJww/xCPYpGAh6FyS/+
         ut5Ktt4r5SXizdsYMWK/VRW304u4N5G/HedOyflWV5sxd2OhI6pMIo6xwP6r0NJFgl6j
         y6i8ZMBwYsjdwGu5W5YNDgUlaIRON8Yj0WcyTJERTR9K40Ou/Q9n9A+YR9NLehOlu1AP
         ZxiXGLLuSwugwwRBrp2qhMTqA4+k3975zQsoPjJowVRhZHy8ZNUCq10lbNXdF1xgUDOU
         st+uo4FCMOh9N/Hx6itZl29P1CIsqPOolYSUIVJNr9vuPyJc09d7Zk+tfnrx78RgChmy
         ca3w==
X-Forwarded-Encrypted: i=1; AJvYcCW5KG2+vLTs++RuCu8FwqOLWDR5iGuD8ErlvfRmbP1/LjlR9meqRwfrcQuRrbwMo7qfE9etS5rjJ+bim7wga/pJcOlTh7KA
X-Gm-Message-State: AOJu0Yy6RgF28NWRU7zMfZT2Cs3X37dpVG+YC1VR0FTO/bVqJKMC1akj
	p69xeMR6ATWoB1j33XiThmfxdNATWo1Nw9rLOxxYJPcKz2IqY7etLPETE/JCRQ==
X-Google-Smtp-Source: AGHT+IGqPLrt1qdSnEoH66ufcC64x4kO88+Homj7/Uv9EXsQgLfCXVYl8bDOr9JM5JLUL69tbhsw2A==
X-Received: by 2002:a05:6a20:7fa4:b0:1a7:a3ee:5e4a with SMTP id d36-20020a056a207fa400b001a7a3ee5e4amr3685712pzj.33.1714595578310;
        Wed, 01 May 2024 13:32:58 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id gq41-20020a056a003be900b006f0da46c019sm20801345pfb.219.2024.05.01.13.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 13:32:57 -0700 (PDT)
Date: Wed, 1 May 2024 13:32:57 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Edward Liaw <edliaw@google.com>, oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
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
Subject: Re: [linus:master] [selftests/harness]  8092162335:
 kernel-selftests.sgx.make.fail
Message-ID: <202405011330.85D66871E@keescook>
References: <202404301040.3bea5782-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202404301040.3bea5782-oliver.sang@intel.com>

On Tue, Apr 30, 2024 at 11:02:36AM +0800, kernel test robot wrote:
> version: kernel-selftests-x86_64-c7864053-1_20240419
> [...]
> compiler: gcc-13
> 2024-04-29 15:02:59 make -j16 -C sgx
> [...]
> gcc -Wall -Werror -static-pie -nostdlib -ffreestanding -fPIE -fno-stack-protector -mrdrnd -I/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-8092162335554c8ef5e7f50eff68aa9cfbdbf865/tools/testing/selftests/../../../tools/include test_encl.c test_encl_bootstrap.S -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-8092162335554c8ef5e7f50eff68aa9cfbdbf865/tools/testing/selftests/sgx/test_encl.elf -Wl,-T,test_encl.lds,--build-id=none
> /usr/bin/ld: warning: /tmp/lkp/cct4g3SV.o: missing .note.GNU-stack section implies executable stack
> /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> In file included from main.c:21:
> ../kselftest_harness.h: In function ‘__run_test’:
> ../kselftest_harness.h:1166:13: error: implicit declaration of function ‘asprintf’; did you mean ‘vsprintf’? [-Werror=implicit-function-declaration]
>  1166 |         if (asprintf(&test_name, "%s%s%s.%s", f->name,
>       |             ^~~~~~~~
>       |             vsprintf
> cc1: all warnings being treated as errors

What environment is this being built in? "asprintf" should be available
via stdio.h, and "kselftest_harness.h" includes that (and _GNU_SOURCE).

-- 
Kees Cook
