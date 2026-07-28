Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7881F427C
	for <oe-lkp@lists.linux.dev>; Tue, 28 Jul 2026 14:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247804; cv=none; b=DS/n/rBKOPyrSuvq/Yq5CVp+MjR2Yvfr3fVgEmIGkJqVj+68M9Wm6FU/MQZhg7lb4ILHO2ZgQL51uAQ7+l+7O1LMZONtGZkZaihqIq3HJQIrCi7Bq846fp3gTL27VqbAxhBwhf/naHqV/XR/s3wrXcHMY2+8pk62qdTqZXPWEjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247804; c=relaxed/simple;
	bh=gRX+ywKIwU9OmqjBDAsui9Hd9CKC+9id0Hc8y1CHwtw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JhF0CMonNB7VhqHHZoUWoZTCn7HUWLnilYd1hqYLG42nbxNEWjtH8B2FGD527VQTBLHvkbfj6NYWJI/wvtalvG5O8O//h0oUPDLF2p5bGD47WOJSSGkDpXLfK/P5YyvfVC25auAwe+g3iDUbwkc04ZXFC8FHiESGopyr4NqCV4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Peh+cmAC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Peh+cmAC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so42026325e9.2
        for <oe-lkp@lists.linux.dev>; Tue, 28 Jul 2026 07:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785247801; x=1785852601; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YrD8ygHhYerz0DEj7rZWmow1dfxEDcUpsFk06vyQsjE=;
        b=Peh+cmAC3we0pRNBnuhzM+NqwOvKZa8XNl269PljM49RgIqT/8bkB/DcenWcn+X3cr
         j1T3dxHdI2C2QfnHw2hMygrMyAcAm3lNbwNSjiQ9Zhz0H8wfNizPqD3ueEP+eBqXMOMx
         NxpkclD0uAqzl/X0VPose2flpoOIdR2i3poLb8GxDSps3Tjj/+FOFA7J6kwtZJ6z7iMs
         2+ZZlq0ygeTd3qaWwO1uq71nM7fwlINU+r9SH+qsUfBW5S+7tJsOrusm3Ys7UA6kOsyG
         QwAamQdtS4lwdkc927vK3Z1iDqNE5vuIHI+kmbEAzBZCe71259WnJOBpqM9c0AcmfHzc
         wEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247801; x=1785852601;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrD8ygHhYerz0DEj7rZWmow1dfxEDcUpsFk06vyQsjE=;
        b=XJRXvsiI+QL5gZX8/PDZP0Sa+Zj8KPkwuiIawcSABtEtlE7Rqn60fj7AJC5ZYjA0bZ
         vfCCRDHwi76olhQ7CXHbGxh4DCMpKkg/w6pMEPV1oMocZZy5afsd8IdgGvhDJ4JL6GDM
         VoZrQ5yGrR1iq6bYjqw41KALOik8yOgBLQRqVjkGfkMJRC8G8sgQeHJAho0P+6AJchiD
         IVhJmkz8ElCh+6U8mYoAplPRraYXpCgYcj+mY2JoB2WAvJeVjXIv+zDjyHKS6g+k0yvA
         lwfk3h8rk3lotasslm9++KzLBMcD+HDQdS6aggu5ZHLYamqRfGKyMwZpDZURBKC1Fy5+
         Gpyw==
X-Forwarded-Encrypted: i=1; AHgh+RrRTbrBRc3Xk+Fxqzm9JASNPoDt0v5dtVcqhiB8nw1TwRrFaQLEWdwc3GWZyS9zTXo7ZfIYQoE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwzvZkHy3/Wlql3BBFoOAxV7LQS4pVEKlMBrM3Gec72q0XUcw1
	QKwFNlrkaXpSgrK+DaM6Xw5y5NdjxwEjRQHRQwJcGu3n+vOqVfAqr4tO
X-Gm-Gg: AR+sD11NEIqy+k0Dd0sL0WahoNxY53DiNgUh+Q+66i92OhYLitBgfKGVd9oYkG/yGro
	R+qbxCSBacpqPXW53hxg2ZSmGX2s1wHgTAR90YYL+eNoyS3ucpWysjrPB0P9qbi7Kr7fWZVsfmO
	9tYiZap/3pPAhmAwQNEZnUO2RR+swZ+hVF8AhA095SVFeAP5yMinBhQedY7aR8jT431uMSlvKeP
	l8LdC360L0jHp5oK57E3oSBIqxYRUzEAVuC5J/4smPrQM3X3mabnFZHMo0NVlqnYfrTWdnXx0X5
	O2+EIIKiVlYJ+64y2wHC3suIyWRbt5E30Yu1L3aoOpLLRY1bMOE610KERjIlmbc6VrYH1UD0vpj
	y5sVeS2oHV2XFF2+HdoCbKeN3x36hDyZePEZb6ApwIntqI/s8C/ttC9LEiCewQmCSzXLrK7A9XU
	vardfkm+3f5cEh9axWF7chkKe9FYr8Dx7uPkpbz6omrdYDoyLZrRV5xT7fQkZLyBVgDysoTSGay
	yvNtg==
X-Received: by 2002:a05:600c:a44:b0:495:4856:2659 with SMTP id 5b1f17b1804b1-496c6439442mr28377265e9.9.1785247800886;
        Tue, 28 Jul 2026 07:10:00 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b1c2asm82737265e9.5.2026.07.28.07.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:10:00 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: pfalcato@suse.de
Cc: fmayle@google.com,
	jack@suse.cz,
	akpm@linux-foundation.org,
	david@kernel.org,
	kaleshsingh@google.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	oliver.sang@intel.com,
	surenb@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: Re: [linux-next:master] [mm] 7b32f64bc5: pts.svt-av1.Preset13.Bosphorus4K.frames_per_second 45.8% regression
Date: Tue, 28 Jul 2026 22:09:42 +0800
Message-Id: <20260728140942.3849047-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <amiCX6kcQneMZu3-@pedro-suse.lan>
References: <amiCX6kcQneMZu3-@pedro-suse.lan>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Jul 28, 2026 at 11:33:22AM +0100, Pedro Falcato wrote:
> > With my conditional approach:
> >   At step 5, vmf->pgoff=896, vma_pages_left = 1024-896 = 128
> >   128 < 128 (the condition is false), so _max_index stays ULONG_MAX
>
> This is exactly what we're trying to solve.

> > The key point: when mprotect splits a large file mapping into adjacent
> > VMAs (common for ELF segments, or read-then-write patterns), there's no
> > benefit in preventing readahead from crossing the boundary, so the data is
> > still sequential in the file. The limit only helps when we're actually
> > near the end of useful data (within ra_pages of the VMA end).
>
> This is completely missing the point. This change tried to back off from
> reading _anything_ past the VMA _on purpose_, due to ELF file spillage.
> This patch reintroduces spillage in a very obfuscated way.

Hi Pedro,

I understand the ELF spillage concern. However, I think it is better to
distinguish two different scenarios:

1. ELF segment loading: .text is typically a few hundred KB to a few
   MB, access is random (e.g., instruction fetches jump around), and the
   data beyond the segment boundary (e.g., .rodata padding or another
   segment with different access patterns) is not useful to prefetch.

2. Sequential mmap of contiguous file data: SVT-AV1 maps frames
   sequentially from the same file, and the data beyond the current
   VMA boundary is the next thing to be accessed. Same applies to
   mprotect-split regions of a single large mapping.

In your earlier message on Jun 18 [1], you noted that SVT-AV1
"progressively mapping the file data for a given frame" and that the
old behavior of "page faults for a given frame starting readahead for
the next few frames" looks "reasonable". I totally agree, and my patch
tries to preserve exactly that behavior for the sequential case while
still limiting spillage for the ELF case.

Here's why the conditional check still handles ELF spillage:

For a typical ELF .text segment (512KB = 128 pages, ra_pages=128):
  - First fault: vma_pages_left = 128, 128 < 128 is false, no limit
    (but ra->size starts small, won't reach boundary yet)
  - When readahead ramps up and approaches the end:
    vma_pages_left < 128, _max_index is set, spillage is blocked.

For VM_EXEC VMAs, Frederick's patch already has a separate code path
that unconditionally limits readahead to VMA boundaries (the exec folio
order path). So ELF .text spillage is already handled regardless.

The regression comes from the non-VM_EXEC sequential path (mmap read
of data files), where blocking cross-VMA readahead has a real cost
with no benefit, the data is contiguous and will be needed.

The 45.8% fps regression and 870% major fault increase are not
acceptable tradeoffs for blocking readahead that would have been
useful. My patch preserves the anti-spillage behavior for the last
ra_pages of each VMA, while allowing the readahead machinery to work
as designed for the bulk of sequential access.

[1] https://lore.kernel.org/oe-lkp/ajQbXthzbr9xgUIM@pedro-suse/

Bo
