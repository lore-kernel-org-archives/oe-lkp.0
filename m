Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086C46A9
	for <oe-lkp@lists.linux.dev>; Thu, 27 Oct 2022 16:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HICjCe/T3KktXFKRv+wo+yHgKZxC3DJ5boYWFpCcesE=; b=ibo+HdQTm3+r0wK7uqOdAST2le
	gsw90CiCXIlAGkIzYEC7A+1vAxYVvC2H0hZ10bgepKdLD3/JvHNjHYDSLBj6+IMEOO2t04AEf1jU5
	lu5U0nhrME+intT5DAO17p3zcr7TRGet6GnYJ2BJhLU/oAH8PbQD7ZdsHHdw75fDQWPxqDqypniA2
	fTj5J2gsP69L25Yrd0GAmXLnost182Tc7hcAyZJFAw3ovutFVUEzk+DjqTdznsdJ2E+BrW0AIFxFL
	kvXKgp74xWaP05RzSk/0hHsCaffJDUb4wbrqJOGF1vL51uheP2Y1gdQ8hpRXL7tUPBTLBx0Q9kbfO
	u8asqKmQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo662-006uvv-BB; Thu, 27 Oct 2022 16:51:10 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5D75330008D;
	Thu, 27 Oct 2022 18:51:09 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 374FA2C64658F; Thu, 27 Oct 2022 18:51:09 +0200 (CEST)
Date: Thu, 27 Oct 2022 18:51:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Yujie Liu <yujie.liu@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	x86@kernel.org, fengwei.yin@intel.com, ying.huang@intel.com,
	fstests@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: Re: [tip:x86/core] [kallsyms] f138918162:
 WARNING:CPU:#PID:#at_fs/xfs/xfs_message.c:#xfs_buf_alert_ratelimited.cold-#[xfs]
Message-ID: <Y1q2/fdvXI67MRch@hirez.programming.kicks-ass.net>
References: <202210241614.2ae4c1f5-yujie.liu@intel.com>
 <Y1kDEmLeRA2UGeF8@hirez.programming.kicks-ass.net>
 <Y1kiuTIYobR4nexS@hirez.programming.kicks-ass.net>
 <Y1nobODPLUjcteJ0@yujie-X299>
 <2543dfb1-d9dc-0888-dbea-e420a19d732c@intel.com>
 <Y1qv3ku6ULHy8hOF@magnolia>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1qv3ku6ULHy8hOF@magnolia>


> However, I noticed that the callsite in the WARNING: message has changed
> from the usual 'asswarn' (which is the caller of WARN_ON) to
> 'xfs_buf_alert_ratelimited', which seems totally wrong since XFS log
> recovery doesn't touch xfs_buf objects at all.

Yeah; and I've meanwhile found more cases where it goes sideways.

I'll revert this patch and try an alternative approach. I'll post
patches tomorrow or something.

Sorry about this.
