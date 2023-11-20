Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EC01C6B4
	for <oe-lkp@lists.linux.dev>; Mon, 20 Nov 2023 14:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n+fIfGfZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5/kzGng8"
Date: Mon, 20 Nov 2023 15:30:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1700490640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pzHlHnI4SFnhkGX3Kin1WzRbq9IYRqP2MnYzoUAaEKI=;
	b=n+fIfGfZPUT6M5QKQE1AvyjiYdgDNROHEOMoqYVQDqSWlTVGf8c+hCpeEvPYQII+vROy4H
	UCyUspWnYDhs9jAJ/DQMOf6IBTBOKik1VbqvPkHmVDEnaYoy0RGKuh10rnf9PKibhjdhOI
	x0dImiE3CAYVImJ+UFNHNVOaj6VXNn4+OYAC15zPQTF0kY1jOlnGHLNUMklqbpPJaiDkq+
	hUbp0NgPh38H/91Jsa/HFM/1WW9tkqKVgZdBppc7p6xPsHikXqIz8UGnUc8CoSBH+hP/hL
	aNMTt2xuaLKvKcRpoeD23+xM9NGgiBU5+8Dvi12zlnSLrT5F8uKM2Fx2vKo0xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1700490640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pzHlHnI4SFnhkGX3Kin1WzRbq9IYRqP2MnYzoUAaEKI=;
	b=5/kzGng8ya+jY75vHP7fb2OixYhDJ/zjc6Q5INIdUJ9WDiHs3wHPTRiI53zK5Gz41N9VVi
	Ucst14fkHxRZ5rAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Subject: Re: [rt-devel:linux-6.6.y-rt] [printk]  78f4b59c6f:
 BUG:kernel_failed_in_early-boot_stage,last_printk:early_console_in_setup_code
Message-ID: <20231120143039.HvK0o_uj@linutronix.de>
References: <202311161555.3ee16fc9-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202311161555.3ee16fc9-oliver.sang@intel.com>

On 2023-11-16 15:43:38 [+0800], kernel test robot wrote:
> Hello,
Hi,

> kernel test robot noticed "BUG:kernel_failed_in_early-boot_stage,last_printk:early_console_in_setup_code" on:
> 
> commit: 78f4b59c6faa7afe24b973210151d4a82b5669eb ("printk: Update the printk series.")
> https://git.kernel.org/cgit/linux/kernel/git/rt/linux-rt-devel.git linux-6.6.y-rt

as in the previous report, it is the 32bit printk issue. Will be fixed
in next update.
Thank you.

Sebastian
