Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7863328D7
	for <oe-lkp@lists.linux.dev>; Mon, 27 Nov 2023 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HGkQ3guW"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-54b532b261bso1967761a12.1
        for <oe-lkp@lists.linux.dev>; Mon, 27 Nov 2023 09:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1701105072; x=1701709872; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X8veV/N8u0KLOX8kp8+RpeOybN7ghMV50gJ3VwXOlp8=;
        b=HGkQ3guWxsktLPKrs0D7EGv8OCiJnyTO5tlSRP9ttPPvjES2Z6KDkG+aGTHizw+sR9
         W54ytWHFK0GKNi62IKTEjakGiIopvkw9+sHmxp0UWUEY79aJ9iYmYxMfIDrwuQ5x//DD
         WZH1tuo3UE/wy0V2w0vktfNAaCX9l3Dxqenfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701105072; x=1701709872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8veV/N8u0KLOX8kp8+RpeOybN7ghMV50gJ3VwXOlp8=;
        b=Ok5PHQ2jZ+4upuMsDCwKi4PaQcMnvzr5bkgFW9TaEbUG6OHuYF0nEA4vw8N+uD6cYC
         9lpFx4NQsFgaozLkcsJxwPLiHgvX1hxcmcIBO5YoUJsgaU78ZEqItua5V8nSH8Q8TeQT
         KYTuCzFzb8866k4YOEZR1BkzFxEw5ZNVup5CbdCnnGRnC1py21lh8/T1B8jgjRcjn0vC
         O5dvo83PqlkyfB7yr0ibBRn3bhpUu4uAh6cLDBLC8KdE8uRr6QJi7GkfFRPUQGWu/GrT
         KX2SmxRPYnPkMCRFPMpAUBu22n8jGQodM1AHfS8ymjpQ9oiqcf34E8rX6kNC7IpDANLt
         pcCg==
X-Gm-Message-State: AOJu0YxzPKykS9vaKM/olG0y22m9owLgB6f2A0SZkzumP6uO/oYgfEax
	EJu7rdXPNkXBg4q2R+KyUL+jhGnkhKHVBBdF86rcvA==
X-Google-Smtp-Source: AGHT+IEu68+NPMwbWKOJDTeDFf/eUSck4yJVAaHCoxf/bEsmmEFn1UONb0S0EAgJzgIG+tk3p39tAA==
X-Received: by 2002:a50:aa8d:0:b0:547:9f26:e581 with SMTP id q13-20020a50aa8d000000b005479f26e581mr9228126edc.37.1701105071886;
        Mon, 27 Nov 2023 09:11:11 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id d22-20020aa7c1d6000000b00548c3ba4f80sm5422747edp.88.2023.11.27.09.11.11
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 09:11:11 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54b0e553979so3541580a12.2
        for <oe-lkp@lists.linux.dev>; Mon, 27 Nov 2023 09:11:11 -0800 (PST)
X-Received: by 2002:a50:d4c5:0:b0:53e:1b:15f5 with SMTP id e5-20020a50d4c5000000b0053e001b15f5mr7964361edj.39.1701105070828;
 Mon, 27 Nov 2023 09:11:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311201406.2022ca3f-oliver.sang@intel.com> <CAHk-=wjMKONPsXAJ=yJuPBEAx6HdYRkYE8TdYVBvpm3=x_EnCw@mail.gmail.com>
 <CAHk-=wiCJtLbFWNURB34b9a_R_unaH3CiMRXfkR0-iihB_z68A@mail.gmail.com> <20231127-kirschen-dissens-b511900fa85a@brauner>
In-Reply-To: <20231127-kirschen-dissens-b511900fa85a@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Nov 2023 09:10:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgwpzgoSYU9Ob+MRyFuHRow4s5J099=DsCo1hGT=bkCtw@mail.gmail.com>
Message-ID: <CAHk-=wgwpzgoSYU9Ob+MRyFuHRow4s5J099=DsCo1hGT=bkCtw@mail.gmail.com>
Subject: Re: [linus:master] [file] 0ede61d858: will-it-scale.per_thread_ops
 -2.9% regression
To: Christian Brauner <brauner@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, intel-gfx@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, gfs2@lists.linux.dev, bpf@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Nov 2023 at 02:27, Christian Brauner <brauner@kernel.org> wrote:
>
> So I've picked up your patch (vfs.misc). It's clever alright so thanks
> for the comments in there otherwise I would've stared at this for far
> too long.

Note that I should probably have commented on one other thing: that
whole "just load from fd[0] is always safe, because the fd[] array
always exists".

IOW, that whole "load and mask" thing only works when you know the
array exists at all.

Doing that "just mask the index" wouldn't be valid if "size = 0" is an
option and might mean that we don't have an array at all (ie if "->fd"
itself could be NULL.

But we never have a completely empty file descriptor array, and
fdp->fd is never NULL.  At a minimum 'max_fds' is NR_OPEN_DEFAULT.

(The whole 'tsk->files' could be NULL, but only for kernel threads or
when exiting, so fget_task() will check for *that*, but it's a
separate thing)

So that's why it's safe to *entirely* remove the whole

                if (unlikely(fd >= fdt->max_fds))

test, and do it *all* with just "mask the index, and mask the resulting load".

Because we can *always* do that load at "fdt->fd[0]", and we want to
check the result for NULL anyway, so the "mask at the end and check
for NULL" is both natural and generates very good code.

Anyway, not a big deal, bit it might be worth noting before somebody
tries the same trick on some other array that *could* be zero-sized
and with a NULL base pointer, and where that 'array[0]' access isn't
necessarily guaranteed to be ok.

> It's a little unpleasant because of the cast-orama going on before we
> check the file pointer but I don't see that it's in any way wrong.

In my cleanup phase - which was a bit messy - I did wonder if I should
have some helper for it, since it shows up in both __fget_files_rcu()
and in files_lookup_fd_raw().

So I *could* have tried to add something like a
"masked_rcu_dereference()" that took the base pointer, the index, and
the mask, and did that whole dance.

Or I could have had just a "mask_pointer()" function, which we do
occasionally do in other places too (ie we hide data in low bits, and
then we mask them away when the pointer is used as a pointer).

But with only two users, it seemed to add more conceptual complexity
than it's worth, and I was not convinced that we'd want to expose that
pattern and have others use it.

So having a helper might clarify things, but it might also encourage
wrong users. I dunno.

I suspect the only real use for this ends up being this very special
"access the fdt->fd[] array using a file descriptor".

Anyway, that's why I largely just did it with comments, and commented
both places - and just kept the cast there in the open.

             Linus
