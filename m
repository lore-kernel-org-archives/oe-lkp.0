Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B5A43687
	for <oe-lkp@lists.linux.dev>; Mon,  3 Jun 2024 20:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717447509; cv=none; b=ARFnP0H3CMGz0imwc6Vhv+DIO1Zjhn/1gPZFXs/VREawYUwWvJezK1/KRAzN8+nwrFmYTYW3OKd8pvNmNiq2CwbZayCZSEpsLPHtY/wnOfV0WPRn6VmLHXkzpN2VdDENEtgtIcI4IAPZ92k3dc7jQTNymDnG0tOlBMzH5IfZcSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717447509; c=relaxed/simple;
	bh=3sSx9b72GX9Z9Zq7SzPuUBlglrzSZmvN8MizfHiuyb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oyiu5VQg33oG2o76+m+XZp62JIQo+EmAzyDVUOvGn1awYankYpFTR6EOwBecA+BCt7paUMbrrYi9FsQ4EqxvNS1V7X72ilojw13uttTDOaqRtxNAP2eINHmk1lJl95agwOcEzCAxPSD0TYSeNVujESFwhjyQ1B3G0KNHPxxsKNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYU2YvpJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYU2YvpJ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a690c8e64bdso84182666b.3
        for <oe-lkp@lists.linux.dev>; Mon, 03 Jun 2024 13:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717447506; x=1718052306; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPraTLrUkjRW4/mcsUdWV0uoJeXl7pZ41wf9X3pKnpI=;
        b=hYU2YvpJz2VPrVvQ6LTbEKLNRorvs7LCiFeL04X25qn4gIYECIXGSio4iTfOk9EmuE
         Cgp27VbdX74JS+hY1/UOhvLbFsaDzkm4TI/n7hdks+CTGGXWjcVYsde5gkR9l9+Mk0gN
         tPa5abIXev69VNQu8neh7vfEOJwlX66wczN/IdLsfMNSoeLCGsEh5IdJ8oTGI63LlS0t
         SsK+7NR5HP4kcLSx09LpzGpyYWQKSOpXzbUbmse/0DabtdYBx/zI6fK9vlPMKO5DR+vi
         Ifhjx404/C+ObYdfSuGZUFfmMpIiKLnIHzn7Rdhjt8myIhjtkpNmedfpj+vTrSoQwk+D
         /VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717447506; x=1718052306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPraTLrUkjRW4/mcsUdWV0uoJeXl7pZ41wf9X3pKnpI=;
        b=V2+NtwdjGhOeaCXbAmQGnQqytxlTJfgD3gXYK/Rg2jRAIdmcSJZylgDMW0rqR0b4sy
         hGoRllHMUT5ySIJ3/e34TQb0ZcZgHnUck5UUUx56cc9M3NnDUKua5jjTpqUCGyk5D0/o
         E0k1O8Pb2lOiZAW0Cq+BvHcz7P9UBy0qN6ijy6w6aplmCozpVPzvmm/MrUDq7r0JXKB7
         fPwMSSWAZXYVmKHVVd9wrrK6Cn8JfGYMQIEY+gfQ/NONrMumVt0mb5A46tEKWD4eVVGG
         aOqszjiFrghH1rpPMBhucOoiQMF/SWeJbZ1rw4Su1XKdbbZZUt+5E7sIGKdE0d7Qbw71
         KzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNbocO/vk+ZRoFS+uP58pTFsnImKtBjOjluLK3ANiTYBaF9SBs9spkI2AW2DMVmKrYi+QXl9nzJ17cSI7/6nAlTK7J4rz4
X-Gm-Message-State: AOJu0Yxzeq3l0z0JbwO0Go1/si8oTsjIUeEQpAucypYlqsr7Ig14Bg+g
	N8GNFTBT5tDjdzoHXkrgaf2Rjdqnp44hrYi27d6TaBZ5a7beRSE0iXMQIfFlk6gTA0D4CvktNOS
	2H+Pui8U6ZhXDyyLmpRPdMdP20dk=
X-Google-Smtp-Source: AGHT+IGvv7NpXz0ajPxlgCEgCnse+tn3+KdGCBZ8bhyYUAHK1uGzTPmCHgdTdsdljjKDspcMOYareCoO0h5j0wMylmE=
X-Received: by 2002:a50:9509:0:b0:578:69cb:1efc with SMTP id
 4fb4d7f45d1cf-57a363479b7mr8687306a12.9.1717447505447; Mon, 03 Jun 2024
 13:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405311534.86cd4043-lkp@intel.com> <CAHbLzkpMhEuGkQDGWrK1LhvZ-ZxTJkV1xjmn-nRGZMH4U+F5ZA@mail.gmail.com>
 <890e5a79-8574-4a24-90ab-b9888968d5e5@redhat.com> <ZlpcRnuZUEYJJ0JA@x1n>
 <CAHbLzkrRw-xf819gYJwRQ=-u971LQYnB2FNJMkN=s6u-pJ4Z8g@mail.gmail.com>
 <CAHbLzkoB+oFTxtVYpeXQvko2q9HUVzUYrr83S6M6PUmXDQpkag@mail.gmail.com>
 <0edfcfed-e8c4-4c46-bbce-528c07084792@redhat.com> <Zl3cakfiRsPQDb8q@x1n>
 <8da12503-839d-459f-a2fa-4abd6d21935d@redhat.com> <Zl4m-sAhZknHOHdb@x1n> <9d9a5730-161b-4a9d-a696-1cf6d0c5123c@redhat.com>
In-Reply-To: <9d9a5730-161b-4a9d-a696-1cf6d0c5123c@redhat.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 3 Jun 2024 13:44:53 -0700
Message-ID: <CAHbLzkq=SAkA1qRoF6f6HYJ80jxSrnJ=H=c=2voV4TLA=F=10Q@mail.gmail.com>
Subject: Re: [linus:master] [mm] efa7df3e3b: kernel_BUG_at_include/linux/page_ref.h
To: David Hildenbrand <david@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, kernel test robot <oliver.sang@intel.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Christopher Lameter <cl@linux.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 1:38=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
>
> >> try_get_folio() is all about grabbing a folio that might get freed
> >> concurrently. That's why it calls folio_ref_try_add_rcu() and does
> >> complicated stuff.
> >
> > IMHO we can define it.. e.g. try_get_page() wasn't defined as so.
> >
> > If we want to be crystal clear on that and if we think that's what we w=
ant,
> > again I would suggest we rename it differently from try_get_page() to a=
void
> > future misuses, then add documents. We may want to also even assert the
>
> Yes, absolutely.
>
> > rcu/irq implications in try_get_folio() at entrance, then that'll be
> > detected even without TINY_RCU config.
> >
> >>
> >> On !CONFIG_TINY_RCU, it performs a folio_ref_add_unless(). That's
> >> essentially a atomic_add_unless(), which in the worst case ends up bei=
ng a
> >> cmpxchg loop.
> >>
> >>
> >> Stating that we should be using try_get_folio() in paths where we are =
sure
> >> the folio refcount is not 0 is the same as using folio_try_get() where
> >> folio_get() would be sufficient.
> >>
> >> The VM_BUG_ON in folio_ref_try_add_rcu() really tells us here that we =
are
> >> using a function in the wrong context, although in our case, it is saf=
e to
> >> use (there is now BUG). Which is true, because we know we have a folio
> >> reference and can simply use a simple folio_ref_add().
> >>
> >> Again, just like we have folio_get() and folio_try_get(), we should
> >> distinguish in GUP whether we are adding more reference to a folio (an=
d
> >> effectively do what folio_get() would), or whether we are actually gra=
bbing
> >> a folio that could be freed concurrently (what folio_try_get() would d=
o).
> >
> > Yes we can.  Again, IMHO it's a matter of whether it will worth it.
> >
> > Note that even with SMP and even if we keep this code, the
> > atomic_add_unless only affects gup slow on THP only, and even with that
> > overhead it is much faster than before when that path was introduced.. =
and
> > per my previous experience we don't care too much there, really.
> >
> > So it's literally only three paths that are relevant here on the "unles=
s"
> > overhead:
> >
> >    - gup slow on THP (I just added it; used to be even slower..)
> >
> >    - vivik's new path
> >
> >    - hugepd (which may be gone for good in a few months..)
> >
> > IMHO none of them has perf concerns.  The real perf concern paths is
> > gup-fast when pgtable entry existed, but that must use atomic_add_unles=
s()
> > anyway.  Even gup-slow !thp case won't regress as that uses try_get_pag=
e().
>
> My point is primarily that we should be clear that the one thing is
> GUP-fast, and the other is for GUP-slow.
>
> Sooner or later we'll see more code that uses try_grab_page() to be
> converted to folios, and people might naturally use try_grab_folio(),
> just like we did with Vivik's code.
>
> And I don't think we'll want to make GUP-slow in general using
> try_grab_folio() in the future.
>
> So ...
>
> >
> > So again, IMHO the easist way to fix this WARN is we drop the TINY_RCU =
bit,
> > if nobody worries on UP perf.
> >
> > I don't have a strong opinion, if any of us really worry about above th=
ree
> > use cases on "unless" overhead, and think it worthwhile to add the code=
 to
> > support it, I won't object. But to me it's adding pain with no real ben=
efit
> > we could ever measure, and adding complexity to backport too since we'l=
l
> > need a fix for as old as 6.6.
>
> ... for the sake of fixing this WARN, I don't primarily care. Adjusting
> the TINY_RCU feels wrong because I suspect somebody had good reasons to
> do it like that, and it actually reported something valuable (using the
> wrong function for the job).

I think this is the major concern about what fix we should do. If that
tiny rcu optimization still makes sense and is useful, we'd better
keep it. But I can't tell. Leaving it as is may be safer.

>
> In any case, if we take the easy route to fix the WARN, I'll come back
> and clean the functions here up properly.
>
> --
> Cheers,
>
> David / dhildenb
>
