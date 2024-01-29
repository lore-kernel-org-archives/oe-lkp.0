Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DB6157E62
	for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 17:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550973; cv=none; b=O/uCr06ki87ZmDdOWKR50DD+9Z9p6iSjsm4I+L1GZ2z+/ev9Apcbu66xReICJfQts7+IRJK/M90whglk8vwgO+EH3pxiqiogUD7Kiq1Wn6dC3xoRBzonA0hshtoY/QnEc7sQRuBq2FTw86NX1HGgbkTOOMOASAgZoyzmRo3oLQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550973; c=relaxed/simple;
	bh=eJ4tB/dpOgHGrxgqDYW104LSCUa8aT6Nh1QEcB2/LFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEnEjrCJkCFDI9UchLuhycGOge4YQw5KTT97B7CSH9ZiVO0QwfWN4rKl40bqhAyCQdKkg6qiiHL5Es/orTGA5Mf/TPiCuObcEUpwB93/htKXiQj0jKi59qOnMFoRP1ZkNu3dNPA0ODEjbzjrBHiLdd7XUmOi9NnxTsJCtsNX/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OsE3TLSX; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OsE3TLSX"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55f0367b15fso1599048a12.0
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 09:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706550970; x=1707155770; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AkYokCIwpJBz8xiFXNezYEF1FGA6YIGCtwREDWysAIE=;
        b=OsE3TLSXW8+hRPWF73uLJW4BNlfoFhFtzMZkWYkECAju0YkEyvJ6PdJ2gsxCffkEWo
         CEh6Xb4L0vtJiXTX19vLhFEYHbruevmaTe24174kxmtX+TABwiB+q1tFzYihN23FnMXA
         ogxRTbbGyFDdRdjpbTXqvCn9V7jOP4oaebvmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550970; x=1707155770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkYokCIwpJBz8xiFXNezYEF1FGA6YIGCtwREDWysAIE=;
        b=tdCJyzAnFMStZJ4vS3zf0McBYUX1ryphXlKgoWx0xzACv3LdL4LZNA9OfU2lyv0Wbr
         C9JqTyt3y5BzevlkYIt9SrXuV/VXU2UhkqU+Ht49DWYfDzvpdyzNNRTfjN6aY4O6uKdw
         IPTR7blK+N5naXIVbss8JqWTl0Dj0J8JJHMYGWhys8HhCsbTp4IRiGNfMOwQlZ+sc+en
         gAvm9a7t0IWL4NrLqMh4tFMVl2hCs4urk84/S1S/4EnqO3EmQx4WbdbtlUu7mUZvNGsj
         tJD6K0CwUJT1Q2yiuIskc24LrXj9NLpHYxDlbFtSY4xnCYSZO/qzvyaA4ofR2Uq49Jlj
         Nrxw==
X-Gm-Message-State: AOJu0Yw5cSOQv1Stp/yVIbmO+thfJZ/MEsO43C+CE8nWRY9XKt7JMxBZ
	iPEFWmBnYoAWFQrK/FWoYtr/hvkP8GNJftOQ/WtVDE5TBt3mKevazmP02oUEtZP010nzm22u3wn
	V5UQ=
X-Google-Smtp-Source: AGHT+IFndav6Y2LCSq1r+HT/grADUPm91lfljmEzM0p2shz2gZYiUQ/4PjBiYfhRonYIvK7MvwSpHQ==
X-Received: by 2002:a05:6402:125a:b0:55f:28cd:bb3a with SMTP id l26-20020a056402125a00b0055f28cdbb3amr754976edw.18.1706550970032;
        Mon, 29 Jan 2024 09:56:10 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b0055ef56f4575sm1587265edt.39.2024.01.29.09.56.09
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 09:56:09 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55ee9805da7so1887498a12.3
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 09:56:09 -0800 (PST)
X-Received: by 2002:a05:6402:2709:b0:55a:392:143e with SMTP id
 y9-20020a056402270900b0055a0392143emr4968057edd.27.1706550969019; Mon, 29 Jan
 2024 09:56:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=wh0M=e8R=ZXxa4vesLTtvGmYWJ-w1VmXxW5Mva=Nimk4Q@mail.gmail.com>
 <20240129120125.605e97af@gandalf.local.home> <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
In-Reply-To: <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jan 2024 09:55:52 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgrTm3_Ro7_0WAsk0CW41g4pg1z7reZh4A0xCeMBUJtpQ@mail.gmail.com>
Message-ID: <CAHk-=wgrTm3_Ro7_0WAsk0CW41g4pg1z7reZh4A0xCeMBUJtpQ@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 09:40, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> eventfs_create_events_dir() seems to have the same bug with ti->flags,
> btw, but got the ti->private initialization right.
>
> Funnily enough, create_file() got this right. I don't even understand
> why create_dir() did what it did.
>
> IOW, I think the right fix is really just this:

Actually, I think you have another uninitialized field here too:
'dentry->d_fsdata'.

And it looks like both create_file and create_dir got that wrong, but
eventfs_create_events_dir() got it right.

So you *also* need to do that

        dentry->d_fsdata = ei;

before you do the d_instantiate().

Now, from a quick look, all the d_fsdata accesses *do* seem to be
protected by the eventfs_mutex, except

 (a) eventfs_create_events_dir() doesn't seem to take the mutex, but
gets the ordering right, so is ok

 (b) create_dir_dentry() drops the mutex in the middle, so the mutex
doesn't actually serialize anything

Not dropping the mutex in create_dir_dentry() *will* fix this bug, but
honestly, I'd suggest that in addition to not dropping the mutex, you
just fix the ordering too.

IOW, just do that

        dentry->d_fsdata = ei;

before you do d_instantiate(), and now accessing d_fsdata is just
always safe and doesn't even need the mutex.

The whole "initialize everything before exposing it to others" is
simply just a good idea.

                Linus
