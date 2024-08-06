Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F09734545
	for <oe-lkp@lists.linux.dev>; Tue,  6 Aug 2024 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955112; cv=none; b=pKzjBEs8jG0pE6zmY4smMhfj1SLFgqwBrMiu0FNpp9b/AJXNkIrxz+ToLUDog1GdfM8X/xov62IbSl/o/qU5B1IAuiJWc+nTpsjIFJ8CxgkTj1841UVtVmoCoOQOsfqxE0MJb2cUygOYDQeqR7x4xDbaCxxTWZmPJJtB22PvCkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955112; c=relaxed/simple;
	bh=2fP83v8ZDZ7pc5agamWj3NzXnt1SQztcQNzK097z7/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B208qggrDcEbIWvBGzRfMvI/c1kmQBW3pmDzp5GV7XxzsMp2VhdzxseKn9Ef/ZJcyRW/UtNsnXgRh8NEazRmjzoeB6aTNuNslplJF9XKM/DmcSuG3cxBhQlHLgQfDtFbmgXTTs8JfmetT4qXGlbJ2w6Nnlg/uz8MY4k8SaUAmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=buMGbYXE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="buMGbYXE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5b7b6a30454so1117736a12.2
        for <oe-lkp@lists.linux.dev>; Tue, 06 Aug 2024 07:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722955108; x=1723559908; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MWWrNlqBqyxE+pa3MBe3r8meejGqG07YEY2OhAnz4Do=;
        b=buMGbYXEPx29Eus6q1jH1sy1ruffY16SoprfQ7i6ArtQhlZSrTI78yVjxnwi3UvbYK
         9LbSDc+zp14DuFkw/+VeZk1VogBLWGJ674SBiMtVtcr1PjqyUnY907P1OEdlBU+C31hm
         dy2KrOsJPr2RsVg71hyCAFd593XiwObkCtTIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722955108; x=1723559908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWWrNlqBqyxE+pa3MBe3r8meejGqG07YEY2OhAnz4Do=;
        b=ofHkeMlC5ONYZTpLBnZOUd/vlOcZ1kJY46IJ1XSizO7k3lQyRw6VqT4XSRAXbz5gQO
         Hdz99VFu4GoAoX0akRazPIUPvUZ0eYdhpw99t3Y80R+0ddq1GCipLLwAxeXkyLuYB6rC
         vPDBhhAo5fAuVdVtB2axiFGf8ytPL9cuXP0r8yEsFeewSxzPen7uctFXBsTLTFlsaJYA
         6b5+IGSU4QkYY/7DQ9jar1jkN9Ivu2gFCRd8A7BG52jG+Jh5IJAtsvGGpALeLfk0slKy
         i54Qj+MrqWPo3iiG4SLdb8lz/0xSgGjYZKdCYrDHWAhkEcbjZ/UlE2/CqKPrpZIz92R2
         NvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkKoNJlwenfDh1wE7JW+GQOwwQ8NHVUCA9LwcdQj0QteS3mkh/1jHrIlpEgX+IUpSK7HdquvvJoN/pLMjbrz0py+zHfPW/
X-Gm-Message-State: AOJu0Yy+2PH94NGeqT0V+0cz9ujqAQM+U2KhY2+/58kQ9caVyrnh3NFz
	Z0uMtf5gIVuhkc92UmjPFhWHUCqSNEOZjOhWvw3SuC73MsXa7WTzFNR7NpBz8xYPi0rBRrZwKOD
	x6xOoRA==
X-Google-Smtp-Source: AGHT+IHx2iPRT5CSH5Ist7siWDWCQfUb6THWpjdlPzc8aM3TXb/si+3pQuiNXKXwdaCBX06bHPtsfw==
X-Received: by 2002:aa7:c996:0:b0:5af:3af2:e2df with SMTP id 4fb4d7f45d1cf-5b7f53144c8mr9437223a12.30.1722955108541;
        Tue, 06 Aug 2024 07:38:28 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83b82f308sm6012872a12.63.2024.08.06.07.38.26
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 07:38:27 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5b5b67d0024so1093785a12.0
        for <oe-lkp@lists.linux.dev>; Tue, 06 Aug 2024 07:38:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaI3pOr9pA+O4CUmWUouk90dCjy7mA341ioTc+4jKmrkKNPAb4ma/PcMUGPI24NH35WqJlPjqtUhQJeCkvAh8mqGxJlWTu
X-Received: by 2002:a05:6402:22b2:b0:5b8:1035:214 with SMTP id
 4fb4d7f45d1cf-5b810350411mr8834214a12.33.1722955106581; Tue, 06 Aug 2024
 07:38:26 -0700 (PDT)
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
 <CAHk-=wgdTWpCqTMgM9SJxG2=oYwhAueU_fDHMPifjpH5eHG8qw@mail.gmail.com> <ZrG8+/1YjxN/Hsb7@xsang-OptiPlex-9020>
In-Reply-To: <ZrG8+/1YjxN/Hsb7@xsang-OptiPlex-9020>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 Aug 2024 07:38:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi+rSKmNvFBpaKW+Hcn8YSzd2az2Lp5ii7Q4_o0PepJ_A@mail.gmail.com>
Message-ID: <CAHk-=wi+rSKmNvFBpaKW+Hcn8YSzd2az2Lp5ii7Q4_o0PepJ_A@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jeff Xu <jeffxu@google.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Pedro Falcato <pedro.falcato@gmail.com>, Jeff Xu <jeffxu@chromium.org>, oe-lkp@lists.linux.dev, 
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

On Mon, 5 Aug 2024 at 23:05, Oliver Sang <oliver.sang@intel.com> wrote:
>
> > New version - still untested, but now I've read through it one more
> > time - attached.
>
> we tested this version by applying it directly upon 8be7258aad,  but seems it
> have little impact to performance. still similar regression if comparing to
> ff388fe5c4.

Note that that patch (and Michael's fixes for ppc on top) in itself
doesn't fix any performance issue.

But getting rid of arch_unmap() means that now the can_modify_mm() in
do_vmi_munmap() is right above the "vma_find()" (and can in fact be
moved below it and into do_vmi_align_munmap), and that means that at
least the unmap paths don't need the vma lookup of can_modify_mm() at
all, because they've done their own.

IOW, the "arch_unmap()" removal was purely preparatory and did nothing
on its own, it's only preparatory to get rid of some of the
can_modify_mm() costs.

The call to can_modify_mm() in mremap_to() is a bit harder to get rid
of. Unless we just say "mremap will unmap the destination even if the
mremap source is sealed".

            Linus
