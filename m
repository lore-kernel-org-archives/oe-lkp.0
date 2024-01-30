Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CE43611F
	for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 01:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706579460; cv=none; b=sgwqMs5o0KyY7KC5TBh0X/dYu77RbOotxA5QhfTxQd52Na7VmBvbk/m+kMQMSevylqHRa1Rg/nLb/ogqnar5mIqrs0R8wWQdjNAbclFGSuL9pSBv8j3cbjM2h6+pzWK5pMZhtC8dnuWkxP2Ol1M3DxffByTnVuEPujr2BO44kh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706579460; c=relaxed/simple;
	bh=zyDZ08Jamx3NYeGqhVvbunwn56jBnGzJ3cGlRkrcSRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EU90xOn6dHCroyaalnGWCQcY/mFgAKDTR8ubKytYxUSbkUa+00GZb2n/Gpod0EAsTKoygFwN+h7qwNjBxu4RLKhzXuYxk6T8B1alpqm9Og5//vszJ/8NB95HFBlgGxQU3ztd6kskUdxUxeCmRfXGEaa4Kzvy4IijdG6ZWboUryM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bzYSGvep; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bzYSGvep"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so3335943a12.1
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 17:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706579456; x=1707184256; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4JiXyOYVlI6BSEdoNtzDGECSezeX6jIOydJh3gzKSfA=;
        b=bzYSGvepikIPLmAwJmn0Hsn/BZOILkCoE8ULoIzhzH9dkXc6AED/TS6R5e+nwmqryT
         vIu2nDw5QEcPANCd7nH2jWNMuCKu2VxMCsZvEKQ9n2n8+X2DE3p69kFw1ldt2y6AcM8y
         +bOt6qlGK/OkVsFZuYCAo/KSZiNiw/noCDj/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706579456; x=1707184256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JiXyOYVlI6BSEdoNtzDGECSezeX6jIOydJh3gzKSfA=;
        b=XPuk6+PHgp3ghGBdyCqbscezlThxmMry5CoaZTgQabUaSsXUflDoz7nu86BpTj29oA
         +L7VbnRMntlXpkCBg6awmYq5c0R4sujMqBPCOas/VwZfth414NJX2dLEMz6SUbJM3Ca0
         fziM9diFWvTznWlBqCS9UPpjM4NibDcxMyWlXylVr3ZLCUGMW3gH6dYOPZi4R9JoCICv
         96iVAb0CqEIct1ykkLuxm1nnPw0UcbsmjYanl2GS5VoIOQVJw5zazrJrD0qO7rV8t0yD
         F5HhXQtS0EEVIg67cC1eQmbZa+p5sKT4Q7wnXhfsm/8CysZe3t2vGdX7j0Z+bsidhC4v
         zEIQ==
X-Gm-Message-State: AOJu0Yx87/rQwRvrmwl21ZC2DCeh1UAf3sopM+Sb002/vu2Mu4MM+Vr6
	qsPXHdj30K2pIVEpjvwKxelgQwRScxghqOSGLOKcrAv2j71ZjRsrSio0zRB98EzZsL9NzS2y8F6
	yVKspmQ==
X-Google-Smtp-Source: AGHT+IFS5HmnTA48tVhaLMPGLfDxwlvoxFSAASrLWhnrzpMxKKV4UaWq4MheH3dOjOFpkAcwAAkW8g==
X-Received: by 2002:a05:6402:416:b0:55c:20f7:4ef8 with SMTP id q22-20020a056402041600b0055c20f74ef8mr4787789edv.23.1706579456166;
        Mon, 29 Jan 2024 17:50:56 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id d15-20020a056402400f00b0055eebd3db08sm2065483eda.66.2024.01.29.17.50.55
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 17:50:55 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55ee686b5d5so2512135a12.0
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 17:50:55 -0800 (PST)
X-Received: by 2002:a05:6402:3514:b0:55e:e22c:c1fd with SMTP id
 b20-20020a056402351400b0055ee22cc1fdmr4283813edd.4.1706579455285; Mon, 29 Jan
 2024 17:50:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=wh0M=e8R=ZXxa4vesLTtvGmYWJ-w1VmXxW5Mva=Nimk4Q@mail.gmail.com>
 <20240129120125.605e97af@gandalf.local.home> <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
 <CAHk-=whb91PWEaEJpRGsuWaQpYZGj98ji8HC2vvHD4xb_TqhJw@mail.gmail.com>
 <CAHk-=wgp7UkG31=cCcbSdhMv6-vBJ=orktUOUdiLzw4tQ4gDLg@mail.gmail.com>
 <20240129152600.7587d1aa@gandalf.local.home> <CAHk-=wghobf5qCqNUsafkQzNAZBJiS0=7CRjNXNChpoAvTbvUw@mail.gmail.com>
 <20240129172200.1725f01b@gandalf.local.home> <CAHk-=wjV6+U1FQ8wzQ5ASmqGgby+GZ6wpdh0NrJgA43mc+TEwA@mail.gmail.com>
 <CAHk-=wgOxTeTi02C=kOXsHzuD6XCrV0L1zk1XP9t+a4Wx--xvA@mail.gmail.com>
 <20240129174950.5a17a86c@gandalf.local.home> <CAHk-=wjbzw3=nwR5zGH9jqXgB8jj03wxWfdFDn=oAVCoymQQJg@mail.gmail.com>
 <20240129193549.265f32c8@gandalf.local.home>
In-Reply-To: <20240129193549.265f32c8@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jan 2024 17:50:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=whRxcmjvGNBKi9_x59cAedh8SO8wsNDNrEQbAQfM5A8CQ@mail.gmail.com>
Message-ID: <CAHk-=whRxcmjvGNBKi9_x59cAedh8SO8wsNDNrEQbAQfM5A8CQ@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 16:35, Steven Rostedt <rostedt@goodmis.org> wrote:
>
>  # echo 'p:sched schedule' >> /sys/kernel/tracing/kprobe_events
>  # ls -l events/kprobes/
> ls: cannot access 'events/kprobes/': No such file or directory
>
> Where it should now exist but doesn't. But the lookup code never triggered.
>
> If the lookup fails, does it cache the result?

I think you end up still having negative dentries around.

The old code then tried to compensate for that by trying to remember
the old dentry with 'ei->dentry' and 'ei->d_children[]', and would at
lookup time try to use the *old* dentry instead of the new one.

And because dentries are just caches and can go away, it then had that
odd dance with '.d_iput', so that when a dentry was removed, it would
be removed from the 'ei->dentry' and 'ei->d_children[]' array too.

Except that d_iput() of an old dentry isn't actually serialized with
->d_lookup() in any way, so you end up with the whole race that I
already talked about earlier, where you could still have an
'ei->dentry' that pointed to something that had already been unhashed,
but d_iput() hadn't been called *yet*, so d_lookup() is called with a
new dentry, but the tracefs code then desperately tries to use the old
dentry pointer that just isn't _valid_ any more, but it doesn't know
that because d_iput() hasn't been called yet...

And as I *also* pointed out when I described that originally, you'll
practically never hit this race, because you just need to be *very*
unlucky with the whole "dentry is freed due to memory pressure".

But basically, this is why I absolutely *HATE* that "ei->dentry"
backpointer. It's truly fundamentally broken.

You can't reference-count it, since the whole point of your current
tracefs scheme is to *not* keep dentries and inodes around forever,
and doing a "dget()" on that 'ei->dentry' would thus fundamentally
screw that up.

But you also cannot keep it in sync with dentries being released due
to memory pressure, because of the above thing.

See why I've tried to tell you that the back-pointer is basically a
100% sign of a bug.

The *only* time you can have a valid dentry pointer is when you have
also taken a ref to it with dget(), and you can't do that.

So then you have all that completely broken code that _tries_ to
maintain consistency with ->d_children[] etc, and it works 99.9% in
practice, because the race is just so hard to hit because dentries
only normally get evicted either synchronously (which you do under the
eventfs_mutex) or under memory pressure (which is basically never
going to be something you can test).

And yes, my lookup patch removed all the band-aids for "if I have an
ei->dentry, I'll reuse it". So I think it ends up exposing all the
previous bugs that the old "let's reuse the old dentry" code tried to
hide.

But, as mentioned, that ei->dentry pointer really REALLY is broken.

NBow, having looked at this a lot, I think I have a way forward.
Because there is actually *one* case where you actually *do* do the
whole "dget()" to get a stable dentry pointer. And that's exactly the
"events" directory creation (ie eventfs_create_events_dir()).

So what I propose is that

 - ei->dentry and ei->d_children[] need to die. Really. They are
buggy. There is no way to save them. There never was.

 - but we *can* introduce a new 'ei->events_dir' pointer that is
*only* set by eventfs_create_events_dir(), and which is stable exactly
because that function also does a dget() on it, so now the dentry will
actually continue to exist reliably

I think that works. The only thing that actually *needs* the existing
'ei->dentry' is literally the eventfs_remove_events_dir() that gets
rid of the stable events directory. It's undoing
eventfs_create_events_dir(), and it will do the final dput() too.

I will try to make a patch for this. I do think it means that every
time we do that

    dentry->d_fsdata = ei;

we need to also do proper reference counting of said 'ei'. Because we
can't release 'ei' early when we have dentries that point to it.

Let me see how painful this will be.

             Linus
