Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D9A3FB10
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 19:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706729740; cv=none; b=NuLqNggY+hv4gjgNH874SwvL2kSZ8d1QAbFvZ/u4xGLG9gxQFXoJJWFTKfoJWWQC+jy4uXGo97LfetXNVUUveklsw7wjnaOeCAN+litNTBcxBDUmKqzFkznd1d6+vE22uOSs8MhpbmDrhXwaGL3CpfOvQ/p4QvDlfUcr7GdrztQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706729740; c=relaxed/simple;
	bh=KxaPbQoMVGpzXkPYAK0jPuintsfxxRbrjh4YiQiqYdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5xkBEyw2U8K9bQiXdpUU5tl/zY11NZ9kchu3f5LCRxxStE6a63zmYWvmMkt6ur5oxF2cLKVK2HuKbbGeNGVYEKK4Y3pbq5q77AWLaK6QqiYSF3ghuX+6InG8ijv9ADpq5z8b7jPHtgNHKLMYOqHViZ2z+GsqhUIpR6Br+Gad2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=J7J/ePYX; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J7J/ePYX"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-510221ab3ebso151024e87.1
        for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 11:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706729736; x=1707334536; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qTSR4VBQ5bNcbabS3+R2Py4few6cllL6Bzjpps5e3Nc=;
        b=J7J/ePYXoaKb27Z6AyNWU4LBDnwS1yMn4sJZIESOmVhdtBdUs6KOb8f6ZFXYfACGaS
         YkL9yJlMzPj+dK8MzS7M/2qg9118p9rwmOig2QEKu1+545JAms1OWljmN8RZfU+S8pXl
         vWYkf3eLFeev0RZ95M0PaX8lLXj8R1miGSu68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706729736; x=1707334536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTSR4VBQ5bNcbabS3+R2Py4few6cllL6Bzjpps5e3Nc=;
        b=q3S2O9kjI87DHn9G8CI89Sh6Rr0+X2J1ZxS5rd47FxwKlvviGGYOSpy8eLqA1ShQBk
         wxQio42WvVfYcD898rZ8Hm9SLT/rKbEviPocV96pIDAdEzKYo3fv/MhAtimG4aggM2jQ
         7YqD05dkDU7Kc6sNkMTlGVzw/PAJ4KhWu1iDXkuQyF0PiqYqqPRaKflILC4A6jH1shAQ
         whvLi+CQepWMG8SyY/DFLaeotFogiFo9CPyStQbPwZeyFj4CnksK1OhuP/dd0j39oPrK
         qfsqQQFZAF0SXhwDk3t4DQQdgmINCyv1Fh7H+7DNJNnpK6UXIdf+c3AQyIFJLeTFNMQc
         JiZg==
X-Gm-Message-State: AOJu0Yw+z9yH+0tYFTe/jcgKydy86q7qlw2BhRes8SqPyjdKulinLSdG
	sIkGiQxPtEwQQDgSpUwvofasvTRuDIMzFn4MtuhBQ6CnqtTrRGBo5BiFmJmGtWUgwFMgS1zyogT
	8zLI=
X-Google-Smtp-Source: AGHT+IHh4tC7LK3oIBW73jwXRkcADocYASzthxAS2rlkjLETi5MJMyWZHt6iJm+w59BJq4m/eJk4FA==
X-Received: by 2002:a05:651c:685:b0:2cf:3900:9bc1 with SMTP id x5-20020a05651c068500b002cf39009bc1mr1611326ljb.19.1706729736061;
        Wed, 31 Jan 2024 11:35:36 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id b5-20020a2e8945000000b002cb28360049sm2100315ljk.96.2024.01.31.11.35.35
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 11:35:35 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d057003864so2541051fa.3
        for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 11:35:35 -0800 (PST)
X-Received: by 2002:a05:651c:105:b0:2cf:2c54:d8f7 with SMTP id
 a5-20020a05651c010500b002cf2c54d8f7mr1715035ljb.8.1706729734829; Wed, 31 Jan
 2024 11:35:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=wgp7UkG31=cCcbSdhMv6-vBJ=orktUOUdiLzw4tQ4gDLg@mail.gmail.com>
 <20240129152600.7587d1aa@gandalf.local.home> <CAHk-=wghobf5qCqNUsafkQzNAZBJiS0=7CRjNXNChpoAvTbvUw@mail.gmail.com>
 <20240129172200.1725f01b@gandalf.local.home> <CAHk-=wjV6+U1FQ8wzQ5ASmqGgby+GZ6wpdh0NrJgA43mc+TEwA@mail.gmail.com>
 <CAHk-=wgOxTeTi02C=kOXsHzuD6XCrV0L1zk1XP9t+a4Wx--xvA@mail.gmail.com>
 <20240129174950.5a17a86c@gandalf.local.home> <CAHk-=wjbzw3=nwR5zGH9jqXgB8jj03wxWfdFDn=oAVCoymQQJg@mail.gmail.com>
 <20240129193549.265f32c8@gandalf.local.home> <CAHk-=whRxcmjvGNBKi9_x59cAedh8SO8wsNDNrEQbAQfM5A8CQ@mail.gmail.com>
 <CAHk-=wh97AkwaOkXoBgf0z8EP88ePffLnTcmmQXcY+AhFaFrnA@mail.gmail.com>
 <20240130132319.022817e8@gandalf.local.home> <CAHk-=wiGb2aDbtq2+mYv6C=pYRKmo_iOu9feL9o52iRT8cuh6Q@mail.gmail.com>
 <20240130143734.31b9b3f1@gandalf.local.home> <CAHk-=whMJgqu2v1_Uopg5NBschGFa_BK1Ct=s7ehwnzPpPi6nQ@mail.gmail.com>
 <20240131105847.3e9afcb8@gandalf.local.home>
In-Reply-To: <20240131105847.3e9afcb8@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 31 Jan 2024 11:35:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgh0otaSyV0MNrQpwFDTjT3=TWV94Wit2eUuPdh2KdyVg@mail.gmail.com>
Message-ID: <CAHk-=wgh0otaSyV0MNrQpwFDTjT3=TWV94Wit2eUuPdh2KdyVg@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jan 2024 at 07:58, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> BTW, I ran my full test suite on your patches with the below updates and it
> all passed.

Those patch updates all look sane to me.

> I can break up and clean up the patches so that they are bisectable, and if
> that passes the bisectable portion of my tests, I can still send them to
> you for 6.8.

Ack. That series you posted looks fine. I didn't do any actual testing
or applying the patches, just looking at them.

The one thing I noticed is that the 'llist' removal still needs to be
done. The logical point is that "[PATCH v2 7/7]" where the
eventfs_workfn stuff is ripped out.

And the 'rcu' head should now be a union with something that is no
longer used after the last kref. The only thing that *is* used after
the last kref is the "is_freed" bit, so there's lots of choice. Using
the 'struct list_head listl' that is used for the child list would
seem to be the obvious choice, but it could be anything (including all
of the beginning of that eventfs_inode, but then you would need to
group that as another nested unnamed struct, so picking a "big enough"
entry like 'list' makes it syntactically simpler.

               Linus
