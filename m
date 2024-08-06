Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BBB64A
	for <oe-lkp@lists.linux.dev>; Tue,  6 Aug 2024 01:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722907414; cv=none; b=BwjRO8GDpqy0DenhY1+ug/vk0zcXR0wMu45f7DS+nDGzysoK2FN3ketswp4srrrCO1DEVkQ8YKORod7JClNqQSg72+69ADxjN/PJapkFGMmvi2wcowCLE8YL+byNSRWmjEPJb2Jcpv/cOyid4NeJLTl1+j8df7ySjQIwQLM/Zkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722907414; c=relaxed/simple;
	bh=vA4qaSs5vwrQoFaoWs6qaP6dAmPJ7PdCG5HHaDna8EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cF/xYDFH+d8QbOC9j5+2doIMP3O3EMiGw9UbBE0Ralexi2qDNxEKr/21qpBYThTrnMfWrw5hDkfxklq7Ojlk016YalckEi0Npc9FRLEQjsyll1bWxK8WBd9j48AXDgHOo5La8WbDrybtq4hNUPjzk2zFts6MjWiwTE/5NtV7O8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WQL/Nhda; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WQL/Nhda"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efc82c872so1080e87.1
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 18:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722907411; x=1723512211; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2zr5Jw8aSSrppFuky4osrxPL34Y2hdQ6m0LCpom6O0=;
        b=WQL/NhdaE3F8rY53rg5x7O7Zl+68XPHHrueh+SU6Mmr948emRfiQ6wjKX4mB786m8T
         n8wByJG1Ov65L4Av+xtr9gbaL+Dh1Nq3dEogwZIdr29oqFQj+6PHyJLdMmnSiRrqu/O0
         jS4fxNl9nz7lXZouvnx+3hn1yIshE5n1vBht1q8/JCL/7u8o3LmAJGVxSOuV0wue7p2n
         qWjuk98z53tYBTLsWRy0jDnVfA8BzPBbB607a8dJHWtjJYGG6t7MM6s61BmUyggjJKFl
         RCTQYod1lPz2IJy+l3keuDSft6HtJ890i3USnXVkmZ8OgHWDR5piktegueTl3VrGXi6D
         01aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722907411; x=1723512211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2zr5Jw8aSSrppFuky4osrxPL34Y2hdQ6m0LCpom6O0=;
        b=dGfRGb2ic0ejZmpKNU19IqLYIcWkIR5Ks+4H/pIV9TlvqUgR3W67zjjuH4PI4cnaC1
         m1IpfwJs4gpHHFYc/9QZC5EGQLK8UKXKrKu5k8blumZvceONbXaIcqckvh9wddFHAYpx
         3ldq+9cSibythnj1DWz6I8ujr4aC3pgXSWq9lvSfSQ0hh51zOYwijXvS84JtOiMx101i
         o8R2nsYuBcXoEU9gA1Zdajtw4iNg1HwYLUI5O+Bmw24u4eUyew8QJtHktyvs8yhBrQH5
         cJbTW4oN4Jpyu2yv/SxxSmKPaCGVktv+Tqkl05Gx7lLhn58K8XwBinlFiiqYzpcELuhe
         8xkA==
X-Forwarded-Encrypted: i=1; AJvYcCV//LdukwIk5IGuxswQ1JLJ/qDCTriO93YMpTZsQI9bqNrGBS1A1n7T2yFwHQYKLXcJLvH8cz+77V+0apIUWatbCnpOWnbo
X-Gm-Message-State: AOJu0Yw7g1YYHHA1LKUSXb8SzdtGtncInR2wq9giGNqbwrkf01gMb7Uo
	oPRhfo9K9/fh+7Z6CKM92Zug3BGUePbUWDBW0tYYbA2BnyaRjwrPTomJSTzma+9c9TrN4hVG70P
	2uuunbeSmcPjcZhqkgchZ0Xw6S2Npz7ceVZCN
X-Google-Smtp-Source: AGHT+IHDKybFd7xjBRooCMWNn/w6NoQhtyT6dyera+RHZ8++MzQjx2qRg4C4mrmTqvpJKMndQwKboNUTLGvAKAJR9gQ=
X-Received: by 2002:a05:6512:b94:b0:52c:b243:cd02 with SMTP id
 2adb3069b0e04-530d593c470mr35192e87.1.1722907410501; Mon, 05 Aug 2024
 18:23:30 -0700 (PDT)
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
 <CALmYWFuCvphvLQOuQHBbFq0G8Ekyze=q45Tt4dATOt-GhO2RGg@mail.gmail.com>
 <CAHk-=wgySgXXkZtx49Xq70X2CmSizM8siacYKncMmFWRzKjs5Q@mail.gmail.com>
 <D38D6LJZOIQK.2GV58PGVL5K85@gmail.com> <CAHk-=wjeWqr+0Ktzbwqrw17aESe5dZm5Kt6nwqtKJX00VsDqWg@mail.gmail.com>
In-Reply-To: <CAHk-=wjeWqr+0Ktzbwqrw17aESe5dZm5Kt6nwqtKJX00VsDqWg@mail.gmail.com>
From: Jeff Xu <jeffxu@google.com>
Date: Mon, 5 Aug 2024 18:22:51 -0700
Message-ID: <CALmYWFuXTd5qYLa=rEkoFbzSk07PjdKExgKsUkgMkT2E1Pjrtg@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
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
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:13=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 5 Aug 2024 at 16:25, Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > Can userspace on other archs not unmap their vdsos?
>
> I think they can, and nobody cares. The "context.vdso" value stays at
> some stale value, and anybody who tries to use it will just fail.
>
I want to seal the vdso :-), so I also care (not having it changeable
from userspace)

For the restore scenario, if vdso is sealed,  I guess CRIU won't be
able to relocate the vdso from userspace, I 'm interested in hearing
vdso dev's input on this , e.g. is that possible to make CRIU
compatible with memory sealing.

> So what makes powerpc special is not "you can unmap the vdso", but
> "powerpc cares".
>
> I just don't quite know _why_ powerpc cares.
>
> Judging by the comments and a quick 'grep', the reason may be
>
>     arch/powerpc/perf/callchain_32.c
>
> which seems to have some vdso knowledge.
>
> But x86 does something kind of like that at signal frame generation
> time, and doesn't care.
>
> I really think it's an issue of "if you screw with the vdso, you get
> to keep both broken pieces".
>
>            Linus
