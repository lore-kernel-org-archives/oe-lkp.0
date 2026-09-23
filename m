Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9563515C2
	for <oe-lkp@lists.linux.dev>; Wed, 23 Sep 2026 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177857; cv=none; b=fWg1SVmklL5p8/ZzMUX29Mb7LKiM5lgV665zdVD80Ii5KohXq51bsnGfokryTJygE3CiIHi00Stxchb9lVaQyqFnY0kiTaVSQFvC8/H0LRhIbXoqvzWqU4c4Er9liY2BDgDoKce3OSTtVy3b5SvfziFNBnjlgSXhsVB/SxwY0f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177857; c=relaxed/simple;
	bh=H0k2H15UTcibINA/qzL+aHve7f9Fx6bHVMUKuAIv2IU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o5mo6u6P77EeVawePZZzps6gIZfqftaHh1xbrWVc7Jcy4ZYqRssCOGNOoHewWT/rPMIurbra8lB8/lEI9Yy+156P3eD+vRsIMkmfl/+Hq/6XLllkfYJrhYBHXJF6dKCAYHVhKV22MkA44qSIfN0bGBIRk8GS1S7W5PgDQiRazsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=galxodlu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tQfYzBti; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="galxodlu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tQfYzBti"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790177853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTv1qcZFWwyyBd+ZPeUG69e6l+sNHIQ4eobuVtWPgtM=;
	b=galxodluCUqxQl5ay+UEvbhmdIu4Rrd8OuL9rvsRq0HbR9LfwrwpkRxqtsM+sd5kK6fh4k
	SIUoMRAF1+UBGvOu19v/EJ9OhxwnJKoadIoMWuVVhkGnqeVVH1w1EbDe63Eil4+szbEZve
	y3i2FArXhpW53ctxjJZISffMznOsWPJcIl5tgj4RhSQdiLElLtmKF8vcWytFE7zsm/lwHg
	uimaTbS5Ol64jfXckIHYi0FMRiCA7A1mPlYtdfNObCCTL8kmWSd00Q2JqbDxo5hQ9fOEMm
	VzDJ9ODtL7rIKIs9w8/QKtwzmZypcK5DARpQS9wMpyDWh7wCAdagvwdFY6jW8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790177853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTv1qcZFWwyyBd+ZPeUG69e6l+sNHIQ4eobuVtWPgtM=;
	b=tQfYzBtiUf7E46UxeZZAEIXNJbU3R7LX+fDCcIT7YPI1cWRApkKNC52El565QqxkubLtnq
	1UKH5OUw7+oyuvAw==
To: Petr Mladek <pmladek@suse.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-serial@vger.kernel.org, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [linux-next:master] [serial]  d353934702:
 BUG:kernel_reboot-without-warning_in_test_stage
In-Reply-To: <arPQwKbl7wM6IM3x@pathway.suse.cz>
References: <202608061008.48a1e76e-lkp@intel.com>
 <87ecek1c8d.fsf@jogness.linutronix.de> <arPQwKbl7wM6IM3x@pathway.suse.cz>
Date: Wed, 23 Sep 2026 17:43:32 +0206
Message-ID: <87bj9o0yir.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-23, Petr Mladek <pmladek@suse.com> wrote:
> The above patch handles only emergency_restart(). The similar problem
> would be even in other code paths where the system is going down.
> I think about using NBCON_EMERGENCY_PRIO automatically in all
> these states, something like:
>
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index d17704fe93ae..48446926dc50 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1446,6 +1446,10 @@ enum nbcon_prio nbcon_get_default_prio(void)
>  	if (panic_on_this_cpu())
>  		return NBCON_PRIO_PANIC;
>  
> +	/* Do not rely on kthreads when the system is going down. */
> +	if (system_state > SYSTEM_RUNNING)
> +		return NBCON_PRIO_EMERGENCY;
> +
>  	cpu_emergency_nesting = nbcon_get_cpu_emergency_nesting();
>  	if (*cpu_emergency_nesting)
>  		return NBCON_PRIO_EMERGENCY;
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index d177d89fcc33..776784a82499 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -8,6 +8,7 @@
>  #define pr_fmt(fmt)	"reboot: " fmt
>  
>  #include <linux/atomic.h>
> +#include <linux/console.h>
>  #include <linux/ctype.h>
>  #include <linux/export.h>
>  #include <linux/kexec.h>
> @@ -94,6 +95,7 @@ void emergency_restart(void)
>  {
>  	kmsg_dump(KMSG_DUMP_EMERG);
>  	system_state = SYSTEM_RESTART;
> +	printk_trigger_flush();
>  	machine_emergency_restart();
>  }
>  EXPORT_SYMBOL_GPL(emergency_restart);
> @@ -102,6 +104,7 @@ void kernel_restart_prepare(char *cmd)
>  {
>  	blocking_notifier_call_chain(&reboot_notifier_list, SYS_RESTART, cmd);
>  	system_state = SYSTEM_RESTART;
> +	printk_trigger_flush();
>  	usermodehelper_disable();
>  	device_shutdown();
>  }
> @@ -305,6 +308,7 @@ static void kernel_shutdown_prepare(enum system_states state)
>  	blocking_notifier_call_chain(&reboot_notifier_list,
>  		(state == SYSTEM_HALT) ? SYS_HALT : SYS_POWER_OFF, NULL);
>  	system_state = state;
> +	printk_trigger_flush();
>  	usermodehelper_disable();
>  	device_shutdown();
>  }
>
> Note that it would use NBCON_EMERGENCY_PRIO even in SYSTEM_SUSPEND
> state. But I think that it does not have any real effect because
> it seems to be done after the consoles are suspended. at least
> in hibernation_platform_enter().

And we transition to atomic printing for suspend anyway if
"no_console_suspend" is specified.

I am OK with this change. My only concern is that it is best effort. If
some of these callbacks are always called from task context, using an
_additional_ pr_flush() might make sense.

John
