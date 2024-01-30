Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D791272C4
	for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706633772; cv=none; b=jKAOTRRLh3yeUiLdqS7rC8KZ43W8yek1UxnxJrNaYBj3gjTWneqcN+IPFsWFDeJSpTu9pUaKJqNR7Eh6VHcFtlSXXPHG9EJAjtj5NW9HuroCPaddMZbSpoG1HnSoKeI88++JUOAKPI/DgQlYPoe3HQI3HaF/J5ayx/5123bdVPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706633772; c=relaxed/simple;
	bh=ypmOqj/q+NNTyaOgW1vO3SUeOqeEi21Zhohn4esARF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VNhm28LTxPBzPnf29SbHhauJP0/JOf/3EJKpztn7/Y8YKn52729aykFG/x57fXUH7pXjTt+eSnRlpqMk+tug0mem0tpcp9Y2WoZe1hw1fsatxW4YepPDhKtra7X6Vxe2iT9K2plVRvbBP9DW4MzNJ1/7lDRj+dIMpMpswHgaFfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AUECuKhH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AUECuKhH"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51032e62171so4473279e87.3
        for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 08:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706633769; x=1707238569; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LAAKLjZaHiiD7rj2ZPOdCI2v+5OE83poGDSWqAYQSrc=;
        b=AUECuKhHmpsKMkH6rvN5yOOUzQe31mqrmKZlyVHviCUOpbH3eRYQTnmgPFg1pk1m1x
         qMO7UbQqpp7/JNgHyBE2u8zJHXl+VMJFkua7LFZAfg+eGTqNDC4MkORKL9WxLa79eFOj
         Fxwf/0qUYPuZWX5Y1zr3/x727Sy61ooqPhvEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706633769; x=1707238569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAAKLjZaHiiD7rj2ZPOdCI2v+5OE83poGDSWqAYQSrc=;
        b=paYvVMGk6+eMSgk/XqdQU6rm83/qOpJbmvkaroQqPjg1ixeQaU8AbCJACqvECa/7pR
         48mlIwjcFDlctAoLDp/KXVd1N1+jmNQXGGEIEOLVpCzSB+C9cR/22zb0CAOsnIEJY5wQ
         eWI2YdzS1qiznGEc/IdeCnX1LaKG06qxqRcNXP2ZTvIyA9cJMsKh0mDq55C3Oc6PQ6gd
         7ynjKyg/WqxzreAqoQjQ6Aw5f2QI3jlvC0MUKpOSKFGKZfRD6GIEjOfb5/D7938v1Bgt
         G8ZVAfTgWe6gf6G7JBqpSx5KebRq0d3m+6x1wIyPNVnDV5TRGX1ynMmVC5TdO9Clyq+m
         8uzA==
X-Gm-Message-State: AOJu0Yw7WlZxPgMdhDGApX7F5ta/h1det2UUkMdc+bZcuoqfEzGgE9J6
	/pg0dDWYnfHAb6jKSrBvyCpWKSFAbfsF+R+wThFyE067+iShV7z5MbRaqk1yyF3SUwBwsI3ZXtf
	YiNrrfg==
X-Google-Smtp-Source: AGHT+IGjgmVdiuN9cxhjpMRTzRE852X/DvUAtKan6MwwxneKe+nmjuQNQ+KQWry5m2nIZ19i+54hDA==
X-Received: by 2002:a05:6512:3b0e:b0:50e:b23c:e37 with SMTP id f14-20020a0565123b0e00b0050eb23c0e37mr7748321lfv.48.1706633768947;
        Tue, 30 Jan 2024 08:56:08 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id b18-20020ac247f2000000b00510212158d7sm1508492lfp.3.2024.01.30.08.56.07
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 08:56:08 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cf1288097aso55989471fa.0
        for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 08:56:07 -0800 (PST)
X-Received: by 2002:a2e:b8d1:0:b0:2cf:334f:a7f9 with SMTP id
 s17-20020a2eb8d1000000b002cf334fa7f9mr8159344ljp.27.1706633767505; Tue, 30
 Jan 2024 08:56:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=whb91PWEaEJpRGsuWaQpYZGj98ji8HC2vvHD4xb_TqhJw@mail.gmail.com>
 <CAHk-=wgp7UkG31=cCcbSdhMv6-vBJ=orktUOUdiLzw4tQ4gDLg@mail.gmail.com>
 <20240129152600.7587d1aa@gandalf.local.home> <CAHk-=wghobf5qCqNUsafkQzNAZBJiS0=7CRjNXNChpoAvTbvUw@mail.gmail.com>
 <20240129172200.1725f01b@gandalf.local.home> <CAHk-=wjV6+U1FQ8wzQ5ASmqGgby+GZ6wpdh0NrJgA43mc+TEwA@mail.gmail.com>
 <CAHk-=wgOxTeTi02C=kOXsHzuD6XCrV0L1zk1XP9t+a4Wx--xvA@mail.gmail.com>
 <20240129174950.5a17a86c@gandalf.local.home> <CAHk-=wjbzw3=nwR5zGH9jqXgB8jj03wxWfdFDn=oAVCoymQQJg@mail.gmail.com>
 <20240129193549.265f32c8@gandalf.local.home> <CAHk-=whRxcmjvGNBKi9_x59cAedh8SO8wsNDNrEQbAQfM5A8CQ@mail.gmail.com>
 <CAHk-=wh97AkwaOkXoBgf0z8EP88ePffLnTcmmQXcY+AhFaFrnA@mail.gmail.com>
 <CAHk-=wi6m7d-nivx10Lo=aGhbdk2qg-8SzjtDd9XW01LxGgAMA@mail.gmail.com>
 <CAHk-=wi+WbXZcc2Sx1i-MGV2DfG4eS4Ci+mrqi-PBSLSnww6qA@mail.gmail.com>
 <20240130093942.56206ff1@gandalf.local.home> <20240130114947.5bc856b0@gandalf.local.home>
In-Reply-To: <20240130114947.5bc856b0@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 30 Jan 2024 08:55:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiNY3W1QKveFnH=dJtRNW7kA1Nbn6Ua49EbM6AC+Rx8wg@mail.gmail.com>
Message-ID: <CAHk-=wiNY3W1QKveFnH=dJtRNW7kA1Nbn6Ua49EbM6AC+Rx8wg@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jan 2024 at 08:49, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> - On removal, I got rid of the SRCU callback and the work queue.
>   Instead, I find the dentry of the current eventfs_inode that is being
>   deleted by walking the ei->parent until I find the events inode that has
>   a dentry. I then use that to do a lookup walking back down to the
>   eventfs_inode I want to delete. This gives me the dentry that I can call
>   d_invalidate() on.

Yes, that works.

However, I have a patch that is *much* smaller and simpler, and
doesn't need that walk.

The VFS layer already has a good interface for "should I still use
this dentry", which is needed for various network filesystems etc that
want to time out caches (or check explicitly whether the file still
exists etc): it's the dentry d_revalidate() check.

Let me just reboot into it to test that I got all the cases.

It makes the code even more obvious, and avoids all the complexity.

           Linus
