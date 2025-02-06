Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23CB1A9B5B
	for <oe-lkp@lists.linux.dev>; Thu,  6 Feb 2025 20:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874735; cv=none; b=hlPGLxDt1N1xATqjKvnSh3lhD3uaXhBVX2rF4t+onIKq5JQf962D2ngz3emXZ2TfP59sbeSSVp/HU57fQe2CktNHj01EsXAFBAW3H7Vok3Ftej6/5wVP9AoDgA/05saODqCCheBF9wtViwkf+Pzi1foLnwq1eBQLDSwOowF7SX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874735; c=relaxed/simple;
	bh=pfVdOI7zeX3QZjonU0bDcxUgEVXtWcwPpFzM+WZZo8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSUGwP3Uw4ho+ILEahqArxrZ/FJE42E7/Yrkyf/IyhCkFxHVyZ+gOrqt/FuD0ok3uLUiyqmALD2mjjsysdd85/bJz1vPhQKeR+uv2tDmBkJJSxLp93Qi9tqOcya+l2Aq9Q2OrQSSaUy9Ce0p9nLUFSqfu0kM06d5cyN7Tb6+Suw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hrexaN1n; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hrexaN1n"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso1256908a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 06 Feb 2025 12:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738874732; x=1739479532; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47JwpRHSzZnwFr+mlMdiSA0nMc8sUlKLRRzJ0WxNtMg=;
        b=hrexaN1naT1QRMtV520+ZBOY03ONQHxedobsvH5RLKra4CvG8m1iCYvi9aNW4TOUcf
         Z3gZtKQwsE5y2/Evj2eX736AA+mTVr9IdW5r/mDgdMjT5261aUHhxVAkji2lKgT76Kjw
         /iNgaHhHUsd8Vmju4rNQb7T3jLNsc7+FZNUQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738874732; x=1739479532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47JwpRHSzZnwFr+mlMdiSA0nMc8sUlKLRRzJ0WxNtMg=;
        b=ajnN9O7/Z14CX20QYQZuqgO4N8Z+rTxOVrEdyrhKyTYiLoE/kHACFdh1w7nj1tESNZ
         fMHyt/NQBCPeU29UF13Gou6X22LcvSVltz4Eh5TTJe2UJJIWvjHS4Yvz4pfWWmBnLH23
         8gBuScFI9xXgqKdWG+VK/gnixCoLoq0hU/n7FlpcBJFEDKQK3HK0U8cvybfGv7RoTP7O
         SptCYGqCaHUqL/qHLGLfEGB8Ep+BorLH9iVHuMZWu8/uTQv8K3gsjgxW4lNwO1m0GK4L
         MFiRFdp+BNzoUtkt7bs/be1v7JudqPZNzpmdNI9XcJYZPLd8u62y5dI598k9vgG1GREo
         TD9A==
X-Forwarded-Encrypted: i=1; AJvYcCVz8dRv6qiTGHku6FvYTM2A2+1P8au9Fw1/9s50cyOCg0DdlCxNgj4h3QWT1LzAsGWfYagp8TA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjM0utAXiX8ebdB5dH4x/dHmZznvem4xrWK3b09q+cGzopJSiy
	KWzn8FhYqZcNLh66FZdMJVWFxBmCt9wRlbEscoxoL+TDDj3R4j9aVOXy0q9ZTPmooONWBBGsu52
	2RhdWJA==
X-Gm-Gg: ASbGncvryl17zCZ0u8gIZg2pCP0NdZafuPSv7ifyLAiRC6ymXv7JqSTnrAW4kvcH40a
	0c8NGpxAiv63RdvmnEi01Ar/0vgJX2xaGI6IttTtVic8xxZkFcwrM/w2L7d9PBZ6JL8Hp0+91Ww
	c28uy6/nbbiEv7PBKrC57Ip/AqUeqypCzho50+O0hEzFxtEpGcIvROzW9GsMOoCfuxLvGwNtS03
	vTq81mLfSA/1vx4GbpLROhzy5HeZCTLh6CPe1+LCrLDSpULYog0XfhdlQjQW9U1pW0FfrEh5snJ
	9iZM6KEE4d3NKkq403AldjEiltzKOFdfAfi6BuVL7RUXr0N7KrllBsN4j/6siNFNag==
X-Google-Smtp-Source: AGHT+IGG4pFqKnntb++9zSPnYcfNOKSdoVBgzth5CQqwaRskyMx2XptNXKUlFL92bw6nECdsiQ744g==
X-Received: by 2002:a05:6402:42c8:b0:5d9:fc81:e197 with SMTP id 4fb4d7f45d1cf-5de45002b1emr800048a12.8.1738874731740;
        Thu, 06 Feb 2025 12:45:31 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b739e2sm1341936a12.14.2025.02.06.12.45.30
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 12:45:30 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dce090bbe5so3186494a12.0
        for <oe-lkp@lists.linux.dev>; Thu, 06 Feb 2025 12:45:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyXhuXZNUMYT0PUr7I39i8X4C86fcoeNswmDDyGFUn4SyEFJD32hqvsnnhvJflyYYaGRIZ1rU=@lists.linux.dev
X-Received: by 2002:a17:907:c0c:b0:ab7:5c14:d13 with SMTP id
 a640c23a62f3a-ab789ca28c4mr31209366b.53.1738874730174; Thu, 06 Feb 2025
 12:45:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502051546.fca7cd-lkp@intel.com>
In-Reply-To: <202502051546.fca7cd-lkp@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Feb 2025 12:45:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=whSncSTE_Q0as-d989L_niJ6=ViwaDoOK6gTcWHNPkp7w@mail.gmail.com>
X-Gm-Features: AWEUYZniy5QwqYp4xcLufzK5aZ9Oiqagy7E0-rznZnU-hDviaSvFAI2cC75shLY
Message-ID: <CAHk-=whSncSTE_Q0as-d989L_niJ6=ViwaDoOK6gTcWHNPkp7w@mail.gmail.com>
Subject: Re: [linus:master] [fsnotify] a94204f4d4: stress-ng.timerfd.ops_per_sec
 7.0% improvement
To: kernel test robot <oliver.sang@intel.com>
Cc: Amir Goldstein <amir73il@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 00:09, kernel test robot <oliver.sang@intel.com> wrote:
>
> kernel test robot noticed a 7.0% improvement of stress-ng.timerfd.ops_per_sec on:

I have no idea what the heck that benchmark does, but I am happy to
see that this whole patch series did actually end up improving on the
whole fsnotify cost that I was ranting about in the original
submission.

Obviously this load doesn't actually do the new pre-event hooks, so it
seems to be all just about how fsnotify_file_area_perm() (or some
other fsnotify hook in the normal read() path) now isn't the
unconditional pig that it used to be.

I don't see how that would be worth 7%, but I'll happily take it.

              Linus
