Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8694D13A
	for <oe-lkp@lists.linux.dev>; Thu, 11 Jan 2024 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i/sAA4m6"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bbd7d60729so4544180b6e.0
        for <oe-lkp@lists.linux.dev>; Thu, 11 Jan 2024 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704985349; x=1705590149; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AXxf4IYdHRNOCXV3BfrCT7sMwSBwZiXUq0fFiawq+m0=;
        b=i/sAA4m6RZ2L7Vt6wOX09NEl9C6OdOc0WKKyByz7SI/tx560hdHP8WwaqMgvffF+Gc
         YFCqIbkDRWQ6kaxKcLEFvPEMyQa4trOlE8nzMxe78otfdysLnLnL7B1xBSzuIQmPwjaz
         7M6E7wSZfNBDHqqw2At5cl8cvYpVTmFiR9h8GW6eUuEwdZd2AzIvChqKoFrENgRaTqJp
         V6Iafi4N5SCaod905mnL2hmIhzGTEUnaIRyNjD5n+GvVB2h9dkKgthWDYkpcHUMpdLVr
         1cWtMdAV+Qrg6KRfLeya9UaAp0AX0O6BGE8xfOQdXC3MCge8s6+PwvG9J4X4pRjBPBVA
         fnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704985349; x=1705590149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXxf4IYdHRNOCXV3BfrCT7sMwSBwZiXUq0fFiawq+m0=;
        b=mUY2H9PBwPJxjJTPxdx1NyOa5fC5rWuPFFCq1orFYHoCmvR0qbcZFv0dtq7opohGR2
         6oAKUtDqh1uUXk6hnJ2kbtITGIcfOA1OPgrGxAYhgrL9Nw5knoURJBmMHNboHzGD4t7R
         Q5KzGlHkqtvwbwA7TCm2yM01DYAZQmdTWd9XAgK5N5N6yw6bkyQwaf3GBnz73cyRw7ka
         HoMhmzBdej2cSEiSNOoY2KXuIxFDjtnWtYAw7mMq5q+Rxe6mjyPOh3zQ1TRM0QFV4Jg4
         8l2ufTrDXyn24sgFOQr49Gw6+WAGbrVNAkk3RBl713qfktH7zaLGoGIuV8rkExaBiSS5
         JLkw==
X-Gm-Message-State: AOJu0YyfS84bofwV3U3TAWTmMAZ2lcgn9wD1JcsMXHkvJ+PKrwn51Xu5
	K13RMowc2ZBRuebALLyt/DFF5auxdTNVrkE/drgYuRqNv3Xp
X-Google-Smtp-Source: AGHT+IF93tOujgWbRonD2nfYrfu+/PBOD6H5SB+QWbotDoP6sUofoL00lp3Jp385fPeLA0Ayoam+fRNgK03LqW/sun8=
X-Received: by 2002:a05:6808:1152:b0:3bd:59b2:93fd with SMTP id
 u18-20020a056808115200b003bd59b293fdmr321214oiu.68.1704985349083; Thu, 11 Jan
 2024 07:02:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401111558.1374ae6f-oliver.sang@intel.com> <b1adbb1c-62b7-459f-a1bb-63774895fbb3@I-love.SAKURA.ne.jp>
In-Reply-To: <b1adbb1c-62b7-459f-a1bb-63774895fbb3@I-love.SAKURA.ne.jp>
From: Marco Elver <elver@google.com>
Date: Thu, 11 Jan 2024 16:01:49 +0100
Message-ID: <CANpmjNNgCt0pByJhEhViyCQXk_9_1a-KfVjQcx4rSFZtuZNe9g@mail.gmail.com>
Subject: Re: [linus:master] [kasan] a414d4286f: INFO:trying_to_register_non-static_key
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: kernel test robot <oliver.sang@intel.com>, Andrey Konovalov <andreyknvl@google.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Evgenii Stepanov <eugenis@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jan 2024 at 16:00, Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Commit a414d4286f34 ("kasan: handle concurrent kasan_record_aux_stack calls")
> calls raw_spin_lock_init(&alloc_meta->aux_lock) after __memset() in
> kasan_init_object_meta(), but does not call raw_spin_lock_init() after __memset()
> in release_alloc_meta(), resulting in lock map information being zeroed out?
>
> We should not zero out the whole sizeof(struct kasan_alloc_meta) bytes from
> release_alloc_meta() in order not to undo raw_spin_lock_init() from
> kasan_init_object_meta() ?

Does this fix it:
https://lore.kernel.org/all/20240109221234.90929-1-andrey.konovalov@linux.dev/

> On 2024/01/11 16:29, kernel test robot wrote:
> > [    1.582812][    T0] INFO: trying to register non-static key.
> > [    1.583305][    T0] The code is fine but needs lockdep annotation, or maybe
> > [    1.583887][    T0] you didn't initialize this object before use?
> > [    1.584409][    T0] turning off the locking correctness validator.
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/b1adbb1c-62b7-459f-a1bb-63774895fbb3%40I-love.SAKURA.ne.jp.
