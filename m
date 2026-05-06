Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7143DE425;
	Wed,  6 May 2026 07:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778053745; cv=none; b=J40c7kpbrauZ4V32Z240vPnTDmZgO6eGwcVCSOyaMbCXG6209mEoMU2kw7ySEblArfzGa5eZn/g1D958qfYzjSJ/B0SwJ30IpA59tDT48AhzBTRoM8uu2BU9PS8UyP3l+4tc9RtIWRJrSI7Hpfh8sejWmldRB/847pfRNN+qCLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778053745; c=relaxed/simple;
	bh=eSCofax4fQVm9o7orDOvcLNDwKd9+beRID2e8V7oTBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXjmFb95JAMKRPP/onSDn2ERIDo/BKXaOz6G1Cs1ClNZmWWDeZ5GC8Q4/b1sbXtr+ZKkjrSf7BxDBPqv5xVNYJWRMNNEDZmOE7Z6LS0702mKIbZ0yuI8S9g43OXVo7t+/a6JYTkmFmEod473QO6viCMVYYZiB96LvAiO6d5mOrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Fkd5lqCi; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Fkd5lqCi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DLMtTT11nzcO30vrizFhQdcvnrNobf+8crVI8uoakK8=; b=Fkd5lqCi28n9K7P80h67n0NMSr
	TtQ3y0Ya0DVW4QV9BorIiCbqjyEshoshUT8fEZptynkU6O8vzFC8qZrvE08SSqztoQp4mcAFk7JBy
	kt57tYsQZhoN3LXCgplEk+DknuCos6JhOCvu0Bhgm3xcob2r4h+bxrMrsIpW1daXCkhyNgMOvPg2H
	dn1xyc1pzE/H5d0BGpRUqqppl2fwgpHFlxbuumjeBHHlznzZ/JeyLCHWoxWkdHc/oGsV8kkhh9hFY
	XyAOXh0bMNNwLQYzrKaDYBkDA+jUJmAp6j04QXi6sBxqHtOzplEm/iIJcg4rec1r8199Rl9TGuhXe
	9FeR9uPw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKX07-00000000tNG-1A1L;
	Wed, 06 May 2026 07:48:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A0376303032; Wed, 06 May 2026 09:48:58 +0200 (CEST)
Date: Wed, 6 May 2026 09:48:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shubhang Kaushik <shubhang@os.amperecomputing.com>,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com
Subject: Re: [linus:master] [sched/fair]  4823725d9d:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <20260506074858.GB3126523@noisy.programming.kicks-ass.net>
References: <202605052050.8156b7e0-lkp@intel.com>
 <20260505152918.GY3126523@noisy.programming.kicks-ass.net>
 <afroZfHCMPrKFD01@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afroZfHCMPrKFD01@xsang-OptiPlex-9020>

On Wed, May 06, 2026 at 03:06:13PM +0800, Oliver Sang wrote:

> we tested upon below commit:
> 0c0cf14be4909 (tip/sched/urgent) sched/fair: Fix wakeup_preempt_fair() for not waking up task
> 
> found most issues are still existing

Moo :-(

> =========================================================================================
> compiler/kconfig/rootfs/sleep/tbox_group/testcase:
>   gcc-14/i386-randconfig-2006-20250804/yocto-i386-minimal-20190520.cgz/1/vm-snb/boot
> 
> 9fe89f022c05d99c 4823725d9d1d9cc5b36647e0cb8 0c0cf14be490975a7431e9d49fc
> ---------------- --------------------------- ---------------------------
>        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
>            |             |             |             |             |
>            :499         13%          64:499          5%          23:1001  last_state.booting
>            :499          6%          29:499          3%          13:1001  dmesg.BUG:kernel_hang_in_boot_stage
>            :499          7%          33:499          2%          10:1001  dmesg.BUG:workqueue_lockup-pool
>            :499          0%           1:499          0%           1:1001  dmesg.EIP:_raw_spin_unlock_irqrestore
>            :499          1%           3:499          0%           1:1001  dmesg.EIP:finish_task_switch
>            :499          0%           1:499          0%            :1001  dmesg.EIP:handle_softirqs
>            :499          0%           2:499          0%           1:1001  dmesg.EIP:lock_acquire
>            :499          0%           1:499          0%           2:1001  dmesg.EIP:lock_release
>            :499          0%           1:499          0%            :1001  dmesg.EIP:on_each_cpu_cond_mask
>            :499          0%           1:499          0%            :1001  dmesg.EIP:rcu_preempt_deferred_qs_irqrestore
>            :499          1%           3:499          0%           1:1001  dmesg.INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
>            :499          3%          14:499          2%          10:1001  dmesg.INFO:task_blocked_for_more_than#seconds
> 
> the config used for 0c0cf14be4909 is attached as config-7.1.0-rc1+
> one dmesg from 0c0cf14be4909 for dmesg.INFO:task_blocked_for_more_than#seconds
> is attached as dmesg-0c0cf14be4.decoded.xz

Do you have a URL for that yocto image? git grep yocto on the lkp repo
didn't immediately find me one, and I don't appear to have it in my
.lkp/cache either.
