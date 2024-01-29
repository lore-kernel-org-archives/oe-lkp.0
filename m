Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849CE15956E
	for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 22:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706566817; cv=none; b=cOVYjFeF0WqECv164OjuIx/+BF0Y4V+w15pXwoMLQnddUt1SCyWcTp1i4nFrisnVhIzJryepWo35YnZHj+3dGiUjuPWrzPFVVN+IKWzfnytDmC6HQznptAe2GlF2rgxqIC87B5P2k7bTlv80iyeL1bJSjpBFTw/VDrXSHkj/O8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706566817; c=relaxed/simple;
	bh=PP4Ucxud54uO0dEnP2Nul7Kvjbb/eked+1RH7DqpTNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHCCSVRnVt7PFI3blMGtUj3scFyqYjHqmiXc+qLjvCMTQLj0PY4BTm1xXlxKu8D4TuzEnNw8Uw+NE3Bmwlx8tw/rCQvlL+szfr3HAiQQMxp2kI+A5i6jss5kNQaFLjS4gzEUVfQLo08wgah/VHBfNR4bC3pESnaU0UXnVbx42SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HAVSqVHK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HAVSqVHK"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3510d79ae9so346781266b.0
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 14:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706566813; x=1707171613; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iay1thZs+tUb09oVitGMEBAcP06SPOZDG0BLc7NtdM8=;
        b=HAVSqVHKRKARo/DoATDN90tpequq2I0Vfc6zRrqnqAiaz9R5fshrAAl8+fSWYa9fCu
         7YFaiekq7FLJb3cEDzYO3vcq8a7ip4mj0UdsAHJZH649XRjV8TUJTbuEIMUHJW5sCNVY
         UFh+WsrE4YrnTt+IRoT9UTPFXTXVqtRORzUzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706566813; x=1707171613;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iay1thZs+tUb09oVitGMEBAcP06SPOZDG0BLc7NtdM8=;
        b=tatND2wQDboUeZjx1w4VFXHQtvuXq6EwfAiBq0yIKhYDQzVW3/sMYt9E8+Q+GK3gU0
         efnuavSkHZVMmMUvvR01Ek4/OHU6xB2EE4xDa2I7fzFLajutfDdz27qM/KjjowNMmk9O
         BKVAMBoAVrBu49A38EagPdyYInp1iXOBNGnMpgY5TLS8eM2YN2wkICRxqAh5lcPt8H8y
         yCVX3+EFGYAkGm7bpyhKJHiNamOnNQ6yrHuXap41iO9Vk5CxxlvJ3U36+t0PMgfEwDF7
         qQuBJ3yl4XRmMCrbOp/uOBuozVh1vMOF8ZJExnwJNf0FrhxhrUmC77LpSbfiY34B6hB9
         cfXQ==
X-Gm-Message-State: AOJu0Yx3TIi2luyu91vA0zRlRmiPHLJbAT8Po3HfiCySjjC8jNr2JGwa
	4VWdM1L0IP79kBbkVqkzNqoB3B+hHKJQZOFcWYXPdSMo73amD9jZP/6YA7i0+T/7EfTC8Tq4mgx
	QQEsI5Q==
X-Google-Smtp-Source: AGHT+IGeVjEPuWpLAddYuHSnrBrk2azm+n6Rvv8HTwZRJFgZ345IpaSDm9p+JC72VWdk5lodt/sZDw==
X-Received: by 2002:a17:906:d292:b0:a34:ac2a:5be3 with SMTP id ay18-20020a170906d29200b00a34ac2a5be3mr3934028ejb.77.1706566813512;
        Mon, 29 Jan 2024 14:20:13 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id tj9-20020a170907c24900b00a36087f9f9dsm303299ejc.98.2024.01.29.14.20.12
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 14:20:12 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55c2cf644f3so3156049a12.1
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 14:20:12 -0800 (PST)
X-Received: by 2002:a05:6402:27d0:b0:55e:dbb8:4c6b with SMTP id
 c16-20020a05640227d000b0055edbb84c6bmr3540555ede.42.1706566812300; Mon, 29
 Jan 2024 14:20:12 -0800 (PST)
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
 <20240129164522.72482faa@gandalf.local.home>
In-Reply-To: <20240129164522.72482faa@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jan 2024 14:19:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgcy_8snS3znhTB2M_=rDg5gy8bQunKvhLse=AVPp6rOg@mail.gmail.com>
Message-ID: <CAHk-=wgcy_8snS3znhTB2M_=rDg5gy8bQunKvhLse=AVPp6rOg@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 13:45, Steven Rostedt <rostedt@goodmis.org> wrote:
> >  1 file changed, 50 insertions(+), 219 deletions(-)
>
> Thanks, much appreciated.

Well, I decided I might as well give it a test-run, and there's an
immediate deadlock on eventfs_mutex, because I missed removing it from
eventfs_find_events() when the callers now already hold it.

So at a minimum, it will require this patch on top:

  --- a/fs/tracefs/event_inode.c
  +++ b/fs/tracefs/event_inode.c
  @@ -230,7 +230,6 @@ static struct eventfs_inode
*eventfs_find_events(
   {
        struct eventfs_inode *ei;

  -     mutex_lock(&eventfs_mutex);
        do {
                // The parent is stable because we do not do renames
                dentry = dentry->d_parent;
  @@ -247,7 +246,6 @@
                }
                // Walk upwards until you find the events inode
        } while (!ei->is_events);
  -     mutex_unlock(&eventfs_mutex);

        update_top_events_attr(ei, dentry->d_sb);

to not deadlock immediately on the first lookup.

And honestly, there might be other such obvious "I missed that when
reading the code".

Let me reboot into a fixed system and do some more basic smoke-testing.

                Linus
