Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFFF1D529
	for <oe-lkp@lists.linux.dev>; Mon, 20 Nov 2023 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bOUzPHq3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7RXDpFml"
Date: Mon, 20 Nov 2023 15:26:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1700490416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXI49i6To3Vr/VehUOnq2ADvpNswt7q+vcDH6uWA0Os=;
	b=bOUzPHq3dXKV07IyY8kEBWBRG3uztDE39NH3YeDBKWesjxLbsmUwXN7NOIousYn9pH0YOz
	bxrLLjFcccU2epTqxaER9HvGXXOXVySdvUi4+aNQhGQcmm7PMSeSvBptqHpvyvb1fRWYRZ
	uGyHimIdUgS8lmRbfzQIzV/TBfGT32juSxUdlf5k/hWrAYXdE57rQAgzBt7YUKb7WRnPOb
	wYXZflNxruA2kANkeMlLHgLqubDg4QA/2orIkLFgN2tz6hvh7nMLe9Xn7e2YqdY8i+o4Ij
	6LaV5rSXgT9z5oZz8zs+ggPmbmVGAbS9+s8WJUSwykea2XY4Scx2iSE26I4Y7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1700490416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXI49i6To3Vr/VehUOnq2ADvpNswt7q+vcDH6uWA0Os=;
	b=7RXDpFmlN2rww9TEqmTIyP5uJPcanZ21KKKmoFqCOSGVwyKLvsMEHqa4KahobBQ9te0KkT
	8sghnsXqWwNY0UCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev,
	lkp@intel.com, John Ogness <john.ogness@linutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [rt-devel:linux-6.6.y-rt-rebase] [panic]  768c33033e:
 BUG:workqueue_lockup-pool
Message-ID: <20231120142654.9IyB0q_P@linutronix.de>
References: <202311171611.78d41dbe-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202311171611.78d41dbe-oliver.sang@intel.com>

On 2023-11-17 16:53:57 [+0800], kernel test robot wrote:
> Hello,
Hi,

> kernel test robot noticed "BUG:workqueue_lockup-pool" on:
>=20
> commit: 768c33033e41ad195a9304ebb183afb730d5ae98 ("panic: Mark emergency =
section in warn")
> https://git.kernel.org/cgit/linux/kernel/git/rt/linux-rt-devel.git linux-=
6.6.y-rt-rebase
=E2=80=A6
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202311171611.78d41dbe-oliver.san=
g@intel.com

It should be the printk issue on 32bit. It matches the statck trace
provided in the dmesg.xz file. I will add the tag in the updated
version.
Thank you.

Sebastian
