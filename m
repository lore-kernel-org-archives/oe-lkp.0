Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19F9446AB
	for <oe-lkp@lists.linux.dev>; Wed, 19 Jun 2024 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718808990; cv=none; b=ClH5pxKp6M5oCzEIAnm1BxDJ+ueCy/T0jXm1eO1Y2/spssTjE/IuawkdwT3q0dqRouIEnVoXpZ1lLwM0MriOXwHVVY35Syude1UI8biF05rPZ3C5rl2XmrZbK6wskCkCTkdNucPbzd/a6WUVq/tvr1JUMt5i3MQhZjOoTyMWiGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718808990; c=relaxed/simple;
	bh=mW5+fCVHeybh0B32xcWiOOoTMwWpS8c0Mq/7VYHU2Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhmrTO+maO1KTUSE/I/YN8C0IoQ6wA2/2QgOfitIY+eCaLeILrX772QtRkurLfB7iC8UyhRlTzZqqa6pA434yrRK6a21gQ9+EyuxrZpxdY6k6d7bmhfXGOA8PpM6ef5jgyewKrBmDwLwOjwMkoxI/BDIecTfkc7x/znn5VZUD/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rYNGXSxV; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rYNGXSxV"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57d119fddd9so8509a12.1
        for <oe-lkp@lists.linux.dev>; Wed, 19 Jun 2024 07:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718808987; x=1719413787; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dscl6UrpkREHEcEax9S2VtvCljdvXW5W5V5gZgFuc7Y=;
        b=rYNGXSxVBfKnkRLWXuurVuk8aSsItpLpXxXExxjXqBa2cmY7TzVaLccLWGWjIpy0k0
         vKCII5B1hUyGBnflhuBQGVcydwZKWcGxFhOHirCrSAGbRoKzorMay3/W3FXTML802Rwd
         eO4+jHmi8vDKtIEoVqLXCqZPq5Qj3ZtoYg8mIZHT6w5O9hq7fVhpN8FGfTUhHlSefqH7
         sVNfmIXi2S2cm+AtXVagFrJCLHdYXATZvOA72xYbbr1u3Z4GX0/3HmX+jVTri4Ubd9oU
         jlbl43Hj0+MzozeCvjU3zTZ4ImmglwWApNoL+8PyrDtGUPtm+hyne3JZo1NIJS5BICPv
         daRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808987; x=1719413787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dscl6UrpkREHEcEax9S2VtvCljdvXW5W5V5gZgFuc7Y=;
        b=kj5x+WPCMTU2AFcs94DHwQO3gbj1CTqZBeiX4pYr9HCztFXgQyc+IWZVRU50SPREeK
         rjUW7OQ65TpxHNte2j9ica3RtHKVfQVNn99xyjd76mV1l7+b8MVmyqWAPFJR4IPYv4ng
         zPvtcsk9Nj/0Nd3ubBavihQzfWGQh/YOjv4q8ddqOdcIEPHMd512H/N8Jk0z9fjFL+mp
         iNY5e76HiW9L6MKWVRAFfuHJN1Fhb/AJ/pnMzC9tzc7MTu5RbkMeMksUaG5xfZr0ZytG
         V3DjnX6ZjDQhL1fL5LlD/wNSe/i3qotobNd4zybq2Xu+NG8IjWQrowc+lqsyZbZr/5Yu
         PslA==
X-Forwarded-Encrypted: i=1; AJvYcCU0+OIjxaSGCd98qjr5FSguu8mMYkFcNOcplj+9Ag6weFElJobCH+S5BhbRDzVDnV6ke9Rv1dI/DLwReJtgs5PMtgVknXt3
X-Gm-Message-State: AOJu0YwBdz5nMQ9SATH/0uFNRkgU1TiskB/ZHo/e0Yuk8AIiesqIGo18
	pxelU3i5G7DTcM+YkSv4sG7BS9CbbuGhb3MtKHl+m/zt6JDd7tzs+WScCSRW25/IIxp1p0uFhhR
	lTEV8uTz6fdYaz9Ab//MHQDJoSJSD6emTulv2
X-Google-Smtp-Source: AGHT+IHRc1QplqwYcX+VFOj/+h1rSrrKLd2FNFrokx2G8bh3D2DzsdBKUJmVOIzynujozvQFogwYWDtnO+ie71qDhxo=
X-Received: by 2002:a05:6402:4304:b0:57c:b80b:b2f4 with SMTP id
 4fb4d7f45d1cf-57d0d6d1871mr207302a12.6.1718808986678; Wed, 19 Jun 2024
 07:56:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617095852.66c96be9@kernel.org> <202406161539.b5ff7b20-oliver.sang@intel.com>
 <4937ffd4-f30a-4bdb-9166-6aebb19ca950@grimberg.me> <Zm9fju2J6vBvl-E0@casper.infradead.org>
 <033294ee-e6e6-4dca-b60c-019cb72a6857@grimberg.me> <407790.1718801177@warthog.procyon.org.uk>
 <0aaaeabc-6f65-4e5d-bdb1-aa124ed08e8b@grimberg.me> <CANn89iLQ+9GYYn0pQpueFP+aYHnoWhqZSws6t6VCNoxs8pwL7w@mail.gmail.com>
In-Reply-To: <CANn89iLQ+9GYYn0pQpueFP+aYHnoWhqZSws6t6VCNoxs8pwL7w@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 19 Jun 2024 16:56:15 +0200
Message-ID: <CANn89iKukukmyL_FERQ25bBhkfv-_oUpOW_WFd4=GUFNsJN6OQ@mail.gmail.com>
Subject: Re: [PATCH] net: micro-optimize skb_datagram_iter
To: Sagi Grimberg <sagi@grimberg.me>
Cc: David Howells <dhowells@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, netdev@vger.kernel.org, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 4:51=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Wed, Jun 19, 2024 at 3:54=E2=80=AFPM Sagi Grimberg <sagi@grimberg.me> =
wrote:
> >
> >
> >
> > On 19/06/2024 15:46, David Howells wrote:
> > > Jakub Kicinski <kuba@kernel.org> wrote:
> > >
> > >> On Mon, 17 Jun 2024 09:29:53 +0300 Sagi Grimberg wrote:
> > >>>> Probably because kmap() returns page_address() for non-highmem pag=
es
> > >>>> while kmap_local_page() actually returns a kmap address:
> > >>>>
> > >>>>           if (!IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP) && !P=
ageHighMem(page))
> > >>>>                   return page_address(page);
> > >>>>           return __kmap_local_pfn_prot(page_to_pfn(page), prot);
> > >>>>
> > >>>> so if skb frags are always lowmem (are they?) this is a false posi=
tive.
> > >>> AFAIR these buffers are coming from the RX ring, so they should be
> > >>> coming from a page_frag_cache,
> > >>> so I want to say always low memory?
> > >>>
> > >>>> if they can be highmem, then you've uncovered a bug that nobody's
> > >>>> noticed because nobody's testing on 32-bit any more.
> > >>> Not sure, Jakub? Eric?
> > >> My uneducated guess would be that until recent(ish) sendpage rework
> > >> from David Howells all high mem pages would have been single pages.
> > > Um.  I touched the Tx side, not the Rx side.
> > >
> > > I also don't know whether all high mem pages would be single pages.  =
I'll have
> > > to defer that one to the MM folks.
> >
> > What prevents from gro to expand frags from crossing PAGE_SIZE?
> >
> > btw, at least from the code in skb_gro_receive() it appears that
> > page_address() is called directly,
> > which suggest that these netmem pages are lowmem?
>
> GRO should only be fed with lowmem pages.
>
> But the trace involves af_unix, not GRO ?
>
> I guess that with splice games, it is possible to add high order pages to=
 skbs.
>
> I think skb_frag_foreach_page() could be used to fix this issue.

For reference, please look at

commit c613c209c3f351d47158f728271d0c73b6dd24c6
Author: Willem de Bruijn <willemb@google.com>
Date:   Mon Jul 31 08:15:47 2017 -0400

    net: add skb_frag_foreach_page and use with kmap_atomic
