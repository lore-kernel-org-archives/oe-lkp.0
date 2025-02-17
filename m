Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D905319ABC2
	for <oe-lkp@lists.linux.dev>; Mon, 17 Feb 2025 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739779103; cv=none; b=sv9MZersYuB7vHl2KU2y3UAjzv2ClR/jwXiWVM68Vu6F/l/mHa0CMvWWIOBh8p2Ty6m9M999XHtMstLHNEGwZVP7qYM4VDUNVnUjLWlM/2GnSSmr9KlTZf2J7nBGzbpYVnoFuVoOHxv/Y1zDv8q2r2+p8R/sGoW8QCvaIrl8CbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739779103; c=relaxed/simple;
	bh=/M3ezt3Z/lLmjNEp9YYFZLIfonOW+E/UIMscXYZ0U6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+r4qpcgQ1/gbhZUr8Pjfm0bBqSDq7pyX248g/9GLRLddYgqoFiCLWdUYvr83hx7mgzyolFpDYzmizSQhk1888UsDcnfhiCxt0FZ5iU8iDUPmTpfvChzWau2X2qRNbQWJSlc5+k/ksBRyQ9HHA4MBtE1GW6ngcMsoQW8YR3jI/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crEMB/F4; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crEMB/F4"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so812235766b.3
        for <oe-lkp@lists.linux.dev>; Sun, 16 Feb 2025 23:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739779100; x=1740383900; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ApD7BwCDLH9Cer9mwkanCNIi/wQ8i9+UwiMAZTm2yAI=;
        b=crEMB/F48s3DwDc5RnvCSmwpH/EGcrAeWaUTmkeLVykVzL7XGcRHWQBkDHPZbkjKGY
         NhaWdGOs2+Qozndtfd07jptNzKziic5NgfGzoiyXch9zDQ0tHNYZI2DQJ2h7lN8zni6P
         1s3UhoUWUpqFIlQ+87XIMgI7pH14T8ee9aEURptb9JvtEme3znca4GVMi1I7OK/+3dAi
         upgxLoL8TxxSChQXF8vktymh8cxOe4NPMDtCzYJD+IS+1IBKzbke8UJ4UitIUab/TUzw
         gom85uyslJRBAiaTVNbTX9ol8ierpjeZVtu33Q9NPw4oRvpi86CA1ODGMXLqEigTm4+2
         zF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739779100; x=1740383900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApD7BwCDLH9Cer9mwkanCNIi/wQ8i9+UwiMAZTm2yAI=;
        b=PPDPv/ExpC1pc9hmHqWhq8E/0woTzCM4xsYciaZWIxQrB/WMWKsjEg1TJCqOyk2oAi
         KmLtWzEW7CvcunvZH4I4Cqp/psR/sCevT+pSK5sTDZbEmRvrXOOpdWrgDkz+4dUAXGoR
         1UItWTg+yhzDOP0raoOAt+COz3wwVHkvrBEXZPBfZKM288hxlKch6VLl+MumPM95wd28
         UfS7roRx64kdYNDNkq5T9wFRKzx08u+jWGjFqFmXgtCTCvr+uTPeuFqgfIqdeixqkszl
         A5Qorj3ZzeQtfcyWW+Szlpixql3MpNWjaWS7vgwOhYu2B0o8R6z/oCJ/eMWLIL71v+Eq
         DorQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuQZnqrh7tQv+x1M1zZcgIeCVjNmYqFRwHJevjQO3i/85Fw7wmn4JOdW0vrfPAFGU6+kHdpSo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMX4aqcd6WoxvLsUz/p7OajPaSRykrPOK5QGLBnvrqVMtkBOX8
	AXoFhDDdfJ48MzEjmozS8jtZ+axKbsy4MqrnQPZyioK/5p8fa7Zu
X-Gm-Gg: ASbGncv2Dp6AWF3RIf2uWvcdlkysz24SjeZY2rEvRkpmHo1Z2X+J3sKZBljuklrW4Yu
	rSRWchx8S5PT6/9ftVhZKt8xo1hUXE4h3VgZMjTSh8VUrSFxlmIcxq7Am8j/lA+tQFLPGlyUviN
	2YZeLN8bpTF4zRTFgDYlM8zxiiy5sWaqyRJuJSrrXWRJ7Qc52SXdO8I4+5tDe2+yYJa6WQ8jX8x
	vcRPEQ6cCiS7T0nYYKx7ly9SUvZEjYycAvD7V230+i9XlLqbq+R9uNAOjIKbnEzdD8G3eq/s3Ic
	HKDX8XVbzbm1q3TMdW9pM+1monOIxl8=
X-Google-Smtp-Source: AGHT+IGX390FOPHXgV0NpdCEyO/q1N+yhgq8PJVniRaE6lQIwr6rUFGG4d+Wp3xEMZQx2Qa6HcYR7Q==
X-Received: by 2002:a17:907:3d8e:b0:ab7:5b58:f467 with SMTP id a640c23a62f3a-abb710dcd60mr887440566b.40.1739779099850;
        Sun, 16 Feb 2025 23:58:19 -0800 (PST)
Received: from f (cst-prg-82-124.cust.vodafone.cz. [46.135.82.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53397f47sm836991766b.127.2025.02.16.23.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:58:18 -0800 (PST)
Date: Mon, 17 Feb 2025 08:58:08 +0100
From: Mateusz Guzik <mjguzik@gmail.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-integrity@vger.kernel.org
Subject: Re: [robertosassu:evm-iint-ptr-v1-devel-v3] [evm]  e38e699a42:
 will-it-scale.per_process_ops 160.4% improvement
Message-ID: <33ac5nnu2mte56mrrm62fqsyqozdifll63wdohjp2ywcnizwrd@2besd5mxagjg>
References: <202502171412.ec2e5b88-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202502171412.ec2e5b88-lkp@intel.com>

On Mon, Feb 17, 2025 at 02:45:23PM +0800, kernel test robot wrote:
> kernel test robot noticed a 160.4% improvement of will-it-scale.per_process_ops on:
> 
> 
> commit: e38e699a42b4db5daf7dac453759fdc8ba0dab31 ("evm: Move metadata in the inode security blob to a pointer")
> https://github.com/robertosassu/linux evm-iint-ptr-v1-devel-v3
> 
>      24.57           +72.2       96.76        perf-profile.children.cycles-pp.__fput
>      24.63           +72.4       97.02        perf-profile.children.cycles-pp.__x64_sys_close
>      24.67           +72.5       97.17        perf-profile.children.cycles-pp.__close
>       0.00           +95.2       95.17        perf-profile.children.cycles-pp.osq_lock
>       0.00           +95.5       95.53        perf-profile.children.cycles-pp.__mutex_lock
>       0.00           +95.7       95.71        perf-profile.children.cycles-pp.evm_file_release
>       0.00           +95.9       95.87        perf-profile.children.cycles-pp.security_file_release
>      98.69           -98.7        0.00        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath

Contrary to what's indicated in the report, this change is in fact a
significant slowdown (or rather, will be when other problems get fixed).

The open3 microbenchmark issues open + close in a loop on the same file.

On the stock kernel the some of the problem is false-sharing within
struct inode.

The biggest bottleneck is lockref manipulation:
- there is lockref acquire and release happening *twice* instead of just
  once
- the lockref facility is prone to degrading to operation under a
  spinlock and staying there when microbenchmarked. you can see on the
  profile this does happen here

evm also used to pop up, which I patched away in 699ae6241920b0fa ("evm:
stop avoidably reading i_writecount in evm_file_release")

Your patch adds a mutex which adds 2 atomics to the fast path (so slows
down single-threaded operation) and more importantly adds a
serialization point for multithreaded operation.

In this case the resulting contention helps decrease the loss of
performance in lockref and that's how there is an apparent win.

I have a WIP patch to move dentries away from using lockref, which will
in turn avoid the degradation. Should it land, the mutex added here will
be the new bottleneck.

It needs to be avoided by default. Do you *need* to test the condition
in evm_file_release() with the lock held? Perhaps initial test can be
done without and redone after acquiring it?
