Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B874C957B
	for <oe-lkp@lists.linux.dev>; Thu,  8 Oct 2026 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472157; cv=none; b=hO5a/0eAGvy1HKmKLtw6/THcowKUYej8cF9tspYRkRXAXwnv/4HhrlURTh05HPb8H0YQ9qNxIvf2sJfSeHxbvTjTfAG52PKwBwmDV0ED2n35etMEVLEbwVbiIJI1n4Hmne6lCz8kKzmm9kNzpIWWFDU5AIiSeKahVwRW6Ca+W4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472157; c=relaxed/simple;
	bh=DPLfbxW/sJQ6FCIIrRNk7iZhGqXjqTVidcV7RQr+caU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H/U4enHMpieluUlamFXCfeFSE90PZOgP8dAq3GxDA9OOA7W9aOQlZVQ5XwcNI6C2ldtHfqn1q8idHjd4EH1bM/kYG9XAsO8hMBgEW6CVGryGBv50d3HckYyaaVbXYzcR7wlgmETKwe6nleqSdHQn35DlmTD09asDy+S4hX0geyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eaoTS1vu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eaoTS1vu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-487049569b6so2226507f8f.1
        for <oe-lkp@lists.linux.dev>; Thu, 08 Oct 2026 08:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791472149; x=1792076949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZoYyHruaQfuFkMonTZBefQ9+t/8NjKFEa6jTKsN47Y=;
        b=eaoTS1vugfP211OaQ3JNOvnsWCEW121zyy2jMvp3yGqTKTQGY09iMYYdJng/ko//v+
         zh/V+WSKXlJVPteoHkWP5Jj3HCbdka7Z0G7Fh4U94+dQGLV04HbjK9juyT9lQeKtTOLH
         9DB+BMoOK8ssvTNZo0NgQz6vAhcxdXT4ENdNSvKOB9oTaOj/TJgnJmczLqCRiQcTC7NF
         o/vj0oYZmGUjzFk/J6ggxZW2pObO9FU/15Ldb3nz7jYpY0srPWd+JRHS1MIf1YMOJHEm
         022iIRmqVe55N111WNxH1/vqGuaXAx5sM8zYB1MN2sgB4raLjQDFBvpt+d2Tq+vSucue
         USqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791472149; x=1792076949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZoYyHruaQfuFkMonTZBefQ9+t/8NjKFEa6jTKsN47Y=;
        b=oHcYhpq+12C9fi57k2pC7pKobPsSTu2RK1TCufg7A2hbvAbgeAvYSX4ah2CJT6g6D5
         xrCuCOWXSE1emMkwzVBpOz02ZhJq88egERFIqmMEC5cIUgAvwx+hlCt+Jc9c03ixjF7I
         rny7Fl5J4FH+iJaVftkLqq28fCbBPypkfvrOtRzWnlYQ+pF4HoKZlR0gJiACoZRwpDN4
         Y6NoO/lJ92ppHlANSCmU05JuveGGkCBrXctzAa9gT6OpvMQqkP417meSU0fc53Hb4lSH
         rTKb2nSF+nCGD3w4fshJlzzBuYtWNqqzphYMb6LEfCFCBtp5e+hwE25zfmGg+NWg++Jq
         hc4g==
X-Forwarded-Encrypted: i=1; AKwUvByNIZk32FknK4hkMQHamzMtm8SN0sf34Cvk+fm87Pn0a0ctgKWwjMne3+F+l1MUCudYR617EwY=@lists.linux.dev
X-Gm-Message-State: AFuF++nG8QwLjROp3uotTvNV0NVMQTsNlYbTF5cI/Shr5njAaF9ZAHiI
	6e+XIDUxi42QEeGcEyFiwfEkPT2Xja0jaM+4tnzXvM1laoabtHR6XpDX2kUg+BfEmu4=
X-Gm-Gg: AYBFou3DauVvOl3MAys4jERdvPPdG6HA/zO+EWzMcF4pZhmFlyTfzkRb3qbAccEJ1RQ
	wktM6B75D0M5hnSZWdef61aJK6v7KSXvsPEg2+j/S378O2nR1vmIqY7LpE+Pu8jsjAHtDUdfNnP
	Pb2dqk+PqNu3KHomPnn3W5dFcFv2GXA4FI40oEYfWzpexS8hYdIklR9pL3h5yMNbamg3LhxUdX1
	BBtmvw/jXB9TyPXAVY6q5jOBZXGIqX+4qYp38y06471dojiEZP2PDre11vsATskEWK/6q1frnBz
	w1fWu2Vc3y/mGfsI14ALsOUi3mK1ZlQR1aE370MszZcUMi3S2yTL9qeXRtEgpDQihaHPkrPMU1W
	v7QAYj/tqHJubFhh+n4xCFWqhrTZ8vVxwO50xRh+eHjrymtwbyx4vE9eRwFGTjM6LuKEVviJaCe
	t2sTpGhvHBGITtBgYPIv2sT2k+jsGEy5GqXy6mU5QrK8gNOxZwX+44mXp8GxWnWGAMbWFYGa3J9
	0650gz8ros=
X-Received: by 2002:a05:600c:3f12:b0:4a1:6811:8d with SMTP id 5b1f17b1804b1-4a180310ad3mr106022705e9.11.1791472148744;
        Thu, 08 Oct 2026 08:09:08 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843b5f28sm82116835e9.12.2026.10.08.08.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:09:08 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	oe-lkp@lists.linux.dev,
	lkp@intel.com,
	linux-serial@vger.kernel.org,
	oliver.sang@intel.com,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH] nbcon/reboot: Flush nbcon consoles synchronously on reboot
Date: Thu,  8 Oct 2026 17:08:52 +0200
Message-ID: <20261008150852.8286-1-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NBCON consoles emit messages in a dedicated kthreads when the system
is working properly. printk() tries to flush them synchronously in
explicitly marked emergency context and in panic().

Another situation where printk() could not rely on kthreads are the various
reboot and halt code paths. They can be detected by the `system_state`
variable.

Let's default to NBCON_PRIO_EMERGENCY for the post-running states.
printk() will automatically try flushing the consoles synchronously.
Also do not rely on printk() and explicitly flush the consoles
after these states are set.

Note that suspend code paths have already been handled, see
console_suspend_all() and console_suspend().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202608061008.48a1e76e-lkp@intel.com/
Suggested-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
Hi,

ah, this somehow fallen through cracks.
I am sending it as a proper patch finally.

I am sorry I have been somehow too busy before
the Plumbers conference.

Best Regards,
Petr
---
 kernel/printk/nbcon.c | 4 ++++
 kernel/reboot.c       | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index fb1b37741952..d8f8ec836eea 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1446,6 +1446,10 @@ enum nbcon_prio nbcon_get_default_prio(void)
 	if (panic_on_this_cpu())
 		return NBCON_PRIO_PANIC;
 
+	/* Do not rely on kthreads when the system is going down. */
+	if (system_state > SYSTEM_RUNNING)
+		return NBCON_PRIO_EMERGENCY;
+
 	cpu_emergency_nesting = nbcon_get_cpu_emergency_nesting();
 	if (*cpu_emergency_nesting)
 		return NBCON_PRIO_EMERGENCY;
diff --git a/kernel/reboot.c b/kernel/reboot.c
index d177d89fcc33..776784a82499 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt)	"reboot: " fmt
 
 #include <linux/atomic.h>
+#include <linux/console.h>
 #include <linux/ctype.h>
 #include <linux/export.h>
 #include <linux/kexec.h>
@@ -94,6 +95,7 @@ void emergency_restart(void)
 {
 	kmsg_dump(KMSG_DUMP_EMERG);
 	system_state = SYSTEM_RESTART;
+	printk_trigger_flush();
 	machine_emergency_restart();
 }
 EXPORT_SYMBOL_GPL(emergency_restart);
@@ -102,6 +104,7 @@ void kernel_restart_prepare(char *cmd)
 {
 	blocking_notifier_call_chain(&reboot_notifier_list, SYS_RESTART, cmd);
 	system_state = SYSTEM_RESTART;
+	printk_trigger_flush();
 	usermodehelper_disable();
 	device_shutdown();
 }
@@ -305,6 +308,7 @@ static void kernel_shutdown_prepare(enum system_states state)
 	blocking_notifier_call_chain(&reboot_notifier_list,
 		(state == SYSTEM_HALT) ? SYS_HALT : SYS_POWER_OFF, NULL);
 	system_state = state;
+	printk_trigger_flush();
 	usermodehelper_disable();
 	device_shutdown();
 }
-- 
2.55.0

