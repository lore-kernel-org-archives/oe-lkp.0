Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D7E16B39A
	for <oe-lkp@lists.linux.dev>; Tue, 25 Jun 2024 20:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719347677; cv=none; b=ETr10J/PPqZCZjlhkGSVrmEbrdKWLNJtBVydwNgnnNbsTIce7Ic6+FpdqCztaupAlK8m/SEVOVVwG6Bc/dPmVFFzmzy/fsr5HVkR+oZ9M4smkp0sTwbtAq2Ug/LlxREnrSQ6VyOIWWxq8MqiAnIsxL51k7FYuAHZkcTSqCJB8Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719347677; c=relaxed/simple;
	bh=1pebubHUIglmk7Jz/Qgb63bUDccEw0yy7iXakdQ0YQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsGl5CLCCC6H+IcfAFu7PzefbGqyanXUjqaBZ1FfXEngx8haSeGlFZSMPCT8YfmYAMrLMX49GuoXq80OBj9KWEWd3S0paF7v3f506s/n14sskWCGcT7nx28XD1J0r2VddtvmYyId1/DaX6STYSYKWnpH9rl3q83gI/P9Wpk9l44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrM6Wwt5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrM6Wwt5"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57d106e69a2so951955a12.0
        for <oe-lkp@lists.linux.dev>; Tue, 25 Jun 2024 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719347674; x=1719952474; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dag1l+P4AHvt6y/RZEBB4jSeUQA1MVnCnAotCeIeMb8=;
        b=YrM6Wwt5SP4fbOd4HMfFyqzyd/jMFD8dKIuQISf2ZPyGo7d5DrKNr5TxwkbHr7CvuD
         fe08fKdZQPRlf0XAZ2I0Xsv99jtQgL9FqAFi0Vqc3nVNIBp77IYAaqCMPhE9d0jc7NUf
         H+06eSISR/KWp5KBdB7jeokuOECWhcLookS1PT7DF/nsT5kM6kE2zOvSzY9V0ZFkUejR
         wlhrAhFl1cGywWxFbJ6+Q2wQam3bEDTrmG6oJ252f/CdzQbbQVvqB4PDUoeubHg1OVkb
         VOnKKttxGSFHB3k2feL0w4jk0ezSueaLDnnyXQJotE5B+81y3UgdfqDXSNtCKKHHee64
         IkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719347674; x=1719952474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dag1l+P4AHvt6y/RZEBB4jSeUQA1MVnCnAotCeIeMb8=;
        b=dCl8YDzGQWOsXmClfX55uaMhR2gaKQ2nlskfGru4VTcVHrv+bX75mzfdphqaQGtOJf
         7lA2QJ5IBQ4YNUBCbedLA9eyXp4XJxSZmYJ9qsUlbNSymyMfDCf5XSWuu268HybH+q+X
         WnIIwRKvDqumueOlCnzswFBnKugmfWMgJhx7Z1vgj35QUZ0X4a+gh3FIn/3xEeCj/RfC
         53M6vSQjWbUHQztxgn6Hmk1D+lKSIgrKVmgSrC9r29TLjnQixTvI3mFE2F0Ool78CWBG
         pTGbkwgx5ARk7p9NB7k3P6+bF1eFluykmG2CNBtWABBNTlOU8uWzTDjdSWi5EEZGkoMe
         h+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVA4RzlGkc9Wnf2xdreUSZvLJ7hdLd7ZwFE/axSi8NdpjwWBSpf6FjDJHUMrDgXyF513JS0ShAfW7n1NWcwOkFoVLYq8HQx
X-Gm-Message-State: AOJu0YzI2glZHtysndo84n/iTEs5YfQ9NtBO9peYPewZu7L6ZmlSp8V8
	thR3phTkEA4yVeMV021HB0tKdOvkgAhhnRmxHEHHefbATv8mnV/Ek9q9cgqc8DuNmVJq0A1eQWq
	EbIDDJLKfTwzLPsl1tw4pz2Cj5GE=
X-Google-Smtp-Source: AGHT+IGcPrR5rGeQLFy5hNRr/wqPc5YBbMiYo/9jo770rvfisIWgNgnaL/gSQEyki7GvGD0CaYuBONU2K2j/ryIQ3Fo=
X-Received: by 2002:a05:6402:34c6:b0:57d:45af:112c with SMTP id
 4fb4d7f45d1cf-57d45af127amr8896394a12.4.1719347673982; Tue, 25 Jun 2024
 13:34:33 -0700 (PDT)
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
 <Zmk5xAF+vHYLwzoG@xsang-OptiPlex-9020>
In-Reply-To: <Zmk5xAF+vHYLwzoG@xsang-OptiPlex-9020>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 25 Jun 2024 13:34:20 -0700
Message-ID: <CAHbLzkp3bEE50n1DKfXUYHoGivOzdhwQsLF=s64QVJUEaWCG8Q@mail.gmail.com>
Subject: Re: [linus:master] [mm] efa7df3e3b: kernel_BUG_at_include/linux/page_ref.h
To: Oliver Sang <oliver.sang@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christopher Lameter <cl@linux.com>, 
	David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Matthew Wilcox <willy@infradead.org>, 
	Peter Xu <peterx@redhat.com>, Rik van Riel <riel@surriel.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lkp@intel.com, oe-lkp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 11:01=E2=80=AFPM Oliver Sang <oliver.sang@intel.com=
> wrote:
>
> hi, Yang Shi,
>
> On Wed, Jun 05, 2024 at 08:44:37PM -0700, Yang Shi wrote:
> > Oliver Sang <oliver.sang@intel.com>=E4=BA=8E2024=E5=B9=B46=E6=9C=885=E6=
=97=A5 =E5=91=A8=E4=B8=8919:16=E5=86=99=E9=81=93=EF=BC=9A
> >
> > > hi, Yang Shi,
> > >
> > > On Tue, Jun 04, 2024 at 04:53:56PM -0700, Yang Shi wrote:
> > > > On Mon, Jun 3, 2024 at 9:54=E2=80=AFAM Yang Shi <shy828301@gmail.co=
m> wrote:
> > > > >
> > > > > On Mon, Jun 3, 2024 at 7:02=E2=80=AFAM Oliver Sang <oliver.sang@i=
ntel.com>
> > > wrote:
> > > > > >
> > > > > > hi, Yang Shi,
> > > > > >
> > > > > > On Fri, May 31, 2024 at 01:57:06PM -0700, Yang Shi wrote:
> > > > > > > Hi Oliver,
> > > > > > >
> > > > > > > I just came up with a quick patch (just build test) per the
> > > discussion
> > > > > > > and attached, can you please to give it a try? Once it is
> > > verified, I
> > > > > > > will refine the patch and submit for review.
> > > > > >
> > > > > > what's the base of this patch? I tried to apply it upon efa7df3=
e3b or
> > > > > > v6.10-rc2. both failed.
> > > > >
> > > > > Its base is mm-unstable. The head commit is 8e06d6b9274d ("mm: ad=
d
> > > > > swappiness=3D arg to memory.reclaim"). Sorry for the confusion, I=
 should
> > > > > have mentioned this.
> > > >
> > > > I just figured out a bug in the patch. Anyway, we are going to take=
 a
> > > > different approach to fix the issue per the discussion. I already s=
ent
> > > > the series to the mailing list. Please refer to
> > > >
> > > https://lore.kernel.org/linux-mm/20240604234858.948986-1-yang@os.ampe=
recomputing.com/
> > >
> > > got it. seems you will submit v2? should we wait v2 to do the tests?
> >
> >
> > The real fix is patch #1, that doesn=E2=80=99t need v2. So you just nee=
d to test
> > that.
>
> we've finished tests and confirmed patch #1 fixed the issue.
> we also tested upon patch #2, still clean.

Thanks for testing. Sorry for the late reply, just came back from
vacation. It seems like Andrew didn't take the fix yet. I will resend
the patch with your tested-by tag. And I will drop the patch #2 since
it is just a clean up and I didn't receive any review comments. In
addition, the undergoing hugepd clean up may make this clean up
easier, so I will put the clean up on the back burner for now.

>
> our bot applied your patch upon 306dde9ce5c951 as below
>
> 5d45cc9b1beb57 mm: gup: do not call try_grab_folio() in slow path
> fd3fc964468925 mm: page_ref: remove folio_try_get_rcu()
> 306dde9ce5c951 foo
>
> on 306dde9ce5c951, we still observed the issue we reported. clean on both=
 patch
> #1 and #2
>
> 306dde9ce5c9516d fd3fc96446892528af48d6271a3 5d45cc9b1beb57386992c005669
> ---------------- --------------------------- ---------------------------
>        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
>            |             |             |             |             |
>          47:50         -94%            :50         -94%            :50   =
 dmesg.Kernel_panic-not_syncing:Fatal_exception
>          47:50         -94%            :50         -94%            :50   =
 dmesg.Oops:invalid_opcode:#[##]KASAN
>          47:50         -94%            :50         -94%            :50   =
 dmesg.RIP:try_get_folio
>          47:50         -94%            :50         -94%            :50   =
 dmesg.kernel_BUG_at_include/linux/page_ref.h
>
>
> >
> > For patch #2, I haven=E2=80=99t received any comment yet and I=E2=80=99=
m going to travel so
> > I=E2=80=99m not going to submit v2 soon .
> >
> > And I heard if hugepd is going to be gone soon, so I may wait for that =
then
> > rebase on top of it. Anyway it is just a clean up.
> >
> >
> >
> > >
> > > sorry that due to resource constraint, we cannot respond test request=
 very
> > > quickly now.
> > >
> > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Yang
> > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Cheers,
> > > > > > > > >
> > > > > > > > > David / dhildenb
> > > > > > > > >
> > > > > >
> > > > > >
> > > >
> > >
