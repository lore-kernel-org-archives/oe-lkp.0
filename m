Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D474139B
	for <oe-lkp@lists.linux.dev>; Wed, 22 May 2024 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716393626; cv=none; b=MkG9ZttMmLNDslAYXL4a0sL42tWHgme8uLwhxkjjYv4j56T3X0qOFl0OQ/2rc0HJwIyI6p8+3ibiZnWMkesvZi1xUibfO2oZ034BJ6gIWMEJ2ySki9DMzIpf4u7wIwJKcjvTawC0Qa1hfNp2kXnZt3gD9k5YmRzM9SkXqrcFy4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716393626; c=relaxed/simple;
	bh=yf2T1NRUeRDA4sbzbywAhB4cFczq2ILeF6v0legvArI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObMOyQDa5armUp2d088snHIxR1FvXlcoWaQLr34d2vV1t0O0bDbuMUdfpssW844sxwgddqCOvNGwhKzHKb+iMfl2sDMf89cED+WBqt4CEEVOBQpspcfTV1vo4xhuEoWn72Ryzj5kWUhpCXVxGKVnrFx2vWdRp6O6PGDjByfhI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HqqkUgOm; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HqqkUgOm"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so8219941e87.2
        for <oe-lkp@lists.linux.dev>; Wed, 22 May 2024 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1716393622; x=1716998422; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cEeqNZMxqfKYuQmEXCXsoXwHfU4Me5x6oZXofMLyGCs=;
        b=HqqkUgOmrgyH04m9rv1+PGpmNIbN38wrdSiRuwFL6mfvkypl8GWqd85EeDprBmM3gj
         lsgVkidN+WkHmA+NyN7ngoOmUWW1O6xcqfIn6zcUyxh4QllZ4n3J7txGCQFQY5VqsZoO
         yDuf81Kiy+RsuWSyM7LwWdzs8+zI7VHGgNJ/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716393622; x=1716998422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEeqNZMxqfKYuQmEXCXsoXwHfU4Me5x6oZXofMLyGCs=;
        b=nA+l/Icn6F91PtV/5DVeJ5G2BxJCdzPZLLuy0M9TNnjgeWFNyTtH8w8+Qc5LTOYE/e
         A70WutzB3iThzSoe4t2t9/zS/ukxEQqzyMubgGysH27Pm3xLK3FttbIqxy+8+diGgP1b
         qyhi+vb6bIDG4mROEGt51SPFdAs8/scZUZnsHMtgTmDYtn7t3uuBW7YXTsqgbtw1EYEY
         tDOyqo3UYIHsg3nLyipA17duGs0V7XDlaO5OtNVjRZgC2xVUDLaQ8y5YeHD2DGPzTWJk
         xt7g3ukzN7DLeBM93+G3QWB3fFDalUmk33CgzNISjzfV790zUAB8CwvVpvnZbJupvROi
         8f/A==
X-Forwarded-Encrypted: i=1; AJvYcCVvla4O6Oszc96dHA+D07Obri2leNvmDs3CSz6uvp6ruohX+lEE1KLzZ/FXcrTzSvdd2zZZT2L4XcPMqWXJGPTQDIusgEs/
X-Gm-Message-State: AOJu0YyuaApNGjsjxX6dX0k9ii3tawO6JwgHl2MkpSmAP9+cKi+W2hqJ
	ep+UK3rxVwdaOVpjhzkcW2gH+xHobY7FY0n1t8N4hMYEAqMbEb/Qj5iS6UFnHixuIiR/wQ4sE1S
	zj+ai1w==
X-Google-Smtp-Source: AGHT+IFJnaKcdsxDhCsy6KwgbUn+zTbnX6ynn7zEdJEUY+N9tjeYYPiuWWiygu8iSEr/VWnt3Q0NNw==
X-Received: by 2002:ac2:5f83:0:b0:51f:5853:14e3 with SMTP id 2adb3069b0e04-526bdd48000mr1340776e87.25.1716393622451;
        Wed, 22 May 2024 09:00:22 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578366176e9sm1023830a12.74.2024.05.22.09.00.21
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 09:00:21 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a599c55055dso985851566b.0
        for <oe-lkp@lists.linux.dev>; Wed, 22 May 2024 09:00:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpspGC/h6e1bXAun0ojlVcej8p6QQeROvrkSwPhrsqiLsMnwYvUj/gA76t7QAhSQrpEy+wKNCc1Ly2vLJMYveOp8YKzplJ
X-Received: by 2002:a17:906:d101:b0:a5a:423:a69f with SMTP id
 a640c23a62f3a-a622806b4c9mr166102266b.9.1716393621105; Wed, 22 May 2024
 09:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240515091727.22034-1-laoar.shao@gmail.com> <202405221518.ecea2810-oliver.sang@intel.com>
In-Reply-To: <202405221518.ecea2810-oliver.sang@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 May 2024 09:00:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2jGRLWhT1-Od3A74Cr4cSM9H+UhOD46b3_-mAfyf1gw@mail.gmail.com>
Message-ID: <CAHk-=wg2jGRLWhT1-Od3A74Cr4cSM9H+UhOD46b3_-mAfyf1gw@mail.gmail.com>
Subject: Re: [PATCH] vfs: Delete the associated dentry when deleting a file
To: kernel test robot <oliver.sang@intel.com>
Cc: Yafang Shao <laoar.shao@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Waiman Long <longman@redhat.com>, Matthew Wilcox <willy@infradead.org>, Wangkai <wangkai86@huawei.com>, 
	Colin Walters <walters@verbum.org>, linux-fsdevel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 May 2024 at 01:12, kernel test robot <oliver.sang@intel.com> wrote:
>
> kernel test robot noticed a 6.7% improvement of stress-ng.touch.ops_per_sec on:
>
> commit: 3681ce364442ce2ec7c7fbe90ad0aca651db475b ("[PATCH] vfs: Delete the associated dentry when deleting a file")

Ok, since everything else is at least tentatively in the noise, and
the only hard numbers we have are the ones from Yafang's Elasticsearch
load and this - both of which say that this is a good patch - I
decided to just apply this ASAP just to get more testing.

I just wanted to note very explicitly that this is very much
tentative: this will be reverted very aggressively if somebody reports
some other real-world load performance issues, and we'll have to look
at other solutions. But I just don't think we'll get much more actual
testing of this without just saying "let's try it".

Also, I ended up removing the part of the patch that stopped clearing
the DCACHE_CANT_MOUNT bit. I think it's right, but it's really
unrelated to the actual problem at hand, and there are other cleanups
- like the unnecessary dget/dput pair - in this path that could also
be looked at.

Anyway, let's see if somebody notices any issues with this. And I
think we should look at the "shrink dentries" case anyway for other
reasons, since it's easy to create a ton of negative dentries with
just lots of lookups (rather than lots of unlinking of existing
files).

Of course, if you do billions of lookups of different files that do
not exist in the same directory, I suspect you just have yourself to
blame, so the "lots of negative lookups" load doesn't sound
particularly realistic.

TLDR; I applied it for testing because we're in the merge window and
there's no reason not to try.

                 Linus
