Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5D1BB68D
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jul 2024 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719952438; cv=none; b=POe9pHFr6hx7I2WNc3mIDrVhUjKt3vWKA50RnvNC9Bz9+A/pdg5svj+5wnoDwX1z3Gv+0Vgj6UK4Yfg8HOYgupfc2YirFQdzQV65+MvwpbOHx39hh2hxQmdPHuB48Fu+FGW8s8ETE7087vT7NJ8A7wdN6oa9+Kx6hea4Jgdq/bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719952438; c=relaxed/simple;
	bh=YdcYlh3CFPsTKaYp8JjC+B1jasH56K6EqfG7aa4BxDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dr29AE+vTFHxr5eOlR9a6eO4/Qvtg/YqBy3qHcILKHPquQHe9rYEAZOL7gxggdEraZE0oLz+y3w3d2iaG6lk9dCom1Eyt9XBfqQ7Ybo+DFVUa/snYBuDeMA7UAoZOKKUYYiaz6dXm+CRIy1VVYgE42mXg2i32NPltTNaeSD1O+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9VmQMMm; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9VmQMMm"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so545812266b.2
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 13:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719952435; x=1720557235; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UKwxGLtPtO1csp+XHmWB9Or+kYm/bdnHDR55R+xpdpo=;
        b=B9VmQMMm+s/IPbqP1jht7brkvazLfWX58svqTWZAogvVRTzgNZenvsI+kAGuoVfBlC
         2vwiRlDLlwRabY0r7tbUDl0Dd85Kv+EC2n9fmWOE7gVj89WwEW2stPItQg9E32VbCaMZ
         xmt89TzmFh/08GiYm+ALkQrUkSIe046eBl4mvGMjwV5lYHj6xsV9Fz8mje4Fdzifza5/
         TS4N91m3ria5/RfSrUlclk0qDynQBFuinQCP/UiijHKdv5AZIeRpvRqHZVf5Jtgsy9+q
         xPikEIvUTblhA7v8wTiXpgoRhWYFy2iNnaYPryWagQPdhUtEDhck+eZBI1hzQ1c6oJHg
         zYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719952435; x=1720557235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKwxGLtPtO1csp+XHmWB9Or+kYm/bdnHDR55R+xpdpo=;
        b=P1epbpzHDiC8gvp2Yc94ObX/4t3bIxaUyArG/LKTKSQEcWEi1b5XxiXS9XrCQfqXuD
         IUESVKIwMkH66QxnigfCz2QuA0LC0/AcqO4ECR9jWjRIPLMpfoYnsHhAss2JLVnpYpum
         Uedc9XkgfHdSuFaZrrysgtSs5uU8vVmTE27ZeNwIfT2q3DVbLQUgRIll8d/mQHSQ+/C/
         ezBMvqREnVoIkM+UXBJIW/rNUh+LdDbRGTeRVEiKzCnos8GLlZZxpqRnjfsSLeuEVFx8
         g/WNbVc4kyg+HejOQDA1kfYEArCYJbU5tS0WNfxvbq2bIYt6KZyQZwrPA7Qnq4c3gd7z
         7Fyg==
X-Forwarded-Encrypted: i=1; AJvYcCUavBkDirDtZ3zxXAhoendo9ITTSQtY1E2yXxhafSUD5xtjErBOmZ8TY9Mupb/3k+f5kFrfJPz6eGxfKU6uM196M096+tvv
X-Gm-Message-State: AOJu0YxF04Am/WyHwTBSjw9L23jrcbpuAxGIMWXUi705vWVXobzG6+1f
	3r6729dV4ePI1HzI/AWGbDmTS+/WgjHVjy78QN6aV4eqmLyCbcvAhE/ESg==
X-Google-Smtp-Source: AGHT+IEUXKWqxm9bCxi/jzaT3o5g2LjxlsqVoFdk56x3NLDBfiPwQYgB26TF93yXPu/Y+9kunm3JaA==
X-Received: by 2002:a17:907:f99:b0:a6f:64b0:1250 with SMTP id a640c23a62f3a-a75143fde21mr603463566b.35.1719952434710;
        Tue, 02 Jul 2024 13:33:54 -0700 (PDT)
Received: from f (cst-prg-31-46.cust.vodafone.cz. [46.135.31.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08cfccsm449526466b.148.2024.07.02.13.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 13:33:54 -0700 (PDT)
Date: Tue, 2 Jul 2024 22:33:45 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, 
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
Message-ID: <3g3arsrwnyvv562v2rsfv2ms4ht4mk45vwdkvssxkrjhfjtpdz@umyx5tl2du7o>
References: <202406270912.633e6c61-oliver.sang@intel.com>
 <lv7ykdnn2nrci3orajf7ev64afxqdw2d65bcpu2mfaqbkvv4ke@hzxat7utjnvx>
 <vgg45kxk2fiyznm44w2saz3qjiwrjp3spvpswsl4ovd2jl5c5g@54dlbd4kdlh4>
 <CAHk-=wgnDSS7yqNbQQ9R6Zt7gzg6SKs6myW1AfkvhApXKgUg4A@mail.gmail.com>
 <CAGudoHGuTP-nv=zwXdQs38OEqb=BD=i-vA-9xjZ0UOyvWuXP_w@mail.gmail.com>
 <CAHk-=wgVzKtRnvDXAzueJTbgfo1o12Lw6DH97PzRe1cGA_b1oA@mail.gmail.com>
 <CAGudoHH_z1a6MX8Z8Cqbz-jDTUoAjoxdV9KrQ6yvUkNszXO5aw@mail.gmail.com>
 <CAGudoHHg-T+ZOTm0fSpW0Hztfxn=fpfnksz5Q3=3YeCeEPo7LQ@mail.gmail.com>
 <CAHk-=wiBGSLNW6GGbnec-dCbn0kWvD+OXAa5VNXPBKLXYy5KOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wiBGSLNW6GGbnec-dCbn0kWvD+OXAa5VNXPBKLXYy5KOQ@mail.gmail.com>

On Tue, Jul 02, 2024 at 11:41:44AM -0700, Linus Torvalds wrote:
> On Tue, 2 Jul 2024 at 10:58, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >
> > Suppose the rcu fast path lookup reads the dentry seqc, then does all
> > the legitimize_mnt and other work. Everything, except modifying the
> > lockref. The caller is given a mnt to put (per-cpu scalable), dentry
> > seqc read before any of the path validation and an indication this is
> > rcu.
> 
> Yes.
> 
> > Then after whatever is done if the seqc still matches this is the same
> > as if there was lockref get/put around it.
> 
> So this is partly why I was thinking of a callback. That "check
> sequence number afterwards" is still important. And if it's a
> callback, it can be done in the path walking code, and it can go on
> and say "oh, I'll need to redo this without RCU".
> 
> If it's a "we returned a dentry under RCU", suddenly the caller has to
> know this about the name lookup and do the repeating by hand.
> 
> And as long as we don't expose it to modules and only use it for
> "stat()" and friends, I'm ok with it, but I'm just saying that it's
> all a bit scary.
> 
> > The only worry is pointers suddenly going NULL or similar as
> > dentry/inode is looked at. To be worked out on per-syscall basis.
> 
> We have subtle rules wrt dentry->d_inode. It can indeed become NULL at
> any time during the RCU walk, since what protects it is the d_lock and
> the dentry count.
> 
> The inode itself is then RCU-free'd, so it will *exist*, but you can't
> just blindly use dentry->d_inode itself while under RCU.
> 

Not only that, I think dentry can transition back to positive with
another inode.

> Which is why it's cached in 'struct nameidata', and we validate it
> with nd->seq when it's loaded. And why things like may_lookup() use
> nd->inode, not the dentry.
> 
> And then a sequence point failure will return -ECHILD and do the walk
> again, while a callback success with all the sequence numbers matching
> would return -ECALLBACK or whatever, so that the caller would know
> "the stat information was already successfully completed by the
> callback".
> 
> Anyway, that was my handwavy "this is why I was thinking of a
> callback" thing. But it's also an example of just how nasty and subtle
> this all is.
> 
> But I'm convinced this is all eminently *solvable*. There's nothing
> fundamental here. Just a lot of small nasty details.
> 

If you are politely by lkml standards suggesting I should probably drop
the idea due to unforseen complexities, I'll note I intend to write this
for kicks as time permits. If it turns out to be buggy af or there will
be nobody with time to review it, it simply wont go in and that will be
that.

I do think I have an ok understanding what's up, for example did you
know xfs does not honor rcu grace periods when recycling inodes?

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
