Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE573C484
	for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 04:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706502994; cv=none; b=QcvLS/Ai4FQM6mbME3rw+9a/9Xo5IJCvtUYHGTkAcrjRi5Rg9bwqxr6JpmJ+CVMArxoaEVyhWW3cUEIkE6AJNwiKo2LdPbnsMztwsjmsD3MgA/W/fDuF43jItR5wnrhDJkLj3b9Oe79D2rKwFkdi0xqxJr4pHRJpsOSQHcXlY90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706502994; c=relaxed/simple;
	bh=Qvclxu84S/Vj00n5XJGicbf+1n9+wvgXNZJSxffCMaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOOwBygJAOBbzj/ec1vAeuICQzz9yhQM87soZvei2u1aOlIrISuaIxxFglGDibZkZdbU3x1JqkFxSxMeejhZ2JGkMG7JaiJpp85jkYKeFg2ABqGx4pd8XFKP9LIUUXAKZqJ3T/U7XQxCel5cQhlbZE/3Jw9vwr0wgw4yodfC40Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QYj+J6gi; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QYj+J6gi"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a26f73732c5so236559166b.3
        for <oe-lkp@lists.linux.dev>; Sun, 28 Jan 2024 20:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706502990; x=1707107790; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GNrDOkLUoRhPhAZaq9nU6yW/IkHOgSVhQm/kSJS29jU=;
        b=QYj+J6giPLHa7+0EaqapaRRQYds55xCopSRappjXinosE3I9a9E7BHaTw7cqw+8FYV
         K1r9NJuFXPq9WajIewvadh1ynGWqPnQTaJ/V+ztJedGgD3WYSA+Hy1F2onZYFZ0pS+Lu
         W7S+7a75PNnZO09rlkIWfXvNo9ht96/u3q8y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706502990; x=1707107790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNrDOkLUoRhPhAZaq9nU6yW/IkHOgSVhQm/kSJS29jU=;
        b=VN7F4Dop1KNg0nKAA3cf0j2ERhCBJgdNtgNn6Fv8LPdkb2R30koZoL//OiuQJak82n
         boh6TLHCU5J+TdDpM+hy1yLUU+30uhIu9noB27wBHAFJISb+v7N/EwMsLRBipq7Xv6zu
         90PvC2Tg+19m5RCd1LLOrvVB7Hg2oyUihAopq5doUnT8tRHCEqYa+9UM+kwTOobw2/pK
         HRxtJ6TYdlrbmXoTlCzAEvJZigD0ZZO++emKPhYwRXvt1UWBO+8VZGd0sl5O4j2IsgcJ
         Da0v3TJf3/DpDlouUmxIuK8Y60e+E/RO4Aq+wy6AvPV2v7Ymlr031C1UU04Xp52AXtw8
         9r2w==
X-Gm-Message-State: AOJu0YwaJriRQLTeiK90JuzlxESvSrU5e/SpFiaJMgrfoU0Mfvp46BwV
	SchLTadBSawyazy5hDoFtbEW1EVI6j9RNz2tAjWkEWo/s0eYjTlmBq6tEplbAdU4lKtCkBq7u0p
	+gqoehQ==
X-Google-Smtp-Source: AGHT+IFO03IvCQehd1jC6KULLfJ6yLxa7DGreZaOKHG8PQkS2aA+dPhA8pV6IovY1MPxiEUowvakwA==
X-Received: by 2002:a17:906:d10a:b0:a2d:3488:c377 with SMTP id b10-20020a170906d10a00b00a2d3488c377mr3422692ejz.57.1706502990342;
        Sun, 28 Jan 2024 20:36:30 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id rg9-20020a1709076b8900b00a354e4d3449sm2167915ejc.120.2024.01.28.20.36.29
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jan 2024 20:36:29 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55ef0465507so809239a12.3
        for <oe-lkp@lists.linux.dev>; Sun, 28 Jan 2024 20:36:29 -0800 (PST)
X-Received: by 2002:a05:6402:2709:b0:55a:813f:8802 with SMTP id
 y9-20020a056402270900b0055a813f8802mr3784740edd.25.1706502988865; Sun, 28 Jan
 2024 20:36:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com>
In-Reply-To: <202401291043.e62e89dc-oliver.sang@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 28 Jan 2024 20:36:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh0M=e8R=ZXxa4vesLTtvGmYWJ-w1VmXxW5Mva=Nimk4Q@mail.gmail.com>
Message-ID: <CAHk-=wh0M=e8R=ZXxa4vesLTtvGmYWJ-w1VmXxW5Mva=Nimk4Q@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: kernel test robot <oliver.sang@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 18:59, kernel test robot <oliver.sang@intel.com> wrote:
>
>   21:   48 8b 47 f8             mov    -0x8(%rdi),%rax
>   25:   48 85 c0                test   %rax,%rax
>   28:   74 11                   je     0x3b
>   2a:*  f6 40 78 02             testb  $0x2,0x78(%rax)          <-- trapping instruction

So this is

        struct tracefs_inode *ti = get_tracefs(inode);
        struct eventfs_inode *ei = ti->private;

        if (!ei || !ei->is_events || ..

in set_top_events_ownership(), and it's that 'ei->is_events' test that oopses.

The 'inode' is the incoming argument (in %rdi), and you don't see code
generation for the "get_tracefs(inode)" because it's just an offset
off the inode.

So the "ti->private" read is that read off "-8(%rdi)", because

  struct tracefs_inode {
        unsigned long           flags;
        void                    *private;
        struct inode            vfs_inode;
  };

so 'private' is 8 bytes below the 'struct inode' pointer.

So 'ei' isn't NULL, but it's a bad pointer, and 'ei->is_events' is
that "testb  $0x2,0x78(%rax)" and it oopses as a result.

I don't think this is directly related to that commit 852e46e239ee
("eventfs: Do not create dentries nor inodes in iterate_shared") that
the kernel test robot talks about.

It looks like some inode creation never filled in the ->private field
at all, and it's just garbage.

I note that we have code like this:

 create_dir_dentry():
        ...
        mutex_unlock(&eventfs_mutex);

        dentry = create_dir(ei, parent);

        mutex_lock(&eventfs_mutex);
        ...
        if (!ei->dentry && !ei->is_freed) {
                ei->dentry = dentry;
                eventfs_post_create_dir(ei);
                dentry->d_fsdata = ei;
        } else {

and that eventfs_post_create_dir() seems to be where it fills in that
->private pointer:

        ti = get_tracefs(ei->dentry->d_inode);
        ti->private = ei;

but notice how create_dir() has done that

        d_instantiate(dentry, inode);

which exposes the inode to lookup - long before it's actually then filled in.

IOW, what I think is going on is a very basic race, where
create_dir_dentry() will allocate the inode and attach it to the
dentry long before the inode has been fully initialized.

So if somebody comes in *immediately* after that, and does a 'stat()'
on that name that now is exposed, it will see an inode that has not
yet made it to that eventfs_post_create_dir() phase, and that in turn
explains why

        struct eventfs_inode *ei = ti->private;

just reads random garbage values.

So if I'm right (big "if" - it looks likely, but who knows) this bug
is entirely unrelated to any dentry caching or any reference counting.

It just needs just the right timing, where one CPU happens to do a
'stat()' just as another one creates the directory.

It's not a big window, so you do need some timing "luck".

End result: the d_instantiate() needs to be done *after* the inode has
been fully filled in.

Alternatively, you could

 (a) not drop the eventfs_mutex around the create_dir() call

 (b) take the eventfs_mutex around all of set_top_events_ownership()

and just fix it by having the lock protect the lack of ordering.

                 Linus
