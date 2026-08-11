Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190F0334C05
	for <oe-lkp@lists.linux.dev>; Tue, 11 Aug 2026 21:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484497; cv=none; b=VsvOZ0OKRgZb3X5ED4KyoirgqRa1lQ5ezkEDEyJE92Y6JbkQrIVrRYql5Gu6INdPbSl3q+MnRTYZOH/VAhCSsPjfydu+2wTU7BECX8wQ3hiZctLlKxNSw67NQuf4O4EGmMw/4yOlxuKdub2EhjFgaXUkG9rCpvGBJM3Mvlaxue8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484497; c=relaxed/simple;
	bh=FvL1OIHi5wTi2D/EqC1IPZskKU1S4aFodr7CB5Lb86E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ux76Yjaafnm7D5IUmWzmHZT93JWNL4a7+itf7FTVzf8sPQM5XWHP5pNK2LqR2DmMjHyk/mT0YnxcSk6WGOfYbWYRGeOk9X2VjixAMRLqm+opReRT7Uo14vFy6ILH9n7Faat6F8ctVpoWmh2zKl4aeXHsBuPm7IwEvrPfqXwUINg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VIo33K6O; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VIo33K6O"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84a652535dcso242691b3a.3
        for <oe-lkp@lists.linux.dev>; Tue, 11 Aug 2026 14:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786484495; x=1787089295; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wkXfErZCu5pJKU3h2uo9xlPOj99O2IlT6yAUBX8IRnQ=;
        b=VIo33K6Owhsll+9KSayJWaKfh1ujz3vbNnxUmk41OtzTEJVrakRltVcQJC5jvYLrWo
         LShganq40035q/TCW3meWj0BsrR6nzSLQHzYerVstVB91h0iMZgIWPg3gW+XK8FGiI0D
         FTzGC5QgSBk98WK4fo8shS4OIExmJbFeMqu70sTjGn04uWUmBqj0i3G6BMCkbkNKe243
         fa/PFiNFheA+jDSRd5G7HlX91325bIvCkmgyVmYd0dbCQmoBJ74c9ETCP8+wZjcngqpH
         R7DtgI/4gIJSexJKZ/jDnfSzGHYgfTDodugUubmQdGslNBp80BSewOv4WDijnqO0EUvm
         HHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484495; x=1787089295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkXfErZCu5pJKU3h2uo9xlPOj99O2IlT6yAUBX8IRnQ=;
        b=ZdtN0h0CaTsFc5lSSWpx+6J0tCbrzMX+SNlrMjlqZCFgtZeihYUgNMYGkFSVz2GAJ3
         j798ArKSrRy/Y9D+5XYWS1DrzNfLQrKehm3ZqaKWdpgc1mgFk6pcrVjyACdcy2jeBNVN
         Bop3fkgwauAWb9O01TZokYiSApZazLPrALxhYU9Mnt0wM9Hq8Z2FuReiZVk890djz+6O
         GqiXAbbjXFMDHykR4QtJNVqbgL0uRw5zocFVyh4V35gjtkFy9zaVxyAVhbRysqjzJXus
         I5EQ5vBbB8As4i4k5XRf7K5LTVaffvEQIWy/0kPinEehNXJyRoEqA47c5CIpSsoec06M
         p2Wg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7YZ4KsFkcc0LFu8C3w10+G7kPaLPi1lLyLUfZWCuOWXPHlUWordsmlI9gnTwscENrx9myJkg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw78NpdZOHfm5XDz5h1r9HsjEg83EE+5AvrYd0tom21iC2mrP2h
	lIns1UQrPpMVzOnrWbsVatTtj2PQJG/h8dGT/CU+fDY1C4ya3ENwujjvgpFk5D2/Zg==
X-Gm-Gg: AR+sD11ERGmebdlGe4ivjBHzOzx9FBFK+xQV+l5MpS9wirAvrEezljHbOATNmoZ3rh0
	vKoSYepoffp3klEt3DFVThrOT94y3f72ae2hRTbdg9RtzoobF75dPAt559h2HHchuQNdjbsmilj
	4ce/OvJmXbahKHHq/XJqibW8dvWfrFPRaI7ZMFnBRYuSzWHgwJMJnNVsDPXR0bHmNfrFgCW2vj2
	KeFMTD6zxjgl/vua5OeWh8DogHcuIoKPvemucKM6gNx1gDbn12jGOV6Aj4ZEbBEkEZbfB1Krkjn
	n6OPEiex3UW0EVB6b+ORxrqhi7GgCZ1V2HJ/bCVlRQeFIZMsAA+jI/4oXT6+B8+X9rZnsGT5hUI
	vGVmNaYpEuALxLyiETGkwbGEgQzZQHbT6K5QKr8+ZjnvfEg7je8zfqcBO9Sa9uBz+cHWBRrQipJ
	z5pEoiqFgoL85QVDmjIVjxpWw7YoVZe7bsfDVT/xathxvpn6C9f3VCf0H+8wyXJoaD/tHh0E0NJ
	CJFMSR6uBunQRFxNzWS46ZTkcOY4g==
X-Received: by 2002:a05:6a00:3a26:b0:845:36a0:9eb2 with SMTP id d2e1a72fcca58-84fb5560093mr241098b3a.34.1786484494638;
        Tue, 11 Aug 2026 14:41:34 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1f2598dsm255623b3a.47.2026.08.11.14.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:41:33 -0700 (PDT)
Date: Tue, 11 Aug 2026 21:41:30 +0000
From: David Matlack <dmatlack@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org
Subject: Re: [kvm-x86:selftests2] [KVM]  a262fc49e0: kselftests.kvm.make.fail
Message-ID: <anuXCiFnJEugZb0m@google.com>
References: <202608071656.86e9fd06-lkp@intel.com>
 <anYlguXMOPZD-cfj@google.com>
 <anZag-tsavs8YNUl@google.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anZag-tsavs8YNUl@google.com>

On 2026-08-07 10:21 PM, David Matlack wrote:
> On 2026-08-07 11:35 AM, Sean Christopherson wrote:
> > On Fri, Aug 07, 2026, kernel test robot wrote:
> > > 
> > > 
> > > Hello,
> > > 
> > > kernel test robot noticed "kselftests.kvm.make.fail" on:
> > > 
> > > commit: a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757 ("KVM: selftests: Build and link selftests/vfio/lib into KVM selftests")
> > > https://github.com/kvm-x86/linux selftests2
> > > 
> > > [test failed on linux-next/master 78bc8af4affb9a732504eb22eeac7d1e50883853]
> > > 
> > > in testcase: kselftests
> > > version: kselftests-x86_64-848acc8ffe1b-1_20260804
> > > with following parameters:
> > > 
> > > 	group: kvm
> > > 
> > > 
> > > config: x86_64-rhel-9.4-kselftests
> > > compiler: gcc-14
> > > test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> > > 
> > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > > 
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202608071656.86e9fd06-lkp@intel.com
> > > 
> > > 
> > > /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c:12:10: fatal error: hw.h: No such file or directory
> > >    12 | #include "hw.h"
> > >       |          ^~~~~~
> > > compilation terminated.
> > > make[1]: *** [../vfio/lib/libvfio.mk:32:
> > > /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/kvm/libvfio/drivers/ioat/ioat.o]
> > > Error 1 make[1]: *** Waiting for unfinished jobs....
> > > /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c:14:10:
> > > fatal error: registers.h: No such file or directory
> > >    14 | #include "registers.h"
> > >       |          ^~~~~~~~~~~~~
> > > compilation terminated.
> > > make[1]: *** [../vfio/lib/libvfio.mk:32:
> > > /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/kvm/libvfio/drivers/dsa/dsa.o]
> > > Error 1 make[1]: Leaving directory
> > > '/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/kvm'
> > > make: *** [Makefile:218: all] Error 2
> > 
> > Any chance the file is literally just not there?  Makefile.kvm's -I$(<D) expands
> > to:
> > 
> >  -I/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/dsa
> > 
> > which matches the directory of the input file:
> > 
> >  -c/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
> > 
> > so AFAICT the makefile is working as intended?
> 
> I think this is a problem in how the kernel test robot builds selftests.
> 
> hw.h and registers.h are symlinks to headers in the kernel source tree.
> The selftests build works fine for me when I check out the entire kernel
> tree at commit a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757 and build the
> KVM selftests.
> 
> But if I delete one of the symlink destinations, I see the same error.
> 
> $ ls -l tools/testing/selftests/vfio/lib/drivers/dsa/registers.h
> [...] tools/testing/selftests/vfio/lib/drivers/dsa/registers.h -> ../../../../../../../drivers/dma/idxd/registers.h
> 
> $ rm drivers/dma/idxd/registers.h
> 
> $ make -C tools/testing/selftests/kvm -s
> /usr/local/google/home/dmatlack/kernel/trees/kvm/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c:14:10: fatal error: registers.h: No such file or directory
>    14 | #include "registers.h"
>       |          ^~~~~~~~~~~~~
> compilation terminated.
> make: *** [../vfio/lib/libvfio.mk:32: /usr/local/google/home/dmatlack/kernel/trees/kvm/tools/testing/selftests/kvm/libvfio/drivers/dsa/dsa.o] Error 1
> 
> Maybe the kernel test robot doesn't download the entire kernel tree when
> building selftests?

Yeah this seems to be the cause of the build failure. The lkp project
only grabs a subset of the kernel directories when packaging up the
kernel to build selftests, so it will not have access to the symlink
targets used by VFIO selftests:

  https://github.com/intel/lkp-tests/blob/bbbc29c495d9617f28dbc8b799cf0dac9a1ca54e/lib/tests/pkgbuild.sh#L484

I'll get the ball rolling on fixing this in lkp.
