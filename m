Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B750C3CF5E
	for <oe-lkp@lists.linux.dev>; Wed, 19 Jun 2024 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718808732; cv=none; b=BTd990+hoj154klCmzxEYkDUuwAqSkXXX1F5wsSJhuSFUeYM1KcYgcDCOlB0FV3sQSxw9IPc0/5FBzNB0oBv4G7efl8Vk1gREicgiB0asVVL4pbw4VjyrLtiGrNz9rUtRhMsnTSRsZbNjkCL61F3Wn4E5JNhCW2S7aa5mnaMzw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718808732; c=relaxed/simple;
	bh=BuOiOKK5aDLx1DsgEYlG7WpZ+q5oJLQJBOiGxO38KCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fs104Rwds2d74gcqoAGck/K07qdtRU6+qTOu3pcwNwkM03DU4kkO3/tIm5wLPNTjzEwLoMDMllxwhqE3fRaqlZ+eagW9O2vn4EAy4zslogn8HLQPWX1ckn4qqc4Zbqdc4hR+pGcYOidXLWJpfjfP9KiFdJoFYBI7tLcI2hC8tao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n0cQbsP4; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n0cQbsP4"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57d119fddd9so8448a12.1
        for <oe-lkp@lists.linux.dev>; Wed, 19 Jun 2024 07:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718808729; x=1719413529; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCq/+wTbdRe/MBrO3RZS+P/9P4jtjVOkuULaPB8CHj0=;
        b=n0cQbsP49oDgpQG+bQNEpG5CI6+60w6BYNhZKxI6Ta7DeuJK57Ydr4cQVcK2bNgbJZ
         1gJi+mrjjsvpLzRYYMwAoD15YS4KdAdO7S9ElDPKTXu77/xQ4LxvSJJsDsC19+gooRmz
         uTAhbc8JhIYK4kN1CxQhGDn03kAe7rwHIsAJlpK+6YNaziLqechv2NRD4f3V8fbqf119
         ZWe9Nomn6stHcF0bUmrTZxfcn5PmW2vz+/WqgEQz04fFfawll4ZfC8GN5dIcoNAE/aJm
         Y4a+7m+f80JippDxuhpHc2NFxRtyXGYkCt73wyy1tKaQvpKrD99FBdGZ9AllYEqNaZEl
         blyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808729; x=1719413529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCq/+wTbdRe/MBrO3RZS+P/9P4jtjVOkuULaPB8CHj0=;
        b=h7QH24XQc28risIW3In9iLvGL2Svgds1Ek2cUQ6wM9xOBSt6aSbVWOwXtbeOLaaV3Z
         cqcXwFGbWp6PqypRAMHO7DeUzBLa1YEeJSUvpjo+8NESqHxqzImbXazwGBVDP8SR4i08
         lnXa+kSIUMV65UrqZtIfuHxxBAOb9d5UzJ+VLwS+kvBbBcALxgKOLXRZ+7LpDiSUrqMl
         1r94E5+mJjUuyRrqomOrnQ7L2nWqdzsxrIk0bAeSW66nVoF5u7jHIn5xxhCQAznuBang
         LtXiqkVStYvFoUJOSG0bw0ZugKZQF5JvrvEMTgEcTJUXlUpTuTwN9vF2bDNsKLJ4CqDj
         OqKg==
X-Forwarded-Encrypted: i=1; AJvYcCV4a1dmPAib313CiHmpyLxI7TAgnluJ9yn6J6MKQxC6VYrvtCHxRofn1F5hF4LLydzurYKEndeUE8K4pJTzl+lAt2yh3EHb
X-Gm-Message-State: AOJu0YweIiX+31tSN5myWGR2vf9dLJaZtARqZGMrsI7TUk2OIGKmDTZK
	vH+0QzoyrIDas0WMWW6akwuLCGNMk/pjirmuqsqDHs+GvjuIBABNur6csf33fwwvgTcu6//8B8N
	Azyyn7HKIuBvJlYgXez2OiOPJkMQGOCwk6S1b
X-Google-Smtp-Source: AGHT+IHeayQHdHc6ZlcrLi4grq50zw8dS0xUR0Buy/Wkr87vPElkshOw/Vlf/GrEiL6XwjjfhqWLGmem7XSf+8s7Xxo=
X-Received: by 2002:a05:6402:4304:b0:57c:b80b:b2f4 with SMTP id
 4fb4d7f45d1cf-57d0d6d1871mr206239a12.6.1718808727028; Wed, 19 Jun 2024
 07:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617095852.66c96be9@kernel.org> <202406161539.b5ff7b20-oliver.sang@intel.com>
 <4937ffd4-f30a-4bdb-9166-6aebb19ca950@grimberg.me> <Zm9fju2J6vBvl-E0@casper.infradead.org>
 <033294ee-e6e6-4dca-b60c-019cb72a6857@grimberg.me> <407790.1718801177@warthog.procyon.org.uk>
 <0aaaeabc-6f65-4e5d-bdb1-aa124ed08e8b@grimberg.me>
In-Reply-To: <0aaaeabc-6f65-4e5d-bdb1-aa124ed08e8b@grimberg.me>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 19 Jun 2024 16:51:56 +0200
Message-ID: <CANn89iLQ+9GYYn0pQpueFP+aYHnoWhqZSws6t6VCNoxs8pwL7w@mail.gmail.com>
Subject: Re: [PATCH] net: micro-optimize skb_datagram_iter
To: Sagi Grimberg <sagi@grimberg.me>
Cc: David Howells <dhowells@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 3:54=E2=80=AFPM Sagi Grimberg <sagi@grimberg.me> wr=
ote:
>
>
>
> On 19/06/2024 15:46, David Howells wrote:
> > Jakub Kicinski <kuba@kernel.org> wrote:
> >
> >> On Mon, 17 Jun 2024 09:29:53 +0300 Sagi Grimberg wrote:
> >>>> Probably because kmap() returns page_address() for non-highmem pages
> >>>> while kmap_local_page() actually returns a kmap address:
> >>>>
> >>>>           if (!IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP) && !Pag=
eHighMem(page))
> >>>>                   return page_address(page);
> >>>>           return __kmap_local_pfn_prot(page_to_pfn(page), prot);
> >>>>
> >>>> so if skb frags are always lowmem (are they?) this is a false positi=
ve.
> >>> AFAIR these buffers are coming from the RX ring, so they should be
> >>> coming from a page_frag_cache,
> >>> so I want to say always low memory?
> >>>
> >>>> if they can be highmem, then you've uncovered a bug that nobody's
> >>>> noticed because nobody's testing on 32-bit any more.
> >>> Not sure, Jakub? Eric?
> >> My uneducated guess would be that until recent(ish) sendpage rework
> >> from David Howells all high mem pages would have been single pages.
> > Um.  I touched the Tx side, not the Rx side.
> >
> > I also don't know whether all high mem pages would be single pages.  I'=
ll have
> > to defer that one to the MM folks.
>
> What prevents from gro to expand frags from crossing PAGE_SIZE?
>
> btw, at least from the code in skb_gro_receive() it appears that
> page_address() is called directly,
> which suggest that these netmem pages are lowmem?

GRO should only be fed with lowmem pages.

But the trace involves af_unix, not GRO ?

I guess that with splice games, it is possible to add high order pages to s=
kbs.

I think skb_frag_foreach_page() could be used to fix this issue.
