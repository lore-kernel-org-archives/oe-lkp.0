Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C31C02
	for <oe-lkp@lists.linux.dev>; Mon, 21 Nov 2022 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fZlVpl9vCeaK6U7Z7MahRQ+/uNq3FYPecQFtqw0ZqJA=; b=jeKMRORqkRQYm4N9cBg+1WE148
	kbhs/jDDkufSwKY2xI41Jk2ICPyGblnnDvgaoyTE7XRgIbagB+I6mrLPGh0Uzz7YXAf8Q6jx2/s6i
	hLzLIZWxAl7PVO9rC8d1wwkLtdCLXvfpP2875+iqtM9K5QiUzWa0Kf5e7jQ7hZAL9PAz1AhmuOq21
	YyXCSXrvTFeXUjz8qictA9iU4yYfZDyJTOyXIjJFoRAaevFoH+jFdltw2KzpSu245FPylP3JDZhcC
	ScWwmQEo+AFpTWRuOBCm7KvQGwBJXaA9lm+jnB7rau+3LLjpatZAMIZjTuOPrp1wmwO0LuMk++Nux
	XDN5OhxQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox501-0059zl-7f; Mon, 21 Nov 2022 11:30:05 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3EB2A30062A;
	Mon, 21 Nov 2022 12:29:57 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id EBD72203A8995; Mon, 21 Nov 2022 12:29:56 +0100 (CET)
Date: Mon, 21 Nov 2022 12:29:56 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [tip:x86/mm] [x86/mm]  127960a055:
 WARNING:at_arch/x86/include/asm/kfence.h:#kfence_protect
Message-ID: <Y3thNAR4AV8Lp1qZ@hirez.programming.kicks-ass.net>
References: <202211201642.b65c9d2f-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211201642.b65c9d2f-oliver.sang@intel.com>

On Sun, Nov 20, 2022 at 04:40:51PM +0800, kernel test robot wrote:
> 
> hi, PeterZ,
> 
> we noticed this is a fix for
> "[tip:x86/mm] [x86/mm]  b389949485: WARNING:at_arch/x86/mm/pat/set_memory.c:#__change_page_attr"
> we reported before on
> https://lore.kernel.org/all/202211061748.eb591682-oliver.sang@intel.com/
> we noticed it brought below issue which is persistent in our tests. FYI
> 
> 
> Greeting,
> 
> FYI, we noticed WARNING:at_arch/x86/include/asm/kfence.h:#kfence_protect due to commit (built with gcc-11):
> 
> commit: 127960a05548ea699a95791669e8112552eb2452 ("x86/mm: Inhibit _PAGE_NX changes from cpa_process_alias()")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git x86/mm
> 
> in testcase: boot
> 
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> +----------------------------------------------------------+------------+------------+
> |                                                          | 5ab815e377 | 127960a055 |
> +----------------------------------------------------------+------------+------------+
> | WARNING:at_arch/x86/include/asm/kfence.h:#kfence_protect | 0          | 15         |
> | RIP:kfence_protect                                       | 0          | 15         |
> | WARNING:at_mm/kfence/core.c:#kfence_protect              | 0          | 15         |
> +----------------------------------------------------------+------------+------------+
> 
> 
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202211201642.b65c9d2f-oliver.sang@intel.com
> 
> 
> [    1.269844][    T0] ------------[ cut here ]------------
> [ 1.270843][ T0] WARNING: CPU: 0 PID: 0 at arch/x86/include/asm/kfence.h:46 kfence_protect (arch/x86/include/asm/kfence.h:46 mm/kfence/core.c:235) 

Should be fixed by:

  https://lkml.kernel.org/r/41ac24c4-6c95-d946-2679-c1be2cb20536@intel.com

I think.

