Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E411EC00F
	for <oe-lkp@lists.linux.dev>; Mon, 20 Jan 2025 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737392200; cv=none; b=Y/bQPH+dicdYlEu5cGNpm0n0VZ4jSdXt/36oWS9KJPZjC0GIJM64+AkeRzwor33EdseosFN7FDeH9HK6VpFk6gZ2aeyrPtK7MZfiqNHHWRGOBeWe8fSZpNXuH9oQwzOziALwp1YXweWXTghwnS7A1BsazIbh1gbYvarA8Tb8ipE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737392200; c=relaxed/simple;
	bh=4CvVSY5hWxosVkVreTkBr9Yrr92TsfK5tAEGgE4motY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2P8TPXGpIKjvybybcctrbmu8BA4kydxFvL9viRmZCU/uy1MVZS9ni7i7KIFhRNsr6Q8E8pVSixPfxE8ZKLzBvUx1F7afCOfTFvPwI9RqGalkfBq2UmODFEe7wbRS7dFdErcOhrKq5G4IkIZgMZnYbAfAiX5vQZl0Gu/Rx7QIPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNyh+eo5; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNyh+eo5"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5db689a87cbso9148333a12.3
        for <oe-lkp@lists.linux.dev>; Mon, 20 Jan 2025 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737392197; x=1737996997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CvVSY5hWxosVkVreTkBr9Yrr92TsfK5tAEGgE4motY=;
        b=cNyh+eo5oppf6Li1SLjSavzl1wows8VtERfIcy4QYpDKwZ5EWjSyhpoiSWaHrqMwL/
         GzdhHWiZ73fnA1Dgi1G+PT5xo8SZPA2/B0wn+kHzCpTc8hyMZyffk7Z52uDuQXphB2HV
         XRzyzzeIYcalepMOFhwEJXBvSnzgvHw9xdidFI5yRwnujsjeLtn/9vjpQyfqEk49Bt/9
         yo4Xdolehfp65Mp4Sv6ZYJ6xzE5l/3Q9fHd2cp37ti2CDpgSbaIbxVXE0b0HcvLjJFHt
         aglIP2sIva6lvRPP7XJqzvIwypZG9ZIRkJOn/Us+5QA4mdsRcAPXO6IUhVVoh20hylm8
         LMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737392197; x=1737996997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CvVSY5hWxosVkVreTkBr9Yrr92TsfK5tAEGgE4motY=;
        b=DdPm/7zp9c2OOLht8dou+MgAP3r9P+R/lmxU3uW9OuNbp5AgSf+7LRVlg0xlwg53RA
         23dm5NeYzut598uA7PW8jOXGvOAQKWF9ijl3JJB7UefLfpvmTm7ofmGQirHjgpqCqpBy
         t/yARVHmJdsEwX3wQg7tWgtSmw83Tk5dsQKYbssW/BYw3H21uxqOIIo+QW7GqRdjepIz
         kcf8bqDljsyoQ6T0gCRMeMrR4QEwx1L10gzbBuiW0W49J8JI+H08gOrkjmi/UWToe1to
         pGBcXhVLDAK5g3q55sHHYFG+zKe2kAjWceDrxQt76hu9/80FEp/PAmBDRClsI5IAn2DA
         x28w==
X-Forwarded-Encrypted: i=1; AJvYcCXJhfk+NrfQ1+nvfMCNgWqJpDtbw97TzSJ99vod4Ke403f1yYKvbFJbtj0naYlOTdQMdt/mlKs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOXY8cJoPQEbWbiWH1BqAX4Ue9CnuFwM1qVhZesF+M2Fn3uqr4
	sw79N4nQ9s3R31HXIjVBMI6ZUC0RAGOySfYay4oYrJELrQTSZP9Ia5XHt7XPhxHW7sYCq05wWVE
	JmkmjVGHKZrGBAf2OupYXlg+HES4=
X-Gm-Gg: ASbGncu/q+MGsvH6vEWG4Ai+0dQLPJa7fZKoLYqYbKFgVsPPu1kkw1TPwUlbrMuDXjE
	XJBb6xROGeNson6H/oIMmvJf8icSL1RCJRBM334ff+f+gWc2QNwA=
X-Google-Smtp-Source: AGHT+IF14A19T+Gx11YlcY8v4DNdzLQUA+vTHCkjLeQUh/0qf2OWi8InoQ9ihBBc7ztM+Gi8v/put8sMIX0NOyq3PLw=
X-Received: by 2002:a05:6402:3509:b0:5d0:cfdd:2ac1 with SMTP id
 4fb4d7f45d1cf-5db7d2d9958mr13973390a12.6.1737392197031; Mon, 20 Jan 2025
 08:56:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501201311.6d25a0b9-lkp@intel.com> <leot53sdd6es2xsnljub4rr4n3xgusft6huntr437wmaoo5rob@hhbtzrwgxel2>
 <20250120121928.GA7432@redhat.com> <20250120124209.GB7432@redhat.com>
In-Reply-To: <20250120124209.GB7432@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 20 Jan 2025 17:56:24 +0100
X-Gm-Features: AbW1kvbaXg9VK4NnspF3WjlWEwZ0pL-tI_NNyxvLDripmfqOiy7OOAZAjI8A9k8
Message-ID: <CAGudoHFOsRWT0nKRKqFwgHdAhs0NOEO4y-q7Gg4cjm9KBxQc9A@mail.gmail.com>
Subject: Re: [linux-next:master] [pipe_read] aaec5a95d5: stress-ng.poll.ops_per_sec
 11.1% regression
To: Oleg Nesterov <oleg@redhat.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Christian Brauner <brauner@kernel.org>, WangYuli <wangyuli@uniontech.com>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 1:42=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> Forgot to mention...
>
> On 01/20, Oleg Nesterov wrote:
> >
> > On 01/20, Mateusz Guzik wrote:
> > >
> > > Whatever the long term fate of the patch I think it would be prudent =
to
> > > skip it in this merge window.
> >
> > Perhaps... I'll try to take another look tomorrow.
> >
> > Just one note right now.
> >
> > > First two notes:
> > > 1. the change only considers performing a wake up if the current
> > > source buf got depleted -- if there is a blocked writer and there is =
at
> > > least one byte in the current buf nothing happens, which is where the
> > > difference in results is coming from
> >
> > Sorry I don't understand. Unless this patch is buggy, pipe_read() must
> > always wakeup a blocked writer if the writer can write at least one byt=
e.
> >
> > The writer can't write to "current" buf =3D pipe->bufs[tail & mask] if
> > pipe_full() is still true.
>
> But I'll recheck this logic once again tomorrow, perhaps I misread
> pipe_write() when I made this patch.
>

While I'm too tired to dig into the code at the momen, I did manage to
grab an extra data point for hackerbench. Note on my setup (24-way) it
takes way longer to execute with your patch.

I checked how often the sucker goess off cpu, like so: bpftrace -e
'kprobe:schedule { @[kstack()] =3D count(); }'

With your patch I reliably get about 38 mln calls from pipe_read.
Without your patch this drops to about 17 mln, as in less than half.

--
Mateusz Guzik <mjguzik gmail.com>
