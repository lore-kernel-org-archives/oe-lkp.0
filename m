Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB5A189F36
	for <oe-lkp@lists.linux.dev>; Mon, 31 Mar 2025 11:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743421113; cv=none; b=K9m/dcMmj5mSwRR4gXHDYDqh/OJMQC95sRsbdEOfsLlJM+BpDAxGFJf+iC0vQUyky5+8TJ8bhaT2Xn8/O2GGM1RgnH6pVUVAIMGTpRDPhQJ3ZoKF6FqGnQpEjr5tQlsfQGqo+bPeKaoXaCCIMGenQ+zTyCSxnxRSoWcRnTgGoD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743421113; c=relaxed/simple;
	bh=EoDP3OicCnE++A549FBdPU3w+6a1KQPRm6nv9pFYboc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NQi7XMDts/9hohPNvGr7wKGfyu3JzPMG3nG1eJxNWa9T/n5t6foTRIIuWfPHuCn8CEShYZOi+kQePDp5pkb9zhWuD6gwZJWljVuQyI5Qv2NT16VDNX8WBBF6V1Aye4/TIIBXwgyMBGuvMuOhRbyuYa39TKZAIFFBK95/cWYRlNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlH2+qUG; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlH2+qUG"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso1091755a12.0
        for <oe-lkp@lists.linux.dev>; Mon, 31 Mar 2025 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743421110; x=1744025910; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xj1bgU814quVyM/ky61jphw8UbtC1cSMeLnT/5xJJfk=;
        b=TlH2+qUGiQHvch8my2vtQWU6iNf1XI0OWyO7YZez8ZAxgRhDQXFacAoUSFIoZ9vO8j
         plbHXWifiUzvriy9QLVeU4TxiNjXS7r2moT9tDjwQI+hysKt1JDn9CwMFbsnwo3Ulnb9
         TDRJUyujSopJUmkRKC+RdvUTgUN5rM0/kZ5WqH7d2Gr8cySbmpYXtrcKB5nCB0QlkpM2
         Ek+aROUFBUCvCMp0BkUi4d8aXU0R8298pfgEgRasZ3rFOhFJn2nnjQjIwKOJBhBfghW4
         0i27yuXdKP85HCbsFti7MgBXwmi3paWftLB1hYvxmB3VqA/soMYeh3v9nvbh9LlT4Uwo
         ljvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743421110; x=1744025910;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xj1bgU814quVyM/ky61jphw8UbtC1cSMeLnT/5xJJfk=;
        b=eiR9HIw3dmex6MgZBfvV/n8bwWtcv0nMJf0HTJVPjLOY/vOmclj6jfuYm7/+ojGHKO
         t3ulDzwamKtQctUDZPLscpi1YjhupRtbq/YqoUkTEBWldEOfhTT7UNcDe+oZSK9Rgkn9
         wdxZ3kgQ4DgN5MwTkbQbgHcsKS/D3xkx7yLwKCjwo/ERjepSiB3HgggodoLr+Vft/UwD
         1+KSB/EaQZN52d+TMq3Su6FYTaBL4k3Frxp90p3fYLRwYuKV554WWm/QR0I0EkCKM0Gf
         BcBHv22qJRTqGkb+8CWBHT50fFinTHxrmgmvlRbfDMXR6Fyf4COmZYQU4Q2k71EI6hzk
         nVzA==
X-Forwarded-Encrypted: i=1; AJvYcCUG0q2mykAC8yJIX+j8aUtdYHvlH7hxhiRKsnaFTcJmezea6pgL2bCbGEBQ5gciTPlxMBnE6fI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDICPcMLSXqTBjy99VfKkoS6qwm0kqYhuiKaPwTvR/X57M127n
	Kgb7N/hZUiaRZediqtH5DMuF9LhOYX7+fECSgTQfv/ClSnB6HPRU8ip4jQpFHzjTa9D0zP5vPCQ
	y0KEI7gYQYD151alTSy89ThQv5MU=
X-Gm-Gg: ASbGncseeALVEV1rnTe1QBr/4wNEhOZRY/mZ4IA/P+MrgtphEMdBFl2fLQFbISr3NFa
	oSLKPmULNtydBEhSeMMFpx8y8qpzi8DbTAtmHb36neNJ7hPf8nvJAnDDgtkyB3R3KcVquX6X5l0
	BFQniNrLgNrzpp+Z4SUeRCvCVT
X-Google-Smtp-Source: AGHT+IH4EplCvH+cCPum1blaYwrKk0EFMJycf7KxJW62lPXpcFY2bULuk75duTBa91M6joApAIPkbYTY9VU+SMGJZkI=
X-Received: by 2002:a05:6402:84c:b0:5e4:95fc:d748 with SMTP id
 4fb4d7f45d1cf-5edc44cbb2bmr10295874a12.5.1743421109907; Mon, 31 Mar 2025
 04:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 31 Mar 2025 13:38:18 +0200
X-Gm-Features: AQ5f1JpwQZaMo10L2m1ju7g1_SUzYZfbJSmZo0SCDbW0SPkSvqdzr2QwTCrWaHc
Message-ID: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
Subject: RFB: unrolled inline memset and memcpy
To: kernel test robot <oliver.sang@intel.com>, kernel test robot <lkp@intel.com>, oe-lkp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Can you guys please bench the following, at least on one CPU *with*
FSRM and one without?

there may be whitespace damage below, should be ez to apply by hand in
an editor though:

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 0fc7e8fd1a2e..a6f3ef7a67cf 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -181,6 +181,9 @@ else
         KBUILD_RUSTFLAGS += -Cno-redzone=y
         KBUILD_RUSTFLAGS += -Ccode-model=kernel

+       KBUILD_CFLAGS +=
-mmemcpy-strategy=unrolled_loop:256:noalign,libcall:-1:noalign
+       KBUILD_CFLAGS +=
-mmemset-strategy=unrolled_loop:256:noalign,libcall:-1:noalign
+
         percpu_seg := gs
 endif

-- 
Mateusz Guzik <mjguzik gmail.com>
