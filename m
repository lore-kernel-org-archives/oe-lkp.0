Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3949714EC7F
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jul 2024 21:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719954959; cv=none; b=QMYjQR2QqJYxLXn5OOcr7mWGDc+TRYkjY6fRQC/UknqhNGE0lQXuc+FzyDDLcCWkmIWKdRpHc5cPFkmWsqHTSOdE6WBBijpYQ7kjAyvB0TcVfWuyhRYeLE4F8ndOn+cfCARUOLg2r2F8bwRPfB2w1Z1bZVVmsVVjE4go7xdHugw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719954959; c=relaxed/simple;
	bh=Z53qQlIZsVbeOjfncqkv72fJDhuWFnhGQH+Ptt1okOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3ZUk1m1jZTPjWaG3M257l6CxAt8Ugt/FJ2Gi7Ydqwd4LIL5ghYwKRvWImmbu/m/6eTShdMERn6nw7F5znRwLQyyRYzVLKnfw43oO6ItHe9zEzUyvEse7zES2H3g4JlTUa1bk9Baqkv9lu+fEznOZ3ucd26DfeMuGddNv1382Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERuyc6XO; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERuyc6XO"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab63so2660794a12.3
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 14:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719954956; x=1720559756; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PLK9aj4vFqWhZL5t10A0/zYFTcmHZM8OXrcD4U0TrDc=;
        b=ERuyc6XO2Yn86IU2e/vN6K34xqLkHgenmtFKVbHj6VAQ1Ivy0rLAgVZlGpzurkArgl
         yH9EP0nAwPf//QUa22EOiWi01crbquyZTzmkBZOHO79CeS5soMlgbpzUNe5VWmUEsL+v
         85pgzXNO7+uzI7Yvt8lTyXZWztcv/wqTXP2b5K65rDKynID4+HTp9PI7ZNkF+EIo59bU
         te5WDf7yC+Tqw5XmvpEn1oq0fmi4HVGrPZaqpAvIT/5tFGH8C43BIP17+Y4TRGJ49FnK
         SYZWuy5d6IVZur9Sh198H6Qs1NKkvgvXKwF9d8unmyeg37BOQP6Ey08cTp8aFkQNR0kk
         qe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719954956; x=1720559756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLK9aj4vFqWhZL5t10A0/zYFTcmHZM8OXrcD4U0TrDc=;
        b=STBBOcOWoUYcfCxPqkye6P+ZwBWOCmWYedMnxC+ZWqBHubBHkP52CYzWL+FnxuYnDn
         D5ighXimVHtkVfeQNE5NGZF138SghpoDvhCtxA5GSTNo+rLD2KW8wRlltdybqzGFTu4b
         ewkwNSvZtvIZyNPmSGvfHs6o8PMzfG6fUOv/J8zbI6rOc/Dw4NuhnsABrZ/Er7OGbJe7
         /+qH7FvaXHkpsChQs8oeuk30uDvALXo3LaouOLiXXTcY1NAc0b2sovFaZSX+efhNRwDN
         zHYhZgPN2hoLOFahfGQv+b7Q/sBGyPKW0CzFgYg2dO7R89x6a4LiDKTXbaQchJtiTRNb
         1gIw==
X-Forwarded-Encrypted: i=1; AJvYcCXECQw/nI2p6Q5cVR4d022VfumUy+jn8icFzM/lV3yKvAnKWL54xirBJb6W0chbSNLBTlbIFDjmgcE/2w0NM9KvaEsE7ebU
X-Gm-Message-State: AOJu0YwaQbEtw5vmZKFfnOpGyMUw1UdclB17CmFxo3jKymqt4/WFqH69
	b7/sKkeEoKBJXLQLOxHDgPLnOUAGwUgd5xLrowQYGV0lPNryFqgQ
X-Google-Smtp-Source: AGHT+IGCT4ZcS2hWBpqR73pLxAO1+F3bfc5uZOtzmRlNvQB2X8vmqHx3H6TNdYR0k2Aqy7zatnWdXg==
X-Received: by 2002:a05:6402:354c:b0:57d:5c96:72aa with SMTP id 4fb4d7f45d1cf-5879be9a1a7mr7914346a12.0.1719954956486;
        Tue, 02 Jul 2024 14:15:56 -0700 (PDT)
Received: from f (cst-prg-31-46.cust.vodafone.cz. [46.135.31.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614f3d415sm6196769a12.85.2024.07.02.14.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 14:15:55 -0700 (PDT)
Date: Tue, 2 Jul 2024 23:15:44 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, 
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
Message-ID: <6knlkefvujkry65gx6636u6e7rivqrn5kqjovs4ctjg7xtzrmo@2zd4wjx6zcym>
References: <lv7ykdnn2nrci3orajf7ev64afxqdw2d65bcpu2mfaqbkvv4ke@hzxat7utjnvx>
 <vgg45kxk2fiyznm44w2saz3qjiwrjp3spvpswsl4ovd2jl5c5g@54dlbd4kdlh4>
 <CAHk-=wgnDSS7yqNbQQ9R6Zt7gzg6SKs6myW1AfkvhApXKgUg4A@mail.gmail.com>
 <CAGudoHGuTP-nv=zwXdQs38OEqb=BD=i-vA-9xjZ0UOyvWuXP_w@mail.gmail.com>
 <CAHk-=wgVzKtRnvDXAzueJTbgfo1o12Lw6DH97PzRe1cGA_b1oA@mail.gmail.com>
 <CAGudoHH_z1a6MX8Z8Cqbz-jDTUoAjoxdV9KrQ6yvUkNszXO5aw@mail.gmail.com>
 <CAGudoHHg-T+ZOTm0fSpW0Hztfxn=fpfnksz5Q3=3YeCeEPo7LQ@mail.gmail.com>
 <CAHk-=wiBGSLNW6GGbnec-dCbn0kWvD+OXAa5VNXPBKLXYy5KOQ@mail.gmail.com>
 <3g3arsrwnyvv562v2rsfv2ms4ht4mk45vwdkvssxkrjhfjtpdz@umyx5tl2du7o>
 <CAHk-=wg6e8QMaBOyFaGon7pik_C1COrkmEz37mtUqpBoq=R44w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wg6e8QMaBOyFaGon7pik_C1COrkmEz37mtUqpBoq=R44w@mail.gmail.com>

On Tue, Jul 02, 2024 at 01:42:48PM -0700, Linus Torvalds wrote:
> On Tue, 2 Jul 2024 at 13:33, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >
> > If you are politely by lkml standards suggesting I should probably drop
> > the idea due to unforseen complexities
> 
> Oh, absolutely not. I'd love to see how nasty - or not nasty - the
> patch would end up being. I think it would be very interesting.
> 
> I'm just explaining why _I_ never got around to it.
> 

ye I get it, but the above by me was a passing remark anyway :>

I asked you something in the previous e-mail though (with some nastiness
of the problem pointed out) concerning handling of slow vs fastpath,
here it is again:

[..]for example did you know xfs does not honor rcu grace periods when
recycling inodes?

https://lore.kernel.org/all/20231205113833.1187297-1-alexjlzheng@tencent.com/

So this would have to be opt-in per filesystem, probably stuffed
somewhere within the inode or dentry. I am definitely not reviewing all
the other filesystems for sanity on this front.

Rather, one could look over tmpfs, ext4, btrfs and maybe ask Kent to
sort out bcachefs (if necessary) and call it a day.

Sounds like you are deadset on the callback approach. I'm not going to
die on the inline hill, but I will spell it out so that we are on the
same page (and I have a question too).

In pseudo-code my stuff would like this (names are for ilustrative
purposes):

struct rcunameidata {
	....
	bool in_rcu;
};

...

struct rcunameidata *rnd;

error = vfs_rcu_magic_lookup(&rnd, ....);
if (error)
	return error;
if (rnd->in_rcu) {
	/*
	 * fast path goes here, callback code would be identical up to
	 * the point below
	 */
	 /*
	  * Now validate
	  */
	 error = vfs_rcu_magic_lookup_validate_or_drop(&rnd, ....))
	 if (error == 0) /* things worked out */
	 	return export_stuff_to_the_user(....);
	 if (error < 0) /* fail */
	 	return error;
}
/*
 * slowpath goes here
 */
 /*
  * all done, now whack the lookup state. the routine returns void
  */
vfs_rcu_magic_lookup_finish(&rnd, ....);
if (!error)
	error = export_stuff_to_the_user(....); 
....

Can you pseudo-code how would the consumer look like in your case? Do
you want the callback to execute for both slow and fastpath and switch
on the flag? It is rather unclear what you are proposing here.

fwiw I think the above would serve as an easy to copy-paste idiom for
the few consumers which want it. All the complexity in their case is the
in_rcu block which wont go away with a callback. If you still want the
callback, callback it is.

