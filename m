Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A448721B905
	for <oe-lkp@lists.linux.dev>; Sat,  3 Jan 2026 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767443025; cv=none; b=OHkhIOo5hq/ItzEITkAAje9Hxh/oEjD/ctS99DUKvA2VOgAycXMslHmyfVH7j39lPatvr/Oeihr354pB3yqRFRGua6sxvUaeVIsjNWYyLBClukVeGohNHwfs81qpH1RhC4q9xAlP2HoKoGwkaEjpKYyHWceMKBplyU7lHAiEiCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767443025; c=relaxed/simple;
	bh=m6jgfvjdXKce/Y56Uh2xKPlSryR9uP6xV1kv0bVMxJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O13+2Kuzaa3ckQVuaxgtwC34Tc5yw8bjWVT3Qv10CgkVBVK6yxWsjTVgvEq9YMGAzApH7mGI7AFeAqPhkSCqObj9Gm5R98Mh8Xef9hDRa4CktPgLt3VMGDUgGhv9nUaZJ7YXjNuPRX4GHNoBUCRk90DK0aCceImIlZRSvbCPkeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSkdHQGb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSkdHQGb"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7a72874af1so2155315266b.3
        for <oe-lkp@lists.linux.dev>; Sat, 03 Jan 2026 04:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767443022; x=1768047822; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6jgfvjdXKce/Y56Uh2xKPlSryR9uP6xV1kv0bVMxJw=;
        b=dSkdHQGbDSBmxu2LwMT5RNP/xwX+Q82eA8aQba97rfv1vvU4wMF2EN0+POSsEUdwei
         05/6vVNWgSmahxlf3g0BsTpo8TDq8lpIqya/0+SZfeH7p5IxI613x8VQ/tCL18B18I4O
         /LeGidt8lBv0MODq1X5MB1s2tnt8ufS7E/zaEfI6mrLU7ElJMK74m2YQsdgr2QN0dzY9
         oA2bEdz3l0Dg9ie1IV6fYGRVNLrkEuGQhkJiX2k1VPqCHrwYD/Y8DlaMw4E1N1TDf//r
         5+ptf74hOKKCk5lbF+MhiJjbdhd92u7+Q+CJE7hltsunkVXPSUeU5zLsiNO9fjDh2CA4
         pm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767443022; x=1768047822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m6jgfvjdXKce/Y56Uh2xKPlSryR9uP6xV1kv0bVMxJw=;
        b=Ouj3cAqOsaSKpE3MdvlTjWNEEHwSMfKR6TrUmogl01hfdeInlRkAJ4etnVBNUJzktb
         JDXtvbaGwN5fRtY/eH+63olsNdMA3sN22sIcyYCQKAkMi+ziZ4ufVcqZR7UT6NE/5hFD
         sE+KGw3PI94mN2KVGUlfJq22w+nLLVcF3wYrE2Zj+RBhOmNbdriCulozgEwd1p1lscMq
         7fuRCZ8TtNJYGt6cp8lmbcs7awXkPe3YONtyOaVaPXs/+UL8IE8iwaS+c5FjeGySoBUc
         CHfn8ItNkIFbfA0zNZZUGBDIlu1dtHVJd5cPHPh8qSQsmkIJhS0ZwXddp+Ubn15KOlkm
         GrFg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5TytyeUeH1vUyAobWo8rT6odPGWbQ5t7ZeAxU72Udnyoi6+Jw2qkTI+oGmseFn3TF1Z2AF8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0yXCJUbnK1pyGuYAE3tK+gTGY5vZDbC8hi9uBLEM/ksTy4kfX
	/nHnzuq8lB05H4RG4jXTuZWEJI+B8KM5z03wOk+ywBEZfHXxit4lQRmgqHqmCZZgIVCBZffR4pU
	irfj943TpBhjUqVq+ZkpcFgaq+CMt20A=
X-Gm-Gg: AY/fxX5BN5Ph3judWftC7nw7o5hX6VYf7eyT5qTO7QRSn7t+BVr+4XEEASMDvKLuSwa
	bg8bcv6/ycTRAfYZ36JIbMbMvuOiLsN6ownhA9aFv2vXENdpthQWg2GTCC6I7mBifAHUPQGU73V
	xrsxtwo9f7q0uYomFJiu6EyAhX2NayxIdE5Vbw9zMES15ySJVbQ3zN/cbRWc/PUSgKINWRqnlX7
	OVDZ/zd2PKHx/trcgme35mPA/cCdoW4JONepQndhfOHcgMAWM8wt/Nc4mzLBUuk68vpHhmZSQhY
	8+PcjeNiyA9L3aq9Mn29i2XPTlk=
X-Google-Smtp-Source: AGHT+IE1gRL8BhgE4+lXikTnNzAC0eTfQiwQLjGbh0gUd6C06JN8p0K8s/ghjbfoGle2qPq4ieQsjvyMU/7Qtke3g10=
X-Received: by 2002:a17:906:730f:b0:b80:b7f:aa10 with SMTP id
 a640c23a62f3a-b80371d8c5cmr4738002266b.59.1767443021786; Sat, 03 Jan 2026
 04:23:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9fbb6bf2-70ae-4d49-9221-751d28dcfd1a@redhat.com>
 <o6cnjqy4ivjqaj4n5xphstfnk5jznufaygwmfkm2gyixqgfump@7fc6c6h6d5if> <28f144f8-431d-4c3a-a362-56083bb77541@redhat.com>
In-Reply-To: <28f144f8-431d-4c3a-a362-56083bb77541@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sat, 3 Jan 2026 13:23:30 +0100
X-Gm-Features: AQt7F2o99ArbmBWfoJL21d1uI-qfg7vjOZ5qXmX4UFhuPDRSfkoorw_TiFY2WTU
Message-ID: <CAGudoHExNovL=EqHLqV4RAd1m-a2X4nhadZ9OGyxW6AXNr-8PA@mail.gmail.com>
Subject: Re: [PATCH RFC] fs: cache-align lock_class_keys in struct file_system_type
To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, David Howells <dhowells@redhat.com>, lkp@intel.com, 
	oe-lkp@lists.linux.dev, Alexander Viro <aviro@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 11:45=E2=80=AFPM Eric Sandeen <sandeen@redhat.com> =
wrote:
>
> On 12/30/25 4:04 PM, Mateusz Guzik wrote:
> > Instead something depends on the old layout for correctness.
>
> If I add ->mount back to the /end/ of the structure, it boots fine again,
> so I guess nothing is expecting specific offsets within the structure
> at least.
>

That's makes it weirder.

> > By any chance is this type-punned somewhere?
>
> I don't think so...
>
> > While I can't be bothered to investigate, I *suspect* the way to catch
> > this would patch out all of the lock_class_key vars & uses and boot wit=
h
> > KMSAN (or was it KASAN?). Or whatever mechanism which can tell the
> > access is oob.
>
> Can't do KASAN or KMSAN on i386, AFAIK. :(
>
> I suppose I could try such things on x86_64 just in case something shows
> up...
>

The sanitizer suggestion was to get the kernel to just tell you where
the problem is.

However, you can still use qemu's debug facilities to figure out where
the boot hangs and take it from there. Ultimately this should be
mostly a boring investigation, even if chore-heavy.

I have not used the machinery in over a decade, so no tips from my
end. But obviously it is there. ;)
