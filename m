Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA99AAD24
	for <oe-lkp@lists.linux.dev>; Thu, 16 Apr 2026 00:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776300361; cv=none; b=FAj8ctDygeToKBfvlIfhUMnOJqlsAUcxheIcD0VkKdYLrwLqbtfFZ4C6qQy5NfnXUC+bhHehyRUilB1J0NwCRV3whTWVYSsYDyaHJTnPJ3/9aORvyH6tnggvcsenVhu/IkZ0/r6CgH7NRU7Bnf4zgvt/trKIDyd2drWdhrkUXGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776300361; c=relaxed/simple;
	bh=gc+pdoS3br/cCEUwwrd0N37zvlUp6ObC/rNJq+jtszo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObdfafyN/XoDCjYkumIhg8r7TIxcWIe2AujoxGnNKHBB1jRxeNF1zX3AQXTVy4AmIzq1UEYRpqj8ugMxNWZlTLK02Kn9s99zR0UgWwU8tyX7Mtv279EOJ9XULAiX8BKyjDtQWVizaLVuoqZ6xLra0lGv9UlUIMnV5bhknv7nyys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=o3ji330D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="o3ji330D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54874C2BCB5
	for <oe-lkp@lists.linux.dev>; Thu, 16 Apr 2026 00:46:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="o3ji330D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1776300357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gc+pdoS3br/cCEUwwrd0N37zvlUp6ObC/rNJq+jtszo=;
	b=o3ji330D02VoReM7QKOkLW6U6rONSoucRqbjQVtcVvZaDM25ep/2x3mEHidwQi4L1quMfF
	hvEAYCFeDh8R6ml5LHK+FBzuDLU4K1w1abhCAWYm8lS6T4f4uZNJRL1iqlWWU5fU8s/k7+
	+2IgfPQDxwnztuVPr586GKvpOhNovr0=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c0330c7 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <oe-lkp@lists.linux.dev>;
	Thu, 16 Apr 2026 00:45:55 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4704fb0d5b8so79609b6e.0
        for <oe-lkp@lists.linux.dev>; Wed, 15 Apr 2026 17:45:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Fi5plVDyUnmvXqWEhBaDZzaIM+kU5EhhFGg8/MSF+JIbcsD79mr6FNf6J/SZoh7CyUEaP6U4=@lists.linux.dev
X-Gm-Message-State: AOJu0YypVomdf6H7QrKG34NNTWM+gr6QDWZ3suo8YpWZXKW/yJ73BjKy
	dVnwNfeAsgNoH0jD18K9VJCIj7vyrZTqqhqiLzwgIOO2LxxkWrBkB/zYD9/oiHBL+1N/hHrAbwN
	2kX1nLIP6mrBAxKCoMCZ5xeItYkWvALc=
X-Received: by 2002:a05:6808:130d:b0:471:d846:86fa with SMTP id
 5614622812f47-4798505ee44mr814225b6e.28.1776300354349; Wed, 15 Apr 2026
 17:45:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604151657.8e26ef70-lkp@intel.com> <20260415174755.GB3142@quark>
In-Reply-To: <20260415174755.GB3142@quark>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 16 Apr 2026 02:45:43 +0200
X-Gmail-Original-Message-ID: <CAHmME9q1UVnfEwyXL_Gi8xtRJ3pNhJ55h40nV1gtfQJ4zwt9Og@mail.gmail.com>
X-Gm-Features: AQROBzCOhE_5_BtMA7Eex_hMRhvJQSA03BmtBhLQsOHp5B2iQH7wsS4fL2LxiKs
Message-ID: <CAHmME9q1UVnfEwyXL_Gi8xtRJ3pNhJ55h40nV1gtfQJ4zwt9Og@mail.gmail.com>
Subject: Re: [linus:master] [lib/crypto] e5046823f8: stress-ng.urandom.ops_per_sec
 4.3% regression
To: Eric Biggers <ebiggers@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org, 
	"Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 7:47=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> [+Cc Jason and Ted]
>
> On Wed, Apr 15, 2026 at 04:45:48PM +0800, kernel test robot wrote:
> >
> >
> > Hello,
> >
> > kernel test robot noticed a 4.3% regression of stress-ng.urandom.ops_pe=
r_sec on:
> >
> >
> > commit: e5046823f8fa3677341b541a25af2fcb99a5b1e0 ("lib/crypto: chacha: =
Zeroize permuted_state before it leaves scope")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> This commit fixed the forward secrecy of the RNG, so it needed to go in.
>
> For large RNG requests, we could get most of this performance back by
> refactoring the chacha20_block() API to move the allocation of the
> temporary state array into the caller.
>
> We could also get much better performance than before by using the
> architecture-optimized ChaCha20 code instead of the generic ChaCha20
> code.
>
> However, neither would be a simple change.

I saw this commit when you were making it and also benched it and it
didn't seem like a big deal. (Otherwise I would have piped up or tried
to come up with a different solution.) For a while, I was thinking
that arch-optimized code in random.c would be neat, but with
getrandom() being in the vDSO, we already get architecture-optimized
code there, by necessity. So I think practically speaking, this is not
a big deal. I had also looked into what happens to that stack in the
context of the RNG, and it gets pretty quickly corrupted (and
remember, you don't need to erase all of it for it to become
practically non-invertible). But why should we play games with that
sort of thing? Zeroing is the right move.

Jason
