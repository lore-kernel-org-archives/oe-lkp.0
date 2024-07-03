Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239F317B4E9
	for <oe-lkp@lists.linux.dev>; Wed,  3 Jul 2024 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014801; cv=none; b=tyurNBS/AhJ2JDCl2e0KsGpR4boa0SkyzgHAoRUS2cz4z4+tc5KtpokIAkA7Btalys8HPbsEq94LcPoIzwzXkYnj4ze3xL3fk3Zgv19sU1+3ve/8Lc4jPJyVLLW8yqfJfLjf1xuQNEeWth0tYbryjnOcwaXDHptpD2p3rCGTE+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014801; c=relaxed/simple;
	bh=1GH7KX+lpfOnJmvxrmPjcZjtj3PiPEBsrhrFLFo0EqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URmjxZetSWOr8WBp9r9hDlMx9ublpikGQFC/IMasPsJgKRYFwe2MtaMC4zBOfxauGP/UG4MX/W6JuoAo/2yYfY4QpZ9qhNeNcfd1NlUIgu5RIdgiPvWh6FVpx1wfQ8wa+3L2ExL5+1USZxOTou+/GUTteFJs0JVAxUjlZFDHYys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCsyEIV2; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCsyEIV2"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a72459d8d6aso564048666b.0
        for <oe-lkp@lists.linux.dev>; Wed, 03 Jul 2024 06:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720014798; x=1720619598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WNsoF1dP6vGJ9qPRYJ4Nm9afRtYjJpZP/prTQMZ/X8o=;
        b=QCsyEIV2jEaUzTdLR8Fnt8GwpIUhuYYyItyy36P2PRZAXv8Oh/ikCcP/m62GlmxMbU
         ce6zrNEmAdy+ixVXnE7nDCKUwgtesiXImP76NnRPUPFZ42XuJxYgtF99ykQR6821dz+8
         0WqEsPSKLSJtzwTkon8DQ2WdMsHQORWvZpg/9aI9odAIYfPEYAv+kKcJeMZNtn2RZ/wS
         UbQdZzKpS831b72cnaNtaqjkYz4l9bqnA5C6pj2Uu21LLen2tifxzjZTF3XG9p5JNSAQ
         lyP9h17eHEmnk7EkjlBb90FH/NAR3MpXZnCr+2HS2v4BIa+PULG2Sp4V5O5mFkm564jC
         CcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720014798; x=1720619598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNsoF1dP6vGJ9qPRYJ4Nm9afRtYjJpZP/prTQMZ/X8o=;
        b=ULZqjza6hXPVQYFbBKpRYtc8u/woRyrRgSdla+aprt7KglGFNHJOtczH+XGvPdbJ/L
         8SZSUKXIgKo2MqUOzkTWvlm9vP0sXNOweldwytwGGQ93Yc42n2RIumn6ZS1XL01kEE2C
         ma99OhyJFMfLUdJZRQWeLAlNuz7wwPN5o3wWcif5+0DrhFyLYi0gs2cA/SjULoXmCi6c
         ESGMt2yw8OciDYFrIMUZGUhvAcF1qy6lCYn1cfQLN1yiRgYGFyRlT6zdbkWkU2GbGF8p
         gXLDGMCN5bhm7pFr1/GSlpHV2q+H2Ji7Tg932stHqxBSNywjMEbfqaZhuBC6RrOybH77
         s/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUojCOmbUljeHPbYzaByi+8p9soKsV+f0UjP0JqNLn2566Wpvx0wixtz9sUKAqI2McUZnj1F4ag69xX6yY7g5l67pp/qUa0
X-Gm-Message-State: AOJu0Yw62WcQCVrD+FUx2oTxICsQg5F+pq++Lbkjk5xgOXSx6D4Tx2Qm
	rf1W6eNhd+YNF48AG3v5+35YuWyXHw9RwEVgEWktzg41TBoldffZ
X-Google-Smtp-Source: AGHT+IEFwG2a2heX4Ew995cCwgqt2PoyU07ntTaJh3FewhD2gMwaGCACyn6wl2SdSLJNhHXGxlQByg==
X-Received: by 2002:a17:907:7676:b0:a70:7a10:de0b with SMTP id a640c23a62f3a-a75144301c5mr741197566b.21.1720014798072;
        Wed, 03 Jul 2024 06:53:18 -0700 (PDT)
Received: from f (cst-prg-31-46.cust.vodafone.cz. [46.135.31.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aafb95b2sm509091766b.96.2024.07.03.06.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 06:53:17 -0700 (PDT)
Date: Wed, 3 Jul 2024 15:53:08 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, 
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
Message-ID: <du5vnvwygzbtal6qogmxckawwwxgbppuq5qi5aeqcs5unrlpz3@3k5degdvflzq>
References: <CAHk-=wgnDSS7yqNbQQ9R6Zt7gzg6SKs6myW1AfkvhApXKgUg4A@mail.gmail.com>
 <CAGudoHGuTP-nv=zwXdQs38OEqb=BD=i-vA-9xjZ0UOyvWuXP_w@mail.gmail.com>
 <CAHk-=wgVzKtRnvDXAzueJTbgfo1o12Lw6DH97PzRe1cGA_b1oA@mail.gmail.com>
 <CAGudoHH_z1a6MX8Z8Cqbz-jDTUoAjoxdV9KrQ6yvUkNszXO5aw@mail.gmail.com>
 <CAGudoHHg-T+ZOTm0fSpW0Hztfxn=fpfnksz5Q3=3YeCeEPo7LQ@mail.gmail.com>
 <CAHk-=wiBGSLNW6GGbnec-dCbn0kWvD+OXAa5VNXPBKLXYy5KOQ@mail.gmail.com>
 <3g3arsrwnyvv562v2rsfv2ms4ht4mk45vwdkvssxkrjhfjtpdz@umyx5tl2du7o>
 <CAHk-=wg6e8QMaBOyFaGon7pik_C1COrkmEz37mtUqpBoq=R44w@mail.gmail.com>
 <6knlkefvujkry65gx6636u6e7rivqrn5kqjovs4ctjg7xtzrmo@2zd4wjx6zcym>
 <CAHk-=whagTfq=EgwpuywUUu0ti7PPQuE_ftVjZOVrjnLwtS0Ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=whagTfq=EgwpuywUUu0ti7PPQuE_ftVjZOVrjnLwtS0Ng@mail.gmail.com>

On Tue, Jul 02, 2024 at 03:14:54PM -0700, Linus Torvalds wrote:
> On Tue, 2 Jul 2024 at 14:15, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >
> > I asked you something in the previous e-mail though (with some nastiness
> > of the problem pointed out) concerning handling of slow vs fastpath,
> > here it is again:
> >
> > [..]for example did you know xfs does not honor rcu grace periods when
> > recycling inodes?
> 
> I don't think it should matter.
> 
> Yes, the vfs layer will access the inode, but then the sequence number
> checks should always verify that whatever access we did is then
> validated after-the-fact.
> 
[..]
> Or do you see something I'm missing? I'm not loving how we deal with
> dentry->d_inode, but considering that the whole point of the RCU
> lookup is that we don't hold any locks, I think it's almost
> unavoidable.
> 

Now I'm confused mate. Based on the convo so far I would expect you
would consider the xfs thing a no-go for the machinery.

You were rightfully pointing out the relationship dentry<->inode is not
stable and care is needed to grab the pointer, and even then the pointer
may be wrong by the time one finishes the work.

I presume you are also worried about callbacks not taking proper steps
when looking at the inode itself -- after all they can be racing with
teardown and have to handle it gracefully by returning an error.

This much comes with territory.

Inode changing identities adds potential trouble which does not need to
be there.

Certain things remain stable, for example the inode type (regular, fifo
etc.). This is where xfs not respecting grace periods comes in and
removes it.

It may happen to be for stat et al the way they can be implemented at
the moment this does not matter, but then it may start being a factor in
the future.

Say a type-dependent union showed up and needs to be looked at:
	union {
		fifo_pointer_t *fifo_data;
		dev_t		i_rdev;
		...;
	};

area pointed to by fifo_data is rcu-protected.

Then this:
	if (IS_FIFO(inode)) {
		fifo_pointer_t *f = rcu_dereference(inode->fifo_data);
		if (!f)
			return -ENODICE;
		/* use f here */
	}

while may look safe in terms of taking precatuions and bailing from the
fast path happens to be wrong.

Suppose the inode got reused and is now representing a device, i_rdev is
some funky value. This can race to read that int and trap dereferencing
what it found there. This would not happen if the grace period was
respected.

This is a bug class which does not need to be there and there may be
other possible bugs I did not think of.

There is also potential trouble with security modules as they
unfortunately have a hook for getattr. They presumably can be massaged
into handling a possibly dying inode (or failing with -ENODICE), I would
not put any stake into handling an inode which becomes something else as
they deal with it.

As a side note this is where I should also note the *current* LSM hooks
are racy as is.  Suppose you can stat a particular file now, but a chown
to 1234 means you can't. Then your stat call can race against chown +
other ops. You can end up in a state where LSMs gave a green light and
only then the state changed to one you are not allowed to look at. This
would be solvable with per-inode sequence counters, but is arguably
beyond the scope of this patch and I'm not interested in working on it.

[I read the rest of the mail and have no immediate commentary, we will
see after I take a stab at implementing this]
