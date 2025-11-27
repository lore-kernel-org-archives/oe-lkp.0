Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5542BDC3F;
	Thu, 27 Nov 2025 09:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234454; cv=none; b=SLhkdv2LzhHbr+6EYRb+1vTJBHMGiHHnMNW5w4g2vMV7iTw6dmxQkoO1LMvUm3iO///1/AWz0311luGQ+4A6MN8wLdYVpmvN01jCJiWqVnX8ncaAgreNxMswhwFjmmooVKp1Lap2hHPhiXVnZ3ieoF6WC+F02IdGZ60CwiL//q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234454; c=relaxed/simple;
	bh=Z52/7k9+A2YBkOQKb14XV6zLCoEtdoIlmGh2V3vDHGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsldeS/wZ0NZmENRkgOFnadLRTxYsiesgrpDiCY+S8pj4HRMC78QEMudULjP8n58CGx8refgXRs+pEWtKMPar6enkQ8E2JkzNQfadeQAwrxsDK5BxGsfs6UNI1OqQl3g8Sm1lUbszLVsSNpaMSohjwmSJGO+a5dFFeTifjXlKfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQtM2fAs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQtM2fAs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F01C4CEF8;
	Thu, 27 Nov 2025 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764234454;
	bh=Z52/7k9+A2YBkOQKb14XV6zLCoEtdoIlmGh2V3vDHGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQtM2fAsX9ZkFIYOHedFQ8o1oz8C6te0hrlOi7Ql05u8lhbEKUc2qolbTrT34Qvei
	 V+dAXT7siulddzODi1d0gsOvB31uh/pLN1pBuGd02YClKu6y8Yy+/0w9IEC0foV0WB
	 KCCbcOscRAfrr+zDPqv47FyF2S/AR2zdRypUcijVm3HhBH59QuEL/zS8jGQKSah7L2
	 4gnNGPs0ipUsgea4p9eEay/sW2w3DgtQ0mXPntVOoTOvLlt1qWxpDnX4KQX7lu+b6E
	 QFcYugUwjcl5nvyh4gBUa2VBRsL9SMcq2lOrPw1WGk7LTvprrTrhcIcyBc63I7P6B/
	 gA9UwZI0bcgZQ==
Date: Thu, 27 Nov 2025 10:07:28 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Chen Yu <yu.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Mohini Narkhede <mohini.narkhede@intel.com>,
	aubrey.li@linux.intel.com
Subject: Re: [tip:tmp.tmp] [sched/fair]  eb2db043ab:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <aSgU0IDhF4uam0JA@gmail.com>
References: <202511271605.bd46ddc3-lkp@intel.com>
 <20251127083815.GZ3245006@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127083815.GZ3245006@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, Nov 27, 2025 at 04:35:37PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> > 
> > commit: eb2db043ab3a28ae76800f2a57e144420800d56d ("sched/fair: Skip sched_balance_running cmpxchg when balance is not due")
> > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git tmp.tmp
> 
> Not sure what this branch is, but tip/sched/core has the fixed commit.

Not sure how the test-bot picked up this temporary 
branch and reported it despite it being gone from the 
repo, but the branch hasn't been in -tip for days.

This report can be safely ignored.

Thanks,

	Ingo
