Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EE554765
	for <oe-lkp@lists.linux.dev>; Mon, 20 Jan 2025 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737407735; cv=none; b=ujFdR+GpXfdtImszs6e7MAt5DqyNu8hLzPgXAyalOhV8c47nlBWgdFUZvgWlWOh6zuT3NKcYCHWzAMOPTHTUJLSZBO2CXn7z6BvfLgLSb04Gs8Qj3gw3MDNZzedygy/9IcU0/H3jE2L0PKjsf11XAq44u7ycLcsZYilXNnVsKLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737407735; c=relaxed/simple;
	bh=Nk9ptFzWoNFmqDSP4gjGSCw25adjsmfJufY+aMhJcqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOljfdk8wLfSynDkST+prNBxXiI3Hfld3/3uWHvfSKvx3bHNZk1UOCy9DO91ukB/54+W6oaxBSxmRiD6orM78BPO11zVCR8C24YlX/Ea0yW74hniz2ZuExwBRdWfgh+VNeF8Cnh7dbRErCM///Mt4SOXYZBiLjv+rW4C12eibzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9S1t+Iu; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9S1t+Iu"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5db689a87cbso9600862a12.3
        for <oe-lkp@lists.linux.dev>; Mon, 20 Jan 2025 13:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737407731; x=1738012531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nk9ptFzWoNFmqDSP4gjGSCw25adjsmfJufY+aMhJcqQ=;
        b=B9S1t+IuAKVOCZhwDXBEZtDYRz/qaNG+txrJP4KF2PkxFlfZOh1IQbxtrhIf3ydWxF
         32hFyr7cgF10+f7UkElQuJRyY8e2fWsZWCzG8S0F3Nbrrcpvg1bXj88Sjc9qJt0ir/Je
         THMdJVIUCl3vW4nkzek29ZRzYYjctgVFNQIhFdKQSTpE5fecxJ8GEUE1u1sGPvAtdKCY
         t6i5CneIWqG39+YVM4m7JNnXPvV0Jhtpim3be8haMq0C3FU56jHrYR/G7zZyTQ2QgKO6
         pXwwT4Z/xSK0+Kx4VuEy34DIgY4XB9rTYCIKV+xZiG9plPtdv6qT6cxD0D5ngTETxJDI
         3unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737407732; x=1738012532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nk9ptFzWoNFmqDSP4gjGSCw25adjsmfJufY+aMhJcqQ=;
        b=LOekoBQm2qMlLPL5fdBgA2QC/CbWmxRJC6j1/fCH/hLGXnCmG5rzTMoADamVAUaxYV
         ZoqSY2qYBceYouLp9e0G0WEDLoNhJqU3VmqUgA/j2kgkJ9oBuAaSnLZWPmSYXhD12aEB
         KlCY+DESpdROcqhlZwzdWQI1YQkthAnPqmOemmkFveMfwq7o6FOl7sGwddSSXHRoWRI/
         Efpf9eoScu4a6/Yb/fHScOd42C7MOQFCESAzcOKdKKAVzipr96fDUhnCBS8WktppL9sl
         eS3BZiucgc0K30RrluZvpuLgDf8BQJh8CpWLDZns7duCFPR92+v4N8zVGPMCpTLbczaM
         zqyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR7LfZRvR7Ir9WLyzof/5ca13jrJHtqdugiye4mXDWwHRCXPkw7LVBtQXFC4nU8aH6JtVawcI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFI9ZiH4Q1BOdAE2Jo91k1CXDRLPjMJjcAO7kL2D2444gDCNiy
	0Yn0uFnMASaoMDIhiU8gHZi686HFwH7CscrNB0N39YVG2oxlsmvNpsv0OoVMjn2NfK0JddugwYq
	HVLVo9JbgUwpoAyh1W43KOo1vo9o=
X-Gm-Gg: ASbGncu9endcVIy+hnjNW63OwaZC8Nxd4xztq48RveB5NGpoGJZ8cbgTBWXSty+Esyr
	X03vgWu0z1gT8ZYk7bltmdYSSAxlG3V3ydKKKYsLvEto312RHXvz42OZtl2uJNw==
X-Google-Smtp-Source: AGHT+IEmAcDTDwTJjkFr7qyNTkQgUXuY92WJyzdkQs4zIcxDDFvwotc+M6aDRc6D7Ir2zyf0CU2scwGua8bt2J+M82g=
X-Received: by 2002:a05:6402:13cb:b0:5d3:d8bb:3c5c with SMTP id
 4fb4d7f45d1cf-5db7d2f0e98mr13980841a12.12.1737407731371; Mon, 20 Jan 2025
 13:15:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501201311.6d25a0b9-lkp@intel.com> <leot53sdd6es2xsnljub4rr4n3xgusft6huntr437wmaoo5rob@hhbtzrwgxel2>
 <20250120121928.GA7432@redhat.com> <20250120124209.GB7432@redhat.com>
 <CAGudoHFOsRWT0nKRKqFwgHdAhs0NOEO4y-q7Gg4cjm9KBxQc9A@mail.gmail.com> <20250120203118.GF7432@redhat.com>
In-Reply-To: <20250120203118.GF7432@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 20 Jan 2025 22:15:18 +0100
X-Gm-Features: AbW1kvae8sfSEYL3GYYYms3fsiZWUz4ARlh9Pktd0QvT3NI_SSKkChY4poFrJC4
Message-ID: <CAGudoHHb5qsiTDQ8XO8mjVH6NOQ1T0V5Y-+Ug80mkpLTdiAsCA@mail.gmail.com>
Subject: Re: [linux-next:master] [pipe_read] aaec5a95d5: stress-ng.poll.ops_per_sec
 11.1% regression
To: Oleg Nesterov <oleg@redhat.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Christian Brauner <brauner@kernel.org>, WangYuli <wangyuli@uniontech.com>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 9:31=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wro=
te:
> I'm afraid my emails can look as if I am trying to deny the problem.
> No. Just I think we need to understand why exactly this patch makes
> a difference.
>

I agree.

I was going to state there is 0 urgency as long as the patch does not
make the merge window, but it just did.

Since the change does not introduce a bug or crater performance (that
we know of anyway), I guess this outcome still means there is 0
urgency. ;)

> And I don't understand what workload this logic tries to simulate, but
> this doesn't matter.
>

So one would preferably survey a bunch of real workloads, see what
happens with real pipes with both policies -- the early wake up is
basically a tradeoff and it very well may be it is worth it in the
real world.

However, I would argue cycles needed to for such an effort would be
best spent on other things.

Per one of my previous messages the tee thing which got a significant
win is doing some crap which should be avoided in real programs. The
rest, with unknown real-world applicability, does suffer losses. The
early wake up definitely has its own merits, so one can't say outright
it was the right call to whack it.

My suggestion to Christian is to revert the patch and call it a day.
For all I know there are other yet to be reported regressions lurking
(wins as well of course :>). By now there is no denying there is more
to the patch than originally anticipated, but it is also doubtful it
is worth poking around.

If you feel nerd sniped to figure this out, then well, more power to you. :=
)

Perhaps someone(tm) would be interested in looking at pipe performance
in general. I can tell you right now that there is definitely loss
stemming from repeated SMAP trips when changing buffers etc. Trying to
get a real understanding what's up with pipes vs real workloads and
fixing whatever crappers which pop up would justify the investigation.

That said I'm buggering off this issue, cheers :)
--=20
Mateusz Guzik <mjguzik gmail.com>
