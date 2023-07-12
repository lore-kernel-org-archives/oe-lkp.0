Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E6200DF
	for <oe-lkp@lists.linux.dev>; Wed, 12 Jul 2023 16:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69A6C433C8;
	Wed, 12 Jul 2023 16:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689181181;
	bh=HQtXkMg12Bx/r1+2FzstJ+bpGVWpL35U0D2HToug0qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TbFnCeQ0k4sYSwBow+wy/0KN6BCCfYiinHy1ICWWBFz4isQyRq/qWecNr861xSpdH
	 FCnO+FW37zj66bmQni5dmPYpoCchqBMJQwde5Co3EYHS9AWTWIFpgvNaP/gzFmfcLw
	 E59Wp7SItpJ0QExhK3b6kh30OgjJ1cq1h316Jd4D7qPtzOso2nJAsmZM+IL1fTCW8p
	 rjEGTxddmM/qTfTX2Q4jQ1w9aZUzSeEEK4YEA/NJ8Nv5IU7DCUchrtvo1QeVJtu8I9
	 DFV4vDFpyJZDGjX/65ZCv/iFdlJhWhN7FByCOcnBt+2gBJIGFE7fRsQFiBqmVaw6Ow
	 J/2Mkpzn9jsRQ==
Date: Wed, 12 Jul 2023 18:59:38 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Subject: Re: [linus:master] [rcu/nocb]  7625926086:
 WARNING:at_kernel/rcu/tree_nocb.h:#rcu_nocb_try_bypass
Message-ID: <ZK7b+vIJpOZhndbm@lothringen>
References: <202307111535.4823c255-oliver.sang@intel.com>
 <ZK1983kQCrN+zCqs@lothringen>
 <842683bc-5859-48be-8ca5-17a1e4bf3f39@paulmck-laptop>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <842683bc-5859-48be-8ca5-17a1e4bf3f39@paulmck-laptop>

On Tue, Jul 11, 2023 at 09:41:58AM -0700, Paul E. McKenney wrote:
> On Tue, Jul 11, 2023 at 06:06:11PM +0200, Frederic Weisbecker wrote:
> Heh!
> 
> The purpose was to see if this lock was ever contended.  I guess we now
> have an answer, which is "Yes, but rarely."
> 
> It looks like the victim commit increased the size of the ->nocb_lock
> critical section, just enough to make this happen sometimes.
> 
> Removing the WARN_ON_ONCE() seems appropriate, especially given that
> this only happens when shrinking.

Ok, I'll check that.

> Should we add something that monitors that lock's contention?  It is
> often the case that lock contention rises over time as new features and
> optimizations are added.

I'm not sure. Should we keep the current ->nocb_lock_contended based engine
to report contention somehow somewhere? Also does it behave better than our
current spinlock slow path implementations?

Thanks.
