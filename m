Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25A651EE01
	for <oe-lkp@lists.linux.dev>; Tue, 13 Oct 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906138; cv=none; b=U0f3CywoaRN1Va+HFqhxw29GTMc9D6pvWxW/7ucEFqEv6KkSaPXEav1x9+kPs+1k+EeCz8RJFTSm+CIy1YfPmZB/EomwPU2cDCZghgUHu3gHxSKRZOH4WF343BGCmqCNIYkm5Rt+3GPvveMeOUgXojuWRa5EzJrD4B3Zaj5zpKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906138; c=relaxed/simple;
	bh=PLKNnY0shbYu+toZqyW6ELKsVMoYRKE9gJsmG7TyZxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W4yTWL7VuWYV6GcD9qTeRI4TWajXA4tdMEWV8XuLYSSWvMy9tzZXnBWdlCnzss6fG3eBJYnx5nJ82ELOOrqyMn2g9RKYmUuLgpZXKQ/aXrIlFDjBBLY1Q01LBmrjzh4e03WYnoiDMnkHLs9t8PULVl7GIcjv8+N6UWa6EqcDnrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JBPudKTV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JBPudKTV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso269225e9.1
        for <oe-lkp@lists.linux.dev>; Tue, 13 Oct 2026 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791906135; x=1792510935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0o562vnHxAoJu9TkgWw6HND2WtwAaL2hGXNC5e9IZzI=;
        b=JBPudKTVdXyWEWnMrmEUpwaNUuyiHVVA/fEpzEMt9li/KnCMYRbaFJ1h7vYI91qEUo
         IBd43l2BNt+UtDMXbsbjIdo5XIxy0/6sx7tSQWeUUYiXttzu6QpijxwYoJaTzBmKmBCq
         888ycI4dr6teW7Ve56J3SX7d7n8//1jDpDMpqYA4FaiFFw+NSHKTk8By6xYQfItr3K6/
         pjix6TqrLlbFmZ8tHnoRPV/1CkmHB5ZzgtulmG7PZPwMEGyg0q4rkffjdOjRBPNVdMYK
         GMMgfWG8TJ9z3WwWg3IZFQ6BlIvwNQxRq3G4z6pOT8RfteNoppd9vxh3ZeodnY9g/x6n
         /Uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906135; x=1792510935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0o562vnHxAoJu9TkgWw6HND2WtwAaL2hGXNC5e9IZzI=;
        b=PlXH9y7vPUI0PSIiP7ruGjdjLQea8fwe6tVanxPmP6o89XILJJWQ3N1ULk+QG4qRh8
         PnVf7E01WAYKZZpTX89d21ueuepvaO5cSY+e2TRUw77RkvRO6sDFslghR/P/z764uWi2
         dVnLkMc/oeVOUqoM0K7q2//R+GcGlFiY+Vj6Hf3HCQynhk2vHzWrMbTwvf8ha9Hm7L6k
         mVtUpnjsCkh7zPliqOVkNq3u9RO+bFyWg3qE4+pB3tXQQQtHG1ts4P73FdrtUJSt0Na0
         6sBspL8X5icKFQUWG+wxIFcjui3X7fT8w3GvJ5A2hoUeAsBEtEj4rIO+miqdnr6pk+Ej
         o2sg==
X-Forwarded-Encrypted: i=1; AKwUvBxGQLcKlhhzPQv8dBgJCVhNZhnmuo7QMGhrdkwq9sLgqnXMO3yobMq3YzTqoP4sfVIUwIxLxQI=@lists.linux.dev
X-Gm-Message-State: AFq9FYJgvxHjLRUgc2ffRZ6fX+ZfuceUhquWNW6wIyqvh0NUrHZfo4k8
	dffJd2jO21DZs2ysvycq7CZ4vUHbKML3grbUIGZSnOKahf7QZSHSwjAXAAZeKoWd46c=
X-Gm-Gg: AYBFou078l4n1w/HpVPVEc1PzTV1cLD8/Xlxn9k47xOgvNXMN+28O9e29qwSb1K2DDG
	9Rlq18F1r839bcKZ9MsyKO+mDtyK/rlcmPmq8+E2PyYvMh1J/bFRSBG1loCncVbGofklzJrw1g4
	Ype7kIhkhmN6R3d0xZwX4pSoDYWc2jOLf6wXvoxYS3lYa3EmQhH0SUSU7hfoSLADBoYDW4K6p0I
	MOeJtDh0zJ0Qb2gKmCLlwGI2qDToLMLH/u+obiP65ReRQiZPq8/izNQulqodefQlEZd9AwESB+p
	jumk4vKNEAkuQiH2Hy1MJuhS+NdTI1o3jZQzZFAps/qQYQs5Fsunp14oWchT3SFvWWbJdRDT77W
	F855r2KNYEL/uRGv6ZBKx9Ta+GflCPaKwgE0887O5zALCsZYv4coSRLZlQ67/m4y/eGD1JSm4hs
	ssULO/nhIKHiX8Iq9Ofejp2KOKJC1EhzL486beApAW9wZQz0vDstLK6Uh78fH9xlXvYYVKbaV9n
	fk9rKrtqto=
X-Received: by 2002:a05:600c:4e89:b0:4a0:22d5:908c with SMTP id 5b1f17b1804b1-4a18e4a4976mr278830225e9.12.1791906131800;
        Tue, 13 Oct 2026 08:42:11 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm464244575e9.4.2026.10.13.08.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:42:11 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v2] nbcon/reboot: Switch NBCON consoles into the emergency mode in emergency_restart()
Date: Tue, 13 Oct 2026 17:41:41 +0200
Message-ID: <20261013154141.94016-1-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the system is going down a normal way, the NBCON kthreads are
flushed and stopped properly via a syscore shutdown callback, see
printk_kthreads_shutdown().

One missing piece is emergency_restart() where the kthreads are not
stopped. It might be called from several non-panic code paths,
e.g. sysrq-o, kdb_reboot(), or some watchdogs.

Fix it by explicitly entering the emergency (atomic) mode and trying
to flush the consoles there.

Note that printk_trigger_flush() must be used instead of pr_flush()
because the later is not safe in an atomic context.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202608061008.48a1e76e-lkp@intel.com/
Suggested-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
This is a 2nd attempt to make sure that NBCON consoles are flushed
during a shutdown.

Changes against [v1]

  + Handle only emergency_restart() where the syscore shutdown
    callbacks are not called. [John]

  + Explicitly enter nbcon emergency mode instead of relying on
    the system_state variable. [John]

  + Reworked the commit message completely.

[v1] https://lore.kernel.org/r/20261008150852.8286-1-pmladek@suse.com
---
 kernel/reboot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index d177d89fcc33..5b9691f45f5f 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt)	"reboot: " fmt
 
 #include <linux/atomic.h>
+#include <linux/console.h>
 #include <linux/ctype.h>
 #include <linux/export.h>
 #include <linux/kexec.h>
@@ -94,6 +95,14 @@ void emergency_restart(void)
 {
 	kmsg_dump(KMSG_DUMP_EMERG);
 	system_state = SYSTEM_RESTART;
+
+	/*
+	 * NBCON kthreads won't be flushed and stopped properly in
+	 * the emergency restart. Move them to the atomic mode.
+	 */
+	nbcon_cpu_emergency_enter();
+	printk_trigger_flush();
+
 	machine_emergency_restart();
 }
 EXPORT_SYMBOL_GPL(emergency_restart);
-- 
2.56.0

