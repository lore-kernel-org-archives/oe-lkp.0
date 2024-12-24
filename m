Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1DD13B5A9
	for <oe-lkp@lists.linux.dev>; Tue, 24 Dec 2024 19:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735067093; cv=none; b=ni7D4RmZnyu95I9No7EnWw+duxIQhr0XZqt38ejS+ZsIPVF45UTg5m4gssaUp6nyrbyWqpxGDW2F40v515khZkzQTNjlXJdCxgaTrzJ237HU5xZ+O+0g5ztCD+Qn6Ia6qmiVThlitxz0P5CeFA5kMawt6ued1WsjTz+42R9wXws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735067093; c=relaxed/simple;
	bh=y35Df4h8cW99KUsObzqKxOON8qVDMDNfiOTKQqYOH6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlMNvlo2SEkDrmHQFN2kid3WtQMMuPQlFpgtGZqmgarLOWU14xEPKv+AVZeIhnssyWZ1JyOs9iMUKxfRHLXXCD/589P4LWskqLOnrrWjLhqYzZuYxvJ4Pg8207wy2xfUOYpwzitpsmNzfmuZ3SHkwVsy3hzYgZPApBdSzTJVKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R9PmjtIo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R9PmjtIo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2162c0f6a39so64428805ad.0
        for <oe-lkp@lists.linux.dev>; Tue, 24 Dec 2024 11:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735067091; x=1735671891; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+gQgO0It7CURSu9wG5Nm/XdljrqD36vrZMH4FWJBR8=;
        b=R9PmjtIoiJx3RJo+2zZjuEFWvSdrK9jUW61UYNP9JbJ4GuSCGQlW5yb9BjXxhGxayM
         OfvMTCg8CEBa2BqZt/f88IlFf7E1c9CYarFIbu7R0Y3E5hMTxmx4kKJxoQIHCS/6SetP
         bw+x8l/F2lfo4KHZ/3lVppT3+MPmQmXfmCnjky1JqmMVtoZzvteHgwW7bGMjorh1QfIZ
         0A55uIhMqR74eG7wmTb/9YOuw+bTex6VG4nmNfCoCmppNTeVc6rhffa4S/Q5PlRb8TTJ
         BHMTujLX89eRTi4vPqGz/+Q1aaw2Ez+4c3ZN4TRkdzeMBDvBTzuyqlipvBa2AxwDKDpg
         0lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735067091; x=1735671891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+gQgO0It7CURSu9wG5Nm/XdljrqD36vrZMH4FWJBR8=;
        b=J2j81y7bkrF4L5+078ttjqmNpYiEctvRxkUf6zVzr8KaSuIs86Xaa7MmRRDTicGdqt
         118REhcT9x9P8VWx7BxSSq/NkRfrrFX7lmwHnCsawgiTvByjp53MdD7W6YMHVID2Lwfm
         IqpLA8ojWxtUesbfe96y35mBRnAIJ80u/0sLkrXWxzeRxqTL8bceRs+5bqYtLgD78B3R
         A4f88v1+E+KwvlO6vZFBMhe2Ud4rfN4XblEPqnyGALaAxIiS4+Vj9y7mX4FIy5SRxdmC
         biGDiTZ799LV/himQPagFK2I0WBfkiR1ieYGOykSDL678i/EGq/XrU3IQzqRCuB8vjqs
         rSkw==
X-Gm-Message-State: AOJu0YwqL2d8Gnyh9q2pqIIfR6KTb8H+c7jnx6W1hIV28AjSvTyL3OGT
	1ub13z3traBbUzaGYO8pf62Ehv2+xNO6dPwUv5v8MssSTZfoGPMz+p1NArU03Q==
X-Gm-Gg: ASbGnctCbKOUtiiVd+LT2YsKJDOd2/Brn8Iiq7i15RNx4/53KlK/Qvqc8pXTml+DKMR
	+3/OLgyAmhz4iNks8dACl6nhPPRkPvSa7rwwgw3qAVP0LFa26aumRG9AWYusmz2o6WXzQaKM1Uo
	TaUDnNVBKZxhx3zT8O1sQRnA+vhMvzL1csp7LZ8djkqyuO28bDT2tW/8xO7BTbe+8WYdg0MAgzg
	InGL746fOSLW6ZsglkCAQYpgs59VZal00JbHWpRKC8T3zomVKXv7fvFqJ0PYQ8xhZg/HEVgt1bg
	TSK5OIv4O5M=
X-Google-Smtp-Source: AGHT+IGgGVLlkjA9w/VtqNXWyqg+jv5tiTXwN8tN2Oz9Yo90E1ls4Xqit+S0t1EQxNnAyTSX36f2ig==
X-Received: by 2002:a05:6a00:858b:b0:725:f359:4641 with SMTP id d2e1a72fcca58-72abdab904fmr27560136b3a.1.1735067091430;
        Tue, 24 Dec 2024 11:04:51 -0800 (PST)
Received: from google.com ([2a00:79e0:2e28:6:3042:405c:6cff:1a37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72afb89fedesm630246b3a.84.2024.12.24.11.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 11:04:50 -0800 (PST)
Date: Tue, 24 Dec 2024 12:04:44 -0700
From: Yu Zhao <yuzhao@google.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Kairui Song <kasong@tencent.com>,
	Kalesh Singh <kaleshsingh@google.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-unstable v3 6/6] mm/mglru: rework workingset protection
Message-ID: <Z2sFzKmHPI0kI_fq@google.com>
References: <20241207221522.2250311-7-yuzhao@google.com>
 <202412231601.f1eb8f84-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412231601.f1eb8f84-lkp@intel.com>

On Mon, Dec 23, 2024 at 04:44:44PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 5.7% regression of will-it-scale.per_process_ops on:

Thanks, Oliver!

> commit: 3b7734aa8458b62ecbfd785ca7918e831565006e ("[PATCH mm-unstable v3 6/6] mm/mglru: rework workingset protection")
> url: https://github.com/intel-lab-lkp/linux/commits/Yu-Zhao/mm-mglru-clean-up-workingset/20241208-061714
> base: v6.13-rc1
> patch link: https://lore.kernel.org/all/20241207221522.2250311-7-yuzhao@google.com/
> patch subject: [PATCH mm-unstable v3 6/6] mm/mglru: rework workingset protection
> 
> testcase: will-it-scale
> config: x86_64-rhel-9.4
> compiler: gcc-12
> test machine: 104 threads 2 sockets (Skylake) with 192G memory
> parameters:
> 
> 	nr_task: 100%
> 	mode: process
> 	test: pread2
> 	cpufreq_governor: performance

I think this is very likely caused by my change to folio_mark_accessed()
that unncessarily dirties cache lines shared between different cores.

Could you try the following fix please?

diff --git a/mm/swap.c b/mm/swap.c
index 062c8565b899..54bce14fef30 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -395,7 +395,8 @@ static void lru_gen_inc_refs(struct folio *folio)
 
 	do {
 		if ((old_flags & LRU_REFS_MASK) == LRU_REFS_MASK) {
-			folio_set_workingset(folio);
+			if (!folio_test_workingset(folio))
+				folio_set_workingset(folio);
 			return;
 		}
 
