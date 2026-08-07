Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228953B3884
	for <oe-lkp@lists.linux.dev>; Fri,  7 Aug 2026 22:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786141322; cv=none; b=EEB+KDyVN9ndBLAsD5qCzAY/kXdTcWQwnQQuAqxrKWnYG6q2OKAX+08Az9VcMEHt9Th1ZndYnHdCZy2NdHVVHQ9zvA0H7pkTDGXhMQoVn89KQpChzTfvo5Rlxtz1KSIrBYOUK26ihPqtSBejmGnPIBu70bx1OYu44rp+oyrUw54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786141322; c=relaxed/simple;
	bh=FmcbweRd3d0dbaBtQcc0mHC7+KptZ6b26xjaw4CUekA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+eqaiuDmi1fvaMP+cIqoMtW5cgBFl1NY+KRiDSY2JMkXvNrYfpICRv2xVfKHmUBnw1fmYYvJiiO2GFP6x+QKO1c+SD3IfRk+BDs8tWeoxEAotlBi1PZU1I/RdUalb6Dfccv7Ae+oi0KAcahmP9FHxar4VSN5MacXxtCYfuBjtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kl77bXsq; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kl77bXsq"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84874b52eabso32854b3a.0
        for <oe-lkp@lists.linux.dev>; Fri, 07 Aug 2026 15:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786141320; x=1786746120; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LTyGEYgHivZOYUApgJpxjFo9wykmbOGyjWLFFgCWLkI=;
        b=Kl77bXsqGMEHJPF2/QTwOkxFgwHNZ0cjQogwUhfFc5pldoobrfisAYt7FgKIY8FHs4
         3mpJxv+iZ0X2wB9f/k1Ss8L3HAP3RV88TqSI37v22fnCr9BuZjL8hZDbdqx8k1OVAXMo
         /1w50ICTmSQEK4fRSCKwr/tQ3NhY6NnkZ9hgUrXfh/FRY/lPIWt2JATimK4JKDlN00oo
         ULZszhjHG3Ww/f/PTabVn/qceuD8MwHLg54oYLIG8rhnld68DHL1Iux7Dl47sJp9Iu9w
         2ZlahN7qgHIzSt2pjU8eZ70FNMia0FtPwgy/tZejKU3kanBvn/tqvSrL+J5s1birCtc9
         2QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786141320; x=1786746120;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTyGEYgHivZOYUApgJpxjFo9wykmbOGyjWLFFgCWLkI=;
        b=ITO4SXlA0IUTreS24rNbsypqGPIB9pxQEWsQVg43P1r5oNXogvGi9DD2aUfnFoCZf1
         TgOddjE/6QstgGKPHrLr9OCkiyq7j60wU6MrGJFqrj9+dseqi/JYv9LVpyVM7T/Ed2cO
         4giF/NGt3vvW90SJb99g2LsvlO8YAVNy83+JBX9IJ8hIbQFl+iO1gRBzsv8HjIWh3NA3
         K6tB2GQHeqGgrLK8EUaaG3/hPw+C9GFxAWZr6i0cXSXb8WhtO+ZSP2U/JHCvwzmuLDmH
         b5e/m81Bry9WiyL0TdsVdSzwTpW2DEg+aH+W/Y8YbrkCvAZBGalXnssoYcRAR5xEsbCD
         41VQ==
X-Forwarded-Encrypted: i=1; AHgh+RobqZPuEGhqnM94c3x8ztqClJqfWnh/QXtakKhRrlz2eIXqIDRO1Zs8lLZoB610GGHGsD9cn2o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeOcEMcUqE1gc2NZHh6UlAgrlzjmfHrYYsCl92ZvdxpstmX9HZ
	kqKX0CdQGkA8DD9tltzD4D+MaF18xOhVo22iCNitvD+NAg1BW7wDK916tfCvPUj9qBGTEQ9kzOX
	SVqiJXA==
X-Gm-Gg: AR+sD11QJtDGkQOcM6PK3V7I8reSAUO8VYOCthgmVcQxO1N7no+mb7PM6lbK5XRypiK
	/ANz4yIeXbXfvPobBpN3JVtLuW2SuaVireuSEx6EMfjcDVrOkVvrLhWkCAQDpJWc3Qo6ugOghtn
	Q3I0gAH4OKl9inGfUwuzFCFTDcA4aLK1ITktVDJFsQZzwXKGboYEtm5JT/j+Tha+ymPm44WdiXR
	X4UM9aFgeo584V3n4a3KnpkPmcDRzR9G/pQzikgPEgSbaHANO6g5swnzdMOegemSLpuI9iiG+t+
	hEd2l5cbJWD7UHk8iBoii7YkwDKJcDc9gEZSriI+17gIgNmlBC5AAA4YNMmT4P4E5mPS0eH6ZaB
	I3xclKkbwlU8XMYS1dqBEpWRzz+1QVmFL97hD1Lt4ARY3Nszclldf1aPm2xNA0TidpNbAWAy80T
	Xonxxt+Mj365rwQsNrQqk1sQBUdjJQGjsKWrbzHybMuRIQzLAKlYZ7YRJtcWxNcte50CC+oGeTw
	xL2C9UItBDmSkTeKFASTJlnL5XCmQ==
X-Received: by 2002:a05:6a00:4b56:b0:847:8650:69cd with SMTP id d2e1a72fcca58-84f5e0d2cbdmr7741131b3a.33.1786141319766;
        Fri, 07 Aug 2026 15:21:59 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3a0f8dsm1617296b3a.12.2026.08.07.15.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:21:58 -0700 (PDT)
Date: Fri, 7 Aug 2026 22:21:55 +0000
From: David Matlack <dmatlack@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org
Subject: Re: [kvm-x86:selftests2] [KVM]  a262fc49e0: kselftests.kvm.make.fail
Message-ID: <anZag-tsavs8YNUl@google.com>
References: <202608071656.86e9fd06-lkp@intel.com>
 <anYlguXMOPZD-cfj@google.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anYlguXMOPZD-cfj@google.com>

On 2026-08-07 11:35 AM, Sean Christopherson wrote:
> On Fri, Aug 07, 2026, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "kselftests.kvm.make.fail" on:
> > 
> > commit: a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757 ("KVM: selftests: Build and link selftests/vfio/lib into KVM selftests")
> > https://github.com/kvm-x86/linux selftests2
> > 
> > [test failed on linux-next/master 78bc8af4affb9a732504eb22eeac7d1e50883853]
> > 
> > in testcase: kselftests
> > version: kselftests-x86_64-848acc8ffe1b-1_20260804
> > with following parameters:
> > 
> > 	group: kvm
> > 
> > 
> > config: x86_64-rhel-9.4-kselftests
> > compiler: gcc-14
> > test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> > 
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202608071656.86e9fd06-lkp@intel.com
> > 
> > 
> > /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c:12:10: fatal error: hw.h: No such file or directory
> >    12 | #include "hw.h"
> >       |          ^~~~~~
> > compilation terminated.
> > make[1]: *** [../vfio/lib/libvfio.mk:32:
> > /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/kvm/libvfio/drivers/ioat/ioat.o]
> > Error 1 make[1]: *** Waiting for unfinished jobs....
> > /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c:14:10:
> > fatal error: registers.h: No such file or directory
> >    14 | #include "registers.h"
> >       |          ^~~~~~~~~~~~~
> > compilation terminated.
> > make[1]: *** [../vfio/lib/libvfio.mk:32:
> > /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/kvm/libvfio/drivers/dsa/dsa.o]
> > Error 1 make[1]: Leaving directory
> > '/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/kvm'
> > make: *** [Makefile:218: all] Error 2
> 
> Any chance the file is literally just not there?  Makefile.kvm's -I$(<D) expands
> to:
> 
>  -I/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/dsa
> 
> which matches the directory of the input file:
> 
>  -c/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
> 
> so AFAICT the makefile is working as intended?

I think this is a problem in how the kernel test robot builds selftests.

hw.h and registers.h are symlinks to headers in the kernel source tree.
The selftests build works fine for me when I check out the entire kernel
tree at commit a262fc49e0aafdeeb1b4fd8cb0d79a0fde447757 and build the
KVM selftests.

But if I delete one of the symlink destinations, I see the same error.

$ ls -l tools/testing/selftests/vfio/lib/drivers/dsa/registers.h
[...] tools/testing/selftests/vfio/lib/drivers/dsa/registers.h -> ../../../../../../../drivers/dma/idxd/registers.h

$ rm drivers/dma/idxd/registers.h

$ make -C tools/testing/selftests/kvm -s
/usr/local/google/home/dmatlack/kernel/trees/kvm/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c:14:10: fatal error: registers.h: No such file or directory
   14 | #include "registers.h"
      |          ^~~~~~~~~~~~~
compilation terminated.
make: *** [../vfio/lib/libvfio.mk:32: /usr/local/google/home/dmatlack/kernel/trees/kvm/tools/testing/selftests/kvm/libvfio/drivers/dsa/dsa.o] Error 1

Maybe the kernel test robot doesn't download the entire kernel tree when
building selftests?
