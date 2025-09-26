Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD20919FA93
	for <oe-lkp@lists.linux.dev>; Fri, 26 Sep 2025 15:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758901134; cv=none; b=KNTlxGVdydnjnK4dWDli+KTAs9LfBdxxaRDl7AZVnk2EId18HGe/5P873ScEMkWVosBMQDMMEFvCXYIWiX35jejBteBZ2XJfA3y8NWLzPq6U7qSyhJTQlOAuwwQc9Gp5TW8p5wwYwZEqisQRcQZk4dxjRvsotcCB+m8/ZVLHS6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758901134; c=relaxed/simple;
	bh=BTM94BFpp9aT5IBTYgdibKSNLxc/Kf3Lda1oqYpQooU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oytSSY438xhA+umjafkrWbGOFS8kFcvSULtyz/xnojPPnv2JNhaVxlYx9oWdY2wx+OMQZx+FsOFYNKT0WywuiZ5bIuim6Zku2LilQoCWQs643/DLkCCiTh1bOPD4D1vsR5dzOiLJScT/5Rg4hFwCL7sLvGyhEKnigZUdg83GGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p24U1iaw; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p24U1iaw"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4de60f19a57so255051cf.0
        for <oe-lkp@lists.linux.dev>; Fri, 26 Sep 2025 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758901132; x=1759505932; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXzocX6ZDXcHxojnIagSNZA3qKAOhB8e13p864rbCw0=;
        b=p24U1iaw5x6wQ3pbo+yCblB1o51Nxfjnuc08MGgsMwRa3925rv/TXyy1I+0q8F8KHm
         Oa9Y1bKX0b3qdYUUucJyc+2DZOXJmFyeTGMxY/XSn8WCNormUHjhSwpL9zNc9YBA7Idq
         iIFhwfJsA9ChHxsOb4wmv9BBMuakpmK8LU/3j8GL+5tVsI97oKzEL4OC3JoCupvGJCnJ
         HBvekZZqcEuPhPnz4+UwjCHdm2+EkoE5wdXUO0kdFn5kOV8YlA9/VDO4CSTHGiQqwqe1
         5YdcD/CktH5gUkKXS3I4jBZitPome72n390fUTbjOpGoAQ61qDDf34oIQ0WH8N0eEdER
         db4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758901132; x=1759505932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXzocX6ZDXcHxojnIagSNZA3qKAOhB8e13p864rbCw0=;
        b=hp/rNSccZpI7fh6jznLMkbf6jkMA2z000tgTedyIgQjIT/Y2clEIxMPVxTwyRAuO7d
         D8xx0WDlxl6KE+/G573oVdCn8tA7NBhx5B5M/rs+ezsMveW4tz5sK6+i0fcWx0deva82
         gzDV+lXm0Z58JF+KAcbgugIPnXVy5c6TMPcB27Dxul9cLgG9KN9kyxejDrUiklEFuCnD
         9PEd7UwBMAKYBWm0eBOQlmlBVvUuRwTKwjc5l0oybV/5UaNfZj5e8hhm86WuIfL8UYp9
         UbfjYwCQCMDMymX1Q0Ry4WQXwRfg9d7vQnfzExzEUXoHLHm7i6AL705Rppv167gYgRoy
         87UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvvzfCpbGp/EHNWsMI26nOD++qL6EJyJftNlVtFCWZvgW69rf0HCGici3czDXUjAi/E3PZpZ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHJ8/vYP1mFzRl8qJXGxzcj/+HV59Av42i94YkSXBwzxDpI5ts
	kNQWZRqncD0no6E6xgfjBcvGOdmG4IZT9f5+FCnNH15kRz1tqnNWax7FxvD7k2nOt0yyuQrO4O+
	8d7vQcx5QapekQtUx77wbRqTm1JbS/Ck8pedq1erk
X-Gm-Gg: ASbGnct9EMykPlrEQ1LvTiRrsyuBRQfz34fr5k3r2IoS/HP7HTA13gi12fxmsgqRpUf
	UfqvQPSQDDQyTpsaugN7Gk5VHqhE1MPJ/d67T5voh2aK3Y1SO9B1aXqCEGGPcBWqiVttC/JHJK9
	jWzhKSk4AuouUBisrWKkEYjkq3dpOhrCMIWwUnYuk+wR0KLIvzobXdY6AvkEwsFVGR2v0JSBYmI
	Va+uw00zokE
X-Google-Smtp-Source: AGHT+IGUxL+Ts8nZMxqg7rMa5w9X1kAO9wkdvMmX92FoJO/bv4bqeUj1oEI2kGl0p735VGIj1Vtf4Ntxfyo6WGTFanA=
X-Received: by 2002:a05:622a:14c:b0:4b7:9b06:ca9f with SMTP id
 d75a77b69052e-4dd1675a20amr6251731cf.2.1758901130945; Fri, 26 Sep 2025
 08:38:50 -0700 (PDT)
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
 <CAADnVQKt5YVKiVHmoB7fZsuMuD=1+bMYvCNcO0+P3+5rq9JXVw@mail.gmail.com>
 <7a3406c6-93da-42ee-a215-96ac0213fd4a@suse.cz> <CAADnVQKrLbOxav0+H5LsESa_d_c8yBGfPdRDJzkz6yjeQf9WdA@mail.gmail.com>
In-Reply-To: <CAADnVQKrLbOxav0+H5LsESa_d_c8yBGfPdRDJzkz6yjeQf9WdA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 26 Sep 2025 08:38:39 -0700
X-Gm-Features: AS18NWDgSteTnQAeHe58pnPN5CXO_C6LUnKFpTmB_8Hvkh2DQsaUFE0c0GhVrg0
Message-ID: <CAJuCfpG7Gf3_P6gKrUa+3iNZgq7SNd7nZa7Uq1P+v3FVHnL4QA@mail.gmail.com>
Subject: Re: [linux-next:master] [slab] db93cdd664: BUG:kernel_NULL_pointer_dereference,address
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, kernel test robot <oliver.sang@intel.com>, 
	Alexei Starovoitov <ast@kernel.org>, Harry Yoo <harry.yoo@oracle.com>, oe-lkp@lists.linux.dev, 
	kbuild test robot <lkp@intel.com>, kasan-dev <kasan-dev@googlegroups.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 8:30=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, Sep 26, 2025 at 1:25=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> =
wrote:
> >
> > On 9/19/25 20:31, Alexei Starovoitov wrote:
> > > On Fri, Sep 19, 2025 at 8:01=E2=80=AFAM Suren Baghdasaryan <surenb@go=
ogle.com> wrote:
> > >>
> > >> >
> > >> > I would not. I think adding 'boot or not' logic to these two
> > >> > will muddy the waters and will make the whole slab/page_alloc/memc=
g
> > >> > logic and dependencies between them much harder to follow.
> > >> > I'd either add a comment to alloc_slab_obj_exts() explaining
> > >> > what may happen or add 'boot or not' check only there.
> > >> > imo this is a niche, rare and special.
> > >>
> > >> Ok, comment it is then.
> > >> Will you be sending a new version or Vlastimil will be including tha=
t
> > >> in his fixup?
> > >
> > > Whichever way. I can, but so far Vlastimil phrasing of comments
> > > were much better than mine :) So I think he can fold what he prefers.
> >
> > I'm adding this. Hopefully we'll be able to make sheaves the only percp=
u
> > caching layer in SLUB in the (near) future, and then requirement for
> > cmpxchg16b for allocations will be gone.
> >
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 9f1054f0b9ca..f9f7f3942074 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -2089,6 +2089,13 @@ int alloc_slab_obj_exts(struct slab *slab, struc=
t kmem_cache *s,
> >         gfp &=3D ~OBJCGS_CLEAR_MASK;
> >         /* Prevent recursive extension vector allocation */
> >         gfp |=3D __GFP_NO_OBJ_EXT;
> > +
> > +       /*
> > +        * Note that allow_spin may be false during early boot and its
> > +        * restricted GFP_BOOT_MASK. Due to kmalloc_nolock() only suppo=
rting
> > +        * architectures with cmpxchg16b, early obj_exts will be missin=
g for
> > +        * very early allocations on those.
> > +        */
>
> lgtm. Maybe add a sentence about future sheaves plan, so it's clear
> that there is a path forward and above won't stay forever.

LGTM as well. Thanks!
