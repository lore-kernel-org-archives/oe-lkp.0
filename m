Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBD5253954
	for <oe-lkp@lists.linux.dev>; Mon, 29 Sep 2025 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759159070; cv=none; b=dj5qHvjnGyKj7g7pvMTQleglg9Awpn7xumfbRZMsRA8p4tf4Jry5eyOcKuEOYYx77EwC1NKHHrJPPlybNddmBn9yLEtvvjAMXVSHPXPTikaOQK++otqzHhploirGG7lHtRgZl9GrI722Nhg7nIIotFfZDTisqG2ZF9UhmxfXsjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759159070; c=relaxed/simple;
	bh=JVXLpMncXsK7lii3UJPA6maYlWrK0Wh8RIsE/dtvg5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cO6OaeVDBdlOa24SK07s3ajcA9lEDRC4rZI+kTRqUXYF0M/lPTBxIghf7NAWLTCo74XTfv3cdgR6Q+EPtF/yRMm1NyAxdIa4AofkKqvzWh5+YORdoSUJ4B0K4onZN7mOZgj5YjMhKe9UiEZxYj2Bv+zIb3tNZ8vjQvMRhALFL04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/UaiEgu; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/UaiEgu"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d60150590so47961097b3.0
        for <oe-lkp@lists.linux.dev>; Mon, 29 Sep 2025 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759159067; x=1759763867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvOyryAypxH3+4wG3KZkQ2EISvw8ZEcZIHjxhBYkRgE=;
        b=G/UaiEgu2CD15WrwLOMC9t+VaNBltAzUc8daVGIx3jXaYDBdfmI1JnemGI9jchdr4D
         tcIfRf3zdHK6lXdxgdnKo6np0PLXz8Arx8hu8YRL7FcrVr3RK4hu8IHCIMGQ1uJH1hN/
         LmjgeZtFpOgSBslzF5GgHodw3wEOveicru26OlSOthAes4oySfXZp+Ujhb44Zg5zmNmo
         n0B9z0J49U3l7kVIy2DqcvKi3j6FYCBfscaE4okfT9o2puAIwl9AwKMXDwpmfrmiHI8B
         FwOMwXvXOggmKlomEfCR1bztkSqcduoCs4I4uttn1A/DBzGQT2d20Omrdd6AxIE7ngoe
         6O+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759159067; x=1759763867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvOyryAypxH3+4wG3KZkQ2EISvw8ZEcZIHjxhBYkRgE=;
        b=qzO3pxlgtCjwN4tJkhe7zlGOSZeezDt5ZwR6Ce84ulM1o4Kfgjosajb2IIxdKpJvWe
         u9XwENehoeswpQqA8KQRd769t03GY2eZyYJ2tHJJx0IIfQmwTSfQEeLPZQ9WAHcfzwNP
         0H7Tfa2IdT6Ruyarisrrj+iC7WOLwQt6liATj1/5t8dmtc+nTWIU33AiQchRQiDf7ftj
         XgILClIHKe7SoURAz5TduqONJSIqalY9wAQnp3c4mA5KVqmARU3KHSsCSsuWC23RxG4T
         buRqABhoqOSQuuHSsrg8+J4/yQGtG0jFrOrwuaxGzmch+2x2GjDU2UB2slPBbvPqTqpK
         IYGA==
X-Gm-Message-State: AOJu0YwT05bFJpHQfcufsUbM82sbSXwjG7wPWb38f9HYF+3eGGuq+gnc
	9MujkkCxWtiwkwj5Z1JHwyvyAATTzTCxMMAhGmM9GmJa0fCKG/hvoaiK
X-Gm-Gg: ASbGncu955XV9U7nBIcpN2I0A/NQfdy7fD5yBZ0spkinKKDlNGiTI1ZiLzg7mfTnkf2
	nblME22zgwXA0NsODVE7vxYqvV7ldTk1QIObm8CLE1/q6MRTR24rna/2vIHu9I19vTuWG6X0SVn
	oWrqTEOhE1ZoKctwuVZ0qyTuhfPaX33iW5uPfUI8ZxRKl3+3qTLFr+lIja2dpeYU84d4HyJD5k5
	tAxKPOgxr275DwPpr3K2LdjpJrmu20TgQDoMoeNmCTgRiFzfHd92aIjlUgbjQnlmOepZJtBKVt0
	cbe9G8cbtcVFP42MEcEA16F0jXVjNDJ6LkGtdGDGXi/+3El8G+CtLectDqeBUqnOE6XWNltn1Wu
	BdayKAQ8vak+6cfO5OudRbz59Dd1pdV3p4G0nDyoGQ7ybCjumHZDchA==
X-Google-Smtp-Source: AGHT+IG03Xxr9FsAaNhFS/ao7nWzoRTl2e11K0kClHGJkJfFFVQCaVlVRxoehRsBF6M99SMNTqAnpQ==
X-Received: by 2002:a05:690c:9a07:b0:719:3e4f:60f7 with SMTP id 00721157ae682-76401288ea4mr191557227b3.26.1759159066447;
        Mon, 29 Sep 2025 08:17:46 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:5f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-765bd126227sm28968727b3.16.2025.09.29.08.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 08:17:45 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev,
	lkp@intel.com,
	Chris Mason <clm@fb.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Kiryl Shutsemau <kirill@shutemov.name>,
	"Brendan Jackman" <jackmanb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Suren Baghdasaryan" <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2 4/4] mm/page_alloc: Batch page freeing in free_frozen_page_commit
Date: Mon, 29 Sep 2025 08:17:27 -0700
Message-ID: <20250929151744.2922386-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202509281204.3086f707-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 28 Sep 2025 13:17:37 +0800 kernel test robot <oliver.sang@intel.com> wrote:

Hello Kernel Test Robot,

> Hello,
> 
> kernel test robot noticed "WARNING:bad_unlock_balance_detected" on:
> 
> commit: 7e86100bfb0d65a17f3228a9af4c2a49ac38f057 ("[PATCH v2 4/4] mm/page_alloc: Batch page freeing in free_frozen_page_commit")
> url: https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-page_alloc-vmstat-Simplify-refresh_cpu_vm_stats-change-detection/20250925-044532
> patch link: https://lore.kernel.org/all/20250924204409.1706524-5-joshua.hahnjy@gmail.com/
> patch subject: [PATCH v2 4/4] mm/page_alloc: Batch page freeing in free_frozen_page_commit
> 
> in testcase: trinity
> version: 
> with following parameters:
> 
> 	runtime: 300s
> 	group: group-03
> 	nr_groups: 5
> 
> config: x86_64-randconfig-161-20250927
> compiler: gcc-14
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202509281204.3086f707-lkp@intel.com
> 
> 
> [  414.880298][ T7549] WARNING: bad unlock balance detected!
> [  414.881071][ T7549] 6.17.0-rc6-00147-g7e86100bfb0d #1 Not tainted
> [  414.881924][ T7549] -------------------------------------
> [  414.882695][ T7549] date/7549 is trying to release lock (&pcp->lock) at:
> [ 414.883649][ T7549] free_frozen_page_commit+0x425/0x9d0 
> [  414.884764][ T7549] but there are no more locks to release!
> [  414.885539][ T7549]
> [  414.885539][ T7549] other info that might help us debug this:
> [  414.886704][ T7549] 2 locks held by date/7549:
> [ 414.887353][ T7549] #0: ffff888104f29940 (&mm->mmap_lock){++++}-{4:4}, at: exit_mmap (include/linux/seqlock.h:431 include/linux/mmap_lock.h:88 include/linux/mmap_lock.h:398 mm/mmap.c:1288) 
> [ 414.888591][ T7549] #1: ffff8883ae40e858 (&pcp->lock){+.+.}-{3:3}, at: free_frozen_page_commit+0x46a/0x9d0 

So based on this, it seems like I must have overlooked a pretty important
consideration here. When I unlock the pcp, it allows both the zone and pcp
lock to be picked up by another task (pcp lock less likely), but it also
means that this process can be migrated to a different CPU, where it will
be trying to unlock & acquire a completely different pcp.

For me the most simple solution looks to be migrate_disable() and
migrate_enable() in the function to ensure that this task is bound to the
CPU it originally started runing on.

I'm not sure how this will affect performance, but I think in terms of
desired behavior it does seem like this is the correct way to do it.

Joshua
