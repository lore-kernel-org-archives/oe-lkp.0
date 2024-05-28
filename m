Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0EE178367
	for <oe-lkp@lists.linux.dev>; Tue, 28 May 2024 20:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716928628; cv=none; b=dWrFg6Z6qq7W+nWXKtVEujfslh2Cuislg5hZn20qkhR20HtKCVup9X9qADC8GoAuJjvDDtri4+sEgqO7/Ue47EcdPUn1Y7XegffWjPntOnPnfQJ3qwXoRMLuAqQFlrI7gU8Gu0S9ge3jqgN+u9vmLQXAwSirqjcbZw3HQW5z2sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716928628; c=relaxed/simple;
	bh=RADaUfBeeAAe8xjgoZFJ+4XcBpYA8+vCMkToahKkYlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkcuXpn/rnkzJ/Xb0H1Eys0kpKBrvBz7N/hvNCO3jBgASpDxICaQ8yGvSSSJpxnpzUVto4K9qO85ltnAJvaCwExRdUYHxwihYvyeW0iR1TSVUqLdJF3zbL5r+hBaC+/XPCjFP0fy/qf3JWFmpIZPAD4IQC79CcSgSvjTc93pCAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2bdf446f3d1so1043114a91.3
        for <oe-lkp@lists.linux.dev>; Tue, 28 May 2024 13:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716928626; x=1717533426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocGhciDIymjtV72cJYX7TD5dK3LYFKmjLW2hh9YZxCU=;
        b=iwPZcp2olSM4ye8QyXsHvJV9libeNNdOMgqtHMeEzZe8UogZj2CZiBBqMKT8E88EoK
         I/LVWRVP/cOwZfKqk+0yUMcASM/2L+5sTzP8WqSe9qDw0vV/06Vo38rAOt1mGotTniWK
         sOwC3q7V2MiCbaP4Ng8nwwMCvBwbRr4S5GCGG33QOOGa6kjdXLAN1J5rY0sPHl7FbuJM
         c/+bRDvhtF3pLpfKvx3LLvJAo9lzomWKa1O1VXvjgbiG9hgVe27yr5jQn7x8751Kh/J2
         6TjUrFRT6cMiTwKBQ4/WukjqGGmtxHhGM6b8sP3QxlRPaXpMbwrf3AWCQZsYGSvY1oTp
         kv5w==
X-Gm-Message-State: AOJu0YyiFjAKS+6WrV51i7z8GlVNqgd3e4w+h+cZsnfJFhthcyutTbCJ
	JT6bGzNeDk8DRi5UbK2bjLyqOEdjkFJoY2kBW2iFcAbrE8rfLRhq
X-Google-Smtp-Source: AGHT+IGkLYLgbQKRVPQzy0nbn4TlmHHj/65jHN2jLz0MG1BUJjlY4P+swh2Vt91PtfsBBifZf+g61Q==
X-Received: by 2002:a17:90b:f89:b0:2bd:92e7:c305 with SMTP id 98e67ed59e1d1-2bf5f10a44bmr13066160a91.21.1716928625840;
        Tue, 28 May 2024 13:37:05 -0700 (PDT)
Received: from snowbird ([136.25.84.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bf5f50c3fdsm8267619a91.18.2024.05.28.13.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:37:05 -0700 (PDT)
Date: Tue, 28 May 2024 13:37:02 -0700
From: Dennis Zhou <dennis@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org, ltp@lists.linux.it
Subject: Re: [dennis-percpu:for-6.11] [percpu_counter]  05dbad003f:
 ltp.getrusage03.fail
Message-ID: <ZlZAbkjOylfZC5Os@snowbird>
References: <202405281421.127ddddf-oliver.sang@intel.com>
 <pywb7wcml44gzgidn7mtwwr23mybbilakckchk4777wfibtruj@n4yiwwpvglf7>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pywb7wcml44gzgidn7mtwwr23mybbilakckchk4777wfibtruj@n4yiwwpvglf7>

On Tue, May 28, 2024 at 11:05:54AM +0200, Mateusz Guzik wrote:
> On Tue, May 28, 2024 at 02:45:35PM +0800, kernel test robot wrote:
> > Hello,
> > 
> > kernel test robot noticed "ltp.getrusage03.fail" on:
> > 
> > commit: 05dbad003f2b2ececb1cc7428bfa8f470cc34b95 ("percpu_counter: add a cmpxchg-based _add_batch variant")
> > https://git.kernel.org/cgit/linux/kernel/git/dennis/percpu.git for-6.11
> > 
> > in testcase: ltp
> > version: ltp-x86_64-14c1f76-1_20240525
> > with following parameters:
> > 
> > 	disk: 1HDD
> > 	fs: xfs
> > 	test: syscalls-03/getrusage03
> > 
> > 
> > 
> > Running tests.......
> > <<<test_start>>>
> > tag=getrusage03 stime=1716734654
> > cmdline="getrusage03"
> > contacts=""
> > analysis=exit
> > <<<test_output>>>
> > tst_test.c:1733: TINFO: LTP version: 20240524-4-g22004c7db
> > tst_test.c:1617: TINFO: Timeout per run is 0h 02m 30s
> > getrusage03.c:43: TPASS: initial.self ~= child.self
> > getrusage03.c:59: TFAIL: initial.children = 0, expected 102400
> > getrusage03.c:66: TPASS: child.children == 0
> > getrusage03.c:86: TFAIL: child.children = 0, expected 307200
> > getrusage03.c:104: TPASS: initial.children ~= pre_wait.children
> > getrusage03.c:114: TFAIL: post_wait.children = 0, expected 409600
> > getrusage03.c:133: TPASS: initial.children ~= after_zombie.children
> > getrusage03_child.c:57: TPASS: initial.self ~= exec.self
> > getrusage03_child.c:62: TPASS: initial.children ~= exec.children
> > 
> 
> I confirm this patch broke things, thanks for the report.
> 
> Make sure to sit before you take a look at the fix:
> 
> commit 6e8b4caf667fb6fad1c63b061e303faab6d917ef
> Author: Mateusz Guzik <mjguzik@gmail.com>
> Date:   Tue May 28 04:52:10 2024 -0400
> 
>     lol
> 
> diff --git a/lib/percpu_counter.c b/lib/percpu_counter.c
> index c3140276bb36..51bc5246986d 100644
> --- a/lib/percpu_counter.c
> +++ b/lib/percpu_counter.c
> @@ -97,7 +97,7 @@ void percpu_counter_add_batch(struct percpu_counter *fbc, s64 amount, s32 batch)
> 
>         count = this_cpu_read(*fbc->counters);
>         do {
> -               if (unlikely(abs(count + amount)) >= batch) {
> +               if (unlikely(abs(count + amount) >= batch)) {
>                         raw_spin_lock_irqsave(&fbc->lock, flags);
>                         /*
>                          * Note: by now we might have migrated to another CPU
> 
> 
> Dennis, do I need to submit a v4? Given that this is a trivial one line
> fixup perhaps it would be handier if you massaged the stuff on your
> branch. I'm fine either way.
> 

Well that's awkward.. Can you please send a v4?

> That said this really should have been reported by something.

That's fair. I think I starred at parenthesis for too long that day so I
missed it too. The nice thing is these branches get longer running CI so
we can track these things.

Thanks,
Dennis


