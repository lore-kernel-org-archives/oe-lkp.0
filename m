Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CB01F427A
	for <oe-lkp@lists.linux.dev>; Thu,  9 Jan 2025 20:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455966; cv=none; b=jShMi+hR6Go1Hzwqq9pa4FAXiJitCjzuL+Q8FFLCWT/hvTkVMU6fSzDIsarfUaMnlnsqczHgdW3alM+82pdBdwSfnEBymZzSbu5MLDfwMjxpTaprCxU5CEY+sRg5fY3P7JZaSDm2Qsn5+ZmUaFuicwd6RhJ1VYXBVKV3LSO1E8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455966; c=relaxed/simple;
	bh=KnxtAk8qTKHGN09scdtFagXnmUyYHSHslz5s4xuHouU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgaxyAIJnLLCcXj/+B9pBsYo04y3VF5BJfRSYH8dXqJaRE0UkSyDbZEzQe/ewZn63bg8bKOT4Yvq8mvvHWILXkjXoqxfwpmMSZBAMsO3QIliSvjDJQCR1sp1ftr4aUNvgm9VAzrlG54vGCq1jYWoKGM0ekq8814IRvqivTWnDSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajrvxlmr; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajrvxlmr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaee0b309adso229878566b.3
        for <oe-lkp@lists.linux.dev>; Thu, 09 Jan 2025 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736455963; x=1737060763; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6HMFdHqbka7izRuN40UhAvy6hkpZnK617+IDz/TGNDE=;
        b=ajrvxlmrNNS7BbGSKMGzo7+/Ke+tu5DU98siNiYOHQBzUmEJYUG6cFsYrCOFT869Zi
         OGeeH43FBv75m/Oh6hyeKyJDRONgODDfZkkt/y7bK0XEZvSFWslDYVoQCEhlkgMF8pOU
         0ZI2gANtn1QLaYSImFOJen43o9V6sta3vhjaFWoGL22W9eeteussTLSvEfUXyQQraCig
         V8Xjri3J0hb1P7E/hAerXRYKnmon5cwjPW04Sgr0UOTiQZe9TfdRBPMHuEPOePdNwutD
         4dOIooX8kuqPoMzAYLDhXW96J2B/CBroy3NbeVnfRv/CJ1cVZ1LhinOgSpLsDv4TVth/
         p67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455963; x=1737060763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HMFdHqbka7izRuN40UhAvy6hkpZnK617+IDz/TGNDE=;
        b=TsGISCJrl6rMSR7DW2UiVpY80HIgAPbq7IBNqH6jRiHzzdYrl4nNR4IFOlY1WCt6WG
         jfAvJtDL487lykFve1kqMbL9XfwxN47OUqiofkuRN7dg4g/X/g5oBpOX3hu82/ZAETXb
         RBuJ4JyhatYhnOK9t0k0g2mRafCBym4lv1kBAJ01useYgkNR0Pfu4U64qeZTyRI3x4x+
         bhWGzkJj98tmj/i+xUiTUG9m/Q3dMAR7UuO/to6g4YocNffGm3Im6uOMf7WjF6vHZdfC
         QNIO1qkOcvi7C6cdEcYluL57o2jbMta40k9L/ni5ghtQCFAnlXSQEIoNzrw2Rr8Jb9Ri
         A6EA==
X-Forwarded-Encrypted: i=1; AJvYcCWQvj1ydg0JBLTOBNYOUUgdrOgfKVUx2HvvkBda7IFaFiZqDs5yGVPEYJtgjN4rEoxPNvkekHA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCStj+hitVuMpAOulZjo4ei5F579y39LX8D31LH8sl00B9q21+
	AaocLQf2HVsq4UPhUvSmtujf0mVjc6ihWHDWNYwSoSAIVEBh2Ctl
X-Gm-Gg: ASbGncs7auDmbXIpj05mgWzh65A2QtSOTYjIWcncWSt62aWqzJCIG4C/M6QUTtJj68+
	EmW2I3+uE+X/sA1ORnV2jnhhx7MYrxnJUb0xMohyPYyUd5u2OOJWTlgQ3m4gJqIwMCLvM+ii3gn
	OU2YhNDT61F/tCpXaDD8ddDkPzcikgxhkSYuTWAe3LJtoPHfO6JGaHuu2OqeEXuQYt6enN1oVKG
	vkt4ugMR4/IkozxQ84hRK9HeXzhmTYG7WFPMV4V4R698d1E1yCHS0CMBckanMqemx4mFw==
X-Google-Smtp-Source: AGHT+IE2N0g2afqQmbpKEe4JDRouonFPw+VVQiG2IG9yRG16DPXEXTdIBmlslgVrCerWmyqV7Q2zWQ==
X-Received: by 2002:a17:907:97d6:b0:aa6:6c6b:15fd with SMTP id a640c23a62f3a-ab2ab6b52b8mr708177666b.20.1736455962526;
        Thu, 09 Jan 2025 12:52:42 -0800 (PST)
Received: from f (cst-prg-31-79.cust.vodafone.cz. [46.135.31.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b09a6sm103010466b.145.2025.01.09.12.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 12:52:41 -0800 (PST)
Date: Thu, 9 Jan 2025 21:52:31 +0100
From: Mateusz Guzik <mjguzik@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Nilay Shroff <nilay@linux.ibm.com>, 
	Yury Norov <yury.norov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-hardening@vger.kernel.org
Subject: Re: [linus:master] [fortify]  239d87327d:  vm-scalability.throughput
 17.3% improvement
Message-ID: <pep7tppcmd77ejaa47bhajc3uoy2q2n3cladgc4btdri4mth65@dqjulq2hx4l2>
References: <202501091405.a1fcb1ed-lkp@intel.com>
 <202501090850.F23EBEBC5B@keescook>
 <202501091236.E3EDA2188@keescook>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202501091236.E3EDA2188@keescook>

On Thu, Jan 09, 2025 at 12:38:04PM -0800, Kees Cook wrote:
> On Thu, Jan 09, 2025 at 08:51:44AM -0800, Kees Cook wrote:
> > On Thu, Jan 09, 2025 at 02:57:58PM +0800, kernel test robot wrote:
> > > kernel test robot noticed a 17.3% improvement of vm-scalability.throughput on:
> > > 
> > > commit: 239d87327dcd361b0098038995f8908f3296864f ("fortify: Hide run-time copy size from value range tracking")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > 
> > Well that is unexpected. There should be no binary output difference
> > with that patch. I will investigate...
> 
> It looks like hiding the size value from GCC has the side-effect of
> breaking memcpy inlining in many places. I would expect this to make
> things _slower_, though. O_o
> 

This depends on what was emitted in place and what CPU is executing it.

Notably if gcc elected to emit rep movs{q,b}, the CPU at hand does
not have FSRM and the size is low enough, then such code can indeed be
slower than suffering a call to memcpy (which does not issue rep mov).

I had seen gcc go to great pains to align a buffer for rep movsq even
when it was guaranteed to not be necessary for example.

Can you disasm an example affected spot?

Gcc has a bunch of magic switches to tell it what to emit in line, the
thing to do is to convince it to roll with a bunch of mov (not rep mov)
for sizes small enough(tm). What constitutes small enough depends on the
uarch.
