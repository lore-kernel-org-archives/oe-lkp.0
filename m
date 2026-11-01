Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793548025;
	b=g/ItHcQmERPxne0CJIltF1SvOGpMLweEJYVgkWUehXYvs2eBPEXILwtRjKs7aQq8fj5d
	 P8HnMnCU6tsgUL3oofoePcnewkHgcCtpmgdvsCZT3GCMId5QVA6+mpJvpZ+46DVeHKyZv
	 9JW5n+xHvG2rgV2GMFZ8G0zRQ+xNzt7BR27jncr2GpXeyHluE43Jyh2M2cx26NoAx5rWN
	 S8L8uq5elgo4uYPQ/mP+sgzY3FWDXzcHPf/S9XFgRLCcXsYU3uMpcQkxU9uPA+bliYa/9
	 ismZKhu3YMsP8dzThsrJQx1mN0zsvalow/+rzd0qzvaVVf+SvMXuTFBdPgsgJkh54bQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rnvo9UG8/PyUCxjRTNkK2BrtMq0/hvvsz56LwYy2AKQ=;
	b=0/+aTbWH2lxBzMT7LkmGUA82w/HfZ+GmNEMURwr1akkhLzVplbM7WUQy0njQMJfWR+da
	 AxadLFZ1CZjZENmub4j6bk+MNTGfU9KwJEHIyMMWj5LDYiIZRQSf9Bz9c26fZUmMSymdH
	 BjBMBR51pI2QB2eT7mvitWBIhbGx0yzLlO/2ddtTY8WiJQ6s7vOocw5rCBexJ9pLbq+ER
	 6DwuEeQIH5Okp2Dm2lDSgE649uW71AbgN7M4hBl8SSCEO+WUzyVXb8KAgOGFK/UXMrfSD
	 c4X11krEwODhQR3KZBTwpFzzcNlslLbTquIgtgUmrsLbhjOetdHoogNQMSCbqf7YqoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VXgImDvg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25605606A326
	for <oe-lkp@lists.linux.dev>; Sun,  1 Nov 2026 15:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25605606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VXgImDvg
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533202fe429so263861cf.0
        for <oe-lkp@lists.linux.dev>; Sun, 01 Nov 2026 07:47:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793548023; cv=none;
        d=google.com; s=arc-20260327;
        b=Jzli2+8t/QfqivNrODYGis+TNrXZhQK0t1cU3ewRsF2wjulkIQ8nYwjLYc66sNPu0k
         ZUFh5XrfXyAYAm8GrExZKiJcA4//15q75LP+OBEaIqLiZVFW5JRxCL+qRDmRri2tyrvr
         YQeZBc/ocHkxELGoMFt3Ijkr8F6BxCoZAr03q78RnODd4Lz0CuYv8/5jfF7RAEK7h/Dj
         QADlFdVM7Q3/9rXqCUHKjMFz9/QFWkml542baf/uLfVJmTjSRyI2xJ9jv9FgyBiF45cT
         lCfbSjGDOTnYxZFoFO12azYjCWolPryZYyNhnVuI74DcQpzHSZHpQgagx9C6BeJIqsRF
         cC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rnvo9UG8/PyUCxjRTNkK2BrtMq0/hvvsz56LwYy2AKQ=;
        fh=lr0jailW2i7KxtOTWRnS2TPUxdxdNaQ8IDbf1qRoWpg=;
        b=fUJrTYJfWfL7IH5bdeyf6Hcjmj8UHZjotwTpY1sdJjrx3Gtq521zJgnrBjLgahFb0+
         II5hY5SOWNIR2eYWrcAm0TRtKUoR+2UkYe5y6KeXBuFOICZa7SUWMTqoRfe7tPO0imr5
         rPrRRm6iIS2YsiWyKsSPJEALbVFcqvPsVJKPSi1OmJFSDS9TvCm2ZFlOM2XPKsDf7S8O
         JYYXBhm0qgL+1bjWC5RM+XA1++qp1axfjh/OWeJ8svQQvYiuqjgF7upb+TjO36X/PJXY
         fGuUzqdr42bMYhf575wauEyVl7ht9aeXvmYPm5H7C2t+KTtSwHR4bnZPSEmQV1+cVkpP
         JzVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793548023; x=1794152823; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rnvo9UG8/PyUCxjRTNkK2BrtMq0/hvvsz56LwYy2AKQ=;
        b=VXgImDvgS7oTlns/TWxAPt+tVxTN7RK/9XGeixMaq5HBEQxvos9TUuEUkHOWMBE6jA
         jm2Jweqeu0H9dnX7EdeKRgGoHN04tW+8IDm4UT3Jf3dgMGelDDFUnSrnk33ygc5+pEdz
         zvpD1x02/pJJTU/1HDygthE9CrlbL8MDVIxyfPRTJNd6oiFky2QBuvk9AkEvBMVVwmsw
         i3/dB2uhM0blUwEhd1+Dvpv2/R/6A16xIWVySp1NZBYdpHJgN+FeRTVDN6ei4mcGKXWB
         dpmYVbSQYrK+ijFBRakRkNMmzpQZ1rArL/ctJEZD0znzSc+3Mz4AWtMheTZCdvlM0OFO
         sgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548023; x=1794152823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rnvo9UG8/PyUCxjRTNkK2BrtMq0/hvvsz56LwYy2AKQ=;
        b=IlDXkJtaChabMn4n9s+u6YnHko+XKjbYC7CibLSyGE3rIs6VcumEavCEzOZGTG0088
         URbBnAV8DC48L0GZQIZFMZbfgc0oanhuoj0CUNUBZUW/t4fvNcbRmFhuIfgw9LBdeBfa
         O2SZVmV4+cXxJgR+7So3zlzw1F/kIy0GWDcvrLgo4OjAb8qjd6SOGZ2grif6eL83lxkb
         AeVPDzdS1FVsu9bhd67bAaGlrhODjkpZ6tuZ33Yc3bmfj+lcAFQopy2tQKOsgbOkww6n
         qQyDFYSzjtoYL1UVjkhAoEb1VsbCgiqFvXsQg7PTPeSXd5kgBg/9wV/BiGVn9qllx7yH
         5XZw==
X-Forwarded-Encrypted: i=1; AKwUvBxL3TtcR6TtxzYcGOokr/zV+OYuJRjaZfRJwEptiNYOe1JxWNRYllmjLxz62AZ/0FkHqcOa2e4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJwNt3/EN+m991Aof1SNfJ8GW256PXS5x1HjuFnz8PJthdW1EOt
	qE/mKgMbQOI55tJqyACBTVKtlPX8BmJLXB3RbrEkAYzBs379vAyuVJiLRGq2wQpa/0ulh8L3T3t
	jle+VCad6WyE9ZO/7kj4B+Rw+WOWrKMpEtRfwLn/iECTnC+xnrqQqXaGSojA=
X-Gm-Gg: AYBFou1VyZTxG/dDksjcmrgp1jtzOjAGxC7pu1tLrNa7R1zYlYD3OxLdfCNv/KgTaBW
	3DQv3Bp33TAEUt8Vxh8WsZwu2pflRUlmp24wrSewYPgid96i0NCc1KtrTNAXeB4rEObgy8tfLfB
	4qMs2G7WyfIy3yZme6OzRqtNTfoXTZrb9P2camCWkhEEEAkHwAa27Wl8ZLivUptGfg8JfdUQO2d
	JMzxzvKkiclSi/HBvIk29v89el6q+SKxBstUWIL4YFcqtSnai4xU+JFEXJrQErHf4gG9P1vETxh
	YjdWKxcGZlcKBtxZoxD6jFoevFBp8G2fS78RSv76zz5fde7Mx315qbyZbDrvDxHoN9XQPL9q9ld
	d1wB8n1WyYtqMAfVf0mBhuVG+PHPzJBgfcN93JofG77GUUP6GfwVpWDjd
X-Received: by 2002:a05:622a:2b45:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5414ebdf590mr76624581cf.14.1793548022450; Sun, 01 Nov 2026
 07:47:02 -0800 (PST)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028051312.1505295-1-surenb@google.com> <auHK3k-W4gfL_MhI@pedro-suse.tail5790ac.ts.net>
 <auJO9al4lmAczLAu@pedro-suse.tail5790ac.ts.net> <CAJuCfpHAFXDXs4ZBrd8C=8hkQdJxcWCz+DER5BG_Ki0ndGpf9w@mail.gmail.com>
In-Reply-To: <CAJuCfpHAFXDXs4ZBrd8C=8hkQdJxcWCz+DER5BG_Ki0ndGpf9w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 1 Nov 2026 07:46:51 -0800
X-Gm-Features: AclHuK84MQqzMKZd-OXYE0wk48ZMx_UhE8Hg8QFqNvu-tilXapmhIB4d1-01OeM
Message-ID: <CAJuCfpF=DdYZ7UFH5vNJT-qoF9qrDBW7pgk7tHeD5Z9X7PH1og@mail.gmail.com>
Subject: Re: [PATCH 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	jannh@google.com, liam@infradead.org, willy@infradead.org, paulmck@kernel.org, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:59=E2=80=AFPM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Wed, Oct 28, 2026 at 12:42=E2=80=AFPM Pedro Falcato <pfalcato@suse.de>=
 wrote:
> >
> > On Wed, Oct 28, 2026 at 10:14:19AM +0000, Pedro Falcato wrote:
> > > On Tue, Oct 27, 2026 at 10:13:12PM -0700, Suren Baghdasaryan wrote:
> > > > Pss metrics can be affected by map count even if VMA tree stays unc=
hanged,
> > > > therefore test checking VMA tree integrity can't use them. Use Rss =
instead
> > > > and pre-populate the VMAs so that Rss changes if a VMA gets skipped=
 or
> > > > double-counted.
> > > >
> > > > Fixes: ca5480fb53fa ("selftests/proc: add /proc/pid/smaps_rollup te=
aring tests")
> > > > Reported-by: kernel test robot <yi1.lai@intel.com>
> > > > Closes: https://lore.kernel.org/oe-lkp/202610271934.fd287c3f-lkp@in=
tel.com
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > >
> > > Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> >
> > Actually, now I'm wondering: isn't Rss also flaky if memory pressure oc=
curs?
>
> True. Sashiko's findings are also interesting, so I'll need to figure
> out more robust ways to test smaps_rollup. I will post an update once
> I figure it out.

I posted an updated version at
https://lore.kernel.org/all/20261101154503.3203036-1-surenb@google.com/
It should work under memory pressure and also address Sahiko's concerns.

> Andrew, if this test failure is causing issues in the meantime, please
> feel free to remove the ca5480fb53fa patch until I get a better
> version out.
> Thanks!
>
> >
> > --
> > Pedro
