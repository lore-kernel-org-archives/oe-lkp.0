Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989153;
	b=BUOxIqgNuHE2IH6UQNPe6Pd+ZnN5g4aXuIH7eS8OVy+eRbLWAjb/gAAaAv86aPGIEGNF
	 aQ9zK9BCAl6G42mA/Y1aBGY+rmTmVj5yfpeNDQtMDuI4kDo01kquJ6tnUubXjFZCc4wt4
	 HDwg/pK/wKSEX7UJB1nmqhc4J6jef1h5+J17KU+XqyiHxJ3A9g0pc9CzMbwP4KWB+ZCnt
	 17ULVUwMjTjE1+lQDeDrmf9P1YEyLy7rEigH+Ug6SU5XNSNOti+jJWv9ZplaZVclajJjd
	 GaGh4matnj+RknVYCQuTMLNyrgHMo8gT4jIWXsCoMvEVjh5hTx/xLCpHhUSfrqjsLCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CAF05veWd1mXwHgLUVPA/XS7GxgSXTHbtWBtdYeysgM=;
	b=kqWep2NR2FffbPfSq9DO+8czRd4rd7JuzpJ0K4gni6dkexl6cb9PqpwmhAiksufVpj/c
	 dcXhGnHcJ33ar74bJ7Ec7NQ/HGcadQdp9FlVsmouERbc/jXOZOMuF2Ol+CiHPj116xpX8
	 173ww+8Cb3q0HPgRtAPllgkW51km79tZalBZNBxxo7vVqbtZmnwPn5scv/u230O8xa3gO
	 TGvxwpcNbRBWbnLsD7ydGFgdcLQALDMDr0kO/1BYU2zBaJHcujevD3lT/wjC31UDzt0nr
	 xlDtdj6momFgsnHnVwhiHvdrWkqS/Yz6GcoCyq9oSFyETGgCcgBnvFWbhd7OGW121xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=DVZcL1S8;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9848606A32C
	for <oe-lkp@lists.linux.dev>; Fri,  6 Nov 2026 18:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9848606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=DVZcL1S8
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4af173320f9so579051b6e.2
        for <oe-lkp@lists.linux.dev>; Fri, 06 Nov 2026 10:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793989152; x=1794593952; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAF05veWd1mXwHgLUVPA/XS7GxgSXTHbtWBtdYeysgM=;
        b=DVZcL1S8+2n9EDTJG+R/0Nogw+dvCAkXLJaWtObgvFbHro0lCyPFgAQJRlO8DyxN/w
         2yEWLNU+HZt76goO4Yld+tLivD/r3vgz36GInyuloU7NT0KvwX6xzMwDxaUWWhULuZ8P
         gxdfGq44NzEzU89xypg9vSdxu2qIrrH0HogJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989152; x=1794593952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAF05veWd1mXwHgLUVPA/XS7GxgSXTHbtWBtdYeysgM=;
        b=Iy/h5Ozck9N9wvSxuWhuDu/ayxcuPrRTHrrpryfTLsbYGebtAl8HIT8QhbIYHf3Bto
         ihP9SgeqxvIcVOWQW2GbCZzvTIDc4U1KQGJ1avX5ixcZVfFZPY3MbczFf2UPiU9Ozttb
         WztLlslqXHPfep4j/h1K5VBumZhy64jkgkvFV90dSq1//wGByZhcn5nKB5OsoUJZ55RW
         QlRNnymtRJrF5gJu4YtJNAyAMuCFQRqOUxVp2ikp4oHMV3iBZiwbLC1j0f2tMJx6bFWd
         yMoczLjuur6u25wU8Jf+P/0LnZM7UUZoHT1/v3b8zQW3gJZTw1BwDzW5D3SqP3CGlc/Z
         fqsA==
X-Gm-Message-State: APuU4Z9VjiwTdIwUCsVXpTjRKH+PySczBypQMga32/qiQVCobRzvD7So
	5sY/FbobSxAsTWR/Fj64aQkDOF1f171ao6eWKSeSWEh06U0Llm1Kbi9KW45UGaUucg0=
X-Gm-Gg: AYBFou3j2RrhjS7lmDMkvdMrJw6pxFZCK6vm5sF4cXEYKfTGQpX8x/LmXO5Syh9Xjvg
	rdBwo9WtYMYU4u/ypmzXjlAbLl7m1QiXCOU7od1+i9HfW/+Cz9op0Ns7pQT9AnA7IRh9eVqt4a6
	IadcScavoOE2CoWM3waMoGMNIB65YGcyxS5axZSKUGK1E3XQ41JouaX6fwrX6+yGoCEoxSObglV
	DnnB7wng7iG3CD6gV1KgFC7WSo2O9kVqRHRq1Aj4Wz4r7UByzLcNAOQCu3r0QAyakiI9y5W+htH
	FeJNtE0VgKIrB30pFGSZishtKv6UTgvYpclzCbTSNqtL1MGJeMzEyhkKNTZj2eJwomXJzi20sSm
	34BUDZe61foEwVjeL7tNtiTwn7dISVwQdtI8q9Txrf8o5XO6i0LbH0pIcdUK8yCcZCrdaLhLTp3
	rAszCTckfPELUvEt3DJSI2egeMGjychhFrqmAvOfkG9fuX/4ADi3ZVM+61f8drtz3VpupODKUX4
	D/2iYY5SvWvK9vvWihWyS7Bj+b0+l06XxNb6NhVYyHHejkc8sp6eQu8kAwoHlge84LQdzviGEBS
	qdX/ZMtSWQCyZoDeUcz57CF4Jnqn7CgFRef2MgY102BHPn3nNKmeM4wfll+TYO6eGLmPhmfXwUl
	ZrKdGm15CGdqzzyNok6Mu29P/+x06
X-Received: by 2002:a05:6808:1a21:b0:561:fa43:1b2f with SMTP id 5614622812f47-567e0fc17c3mr2329340b6e.20.1793989151828;
        Fri, 06 Nov 2026 10:19:11 -0800 (PST)
Received: from com-75606 ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7e5f6e2sm2027411b6e.11.2026.11.06.10.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:19:11 -0800 (PST)
Date: Fri, 6 Nov 2026 10:19:08 -0800
From: Kyle Zeng <kylebot@openai.com>
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Lukas Maar <lukas.maar@tugraz.at>, linux-kernel@vger.kernel.org,
	tglx@kernel.org, mingo@redhat.com, outbounddisclosures@openai.com
Subject: Re: [PATCH v2] futex: Use a keyed hash for global futex buckets
Message-ID: <au4aHJEyPVADFf7L@com-75606>
References: <20261019183334.29433-1-kylebot@openai.com>
 <202611050816.9e42490c-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202611050816.9e42490c-lkp@intel.com>

On Thu, Nov 05, 2026 at 09:04:47AM +0800, kernel test robot wrote:
> 
> Hello,
> 
> kernel test robot noticed a -6.0% regression of will-it-scale.per_thread_ops on:
> 
> 
> commit: c44a057178cbedbc04c63404258524975e87a64f ("[PATCH v2] futex: Use a keyed hash for global futex buckets")
> url: https://github.com/intel-lab-lkp/linux/commits/Kyle-Zeng/futex-Use-a-keyed-hash-for-global-futex-buckets/20261019-113334
> patch link: https://lore.kernel.org/all/20261019183334.29433-1-kylebot@openai.com/
> patch subject: [PATCH v2] futex: Use a keyed hash for global futex buckets
> 
> testcase: will-it-scale
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
> parameters:
> 
>   nr_task: 100%
>   mode: thread
>   test: futex2
>   cpufreq_governor: performance
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202611050816.9e42490c-lkp@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20261105/202611050816.9e42490c-lkp@intel.com
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
>   gcc-14/performance/x86_64-rhel-9.4/thread/100%/debian-13-x86_64-20250902.cgz/lkp-spr-2sp5/futex2/will-it-scale
> 
> commit: 
>   0fcb05b723 ("Merge tag 'libcrypto-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux")
>   c44a057178 ("[PATCH v2] futex: Use a keyed hash for global futex buckets")
> 
> 0fcb05b72344f408 c44a057178cbedbc04c63404258
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
>  7.026e+08            -6.0%  6.607e+08        will-it-scale.224.threads
>    3136755            -6.0%    2949754        will-it-scale.per_thread_ops
>  7.026e+08            -6.0%  6.607e+08        will-it-scale.workload
> 
> 
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are provided
> for informational purposes only. Any difference in system hardware or software
> design or configuration may affect actual performance.
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
> 

I wonder what is the best way to run this above regression test and what
will be an acceptable threshold for the patch to be merged.
I'd like to iterate on the patch, fixing the issue while avoiding the
the performance regression.

Best,
Kyle
