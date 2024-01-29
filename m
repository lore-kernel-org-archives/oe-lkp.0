Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC066F07F
	for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706557935; cv=none; b=LUgRwzv1TqXepOaCGqWwMhfXq5wOYkgfjBEKFviqe6I+5YE3EPP3wwBEyYcSmlbshox/RYCEHk68C3DeQem99xj/RRE0psJAuB0Q4HowOXbPr06eUY5WOhRQaXo4Vp22zQSAtRHCGdXNOqOB/pyh67xeHFcGhIZFNi5z+14EPU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706557935; c=relaxed/simple;
	bh=+U42MXYQmyPm0YLTZYN6+NqwTBjYG5RX5rdbE3Yhuts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMpFO9BNl9ONUsNPLHlR5/ixzCizgcUlmZ1KVQ42P1svmoN2fgystybiwtNBlZbOXafs3yQjncdEVZp+gupTscMwWgN0UVimHMQQqMbzhiEwwFsHQhwTAQclp7iVtdgtXF0ihX/oT+Rl+CYxzuPpIJ5Tl/uLmrevf1q+W+S7uZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AUFghHuK; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AUFghHuK"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d04fb2f36bso12055871fa.2
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 11:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706557931; x=1707162731; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=POvQx/OtzDWk0KpZLv1n2MuJ9LedkHIMhddtK9sWv5M=;
        b=AUFghHuK5z4ycYdomuboNzlkn9KEirMSprb+wNmDZYwD5xbDIl0+hR3HliAPc9nI1V
         agNc7+Y9QpkXPaGJ2fSXnS16WBEas8V1R+8+GIWrA/Ik1yrxGoX03HxjOIyyOESjvUfp
         OcwrXUKfAPDBETFPNYSn1nUqZV/e+4kCF0GwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706557931; x=1707162731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POvQx/OtzDWk0KpZLv1n2MuJ9LedkHIMhddtK9sWv5M=;
        b=r4O6sKnm9nT9ze/xZcbX2X2OlGavxwQUf1M+8q/A56Cd3yFXeEd5woUL6FEjr89csy
         0sOY0KbXxi+M4L1ZNGEv9FSCYBEi3j+Gl7jRYAHvrnU1u+YYk0pUwg6xNxBQJnfDI+Ze
         Nx4Ph7dsOl4jMNKSt38UDx7/DSpjuuMpJzWPMm3QCx3DyRVJs8MwVFgpGq4Qmx/dmNPN
         N2Ex9AtwWFLFSfVZkyCIqyfqZSLfavQgTsybFLLBgHz/6oigPctHSQ/2X3efx8BC+jaY
         7QcZwY5fMACPh1qgxCv5+JacZTtoNKZ7PkxqmxmpO3YRkwbfE9Y8RSCtvbkwYuOY0JXH
         TJRw==
X-Gm-Message-State: AOJu0YyqF3JlX7DAuI3xx5E974zOTMO0zZyT2und3PInGkvCzmIUDJ5a
	pvLAH5pntd/Q8pqkhERBoDNapgx8BZF3I1HdFGmlevZaM1ZOTaqa/PrYvE2nQiqga+LOrl3zz1/
	xef4=
X-Google-Smtp-Source: AGHT+IF6util/AyJQuxDqB0JY/i99DDud1HxP1cq05nuOeWUj1U8j8Eh3JIOh+uPEJC46HT1bNuEBQ==
X-Received: by 2002:a2e:be21:0:b0:2cf:2c54:d8f1 with SMTP id z33-20020a2ebe21000000b002cf2c54d8f1mr6385485ljq.21.1706557930827;
        Mon, 29 Jan 2024 11:52:10 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id ss6-20020a170907c00600b00a3533f17981sm3285424ejc.219.2024.01.29.11.52.09
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 11:52:10 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55f13b682d4so1499359a12.1
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 11:52:09 -0800 (PST)
X-Received: by 2002:a05:6402:51ca:b0:55e:e838:a20e with SMTP id
 r10-20020a05640251ca00b0055ee838a20emr3923739edd.25.1706557929185; Mon, 29
 Jan 2024 11:52:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=wh0M=e8R=ZXxa4vesLTtvGmYWJ-w1VmXxW5Mva=Nimk4Q@mail.gmail.com>
 <20240129120125.605e97af@gandalf.local.home> <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
 <CAHk-=whb91PWEaEJpRGsuWaQpYZGj98ji8HC2vvHD4xb_TqhJw@mail.gmail.com>
In-Reply-To: <CAHk-=whb91PWEaEJpRGsuWaQpYZGj98ji8HC2vvHD4xb_TqhJw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jan 2024 11:51:52 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgp7UkG31=cCcbSdhMv6-vBJ=orktUOUdiLzw4tQ4gDLg@mail.gmail.com>
Message-ID: <CAHk-=wgp7UkG31=cCcbSdhMv6-vBJ=orktUOUdiLzw4tQ4gDLg@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 11:24, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So the patch was completely broken. Here's the one that should
> actually compile (although still not actually *tested*).

Note that this fixes the d_instantiate() ordering wrt initializing the inode.

But as I look up the call chain, I see many more fundamental mistakes.

Steven - the reason you think that the VFS doesn't have documentation
is that we *do* have tons of documentation, but it's of the kind "Here
is what you should do".

It is *not* of the kind that says "You messed up and did something
else, and how do you recover from it?".

So the fundamental bug I now find is that eventfs_root_lookup() gets a
target dentry, and for some unfathomable reason it then does

        ret = simple_lookup(dir, dentry, flags);

on it. Which is *completely* broken, because what "simple_lookup()"
does is just say "oh, you didn't have a dentry of this kind before, so
clearly a lookup must be a non-existent file". Remember: this is for
'tmpfs' kinds of filesystems where the dentry cache cotnains *ALL*
files.

For the tracefs kind of filesystem, it's TOTALLY BOGUS. What the
"simple_lookup()" will do is just a plain

        d_add(dentry, NULL);

and nothing else. And guess what *that* does? It basically
instantiates a negative dentry, telling all other lookups that the
path does not exist.

So if you have two concurrent lookups, one will do that
simple_lookup(), and the other will then - depending on timing -
either see the negative dentry and return -ENOENT, or - if it comes in
a bit later - see the new inode that then later gets added by the
first lookup with d_instantiate().

See? That simple_lookup() is not just unnecessary, but it's also
actively completely WRONG. Because it instantiates a NULL pointer,
other processes that race with the lookup may now end up saying "that
file doesn't exist", even though it should.

Basically, you can't use *any* of the "simple" filesystem helpers.
Because they are all designed for that "the dentry tree is all there
is" case.

                Linus
