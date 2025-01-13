Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91CA1C1F19
	for <oe-lkp@lists.linux.dev>; Mon, 13 Jan 2025 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736752045; cv=none; b=izcgoC04EuGRnl/0ArDXUeRQeDhXx1PJKKPqlYAp+c7s+WSxnxyL8VgLHF71mD09mr1pumKNTVL3ODou91nEVhIe7KQxzyTcV6fUI1nzxwXjwQYDoJMQk3azQkiwyxx83vGNC9885EzSIS62TuRDRbqlRbVdZtKjJDlMECDj+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736752045; c=relaxed/simple;
	bh=TR064fO+G6vixZEF887aiWcQqiC/MQ5d0SStyHUZaKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NtSUjuS9LY7xBYBP4fH6Po7OSz62+VSz5NIxDzruGp8n+NmBBYs7oci45Wo1ITFYfDTsiCaGVhskUkNgVZz5n2StgFNhKDtvJU63PsRKyLJ9EagQRRHsqLwqOAlWsxFF64QfZrdZhY8WFL+zkr4H/NR0Dp8hGbbsNOza2F8caUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LK36UG3f; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LK36UG3f"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso5615052a12.0
        for <oe-lkp@lists.linux.dev>; Sun, 12 Jan 2025 23:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1736752042; x=1737356842; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FjhCsm5OIpMcjUk1WeArib1fg3hTjgJ+lit+Y/PbC/E=;
        b=LK36UG3f/7KT81let9rPfMpq2wUYzUzlFJXWlYitSqOD6jXwphLWv1tMQYoQucjv9t
         6EtztEsFrYOErQMuBKZjCNkcfUBYmvSzThZBz6fol82dGy+MswVLp31oQc5GM2qEiOcF
         UhKpP44d/RZVW9gkjcDmMueprZRLBb+4Hukok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736752042; x=1737356842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjhCsm5OIpMcjUk1WeArib1fg3hTjgJ+lit+Y/PbC/E=;
        b=V7r7BnyxIWj5FvTPIHEb835JSQtXreyuA/4/XRZ1W0JAJuOnse9cmLuuHwFFSilwUm
         BMBwxCMeCMzUCMVCk34zDmRbaSsjGFtw4481kvmpuOarhlEWEkZzYBgWwHM0A6LY14nz
         Fo/NDamAvIpgni3EUrg8X1WWFpx07M/3qn5N750klYt9364XILjA9mNagj1ItFb3fMzN
         BvwDmg9WnxzHCbZWclM8dQMNNTpT3g3F7WgG8sqaK8RVGyTAgY+CIDV4fKAy36TiQOCy
         nTvds/F/117aQdAlZIK1ItV7Ns0sg8FMwRA+w4m+J6iK+DJiF75A7RTVjw6Y+y2Z+Ye+
         Yw6Q==
X-Gm-Message-State: AOJu0YxL0XSGiSzSsxTOityovcfs0I1jPGQU/CgAVu3bEXmyE4ChbhUV
	bBc9MZiLG1r24PY27DTNT8TFRTOzBo20AaaSGIk4g4UlL3YBIpMRwb7G+QjfiHWIHgj1ZlCHZ8n
	iL5o=
X-Gm-Gg: ASbGncu6+Lo/p2P0LA0BeBjKGV7amblHkFYw4a6ArTbzZTbkyzrk25hZYWTE2B2qHAV
	uvMZHD06RMSnDM4WFcD0FYB6wduB6yoe8trXQ1/5wWvelWum30ODELCPp5MrXMQNqBHx7zJwCBg
	2ADERaQMoLU3t6ibAevOROdkYUGSXYFlq7Iue2ncUGOJSeZpKMar3sOPP6qsIQev6HwIumwhLke
	vuzfrL/ETXu9CCP3Y/DOrghMWeqi0zYkOTba1CfVz2otx/QLAESnXWe8qaGJGD2uc5eza1cjf5N
	rpkbR8fChA/qmUeo4TockHtaPj32Eb8=
X-Google-Smtp-Source: AGHT+IEh7YlBgSWiwylUkRsVVJuKGOKrgXll1nqhCTcjBdMYRfQfD3hpKOH4BNy5OH3H+s9UvT8IuA==
X-Received: by 2002:a05:6402:84f:b0:5d0:d3eb:a78f with SMTP id 4fb4d7f45d1cf-5d972d26e91mr49918964a12.0.1736752041880;
        Sun, 12 Jan 2025 23:07:21 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90d7432sm456761766b.49.2025.01.12.23.07.21
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 23:07:21 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so5897784a12.1
        for <oe-lkp@lists.linux.dev>; Sun, 12 Jan 2025 23:07:21 -0800 (PST)
X-Received: by 2002:a05:6402:2548:b0:5d4:2ef7:1c with SMTP id
 4fb4d7f45d1cf-5d972e639e4mr44928573a12.24.1736752039107; Sun, 12 Jan 2025
 23:07:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501131352.e226f995-lkp@intel.com>
In-Reply-To: <202501131352.e226f995-lkp@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 12 Jan 2025 23:07:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi4sW7Zc2jVsFo5dzmZ9bcrWqCNaoACqZ5AkO+zL1UcZw@mail.gmail.com>
X-Gm-Features: AbW1kvY6zAqtN7DpbJq_LP2osNzGY06DZHbY5rNZ6cNAmrexDwp3C5P3rhgzRqk
Message-ID: <CAHk-=wi4sW7Zc2jVsFo5dzmZ9bcrWqCNaoACqZ5AkO+zL1UcZw@mail.gmail.com>
Subject: Re: [linux-next:master] [vsnprintf] 8d4826cc8a: BUG:KASAN:global-out-of-bounds_in_number
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 Jan 2025 at 22:11, kernel test robot <oliver.sang@intel.com> wrote:
>
> [ 53.288261][ T1140] BUG: KASAN: global-out-of-bounds in number (lib/vsprintf.c:494)
> [   53.295106][ T1140] Read of size 1 at addr ffffffff843035c8 by task ln/1140

Bah. That's this:

    494                         tmp[i++] = (hex_asc_upper[((unsigned
char)num) & mask] | locase);

and the one-byte read is that

    hex_asc_upper[((unsigned char)num) & mask]

access.

And 'mask' is supposed to be either 7 or 15 (for base 8 or 16
respectively), but it turns out that this all comes from (I think)

            pr_info("enabling port %d (%pISpcs)\n",
                    le16_to_cpu(nport->disc_addr.portid),
                    (struct sockaddr *)&port->addr);

in nvmet_rdma_add_port(), and that commit 8d4826cc8a8a ("vsnprintf:
collapse the number format state into one single state") doesn't set
the number base for non-numeric formats (like the 'p').

Or rather, it sets the base to zero.

The '%pISpcs' causes the call chain to be pointer() ->
ip_addr_string() -> ip4_addr_string_sa() -> number(), and there the
number base being zero confuses things terminally.

And then when the 'p' logic calls 'number()' with  zero base then
confuses number printing and the 'mask' logic.

Most other number() callers - for example special_hex_number - will
set the base explicitly, but several of the more specialized pointer
things seem to just pass in the 'spec' from the original pointer
format, and expects the "base" of a pointer spec to be 10.

Which wasn't very obvious, butused to be the default, and that commit
broke that.

Does this trivial one-liner (sorry, whitespace-damaged) fix it?

  --- a/lib/vsprintf.c
  +++ b/lib/vsprintf.c
  @@ -2682,7 +2682,7 @@ struct fmt format_decode(struct fmt fmt,
struct printf_spec *spec)
                p = lookup_state + *fmt.str;
        }
        if (p->state) {
  -             spec->base = p->base;
  +             if (p->base) spec->base = p->base;
                spec->flags |= p->flags_or_double_size;
                fmt.state = p->state;
                fmt.str++;

so that the format decoding will only set the spec base to something
else than 10 if the format actually has a base (i.e. is a
FORMAT_STATE_NUM).

                Linus
