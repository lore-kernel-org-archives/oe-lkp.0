Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99736267AE5
	for <oe-lkp@lists.linux.dev>; Tue, 25 Feb 2025 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490948; cv=none; b=QELZQhm/CZQlLCY9agKjkBqHW9haF5ujTu9v32euUG5W2uHtTGc6bxp5XnDm8cnt8hFBNvK+OWHB/0LAF6DbUUcR8oHfY1UURUWI+i1Dxh0CTSisKCrDUpgGlG6qsboeYyKztpSSHfL0rbG+9lhC2VMALGIuYjfOXf6FA8MQ6xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490948; c=relaxed/simple;
	bh=BnR1UEhkD2s11wwqzNvj/RhJsief2AsOyiHWF4nIWnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKUxPpQcP9l/hXwlThAYfMtjHr4aiIXhqnQ5RkvsBXphui8MlpKIsKUS5wc8qgGayjI/Jn1CoDIVkiZVqmwp7/shhrJDWrg6C1xLgdPrPOAenI+SoRjE9Zg+uobglFjiUaTuoiGRffLTFxp665SgpbvtaQOQ57sgwTVItiTmhGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=PjJRnkqy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="PjJRnkqy"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-439a331d981so48898975e9.3
        for <oe-lkp@lists.linux.dev>; Tue, 25 Feb 2025 05:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1740490945; x=1741095745; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j3XL4nlHnnlyPH4jYVrMU0QnNTngOwLFMHwhGLj0jSQ=;
        b=PjJRnkqyqgTwI3Z+US6TdSChuUkDD9PiIEyWGT5K6P4RIU6xot3u7uN4EwzhQx4XzK
         /3x1MBKGVxum/bzDlHAj7fJ6Cl3CAOt8K+X1CE1JzkWLbDHhpVFCxsH8fnStm0lle3n3
         NoiKjGWoq4m7+FS8LT3SLUKHsWOBDdFJg/PVr8gldcy+CQMvNBEUznmIDHXYdN/dq9Ex
         GGXWBHSLcE6/eCo2VY7af4JcHih2HEfPArayZQzzMZhfJHNW3ksV2TfB/X/ztwUgFxBW
         +9/DIPiB34HgG7ktiIiQJSf3DexUxeELA/0crl1YGWlFGmRTYcs4DaLLRPnpaHo9LYqn
         c41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490945; x=1741095745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3XL4nlHnnlyPH4jYVrMU0QnNTngOwLFMHwhGLj0jSQ=;
        b=XOEUSgZ1jBDMmdn9OtBQpzCOkNXNI/FExb7yaa9PL/IRAwX9tfpUcmybEnP6s7woQr
         0xRsyIkAe+H7ogDRuf5na5jLy13H1p18fwUC4qz0Ie8RUTRZqAHWks9cLANMwGpapsxg
         YuHBeTU5f3nPxq7lkoo7Pj7jiS94MERDyyLUwL0Kv46oxtZES7shVU3WE+Pgqg5ofw3M
         9IZ8yVMOEtGMYqOt2S+WaXQnaFcRSx3o4HPPK4jyJil1XH3B79V1F97SivBptYiRYvxw
         XbLzZ8TE5gXKUgsfAR/g7Eb3ewMFwK4xh7dOdeEvUca2cqgyT4RiYhmbJVhP4y0kghGM
         Tlpg==
X-Forwarded-Encrypted: i=1; AJvYcCV0Kc7m3j4QO04IajFeXeA+PDuGWxH31FhA0LJ4PVLBEPSCOe/T3HFrwCbBa4C1SNbc/M7Jwq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxOVTTvxj/5dx9eNgZf1i0/gYsLVbfzu82K4LuChL5CDLvjJdi
	uIffanTs7MtI+Ndku06YjU/M3lGQ5CbjbtUQvav3/nrapywsxOoetNWjt/OOiqE=
X-Gm-Gg: ASbGncs4Lk2IdQUayMexLOo6D0W8GPkZaWiVv4BqbmY2RvqTb4eykxnPHRdmN18nyWt
	Mvv6KrlmEOLlXEpq5u2R8nLDyHpLM2RT1sVcWPE6hxxTYvwdKrpJOv0ydo2GUMHErA36LAfsauG
	4SsHWw0PYe+bNE7dkEJIg3RwQOTBdcjusjZ8EDCPUoBY3gucHuarRatjw7v7eX0vJhxCvTR0X2F
	YYMdSovuM1f1FFLNPOcnHWzO+e8MesVPV9B+ttmKMRgmdLCHU7WxCQA6qd8fGNrtS+YO//diZWP
	ogWROXb/ChNdEbbWVveu
X-Google-Smtp-Source: AGHT+IHz/kHuckgA3TvrA+/LI4qYIECysjjksxwCyLbpI4maWhZXofOF7yzDRNHHsxuldeUWnRaCCg==
X-Received: by 2002:a05:600d:5:b0:439:30bd:7df9 with SMTP id 5b1f17b1804b1-439b04f9d29mr123525755e9.9.1740490944720;
        Tue, 25 Feb 2025 05:42:24 -0800 (PST)
Received: from airbuntu ([46.186.201.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b037213dsm142703895e9.40.2025.02.25.05.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 05:42:24 -0800 (PST)
Date: Tue, 25 Feb 2025 13:42:20 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Chen Yu <yu.chen.surf@foxmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	zihan zhou <15645113830zzh@gmail.com>, oe-lkp@lists.linux.dev,
	kernel test robot <oliver.sang@intel.com>, lkp@intel.com,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com
Subject: Re: [tip:sched/core] [sched]  2ae891b826:  hackbench.throughput 6.2%
 regression
Message-ID: <20250225134220.qjctfqwwhjz7bspp@airbuntu>
References: <202502251026.bb927780-lkp@intel.com>
 <tencent_6D9B516AFF16965A3BB652A049D6CA847706@qq.com>
 <20250225122705.GD34233@noisy.programming.kicks-ass.net>
 <tencent_CC411B43EAD996961A06366F606C96DD0406@qq.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_CC411B43EAD996961A06366F606C96DD0406@qq.com>

On 02/25/25 21:15, Chen Yu wrote:
> On 2025-02-25 at 13:27:05 +0100, Peter Zijlstra wrote:
> > On Tue, Feb 25, 2025 at 05:31:34PM +0800, Chen Yu wrote:
> > 
> > > 
> > > But consider that the 6% regression is not that high, and the user might customize
> > > base_slice via debugfs on-demand, we can keep an eye on this and revist it in the
> > > future(we have encountered some SPECjbb regression due to over-preemption).
> > 
> > You can specify a per-task slice using sched_attr::sched_runtime. Also
> > see commit 857b158dc5e8 ("sched/eevdf: Use sched_attr::sched_runtime to
> > set request/slice suggestion")
> > 
> >
> 
> Thanks, we'll have a try during the next test cycle.

Could you also try with HRTICK enabled?

	echo HRTICK | sudo tee /sys/kernel/debug/sched/features
