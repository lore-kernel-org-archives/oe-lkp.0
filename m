Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E990390
	for <oe-lkp@lists.linux.dev>; Thu, 11 Jan 2024 15:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMy+J+/b"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e62979f41so1275495e9.1
        for <oe-lkp@lists.linux.dev>; Thu, 11 Jan 2024 07:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704985309; x=1705590109; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlU9CairkGmPdE7mvp0HFWtFNt4+Gjb65TjgR3sW9KI=;
        b=WMy+J+/bklOKV9D7SXB3Bqmp5iC3awfEb0PsZ0b13qILjZsbRfv88zrgOLps0Noy/y
         SJPoB2TJxNvs+XF0RFQZUCVwKvv7iOSf/glRIRzEWKWL0DFQFRVBLmIemT3T4RI86Sdk
         qq5qdXsDaPUAJ4P20CMEml3DiyP336Y+rny2POZ4cQ7mu985CKHxYl4YNztz8VIIWkDj
         yVK7vDfWRPc7kEDvQPOk020im+Q5FY8WnI9jaZZRBbkPWTslzB2beAri1RSgKDpUHtMm
         I4ifegpQFmKd6ZzOiIakPZsVUneDn3bBkXrn7rUOEWc0H8DyK3tL92r2zxVDvQwWP0iO
         /ULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704985309; x=1705590109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlU9CairkGmPdE7mvp0HFWtFNt4+Gjb65TjgR3sW9KI=;
        b=LAWuJEa4/hdXvDBZo6LQ5dg4tNoyQa3aWOTudqBmFGE12DPbS3Xfq4NZNN35iRdsdt
         tJvpUptY0GBo3sgq6CtMJ8PDQLKCrVHwWDP5cU7pZY1IaUsrAFbZgObBaE0L5HnWOTAr
         bGRwg2OcCRliLTOWpzCnJ0JWRZZ+i1VXr8YojfMFRiC1hmmabaMLDlT8DiN4O8XEU8V0
         GM/jGrlpUKkA51YB04ZsZ9ERzgNyEa00ZKt/zSXoNuBuZI+s4anHVEJfIzKqeikJKPJj
         sefvaADenl2jCMPX2VMtHpTcRBYx43oEE+m5XAQSa8fLAFXnOvC24U2n/yOH2G16m0pA
         pSWg==
X-Gm-Message-State: AOJu0YxgtH3m8BRW2dxhdv5I93hkzd1HZntIPFnzwZ3/zPC3sUPbin43
	kLAe6KhFdQ2c5783WOlan33NszzBh2OCywFNAHw=
X-Google-Smtp-Source: AGHT+IFc4QeDxDjZCAJ8PR28lluBukrSonJR5i+S0lw+3pGNGMdoJW4cFhXbrsFr6EuJWcoLvPnx8u/nBozbG7hTYDs=
X-Received: by 2002:a05:600c:46d5:b0:40e:56ea:d9c3 with SMTP id
 q21-20020a05600c46d500b0040e56ead9c3mr551988wmo.47.1704985308895; Thu, 11 Jan
 2024 07:01:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401111558.1374ae6f-oliver.sang@intel.com> <b1adbb1c-62b7-459f-a1bb-63774895fbb3@I-love.SAKURA.ne.jp>
In-Reply-To: <b1adbb1c-62b7-459f-a1bb-63774895fbb3@I-love.SAKURA.ne.jp>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 11 Jan 2024 16:01:37 +0100
Message-ID: <CA+fCnZcmxQn+hSsJf=WOsYX4HY4u4s=cRKje65pEcAQ5gpqANw@mail.gmail.com>
Subject: Re: [linus:master] [kasan] a414d4286f: INFO:trying_to_register_non-static_key
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	kernel test robot <oliver.sang@intel.com>
Cc: Andrey Konovalov <andreyknvl@google.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Evgenii Stepanov <eugenis@google.com>, Vlastimil Babka <vbabka@suse.cz>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 4:00=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Commit a414d4286f34 ("kasan: handle concurrent kasan_record_aux_stack cal=
ls")
> calls raw_spin_lock_init(&alloc_meta->aux_lock) after __memset() in
> kasan_init_object_meta(), but does not call raw_spin_lock_init() after __=
memset()
> in release_alloc_meta(), resulting in lock map information being zeroed o=
ut?
>
> We should not zero out the whole sizeof(struct kasan_alloc_meta) bytes fr=
om
> release_alloc_meta() in order not to undo raw_spin_lock_init() from
> kasan_init_object_meta() ?

Yes, already sent a fix:

https://lore.kernel.org/linux-mm/20240109221234.90929-1-andrey.konovalov@li=
nux.dev/

Thank you!
