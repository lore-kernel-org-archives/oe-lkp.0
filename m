Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E0D2FDC53
	for <oe-lkp@lists.linux.dev>; Thu, 18 Jun 2026 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781801535; cv=pass; b=ZI3j/n8m0Y7QLiNqFwNGNt85W25aumQcvjHehe4x4Qf8IXNCI9SzLpfj6Jq8XUuwdiQzcVtsJl3otSc7bp3ATPPAC9pt2lnOefgXxGqRu4OeHBY1MZcX39/ByLBqAALzyhWr5kSdIXf/gvILr09zvhqfbc2Ar+V+n/td+pQQ1Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781801535; c=relaxed/simple;
	bh=hMi7aZTxm3jxivWjZ700YzVjKsVqCe2blnMBeZ/az7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJEQzt6yAbvade6J/KMxa+IxT9qufqi5qSrly+fMZV2t6IF9Glq3q0oPR8glaq0F0HBQrnPJZo4LLUh2qFnLE37k6gTYOKzOYXzssnZOXih04rVjl19stEQL7vWtd7KZXRzcNtcdx7hUdQK5Pio9rV287JKb643DN68GsENK9u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=er3J1u4e; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="er3J1u4e"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51765331535so3591cf.1
        for <oe-lkp@lists.linux.dev>; Thu, 18 Jun 2026 09:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781801533; cv=none;
        d=google.com; s=arc-20260327;
        b=OM7qp4nCquXMWQJGfZyuS7F71yVG3qsHroLgibjJO2eUYf17b33al0zomzB0KqegJd
         vm7w/f2hy8jsgemiZlVHrh0cyUlapXu/pefGCenxaFGy8Q4c4f+TQEArl7fd0ygryzXT
         s6RTR/VEvpmbt6Xw0aNG7Et3RTK6BA0PzKN4UkD27JI5+cO1+gaYCRvcUn35Tg8GdqZ+
         WqaD/CnWJSkNo8w71MZlO0Judx1XiCYA6mHklV8ZwXE27lKnV54u94SCsAnrIq4MfQUU
         iLcePcyhPo3a6o8FTHblK3sfefNhCPocqnJ77t2ptyfdi3rzrJltLcIztDWp24B3Kj9y
         4MLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hMi7aZTxm3jxivWjZ700YzVjKsVqCe2blnMBeZ/az7U=;
        fh=8Ir0Z16vFpvFUoQpwWF02WukHQYulgvcMR4pOYTd1AQ=;
        b=T5kkFHMho3qY5JzrfZK7HZz1fYvoXtOXxY+EHmfX4Itv6oLjrP8WCqbgwYnLjznY/K
         vdyALjrrksX8Pp+ZVLzw8to4/PQvQ2VSW2FkyWeOPZj7EGF5cl3z3TPmyW8dfPmQziLe
         6FL5X6AQNwLjQxK0wW3PfymodO9hJQlkyT7VigMJUTmvVq8HDXRGXGLEi08hECLsN7mf
         Td16O0j9ha64AEwZsvqNQUy+1uV4VxDmuolPv581EUVjLC1TM+BWtdkNiyTsze13dLiH
         MqjkQpK1pR5y/icxAMF1tdiKd7Z1Y+BPSE9qRVP8n7JY/K0CnDCtPE2/o4VUXWOdeSRi
         W48Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781801533; x=1782406333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMi7aZTxm3jxivWjZ700YzVjKsVqCe2blnMBeZ/az7U=;
        b=er3J1u4ecCgcpGtwa1Em1/yw321nVVkMOr0vQMx4KYvsreiAu2tbKi76aH0IjITGKC
         ItXKV7UY72jENH8WyDc31QSmGNDIhHIckgEj6b2dKcfEfPPeWKBXGS7t9+fyLcmNgAGS
         Sevtw5CBr23pTIxRjLn4pc0youUZu26CEzxlMzMSnhE+UAqu/P33ZiAPJqv7O1oBPA7b
         i8irOeXbbDndKCcbEJZsTRqlVpscOxecZ+vy8UEnDnj0nuD9MleqRe2D7+EeFBKZx9JJ
         QUcBKDWxje9N/HiXHMy1seLk47HMLiLO5RsGXYBahcJMJuBO3fnp22LCz9NXyj2tfpph
         wvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781801533; x=1782406333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMi7aZTxm3jxivWjZ700YzVjKsVqCe2blnMBeZ/az7U=;
        b=ZRnJnhVExg4wMZNCgLtoQa4T7KptRDAuH5TsGo0UAda7hgPtFWAlpwNI19Y9xEKyb0
         Y/kKikHaZdfPGUiMnG4B9hbxzKT/V8k4UATHAzl0po50cVgjksEc47DizKYA0a1VdjSe
         8Ht+AtsPB6YjQka0jN5goQ/mysXpHUElBjjjkf68n+cHkP2qfaLvZ9tbZxHszokThGUS
         TOVGSBgQdLen6X3GTbbDilEusm6WcKEJAtFtzPEPahxbJSpJc9N16suaWiUx7/zheHDN
         LJ1I1wH6HSiG4fUgGsNGZiwtC54drb4dqt9unIEYG74QiipAceMXkGVPPLQUObZyREzi
         ABiA==
X-Forwarded-Encrypted: i=1; AFNElJ9InY0wVWRDABIgrFQpPZ5XFkI1iD4FKxuVz64V/2GKiRYO/0h5H/fey3qEBgACg8n1k+n/9q8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRKiQ2pUcfsU3niFZ7q+SEWiTlacb8crec5muEtN6NBgoeIoTw
	+LvGA+aRYgsTvykd6ldHX0/gXLM2SYQEZAmEC42POk/+KtRZLXxRb61kXaXnobfdiIYz8i7CK9E
	dal2u9vcPaxroGQFtdkQo11E3nEGuyj2eD6ry6a6v
X-Gm-Gg: AfdE7cl00JnbOYmOc6TvHkg4GEEzIJLT8wbSlxGhE7epcPW7Zvfyse7OHSh+ync3teX
	Tb0QM3fDMvAM6gIBxfo1/13HaMoR3iCovd1w2mBpM1VaUO7PT4uk0fZwBgymkdEni5G0tte6M0E
	WcaNUwxm5YvmWLx9keuJINbWU+9L6bkbEpF3IQ8BYsrFvfhI09wKGBCP2nMw+L7zJ75O7MiMqGO
	tL72ZYoSAxWeo6FMKiuwUOJJ6JbrRmOvKeWReI5KXW/B6EmpmQpdi53bMy1Wqq07aJwC3ADj90m
	sMKgwUOMAc1xlR3noufzem5pKQ==
X-Received: by 2002:a05:622a:2cb:b0:516:4f62:85ed with SMTP id
 d75a77b69052e-519c67370aemr11157381cf.18.1781801524859; Thu, 18 Jun 2026
 09:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606181547.617a6967-lkp@intel.com> <6z2rqmo7b6m2rdhqurspwya25ps4dj7lctdygnmq3rn4xt6h3i@57kiiy72epgd>
 <ajP_-zqVPtbzvc9j@lucifer> <CAJuCfpFed0GuMk+dE-Xn0w45Mn1Spds-pc2BE__FUoWm6+R7_w@mail.gmail.com>
 <ajQbXthzbr9xgUIM@pedro-suse>
In-Reply-To: <ajQbXthzbr9xgUIM@pedro-suse>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 18 Jun 2026 09:51:53 -0700
X-Gm-Features: AVVi8CdV8JSYSx61wMIbmgLKcoU5jz7qQB1U1gJgsDUd3AobdGi4EL9lK9NNRxM
Message-ID: <CAJuCfpH_Fp=J-m-kVZ3VVmqH0cAfNX6CQKWt3XmAJq1Rp9sFwQ@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 7b32f64bc5: pts.svt-av1.Preset13.Bosphorus4K.frames_per_second
 45.8% regression
To: Pedro Falcato <pfalcato@suse.de>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, 
	kernel test robot <oliver.sang@intel.com>, Frederick Mayle <fmayle@google.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Andrew Morton <akpm@linux-foundation.org>, 
	Kalesh Singh <kaleshsingh@google.com>, David Hildenbrand <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 9:32=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> wr=
ote:
>
> On Thu, Jun 18, 2026 at 04:03:43PM +0000, Suren Baghdasaryan wrote:
> > On Thu, Jun 18, 2026 at 2:30=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org=
> wrote:
> > >
> > > On Thu, Jun 18, 2026 at 11:30:47AM +0200, Jan Kara wrote:
> > > > On Thu 18-06-26 16:00:42, kernel test robot wrote:
> > > > > Hello,
> > > > >
> > > > > kernel test robot noticed a 45.8% regression of pts.svt-av1.Prese=
t13.Bosphorus4K.frames_per_second on:
> > > >
> > > > This one looks serious enough and real. It would be good to figure =
out what
> > > > happens in this benchmark that it benefits from the readahead acros=
s VMA
> > > > boundaries so much...
> > >
> > > I think a revert first no? This seems pretty huge for something that =
isn't key
> > > to the kernel, then a new attempt can be tried with this issue addres=
sed
> > > perhaps?
> >
> > A quick search yields: "The
> > pts.svt-av1.Preset13.Bosphorus4K.frames_per_second is a benchmarking
> > metric from the Phoronix Test Suite that measures how many frames per
> > second a CPU can encode using the open-source SVT-AV1 video encoder."
> >
> > If this is a video encoding benchmark I would expect it to explicitly
> > prefetch the data from the disk before measuring the encoding speed.
> > If limiting readahead caused this regression, I suspect the benchmark
> > doesn't explicitly prefetch the data...
>
> Well, commonly video data doesn't actually fit in memory :)
>
> A quick look at the code (I think it's https://gitlab.com/AOMediaCodec/SV=
T-AV1/-/blob/master/Source/App/app_process_cmd.c#L821)
> suggests it is progressively mapping the file data for a given frame
> (or frames?). So the old behavior would result in page faults for a given
> frame starting readahead for the next few frames. This looks reasonable.

Yeah, looks like it's mapping one frame at a time and even that is
done with 3 mmap calls - it maps luma_read_size and then 2
chroma_read_size chunks which are consequitive and could have been
mapped with one syscall. Seems very inefficient but I guess it's
legit.

>
> FWIW I suspected this was a really weird case regarding mprotect or
> something, and I'm happy it isn't; but at least I had a suggestion for th=
at -
> for this, maybe dropping the change (for now?) is the best course of acti=
on.
>
> --
> Pedro
