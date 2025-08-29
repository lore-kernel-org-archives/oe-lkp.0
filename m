Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D981FDA
	for <oe-lkp@lists.linux.dev>; Fri, 29 Aug 2025 00:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756428435; cv=none; b=WRxmP4SlQnOJqGzVFGqORoMTZ8pSzToI6kJsfJh1qahUL5IrEi4U+xI2IXZmoTfKX8P2g8OTYoZoBJLtijlyR/ua3aGqbjEPQurhwLOY155XqYJG7MZXMM4Lth28jFecElJnKk/gdJggQm6W0NkJrQv5qfA7P/uxJa23+kjxQcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756428435; c=relaxed/simple;
	bh=oPmuy3TGat4ooWHkoK7e11Wk5LiHB8i/yOjViDSxrUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JS0SIsye0poiiVZr/WfaO1P77WTyxJviEOlH2yMXb2nawnNPODUvcgjVK76tsgVHKi4FywFEoHZD83ytfVpgM4C3DYpI8kxogTFePyWDW+1ltmq+AEQY3azH2H/GnVctsVMEV2+LSxqF7U28gAMccKEwxslxYvKdAtvNiN1Xpzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYd0gYt2; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYd0gYt2"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-71d60150590so11598187b3.0
        for <oe-lkp@lists.linux.dev>; Thu, 28 Aug 2025 17:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756428432; x=1757033232; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuiyXbkz/oKZln4w17K1UpJPXhKbnq2sEqaKGCGVONo=;
        b=hYd0gYt2K5sj3Ik/8iQtBD6VHBsOJnBj/n1eqQrY5cf0RDDtqfP2zGGSJt2S7eOhD/
         QMRBwk/4mRgedV2NvZKMdFCx0AaVctCMcVJsn/JL0BOpj4GJnXacPOSw0YkEh0d55s1w
         v9882cjHzEVHZ/r52By5Wv/zzCZyJRN7flvVqdMzXO/4T2zGAwdR11mkRkuzeQH9tq9v
         AMNu2mcxx62ids4P+hl9fjtKqhqqB2JSri4LFpRurpXu3FuQYBa1kFzGFwZuDSzaYImq
         G3BjYuOAYmjjXtj700BgGOYjygIRlPir6ofB67k8NcZU27WQg0YiB4/D1m37oSmyQfr5
         TbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756428432; x=1757033232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuiyXbkz/oKZln4w17K1UpJPXhKbnq2sEqaKGCGVONo=;
        b=V72GY5hKFsPxLPGZdJ5z65GRVfkcr7GYuv3ZpEImayaxxDfivCSpJotDMcwgoEjyP1
         WbivUqecWLgeBZFa5NJ7GKHvsAPgc4QxnzxTJjmSgZzrVnJ3wGKhKdQvJNu7Ebg9qAaK
         PlvxotdO0iHUhpJMKQSPLYaNwHEME0MUALb/8xfGbiOGnKm5+OvL0tcMLOPwQncAa3Ah
         tGGmUwgR/TGzGv7wp7RcFaBlBWDGDc61l7/A5g/Yz+4vtU4xhFHXMNDMfPSQbvWDjmA9
         j7GwPexNZDkeduvbP4YExy4u6YriSYhJlft0Gizh549B+YXi5N0Z+z1jCAYPv4XWBXfg
         wfjg==
X-Forwarded-Encrypted: i=1; AJvYcCW6ZbsjkM7CcHot05MN8++7hlmy5zmkyw4ix3u4cJh0fdUsTqgQf4BMkFw/eKtoXVOozpHlHPU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoHj88A8h0HZJ82svBHCadmjfim4ZU0uem1A+kePesBX+aqY8/
	89e6Wj59iNbiDmfptgYcBGYctrf+FwrFdM/i0Vfk41TDoQ4mbLU2K/IdSnz0sRGq69NsL7is+Hl
	I8e3NZadOmNNuipDARAnw8vLN94LD2vM=
X-Gm-Gg: ASbGncseUR5JLpWp2tAfbR68TBrTVCfE+aurnwrzO3/wvUZc5jIpBz6Mlj5+uegjPJn
	Na3/w6W8UwYi3on9uCxfoQiV+uO75jenyoLHN1BpHEC+K38hYYy/pRrpO2IfdvqrZExDq4Zeo/j
	zyyfg4HtFp2kNUcPu+BbE3OyWvNCvqvLJ3jK+hEvJmZKk5Aga/ryL9bLbwymUnXhtxQr3nm3wLr
	0lc1uSSg6gYsBeNisi1LW7+O+VN9rWu
X-Google-Smtp-Source: AGHT+IFUTRuTOBbOyVGMOGyozpIKe/8z9Kms9zBBGUkwhou9GlReWWHS4I0oGgJfP0HC+5MiGifVts7hT8mQcm3Tq2w=
X-Received: by 2002:a05:690c:4507:b0:71a:300c:d17e with SMTP id
 00721157ae682-71fdc2f32c8mr320538557b3.20.1756428432558; Thu, 28 Aug 2025
 17:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508281655.54c87330-lkp@intel.com> <CADxym3aHUDGahE1S2LzaDZA4vZP637txcMzQR3_r1U00GikEUA@mail.gmail.com>
 <20250828103433.1498f8a7@gandalf.local.home>
In-Reply-To: <20250828103433.1498f8a7@gandalf.local.home>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Fri, 29 Aug 2025 08:47:01 +0800
X-Gm-Features: Ac12FXzl5_fAXXUIThWutnEuE1vHvA1GXqPeGhxPSFJPZ1LIhVHxUVfVStR-Tkg
Message-ID: <CADxym3YhwQ=2z8u2RNoEK3iM2KwafeM-aB8OAspCyOaLy+iu=g@mail.gmail.com>
Subject: Re: [linux-next:master] [tracing] dfe0d675df: WARNING:suspicious_RCU_usage
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, oe-lkp@lists.linux.dev, 
	kernel test robot <oliver.sang@intel.com>, lkp@intel.com, 
	Menglong Dong <dongml2@chinatelecom.cn>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 10:34=E2=80=AFPM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Thu, 28 Aug 2025 17:09:35 +0800
> Menglong Dong <menglong8.dong@gmail.com> wrote:
>
> > > [  354.955971][ T4652]  dump_stack_lvl+0x7c/0x90
> > > [  354.955978][ T4652]  lockdep_rcu_suspicious+0x14f/0x1c0
> > > [  354.955987][ T4652]  __rhashtable_lookup+0x1e0/0x260
> >
> > rcu_read_lock() is not needed in fprobe_entry, but
> > rcu_dereference_check() is used in rhltable_lookup(), which
> > causes this warning.
>
> Why is rcu_read_lock() not needed in fprobe_entry()?

This is how it worked previously. In ftrace_test_recursion_trylock(),
preemption will be disabled, which ensure the RCU read-side
critical section.


Thanks!
Menglong Dong

>
> -- Steve
>
> >
> > Adding rcu_read_lock() here is able to suppress this warning.
> > Maybe we need only rcu_lock_acquire(&rcu_lock_map) here,
> > but it's not a common usage. What do you think, Masami?
>
