Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5BB132103
	for <oe-lkp@lists.linux.dev>; Sat, 22 Feb 2025 01:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740186285; cv=none; b=RPVZVpf+h9MdMIqRXP9CJbJ1tsNQvkhjiVDp28k8be7EgoMflTa3xRF1UMnsWSDmcIx1RF+8pL9cUreFzvmNcTv2IIbhxDbb2+tt79uti+LieXISKW7pa2pTn2E7zHVLvFKZOrhtRkJZk+jKWZ/g/6tIUi85Iu4jG9RyUGbVoYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740186285; c=relaxed/simple;
	bh=xSEFwPHHuqn6WOD27TUsOG/VeOL/M+h2JMArFQxwNPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Klb96wXYQCcqKiqM3xJthc5xjEH5IfNW51XvqbXbCjOevhXJOReZAlI7SBmgW91v5J5AvyAYcLdnxYnkgGyOLE9cBY345fjsLOMJAe0v8dpEYz/x33c30UY2HBwSuz3ajOrNZc1ESguU+euVD0FNLDU5QRujNP6ufvvii0nvKtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWhqFTHR; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWhqFTHR"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5452ed5b5b2so2724077e87.0
        for <oe-lkp@lists.linux.dev>; Fri, 21 Feb 2025 17:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740186281; x=1740791081; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8JLpo6gPqmIQu0zuiirjXHwZLQHSKXUqPNibcTvgIQ=;
        b=VWhqFTHRPpAX5AaMO/ETDGZbyPf+np1KhJSaD4g5xBEFZcua4VlxvMA40Wkh8keP7A
         t4mrjoRGFKCdWu/xqNKKLv3KyvS5JF60naB4D3QrPuRoKd2MxqX/FDIjS2cjBpr9DceZ
         6RnTLiOX2Q2b6l78Emiy0eXZT0PQm72O4RRaLdg7M6rkkXgR+3PnShTVuLqyFr9UoefL
         7berrX5FnuZXWL6aiaUoCOBq6Y8TATHutMcsRhX2HdwnGaMBmoulH4pKSKpLgb1UzZCS
         mIwsbIEz2fkuaiyTiXHXZhwdhluU5oXVzCOb0zDrqj9X7EnWiGpco27qhRujh2eqLUup
         gTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740186281; x=1740791081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8JLpo6gPqmIQu0zuiirjXHwZLQHSKXUqPNibcTvgIQ=;
        b=n73F7vC23ds9tmB6WHve7rqUFQkexDgkJaIaORkMd8ImI8T3/O+epWIumDe0Ce4ZZq
         cIbkLmxropdmn1fc1orCWK4JOpTrB51MG2XKOFgHq1pch36naMK4ZWMw5K21XAUSUMy5
         2dGCm2fj8P+jrcWzxs8XT3K6kG2f++bFFcjGRAJVr/OKNv5AfwNQBKCpPhU9VYVyyZkE
         7K0WMAp2ZbGzIprb/m1s4Fi7uCPCfUn8KTPHXjmJr9hhCRUbLxc0AKkC7hcABzNv+Q9u
         X2Nx44FEJFhVyqnXabmPskgn4SIDjkBq10p4qSY58qDQQQ5EmYGBbNIv651TSG1YtsgE
         I7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN3HsPnERIObaQiMXata5q598Pm7c9Kyx6PfU0cWddtenAU5caVt+W7MjIeJfAG9trBQl8SY0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh9XfMeCx9whASJeHte8VMm9KsEy/uwSNzDvJbYX+JsS7fLIRL
	r7BLY7EXGFq+t/TcnHcj+lUdXL5HL5KMUiDIWLlWexEDnjW4VT9Ucz3iiHkxTBGoE+mq41OBmAp
	Bl97vTciRfdKdYBlecO1Edm/hd6w=
X-Gm-Gg: ASbGnctn2nkPbGo87XNgv/odD3D4CRThYAPmofkaVZ3YG3LwSJSiaj1DLbQnrELUO1A
	XLA6+NAbl+PBtMg4y7NTSu8kOUZyBhCnHVWgXhFcwCB1k0VfyW6brGWnzUxD+PJXevxuFUPzLp3
	UwAvZ6TTmNIWAP8NjtTyVKl/y+NkLjnkimLe/7lLfS
X-Google-Smtp-Source: AGHT+IGBNPiBK1v8Us3bv1gNMHHoSYyg+zMKu9ngjXSCjnGfZVGpyumH2OLdxQjGjjisZObuShbQnlshRZPMS1MDlMU=
X-Received: by 2002:a05:6512:108b:b0:545:1240:24f5 with SMTP id
 2adb3069b0e04-54838ef8830mr1911247e87.28.1740186281335; Fri, 21 Feb 2025
 17:04:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217-fix-prime-numbers-v1-1-eb0ca7235e60@gmail.com> <174018582427.3369509.6023266709728991391.b4-ty@kernel.org>
In-Reply-To: <174018582427.3369509.6023266709728991391.b4-ty@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 21 Feb 2025 20:04:05 -0500
X-Gm-Features: AWEUYZmWse3-zILqxoP98Pjv6TObdBAr1xPQiPqLyd6LT3_YW1lyt_kKKgB8hxI
Message-ID: <CAJ-ks9n6s_nUzZ5NxLFuySskKCEf0cEXht1R0uP0iF2BN_4ZSg@mail.gmail.com>
Subject: Re: [PATCH] selftets: lib: remove reference to prime_numbers
To: Kees Cook <kees@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oliver.sang@intel.com, oe-lkp@lists.linux.dev, 
	lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 7:57=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, 17 Feb 2025 08:30:44 -0500, Tamir Duberstein wrote:
> > Remove a leftover shell script reference from commit 313b38a6ecb4
> > ("lib/prime_numbers: convert self-test to KUnit").
> >
> >
>
> I fixed the Subject typos and applied to for-next/move-kunit-tests,
> thanks!
>
> [1/1] selftets: lib: remove reference to prime_numbers
>       https://git.kernel.org/kees/c/03d0e920d775
>
> Take care,
>
> --
> Kees Cook
>

Looks like you traded one typo for another ("selftestss"). :)


Tamir
