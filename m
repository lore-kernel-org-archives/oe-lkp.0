Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842773559F4
	for <oe-lkp@lists.linux.dev>; Thu,  6 Nov 2025 23:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762473440; cv=none; b=mrC8xJdRym2bvrwMr44PGF/vqgsLRNtWv9Q4xEGniz1qX+v9iQ4PNbQLgPDQMQNBS0aeO9+dYQ08DEgmdZx2AJMPkYccStjZs5ptTqeuqpC7doqqoAXvFlDnXythQALEa2JprEnZO8abF6QLqfiG7QsF1Iz6VOG9YF5QQXbmukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762473440; c=relaxed/simple;
	bh=IWxoWu8rXqXa0LUhIlSBBtlEVdGorhIf64yYRWvjZgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fkio5kFmOQ7kJl9TSiN8cyoG0gX9S479NOAYZ2thPzJuuyDcEFUC/eQk52FusvVkyq8S6xTE9nxYoIXYr8eLN277GafZlPq4+aS5asn/hCNTL9jOVH5pohlaCtYzSGd+irKizNtQzMLTX4a268SdXg3FhctfWRoEOl11LfAijDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hL+sN2af; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hL+sN2af"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b64cdbb949cso32772166b.1
        for <oe-lkp@lists.linux.dev>; Thu, 06 Nov 2025 15:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762473436; x=1763078236; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y0A68hlyrNzH2iLR6wRxqsJflj2t44wqvP4Uo+gLMc=;
        b=hL+sN2afc6aIyC+f9MWEODb40QAeAikKpSO9ayx6b96vsKn24uXw+m7v/NyROrriuA
         5M4VPX1zeCvPI0+Jp3Db9CUPvlA02SsnAs+NhMQFn5nZrntXVqrqBfGBUZVt3WI8fXFx
         FtgCD4lVxTSlOB4f/VdQm2UIV1G8Q4/JddkNdc/IRDVcRgfQjtIQJNTtkWwAoTTfTQi8
         /Jxtgv8BNuLg/ysRMfGHbHcAH5fI5xFTcGBtc54nYpY+UXxQkdIaywTZt0CQISOTWwWy
         kAhQA1GFBNx3dzo0ryTiNXFuo401D8fdnMxSxUli6bQS1IpwSVfR1uDiguWdSXIdN+m6
         9VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762473436; x=1763078236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Y0A68hlyrNzH2iLR6wRxqsJflj2t44wqvP4Uo+gLMc=;
        b=k9Rf6WEqCb8E3D8asKYUJM+vsilHrdN2KeRJCgIb9snGBtJU0ZPkiV2B0tq9wE6Huy
         5xFwOGMXdi9nTCM1wsdkXWjTlOdpFKDbrbI9TW8Q/DeUhV7QDmgAO2T6Bsjh67KSD+eh
         /7k5MRdKNjb6+chve9oJSKW3/15mJOs1rfitKh0mVIZdaBQ3HmW/WYjWIIeajkJtzz+c
         v508TAlZcQ3oBvX2rfQLz4hmc98CtVCtjo62jHocqaBFzJN9hky67RZQB26m4WpqB7Q9
         YFLzlQL0gpx2VLgtrT8Nv5OgaUvgjlrSui37Cn5/Wc7MmHMRRPMxSVJ4VRP0na4JYwew
         g+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWgsWJ+Tg2E2ktweso/QptfmRaWYx9Rmtx5Zlihb5EgJFCqZsQ0okh6nLfkXoy+dQ8kUcAuehs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtcvJ61aEFadR8e2i6YfBfiPK/zoXW4VLdMAcYvroIKJvNWyNr
	rIl4mgG7qBWAd/z0Zzai+dt0ToiQWftXwxJKrCZaKydib6QX9CGyoBno4pwSy+WsvPGu+QpOiEH
	6Cqg+3kbFp5rmeBh3u8ZlNgVPalhhEvsJDJc9uJ4=
X-Gm-Gg: ASbGncsskuaA5x4ebSRvFO+kJI2PcsHpLD4g/aOrUPnGF9ov7YuwVsfLRx6oNC0CN6c
	JLpoTYHq/7EKuHbkfLBB7gpvBkXQrfFIBsDccxmC5Cc59UnMjXe7O3qM0lXU4n4A1jJPn8gRfrs
	3Ka93yAuW/Jr2ZMyoU+HXHNqH7HSxtCTiKC6zFcE5phuoUkKDvogVzmU/fJJVNQvn1oWFUIySuM
	ub3JiNoF5PEWpm+MBwa+gGaZG2x+k9OKlr4cZRg9o7IGWdTpyqDb/SD5uhbXXXGxMfl5XzrB2ZE
	VrA29cMalfspuTu31K7FEJw4mutk
X-Google-Smtp-Source: AGHT+IHskI3NPaBM93s3aGR+lLiRMwTDGW9yJJLcgo0ttSscGMzfUiyz1/5T9E6opnMLv3sjCAHiQMsu+5aeY2Db8Zs=
X-Received: by 2002:a17:907:d1e:b0:b72:58b6:b26f with SMTP id
 a640c23a62f3a-b72c0d10a47mr79390566b.42.1762473435501; Thu, 06 Nov 2025
 15:57:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251105122808.GK988547@noisy.programming.kicks-ass.net> <20251106105401.220218-1-sieberf@amazon.com>
In-Reply-To: <20251106105401.220218-1-sieberf@amazon.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 6 Nov 2025 15:57:03 -0800
X-Gm-Features: AWmQ_bn1DegqWn-ulMOm_PrZS8aXfVAqK2UomCdSnn0-gDRXKjgdI6sr0FU_VHQ
Message-ID: <CANDhNCpZWFsxZsmbXY2Q6DBfovqas8haepdYyx=RpWsZGDKN0A@mail.gmail.com>
Subject: Re: [tip:sched/core] [sched/fair] 79104becf4: BUG:kernel_NULL_pointer_dereference,address
To: Fernand Sieber <sieberf@amazon.com>
Cc: peterz@infradead.org, aubrey.li@linux.intel.com, 
	linux-kernel@vger.kernel.org, lkp@intel.com, oe-lkp@lists.linux.dev, 
	oliver.sang@intel.com, x86@kernel.org, yu.c.chen@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 2:54=E2=80=AFAM Fernand Sieber <sieberf@amazon.com> =
wrote:
> > But yeah, if the task holding your resource is doing yield() you're
> > 'sad'. Basically a sched-fair yield() means: I've no fucking clue what
> > I'm doing and lets hope we can make progress a little later.
> >
> > And it gets worse in the context of PI/proxy, because in that case your
> > fair task can deadlock the system through sheer incompetence.
> >
> > Anyway, consider the PI case, we bump a fair task to FIFO and then
> > yield() would do the FIFO yield -- with all the possible problems.
> >
> > And we want the same for proxy, if the boosting context is FIFO, we wan=
t
> > a FIFO yield.
>
> Alright, makes sense. Based on your suggestion I've submitted a patch:
> lore.kernel.org/lkml/20251106104022.195157-1-sieberf@amazon.com/T/#u
>
> This is essentially the same as your suggestion + handling of yield to an=
d
> scx.
>
> Also confirmed no crashes with this patch + v3 of the vruntime forfeit pa=
tch
> https://lore.kernel.org/lkml/20250918150528.292620-1-sieberf@amazon.com/
>

Fernand, Thank you so much for root causing this, and helping validate
the fix works!
I apologise for missing this case in my testing.  I'll try to see if I
can include the trinity test in my regular stress testing.

Do let me know if you do see any other proxy related issues!

thanks
-john
