Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253955E73
	for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730128725; cv=none; b=qA1s47KPEUY104lqwsbmRwIArW/NxUKcFOBpWJphYpB+tTITmUc9byooBOXMNmRclBF/eJL6pXxqiduxevphJlM6xUpguSPQQ+WBTalREAoUNeVY5n4totKpIaDIDoTy8YiOUhKgmTkFVEh0p130xhOEi7eYU+zJW7FaKaKvsIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730128725; c=relaxed/simple;
	bh=FFGgXtmohDrPrQL03n2MnbMWwTvtG4p7zdfgNy2sDPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wok1pYUfSM0bu8vnsmvWrvoAg73emkr3ajW+iAbnNgg/39TfOKm1Ks+2qJjDmSDPb2Mt5/ujmtHgN+RN96w6QJi80WExXXW71zZ9wwB2EICGp1nihESotvvxO3t9N6MmW8Gt/2S+K09BFX9NPPH7Sk5YsHSXEiLeFmbARn5t5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4h0K4UuY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4h0K4UuY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43163667f0eso43099995e9.0
        for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 08:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730128722; x=1730733522; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFGgXtmohDrPrQL03n2MnbMWwTvtG4p7zdfgNy2sDPc=;
        b=4h0K4UuYCfLrNaLhoTNUmzJu8p9e+SWnV8YNTMrBGHyvZv1oSMHWXvGYksXoqPoa+x
         HfKKYTJE7znAzQghlBSRt5GKiR5kVOrUPpayTjYjrZwkAs4RXMTQI/iIsQqX8qES2nWv
         52hUH6mf0VzZeGTQ3sX0mMW0OE46yeu9zFk6Rs8zyMwr9z5xna6c2MPKZiYIkGbZNsYU
         /fA8pbyv/RD6k2DaiOG7/rsp3yVWN6KQfUenRKvc81XJUtgQ/qIjp0hTFmGPbd7upWQA
         4YxVFoCMziSLf8R4p3jf75rMxKG0frCUm7G7w8KkqNMH9RCI1DQ+HrrU0EU5vIMbHGWn
         bcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730128722; x=1730733522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFGgXtmohDrPrQL03n2MnbMWwTvtG4p7zdfgNy2sDPc=;
        b=hPpu8W2RT21zIMMo4xZizkHmSGybTYq3635csNcZWWrp1RF738pJYrZi/n0oNf4EIB
         7mitx7rpjnDICNUefv2l+nHgdZtCAnM4FHBEc2loqa1G4px/bwkHBFXh8oVWwAUUndY7
         ZTU1rC1BPxewQ2u0ZY/A7LVeQNIP2mDqaQhlQCPU3yISCaOgLCND2wkTvsGHSU+OiVSc
         DEe3m+yfddXw9VGMoYXj9UdX7SARjZsUyaPc4pytLo3nfzL7YXjBKkg/1T6db4c0VX66
         s5+lD7fEFjmjcTL//agx+vdpDUIahajqfJLslDFQg8YlvWiqu3mhenJCIDsuXubJplmx
         xr4g==
X-Gm-Message-State: AOJu0Yz2MZ7go91aYJdKlNi5UjStnAGbJ+o2HvI53xikSHgCq/SmaWax
	vArnbIO7uv3vEiWfS0U3OOYVtnsEucEwUQoSxcJ/EnV5k41C2QvdfQGY+K+UKcRYhZNFz+dVmuy
	NX86VJMrV2N7+WJlDkViL3OwYHrC5hlmk9m4i
X-Google-Smtp-Source: AGHT+IFCfEPhAw9HPgrzvc46aO8rpB3uCJMi4adwyiE9ANLaOsnM2tIHUodhhI9fuMWFoiBRyNCB1M+5kBEYzj1/FM0=
X-Received: by 2002:a05:600c:5118:b0:431:3a6d:b84a with SMTP id
 5b1f17b1804b1-4319ac77f17mr63256925e9.4.1730128722180; Mon, 28 Oct 2024
 08:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410281414.c351044e-oliver.sang@intel.com> <CAH5fLggdtev=scJ1C9EefZf-fVrMvgMbfD+b_T5vFfHqNTn8Kw@mail.gmail.com>
 <CABCJKudR2UwvR8x4MwKYPmHETMz+aoiXEXz135BoufTF9Pt2Gg@mail.gmail.com>
In-Reply-To: <CABCJKudR2UwvR8x4MwKYPmHETMz+aoiXEXz135BoufTF9Pt2Gg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 28 Oct 2024 16:18:30 +0100
Message-ID: <CAH5fLghwEGCAxCR+OifGYh3jKK4jJqa-AX3gMUdN0HETBNBkYg@mail.gmail.com>
Subject: Re: [linus:master] [cfi] 8b8ca9c25f: CFI_failure_at_do_basic_setup
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 4:15=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Mon, Oct 28, 2024 at 1:34=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Hmm. This config has:
> >
> > CONFIG_CLANG_VERSION=3D190102
> >
> > Sami, is the fix not available as of llvm 19?
>
> Looks like llvmorg-19.1.2 doesn't have the fix, which means it won't
> be available until LLVM 20. :/

It's not going to land in a patch release of llvm 19?

Alice
