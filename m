Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18342D3EF1
	for <oe-lkp@lists.linux.dev>; Thu, 18 Dec 2025 17:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766079466; cv=none; b=ikR51CKqoIqihnvVqyVdR+nxmptaV77JiEVLVDnM9TGsdbB1MpHhgWOen/DVxWJSjW66EQIOXEMq5XuHHtmKRpg4JPOkt4zZ2uGWwdixPQA0BUfCNcT1uxgaXOukETq5QVHtmhazI17lQM0oLe2BWBzJvklEgtXVdWTzzzMLwiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766079466; c=relaxed/simple;
	bh=LSE8AEfkv3ixrE/afjpgySv2B3EeMuTooH2LqFuuwNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYi036mEhTetOBxt4+zdqGtj98enbbPGd2ngL9vFVrtFLd8b9apDyRAGT5QHl6FVw5xXEKlzg/wACjFhJ1MzTpyG/Oh/GRVWf/gbcqAC35e9CIfB6BK556EGEOvkLYG60xzno6SaMYKYVI+5Y78hFd7Nf1qALNWXi8OIAByMnLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqD6wZkH; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqD6wZkH"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso8571331fa.0
        for <oe-lkp@lists.linux.dev>; Thu, 18 Dec 2025 09:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766079463; x=1766684263; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5QdlsjnvqcZtuvASOH3lpLVJ9DAQKa6CAUEA2Iqcz8=;
        b=aqD6wZkHg6k2xrkajk+Mt+WDNWlIx6PLOC1sbiezUSEHGQ9roR9kaujMQXp24Cmvnv
         gGDGwn9gSHPAXCIJCbmZJP+8/N7X/IFw1sLlY8w9tnSVyD8W7AKaLpnxqNYEwtpJSUrO
         KuIX+fnygGyPcc7ehiAdvb2bKueP7nuraYz7KueE/4QSeuOjWGJx9XClAloXWNtPRgQN
         55LxjhFWgx/nIpKZlNZCOzRUgteegKH4c10TKeEQnV0wWR1xQAEKvViYgqCYfv3e8A3o
         PXn/SE6Gkl3wziQa/ES8LEKr/P6aYSSPIo0run91njT7cEN4SLIs511Fqj/HVwr7wS35
         5xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766079463; x=1766684263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t5QdlsjnvqcZtuvASOH3lpLVJ9DAQKa6CAUEA2Iqcz8=;
        b=j5I0+8WPIFPHfwn4sLuzDx4sj5jPMfctV+vZF6xKC0OwCyZI0CIUmPeBSpPSdPzQv9
         ul2YwpYtWCKxZp3qM1DB0JaTgZSYjoo16zEvV/ri2UOK+kEEUBDmH27ZY+eFQHzVfZL5
         tMjqtyKi9QJ+4fBvkd+Ryc1zr/Pb0EJBpunaXV7Z82XZBlJUT8hNfMW1mDpad/G5iIra
         yuu18eNhBKozQRZaG2NHJhV3XGp3fKLUSQqsc/xm8svOO2h+a83EaDlJCxoZ6Po/ovkM
         Kl8JjIkdK9/orpvvztTL2GmOTIo3nWiSRFUB0UVAw+l2tfJPfIaFP5PBd4CE0kaL3JYI
         xIgg==
X-Gm-Message-State: AOJu0YyH/pr3JJNR9+1QaVdAGMv1YtpIo+luMoNNZkTOkdmDXyqtOKRB
	JY1mtyvOKhzbh+tVGtWQI01JLl0Gqtrfqnm/SDplstUMJXbzl2usLneJ5e7/m6dc1ebEzX/p8mA
	4ynhYT8pJG1kJViP6xkX4K0e0vlUFk8U=
X-Gm-Gg: AY/fxX5TncsANPxYxndVQhYb1y7n8vkhs2bx79q1ka0TFLd3rTNAYuRSSwdPkJnM97N
	kmxJBqFlYCXhbkEtPT7DXIWCdv4YuodCKXEuAAy++XC/S6KuLYsXBOljHl5bBWcScWpY9xyd5+9
	OmoacCufUfDymwhKNd7t+hPsCMZulkuSxJnSxTD91ziv5EaEJHT7FPtv52PK7Yj5YqB5asU+NL8
	qd+CHktIe+9vP45YjGICPWSvingV5wnRQFmNgj6bd6YXRcsKWKY7rWSHJr2DHkzakvGZYUYVYUM
	Xx8=
X-Google-Smtp-Source: AGHT+IEpztJ8/Oc+Es3sQgy2cxIcccuVwHnjY+irVmpUhBY6FE1JhNS+XHvQhg0+lSlGd1EkNb1fvtRSAvrglkfaPnQ=
X-Received: by 2002:a2e:bea2:0:b0:37f:c5ca:ac02 with SMTP id
 38308e7fff4ca-381216351fcmr293951fa.20.1766079462542; Thu, 18 Dec 2025
 09:37:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202512121138.986f6a6b-lkp@intel.com> <aT_8woTbtklin3Bh@milan>
 <aUI/MZ8sGDt8toOC@xsang-OptiPlex-9020> <aUKONAP3CZn1kZw6@milan> <aUOFGneXSVE+DItX@xsang-OptiPlex-9020>
In-Reply-To: <aUOFGneXSVE+DItX@xsang-OptiPlex-9020>
From: Uladzislau Rezki <urezki@gmail.com>
Date: Thu, 18 Dec 2025 18:37:30 +0100
X-Gm-Features: AQt7F2qrnk7u0JIBsBRE6RAjnmRa-PLVv94DblNCWhOYRGSZu08KzeG00DwOzEI
Message-ID: <CA+KHdyUgK6hSbrKMpH1YqtadzBDFR=SnBUY-hCHnzkLqmcPf6A@mail.gmail.com>
Subject: Re: [linus:master] [mm/vmalloc] 9c47753167: stress-ng.bigheap.realloc_calls_per_sec
 21.3% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Oliver.

No, thank you!

As i mentioned i do not see how pointed patches can affect performance.

--
Uladzislsua Rezki

On Thu, Dec 18, 2025 at 5:38=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Uladzislau Rezki,
>
> On Wed, Dec 17, 2025 at 12:04:20PM +0100, Uladzislau Rezki wrote:
> > Hello, Oliver.
> >
> > > > >
> > > > > Hello,
> > > > >
> > > > > kernel test robot noticed a 21.3% regression of stress-ng.bigheap=
.realloc_calls_per_sec on:
> > > > >
> > > > >
> > > > > commit: 9c47753167a6a585d0305663c6912f042e131c2d ("mm/vmalloc: de=
fer freeing partly initialized vm_struct")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git m=
aster
> > > > >
> > > > > [still regression on linus/master      c9b47175e9131118e6f221cc8f=
b81397d62e7c91]
> > > > > [still regression on linux-next/master 008d3547aae5bc86fac3eda317=
489169c3fda112]
> > > > >
> > > > > testcase: stress-ng
> > > > > config: x86_64-rhel-9.4
> > > > > compiler: gcc-14
> > > > > test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @=
 2.4GHz (Granite Rapids) with 256G memory
> > > > > parameters:
> > > > >
> > > > >         nr_threads: 100%
> > > > >         testtime: 60s
> > > > >         test: bigheap
> > > > >         cpufreq_governor: performance
> > > > >
> > > > >
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-lkp/202512121138.986f6a6b-lk=
p@intel.com
> > > > >
> > > > >
> > >
> > > [...]
> > >
> > > > >
> > > > Could you please test below patch and confirm if it solves regressi=
on:
> > >
> > > we directly apply the patch upon 9c47753167, so our test branch looks=
 like below
> > >
> > > * f7991e8a0136cb <---- below patch from you
> > > * 9c47753167a6a5 mm/vmalloc: defer freeing partly initialized vm_stru=
ct
> > > * 86e968d8ca6dc8 mm/vmalloc: support non-blocking GFP flags in alloc_=
vmap_area()
> > >
> > > but found it has little performance impacts
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/t=
estcase/testtime:
> > >   gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.c=
gz/lkp-gnr-2sp3/bigheap/stress-ng/60s
> > >
> > > 86e968d8ca6dc823 9c47753167a6a585d0305663c69 f7991e8a0136cb0fdf35f11e=
28a
> > > ---------------- --------------------------- ------------------------=
---
> > >          %stddev     %change         %stddev     %change         %std=
dev
> > >              \          |                \          |                =
\
> > >   48320196           -10.9%   43072080           -10.8%   43116499   =
     stress-ng.bigheap.ops
> > >     785159            -9.8%     708390            -9.7%     708644   =
     stress-ng.bigheap.ops_per_sec
> > >     879805           -21.3%     692805           -20.7%     697312   =
     stress-ng.bigheap.realloc_calls_per_sec
> > >
> > Thank you for testing. I had same expectations. No difference.
> > Honestly i can not figure out how:
> >
> > * 9c47753167a6a5 mm/vmalloc: defer freeing partly initialized vm_struct
> > * 86e968d8ca6dc8 mm/vmalloc: support non-blocking GFP flags in alloc_vm=
ap_area()
> >
> > can effect performance. I am not doing anything related to performance.
> > I would like to ask you if you could test one more thing. I see that
> >
> > [still regression on linus/master      c9b47175e9131118e6f221cc8fb81397=
d62e7c91]
> >
> > contains also below patch:
> >
> > <snip>
> > commit a0615780439938e8e61343f1f92a4c54a71dc6a5
> >     mm/vmalloc: request large order pages from buddy allocator
> > <snip>
> >
> > where we try to use larger order for vmalloc. Could you please revert
> > it and rerun same tests?
> >
> > Thank you in advance!
>
> we've seen comments from Mateusz Guzik in
> https://lore.kernel.org/all/e4b6sjeh22uqhxhxudsbanlnyo2potwowuy7mkrp6tvxn=
ftjn4@mcjyes2s3eu6/
> that this could be related with cacheline bouncing.
>
> not sure if you still want us to do the test you mentioned?
>
> if so, sorry that I cannot make a clean covert of a061578043993 on
> c9b47175e9131. could you prepare a patch for us? thanks
>
>
>
> >
> > --
> > Uladzislau Rezki



--=20
Uladzislau Rezki
