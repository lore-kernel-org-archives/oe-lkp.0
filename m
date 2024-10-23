Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4790C1C9B71
	for <oe-lkp@lists.linux.dev>; Wed, 23 Oct 2024 17:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729705176; cv=none; b=H+tWsfCigV6SAxrXB/MKs9GTrAaQ0fh5abEtaw+ASnN6us+2F4jLisQSRthTTkLVXFB1DMyQ/FbOYPv0peSMfgF/Rysq4sAvmvGCePN7PCI5lSNnGwZj0fx83nEA6j7einzqGaAC6lLlozKAXizm9yA1E7iTTdEdLiQSRggssFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729705176; c=relaxed/simple;
	bh=Hi01OAOJDmxWrPbHj7eMTsvkCoVn1z+pxs6LbaghJlw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sDipZGCWMI3NUux6G0VMdrPFYR+y5XdA5lwkmPuVDmAufNwRjWtj2WRSuBhC58GDFFMQdd01wrggtKKc0wHo94H9rUA+xiVa1Nj9fokdiIRShWhQN+VPyMhOnkWgpxJH16afXj3KhqfFbS4AVZJZAvMzTq1wmvS/uRjs5uqq72I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=F3mcV2i5; arc=none smtp.client-ip=99.78.197.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="F3mcV2i5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1729705175; x=1761241175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c+clLEDqhpVnAQ/9JllL5Jgk73yPmpsY2D2x4Lyyp2g=;
  b=F3mcV2i5ObGMQD5WWmwI9dYMedgHFVw4WYdyD+6AsHP9jdOptnFWIBK3
   ayFrcJ0g2vbhRzszw8Cat+Nq+BAvrECSi9fBfuX2vJLQfA3lb8uJG1XPM
   sbG2xUUJpKWWyDXE2Xo920xOqMKoTmFlucFM61an6cYEcrgqINtYSEoNq
   I=;
X-IronPort-AV: E=Sophos;i="6.11,226,1725321600"; 
   d="scan'208";a="346063021"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 17:39:32 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:64515]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.62.162:2525] with esmtp (Farcaster)
 id bc0458b7-221d-4e04-ae32-84b104827060; Wed, 23 Oct 2024 17:39:31 +0000 (UTC)
X-Farcaster-Flow-ID: bc0458b7-221d-4e04-ae32-84b104827060
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 23 Oct 2024 17:39:31 +0000
Received: from 6c7e67c6786f.amazon.com (10.106.100.17) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 23 Oct 2024 17:39:28 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <oliver.sang@intel.com>
CC: <edumazet@google.com>, <ignat@cloudflare.com>, <kuba@kernel.org>,
	<kuniyu@amazon.com>, <lkp@intel.com>, <netdev@vger.kernel.org>,
	<oe-lkp@lists.linux.dev>
Subject: Re: [linux-next:master] [net]  18429e6e0c: WARNING:at_net/socket.c:#__sock_create
Date: Wed, 23 Oct 2024 10:39:25 -0700
Message-ID: <20241023173925.34267-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <202410231427.633734b3-lkp@intel.com>
References: <202410231427.633734b3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

From: kernel test robot <oliver.sang@intel.com>
Date: Wed, 23 Oct 2024 15:02:51 +0800
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_net/socket.c:#__sock_create" on:
> 
> commit: 18429e6e0c2ad26250862a786964d8c73400d9a0 ("Revert "net: do not leave a dangling sk pointer, when socket creation fails"")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master f2493655d2d3d5c6958ed996b043c821c23ae8d3]
> 
> in testcase: trinity
> version: 
> with following parameters:
> 
> 	runtime: 600s
> 
> 
> 
> config: x86_64-randconfig-072-20241019
> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +------------------------------------------------+------------+------------+
> |                                                | 48156296a0 | 18429e6e0c |
> +------------------------------------------------+------------+------------+
> | WARNING:at_net/socket.c:#__sock_create         | 0          | 23         |
> | RIP:__sock_create                              | 0          | 23         |
> +------------------------------------------------+------------+------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202410231427.633734b3-lkp@intel.com
> 
> 
> [   81.874092][  T849] ------------[ cut here ]------------
> [ 81.874427][ T849] WARNING: CPU: 0 PID: 849 at net/socket.c:1581 __sock_create (net/socket.c:1581 (discriminator 1)) 
> [   81.874997][  T849] Modules linked in:
> [   81.875214][  T849] CPU: 0 UID: 8192 PID: 849 Comm: trinity-c5 Not tainted 6.12.0-rc2-00650-g18429e6e0c2a #1
> [ 81.875701][ T849] RIP: 0010:__sock_create (net/socket.c:1581 (discriminator 1)) 
> [ 81.876000][ T849] Code: e9 19 fd ff ff e8 a3 16 d7 fd e9 4f f9 ff ff 41 bd 9f ff ff ff e9 b8 fa ff ff 41 bd ea ff ff ff e9 ad fa ff ff e8 83 95 9c fd <0f> 0b e9 72 ff ff ff e8 77 95 9c fd e8 62 72 12 00 31 ff 89 c3 89
[...]
> [   81.881295][  T849] Call Trace:
> [   81.881474][  T849]  <TASK>
> [ 81.881634][ T849] ? __sock_create (net/socket.c:1581 (discriminator 1)) 
> [ 81.881908][ T849] ? __warn (kernel/panic.c:748) 
> [ 81.882130][ T849] ? __sock_create (net/socket.c:1581 (discriminator 1)) 
> [ 81.882395][ T849] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
> [ 81.882655][ T849] ? handle_bug (arch/x86/kernel/traps.c:285) 
> [ 81.882910][ T849] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (discriminator 1)) 
> [ 81.883164][ T849] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
> [ 81.883446][ T849] ? __sock_create (net/socket.c:1581 (discriminator 1)) 
> [ 81.883725][ T849] __sys_socket (net/socket.c:1670 net/socket.c:1716) 
> [ 81.883995][ T849] ? update_socket_protocol+0x20/0x20 
> [ 81.884432][ T849] ? ftrace_likely_update (arch/x86/include/asm/smap.h:56 kernel/trace/trace_branch.c:229) 
> [ 81.885031][ T849] ? tracer_hardirqs_on (kernel/trace/trace_irqsoff.c:57 kernel/trace/trace_irqsoff.c:613) 
> [ 81.885310][ T849] __ia32_sys_socket (net/socket.c:1728) 
> [ 81.885863][ T849] do_int80_emulation (arch/x86/entry/common.c:165 arch/x86/entry/common.c:253) 
> [ 81.886413][ T849] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626)

I find this stack trace useless unless we have a strace log or
repro as syzkaller provides.

I should've suggested like below to make debugging easier.

This might be already fixed by Eric's vsock patch, but I'll post a
patch later.

---8<---
diff --git a/include/net/net_debug.h b/include/net/net_debug.h
index 1e74684cbbdb..5bcd9a18d00a 100644
--- a/include/net/net_debug.h
+++ b/include/net/net_debug.h
@@ -150,8 +150,10 @@ do {								\
 
 #if defined(CONFIG_DEBUG_NET)
 #define DEBUG_NET_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
+#define DEBUG_NET_WARN_ONCE(cond, format...) (void)WARN_ONCE(cond, format)
 #else
 #define DEBUG_NET_WARN_ON_ONCE(cond) BUILD_BUG_ON_INVALID(cond)
+#define DEBUG_NET_WARN_ONCE(cond, format...) BUILD_BUG_ON_INVALID(cond)
 #endif
 
 #endif	/* _LINUX_NET_DEBUG_H */
diff --git a/net/socket.c b/net/socket.c
index 9a8e4452b9b2..da00db3824e3 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -1578,7 +1578,9 @@ int __sock_create(struct net *net, int family, int type, int protocol,
 		/* ->create should release the allocated sock->sk object on error
 		 * and make sure sock->sk is set to NULL to avoid use-after-free
 		 */
-		DEBUG_NET_WARN_ON_ONCE(sock->sk);
+		DEBUG_NET_WARN_ONCE(sock->sk,
+				    "%pS must clear sock->sk on failure, family: %d, type: %d, protocol: %d\n",
+				    pf->create, family, type, protocol);
 		goto out_module_put;
 	}
 
---8<---
