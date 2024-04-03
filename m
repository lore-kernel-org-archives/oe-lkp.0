Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0DE152528
	for <oe-lkp@lists.linux.dev>; Wed,  3 Apr 2024 17:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712164415; cv=none; b=DSWI8TbVt0cSKJbOaJ+QZ954SQ75jNL4C4r/GeVt/l2RD18GpATgjRYFOKoMJWTRHEULDvEPuyceLX5bGyvf6AC6Wj7o/Kr5khu8gm9tWTOPrDP/aMHmU4/ZOGcDnfSLSCxTL+VXrZmlDVAR6tbxhNGuhBfzJJxldRWSFOi3y/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712164415; c=relaxed/simple;
	bh=ATkEd5SFVajpuoZ2rqVnvccmk3MpJlIfcLl6fpKsCsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iF7goRcWU9Lca28Mfotojc1vdwsLOd2Ki+o3TWyHOLoquwsUk7k+ae1LcWt/6+FIngcTmY0H7HApnGmEY4HAXY1ToF15P9oVRy33tXPj8rp/sDppO5yO+wuIb60SLtzdeIYuFz282T6iewsQhd95GhjLs/TIetbwMfAxStfCWCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OI+5dsh5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OI+5dsh5"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51381021af1so169615e87.0
        for <oe-lkp@lists.linux.dev>; Wed, 03 Apr 2024 10:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1712164412; x=1712769212; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1h8tWfpp+qoRNsUGmPIOTJfrPR4EipvLdehDBLGG8i4=;
        b=OI+5dsh5PG5+OfR4xbN9TsSDJj1CVfZtL2AtOzzVyZNrakSAXz8PsweCvT83L+fVmd
         Q9KIt2SPn9Iry0Fxm5Zrn1XKkjoOy5L82azYC0jCusLQOWmL94Pc8JSbNLz1AQqNpUgz
         bTA5WeB3qonDCqH7SBIuLad0xsTjZptbxt89o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712164412; x=1712769212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1h8tWfpp+qoRNsUGmPIOTJfrPR4EipvLdehDBLGG8i4=;
        b=llzOVdUf8eFKOku7L0gD29AbSE9yB9F+jnZl5g+u8baF0ROXBQc/coCrqKCH2zmmzz
         QGbLEMbzQFzPGu/M60LBGcwbamqlmw0CL4qOvP4DBke/m2E5Ohaf+myCkwPUh8iBJOfT
         t3eIYLk/eyHF8vkJl6ZAZ4TfO5mE/P1H/P9w2kkC00WY8oNXJiXvJV88zz8N/ihvmYFW
         uR6C2FNqayf1FJNrHLQyp4OMQRN1aARd2BWIoiLjzj25p1X1019vGYeE7RMmxMJrUzrX
         orEvVqkzi6eGvpUclmVZImqAbxS70vrVAhQ7JtWlpNk99iGivvAJLrQuj81b5Zgh/tgK
         b5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQzizOaoqb8k1w/r026/Gr93ociCh50RhhJgXu9cSgaX6f2T1nqueFJYBKB3087ADWXMk1M52hzsb+XabT4fPpEsozy46N
X-Gm-Message-State: AOJu0Ywb0Ul2pgpPlKRtgitGmffZYRK2SsCl4PR+sIzHv+UdYdVDf1wO
	Ii3cghhgbY6k8kfax3RYfVakc27Zs6JKwM+kYrBqTbpfKWMI6/4fCHN3ZKpAocLQelsSpQJewrH
	BjazVOA==
X-Google-Smtp-Source: AGHT+IFTV6eZp8BaG1VysDFZ2umDv+N7HbO6oLeCBPNeuXf0I3QWfII45RkE3fy+q8O2wce8r511ow==
X-Received: by 2002:ac2:4e16:0:b0:515:8dd3:e94d with SMTP id e22-20020ac24e16000000b005158dd3e94dmr90815lfr.68.1712164411615;
        Wed, 03 Apr 2024 10:13:31 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id p15-20020ac246cf000000b00515b1b2c17csm2088302lfo.262.2024.04.03.10.13.31
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 10:13:31 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516c403cc46so152135e87.3
        for <oe-lkp@lists.linux.dev>; Wed, 03 Apr 2024 10:13:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHwAAq5aGhtzsonU7WjOYpHBDWBDY2UZC+Idia2GL5BagWe50gPFb+JbOB2EEJSD1NKvt4DAmbC1Ucn9NvVF1WkEiHFZVz
X-Received: by 2002:ac2:551c:0:b0:515:acda:77f0 with SMTP id
 j28-20020ac2551c000000b00515acda77f0mr110424lfk.29.1712164410669; Wed, 03 Apr
 2024 10:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404020901.da75a60f-oliver.sang@intel.com> <20240403122350.GEZg1KVvsyc-Z3bwro@fat_crate.local>
 <CAHk-=wj+Q_LXV0Y5+kBvv-5sTxT3Y7E=8wJ2sX4vzWksd3LWzA@mail.gmail.com> <20240403170534.GHZg2MXmwFRv-x8usY@fat_crate.local>
In-Reply-To: <20240403170534.GHZg2MXmwFRv-x8usY@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Apr 2024 10:13:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjernNvgonRC-W=_OF116facZf--vaYZ+QUnOkXm99M9Q@mail.gmail.com>
Message-ID: <CAHk-=wjernNvgonRC-W=_OF116facZf--vaYZ+QUnOkXm99M9Q@mail.gmail.com>
Subject: Re: [PATCH] x86/retpoline: Fix a missing return thunk warning (was:
 Re: [linus:master] [x86/bugs] 4535e1a417: WARNING:at_arch/x86/kernel/alternative.c:#apply_returns)
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 10:05, Borislav Petkov <bp@alien8.de> wrote:
>
> Can you pls replace it with the below one?

Ok, done.

              Linus
