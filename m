Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FA22D05D
	for <oe-lkp@lists.linux.dev>; Fri, 26 Sep 2025 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758900643; cv=none; b=P7ouE9gQiEsk7ZNTZAsUqN4/d9f301DitBFLmDlxM/gjNCmG4wvujnzScn8Rbgh/0tk7pEhQ+3j+E0dYb2XAu/d/4wRQv6OMuwhy5MPyXTCvcffWyWD9bQUnOUjERn2tW1WOmn1YLeM1LJywlcFsd3xsqM4quh6BDM56cDmlQaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758900643; c=relaxed/simple;
	bh=AS45b9EbyToJk2Diz4z80PWCjaqcT0Ws7VVscCNXRkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zg2K4p7rWQ/chuX3iVOpkfUbk+9+6C7TZAS7yarmgCKMQNZKMWegc0p9g0HwOlsrULv4oTFIINPkBoFfA5shGCxDRLcehIAiHwTbrPFu0AbnqiZTyJe8xFmyhV6IQytLB2MDTl6ZYrQaxdES9ayR/gX5z++BFG0NOxYmcyJ6UOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDoYQ1Bt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDoYQ1Bt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso14560005e9.2
        for <oe-lkp@lists.linux.dev>; Fri, 26 Sep 2025 08:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758900640; x=1759505440; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hw0PkEDAgZJmZX4JQxCB6B2llrhkqMZatxLmc7xYfO8=;
        b=gDoYQ1BttXtP+9CYrmnxCIhWsiEGK0q0OW8XAwCX5T0YwU9ztRD41ooWVkVLTDxlVX
         /8a5nCB0THrcKwE1+MVvbBYwjNqkXp3K51/BPxA8W2voafSgHTj5QkZvkpeL8nEXNbgI
         SkuPSf4cI8pK0Q9BPMfW9Kg0vZzzfMc2cXApJZaokN+pDo0S2Wy/CglHPbBw1EQzvuMs
         nAJZZkBOGQFtKS+Dw9jru0pu74UmKfz1HyzffjECFt20t7hnOivqdR7Fjuk56rYioQzc
         CHyrJYcKJfOC/A3kTM8PHGcyYYDIlVj9SsHZ0tL5aFFnC10c9C5BdTAiSs9cOB60+3T7
         CDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758900640; x=1759505440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hw0PkEDAgZJmZX4JQxCB6B2llrhkqMZatxLmc7xYfO8=;
        b=X7k2n6kZehbxzYSMVqj9olVDhFlwg42nuBtaFsqpQVLeAS/arDtGTJOqJ+R/fF0n7W
         rQfhrdW6ybNQGZR4igoZgB+VUQXI9w5LPsbeVHMHaWDAQRlCALpdvOgOnxsxjIzzBcih
         50sEImVlh992XMEgUyoQiNBdJW9ZRubrnGbZhB/I2ivxnl7QS2ahFFUBFIGMlitqRHpa
         xQLho4aeF4u4yyQqoSN6vqaArGo/STmZRQsieeUPyn3YEs/6jSEfFi+i6ue+BulfWsrN
         QdHYgt590brbbFkTTGC7PwbXJrrlN6DBP4l4P/R2yGn/2TqWBFCrmwHahdU0Qwzplq1y
         dlrg==
X-Forwarded-Encrypted: i=1; AJvYcCX02M+bFJiPW9CP0NgdTJCPuMSdFQ7j3aq1cFAjt/KAWkiMBcN01euVobBwCljdlkZ5JDb1SCk=@lists.linux.dev
X-Gm-Message-State: AOJu0YznYplz2ie1dfVk4Q88Ld+8C0LHJ6k9ldq/+P0okG+YDlkbYIGa
	lOk/GeMlNiev5eekp3tz5PnGQbt49pL8ZNxPeUFyD0bqa5dhp5O9y4eQoBATU/gXjTCJztALndg
	q2DtZW61jVuuA/9OxH2zWQaNhLBpOQ74=
X-Gm-Gg: ASbGncuL0hsIIRDcoRH0QOmRcuxW1mbS1I5VGXtwuG8gW6YGim0sF0guofv+8Ov2n5A
	G1kK3Nb0czmfwdhmrzVPJcm0wLguToFSiEM+On7wc8IRzavr3GnVt5QCVeR2vMJtzzJF8h1COlf
	6df/LmCawC3awFKBda6tnZT/HDP6aT++w3BgMeadt4s6eezBKBcQKOYVZXfamve4BAVrIBOxfWl
	I0F14wVf6fhNl1dudvO
X-Google-Smtp-Source: AGHT+IHPcobe0pabmtv3LTAUxvYUa9I/tUExRRvv4KQMIFR1FB2bTWAabu9dOrWdANVnlud2d72ux6aywV+LbMiMy+I=
X-Received: by 2002:a05:600c:1553:b0:46e:39e4:1721 with SMTP id
 5b1f17b1804b1-46e39e41ae1mr38372785e9.12.1758900639846; Fri, 26 Sep 2025
 08:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509171214.912d5ac-lkp@intel.com> <b7d4cf85-5c81-41e0-9b22-baa9a7e5a0c4@suse.cz>
 <ead41e07-c476-4769-aeb6-5a9950737b98@suse.cz> <CAADnVQJYn9=GBZifobKzME-bJgrvbn=OtQJLbU+9xoyO69L8OA@mail.gmail.com>
 <ce3be467-4ff3-4165-a024-d6a3ed33ad0e@suse.cz> <CAJuCfpGLhJtO02V-Y+qmvzOqO2tH5+u7EzrCOA1K-57vPXhb+g@mail.gmail.com>
 <CAADnVQLPq=puz04wNCnUeSUeF2s1SwTUoQvzMWsHCVhjFcyBeg@mail.gmail.com>
 <CAJuCfpGA_YKuzHu0TM718LFHr92PyyKdD27yJVbtvfF=ZzNOfQ@mail.gmail.com>
 <CAADnVQKt5YVKiVHmoB7fZsuMuD=1+bMYvCNcO0+P3+5rq9JXVw@mail.gmail.com> <7a3406c6-93da-42ee-a215-96ac0213fd4a@suse.cz>
In-Reply-To: <7a3406c6-93da-42ee-a215-96ac0213fd4a@suse.cz>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 26 Sep 2025 16:30:28 +0100
X-Gm-Features: AS18NWDPulJjeGNZJBavOvdAFs79dpLiwntGES88AId5C9cShcZs5_ox3eb1K2Y
Message-ID: <CAADnVQKrLbOxav0+H5LsESa_d_c8yBGfPdRDJzkz6yjeQf9WdA@mail.gmail.com>
Subject: Re: [linux-next:master] [slab] db93cdd664: BUG:kernel_NULL_pointer_dereference,address
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Suren Baghdasaryan <surenb@google.com>, kernel test robot <oliver.sang@intel.com>, 
	Alexei Starovoitov <ast@kernel.org>, Harry Yoo <harry.yoo@oracle.com>, oe-lkp@lists.linux.dev, 
	kbuild test robot <lkp@intel.com>, kasan-dev <kasan-dev@googlegroups.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 1:25=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 9/19/25 20:31, Alexei Starovoitov wrote:
> > On Fri, Sep 19, 2025 at 8:01=E2=80=AFAM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> >>
> >> >
> >> > I would not. I think adding 'boot or not' logic to these two
> >> > will muddy the waters and will make the whole slab/page_alloc/memcg
> >> > logic and dependencies between them much harder to follow.
> >> > I'd either add a comment to alloc_slab_obj_exts() explaining
> >> > what may happen or add 'boot or not' check only there.
> >> > imo this is a niche, rare and special.
> >>
> >> Ok, comment it is then.
> >> Will you be sending a new version or Vlastimil will be including that
> >> in his fixup?
> >
> > Whichever way. I can, but so far Vlastimil phrasing of comments
> > were much better than mine :) So I think he can fold what he prefers.
>
> I'm adding this. Hopefully we'll be able to make sheaves the only percpu
> caching layer in SLUB in the (near) future, and then requirement for
> cmpxchg16b for allocations will be gone.
>
> diff --git a/mm/slub.c b/mm/slub.c
> index 9f1054f0b9ca..f9f7f3942074 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2089,6 +2089,13 @@ int alloc_slab_obj_exts(struct slab *slab, struct =
kmem_cache *s,
>         gfp &=3D ~OBJCGS_CLEAR_MASK;
>         /* Prevent recursive extension vector allocation */
>         gfp |=3D __GFP_NO_OBJ_EXT;
> +
> +       /*
> +        * Note that allow_spin may be false during early boot and its
> +        * restricted GFP_BOOT_MASK. Due to kmalloc_nolock() only support=
ing
> +        * architectures with cmpxchg16b, early obj_exts will be missing =
for
> +        * very early allocations on those.
> +        */

lgtm. Maybe add a sentence about future sheaves plan, so it's clear
that there is a path forward and above won't stay forever.
