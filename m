Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56763016F7
	for <oe-lkp@lists.linux.dev>; Thu, 20 Nov 2025 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763637514; cv=none; b=n/N1x4q656EiDQb0ys3XGhxLVWpMpVejKzePJ7NZC+68diVCAJulFnPDyw3iesHf+cmLVbDlsBGfc7mve28IsGXekp1M2VBnKj5Kp/T0IHB3FtCyZrj/Z01KSpKIGxvNz7fR+40Do+y+dg0zz+9f9fmFI7lGAXdHqU2L4b8KRjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763637514; c=relaxed/simple;
	bh=tsPso5/yH80Xsnq0j/BeJf6ldqLV7g6M20nPurw02Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oy56NEkXfGC5ENua5ZcKHlE9K7yfNoVIcMNoM1/zMPOOKnfIaGtlzz/4NrRUISESgZ18b+RJKFWQpz/tkYgh9bnyDlgu3ChWqX6vk69GD5yaDUvfM3yyuUosp8ZNMveDO5QZcaZjYW1CutM2nGA9RMn3kUlekhP++b++R3Gwf+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmBOG2kh; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmBOG2kh"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5957a623c7fso164918e87.0
        for <oe-lkp@lists.linux.dev>; Thu, 20 Nov 2025 03:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763637510; x=1764242310; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dF/pjzfYykuLtKaPyJMWY8rSAkFJWU7DY4gOk+0f57c=;
        b=bmBOG2kh1zxQ8geQg5NXhXHpJS4ycDiQKB38PuwjyTTSDMxC68low04cVantPZdnEq
         jnHz9Kvvu8cCCLlm9i1WXwhDYYNV1x5bebhGdnnYjJ8b1Ej44xAD0KYTX4h9JkTUAdAy
         ky5A2vOmGZ7nlG2rsnCkoh3pPhgMxldN2QMAZGsIxdVMCzH6jBGNKXF/MCnp60dV6Ikz
         OPe0QHq4nU5ea/GA0i4ri3fQUaszTpXWnzN1ZF1ExmGhT4xSerBwQ9s57tJYqbU280XB
         t1NXKmWRtZZcW6ii2S6gcjwvRV152Mg3zms2lej8x1TBctsQTvHIMNZUNFVjitKJMGVq
         xXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763637510; x=1764242310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dF/pjzfYykuLtKaPyJMWY8rSAkFJWU7DY4gOk+0f57c=;
        b=E/4PMTomYMmmuSmzgQENbpC2mP6oWtYCLIFUhe7nPCRNhSwDN01NqwxorfmvQwR3Mm
         BohNFc4M37LH5Po8v2tLMxTDz52+wGEg1eDLExXIdcxCnznl7y7aFa5lfP8eDQRepubI
         jpXiYkoeGjF8ncPOjPy8tLz2Z5LDXGg1TPOelfsy3l9372ayZ72ODkZgeJARy3GXfjfG
         Skd2wxYTX4Qs3NtMZw/7yfN3hTuHyOuEz6ckbIWCSu6+b7S9OR+51um2hWUXWKRvVwVK
         2eIrq8eO66mEqAnVfX/ZPf1W2Nhl3llQTtoegX+ivCF3cqgi490virbujFMGuVVqeLd1
         W6jg==
X-Gm-Message-State: AOJu0YydSNImzCxysFeIRW8HG3FqfgeY73/1V4v0/0AiBjdTHeMiq6d7
	pPj81xZ/JsI9HWrxJR4EADoobiP+2Y3xZhwYezh+gKGaASTbEkWDR31R
X-Gm-Gg: ASbGncu0xXCSK0HqPwy8YvbwIWUGUuNNrt54Zb4+ygxt7JePbZ6Pt1qPZDWF4RRwTol
	o0e7RibjsygNtipTV5W9AIh9+mIJWjLGD5oApjWc7Egu/lPa8s9yh5Tu23gSUn96xrOXuqcnkwo
	shxI8aTZclWe1smG+e8IvdXp1UIeG3oMtOb7jrzenaxr9qtwnxgcd9DcEVNyB9alKMoQxrElg1L
	gR4TuuoP3Z1ZdtlazCpqoKTzzrFIh7VSqOLZtSflVCicHseXFJ8OHirHDNdh4YpEAGNLvWxGFLF
	SjQOUZ2PBBEBLnzhhLLRfDZwOLwL25vUi84scxwntIhorR1DiScGT1HMNdkadlb4ZdZMuvguFYF
	r6BogJURN7UESi/AzBSt+cR5gMtLA4iS2mhtHuXJrQ/cWk4230bjBBPAsIFY4F6kHXxdnm4++ry
	mSO0Lgql85nKXROEjzD3nJuJc2SZPf
X-Google-Smtp-Source: AGHT+IHCR6Hf7N1ShRtL3lk0u8guzOoW4/TZOFCA7Eg+GhA9B86BxUjN3JLFmeMqJd+MnnQjrtVoSg==
X-Received: by 2002:a05:6512:3d25:b0:592:f3c8:39d8 with SMTP id 2adb3069b0e04-5969e316a89mr487099e87.5.1763637509408;
        Thu, 20 Nov 2025 03:18:29 -0800 (PST)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75632sm601938e87.9.2025.11.20.03.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 03:18:28 -0800 (PST)
Message-ID: <9e066a2f-28fd-4da7-bca8-c10f7b58f811@gmail.com>
Date: Thu, 20 Nov 2025 12:17:53 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mempool] 022e94e2c3:
 BUG:KASAN:double-free_in_mempool_free
To: Christoph Hellwig <hch@lst.de>, kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
References: <202511201309.55538605-lkp@intel.com>
 <20251120072726.GA31171@lst.de>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20251120072726.GA31171@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/25 8:27 AM, Christoph Hellwig wrote:
> Maybe I'm misunderstanding the trace, but AFAICS this comes from
> the KASAN kunit test that injects a double free, and the trace
> shows that KASAN indeed detected the double free and everything is
> fine.  Or did I misunderstand the report?
> 

Right, the report comes from the test, so it's expected behavior.
