Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E7A3AD530
	for <oe-lkp@lists.linux.dev>; Mon, 27 Jul 2026 04:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785126044; cv=none; b=JL4VaM76IBDUn9vyumfcaQNwavD8FJzYE30cr2rlzWOWPdJLTOIvYBT30VqwSjbMR01nVecXJXCCpJOcZ7YRpcZyjirraM70lTxWLzHxTvSNlpi/eSBh9XKFg5JQ8KQ7W3uMm17b09z3MW4ESg08zS0Oqg0Ibmdd6oywnba5ni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785126044; c=relaxed/simple;
	bh=aWBy8MvcQBe7wO5IRYjsDNmzmbd0f6EfpSRDMgJ0Y3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxwNbzxkBVus+YL68FSzQainGuLs8o05ZJJqFfCCRGoEYrXFBDjO3cY99LUqMgxFMPpjgDdeFpiPKJKxR3hZjXbGs12A9ei+wj3Ip1j2xE4lrABcZ6+L2AQjO1pCjt2OxrGetOa1rSXqd+0nSWBlQ5VP7YMQXMsB3SgLF0K/XOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+izJhF9; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+izJhF9"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5276d598b96so13977851cf.3
        for <oe-lkp@lists.linux.dev>; Sun, 26 Jul 2026 21:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785126041; x=1785730841; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HRtjz77w8Vz7f1z3O8tUeRdMvuT4xbXaziStD0dymQc=;
        b=j+izJhF9ytTTwVuQQdy3LG68G4o0wBCMaJEsR4QaprVWJYoDSwUwAcDsruc1Yp6Ihf
         V7hYjK/63Ixdk/+0yZJf63cVXxHs+zngsc6jPfV4iXvqM8iD4MAYCEwkrE83EuzOvWp9
         Gts18DoS6xm53Wn0wbASz8sGySNd7QCEJcILTjXZgBMyfemqxXnk5cxHh9CrNQIoQsg4
         ssp+IvODaWc/vGwvtNpKKH+Ii2ypFDUwW1qwX6j0gp8OW4tW+Y1w+55cfXxrTX9ZWo7L
         dQXlcjd7DfnJYD+zFn1ijC8AzEHmX7cyUfGfCSvT13Bx27bbxLXDVffuCYhZKoNIidid
         nrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126041; x=1785730841;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRtjz77w8Vz7f1z3O8tUeRdMvuT4xbXaziStD0dymQc=;
        b=PPlDRzXOjW2G5NZzikwPcsqSbg9q4F5/ndpabyRCqKCOngwtaWotDoK9CZi4QdqO1M
         VaULtsAXTKI9s06bKSWqBlwo/lwJ5liLvL5ZjjjV5JYr3UWgDuJwOkD5wn0uRy+NjwY3
         FPuSZuaIl5HwOGe02+uk5y7SCQ4DfwUaKZ6pkex4mRoUg6kpUBLvO+1tlkuZSclEoYpU
         k5acmDra0K6IX4X0iS808vuFzPVIh7yTdKBcNktRZW7mexd+L/N0ctxxE1XqkCLZt161
         E1OXzsg+z/H5iLP5/kS1ZSp45iaIFgfVV5a0SW43XPmri4iYoJ8HlyQTbKOBRj2gurr6
         07bw==
X-Forwarded-Encrypted: i=1; AHgh+Rpg7KgN9b3/1ge/bf1evkhlxlatVd91jEZ8qf0J4fotUlRLuT8O4xYOrRhv//59FZ40qNRoAL4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFkKnIgLeeJj5OOErOEoQ1dUfAoI2yT2QoDCJWtVxVt6CnHy6n
	ERw7K5BxBff2etrp+P0GMFIlrNQYPA6JkTgLbMn33nVtEO7f7GnFIUd8
X-Gm-Gg: AR+sD129Sxju1sCBMtIji9Tb3Z9YFmTa30DlSvk0kGW2M4/syFiuiP2Q+Ya6KwEnr1U
	w4lBQh7LMtegv3MUY9wAu2wBl9+LcJ/sRQZRXsBCuUutvP+9OZyaf2rnRu+tFbSUKFk0ild4Uo1
	FGpUxOb1O15tqSuSgLcyEVMpQi19uHeROF4/oDvixMk9qVObrk4L3S3RGdaik2e8ite/52CF2cn
	eLe1U4/kb6RpLW2QSytuytqR7ITx/bzZwcnuSGKHzh2eZj/+kF9WeYL53TaIir0DfFMGf0ln5xf
	2jzEB1iP99E2Z68eE1uHbU9utz6cjr14bkdXVIUgbluylYM4l4lFo3u5Obrg0D3fVLXGBtIoRGI
	cgL8qFBlRghR3GMOX0p2xcliddxPbvg+lvAq96BFluAGcr6h/fw8/n84RZErUmPgGYMS31KX0C7
	Uus/Z2tvxsNnAumA8Zm6d6AaKSm2IracE3SwWkwZ7zeF23ZkYWOrDibc0gvRKz3yAmL85YlRhRv
	oWjlBYe9m86x+Dh
X-Received: by 2002:a05:622a:120b:b0:521:5c5:f986 with SMTP id d75a77b69052e-529a84c3c59mr70062121cf.33.1785126041192;
        Sun, 26 Jul 2026 21:20:41 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a27cdc4csm46594951cf.2.2026.07.26.21.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:20:40 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: oliver.sang@intel.com
Cc: jack@suse.cz,
	akpm@linux-foundation.org,
	david@kernel.org,
	fmayle@google.com,
	kaleshsingh@google.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lkp@intel.com,
	oe-lkp@lists.linux.dev,
	surenb@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: Re: [linux-next:master] [mm] 7b32f64bc5: pts.svt-av1.Preset13.Bosphorus4K.frames_per_second 45.8% regression
Date: Mon, 27 Jul 2026 12:20:22 +0800
Message-Id: <20260727042022.3503727-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ama/sQIK2O0MphL1@xsang-OptiPlex-9020>
References: <ama/sQIK2O0MphL1@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Jul 27, 2026 at 10:17:21AM +0800, Oliver Sang wrote:
> quite sorry that we lost the machine we reported this regression, and since
> pts running need some specific settings in our test framework, we still need
> some time to setup on other test machines, we cannot start the test soon. will
> keep you updated.

Hi Oliver,

No worries at all, take your time.

I should mention that my patch may not fully fix the regression reported
here. It is just based on my analysis of the code path, but I haven't been
able to reproduce the exact SVT-AV1 workload.

To better understand the issue, would you please share some information
about the memory access pattern of the pts.svt-av1 test case? For example:

  - Does SVT-AV1 mmap the input video file, or use read()?
  - If mmap'd, are there multiple VMAs over the same file
    (e.g., from mprotect or partial mappings)?
  - What is the typical VMA size relative to the file size?
  - Is the access pattern sequential, random, or a mix?

This would help us understand whether the regression comes from the
async readahead blocking I described in my reply to Frederick, or from
a different interaction with _max_index.

Thanks,
Bo
