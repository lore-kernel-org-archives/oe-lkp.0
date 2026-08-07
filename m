Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99FA379989
	for <oe-lkp@lists.linux.dev>; Fri,  7 Aug 2026 18:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127750; cv=none; b=VbRnkTAr0I38XhSAxjufwq/+b3rHSU/i/9OYrHjdpeMRqI3iqxo2qMJ2RTiLTycHe1YpS2jiudQwIRerrSpQ+PYFCf12qeNrK8BRnqsSGN3jnG50XsHqxpY5nI5C/0IeCDEc3GfDZXK/DLVN0t0jgg9a27Cq4ORd0s0ey/84fCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127750; c=relaxed/simple;
	bh=6HjUsJVBCV1zSooKnz7AQ1gIW9Lpwv5qLqnebJ1Iq2c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cLG90m+FNLYw6PlJBXz3wGdaBztm3SrYrpKOsFH6SxYG2nibrkqCdzkdH7t2w3Yxhsf4MyC6oZeph/4eF9da7R93p5zgPO3iDPpwtA5jC0+hFbnyDdDax6gNyHumyz+BU9u7+P52FFngKAZueoBxCYhlk+gii4Hm5h3H1mX59vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kvFPauRw; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kvFPauRw"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso61764835ad.3
        for <oe-lkp@lists.linux.dev>; Fri, 07 Aug 2026 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786127748; x=1786732548; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pm71kvPkgJxC1haOW3M1MZVVKWNDxYGuYHJrug/WR+c=;
        b=kvFPauRwSe9LoZ/zW2x0QMpc4joWQbMHGPjhUzXcKB6l6WthXLHyQfaodYWfYbs2hU
         gsTFPgM8r4FpJigmMpOQJfGU6lQ6tdmQpz0m4uPwViUBg9PGNM37+RcPl8qHTNNo0zA7
         99HE564c+k+Nl+coKfXKB4/myNGM3GxWQbkJCjgGPgWsmeNKPsGGc667D8iTsBUecK2l
         6rVVKGpKMjeCIiXaKaKyhGdAxXpfD9MnSGf3WXDzlG8J1J1qwS8QzHLaLsnuWdV3L/Si
         VyF3T9sYFZbA7rfMXBH32jiAUln1IKWMG9fRe4gWr3iCuykkci8kAFVyjhhrhZgSZjEQ
         dGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127748; x=1786732548;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pm71kvPkgJxC1haOW3M1MZVVKWNDxYGuYHJrug/WR+c=;
        b=RSH3YLATN3EilcfVxbsrI02pfkN41qLEpUSIaVojmdsmCjvi3AfmTJ0IBG0S4tXnbs
         WJCORMU4OWMV016RtD7g/Scd5NT3/2KnC4rkqjI6sGEO8Jp365S76bXQfbajlTm3n66V
         xdT/IpL/00Dx40bbORACeZ4kH/VJKjH9dufCOC7JXOz7yoMD8mCFnAAD2IGC/K1FBmce
         kgGMI4HrLfWzQcOzR8FsGSXua8R2o19FMa3oGWnXCqsL6l/KvagGrzMIDgUnPudyz+eA
         b3nZliMA89475swOiK9EIfIYSGljefzz6pAHJRQnR9oSM+fs6hRM2xQFojalL36vAE9/
         ZY8g==
X-Forwarded-Encrypted: i=1; AHgh+RrgA2zTfquUfXeHHTv9iCNvqsI52bo9m5iXQ8+CmTwyhROddjHKmsniFMuagFyviAVmK+t6pzo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQsKg6eXxXNI6YcNIQgz7uiyRZBGQL6z3l9dKyjtweenE+n9Es
	ZQOsfS24j/smnH5K9LkG3oCWIKW6tKVfDU1IW5IGV95+Dc7MYolEEYm4aLweaC9ubSXxCKnofdA
	kbzzKdA==
X-Received: from pjbct6.prod.google.com ([2002:a17:90a:f586:b0:383:bb4e:85a5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:528c:b0:37f:bfd6:8b40
 with SMTP id 98e67ed59e1d1-3903c5993cemr26345212a91.5.1786127747532; Fri, 07
 Aug 2026 11:35:47 -0700 (PDT)
Date: Fri, 7 Aug 2026 11:35:46 -0700
In-Reply-To: <202608071656.86e9fd06-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202608071656.86e9fd06-lkp@intel.com>
Message-ID: <anYlguXMOPZD-cfj@google.com>
Subject: Re: [kvm-x86:selftests2] [KVM]  a262fc49e0: kselftests.kvm.make.fail
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: David Matlack <dmatlack@google.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 07, 2026, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "kselftests.kvm.make.fail" on:
> 
> commit: a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757 ("KVM: selftests: Build and link selftests/vfio/lib into KVM selftests")
> https://github.com/kvm-x86/linux selftests2
> 
> [test failed on linux-next/master 78bc8af4affb9a732504eb22eeac7d1e50883853]
> 
> in testcase: kselftests
> version: kselftests-x86_64-848acc8ffe1b-1_20260804
> with following parameters:
> 
> 	group: kvm
> 
> 
> config: x86_64-rhel-9.4-kselftests
> compiler: gcc-14
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202608071656.86e9fd06-lkp@intel.com
> 
> 
> /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c:12:10: fatal error: hw.h: No such file or directory
>    12 | #include "hw.h"
>       |          ^~~~~~
> compilation terminated.
> make[1]: *** [../vfio/lib/libvfio.mk:32:
> /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/kvm/libvfio/drivers/ioat/ioat.o]
> Error 1 make[1]: *** Waiting for unfinished jobs....
> /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c:14:10:
> fatal error: registers.h: No such file or directory
>    14 | #include "registers.h"
>       |          ^~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [../vfio/lib/libvfio.mk:32:
> /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/kvm/libvfio/drivers/dsa/dsa.o]
> Error 1 make[1]: Leaving directory
> '/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/kvm'
> make: *** [Makefile:218: all] Error 2

Any chance the file is literally just not there?  Makefile.kvm's -I$(<D) expands
to:

 -I/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/dsa

which matches the directory of the input file:

 -c/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c

so AFAICT the makefile is working as intended?
