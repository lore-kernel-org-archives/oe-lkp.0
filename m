Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F254021373
	for <oe-lkp@lists.linux.dev>; Fri, 17 May 2024 23:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715989151; cv=none; b=Xvqba8ZVrEyA3lnFrhmjjUcH4tA0cBmSOF+nVuflALN00JlRRaHFbhJ2hEgKdl+6qJMVBPcozjYtR1HbGUdTizeKeAAC/CYYa5pR/AVrQMhwIIzVQ7EVLRgL/WJnuh928qQOujQpH94CB39oxbGuikDmv8IUQUtA9gdGhK/+ZYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715989151; c=relaxed/simple;
	bh=mE6TQXEFNZLar0V7aKL6yYlC9JxfNVILfl6MpOsjSXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZO3M4Dy2e15EjK6+F1SiFC9a3xwwarHRw+QeJJhAna+Ujmu/UaPRQqhhlZNgxBjMBnZ1AoHGHZjpXoRQQoZcr2OTr4ERrk8zrCthrejjYuPZW2C5Tir9EmWpDh24Nbr0OPqB0dRB6iN8XTi+c5VsGWb60YJe112Db3Gj8ZH4C9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w4j7liiW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w4j7liiW"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a599c55055dso502269766b.0
        for <oe-lkp@lists.linux.dev>; Fri, 17 May 2024 16:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715989147; x=1716593947; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE6TQXEFNZLar0V7aKL6yYlC9JxfNVILfl6MpOsjSXg=;
        b=w4j7liiWCrIeFebl05+6c/zj3iqZMNVbuxyGDx0TJZqE0VUFDEbKttMaTU4QQg8YVO
         hBYbTDzkkdZ1eMRYAFWoJ5jt7IkIeqgENeggMv2eFmjJgJ/IV9GZC44hVrQWWIwVjOCH
         0LgR2YWb3XrnNXxHqQtxqN9BgIHMv5ja2JC2FT0DVBEAfYnS+iMMIdaG32wIXKslqQcH
         I0E/jw65fmLymxrMm+xDiRi29r9lmQiI5Gl2a6DHwMhCQTi8MhARZbMn1iRmsh0e+xvY
         JLpN9Uum0tUPk8FDQ0DJAMDgPwxEhD56t+e/9Bnr5mjSqV79OYZuP3Zfpiq4Dt++8mdT
         Slig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715989147; x=1716593947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE6TQXEFNZLar0V7aKL6yYlC9JxfNVILfl6MpOsjSXg=;
        b=mOIWn7V7cW7Eq8wHqDDcIKWSTvXlT8UMarzcDN8AGJNYPwIBA3Iy3BB02uVTs1eXHh
         CnWT1nHICR536HnolRxz+dagw7yIc2WpNCYSPP6rtYGSrSa9NkNM7lxFs+/HJ1B6q5DE
         MOk/ZkksDnn0PrNiUObJrjNExd0oG8x4S9qZer7hrf2wSiLMJ9Crdw2Wawkll22pvUXz
         0zBVf2lSxqEI8c6+MXlJrAKAEF+EF+X3viQWka1CrDvxnQuZkEE6YwQrvbzwaJCXELuf
         c2nX7QDG8wGLEgZGhOr3Pq5sBQxQYppc6qBvZ5zkwVIgeT8OG14LIL/40JDPtwYoho2z
         XXJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAWnXcGYcPfFBNmxv7A10vLI7WyE8U1wbw+l9Aml9LmkyPw45BDK2i2PUD09iGmYmRMQKu0SV1h6+AVX5YZNppbk7dDaOf
X-Gm-Message-State: AOJu0Yzno40IlFp0etbBP2Ib8RTHx4nHKuWufLUfBZZ5vEpLiBgSXo4w
	p9Xb8jxEqCxJlEkwZpfXB89JhRJ8Rxey2VgPzG2StiJAh80QSFD15qI5TNAOxOSubwaQHjidHQl
	DYT00hOzo9rLyis/zHgHQOePmMzeunxve/FxXbUNaXnMVdGoTXI9g
X-Google-Smtp-Source: AGHT+IEWStsd+KuxNepFd6UjRKG3y6uqHDKx4qToLv/yDVLnXEdxCtDa1KZ552hONjDNbgT/EWoqQw24FByBD1VHdPI=
X-Received: by 2002:a17:906:714a:b0:a5a:8ac4:3c4c with SMTP id
 a640c23a62f3a-a5a8ac43e15mr774938666b.68.1715989147046; Fri, 17 May 2024
 16:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405171353.b56b845-oliver.sang@intel.com>
In-Reply-To: <202405171353.b56b845-oliver.sang@intel.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Fri, 17 May 2024 16:38:28 -0700
Message-ID: <CAJD7tkbsvRpYTkrjZ8k2ArQSaU+YkF=6rqtVHdjd1ovErvUE6w@mail.gmail.com>
Subject: Re: [linux-next:master] [memcg] 70a64b7919: will-it-scale.per_process_ops
 -11.9% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"T.J. Mercier" <tjmercier@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 10:56=E2=80=AFPM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -11.9% regression of will-it-scale.per_proces=
s_ops on:
>
>
> commit: 70a64b7919cbd6c12306051ff2825839a9d65605 ("memcg: dynamically all=
ocate lruvec_stats")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

I think we may want to go back to the approach of reordering the
indices to separate memcg and non-memcg stats. If we really want to
conserve the order in which the stats are exported to userspace, we
can use a translation table on the read path instead of the update
path.
