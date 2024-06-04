Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860914D6FC
	for <oe-lkp@lists.linux.dev>; Tue,  4 Jun 2024 23:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717545251; cv=none; b=D4wox5tNnOnyLXm2eZkq2CK9/x1t6gC8j1Kbbkv4jwk7zF8BGZS73gAgCprd6j5IPTkAjYn01lrhcqOUhFDMAbrQuqqTuFHjasMyfpEQFp98dOafK/VpaGIvdIyDoykeVbibFpqrWRV9S3collkHW1cAH/FH/be1iOuc0KWHxZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717545251; c=relaxed/simple;
	bh=6n5yBPEPKuLBc16hNZxPmgwPkIO5nIyaN/aHQt8Cc1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhyQJIxvsLnP9AGZ60WyHOY4yzMKJUNlrjyBbFsQg8oAIpxMzbcE7a4OvjRfKhHYtZqUiPZ7of9UgNj6IhH90rnXXp2tHLZQpTQ3216zhIqXSSNIl1pt3WGNGkHRs1xJqddex/fqExa1xskftNUo8p+BN42CAeq20F8U9hgFq6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBzyRK4v; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBzyRK4v"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421392b8156so16163705e9.3
        for <oe-lkp@lists.linux.dev>; Tue, 04 Jun 2024 16:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717545248; x=1718150048; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6n5yBPEPKuLBc16hNZxPmgwPkIO5nIyaN/aHQt8Cc1Q=;
        b=DBzyRK4vUtgbkSDoA1HEXmExORBH8+Man6OeromR1n4zpHUdck3CV+x44N6nrBjMQt
         KDjXsgxE3ErZA+Y/l3LvjqnLcIV8r4f2xVEGJtOEAmNkJrCmsPTDK8b1w98cbkqxkaD6
         Zu9pm+/erU1stymyKgKPomsTrIz68kShIeeWs2SEB64zLGobTh4WI519Xk6S9w9nvsNP
         CwgF8WPSvIE91OXDaxVFznrYWC6sOHFsc/d1XDntQsjSAtiHVFf1x37ccDcLHsauwnYf
         tl3ZTSX84GnTPmIeKLzMaWRdMH9U6GQPsEMSFsY600gkmiGDwpMpQYeoZFP7QTZzpzIV
         cltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717545248; x=1718150048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n5yBPEPKuLBc16hNZxPmgwPkIO5nIyaN/aHQt8Cc1Q=;
        b=ZeVb0gHSnX/olX6oOMGDvKt0sxPuqpxqoEtr2HIY+KY6bQLDUiS1Nhog6TYP9pDadR
         tYjnDqAvFpqcpkKLBz7tDZoKVT78JCFS1Hqp6pd4B6MoXW+o2T84aSdUyfS7TpkNWaf0
         nzTpxp4pirxd5aQ0yLfDqJEbsKTHDfO9TglzKrpAXc9eBdreWH9Lkl5tVmO/kWmhQ1Ci
         O0Hnr1zuZ2aT8hOjyzEOlyqetwkbzt2tM9hEAfPHxj+bGvliGLHgx/YSXaGx3j1Jctjp
         UH+1Qe2JrOR56UksNuHXL+BlWBLr2hrDxMMXSzm0Q2RN9cM9b0QaXuVYaeyywt2FmkcR
         UoFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVKaLD++Kkc+ByJneAJkBCe/Jpj4z45P+FC9gUBS5ZGpfVHtPukRO7Shhr27pbqHy/bkavaXnko9atHggSPghmBCpVf1+J
X-Gm-Message-State: AOJu0YztDUOjPz0vVMDltyZB88IjYIMqesG7Jx7qDxrz+0MOHpK2g8vh
	MGsFU8LCQz6WZo2dnsXi2MlcfURTxI3fGHbWJuaBEXBrbJs3Mc4d+Jtc/UkkT1Qg5xmBhY4WFWf
	heULZwlhEbTcHI/+UxcXfQaK42VY=
X-Google-Smtp-Source: AGHT+IEFa69ZUCNNBYc+8Bm37HfM1r9rsWHOXTP1G8B6R46/+68QCImeVcPzFFNbacw5tmIOxlJAgbHRWt0rfzbs7Mw=
X-Received: by 2002:a05:600c:3550:b0:41b:fc3a:f1ef with SMTP id
 5b1f17b1804b1-42156339013mr6380615e9.33.1717545248325; Tue, 04 Jun 2024
 16:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405311534.86cd4043-lkp@intel.com> <CAHbLzkpMhEuGkQDGWrK1LhvZ-ZxTJkV1xjmn-nRGZMH4U+F5ZA@mail.gmail.com>
 <890e5a79-8574-4a24-90ab-b9888968d5e5@redhat.com> <CAHbLzkqphyX473LBCXXf8rWEr-8m2PB--CT0cwCax3mUyZPGhA@mail.gmail.com>
 <CAHbLzkqG=9VmAcOgFr-50ZdZtf7xj2PqpfD3UHUsMX3jR=+snw@mail.gmail.com>
 <f4599bd2-72af-4e8d-a0fe-153b69816133@redhat.com> <CAHbLzkrOspjVuQw=BN2+RZmV_Ydpz_50yY7FEakJw8Zm14Y9-Q@mail.gmail.com>
 <a088b5cf-503e-4ed7-b427-f17a9ec5d1a8@redhat.com> <CAHbLzkpnDPYWq=HnaJcKhKnppdNikX4YG+1Ysu8Z+XJCoKK4SQ@mail.gmail.com>
 <CAHbLzkr5K=4Shiyb5KgPTQ20jE2Zo08wK=mT3Ez9ADEdJe0Z9A@mail.gmail.com>
 <Zl3M7iniPQaPFDrW@xsang-OptiPlex-9020> <CAHbLzkrOTAaYahG4JYMNrJDhQNZZxW9u+2n71J=v1XYJEVpUdw@mail.gmail.com>
In-Reply-To: <CAHbLzkrOTAaYahG4JYMNrJDhQNZZxW9u+2n71J=v1XYJEVpUdw@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 4 Jun 2024 16:53:56 -0700
Message-ID: <CAHbLzkr16YZ80ES5U4BEWJ+ueL22nDJtgH=eOztdHfy080diPw@mail.gmail.com>
Subject: Re: [linus:master] [mm] efa7df3e3b: kernel_BUG_at_include/linux/page_ref.h
To: Oliver Sang <oliver.sang@intel.com>
Cc: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Christopher Lameter <cl@linux.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 9:54=E2=80=AFAM Yang Shi <shy828301@gmail.com> wrote=
:
>
> On Mon, Jun 3, 2024 at 7:02=E2=80=AFAM Oliver Sang <oliver.sang@intel.com=
> wrote:
> >
> > hi, Yang Shi,
> >
> > On Fri, May 31, 2024 at 01:57:06PM -0700, Yang Shi wrote:
> > > Hi Oliver,
> > >
> > > I just came up with a quick patch (just build test) per the discussio=
n
> > > and attached, can you please to give it a try? Once it is verified, I
> > > will refine the patch and submit for review.
> >
> > what's the base of this patch? I tried to apply it upon efa7df3e3b or
> > v6.10-rc2. both failed.
>
> Its base is mm-unstable. The head commit is 8e06d6b9274d ("mm: add
> swappiness=3D arg to memory.reclaim"). Sorry for the confusion, I should
> have mentioned this.

I just figured out a bug in the patch. Anyway, we are going to take a
different approach to fix the issue per the discussion. I already sent
the series to the mailing list. Please refer to
https://lore.kernel.org/linux-mm/20240604234858.948986-1-yang@os.amperecomp=
uting.com/

>
> >
> > >
> > > Thanks,
> > > Yang
> > >
> > > >
> > > > >
> > > > >
> > > > > --
> > > > > Cheers,
> > > > >
> > > > > David / dhildenb
> > > > >
> >
> >
