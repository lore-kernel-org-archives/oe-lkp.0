Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123C41F9A95
	for <oe-lkp@lists.linux.dev>; Fri,  3 Jan 2025 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735911722; cv=none; b=AwRNBvOE20Y4cYavQ6di8dJf72q3QU6Y5+ztqwV0yAPWsGBhDh+G2x8HzUFa864UncheNkRr/L+B0gbAFNT/0dtZK5iNEN+f/Vp1Sjawr1C2k2q4FqVHKzPGCM7mRt89rDGFlgrHCU1Dt0XBI4Oas+5QPXI0T7T2KOI8sKUvVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735911722; c=relaxed/simple;
	bh=YwzmqaD7Gv6N8nEsMEN1t1XBhXgQYBpPgx60QOsjJq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpAQRqIuQaZ6nio4d+xOLmJ1kwIhgKEr52/mbVirc7cg2w5tXNaYQZnANYsKNbTIH6tJT+g0DImvzUUhMRvKTcrEJQ1PkJWKg2U74r9/ogt7jH75790BjYF9MWz7wdckA557TQCelDxBbmF/K+nZy0xY9/S3mSMUnNxQv4hC3cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaee0b309adso1364153066b.3
        for <oe-lkp@lists.linux.dev>; Fri, 03 Jan 2025 05:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735911719; x=1736516519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB07t4o4mu+ZjNcnROOEP8UVbxrHyYf1oPcMLyNVXss=;
        b=YMwmsr+ey5YdUZ7amhFHPcQZnLlbdRwXKRooTbR0jHtD69f17uq70YVZxSl38C0Fzz
         nenM8uqTWU3HPJnA2U8O+jhgTc0qJNqXNETnkAAO0ZZsE18T+NgXZbvBZrWjA6qZbKro
         LaeQ0JAZE7llSSoUlfLVlIhyG1KxhBPaO7R2Jihl+XvrFCDwB7E0VlC1tntB+YsnW8cL
         4Okq3Eymvo5YRmqRH1kDGOLpMbkKtmoIyHDJNoZV3AfDDsD572iAqRuIE0agy+uotLbe
         8XmAi26WPbYak9sc6MNEkDJcA5V2BciEEtu/BPp9ObJTTfBRl+gEc/CcDp6RsqRhVtU/
         jEyw==
X-Gm-Message-State: AOJu0Yy4vvrF7De6M84HMBw6f/Hp1tyuYE8GBIp6nGg3GcS8RZ9HbOMA
	YHvm4pmPUjKwicxY02yuJsFG15zg4HFDeOwtGCR2MHWTL0mzKyxI
X-Gm-Gg: ASbGncsW7Dd98YIm1tsQgDNPz5rImbXBBXRbtFPK0uL5cnCIrHZEKVYwVTtBYUCir7L
	FzIueTeMy+QdQcfrqXBH1bESfvph6u0tT6wB3ANPG6eJjAzvqxKX9lI/wkdEcUA8jriM2SHMHIQ
	vdZTYFBkhGTj4KJBIRHiYcMOuLItiOh1GUWAJqB+wfUFX7QAZb3V1XySKMioQIUh+euGn4rCyD8
	Ziai+QyIcMlDVomcF+/MxCFjJJFzBHvoTdFXSVkamQz9pU=
X-Google-Smtp-Source: AGHT+IFtHssCSogTuYAP8cFKox2R3LGjnNMokBmM8CQ7u2W64Yu1xN7FqCsmh0WDx/JTFNHhAmE+Kg==
X-Received: by 2002:a17:907:7da5:b0:aa6:8781:9909 with SMTP id a640c23a62f3a-aac2d32837amr4634971866b.29.1735911719057;
        Fri, 03 Jan 2025 05:41:59 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:9::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe46a6sm1891039566b.116.2025.01.03.05.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 05:41:58 -0800 (PST)
Date: Fri, 3 Jan 2025 05:41:56 -0800
From: Breno Leitao <leitao@debian.org>
To: kernel test robot <oliver.sang@intel.com>, lkp@intel.com,
	oe-lkp@lists.linux.dev
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>, Tejun Heo <tj@kernel.org>,
	netdev@vger.kernel.org
Subject: Re: [herbert-cryptodev-2.6:master] [rhashtable]  e1d3422c95:
 stress-ng.syscall.ops_per_sec 98.9% regression
Message-ID: <20250103-singing-crow-of-fantasy-fd061f@leitao>
References: <202412271017.cad7675-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412271017.cad7675-lkp@intel.com>

Hello "kernel robot" team,

First of all, thank you very much for running these tests against the
linux kernel.

I am trying to reproduce this report, and I would appreciate some help
to understand what is being measured, and try to reproduce the reported
problem.

On Fri, Dec 27, 2024 at 11:10:11AM +0800, kernel test robot wrote:
> kernel test robot noticed a 98.9% regression of stress-ng.syscall.ops_per_sec on:

Is this metric coming from `bogo ops/s` from stress-ng?

I am trying to reproduce this problem, running the following script:
https://download.01.org/0day-ci/archive/20241227/202412271017.cad7675-lkp@intel.com/repro-script

And I see the output like the one below, but, it is unclear to me what
metric regressed stress-ng.syscall.ops_per_sec means exactly.  Would you
mind helping me to understand what is stress-ng.syscall.ops_per_sec and
how it maps to stress-ng metrics?

Output of `stress-ng --timeout 60 --times --verify --metrics --no-rand-seed --syscall 224`:

	stress-ng: info:  [59621] setting to a 1 min, 0 secs run per stressor
	stress-ng: info:  [59621] dispatching hogs: 224 syscall
	stress-ng: info:  [59647] syscall: using method 'fast75'
	stress-ng: info:  [59647] syscall: 292 system call tests, 219 (75.0%) fastest non-failing tests fully exercised
	stress-ng: info:  [59647] syscall: Top 10 fastest system calls (timings in nanosecs):
	stress-ng: info:  [59647] syscall:               System Call   Avg (ns)   Min (ns)   Max (ns)
	stress-ng: info:  [59647] syscall:                  pkey_get      156.0        127        185
	stress-ng: info:  [59647] syscall:                      time      212.5        195        230
	stress-ng: info:  [59647] syscall:                  pkey_set      235.5        193        278
	stress-ng: info:  [59647] syscall:              gettimeofday      282.5        255        310
	stress-ng: info:  [59647] syscall:                    getcpu      457.0        388        526
	stress-ng: info:  [59647] syscall:           set_robust_list      791.5        745        838
	stress-ng: info:  [59647] syscall:                    getgid     1137.0        974       1300
	stress-ng: info:  [59647] syscall:                 setresuid     1146.0       1070       1222
	stress-ng: info:  [59647] syscall:                    getuid     1162.5        902       1423
	stress-ng: info:  [59647] syscall:                 setresgid     1211.5       1159       1264
	stress-ng: metrc: [59621] stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s CPU used per       RSS Max
	stress-ng: metrc: [59621]                           (secs)    (secs)    (secs)   (real time) (usr+sys time) instance (%)          (KB)
	stress-ng: metrc: [59621] syscall          114464     86.78      1.27    364.05      1318.95         313.33         1.88          4500
	stress-ng: info:  [59621] for a 98.30s run time:
	stress-ng: info:  [59621]    3538.93s available CPU time
	stress-ng: info:  [59621]       1.26s user time   (  0.04%)
	stress-ng: info:  [59621]     366.66s system time ( 10.36%)
	stress-ng: info:  [59621]     367.92s total time  ( 10.40%)
	stress-ng: info:  [59621] load average: 80.45 43.94 20.82
	stress-ng: info:  [59621] skipped: 0
	stress-ng: info:  [59621] passed: 224: syscall (224)
	stress-ng: info:  [59621] failed: 0
	stress-ng: info:  [59621] metrics untrustworthy: 0
	stress-ng: info:  [59621] successful run completed in 1 min, 38.30 secs

Thank you!
--breno
