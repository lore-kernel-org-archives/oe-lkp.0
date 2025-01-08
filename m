Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2EB644
	for <oe-lkp@lists.linux.dev>; Wed,  8 Jan 2025 16:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736353115; cv=none; b=UMgn1HW/8Mpwor4yl9lhIZmS9gHa5ECHPdfIhLDXXXoz9h7Psb7k+yMMGYaQEv1qm+/H79zy2BHezx7OHvGYlMmbo/Q2CL7UkiPs0GuKAgAjANwJk5kanmPR9ET3xj6kTdjGdJDRm0yw/XKkIWly8BDJyrOI0u3WX9wlSysZj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736353115; c=relaxed/simple;
	bh=gylkPPQlVTZw3aJsc8SSLHM6pzzgp7rUJ4lX065q/5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3mFsEsjKOCKCQYbo2JLEvb9LuuMD0YMu0JacnGmeOiEvaC6LRKu3G+vEHVbu6mPmlg2cgu212182q9WP1xna0BOkJZpHUuAaUOpxKdaj9Kv0o9Tw2DFYZLaXPk6L07Umyy0Ukgg2HSuPJ9khweE7B9pW0woHJeLLhweC+x6zZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CFxKQkHw; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CFxKQkHw"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dccccd429eso151786186d6.3
        for <oe-lkp@lists.linux.dev>; Wed, 08 Jan 2025 08:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736353112; x=1736957912; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYBwKedBpwUWC3cKVJBWMxPYf46S0f8VCDzmlfCe2AY=;
        b=CFxKQkHw6uyNZAflpEhoePToBn3QIMpUaM54InTQxTf6PZ1QANhfz6/DclpCz59QqL
         BTUWqIMRVcGH/y1cPXyPHFydhI1K4+qCmbjJb9p5XzJ4DCRhllVkdciBzReB8E1Kyqmj
         VHobrP/xyYhp4ybEmSQdMN+woXMQd0cC280zgdRhL4g6VdQfzMpOYl97xDkQjHFTlXDf
         Js8fEqVJAZoIzKOZ7eJ5QJmnithkaM88UZaOvDOqMgIAk5McN6qKtVuj4en6BvRbX6Ls
         rHxgLtQnNXJ/JsAOg1SxadSWQg5a+p2XG92uJ0x+EmJ7MizfLwDb3QA+kL6LlMbtSnAL
         1oQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736353112; x=1736957912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYBwKedBpwUWC3cKVJBWMxPYf46S0f8VCDzmlfCe2AY=;
        b=YLTdkWa8pC6onDkZ5hiDLQXXpOhU3dPkFVXPDZjZhIpTPtshYY7xzmCDzvPVfQlQLy
         tCwpD3XJ0EKITB1O14Q/gPregmJvusYNJi1DA48WMTmF6baqMVH1do4tKJ2ObElxHKrP
         LrpsU+ny4tCC9uFZocg0i/8yB6Zpeq/zNcSTVQ2bdl1nto5MpfuA2pblHJEc251ENFdC
         u0Uj6lb4yRO0j4CS7bWVdLnzM8dV/puni3eJupfW6/TKBVHnxMWzPufPzAUs5Ki2yToN
         VX4iEw5a0nHzGYsC0IzJEvUM+MMunQT3WaqfvgBFPF/kZQ3KNZGHeltx+7FJidEyaEMK
         4i0g==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7yotPqpTquG3BjiHYas6ZGTNC6YDS3KJMG3tOZHBxXjmMUFwdyok218eiy2acHUuJvRtwLU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxklnjl5Jvyjlle6I1aRmpv0Wu0P78T5xSLwYnj0VH8cP3blrg3
	glSAXc04HKFFwBPKNP8wuiSTnnoxS7tlAI++3cGp2hb8VwTL2GDkV1I2TZQWinXvsjhi+Zbki+t
	R9sy34HbKn/OzH7SlqqTxERoDqQgvLCCzxwQ8
X-Gm-Gg: ASbGncurfv8ytkUNpFoc1UINjfWrqOsMotWeCX6rcJZIp+E4Svz/ko0omDHkSDIzpl7
	ZmcyQvh1+NcuuRMrdwN324s543Jl/jhIF1e1tNw7Z3WEdhcR4F8WcLd9FtBe1rxXjhJ6m
X-Google-Smtp-Source: AGHT+IGna7ysgqwsm9WrEfuJnpWy3sA0NVsD8m4hmIoUEcuI09NP0w0uyKMh2xqkXkDx71OTxFPCBI2czzTqKExI3bc=
X-Received: by 2002:a05:6214:4a0a:b0:6d4:1813:1f20 with SMTP id
 6a1803df08f44-6df9b1d1fdfmr58811076d6.8.1736353112313; Wed, 08 Jan 2025
 08:18:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501081209.b7d8b735-lkp@intel.com> <CA+fCnZfkMuk8dtk+5_7DK_h0Pxv_JNgJDL3D-8pBXOByzVOtzQ@mail.gmail.com>
In-Reply-To: <CA+fCnZfkMuk8dtk+5_7DK_h0Pxv_JNgJDL3D-8pBXOByzVOtzQ@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 8 Jan 2025 17:17:55 +0100
X-Gm-Features: AbW1kvb77COVvgnlxkmKtvn-ildT60hL_do9GKSf5jMr2fmOWX3EeIvrl7heeRw
Message-ID: <CAG_fn=UKrpQCQu__nJ74C4xqn5VOcYRc+hbXX5wwmLcR3oKdeQ@mail.gmail.com>
Subject: Re: [linus:master] [kasan] 3738290bfc: kunit.kasan.fail
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, Marco Elver <elver@google.com>, 
	Nihar Chaithanya <niharchaithanya@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 5:03=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.c=
om> wrote:
>

> > [  118.348258] CPU: 7 UID: 0 PID: 3613 Comm: kunit_try_catch Tainted: G=
    B   W        N 6.12.0-rc6-00221-g3738290bfc99 #1
> > [  118.359770] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN, [N]=3DTEST
> > [  118.365490] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS 1.2.=
0 12/22/2016
> > [  118.373542] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [  118.381677]     not ok 4 kmalloc_track_caller_oob_right
>
> +Marco and Alexander
>
> Looks like KFENCE hijacked the allocation and reported the OOB instead
> of KASAN. There's a KASAN issue filed for this problem [1], but no
> solution implemented in the kernel so far.

If for some reason we want to keep both KFENCE and KASAN enabled on
that machine, we can use is_kfence_address() to check if an allocation
in a KASAN test was made from the KFENCE pool, and repeat it. This
won't look nice though, because we have several different allocation
APIs in the C test module alone, not to mention Rust.

> Perhaps, it makes sense to disable KFENCE when running the KASAN test
> suite on kernel test robot for now?

Looks like the simplest solution for now.
