Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B09319B3CC
	for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 17:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719509028; cv=none; b=dIH/xvWkAI+UCgX2zmcTQobnbNOaAQ4zZLiQx9cnZXhoDuJYPqz4kns3WrGrfkXkWvg0NABXBQHLxFh+JGHo/2Xj9BbpIR5qtNAQlLEX5bq5k7dci7nk8wVIWb9usAWiTdGl+OMpsBYvssUvyDiM3ZE5C2KyJY9RrfbLSzeFwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719509028; c=relaxed/simple;
	bh=wjRMbyLk5mL2jDe+gW37GdehOSvrgw4JJrEwiDSKAec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFIw9qiigSIn6iH7Eeao1FceoIpmZ+RmZAyNrAMwAnQCkMy23cC0Bj8F9RN7Z7AihfLFRT2a04LQVkYZeeYPdU7HkXcUBvChkXMQOy3RwZ/9JAR1aIJD4P6Zmd/nsthcXn2339cVjCjS4yfH2kmMW8v7sjI2mb8cowDWsILnA/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IVTtmhzV; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IVTtmhzV"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec1ac1aed2so98143681fa.3
        for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719509025; x=1720113825; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QbM8hs4VmoA19X1MK0QBCSUQmi8mmEld0YypFNZYMHU=;
        b=IVTtmhzV39+guGfG3/7jokkJlQ+/Hl81jLVVoKKfqNU0Sb/UtJkwk+tv5AXz+86fpH
         GfLBtTxWWxKIkEpgTYmjqawVKVgnTSn6WwB66Vvqfp1tPsBaf1anux1MDIeTGFK+EhPM
         gKtFxoslWw+1vrAM6xmdsMO3RrjaxTpzY1oB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719509025; x=1720113825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbM8hs4VmoA19X1MK0QBCSUQmi8mmEld0YypFNZYMHU=;
        b=ovfmSlYJatXSTIYzuLXaADQTQV203RLJOpcOMMbZm76vfxxC0qWq8b285EpxTSSTIj
         2XwMSb1Dr4+Sc6Wfra08uacPBkUg+7z8Y5rY0eu0ZYmjLaDsa6osv40jQViECud1eMVH
         DiAWjtRjjh101d+hik32FG+miwofBpgMxveKfArUrF19gS6JaZO0/Sh9YNskbT1QqoeD
         3fyU0B6Akc+/4j8OfTE+SM3FpoWsbXl7mBf6569aspWoWzt6lAFTMCHvVFpqyGlJ51FX
         dPjlnk71dd1aQD4N/xN5tIcGparp7/eG5Ab+UQlPl52R9iN3ciZn8N4wVDeaViU/jch1
         514Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYVULOQ03jiqxgGjdsxRRHSoSLl439yvR/ZpMWhF6OEe4Axf+hNVU1j5svz/UkrHK3oLlm1qJLWCjsLpvQ1H/8ah4Sa/8Z
X-Gm-Message-State: AOJu0YytrM39L8/iDw2LaHUP24Ly6wXMCm1qYj0wkyy5G41YDhyqnTG0
	N+VbMvBSWEc7aofEgDLx9q1ws4XRRlany1SXSEpgya4DCPRr4DYJMj6P8xB5yzCiE78DOKtEKiu
	ItZjCIA==
X-Google-Smtp-Source: AGHT+IGv+UtKezKlCS0deJSN24MdVYD/mtSofn4vwy4sFO+DSINDkWy1+qDymWQaYglCgysRRbLmQQ==
X-Received: by 2002:a2e:2e1a:0:b0:2ec:5357:b63a with SMTP id 38308e7fff4ca-2ec5b2f0343mr82341061fa.35.1719509025042;
        Thu, 27 Jun 2024 10:23:45 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-584d2e43840sm1112514a12.93.2024.06.27.10.23.44
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 10:23:44 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a724cd0e9c2so615676366b.3
        for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 10:23:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8FxwAVL4xm/PtuXpVcyzW0MrRfIFOlYzAccZXeCh9yrmAzmi9x5mOoyq14l23/Bls4utcHKAQvW3IBrh8WvMuyb8VR6R8
X-Received: by 2002:a17:906:7955:b0:a72:98a0:7159 with SMTP id
 a640c23a62f3a-a7298a072damr233670466b.68.1719509024080; Thu, 27 Jun 2024
 10:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406270912.633e6c61-oliver.sang@intel.com> <CAGudoHF7ys8bTCE0G6vLzEbo+_NyQXmAEEGPJ4hx1yoYmBsoUA@mail.gmail.com>
 <CAGudoHFrMkdo1CoVxJUiEvQ_DyW3hzaCz18GjvLi4ny=o-q9ZQ@mail.gmail.com>
 <CAHk-=wg7PXo_QbBo8gv27OpbMgAwLh9H46kJRxAmp0FL0QD7HA@mail.gmail.com> <CAHk-=wjkn=yL6vy5s7ZFgBfDybD3Gjg9C72zXchy-JF0Tp+a+A@mail.gmail.com>
In-Reply-To: <CAHk-=wjkn=yL6vy5s7ZFgBfDybD3Gjg9C72zXchy-JF0Tp+a+A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Jun 2024 10:23:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiz739MaJQdHdK85WbBChKjt7PDavW15saX-NkWYEo0Lg@mail.gmail.com>
Message-ID: <CAHk-=wiz739MaJQdHdK85WbBChKjt7PDavW15saX-NkWYEo0Lg@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jun 2024 at 09:57, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> .dput.terminate_walk.path_openat.do_filp_open

Hmm. This may be due to the benchmark being in /proc/net, and
retain_dentry() returning false.

Then the fastpath in fast_dput() won't trigger, and we'll always end
up doing the dentry lock if we're the last user (which presumably we
will be, there's probably not anybody else there?)

                Linus
