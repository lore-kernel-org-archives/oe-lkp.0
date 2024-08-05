Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773CD15F3F2
	for <oe-lkp@lists.linux.dev>; Mon,  5 Aug 2024 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722881493; cv=none; b=e10yRjazjRojfuTfVAZx1+P/Uc4JxBLGuqJTkIkxKdqNcRGebDQ+uw7yDE3MYqc8w2+7l5ZSEteE3IOQOKVUv+mI9Sfhb9b3pTmx3kDOmLehcp8PD5KSSQHpQAOnaJKiUq8FjsEzD4FVHB0LgQr+X2+inzl0xHt/8ylUFwshO+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722881493; c=relaxed/simple;
	bh=IT6rj+N8w+2hUYnj1MvwmIb1amJCyMYhdpB43jZbqJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQVNqr2stIfmEdLd+NRYX9y1k4xNXt5SokVNKrPmaqKRx9u6axiCGCfjd8TA2yuwdVPLjYCp+enRXJ/aDvML8srnhvDViNmgl9u/ZNBCEW1fbAUl5FsaIy3R0mkaT1lOYnkn3oItwZiyKOkThJBCw+1/02wHgUfpgSJnuin6dTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FUmc/hob; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FUmc/hob"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a28b61b880so2259a12.1
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 11:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722881490; x=1723486290; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hnQGBE87+KnmPa4Bs70BMJXJl5MSqY0q2M1s2nGpdw=;
        b=FUmc/hob7fzwtnNYLtQYX3t96BRdTVkWbqIxowrfme2/2uGW4N15zhcY7jFmDWhSjA
         4qUuy6DG8DzwbTevN1YC9Qb2oXoc3PED8OlEpk9iMioEFg0eY+dkkbphG0iSOKt4UCGO
         a9ZiyunwmSM4bjAIqZjOMVhXnctlSjehmEt+1cfRnc8P6MZe7rA9DkzatN911gBRIcD+
         /564nF3VUIroeq8LSERPH6FBMIzXgTBQSRnzoAxtVejQdY4eSe/4dhY1wAPxxBdbgPeG
         Y4XQV+hOxaVcNFzfTb/4VEvK2GLq2bM4vp2aNNSucD3G3PxaW57p2SRU7O4zJPzpjEeb
         1KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722881490; x=1723486290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hnQGBE87+KnmPa4Bs70BMJXJl5MSqY0q2M1s2nGpdw=;
        b=JopgCNiuQHU8gPZXYB0Im2kxDh62e0ZBA0GhzdDWZ4T/myBeoXgsv/CPdwr8mvvIGk
         ObFUE0eUjdIBLIIWqDVG6fK3JrpzU1sU7LcVY8jptLtZyAr0/cK4Jx06x7GHwweYJ9j3
         bAp+CNEV6CCmFezN1gYLB/PwbZwrG3Jj1j25zDC8/eS5T2mB/cRr+ofrHetKOYU5Oxj3
         eQ8Xu/ukkF6F3oPXR9lUUupeQ36Kb+0IsDS9GRF1FssYZVVf9wkeO82KmgLBxyIBjpmK
         pDdf0MkTlFXnPCAFq5HEshF7eGszJEXAKGHHNz89L9zfqJrSNq5nIYLoinug5sYOfPhJ
         dkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIo2ik+fd/YVM0WLJ0y2TOTIZde9b3PYHJFJyXkvk6FvAwuqHA9uG0dgLoCrefzSFIcsrlUVvFGJMiW6LGY0lJVVmT77AK
X-Gm-Message-State: AOJu0YyCE6M6480bX+/SxJxby8Ya6D8QeGv0x5EVaItdURqZO4Pqc8uM
	ZlTLsojlQo/o9nHKp4fEiiqgeVhbeZ4JG3tgQlrjpLEn4UF3Np1GMvut2p+1KY7q9usGImE9NF1
	SienUrnWFaNOm6Lo9rrWaPyE5uht1YlxIdzfv
X-Google-Smtp-Source: AGHT+IHOh15hiLMYv55kABw3lnkiR4f9+1YSJisRrpIM2LvSrRhIYzH6Y0g9dC77hX8fJN2A9rRSSiJUQoJUICoipCI=
X-Received: by 2002:a05:6402:35cd:b0:5aa:19b1:ffc7 with SMTP id
 4fb4d7f45d1cf-5bb98174dddmr8049a12.2.1722881489512; Mon, 05 Aug 2024 11:11:29
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408041602.caa0372-oliver.sang@intel.com> <CAHk-=whbxLj0thXPzN9aW4CcX1D2_dntNu+x9-8uBakamBggLA@mail.gmail.com>
 <CAKbZUD3B03Zjex4STW8J_1VJhpsYb=1mnZL2-vSaW-CaZdzLiA@mail.gmail.com>
In-Reply-To: <CAKbZUD3B03Zjex4STW8J_1VJhpsYb=1mnZL2-vSaW-CaZdzLiA@mail.gmail.com>
From: Jeff Xu <jeffxu@google.com>
Date: Mon, 5 Aug 2024 11:10:52 -0700
Message-ID: <CALmYWFuXVCvAfrcDOCAR72z2_rmnm09QeVVqdhzqjF-fZ9ndUA@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: Pedro Falcato <pedro.falcato@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
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
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 6:33=E2=80=AFAM Pedro Falcato <pedro.falcato@gmail.c=
om> wrote:
>
> On Sun, Aug 4, 2024 at 9:33=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Sun, 4 Aug 2024 at 01:59, kernel test robot <oliver.sang@intel.com> =
wrote:
> > >
> > > kernel test robot noticed a -4.4% regression of stress-ng.pagemove.pa=
ge_remaps_per_sec on
> > > commit 8be7258aad44 ("mseal: add mseal syscall")
> >
> > Ok, it's basically just the vma walk in can_modify_mm():
> >
> > >       1.06            +0.1        1.18        perf-profile.self.cycle=
s-pp.mas_next_slot
> > >       1.50            +0.5        1.97        perf-profile.self.cycle=
s-pp.mas_find
> > >       0.00            +1.4        1.35        perf-profile.self.cycle=
s-pp.can_modify_mm
> > >       3.13            +2.0        5.13        perf-profile.self.cycle=
s-pp.mas_walk
> >
> > and looks like it's two different pathways. We have __do_sys_mremap ->
> > mremap_to -> do_munmap -> do_vmi_munmap -> can_modify_mm for the
> > destination mapping, but we also have mremap_to() calling
> > can_modify_mm() directly for the source mapping.
> >
> > And then do_vmi_munmap() will do it's *own* vma_find() after having
> > done arch_unmap().
> >
> > And do_munmap() will obviously do its own vma lookup as part of
> > calling vma_to_resize().
> >
> > So it looks like a large portion of this regression is because the
> > mseal addition just ends up walking the vma list way too much.
>
> Can we rollback the upfront checks "funny business" and just call
> can_modify_vma directly in relevant places? I still don't believe in
> the partial mprotect/munmap "security risks" that were stated in the
> mseal thread (and these operations can already fail for many other
> reasons than mseal) :)
>
In-place check and extra loop, implemented properly, will both prevent
changing to the sealed memory.

However, extra loop will make attacker difficult to call munmap(0,
random large-size), because  if one of vma in the range is sealed, the
whole operation will be no-op.

> I don't mind taking a look myself, just want to make sure I'm not
> stepping on anyone's toes here.
>
One thing that you can't walk around is that can_modify_mm must be
called prior to arch_unmap, that means in-place check for the munmap
is not possible.
( There are recent patch / refactor by Liam R. Howlett in this area,
but I am not sure if this restriction is removed)

> --
> Pedro
