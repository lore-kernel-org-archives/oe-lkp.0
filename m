Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69793186E2E
	for <oe-lkp@lists.linux.dev>; Wed,  1 Oct 2025 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759334129; cv=none; b=tnQhiUYZt0LuWTR3iqb1YWPZE2cHDPND43X3eOxc/jFZKNakfJ7khIEB6kFmnjiwvCjILRmhd8ZayKdMHVrx6Xz3ewljqJfVj/ag/rXSeKz9XtEMrOMEQjQHkeGlTg0zCxu04e/NVsECeiId5wDtQUWNx940WnB7+9yRhkV/C0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759334129; c=relaxed/simple;
	bh=S9Jlzyfu+mgUXf2aDOVdgDI3fL8QyOpV/+Sk8Tmbbqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fC8Ru0YlFXD6L51A8TUM+1Yip8PgrVTXpTIHgL4Ql+Ck0DA1ZAfm5vo1QLHbG+KnTIYrEjYvzg7KAWaQUuCC7bbkXoeJXRGGYV+9/yAjK2N6+7f+wz81JCi3D8dWyQ8gYPLDCe9kB3h4GXdQ50aqHAbks7WcubFrRPvVTraqqCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4h3clC/; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4h3clC/"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d6083cc69so280777b3.2
        for <oe-lkp@lists.linux.dev>; Wed, 01 Oct 2025 08:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759334126; x=1759938926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lU3Gy/BQ6qxCUFWfpwnTAmYAtNG3wW0MiedBiSGq4AU=;
        b=I4h3clC/cy+oEeMJR/cJqYaJT7ZhIdE2KRLvJRB/GsSL/hiYD/KHXNQyTVUYQVywnD
         6lAk05tCDAb6rw3H3cnhvTlWBG6qqyVragNODqrCYGYlAyUyRrxaiThURLGv4o7F43OG
         vygkMUQOWFHD48MUF6Sc+QXVeqxsNnWc0egawNCbBQilAlyueSAVHqc1VYcVfaKv71xP
         nvogT0TtybqOCP2ZHbqaWiVeWjqaWa4w/idz8BYkyIduvmA9lQ9fm1qBLUqab85xijj1
         +6FFcbfXRD2UTRf/eO3OIfZFHYpQNRAUodMEoYNsHZdQ1uRpHQIIGp3BR36JMkw9pjQI
         RrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759334126; x=1759938926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lU3Gy/BQ6qxCUFWfpwnTAmYAtNG3wW0MiedBiSGq4AU=;
        b=BbCApYEBwtBEY3IQfODz9g4x7FAcqZHpCxkNZnnFcOJREA1gAZwckMf4Zd8B7pEvzz
         C3YeKJOQHdNWJXSw97byu6oFFPKu5RJjUD2jDyR15qj0uP6doqkU/hbDmYxGzNpepkda
         YUA0FikfNyRQM3oX0dh/To0F+sL9Wjsaxo8UVVHWYgwZGQogzNekWzEeBpwWV9gvYY4J
         dgEXUyFkSfpgZ9s50poImoUigURuLTDR6p7S7O7EsJOPlFMRUrrZIDAFQ+8q6yggAPz3
         d+BkgQRByia+4RKrPgGqBtCZcQsPv5LSwG+BsxnE2n0pL67QksvMIzoAXH90FwCrOHX7
         qtYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEHTOo0kvXJBaR2eEcy8x3yUaV6d5mGO/v/yKR4LSlzM3AByhb0lWvYrGfDgaN4qfkhuZHsgk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2n+4LNVoTxdYSm2OdygyjYvjs31aJpR/q1+2OgqF+xdPD/mkk
	9Y+VVTNbaugxlaHUreoYnVfUnYzIAMkNE01FCpidKUrs2ZjudWoWmJ2Y
X-Gm-Gg: ASbGncv53+F+iUF3P8QIA3w07qDsdurIgfgX8tsAgXnsr0A3WN4jeDYfSBvLljFuJHV
	KhJkjYCP2EbYURZkvsKhXGX3REH9SUKL5NGPmrbYZf3X6ZUo9YxtztPk5M9oXiqMfZvfXEA6g7/
	RfixZdyL2fHYMRZjQUmS3gDQu+4Ua/evO80B+EL5Uuaz7UErW052RkFX7Az9Ed2eXn23L9eR+Sj
	TLONvia33EbugOal/2zU9YVsfj7y3MDbuZ5fjJoESiaKYEgSsji0LJxEayrf0+3LuzLPtJwmXoD
	C/qKB4OPJRZi6tTOrTsVahoHp19A0dk1J385RrYu9AgFqLk+p8eXR0ftNUiLiFugbl1V7lCC7l4
	Wei4MiVx8x9aTiBXj5TM5Yd/seOzisIxcN+tLjfy3CdxGbSq90PVKqb2J1kv7Vhn+LFVusiCwYA
	2p
X-Google-Smtp-Source: AGHT+IGcvMSSDnIn1p0y9m8Zo+GqEbnRb8m2pFQ6BPHXmax+C4usDzFi2whoNJCFfyq5n7RDBATVKQ==
X-Received: by 2002:a05:690e:587:b0:629:e2b6:1302 with SMTP id 956f58d0204a3-63b6fea76bdmr4202238d50.17.1759334126258;
        Wed, 01 Oct 2025 08:55:26 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:2::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63b717fc8e3sm926585d50.4.2025.10.01.08.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 08:55:25 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <oliver.sang@intel.com>,
	oe-lkp@lists.linux.dev,
	lkp@intel.com,
	Chris Mason <clm@fb.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Kiryl Shutsemau <kirill@shutemov.name>,
	Brendan Jackman <jackmanb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2 4/4] mm/page_alloc: Batch page freeing in free_frozen_page_commit
Date: Wed,  1 Oct 2025 08:55:23 -0700
Message-ID: <20251001155523.2470826-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <689e36d4-d828-42c5-9e57-ba663adc9ea9@suse.cz>
References: 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vlastimil,

Thank you for your feedback!

On Wed, 1 Oct 2025 12:04:50 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:

> On 9/29/25 5:17 PM, Joshua Hahn wrote:
> > On Sun, 28 Sep 2025 13:17:37 +0800 kernel test robot <oliver.sang@intel.com> wrote:
> > 
> > Hello Kernel Test Robot,
> > 
> >> Hello,
> >>
> >> kernel test robot noticed "WARNING:bad_unlock_balance_detected" on:

[...snip...]

> >> [  414.880298][ T7549] WARNING: bad unlock balance detected!
> >> [  414.881071][ T7549] 6.17.0-rc6-00147-g7e86100bfb0d #1 Not tainted
> >> [  414.881924][ T7549] -------------------------------------
> >> [  414.882695][ T7549] date/7549 is trying to release lock (&pcp->lock) at:
> >> [ 414.883649][ T7549] free_frozen_page_commit+0x425/0x9d0 
> >> [  414.884764][ T7549] but there are no more locks to release!
> >> [  414.885539][ T7549]
> >> [  414.885539][ T7549] other info that might help us debug this:
> >> [  414.886704][ T7549] 2 locks held by date/7549:
> >> [ 414.887353][ T7549] #0: ffff888104f29940 (&mm->mmap_lock){++++}-{4:4}, at: exit_mmap (include/linux/seqlock.h:431 include/linux/mmap_lock.h:88 include/linux/mmap_lock.h:398 mm/mmap.c:1288) 
> >> [ 414.888591][ T7549] #1: ffff8883ae40e858 (&pcp->lock){+.+.}-{3:3}, at: free_frozen_page_commit+0x46a/0x9d0 
> > 
> > So based on this, it seems like I must have overlooked a pretty important
> > consideration here. When I unlock the pcp, it allows both the zone and pcp
> > lock to be picked up by another task (pcp lock less likely), but it also
> > means that this process can be migrated to a different CPU, where it will
> > be trying to unlock & acquire a completely different pcp.
> 
> Yes.
> 
> > For me the most simple solution looks to be migrate_disable() and
> > migrate_enable() in the function to ensure that this task is bound to the
> > CPU it originally started runing on.
> > 
> > I'm not sure how this will affect performance, but I think in terms of
> 
> It is somewhat expensive, I'd rather avoid if possible.
> 
> > desired behavior it does seem like this is the correct way to do it.
> 
> I'd rather detect this happened (new pcp doesn't match old pcp after a
> relock) and either give up (should be rare enough hopefully so won't
> cause much imbalance) or recalculate how much to free on the other cpu
> and continue there (probably subtract how much we already did so we
> don't end up unlucky flushing all kinds of cpus "forever").

I think this idea makes sense. Since I am dropping patch 2/4, the remaining
call sites here will be in decay_pcp_high and free_frozen_page_commit.
Here, I think it makes sense to just give up when it realizes it's on a
different CPU. If the new CPU should have pages flushed, then it will be
flushed by either the next call to free_frozen_page_commit (like in
free_unref_folios) or in the case of __free_frozen_pages, it doesn't really
make sense to flush a pcp that isn't related to the current caller.

One concern that I do have is that now it is possible to flush less pages
than the current behavior, since before it was guaranteed that the
specified number of pages will have been flushed. But like you suggested,
hopefully this is rare enough that we don't see it happen. FWIW, I have
not seen this happen before during my testing, the first time I saw it
was in the kernel test robot report, so hopefully it's not very likely.

Thank you for the idea Vlastimil. I'll make these changes in v3!
I hope you have a great day!
Joshua
