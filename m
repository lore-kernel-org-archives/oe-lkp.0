Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF464B4864
	for <oe-lkp@lists.linux.dev>; Thu,  8 Oct 2026 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472763; cv=none; b=d767+KclcXlDLIQFfALm9NApeWFIuEsNnQ4rewX+GwWPGuooh1PGumoUOdb1n7yrmk8bU8V1avC75pi4iNOjyLlLzdf0mTWaR3jgbqyAliDpKFcx4Sf99RksKIEej9W+pdTmBIll+ohou8JC4X4kLac0q0P//DooXrUEs6Tq40s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472763; c=relaxed/simple;
	bh=zLocd8S6vsDfdJeNEGvGbpecc0pDzrIpUYS+HDvnbNA=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=k32wQLdGGnG97ILoXPHxFzo+km/jB9/FaOkiIyt4D3CxZvjSUlfW1+F81sjTi73zmlvVhQREh3zAjRYT03mkeu25EZx69c4YczY34EM/L8mo3IDA4SUbqp4ezRE0vS2CGdIqBGf5B0Tk0zWGmWEDPmJw0mOuGctJVwAXGnJO8WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=PordJEiR; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Q98Ooxbb; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="PordJEiR";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Q98Ooxbb"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791472743; bh=CBRBM8PtIaqj+scU0CJgr6o
	WaSZaep3EtWrSSJ42qAA=; b=PordJEiRd13ricSUvH/8HcU7GaJSI1X3/HVtATsEqSuR6d8h9N
	Cl0BnOXC3G11VXxuRf1vQoOrn4hytgPkcVwvoiad8bX9lgwVxTpbWjfxKUwEBpKO9Lwrv9ofPaZ
	H+T24o/TWFpRnDFhi2E8va98DcQ03UsHkykPbcEKzQDmAVdkcrtXdAKU8YgC93A4q9C5dktwfbA
	XJGGNB6J7+XBZSvFVeSwCo/klXeOl5T15f3M2+Hg+1Nn8KHMFGDCwU8tiIouOPZ5ITy3W1t5fj1
	JS+wNmVOmS5FHQuIYPTH9rbDX4ja/6LYKqFxNUZMFDfuCvjqKM/lmAgeOKRbWA9hIQg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791472743; bh=CBRBM8PtIaqj+scU0CJgr6o
	WaSZaep3EtWrSSJ42qAA=; b=Q98Ooxbb6gq5Sugu9VxfJ02jdmt3CSZK36OxBijB4HrsXbcQSy
	TH3JyXHixFxzdAqHAvwU9HHAH2W6oQuFmNDw==;
Date: Thu, 08 Oct 2026 16:19:03 +0100
From: Bradley Morgan <brads@mainlining.org>
To: pmladek@suse.com
CC: bigeasy@linutronix.de, brauner@kernel.org, john.ogness@linutronix.de,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, lkp@intel.com,
 oe-lkp@lists.linux.dev, oleg@redhat.com, oliver.sang@intel.com,
 ptikhomirov@virtuozzo.com, rostedt@goodmis.org, senozhatsky@chromium.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_nbcon/reboot=3A_Flush_nbc?=
 =?US-ASCII?Q?on_consoles_synchronously_on_reboot?=
In-Reply-To: <20261008150852.8286-1-pmladek@suse.com>
Message-ID: <CD188453-7954-45B3-8501-FE9574D5FF1A@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 8 October 2026 16:08:52 BST, Petr Mladek <pmladek@suse.com> wrote:
>NBCON consoles emit messages in a dedicated kthreads when the system
>is working properly. printk() tries to flush them synchronously in
>explicitly marked emergency context and in panic().
>
>Another situation where printk() could not rely on kthreads are the
>various
>reboot and halt code paths. They can be detected by the `system_state`
>variable.
>
>Let's default to NBCON_PRIO_EMERGENCY for the post-running states.
>printk() will automatically try flushing the consoles synchronously.
>Also do not rely on printk() and explicitly flush the consoles
>after these states are set.
>
>Note that suspend code paths have already been handled, see
>console_suspend_all() and console_suspend().
>
>Reported-by: kernel test robot <lkp@intel.com>
>Closes: https://lore.kernel.org/all/202608061008.48a1e76e-lkp@intel.com/
>Suggested-by: John Ogness <john.ogness@linutronix.de>

Hi, this looks good to me reboot.c ended! :)

Reviewed-by: Bradley Morgan <brads@mainlining.org>

>Signed-off-by: Petr Mladek <pmladek@suse.com>
>---
>Hi,
>
>ah, this somehow fallen through cracks.
>I am sending it as a proper patch finally.
>
>I am sorry I have been somehow too busy before
>the Plumbers conference.

That's ok :) I'm too unlucky as to not go to any conferences :c

>
>Best Regards,
>Petr
>---
> kernel/printk/nbcon.c | 4 ++++
> kernel/reboot.c       | 4 ++++
> 2 files changed, 8 insertions(+)
>
>diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
>index fb1b37741952..d8f8ec836eea 100644
>--- a/kernel/printk/nbcon.c
>+++ b/kernel/printk/nbcon.c
>@@ -1446,6 +1446,10 @@ enum nbcon_prio nbcon_get_default_prio(void)
> 	if (panic_on_this_cpu())
> 		return NBCON_PRIO_PANIC;
> 
>+	/* Do not rely on kthreads when the system is going down. */
>+	if (system_state > SYSTEM_RUNNING)
>+		return NBCON_PRIO_EMERGENCY;
>+
> 	cpu_emergency_nesting = nbcon_get_cpu_emergency_nesting();
> 	if (*cpu_emergency_nesting)
> 		return NBCON_PRIO_EMERGENCY;
>diff --git a/kernel/reboot.c b/kernel/reboot.c
>index d177d89fcc33..776784a82499 100644
>--- a/kernel/reboot.c
>+++ b/kernel/reboot.c
>@@ -8,6 +8,7 @@
> #define pr_fmt(fmt)	"reboot: " fmt
> 
> #include <linux/atomic.h>
>+#include <linux/console.h>
> #include <linux/ctype.h>
> #include <linux/export.h>
> #include <linux/kexec.h>
>@@ -94,6 +95,7 @@ void emergency_restart(void)
> {
> 	kmsg_dump(KMSG_DUMP_EMERG);
> 	system_state = SYSTEM_RESTART;
>+	printk_trigger_flush();
> 	machine_emergency_restart();
> }
> EXPORT_SYMBOL_GPL(emergency_restart);
>@@ -102,6 +104,7 @@ void kernel_restart_prepare(char *cmd)
> {
> 	blocking_notifier_call_chain(&reboot_notifier_list, SYS_RESTART, cmd);
> 	system_state = SYSTEM_RESTART;
>+	printk_trigger_flush();
> 	usermodehelper_disable();
> 	device_shutdown();
> }
>@@ -305,6 +308,7 @@ static void kernel_shutdown_prepare(enum system_states state)
> 	blocking_notifier_call_chain(&reboot_notifier_list,
> 		(state == SYSTEM_HALT) ? SYS_HALT : SYS_POWER_OFF, NULL);
> 	system_state = state;
>+	printk_trigger_flush();
> 	usermodehelper_disable();
> 	device_shutdown();
> }
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
