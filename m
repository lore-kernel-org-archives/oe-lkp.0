Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745054A8FE3
	for <oe-lkp@lists.linux.dev>; Wed, 14 Oct 2026 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971930; cv=none; b=ls8jCfV3+4zEBiSc7+06VP9pJLgRmk9sZ1FtJI9uJ36F7vs5u/ousBWwU1m5OrFOQkHBt7Jw6iBeXk9IY+E9shRRliGtLsFD2/Z0U81OP0A07YzR4m5pW5cNhm4XQmmqzEHaMO/ksZdEQZuQVuiN7Zdqi2PICIlNW5AtXoTTcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971930; c=relaxed/simple;
	bh=BAQXLR2dkPzKchboXtcNoo/ogJj2WJd8NAUJtk9xOFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fc2N8hA7cgP7e6SFi3hHQkl2tj4FMIpOE+HU48WA0KZUxbEfYKLT/2eAvhw77C9c1/msMDvHLOrl/kH706oLfHg/bbA9xCBfMIpZFlvolRB80CpocaprBFk0Imb8AJjeEcedJ+b0SKZGpIS+DPXBNKU6ujtY7PAR4WV6o+6mtJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZHexvTz0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZHexvTz0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b042c0759so2943221f8f.2
        for <oe-lkp@lists.linux.dev>; Wed, 14 Oct 2026 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791971928; x=1792576728; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WG6+gwgE2I1qtYxzZ69xcwnm3jHk2auPi3T4llnIwQE=;
        b=ZHexvTz0wheeKSV+j1iAKqXcPN8gEIOTNxrBHhQa0QdA+0gE7RFuag7HTrYiF6rIt8
         i3EHsIGPeIuMWT3wcet3bFo5nmFLFMxjY4HTchNd1VC37n8SZqild/WQpEadTAC0c4FG
         3ZLjgghRnw7HDb04McSeUYiBX/GkmG8GTWreJaAtdcP5+kdzqqZBiqLfvQJGvPhGkVNE
         apYrs5BwABXW2C6TBR43NrRwNZc3q2RBb5DM6mujzRKhjrLRaprReY78zHcTrxrJKxxR
         ggdqm59jvJbST/R0NoG2Y1Sw+HI8EuRzTrtHakdQfbot/RHFlhOy1SRPJKLatFpHj5Xs
         /3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971928; x=1792576728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WG6+gwgE2I1qtYxzZ69xcwnm3jHk2auPi3T4llnIwQE=;
        b=HUtG1F0/uOIVKmr4I5jo6N6d24utsqJjlHG3M6fNRuUAZKfnYP9ahH6hJ0msI8EpYx
         48ZmBvrnB3sHTRufv9MkpIxKYnV5ySTVFUD1duOKMz0hkvBfp3v+52bXc0ZJmODU80tk
         U8R+Z2iFEh3qTdq2cYBLNeVFXKyRJ+yxFXzVISWn8i/O7SCYnzdTOMHe9ixy21+bTWWv
         zjpYC22fROSsPH1gHvWS2K2RxCq/BU1nNE6CWGwWzhmux+0owasnKlembYqau0KpJ8sh
         RQkEULOPMlKrnaxrd2JUVEjwfykwsBkDY6t2mMtVWzJf7r6kUBSL8VljJsw1zghvZ5i5
         V0JQ==
X-Forwarded-Encrypted: i=1; AKwUvBxb4CTFDrZTnlXSQOOFkaedgwN5TvpOEr5cyKS/rHjYmvnh4Evam0ywdFSNC4nJU32mixx7MA8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIIrYpxdbGN6RTQr8YoGGAQX3D89LQ+Eu1qqNsGwII7WR8QG0s3
	CYWRUw1ALGrMe6kT8mcZjAnilURJHFHSjxTDKaSUc2CFuRhOo1kLmTmwJyJui7iSz78=
X-Gm-Gg: AYBFou2ZEBELYNFfixt2Q4XBVyX027rjznsZitFRwbMyfkaMJKsem+ZlJMMfoB3Xea7
	wBl2e6KI09nuQtWKN21XpDOVs2BKSQtpJT3zes8pjf3rFjSLMq6gZM1GnZAm8SGPyWOKBTJACYy
	gaY1qDzud+k4OvTx+wQgcB+odnqB1+QREkF2WHR0OxIYUU6DWHUUA51tlTlViIO2NwO7BDItmDj
	KhKG/n4XomXo9Aw4JZJkKsbc0z0Q8LR9GUojqFF+AGioW0FZFwibj91c6GzEjv6+ViWzUDzacp9
	xgiepcdAxIPn5BjSExhuubIR9WqmXkP84UGxK5tNMjkjLjRkH0diKlzKe7RN8aMQzXJah4NwaTA
	5kgnf1dF3dMfp1IFkdWdO9qM9puzvRQsPCnC8avJQ4xi1p1/+nRPFJ+osqL36qBajRNSZf+t0uR
	jhQEEdBRgcXZH5Vj3KmlA8vRfdCzzSPH95Mgc4sYlwx5frM+57H1LJNL7SE7rL+hxnHdc3XVCD
X-Received: by 2002:adf:f94e:0:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48dbad0d4fcmr22286473f8f.57.1791971927711;
        Wed, 14 Oct 2026 02:58:47 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de09693c7sm13559825f8f.4.2026.10.14.02.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:58:47 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:58:45 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nbcon/reboot: Switch NBCON consoles into the
 emergency mode in emergency_restart()
Message-ID: <as9SVaRU7mEvcsVe@pathway.suse.cz>
References: <20261013154141.94016-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013154141.94016-1-pmladek@suse.com>

On Tue 2026-10-13 17:41:41, Petr Mladek wrote:
> When the system is going down a normal way, the NBCON kthreads are
> flushed and stopped properly via a syscore shutdown callback, see
> printk_kthreads_shutdown().
> 
> One missing piece is emergency_restart() where the kthreads are not
> stopped. It might be called from several non-panic code paths,
> e.g. sysrq-o, kdb_reboot(), or some watchdogs.
> 
> Fix it by explicitly entering the emergency (atomic) mode and trying
> to flush the consoles there.
> 
> Note that printk_trigger_flush() must be used instead of pr_flush()
> because the later is not safe in an atomic context.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202608061008.48a1e76e-lkp@intel.com/
> Suggested-by: John Ogness <john.ogness@linutronix.de>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

JFYI, the patch has been committed into printk/linux.git,
branch for-7.3-hotfix.

I am going to give it a spin in linux-next and send a pull
request on Friday unless any blocker appears in the meantime.

Best Regards,
Petr
