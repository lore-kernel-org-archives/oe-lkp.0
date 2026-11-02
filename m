Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793635206;
	b=wgBOkPaYugSlua48cgLDHe7HyKILKvMP9r0BCFDAgdsWmhH+2fGFLXI7bpREvSgeYYMv
	 9cw8t6g7aXvdMw8FKYDAV82XQdofWZFmc6mkr7SgtFZvk0p8W6qGuB5zk6VVAU2JinWSr
	 Z99I6+5/MOrBjUojzj3dZVHqqIlGyVud2SL6nwv3RRFtQFvDNgHXB7sSDZsKXp0sKIovy
	 wdg4HHSj6cP4b1zjci3tEqpxUx1NybYhHAF+3N1ujM3fyN/dV0o+MZoRk36OmB5VQfUe9
	 gvTeYsqeo52vaoZX0SxNZtKsvNIe/wxinW057e9DIpjuAJR7O6Ty+TtVoGCCp42uKNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q1PFYcNh+ALcjEaWQ1I52rEchwgKWiSa+Wd1iC2vUUU=;
	b=5BmRTaKQULll+4vREaKgQU1JgGHDDHh/NFHqN22RhTKDw1GBcA5Nl77sStcI7fkuWR35
	 syQFozcu+AGreYZJgzZjcTyYn/80g3DQApDGX/22Ix/IsFHsiYebkm2uNpXUNlNC0fUDm
	 afHoCZ2dG3VCcjb1C2be9UYkVORhWKLFPHni1P1rrxXeCTrbGs3D8hqYWYCu8A4JOewQn
	 3HBCyKO3Lo86LLVxz0jfWTYaWD4dKAGQk1BZpMsFOQqp4fw/WwX8a15sZGoiXZokPmvks
	 r8347JB3jKEJBM3WBA8WJaMH/qzjD0+U+buWczpcGUD9soQP5+bOFAUbXybBYFlTpUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jSxBghtE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892876075A49
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 16:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892876075A49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jSxBghtE
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5383c97c8cfso442611cf.1
        for <oe-lkp@lists.linux.dev>; Mon, 02 Nov 2026 08:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793635205; cv=none;
        d=google.com; s=arc-20260327;
        b=sRh37x8WCnuJ3p8z/ZEQHgr6fuBTKd7O+YzqGPLDa+kS1L/qgcO6y0iUAaMgZ8nSoc
         bioUFAQu3zfvZYTt9Cy7RIov7NJTwncQs76LSTGLz1D0g1S548QSMLeM+ZCfXH878qIJ
         HfJIXJCRFxo1JzQXVZp4OFZgJBQHzKok/FAQ2jq14AJzMviDcfeOF36N5XR2sy7/XBUM
         5Az4ILLw8YM/cyCZqPnOVHkWi2Oto/BX4EnBpRnJIJ6xdV9bnxEKeqhBgjdwZ42nF7xQ
         Wh6TQIQgMHf/1m8mgCrAAfce51MHRpeP7XAZlRSHo+X1BJq2hF7T5w5gT8m6PRafVCj1
         OE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q1PFYcNh+ALcjEaWQ1I52rEchwgKWiSa+Wd1iC2vUUU=;
        fh=auUdiC93RprSQUHOl1MYb09cjtroPF/LVagADqGyO7E=;
        b=nD8nofWUMBo3tqHUf7pjo1zk81SywCCKJ+1kqFHLlty3zGAcVydnlRmrqHjuc0OoaA
         QntEQKHjFEGqWKF6r2oMsZwVkwveOfKkL7gxpgGFhXawPfpPw0OTR7lQnfHLNl1oME9h
         nWv84WKk73tbSxa3+OVgkll3gfEHjjaFE5+k7qiGqxjh3gmwJT2YSMuSbjupE+fXwmYP
         Gxq1cB8oRBPMR7RgFf8ffaiVoKWj3f2EgQSB0axvSXPY7kh/w44GSgR1eWyooE15pN0r
         ZlgFQ36BFicOJdaeIHx5EM5B1E8rqyAWAtfmqwtmLCTIPUAeu4TRyDaRN1qjv/RB34wY
         uCzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793635205; x=1794240005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1PFYcNh+ALcjEaWQ1I52rEchwgKWiSa+Wd1iC2vUUU=;
        b=jSxBghtER2McPJLB2AciwY8rIaAlqq2of6bAfr1UrDI4Kv9RUXlFF+9BEQdHd7eNqV
         abgBzuNsk4HIqGDcZkmunteme0kO+5vCuMoJBAo1NCUWGBIQ2j8DMHrPg45nTlxjVL+O
         Yf+AW0Xke1ZGULUppYqY2jEcIbgkS8SNS7WpHNH0/ZjClqxFVJL/ucWvTyP8dR1PNV3j
         kwnwtxmHoDCssav6YjCE4k3onqjORDvTf3T12bgFm2QMY8pHr2NUD/qwM+tUDx/4SYkH
         mQ3LLIBjypZIQ/7BidVVt20eYEh5UwXcdwP+LxUlf5njAqjoR5nJ7C/gnRaULYVsMR1H
         fHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635205; x=1794240005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1PFYcNh+ALcjEaWQ1I52rEchwgKWiSa+Wd1iC2vUUU=;
        b=c7biZId0VBky7z80DQBLj6Q+Ifr5OocrrB5Ye0wtg3G2RYmMsjsU2hCLWkAtWB0TQi
         BIQ7QB7optbYywEfiNFbDYENrk7ReWpDjijFWbGOrBjxTDY/SVSlprl+1Dy00U0rgc7e
         WUWAYyneYsY1v+chCgJSRwKfolS4oVLBzjkRrROuGEhlyT2030Mz81GCxPLTkre70H4e
         ZA8o8GYaxEwnjc8Y55xCKkdTZSz1wpy3dmdnEQEZdKwJWnp6Ia0pYfOIG7hH3bJvrDKY
         AuszYviNrJ41Jfx4S4hHNVsA12xyJqXWrlVP1ON5d5keo7nL8TcRAQ0f0vAIxSKcEp9d
         Dv6A==
X-Forwarded-Encrypted: i=1; AKwUvBwXA2qHVYrNBn096bY5qPbU4xzs7EOPx9EYASz3S9HpnDDM7xE9cAoEUCqw/SzHuDmGdRkvrX4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8z4qsvj0bVKt2cYMz11Vi/faJDpXdVAWNtyfj/aQGisFtx4lXD
	5M3kNtJxVu/CBSp6AnSZu5hH3hkBZMsU1Z3NT/bN6BXit90k5d8fxHTzf97mFTp7SjE4BPkU3Ia
	WPjx/8zmZFxC+DmJhk0kNq7yhJmVEiTGHFZ8br4BU
X-Gm-Gg: AYBFou3yZxPAnA9TfXUqrQmhYTu/1KH6TltFPVr63r04TyshWZLL3CkFDIXjoJHb1QD
	teGvBWuixKPBo1hCW+HwU9OCRGLzFdwlM7f+KP1zcm1XJlYuWHuiPAlRSISFbClT+g+hNR+MI3i
	k1VLB8a1BZ/xZKT8gNd7S9Mpdt90+DNiysvA/Fswhtjky+SLuiN6Ca1hKhoXTO+bSg1yLe6elOp
	gBsnGnqn6tj/a+3D0F9xEmXC6VcRV5wTjzWgBXACrWSSqSD+K4JRIxzTSqXncNnXYluduFCo8NN
	6FP7bJ3lFeYksyYpy3gTsvFF92ZLwZ8YfauHUM1AmW8PHNtlDlJwdEO6kiNT5uN1H4zopa/RtFs
	l5EOE26ayfq82LUFhUgzlYbx54oyHdfHO16+6
X-Received: by 2002:a05:622a:400d:b0:536:35e0:4f97 with SMTP id
 d75a77b69052e-5414e8ec151mr81444421cf.11.1793635204453; Mon, 02 Nov 2026
 08:00:04 -0800 (PST)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101154503.3203036-1-surenb@google.com> <auiMK6ynztyF1-MM@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <auiMK6ynztyF1-MM@pedro-suse.tail5790ac.ts.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 07:59:51 -0800
X-Gm-Features: AclHuK_cZDbtd_0ueJf6rRfK2iXBf9dKhq_tkrnJpLDfq54hZvQR7vC1PP9A1x8
Message-ID: <CAJuCfpEbhjE2V57ekoFfOjoDf5j6LvtcsrzneGCAWy2d+pQW5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	jannh@google.com, liam@infradead.org, willy@infradead.org, paulmck@kernel.org, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:26=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> wro=
te:
>
> On Sun, Nov 01, 2026 at 07:45:03AM -0800, Suren Baghdasaryan wrote:
> > Pss metrics can be affected by map count even if VMA tree stays unchang=
ed,
> > therefore tests checking VMA tree integrity can't use them. Use Rss ins=
tead
> > and pre-populate the VMAs so that Rss changes if a VMA gets skipped or
> > double-counted.
> >
> > To ensure all test VMAs are populated with anonymous pages, remain
> > mergeable across VMA operations, and do not have their Rss changed by
> > memory reclaim:
> > - Toggle PROT_EXEC instead of PROT_WRITE between adjacent test VMAs so
> >   all test VMAs remain writable and MAP_POPULATE faults in anonymous pa=
ges
> >   (rather than the shared zero page, which is not accounted in Rss).
> > - Use mprotect() instead of mmap(..., MAP_FIXED) in split_vma() and
> >   merge_vma() so the first page of the split VMA stays resident.
> >   mprotect(..., PROT_NONE) splits the VMA without unmapping the first p=
age
> >   (pte_present() remains true for PAGE_NONE PTEs), and
> >   mprotect(..., self->mod_info->prot) merges it back. Both parts of the
> >   split VMA retain their non-zero Rss.
> > - Lock all present pages in the child with mlockall(MCL_CURRENT |
> >   MCL_FUTURE | MCL_ONFAULT) so memory pressure cannot reclaim pages and
> >   alter Rss during the test.
>
> FWIW, I was wondering if it would remain constant in face of compaction (=
page
> migration). It seems so, from looking at the code the migration entry sho=
uld
> make it count the RSS. But is it always the case? I'm not super familiar =
with
> the migration logic.

I'll double-check, but it seems logical to me that page migration
should not affect RSS.

>
> --
> Pedro
