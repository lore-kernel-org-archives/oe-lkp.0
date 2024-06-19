Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C66C143877
	for <oe-lkp@lists.linux.dev>; Wed, 19 Jun 2024 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718801197; cv=none; b=tOtDuKlH/fVkq3LgvekhvdhvV6JBiIvrS6ISeORwOW3fE96g6CWdRhQvtYN9Px/ka56v/z32AIySOfFoSXKmjkAdqGd65cHKsao0y0MhOZku73sWBE7GG9dCwdM8MR8OAdpBOu868SVbOTBfCHGKwtQ9ovWR0ijrY6ptCtmwWWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718801197; c=relaxed/simple;
	bh=UPPoYpXGlY2kXJLry7GqQFnMlG9RZLe0V0JUUszjexU=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=ZFX5eW4mxqjd0ZsW6Gc1N61WpCoOpu492K6X4aycaM90nPwSPmoMRI2fer5XIArMaRYy42wLBiK37g+17CYOk1oR+kCj+05Zy/9EhLkK+JG6Ip+Ytm79GWoA9QcvBYjrSJnZzuWzuxizFKDxdELyrRPhqM4/Z08FbeD58754YYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dK6TpCUQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dK6TpCUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718801195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwmL+fG/llTdp/vpJmGydCr3gMOtfghdGY3vAIggc0Q=;
	b=dK6TpCUQQ7Wj2nA4h5bQrC5lpcNbMEfzwMXTTT/EFmlXzYtAeXzhCClHcjNQR5TMLFMpPK
	PEMDZozEkDdCBDbVKk1EZo21uIgS5sE+qXOnb2flX8img0ZBYOBIj7xQT6G1wyUv8qD2if
	KolLwxlyIlOXzopiig7hMXjIK7siMsI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-yKcZtpzFMSihiqWnguMZrQ-1; Wed,
 19 Jun 2024 08:46:29 -0400
X-MC-Unique: yKcZtpzFMSihiqWnguMZrQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4CF3819560BD;
	Wed, 19 Jun 2024 12:46:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.39.195.156])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 985133000218;
	Wed, 19 Jun 2024 12:46:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240617095852.66c96be9@kernel.org>
References: <20240617095852.66c96be9@kernel.org> <202406161539.b5ff7b20-oliver.sang@intel.com> <4937ffd4-f30a-4bdb-9166-6aebb19ca950@grimberg.me> <Zm9fju2J6vBvl-E0@casper.infradead.org> <033294ee-e6e6-4dca-b60c-019cb72a6857@grimberg.me>
To: Jakub Kicinski <kuba@kernel.org>
Cc: dhowells@redhat.com, Sagi Grimberg <sagi@grimberg.me>,
    Matthew Wilcox <willy@infradead.org>,
    kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
    lkp@intel.com, netdev@vger.kernel.org,
    Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH] net: micro-optimize skb_datagram_iter
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <407789.1718801177.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Jun 2024 13:46:17 +0100
Message-ID: <407790.1718801177@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Jakub Kicinski <kuba@kernel.org> wrote:

> On Mon, 17 Jun 2024 09:29:53 +0300 Sagi Grimberg wrote:
> > > Probably because kmap() returns page_address() for non-highmem pages
> > > while kmap_local_page() actually returns a kmap address:
> > >
> > >          if (!IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP) && !Page=
HighMem(page))
> > >                  return page_address(page);
> > >          return __kmap_local_pfn_prot(page_to_pfn(page), prot);
> > >
> > > so if skb frags are always lowmem (are they?) this is a false positi=
ve.  =

> > =

> > AFAIR these buffers are coming from the RX ring, so they should be =

> > coming from a page_frag_cache,
> > so I want to say always low memory?
> > =

> > > if they can be highmem, then you've uncovered a bug that nobody's
> > > noticed because nobody's testing on 32-bit any more.  =

> > =

> > Not sure, Jakub? Eric?
> =

> My uneducated guess would be that until recent(ish) sendpage rework
> from David Howells all high mem pages would have been single pages.

Um.  I touched the Tx side, not the Rx side.

I also don't know whether all high mem pages would be single pages.  I'll =
have
to defer that one to the MM folks.

David

