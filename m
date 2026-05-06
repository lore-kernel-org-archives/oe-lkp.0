Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1A2175A7B;
	Wed,  6 May 2026 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055787; cv=none; b=jXpP99R2TKkfJJmWRkYfNpctyF8G8cGuaBy+HdhKh51HperwgRwnVAhZZqHC4RZYpApcXPCtsy4M+d+fEFgndp/P2l9BW8nh2jLeqLAwrv0VPePb66hymiApoL3hEvGlRiepAWTuv9HgJakwkU4ti7FBEIsNbdysa3Pm4LfX7wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055787; c=relaxed/simple;
	bh=ixgM+73uIBkp1S28LY/VZ0Qqx2P8TA1cEZ6AteX/0nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7ZbDAmR+m/ajgLz6R6VKtCO9SgW62xvJkUgk4SWAv4vK5ReRh/rAiKxhLe02mBVy4aYAjUn23kYvOBk4baciyPFGoYHgrKkoozretRSKsZygfz+Mi2GnayvPuvG+WMWgIwKRssTBMDVecoysmaFMmgvhq1cxqDPsE0dqTS7p3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QY3Jn74L; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QY3Jn74L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LEdU4FknVaJhm2zIXmmkrzTgRhPCXSctaMF/L+NcIo8=; b=QY3Jn74LH92dJuHNF4RPWqg+YV
	XhOrhUcabynX1Gsn1YpGNXhD16yZRAqx6xqFlhopuXDw4BMOaf/YIHU/uhxQtLoNAZXHs7WQ7d8o6
	TbIsc4bdYMuug6kSU3YBarqsvyNq8WxqJ0ZbfrYpQkHhX3vvYbBQ8fZ+Q2sFRVT5MQ6GuiZW36b5E
	HGE3MRIiyWQwYgKAv4Nbf9aTH4yJWqeL2ZJeGMniV1LIfyTPdg58WRByoWYcN4JU4FCC6hnVq5mvI
	5abRBbuZ7A+EmHZMYNTNlBpA/E5W8lbAjgCtNqhKq+t8SPnf3OM+XtxxomxtE6GsfQ2w5wny5AGbr
	Q9h3PiDA==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXX4-00000000x3k-3FDW;
	Wed, 06 May 2026 08:23:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 96206302EC2; Wed, 06 May 2026 10:23:01 +0200 (CEST)
Date: Wed, 6 May 2026 10:23:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shubhang Kaushik <shubhang@os.amperecomputing.com>,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com
Subject: Re: [linus:master] [sched/fair]  4823725d9d:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <20260506082301.GI3102624@noisy.programming.kicks-ass.net>
References: <202605052050.8156b7e0-lkp@intel.com>
 <20260505152918.GY3126523@noisy.programming.kicks-ass.net>
 <afroZfHCMPrKFD01@xsang-OptiPlex-9020>
 <20260506074858.GB3126523@noisy.programming.kicks-ass.net>
 <afr3Hp/CgemmL3eY@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afr3Hp/CgemmL3eY@xsang-OptiPlex-9020>

On Wed, May 06, 2026 at 04:09:02PM +0800, Oliver Sang wrote:
> hi, Peter Zijlstra,
> 
> On Wed, May 06, 2026 at 09:48:58AM +0200, Peter Zijlstra wrote:
> > On Wed, May 06, 2026 at 03:06:13PM +0800, Oliver Sang wrote:
> > 
> > > we tested upon below commit:
> > > 0c0cf14be4909 (tip/sched/urgent) sched/fair: Fix wakeup_preempt_fair() for not waking up task
> > > 
> > > found most issues are still existing
> > 
> > Moo :-(
> > 
> > > =========================================================================================
> > > compiler/kconfig/rootfs/sleep/tbox_group/testcase:
> > >   gcc-14/i386-randconfig-2006-20250804/yocto-i386-minimal-20190520.cgz/1/vm-snb/boot
> > > 
> > > 9fe89f022c05d99c 4823725d9d1d9cc5b36647e0cb8 0c0cf14be490975a7431e9d49fc
> > > ---------------- --------------------------- ---------------------------
> > >        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
> > >            |             |             |             |             |
> > >            :499         13%          64:499          5%          23:1001  last_state.booting
> > >            :499          6%          29:499          3%          13:1001  dmesg.BUG:kernel_hang_in_boot_stage
> > >            :499          7%          33:499          2%          10:1001  dmesg.BUG:workqueue_lockup-pool
> > >            :499          0%           1:499          0%           1:1001  dmesg.EIP:_raw_spin_unlock_irqrestore
> > >            :499          1%           3:499          0%           1:1001  dmesg.EIP:finish_task_switch
> > >            :499          0%           1:499          0%            :1001  dmesg.EIP:handle_softirqs
> > >            :499          0%           2:499          0%           1:1001  dmesg.EIP:lock_acquire
> > >            :499          0%           1:499          0%           2:1001  dmesg.EIP:lock_release
> > >            :499          0%           1:499          0%            :1001  dmesg.EIP:on_each_cpu_cond_mask
> > >            :499          0%           1:499          0%            :1001  dmesg.EIP:rcu_preempt_deferred_qs_irqrestore
> > >            :499          1%           3:499          0%           1:1001  dmesg.INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
> > >            :499          3%          14:499          2%          10:1001  dmesg.INFO:task_blocked_for_more_than#seconds
> > > 
> > > the config used for 0c0cf14be4909 is attached as config-7.1.0-rc1+
> > > one dmesg from 0c0cf14be4909 for dmesg.INFO:task_blocked_for_more_than#seconds
> > > is attached as dmesg-0c0cf14be4.decoded.xz
> > 
> > Do you have a URL for that yocto image? git grep yocto on the lkp repo
> > didn't immediately find me one, and I don't appear to have it in my
> > .lkp/cache either.
> 
> it's here:
> https://download.01.org/0day-ci/lkp-qemu/osimage/yocto/yocto-i386-minimal-20190520.cgz

Thanks!, however I'm not seeing boot fails.

I use:

qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 8 -m 8G -device e1000,netdev=u1 -netdev user,id=u1  -serial stdio -monitor pty -display none -append "earlyprintk=ttyS0,115200 force_early_printk console=ttyS0,115201 debug systemd.log_level=info sysrq_always_enabled ignore_loglevel nokaslr kgdboc=ttyS0" -virtfs local,path=$PWD/,mount_tag=tmp,security_model=none -kernel i386-build/arch/x86/boot/bzImage -initrd yocto-i386-minimal-20190520.cgz

and have booted the thing at least 10 times now, each time landing in
the yocto login without issue. Is there anything I'm not doing right?
