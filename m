Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FB312B153
	for <oe-lkp@lists.linux.dev>; Mon, 26 Feb 2024 15:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708961706; cv=none; b=nPaoSLSA7j40pXB4knGt3oQ55tSpCJmW9tIH8dCxPlT9AeyLF4X0YxCnEyWin6599keIMfqZ56+ftnRsez7SqTP99ST7BXCSWya5fCohrJtzKbI6IAmK3/P/xQ+oxuuNfpv4N8hzhPMEmO2q1N0TTJvpGTUA45e8r1G8MjylhQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708961706; c=relaxed/simple;
	bh=4kIS4yD8AD4O1b3VnN1F06SOkEVszDZQI8IfD4Uehgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MewVZtiDzL+0XBi7Hu+bbjD2qtUDlOvpMQnaX/OqvRLl9nlCk/QJBXG3qNhuoL+jgwwnMqqCR6yd5F9aiWG2NQlhA5W44aVY3QmYTyAnmij1OehLu2SpWc/ZULhNUe84oaqTZPW4v4fQYgGYqBt7L8KEifvwrVxD6nY5f72BYXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=jjFISlBa; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="jjFISlBa"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3650df44657so8417195ab.0
        for <oe-lkp@lists.linux.dev>; Mon, 26 Feb 2024 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1708961704; x=1709566504; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xa0RbEC99hetXIlkM1dBM7uoCQu/qj03SQaG2EdJOl8=;
        b=jjFISlBahqnzfDuvonBBdVIcdhkaT6XrEiOd5dn+MbKlMDVnc9EAknr9PFUfaVxChI
         15taF5d4NcHwp1cPWz2t4gMqGsMGgyl3G0QIenoVh7INAJ46reLpf4gzTbezPhFcF///
         9rMz9x0rXEhG3+ju7mYJJwF9HJqDp4jtu2fgYoSC4kzSl5CS3vQycxk6uc1Hp6DnVscM
         fj8nVhAXdVw1IMpAtLqen8oSKduY2WbgRHHokY/uOnbaShzGN6sra0/p0ghchIfPNUr6
         ieuQtcy/9UL/ahAG6d90+0qIx3asjfMdeL1g1me4LZ1q8XWhWcHmjii9IQdcq/36mO3M
         tlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708961704; x=1709566504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xa0RbEC99hetXIlkM1dBM7uoCQu/qj03SQaG2EdJOl8=;
        b=uunnJMxkMpmPnI32z1zkWxPHP97A0b+PbxHnmA/Ogs0ZwiN+SXRnSQZg36k0kPErza
         KSGV+ReJsjs+EI3Fi2UoyUha2qG4ApzzbC1QEltEetfR6MoA6KTOHg/d/98HUb7uvqjB
         kzEBUe2LMY6f+moga0cUvLD48YdiCHgOMmUX4/H+Q21QFARF5kDKYkwtwFnEhI7NYdRL
         cpeOqtSHODqHQAsrNawl5FkEnBbEW+AoPjf9K/1u/x9WxQNfJr0X/cxx/+j2SuA/qvQL
         hSM2sdHxBZK9vw7AxfNkXIWQLCCb3oQtJsuyuVg3Q5Z/VOkYfkh/ETS7E2uqwhq7dy7N
         SDCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxTfAp0y40DZgxM57N+7STbPrlBCQQMyS7IHU5G4cZgr+oK3r5OokI2gqanE48JRb23qmwvRlF6l05t3lzCB0of2bZ4mqP
X-Gm-Message-State: AOJu0YwuE2DMCKrT9V+ZpG7iz51jPFIrnAWNVmjzcOZ3p+rL6i1dU3pH
	W4pAZBXCWDR/RiyLwUQi69Q1sblmKE0UuBiHeUYnS890rx3e47CW/CqR+WEpLMicQsn9sKt77mE
	1NZ5LyzT2CEc0I46BgMT8a8+Fk/WnZZ9e6e2Qpw==
X-Google-Smtp-Source: AGHT+IF9TjRy4O7N4WF2QA0xxbWaFEpVbHdsILnOH+1xQwJc6SUX/exDXTr0QynONQlKKrvr0H8J6FvRFB0LrC01EYA=
X-Received: by 2002:a05:6e02:13cf:b0:365:1737:d78 with SMTP id
 v15-20020a056e0213cf00b0036517370d78mr6817259ilj.17.1708961703934; Mon, 26
 Feb 2024 07:35:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402261004.1e2e3e3e-oliver.sang@intel.com> <87wmqr9s3u.ffs@tglx>
In-Reply-To: <87wmqr9s3u.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Feb 2024 21:04:51 +0530
Message-ID: <CAAhSdy1pGfTLo76QHWj4-1HtUME3+o_83DBwOQcUAr2c5Tr1ow@mail.gmail.com>
Subject: Re: [avpatel:riscv_aia_v15] [genirq/irqdomain] c3842e43d9: kernel_BUG_at_arch/x86/kernel/apic/io_apic.c
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel test robot <oliver.sang@intel.com>, Marc Zyngier <maz@kernel.org>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 8:42=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Mon, Feb 26 2024 at 12:57, kernel test robot wrote:
> > kernel test robot noticed "kernel_BUG_at_arch/x86/kernel/apic/io_apic.c=
" on:
> >
> > commit: c3842e43d9d6b013a40adaea274b663936b14e32 ("genirq/irqdomain: Do=
n't call ops->select for DOMAIN_BUS_ANY tokens")
> > https://github.com/avpatel/linux.git riscv_aia_v15
>
> Fixed in
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/msi
>
> with commit c147e1ef59d4 ("x86/apic/msi: Use DOMAIN_BUS_GENERIC_MSI for H=
PET/IO-APIC domain search")
>
> Anup, please update your branch.

Done, I have updated my branch.
(https://github.com/avpatel/linux/commits/riscv_aia_v15/)

Thanks,
Anup
