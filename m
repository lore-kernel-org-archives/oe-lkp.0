Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C3017F4EA
	for <oe-lkp@lists.linux.dev>; Tue, 25 Jun 2024 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719348831; cv=none; b=IkIkSZcRo4/qPAssrPopON1vOAaFGp4+NFMOVwpbcqcO0xf1yElvMIUpvkwPXPUQEJY8R468cpHxEW8LL0SZh04mvXhzfNTkw5YecbLxvyqGA5oYc3VkrVA8OmjJrS0QTmcPHF1mgOSPvxXpDZDCKjSzpbR/Xte3wuLDp+zc8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719348831; c=relaxed/simple;
	bh=z4ZGx+eUj/88bsn4q/UdsOuUZ9dGZXmFOAmGCk7pgPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KS9vHJen89z/UMXkuhvkaWaNrMbm3qXV6/dvcIgVaCH2oYgo1EEwVKtBQxCIxu4YbBB5EXnccItykUZg1CHqYie2Uti5gbVj3vBivDBl2yG7EYivmsMCwtGjQ1o9RUzIRGo40Ez/0XZG7MGaIPtYiOo2YrZaec9wbT4XCOUh068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvy/vNNY; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvy/vNNY"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57d0eca877cso7249723a12.2
        for <oe-lkp@lists.linux.dev>; Tue, 25 Jun 2024 13:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719348828; x=1719953628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4ZGx+eUj/88bsn4q/UdsOuUZ9dGZXmFOAmGCk7pgPY=;
        b=lvy/vNNY3C7GLoWCZb8Ni+mfEqzSyLY4whhW/BN2BkMMMghuMcF3iKhBkU3DXCyR76
         MDcS9NFByTcoaYMoDrKwLmOHw5CAX89wjlCzSs5B0ahsRF7xFM9vCtfBhtI4O01m/bhp
         nPjQ0dEoiqp48TUCV5VQveXQTK1fdAwIoZkLCHJwJDmmDlby+rIlIPa23alSoBtxGKl0
         yxfiC+bbXZh84TMyomm5au9et24wwEbxNNM21r0K7pQbuAN9ZSoFnQjAFTyKPLg4+JHC
         dUYCYlyfkc8ofyoA1yuueVimGYPI7ifBZqCsU9II1QKmfihdyJqrDKNUVIHXjk4sA6GA
         jq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719348828; x=1719953628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4ZGx+eUj/88bsn4q/UdsOuUZ9dGZXmFOAmGCk7pgPY=;
        b=GZtmuFNanFWyQuRsolmVs0H3KITECCBWvdVcWQAJG1+3nFkV/qfkaRseT2h3pioEYT
         Kc/1HVPfp1sjSmq7IZN1buoVlAkI+0HNHFsIrHIXjKoWrQUoLp3a/KzGhwLgo3G3ZgP0
         jbA4FyL/cwzx15vXLWJ9DGTK2nZ0e5rw7T2GayHif9Imaf6IabkSdeQmNPk1ZyVrAIG5
         15GtaOXxMXDJFe3O0LqSTwQrmynIQgwVBU3mx3OSF2I0sgzKPDdAocMK2H/cOwpgtAQx
         WkgXseV2yTmFBciJO85s7fOcGQOBzzEGrbxdBJh3fIwHnKlJ5OUx26xxm74Kw/9HyFyX
         oRAw==
X-Forwarded-Encrypted: i=1; AJvYcCUku5xrpWxpiJRYMxR+LvKaNd7NuWoicoMkDKnc5g3ai5cXrpkFb0Y5X8HEGI+Ltv3fsf/GEwU835TT+IdUfPIlgNvM/3hY
X-Gm-Message-State: AOJu0YwfQ9UkuBcoj1MKSZDbzj0OOy07MApaU6BqTXK0v10Q9LyHguW4
	IrqVgQRt/i+UNSzaYfJuRhiuLchPib/byAJMEeh3uzLWFUZZTwYroUGIdmISMgJpZi2sZWnoy+C
	8gYWFK78CYOujnk77Tm8DNfzAQcA=
X-Google-Smtp-Source: AGHT+IH5PQs9YzD9mfM0POb5kScQniP/tipBmiBdJrOxOGBmxDIsHGit04FrMCXY53ICfWyLw0tLbXeTFUVpmqdI2fE=
X-Received: by 2002:a50:c056:0:b0:57c:5eed:4ebf with SMTP id
 4fb4d7f45d1cf-57d4bd79d81mr8081097a12.19.1719348827856; Tue, 25 Jun 2024
 13:53:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f4599bd2-72af-4e8d-a0fe-153b69816133@redhat.com>
 <CAHbLzkrOspjVuQw=BN2+RZmV_Ydpz_50yY7FEakJw8Zm14Y9-Q@mail.gmail.com>
 <a088b5cf-503e-4ed7-b427-f17a9ec5d1a8@redhat.com> <CAHbLzkpnDPYWq=HnaJcKhKnppdNikX4YG+1Ysu8Z+XJCoKK4SQ@mail.gmail.com>
 <CAHbLzkr5K=4Shiyb5KgPTQ20jE2Zo08wK=mT3Ez9ADEdJe0Z9A@mail.gmail.com>
 <Zl3M7iniPQaPFDrW@xsang-OptiPlex-9020> <CAHbLzkrOTAaYahG4JYMNrJDhQNZZxW9u+2n71J=v1XYJEVpUdw@mail.gmail.com>
 <CAHbLzkr16YZ80ES5U4BEWJ+ueL22nDJtgH=eOztdHfy080diPw@mail.gmail.com>
 <ZmEb2mdAbBQ/9PMP@xsang-OptiPlex-9020> <CAHbLzkqORuPjr3p7aZGPKSLfdptrg=z1624rcxjud_zs3+HnCA@mail.gmail.com>
 <Zmk5xAF+vHYLwzoG@xsang-OptiPlex-9020> <CAHbLzkp3bEE50n1DKfXUYHoGivOzdhwQsLF=s64QVJUEaWCG8Q@mail.gmail.com>
 <fc16f6d0-9605-43c6-8199-179029dac6d4@redhat.com>
In-Reply-To: <fc16f6d0-9605-43c6-8199-179029dac6d4@redhat.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 25 Jun 2024 13:53:35 -0700
Message-ID: <CAHbLzkqfwKg584RniHfxk_Pp+iVUvazQv082P0x=CVg+5inMRQ@mail.gmail.com>
Subject: Re: [linus:master] [mm] efa7df3e3b: kernel_BUG_at_include/linux/page_ref.h
To: David Hildenbrand <david@redhat.com>
Cc: Oliver Sang <oliver.sang@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Christopher Lameter <cl@linux.com>, Jason Gunthorpe <jgg@nvidia.com>, Matthew Wilcox <willy@infradead.org>, 
	Peter Xu <peterx@redhat.com>, Rik van Riel <riel@surriel.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lkp@intel.com, oe-lkp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 1:41=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 25.06.24 22:34, Yang Shi wrote:
> > On Tue, Jun 11, 2024 at 11:01=E2=80=AFPM Oliver Sang <oliver.sang@intel=
.com> wrote:
> >>
> >> hi, Yang Shi,
> >>
> >> On Wed, Jun 05, 2024 at 08:44:37PM -0700, Yang Shi wrote:
> >>> Oliver Sang <oliver.sang@intel.com>=E4=BA=8E2024=E5=B9=B46=E6=9C=885=
=E6=97=A5 =E5=91=A8=E4=B8=8919:16=E5=86=99=E9=81=93=EF=BC=9A
> >>>
> >>>> hi, Yang Shi,
> >>>>
> >>>> On Tue, Jun 04, 2024 at 04:53:56PM -0700, Yang Shi wrote:
> >>>>> On Mon, Jun 3, 2024 at 9:54=E2=80=AFAM Yang Shi <shy828301@gmail.co=
m> wrote:
> >>>>>>
> >>>>>> On Mon, Jun 3, 2024 at 7:02=E2=80=AFAM Oliver Sang <oliver.sang@in=
tel.com>
> >>>> wrote:
> >>>>>>>
> >>>>>>> hi, Yang Shi,
> >>>>>>>
> >>>>>>> On Fri, May 31, 2024 at 01:57:06PM -0700, Yang Shi wrote:
> >>>>>>>> Hi Oliver,
> >>>>>>>>
> >>>>>>>> I just came up with a quick patch (just build test) per the
> >>>> discussion
> >>>>>>>> and attached, can you please to give it a try? Once it is
> >>>> verified, I
> >>>>>>>> will refine the patch and submit for review.
> >>>>>>>
> >>>>>>> what's the base of this patch? I tried to apply it upon efa7df3e3=
b or
> >>>>>>> v6.10-rc2. both failed.
> >>>>>>
> >>>>>> Its base is mm-unstable. The head commit is 8e06d6b9274d ("mm: add
> >>>>>> swappiness=3D arg to memory.reclaim"). Sorry for the confusion, I =
should
> >>>>>> have mentioned this.
> >>>>>
> >>>>> I just figured out a bug in the patch. Anyway, we are going to take=
 a
> >>>>> different approach to fix the issue per the discussion. I already s=
ent
> >>>>> the series to the mailing list. Please refer to
> >>>>>
> >>>> https://lore.kernel.org/linux-mm/20240604234858.948986-1-yang@os.amp=
erecomputing.com/
> >>>>
> >>>> got it. seems you will submit v2? should we wait v2 to do the tests?
> >>>
> >>>
> >>> The real fix is patch #1, that doesn=E2=80=99t need v2. So you just n=
eed to test
> >>> that.
> >>
> >> we've finished tests and confirmed patch #1 fixed the issue.
> >> we also tested upon patch #2, still clean.
> >
> > Thanks for testing. Sorry for the late reply, just came back from
> > vacation. It seems like Andrew didn't take the fix yet. I will resend
> > the patch with your tested-by tag. And I will drop the patch #2 since
> > it is just a clean up and I didn't receive any review comments. In
> > addition, the undergoing hugepd clean up may make this clean up
> > easier, so I will put the clean up on the back burner for now.
>
> Sorry, was expecting a v2 of the second patch. But agreed that posting
> the second patch separately is reasonable -- possibly after the hugepd
> stuff is gone for good.

I can revisit the cleanup once the hugepd stuff is done.

>
> --
> Cheers,
>
> David / dhildenb
>
