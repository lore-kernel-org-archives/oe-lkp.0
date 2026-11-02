Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793635902;
	b=ZZRu1VMnWicCLn3BBPjySYCVvNQFmLm5x0aYgB8CUFH+RfsGL//nQmr5W2psJyB2qmoq
	 Jd8864r+1VYBWHfXvOkcClJCx++M4D1gZKwukUgEMAV5BtWaY0+cBFdnG0ftFVQj/UvD/
	 hd0KeNdDzLnZ1AewGBbVeyyU9MdMhAMrm63CpbthG782nuiSphD9i8FUYiFxQXFJezy6P
	 hCeja49zdCqv3hMPpezkAcXCMzieN1TNjWIKRefmCvG8s31Ki9KdJx0tqby059XeaUopi
	 OCYduAJsKZhDPvtf7pBrg880d3l0/usr3WejE2gBS+5Z9yQtymXb6HF5nfYLiqyab+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QrJw+lkmXdlr2rkeyObnD9Bf7t1jpUUa0j+yv8MRcbQ=;
	b=3W+PsxkgKT+o0tvydjfk+cgItqwbo0CU2oJAI3RS1DX487PVv2Hx6+FvzfIHt2k5gSot
	 Dl7SuP0Xy6MKhmr8oITmj6I0O3E8MlKI65KmQnllj62WW7UjfRRhuCTtdawj5IN2BS/rL
	 Yp9fPFq8XqKgEQifcHTaCIS/vuHiUVLySWMViSWTIQ8VYu53LdtkuuYNCYdXX7Z2X7fC4
	 vNJzeM5cA8fbZI/euay9uvgPvnpE7GSMxxE2VJ6zY5m5vi/e0pJFPBzNieR8GEcJmfyaM
	 1QwxFOnsPGKPsYF/qRJbPWol9m9C24WOnwHPNDK/373F4M3fv2wRrpRY0HOXDkNm0Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j7POdJz8;
	arc=fail smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B9C6070CAC
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 16:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B9C6070CAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j7POdJz8
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5383c97c8cfso447331cf.1
        for <oe-lkp@lists.linux.dev>; Mon, 02 Nov 2026 08:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793635901; cv=none;
        d=google.com; s=arc-20260327;
        b=MCWciLAp/WSQAikjzjhkCkICa1bd7gewHNZEwm1txrswgFFgYUfaNSpVYdCvqeknTf
         cLZze9W9324r2J7J+o0Nhw5vW9pnXnhwGQoGo3/CvYpVe8vNGZ5gK/lRzsgcgd/6/P6L
         hYDI1KHGY1uqcDg5qStuvo3tvDv5wbFSuH5eOPHw42l0AyIQyxn+2EPOxgHiWPPz4J1E
         nTnhqmE+9FjvzjkV+wXyaXzpd7LH7WrszsrKO9TkepUN5FsXeKB22YquRjDk0T4zsDAJ
         DqTZw9u+dKrbdFE+6JQTKUh7EfW7Ido6WETCWlhvuVhm8Xt8OnTd461or7IemU90Zeqp
         41MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QrJw+lkmXdlr2rkeyObnD9Bf7t1jpUUa0j+yv8MRcbQ=;
        fh=ElDYD8ctspdUD+ZV+4jDT0PKGlZ+Xu6Nt+WJDACjjb4=;
        b=S/RTYxboRqbVe/3Mj3xDjHxaJaWMzUWQRPMAvNs017FhuardY6W9kJ2aEku9nDpoa6
         N8Hv1AiTKTpaTqXKzXxBujCP7w59RhjZMlPUoLvatzba+injgwMSIAYModcGluAjA39F
         qj348RtelIQJj146XDe+bu2aZotDHC8fo+pWRK0CdnBwaIDJizvaVYcUQgky5xnpr92T
         JNNZDKCCaI+VYCfLCsXnDXXiz5yLjy0b55vtJ7JGEfPYoS0iVAsxFDdOVSdAX951cD8V
         1RoSTzGaUqYXa3AY9orfK0cVYYkkwUk9ajHLs/J0nf1yZt5O4ZUZr2TwKHk4if6Wr3h6
         uTGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793635901; x=1794240701; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QrJw+lkmXdlr2rkeyObnD9Bf7t1jpUUa0j+yv8MRcbQ=;
        b=j7POdJz8y9ywB8nGpwkt4oZO/2hjqhIXanoGO2+3N/d43ypYwpasy8k2uEL2y7FN20
         gAiacTs6/LUxxJqrJm9hOwlGXz0vJ2BQpvx+kze51tQO4OlzPMlb7NrM3wR2A/nbGSsi
         M5QKZt0MoHJXyp4wS7r8GkPvxm3Xxs08lHlBFVNUFKDH80Rqkbr+m/3gxKz9vK57l+F0
         N5UO4eyvIYmdJ2LBqBq/jEb9xuztlzgV9zLjnNBRieTqF5kfOEH0DHdX0yuCj9ZcXeCd
         p08NCJtJXUXYGchGRpYAgg0TaVFUNKCsBm5mDjSumHpplPznX4Pj+ZWULlYIvIG+pkD4
         oZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635901; x=1794240701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrJw+lkmXdlr2rkeyObnD9Bf7t1jpUUa0j+yv8MRcbQ=;
        b=wjTsQrJ/Y459CchO/BzkWXjpTgdfISTfHzRsu3l35amBwMAgAl2GsG/0IWqOaC9cXI
         RNKpfq3OrgtmlHoIKAmXOvpD33IEscCxJerDxowK5QEr8oqiChcNWSPe5bxIoxfzor2G
         0EXo9i1fhJ+FuRzzCfriS/pp5lre915JQMOCq59flokR4sCfGhiQKnowGUsQaHOvcK8E
         qDmCFS52lLmeju/xGvhBFlIpDODAp99sgCeTVGiq8xAPBtPYhhZdZnRgTO5XwZvX0VOQ
         VZQ52aMWxcgcuQrvFUGtTZkHJ9MLtxxpoNEW/itOaP7Vw1S4uOOcqyF0Egq90CRwbqTr
         nvFw==
X-Forwarded-Encrypted: i=1; AKwUvBwEBZoaBdw9HYQ6HS9hkyahnYfSrBhB+6yM/eRUJtzbu8PVlookhtZHvvYkyQ7OUiHzmdfuI0A=@lists.linux.dev
X-Gm-Message-State: AFq9FYIbT4b5iUyHlD6IHbwm8XfVD5rR7NSU523yrByNRpxQiwkAJ/Zw
	FacrWN3gIDOPYpJQiw8NuFt4zjepE1zDZs7YhkPwtceCkQG6K+u1vFd0HozZexOvLNuj7ux6gqD
	PLOF+JeQHHyY0Vou74Spxe3FWJNUNAWw2stY3s2Cu
X-Gm-Gg: AYBFou09fuBrKBT0gkHb2O+WCSSCq8WEG1T0tsinc/ER4LjAHImGi4yiKG/+/aozaOg
	FlyNTi6wVEb6XgOspc+jS2nneNFo0sRplBF4zdxq4CAbgJYkXnFGvPD432DyLA5FF06Zsb4nSfd
	ioTzG28CU1NUVA+kRmP9Kk6VLq8rhUc541V/zSrX8lZbeiWcaGsgjXtz/ioniFMGlP8OV6IYbUS
	6k7nEMzh/q0Op/saKgPtIgk9nKtOvmSZK4ezYjPXguDyxtO6kzqXjA2vaM9GqaW47ezNuU907xA
	i4KQZeY0Sl2VBLrgnNBAF461Wrq5FCnnGajIhpFNS2Xm8r/QBmJr4lX5FmtapKv/MfnCmxYyV2Z
	dP/ZlTsmahr3tPy9zqcyetZSIIzuCcTzbbavI
X-Received: by 2002:a05:622a:488d:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-5412d50d069mr12637281cf.4.1793635900706; Mon, 02 Nov 2026
 08:11:40 -0800 (PST)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101154503.3203036-1-surenb@google.com> <20261101110100.90796bf33ef50307a7698dca@linux-foundation.org>
 <CAJuCfpGmPLBRhHa_dmyP10QzyRyvcWMYDLU0+J9t-RCLBsTaWA@mail.gmail.com> <20261102080103.6e3f602364747ac6adb13f5c@linux-foundation.org>
In-Reply-To: <20261102080103.6e3f602364747ac6adb13f5c@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 08:11:16 -0800
X-Gm-Features: AclHuK9GAGsiZrN9317-LnzYplCUiian6VttOAS32aZ3eING8-O8jgvJChN1NXY
Message-ID: <CAJuCfpGmHWiu0Hmob-PgnvWAMn=CD0-xgiyGztP+P=OFrwwfTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, jannh@google.com, liam@infradead.org, 
	willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:01=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Mon, 2 Nov 2026 07:43:17 -0800 Suren Baghdasaryan <surenb@google.com> =
wrote:
>
> > > :
> > > : The patched userspace test passed all six cases on an existing
> > > : x86-64 6.18.57 kernel, with a PID-namespace adjustment. That kernel
> > > : predates ca5480fb53fa, so this checks selftest behavior, not the
> > > : intended kernel's procfs changes. Separate syscall tests on that
> > > : kernel confirmed the EXEC-merging and memlock failure cases.
> >
> > I'm guessing your bot was using personality() to make the tests fail.
> > Again, I'm not sure we should handle such use case. Should we?
>
>
> : The concern is pre-ARMv6 CPUs, where READ_IMPLIES_EXEC is set by
> : default. Nobody needs to call personality() to encounter this there.
> :
> : We already addressed this in 0685630fdccb ("selftests/proc: make
> : proc-maps-race work with READ_IMPLIES_EXEC"):
> :
> : https://lore.kernel.org/r/20260808200312.6326-1-kmehltretter@gmail.com
> :
> : That fixed split_vma(). Alternating PROT_EXEC in setup introduces the
> : same assumption elsewhere: RW and RWX both become RWX, allowing adjacen=
t
> : mappings to merge. The parent then cannot find the expected three-page
> : VMAs and the test fails during setup, before testing procfs tearing.
> :
> : Yes, the focused x86-64 check explicitly enabled READ_IMPLIES_EXEC to
> : exercise this behavior. It wasn't tested on old ARM hardware. But I
> : think we should preserve the existing support for those machines.
> : Populating writable, then removing write permission from alternate
> : mappings, preserves both RSS and the required VMA boundaries.

Ah, I see now why handling READ_IMPLIES_EXEC is needed. Then your
complete fix looks fine. Perhaps we should mention this pre-ARMv6 CPU
detail in the changelog of your fix to explain why READ_IMPLIES_EXEC
is important here?


>
