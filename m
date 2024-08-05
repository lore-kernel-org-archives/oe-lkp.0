Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA60014A0AD
	for <oe-lkp@lists.linux.dev>; Mon,  5 Aug 2024 23:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722900314; cv=none; b=YVY3iMnWzp/b+b5x1r/n2zzoNXHReUGJBvlrV1oP0kyUutfeacynSwQXl4UPNDzh9j+aue572T+dzZtDqdRx3U+VDw5+CFzLybJAya/s0bx1vzJPGmnn4eoQ+ehn49Fsj2bbNmK4zdcwZ8+VwnX6AO3t/5TYhRVkQQC/Y9sWkk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722900314; c=relaxed/simple;
	bh=2zBIarod2HVl/CUnRXWVgnn0mxMrpjXcU7UzEEJJgco=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Hf1qP6FKpaI3hcygs++0cIT0u81kt9/e/v5AvSBppjYY5Zl92WrxU511AivMSotJhqiBME3tsknxuKws+KXqSTf9TNJ1L11fGQ7w5aLalcn2bI+ibkp/bFUEeVweJ7wREDThsZkOcyBREAxIcZWF6xVVB7mY+aAxeczR5BfFZfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ho1ZaHyY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ho1ZaHyY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2cb4c584029so110339a91.3
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 16:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722900312; x=1723505112; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zBIarod2HVl/CUnRXWVgnn0mxMrpjXcU7UzEEJJgco=;
        b=Ho1ZaHyYFyQjb4PR+WrBC97DVyShUnExT2Kqq8z2jt+N28a64VGk7oJHTVE8AxUD9V
         yQpiMYVmeNWLa9mGpYsmM184Y4wGRdNy5r+OVQ2FCh07xCqCuMpk1c/V2gFbH1JDQnC9
         tHfOBmlDRVKvLakYgPIi+QUeYe+K0VARZIxSCvFZkHxE9BY37kesPk+5oXlNHhYTxUZc
         aSjLwZVgWU4Dv2e1OE8ACHm5r1DaSWd9TteAPAiU8weflsKowz29ph0DOqXFC61cYJOx
         vqAny2fdrmZK3JzmSYpRFXJLAV6CQztdbUDQzsj1/SO7RovgIUS7fcnzHIhVbMw/0b5H
         /Zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722900312; x=1723505112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2zBIarod2HVl/CUnRXWVgnn0mxMrpjXcU7UzEEJJgco=;
        b=uL/J4GGDq2U7pe+90/Qld9sD81Gt7IyUj20fPt5X41itJi2GHwR8u5hl2WRcaqP1tZ
         KRR6Eg9oJajUbmWOQROt7AyMIIlPBWh4wHkr+Gc5Wkf5w+ElWdbAutyCSZ+AQUY2gUpd
         2QJX1s6wXpEaiSrAAU6oM3BHni0nQX/AEPT0qTV7DQ1ifb4bwIxd7bPUfCJEMvE88aV8
         jV4HqtwQis6DMCxbKx2tlFLwLlrXSPTl+FYGh3yQJuja/xHahgn3ZN4L678GEGmJjvTx
         iw1KQBuVAUs9J3wwY9LqUkb4CNuMinuWIQt8mFHfThpSETv6e/kTOqE0PQyFfX6K03K9
         1ang==
X-Forwarded-Encrypted: i=1; AJvYcCWWWhytmy91jCy1D3QMvA8/7V54D90hm9C/CQsS2rACmhD4BppzN3fi7aKGl5ZkSlzX3EpWkZd6YEwMW992ACmTORN5BSfj
X-Gm-Message-State: AOJu0Yyr/va46QsXNO5AS/HBtiBTQmHs5Kn91ff9HOyqHD3OhaxaSUDg
	Yj7g3uwEhEgTNcjhOHs/mnCwRwEGGIIjQo9Q/+EABpxU0CTfbS0E
X-Google-Smtp-Source: AGHT+IEKIal6yU7k7Lhrnqubd6yU4EmHWWHnqQEQk4+X/HJkwuuyTpiT6qDT5UZniCRaYxknZQYlKA==
X-Received: by 2002:a17:90b:1c03:b0:2c9:9fdf:f72e with SMTP id 98e67ed59e1d1-2cff9547ea1mr12052804a91.26.1722900311942;
        Mon, 05 Aug 2024 16:25:11 -0700 (PDT)
Received: from localhost ([1.145.206.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdeef43bcsm10813103a91.39.2024.08.05.16.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 16:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Aug 2024 09:24:56 +1000
Message-Id: <D38D6LJZOIQK.2GV58PGVL5K85@gmail.com>
Cc: "Michael Ellerman" <mpe@ellerman.id.au>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Pedro Falcato" <pedro.falcato@gmail.com>,
 "kernel test robot" <oliver.sang@intel.com>, "Jeff Xu"
 <jeffxu@chromium.org>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <linux-kernel@vger.kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Kees Cook" <keescook@chromium.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Dave Hansen" <dave.hansen@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Guenter Roeck"
 <groeck@chromium.org>, "Jann Horn" <jannh@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Jorge Lucangeli Obes" <jorgelo@chromium.org>, "Matthew
 Wilcox" <willy@infradead.org>, "Muhammad Usama Anjum"
 <usama.anjum@collabora.com>, =?utf-8?q?Stephen_R=C3=B6ttger?=
 <sroettger@google.com>, "Suren Baghdasaryan" <surenb@google.com>, "Amer Al
 Shanawany" <amer.shanawany@gmail.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Shuah Khan" <shuah@kernel.org>,
 <linux-api@vger.kernel.org>, <linux-mm@kvack.org>, <ying.huang@intel.com>,
 <feng.tang@intel.com>, <fengwei.yin@intel.com>
Subject: Re: [linus:master] [mseal] 8be7258aad:
 stress-ng.pagemove.page_remaps_per_sec -4.4% regression
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jeff Xu"
 <jeffxu@google.com>
X-Mailer: aerc 0.18.2
References: <202408041602.caa0372-oliver.sang@intel.com>
 <CAHk-=whbxLj0thXPzN9aW4CcX1D2_dntNu+x9-8uBakamBggLA@mail.gmail.com>
 <CAKbZUD3B03Zjex4STW8J_1VJhpsYb=1mnZL2-vSaW-CaZdzLiA@mail.gmail.com>
 <CALmYWFuXVCvAfrcDOCAR72z2_rmnm09QeVVqdhzqjF-fZ9ndUA@mail.gmail.com>
 <CAHk-=wgPHCJ0vZMfEP50VPjSVi-CzL0fhTGXgNLQn=Pp9W0DVA@mail.gmail.com>
 <CALmYWFuCvphvLQOuQHBbFq0G8Ekyze=q45Tt4dATOt-GhO2RGg@mail.gmail.com>
 <CAHk-=wgySgXXkZtx49Xq70X2CmSizM8siacYKncMmFWRzKjs5Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgySgXXkZtx49Xq70X2CmSizM8siacYKncMmFWRzKjs5Q@mail.gmail.com>

On Tue Aug 6, 2024 at 5:48 AM AEST, Linus Torvalds wrote:
> On Mon, 5 Aug 2024 at 12:38, Jeff Xu <jeffxu@google.com> wrote:
> >
> > I'm curious, why does ppc need to unmap vdso ? ( other archs don't
> > have unmap logic.)
>
> I have no idea. There are comments about 'perf' getting confused about
> mmap counts when 'context.vdso' isn't set up.
>
> But x86 has the same context.vdso logic, and does *not* set the
> pointer before installing the vma, for example. Also does not zero it
> out on munmap(), although it does have the mremap logic.
>
> For all I know it may all be entirely unnecessary, and could be
> removed entirely.

I don't know much about vdso code, it predated my involvedment in ppc.
Commit 83d3f0e90c6c8 says CRIU (checkpoint restore in userspace) is
moving it around. Why CRIU wants to do that, I don't know.

Can userspace on other archs not unmap their vdsos?

Thanks,
Nick
