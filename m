Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD6B82863
	for <oe-lkp@lists.linux.dev>; Tue,  6 Aug 2024 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722980242; cv=none; b=JQb9FVIsng4214+1z6NVPorleVYmRy3EQgqcEN8X6r8SNgq9ATGTre+/ZFD68ldn8Azj79zeKNmygyZ1sXE/ujohFE3uxTxDlY0W8miM4JXP8E0cqV3aQ896qvUy/z0Iu6EmgE/RbN+2LEUk334Ghqvkqv0a8RjNK7q2vhwK+4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722980242; c=relaxed/simple;
	bh=8kHm+ac+kygNQxYV5Z1B1h2y1ADNWsDkiwXd93UvjBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBfMT3YfFk4XX8RdcIHi6Xdo2yZwK0untn2J94fFq2rhClsTV/5JfnNwqzNwt3PiKp6cCG55BbcBXQSBPOk2UP8kLgph7PM57SCBvMNuPpDMt3EsWiuD+2tOJAPDQAEg4Bi+7jDnz39HnWdMDYLcYyAlYFDqQ8YnJyxaRFbxb9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGYMOhRF; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGYMOhRF"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4f8b5e5671bso475559e0c.0
        for <oe-lkp@lists.linux.dev>; Tue, 06 Aug 2024 14:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722980240; x=1723585040; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFsMpJ+I7X97hoFlRtZ+H2DXn3COcJ95N+qj7lA/TOQ=;
        b=GGYMOhRFdnx1OfVpM7GFB6u6lwpW0n9oKhyzrbpR+3muLpBLIkU0JfihfKrIVQw7pD
         QaVWRNjzNDuSpDVBwwuQ1oKyANEUFzvMpN8TSyk5tXebyrSWIuCaSOJuX+CX9N/B3sQ9
         TaSVq9i/zhlEOHptYda2+na+IaCYzmZ20F26fBBteshNUxI7ZUg/VmKpNhvIwfgxg6gZ
         VHLG6BvygEzlfcbJMcqrVlWLlW8KWHKOhmvJjeKN5wFQC+WtzlD6Jmlgs6mLaaPVGaXw
         1iTrqQggy/0nial8wromA3rA66mQpsCWcdXjwbPpLv9DOZohQtsBvkQzQAMHeb6aK1So
         4kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722980240; x=1723585040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFsMpJ+I7X97hoFlRtZ+H2DXn3COcJ95N+qj7lA/TOQ=;
        b=ZT3nQQmk2EDg+02v23M0uOSBs+qyGLlgrZLKNDmkQnPL8RHldyhArUEz+RmlacZeQw
         EmH5L1AmAHNj45DKCXDqvqP+MJCuuDIJqnLWby7GNfIELhm0dJ5Xajqx/0/IXAeqEwRh
         FWmHvnZijvMtYshxfN5bKnuQthdzPI1ABoaQiP0L/f2MftZF1+VgabHFdQ8Ux1ih9RC6
         VC3tDxHwTzDiXt/KPVYo1V0mtTljCk5j40pdjqtGr9rZsOHBFfqYP8IeZq8HpDXkkGAX
         g/VjNO8o5eqqxjB4uH4O5SyOUXJP6llZ3pmFX72YVfnKXfUq5PBUVY+m5c+QEzFHhKmL
         jz7w==
X-Forwarded-Encrypted: i=1; AJvYcCUGX/VkA7MaOBw41N5ixsOSxAHhsotZ2soXTxSNMATT2TVLEbGSF/4LVYRdVFeJyVJU92GPxzFNHIxnmd6ZcWXb/t/NLay/
X-Gm-Message-State: AOJu0Yw2QLmXB0GNpVM8x0i2fbcbWl8YGSFCJaMM05FJ914yJVrtGN0l
	LrGhXmiwHXnJucmTjqs0874zfOyYLt/aCHVE8KTEXiX6OidpAYsCBsCHLmZ3tDpY26lc+Chzzrk
	cD6F4rD4GvapqWPLDEd5t87IOwRE=
X-Google-Smtp-Source: AGHT+IFrQ8JTwjxVQvgV4t1UWu1mNosEjtPutyaa5+3W6qYS/JH+h8DUFz1dPxmoFFh/1Vhlg23Q+IHOeKLj0hAoGlA=
X-Received: by 2002:a05:6122:2191:b0:4f5:1b58:acd9 with SMTP id
 71dfb90a1353d-4f89ff4c58fmr14470832e0c.2.1722980240246; Tue, 06 Aug 2024
 14:37:20 -0700 (PDT)
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
From: Pedro Falcato <pedro.falcato@gmail.com>
Date: Tue, 6 Aug 2024 22:37:08 +0100
Message-ID: <CAKbZUD1278Bq+5QwjH=LeYSgcugZ3JbvkLeoB3whei_gkEXV+w@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jeff Xu <jeffxu@google.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Jeff Xu <jeffxu@chromium.org>, 
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
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

On Tue, Aug 6, 2024 at 7:05=E2=80=AFAM Oliver Sang <oliver.sang@intel.com> =
wrote:
>
> hi, Linus,
>
> On Mon, Aug 05, 2024 at 12:33:58PM -0700, Linus Torvalds wrote:
> > On Mon, 5 Aug 2024 at 11:55, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > So please consider this a "maybe something like this" patch, but that
> > > 'arch_unmap()' really is pretty nasty
> >
> > Actually, the whole powerpc vdso code confused me. It's not the vvar
> > thing that wants this close thing, it's the other ones that have the
> > remap thing.
> >
> > .. and there were two of those error cases that needed to reset the
> > vdso pointer.
> >
> > That all shows just how carefully I was reading this code.
> >
> > New version - still untested, but now I've read through it one more
> > time - attached.
>
> we tested this version by applying it directly upon 8be7258aad,  but seem=
s it
> have little impact to performance. still similar regression if comparing =
to
> ff388fe5c4.

Hi,

I've just sent out a patch set[1] that should alleviate (or hopefully
totally fix) these performance regressions. It'd be great if you could
test it.

For everyone: Apologies if you're in the CC list and I didn't CC you,
but I tried to keep my patch set's CC list relatively short and clean
(and I focused on the active participants).
Everyone's comments are very welcome.

[1]: https://lore.kernel.org/all/20240806212808.1885309-1-pedro.falcato@gma=
il.com/
--=20
Pedro
