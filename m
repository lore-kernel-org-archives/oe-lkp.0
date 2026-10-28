Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793217568;
	b=cgYZBTwwtTcjsrY5A6xNNX+4SRLDOStPAahqPIkNyp0ezXbG8bppg41Q+beh6CpD3mel
	 5SUk3Q01CI0UP5yUxCUlEzzdeqlYK33EnjV8AubRK0vPK1ZRSFeT3A2l/3uCymid4cJnr
	 xU5bjDLISiFMNk2CqKqEGclHuPe/i0ID0p0HmUG9Bpofb8JDnJ2atXbEHom7F/1TTKoSF
	 KHW/ggfljTsxVfK7W9tLlJjzd0IPBI261+ykM4HFp5LkPkZMzKCxo1e2H5oqcRMWEC1CP
	 13nl3VcXyCzGhKT0XUnbGhpbbcqi9ta8VZVlqcRz/KvWSeXyyFTdwzLiDX2IQGJdxbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KNPolz4ZvstX96ia0adxYWJ+Q8YCwfoUsBDxmY4GZ/g=;
	b=NvxDKLSOsb0a4c+K7n/YcCThnKtV/HntlD4d1T5m+iZjCvVCgP3ZpThiu4+f9rFrrDH7
	 b0i3PZkkDZzzbwAl2P8N6F/bWabf5nhhIE/26ut5AcOMkecZdcLpWlBYWd4yDth46Dpe3
	 5+StXtOaa37eg34SMxk+3RtqM7EOR50SFvPaCTJoRqjJ9wXhk5/g5O7tYNcg7KnhJeL22
	 6tJpNqlTA0+QQOwcFDSxUlV4PvD+UUOyIfkZyTLA2p1Wm6GaH3kEPQ55vXSpdfXHChiNP
	 yQ4vrO9LX1DTdTYd2AabmXGYWWD4GGnJ9S9nRW3ZuaHiFfxTIhaewIpiOtk0dLFSZsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dkVuJxHv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9655E606A31A
	for <oe-lkp@lists.linux.dev>; Wed, 28 Oct 2026 19:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9655E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dkVuJxHv
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-535f598d126so8901cf.1
        for <oe-lkp@lists.linux.dev>; Wed, 28 Oct 2026 12:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793217567; cv=none;
        d=google.com; s=arc-20260327;
        b=ltWrcB1emBhDvWYHp0kuhtcWixNRXBOmGGIc0ZVhk2gc3xpP1HFaEWmOYujA1kLQeY
         3Tg47T0csEQAaPCJZHsFJ1w71Q1IuZtER6MIWChMQap7Hea6/9TjWNtY8kPouIa00G9F
         JLUC7q48zEwKUXoncKJWAivuGHIvhOWP+e1z221yqWWBPPqeQMmnX+ZsnXrvOmbocj36
         2qB27igT2gLF08qVXW8Gaw25CVNpUjAAp2b2ZL/ZcNXnCRY+xB3JkYOATpLZOX2udD6C
         iUEhQflI5mAWVrx5jkNYpPPEmrHauHSUL3s0roQ+s0QvmvFVe2Fu0M21NtUnYbfCVJrf
         en4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNPolz4ZvstX96ia0adxYWJ+Q8YCwfoUsBDxmY4GZ/g=;
        fh=fc9bUHCh5u7iFhv3zYzOAoAMkFYAb6oV6B/qnLCJeKc=;
        b=lfxQAfk4IJBg13KK5Sb8+TcfeYcrg5/tpYyA1kJXG4AxfGVOfLbF0kW3angIpMh1WR
         8xUR6n00Tqxsi0XMOl4w+PSSIHPzn/DFG6mG6wv8B8oRJGUBAdl8iddEPutW+wc70w03
         Mt6ays4ZeisspDirjxRTYXoMfON9u0KZV5TF3vBwASUi1eLheyyBnucpL9drzO0x9eZ3
         3qKjG8ouVgVOq3hpE9NKNwjGlymWZvrXjBu0iESCvvjDfuSV30V4lVDa2I9DhoNxISX5
         Hp2QQmllFNiGkl9Q+neEEIlPMQ1qtrSWsFZr5ELNTkGiRzbO5r4DyOHoS7nC6QdHlDFM
         VEXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793217567; x=1793822367; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNPolz4ZvstX96ia0adxYWJ+Q8YCwfoUsBDxmY4GZ/g=;
        b=dkVuJxHvyrAfMH9diyFR5ySaHsTgfyuu62nLgWTWrx9PgWq2hqXl+CG3hQIBhci1v2
         oGwGhShgA2sA2GUmscacNlByq0XQA4dQmPmO78ziq8iLbbf0/FhtzPYT5ioQZdP6Dioa
         X8SWWVZboKgW8mLFY1CfJpabn6GbYfkEnSd7qmW0HTF7zuimaoFWmKZsqFyQCTvO4yCN
         qui4hunXyllfKjIA9mBezqXaIQIzsXqN22IOzuhhCR4vn5LV4JB/HTItRMqYl7Zi9ddf
         sSG1CUaHRG82Rk890dr03uYaMEfx+cCxrYWfkdbNO9s2aqTr0USdSLepbO6KxkMHUpmM
         q19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793217567; x=1793822367;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNPolz4ZvstX96ia0adxYWJ+Q8YCwfoUsBDxmY4GZ/g=;
        b=LaLDDbTW4HLiEZ/nysiDUkjEycrKCLyDZSfTW+GGOBI9dsWEii6f8bvGDyiiphRolM
         KS+oXC8WP6r7SNX2wVm229aMYtBj/atehoJ98Gm28wLU8V5y254LsWt9gNMQ1QeQsRDB
         8eBNcdiQOQdiaxc4AIFyZsUT+bHksk+d3LuXsS3ovgPdrgPYk/Ck8gFVt1DUgCCzzw6v
         XMRw7fyHjNxd7+zayT3Lrqu0FJsEyPV8lq4Rn9dDA1I402xrWuWoVKycOYcS20c3i+s9
         +EX0lnirpFBXWczOHkrrkVxuxK//jtEc5iaWLhQhOEfvqaC7FZ3nsrrDeIXy55XKXCNi
         hPPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAkyBvx2HDgj9+mU7QbFKevbvtJEc9K7zilUCtix3SmU6e784HCw5aoku+sc6nMYykya1wDMQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYLO8Zsymfigd1dXl0qV3rMnKJWCSlpMwj2uqnZN9ZO4Gbe8b0kD
	iT0r9KwPjg4m3yocGDuUoXhS//Pn510vWWgNinK+EERgqcSZfHl3M2RfXc1R1xRPDUCkWz/9eMV
	lyJ2ziyUw6fedpOtMrZDv2ssPsyDLYtuO6gWhp1o5
X-Gm-Gg: AYBFou2TBa3c7ZxnVtsy4re0z/TEkpMk35D2ndVtqwc7+yoN2v/IV+HxfjubtwiMTmR
	z7N4rI4ZVN8LEF4tawJnVRbChG/X9y1YfNjqxGcplye40DLawvcfwSmqiz56mqb4gafq9WNHDVk
	P77O6iBul7D9DdAXZppid51plAad98TufyXeOENs9byws1ztBjWWlDN/c3oh5yxqab3xfpIHZV2
	O/hyBwd1stLtM7O++B6iDjfkO/056AcD2EprbUlwY4yvtyvuXWhWWWYjvCvI3D4rYCd49FCkeEJ
	LSqIwUKLXkZOG4+rPW63Pq1FFuBXmfgEAYjad6qa37V7QNTv3ocNjJqxvFSqCvZFq8jOyxrxU93
	XRsUzDT/zrDNl2QTnCCMJqbWOxyU+6W9jE3D+OVynujH5i3PuLWCppEVEQT2DvJjoeg==
X-Received: by 2002:ac8:690d:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-5414d92c15bmr762701cf.8.1793217562021; Wed, 28 Oct 2026
 12:59:22 -0700 (PDT)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028051312.1505295-1-surenb@google.com> <auHK3k-W4gfL_MhI@pedro-suse.tail5790ac.ts.net>
 <auJO9al4lmAczLAu@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <auJO9al4lmAczLAu@pedro-suse.tail5790ac.ts.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 28 Oct 2026 12:59:10 -0700
X-Gm-Features: AclHuK9-6O7OXV5NH16IYTfE9EYxAq4xHV33LgQLBVE22ks0KWFvxZhPdcny1CQ
Message-ID: <CAJuCfpHAFXDXs4ZBrd8C=8hkQdJxcWCz+DER5BG_Ki0ndGpf9w@mail.gmail.com>
Subject: Re: [PATCH 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	jannh@google.com, liam@infradead.org, willy@infradead.org, paulmck@kernel.org, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:42=E2=80=AFPM Pedro Falcato <pfalcato@suse.de> w=
rote:
>
> On Wed, Oct 28, 2026 at 10:14:19AM +0000, Pedro Falcato wrote:
> > On Tue, Oct 27, 2026 at 10:13:12PM -0700, Suren Baghdasaryan wrote:
> > > Pss metrics can be affected by map count even if VMA tree stays uncha=
nged,
> > > therefore test checking VMA tree integrity can't use them. Use Rss in=
stead
> > > and pre-populate the VMAs so that Rss changes if a VMA gets skipped o=
r
> > > double-counted.
> > >
> > > Fixes: ca5480fb53fa ("selftests/proc: add /proc/pid/smaps_rollup tear=
ing tests")
> > > Reported-by: kernel test robot <yi1.lai@intel.com>
> > > Closes: https://lore.kernel.org/oe-lkp/202610271934.fd287c3f-lkp@inte=
l.com
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >
> > Reviewed-by: Pedro Falcato <pfalcato@suse.de>
>
> Actually, now I'm wondering: isn't Rss also flaky if memory pressure occu=
rs?

True. Sashiko's findings are also interesting, so I'll need to figure
out more robust ways to test smaps_rollup. I will post an update once
I figure it out.
Andrew, if this test failure is causing issues in the meantime, please
feel free to remove the ca5480fb53fa patch until I get a better
version out.
Thanks!

>
> --
> Pedro
