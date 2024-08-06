Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53363A1C9
	for <oe-lkp@lists.linux.dev>; Tue,  6 Aug 2024 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722910954; cv=none; b=jcg7YGBCZHKqgB2fsvb76t+y3zKRCkP/I+X3OaS9fB0kO1VjtPjQHE1MDDmx8bEbyX/juo0WcaWi9BekbdtsO0L5sSu6pCXVExPNkZcGrTM9IUeT9zDkKf/GMSbKptPuQ0SllfZZ7zWjZrGl9o5KrEkuscqjccWWKBFgr1rSDJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722910954; c=relaxed/simple;
	bh=1kbFbn/hAUhXKnkcqsPGGdbcnRxGgzs3MwJiZATRWDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okqMSRVsbf061+pqNOKynj7hv/zYWO4bHspNET9tWbd6LebrX11CfjD2IT4zv4Tw2/5taBgZj6J3PRZLSvhf7KuBZk6YIZGK4AQEBBM7MMFwcHWyZ+q6AWqgeDzsHe9hBTtgnlTbj1vjE3isnKUtpwZ5kqkeDxAdn4Rox8v/N/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=B2K9N+/E; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B2K9N+/E"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a611adso142938a12.1
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 19:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722910950; x=1723515750; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwq5AxSs3t0w/fOZRG6eJ0P9hFWvane6MBazV/wxmCg=;
        b=B2K9N+/E9G0RlsEo6Z+C24ZPzaFQOkXrkEU7Mge49cPb5fY5nUe/QIna9dpMITONA9
         lHVD9jDDXWuQ6b7bxVpLxjp3o5HGts7/0sbwFrF40qSfwRFA3usOOat7pytQ7/ybYOfw
         u/I77+LxTsRbtfem61B7KxS4Twi9WZv1X1OEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722910950; x=1723515750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dwq5AxSs3t0w/fOZRG6eJ0P9hFWvane6MBazV/wxmCg=;
        b=DhNRFKUCnee9P/MjthxC4TNEm2m7aC2YFXdwNSqOGvojof2BMEXezU5TXpKKLaaJ9e
         gLGtyA4wKPdosYkCcceBoO6ZHV0NVak1+UQj8XE/yET3gusNNY629NmfsB5m2wIMJK5a
         /k4kkxuYmNIHfgknX65ENNLmReaRP8r7OxJjUadfTWpXjoscr9tJfSE5lI8WwIEkOADe
         0QEw2fIavEGLZ9uSbKwSP7ZlnCzVP8QcP1JKSG23/n6uzIzysz8SRwhxayCXvYhZXmjB
         hlRY/YB/LyvNk0p8UIA2EYZvngIKEP7xOWqz6Z5XbJWs7jQfIQdScNIFJqql8W8CDfGh
         RKpg==
X-Forwarded-Encrypted: i=1; AJvYcCVePGVins65MYHaglAeoObs5yB8TJwKMC/v40HNl7fU+YdKoNkTnmSAbNVcxL9ESuadPDb1wsg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuIQFn8TtM/KimL8D2y/i4Ma1Ue/YmvDjvM7gFUmAH6ICzIGis
	a4AId3gi1S3WRhCnupYVRvJWSH4n7BmAx+P3MM3PASrNsPM0YIcwo8Cl3bVJIYRFVvg3nrO7HYz
	t8MnTeQ==
X-Google-Smtp-Source: AGHT+IE+xwtpRNL5VWwMr04dG+T08hj1oTapiShjSES/h+CW6+/FNUgfHwSlrG+fhBnSVI+62bc8Zw==
X-Received: by 2002:a05:6402:b12:b0:5a2:eeeb:9470 with SMTP id 4fb4d7f45d1cf-5b7f42949c3mr9115165a12.18.1722910949909;
        Mon, 05 Aug 2024 19:22:29 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5babb4ec55csm3154272a12.47.2024.08.05.19.22.29
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 19:22:29 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso131839a12.2
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 19:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkcArS36WCvMxnKwTcHpuPmshdLZmxAuFN2xSAEWqWGwpfwDUYlhHQuW7u4CLtjDEWCoT2Feg=@lists.linux.dev
X-Received: by 2002:a05:6402:a42:b0:5a2:cc1c:4cf0 with SMTP id
 4fb4d7f45d1cf-5b7f36f59ffmr9300778a12.7.1722910641236; Mon, 05 Aug 2024
 19:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408041602.caa0372-oliver.sang@intel.com> <CAHk-=whbxLj0thXPzN9aW4CcX1D2_dntNu+x9-8uBakamBggLA@mail.gmail.com>
 <CAKbZUD3B03Zjex4STW8J_1VJhpsYb=1mnZL2-vSaW-CaZdzLiA@mail.gmail.com>
 <CALmYWFuXVCvAfrcDOCAR72z2_rmnm09QeVVqdhzqjF-fZ9ndUA@mail.gmail.com>
 <CAHk-=wgPHCJ0vZMfEP50VPjSVi-CzL0fhTGXgNLQn=Pp9W0DVA@mail.gmail.com>
 <CAHk-=wgdTWpCqTMgM9SJxG2=oYwhAueU_fDHMPifjpH5eHG8qw@mail.gmail.com> <87o766iehy.fsf@mail.lhotse>
In-Reply-To: <87o766iehy.fsf@mail.lhotse>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 Aug 2024 19:17:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=whQwJaS=jVWVvvvf0R=45EGMb0itmhhSpa7_xWJXQY71Q@mail.gmail.com>
Message-ID: <CAHk-=whQwJaS=jVWVvvvf0R=45EGMb0itmhhSpa7_xWJXQY71Q@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jeff Xu <jeffxu@google.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Pedro Falcato <pedro.falcato@gmail.com>, 
	kernel test robot <oliver.sang@intel.com>, Jeff Xu <jeffxu@chromium.org>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Dave Hansen <dave.hansen@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Jorge Lucangeli Obes <jorgelo@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, =?UTF-8?Q?Stephen_R=C3=B6ttger?= <sroettger@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Amer Al Shanawany <amer.shanawany@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	linux-api@vger.kernel.org, linux-mm@kvack.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Aug 2024 at 19:14, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Needs a slight tweak to compile, vvar_close() needs to return void.

Ack, shows just how untested it was.

> And should probably be renamed vdso_close().

.. and that was due to the initial confusion that I then fixed, but
didn't fix the naming.

So yes, those fixes look ObviouslyCorrect(tm).

           Linus
