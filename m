Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7AC4E4C37
	for <oe-lkp@lists.linux.dev>; Fri,  9 Oct 2026 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559630; cv=none; b=g89jn+O1jgnJi7FojDenBUUyi33ybTypiEiGCURnl+slGOlqIYGOeMoKz7f3oV+nPk3lJV+Z8xd1QgoMZbHv3RVjtShKNLQipASwwL4JTAN6ugOE7o24OfmAuXdrqPFmfYKyNudyqew+1pHEDhIqU7X1HCwvw55xGzDac6a6Fj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559630; c=relaxed/simple;
	bh=KwZjs64/rTuFe0HBKIyW10VbcdJrpzSWVqBnN+zFKDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJTEEsGlknDgxscftTfK1dVl5yZmTTPJhQsI/neGqJ4LnBimAdc0jJOnP9JVZW3MmtzDf+OAKoB2kxKAGQlPwaf4fAM1AqZMjXdirDQ1bjgKEGOchvZaXSiUCZjF30hPC1IpVqjVGBodawGdOydOtTILQRpVCtDG0Lddbw5EAVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ESge5MGp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ESge5MGp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso24640595e9.3
        for <oe-lkp@lists.linux.dev>; Fri, 09 Oct 2026 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791559628; x=1792164428; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=40jmrkdv9yTSAmdr7iVbfZIED5uVomcFd8fALW8sm6A=;
        b=ESge5MGpJIkBbUK0hsnPoq/FVvFC6FMHgFIPegLoY3H/MqaKAVaDNgKZeN9fFeRCu5
         KJETQRjy4Vhz2eXZre3KaBWRN01GzWRm6jIWA4VCB58wjk1bzLnfW63SP+0W+uHStMy/
         q3KjE7vZDLCDOOqns/jEH3mHG3R7mA0K5L/5VPqlDfTzZ2cHq4daTRBgp8lSjQJWRuVR
         hqJOz+puPJZ0BN8qNBXndIx4KWhj2R8nj+K/LkCeXST2rTsUMY2MvDai2zl5G7crwl4h
         snz2BEqpeExWurNpWucPxTcuU5LINPcZ5RT8PJqh/zro6WDxc3yo3OVm4E10MgHqfGPz
         eyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791559628; x=1792164428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40jmrkdv9yTSAmdr7iVbfZIED5uVomcFd8fALW8sm6A=;
        b=R5bFWy2vR+p/KvleAPEFGqNSj1Kq8h5dFmgB71GOiJQAqF4qitdNDu36EM+cAcU1mJ
         5GSJjIcuTbHpxSpJvUj0Mtu3Zqf2+Zp8RXG1AHpx66lulS4MsEUy419o8oKBIjzOoOZE
         5penkgS9Y+QdZQTG1CXMXVdZPaO5KsMs9Ld0G3NYOTFq42pY6qy2Jr+tNAmqxKJKiuUr
         1nFWz0tmeuKb7WvUvhhGR786pd/caKHUgD0XOPTgT5Upl/NGvfeFO1UcBiYOeThlcG2x
         bM3rRqAS+lpPoyv2ULgQqTEI778FY1zSJHW/Op5POhrX5yDzyoEetIB7CgjiqkMcTVUe
         hHMg==
X-Forwarded-Encrypted: i=1; AKwUvBz7W2nRSgt3UbxPzjzarWCFD7hh6Do7JDZwSIngBd46hAJ448yDdL+Td5XmUaD8oP6upzAk4Ic=@lists.linux.dev
X-Gm-Message-State: AFuF++n4eeuN78+SuDSg2Pq0WhtwQboRlnHXWtk4PEfdaQo1qHQ3FN3J
	KBia6ys3iTcu1WL/bJaDURjO7PjMtaU0FILAcxGAOZCktGrq3N9ZcIjNeGAGaUHIfo4=
X-Gm-Gg: AYBFou3ujhU0Z0is63q4hg44lP10tgmt8gdCMal+n0deCOE/t/bNcmZRWYqhWJLJ34Y
	QlRRrdLw2nYtY9U/H7oGj3Lxp/s2xVXYBO5huzp/b+ENSyuxe2X+UD38c2a6PcTpIsSek8W8l8s
	/QmV8MrD0p0O6XQhKS07uEmx6otO/3yNGPwyH4fe7ii/ZKcX8jM/N4LiVKqjIDJ/Cy25K+3tZcE
	YP6zyuAge4U5I65YjTZmIH/+Ma9YyTfPOA4BgKqMjIVnb5NB4bECjzVcx7lDiGaoeF+MfiZddbH
	EPoBbjbvsIYJ+Vhk/XCdL3dgl9umkpUBfEhapJlMDX9Uz3hJSHnL2hrKa2SMxmFIHae7S90kvbE
	PEOgpnmZGXI3IlTzCbl9CA0a53//o4uGxS55coFIgiNicsrI5DyqGuTHnh3g1jNG4dkXHFurgW2
	bU9R4E8bD6kMee+LfE4Q+RZaXV1sg3FkQGPLOF/MxhLHGCM135TCDyf6DSmxLWKGg/YX4jyg+nG
	KOBn7EY6zU=
X-Received: by 2002:a05:600c:8b78:b0:4a0:25d5:e853 with SMTP id 5b1f17b1804b1-4a18e4ddd99mr41776475e9.35.1791559627674;
        Fri, 09 Oct 2026 08:27:07 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea1fefsm75191635e9.11.2026.10.09.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:27:07 -0700 (PDT)
Date: Fri, 9 Oct 2026 17:27:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-serial@vger.kernel.org, oliver.sang@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nbcon/reboot: Flush nbcon consoles synchronously on
 reboot
Message-ID: <askHyBX6EPaMYnRt@pathway.suse.cz>
References: <20261008150852.8286-1-pmladek@suse.com>
 <20261009065152.udyfFRHx@linutronix.de>
 <asiu8orjDvRJMKuX@pathway.suse.cz>
 <87qzhzxatd.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzhzxatd.fsf@jogness.linutronix.de>

On Fri 2026-10-09 15:34:30, John Ogness wrote:
> On 2026-10-09, Petr Mladek <pmladek@suse.com> wrote:
> > Anyway, IMHO, we should switch to NBCON_PRIO_EMERGENCY for the post-running
> > states and flush the pending messages immediately. It is more
> > reliable. It is easy to find the locations when system_state() is set.
> > And all follow-up printk() calls will try the direct flush so that
> > they won't rely on an explicit flush.
> 
> We need to be careful about abusing CPU state in order to get certain
> functionality. We already have things in place to gracefully switch to
> atomic after shutting down the printing kthreads.

This explains why I see the messages even without this patch.
I wonder what is actually going on in the test.

The log contains:

</paste>
LKP: ttyS0: 256: LKP: tbox cant kexec and rebooting forcely
</paste>

I see this message in lkp-tests/bin/lkp-setup-rootfs:

<cat lkp-tests/bin/lkp-setup-rootfs>
lkp_reboot()
{
	local tbox_state="rebooting"
	[ -n "$1" ] && tbox_state="rebooting_$1"

	set_tbox_wtmp $tbox_state

	# Avoid get stuck in yocto minimal rootfs.
	# LKP: rebooting
	# [    8.124081] LKP: rebooting
	# # (shell prompt)
	is_virt && [ -e '/proc/sysrq-trigger' ] && {
		sync
		echo s >/proc/sysrq-trigger
		echo b >/proc/sysrq-trigger
	}

	start_reboot_watchdog
	reboot_tbox 2>/dev/null

	exit
}
[...]
	if tbox_cant_kexec; then
		echo_to_tty "LKP: tbox cant kexec and rebooting forcely"
		lkp_reboot "cant_kexec"
	fi
</cat lkp-tests/bin/lkp-setup-rootfs>

so, it ends with reboot_tbox which is:

<cat lkp-tests/lib/reboot.sh>
reboot_tbox()
{
	reboot
}
</cat lkp-tests/lib/reboot.sh

which is classic reboot. I am not sure where it expects the warning.
I actually can't find the code which prints:

<paste>
BUG: kernel reboot-without-warning in test stage
</paste>

I might need to try reproducing it with the lkp-test framework.
But it has to wait for the next week.

Best Regards,
Petr
