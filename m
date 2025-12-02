Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B195292B2E;
	Tue,  2 Dec 2025 04:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764651560; cv=none; b=qbxNmY6o5O/+cDSqR2nqsVMIY5h5cxpY8w235OEyT26MbaB2kWQ6sWKSl1wPRdqRtQA64VaiRMqjV3CgTahIUgZa7vfr6T6HJKoYK0R5BiZh0ppj2awLPntYJAQkbDD+0AUVhahfjBTMwnofm7PxL5UlJnH8lkKlfMgl+9dh5oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764651560; c=relaxed/simple;
	bh=VEokD3H3x7i2jT2pMloy+8yUxATY/hd/4mwaN22zQ1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tis1XF/pFjl9+p0zyh6zByJIy18srgQG3zBaGa03HxJNYujYU4dYwjWx7TxkA1ytooUnrFCoMS2YXGQ6kqpD1cU3pMK48zn9PST0YtxMZTU/RPVjIFeqjQgbUL9nIL8Pkj3YL4HJHjt1YeExOEpizEGxhgMZyDkllwjMStMT07U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQrBfYwD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQrBfYwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A15DC4CEF1;
	Tue,  2 Dec 2025 04:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764651559;
	bh=VEokD3H3x7i2jT2pMloy+8yUxATY/hd/4mwaN22zQ1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQrBfYwDJN7rS+u/CXbthDpM6LDbD4hPlDmttei47POcq8OdYbBxDwC8A3eAKsJcz
	 znNvmS9aIgRtCB5NYB8dPbBHxLc/AtKhnyJXjgN7juvSSHsLMpGuDR35nW4pml8ize
	 IK6aGpGxS92+Vp+ojkiB7ABy/kZmXvsPakOaiJjoxzW5itOXVUEIvAm4VM8QOm7UHr
	 /J+Q84tnoIUGwqwFj+Aifvmk/BNKSS80qL9YpuyFQb9MO3sHCgTxWROHn+CJpclL9+
	 JiBL+uVkVIScbFcCDN844MOn9d5cCG52vRRbOWufCcaF9HBAYqJIDjokSPJeCzHRZs
	 GrFe5n3wZQnhg==
Date: Tue, 2 Dec 2025 05:59:13 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <aS5yIdQU-qCCpQiv@gmail.com>
References: <202511271605.bd46ddc3-lkp@intel.com>
 <20251127083815.GZ3245006@noisy.programming.kicks-ass.net>
 <aSgU0IDhF4uam0JA@gmail.com>
 <aSj97AJbXnJvvyqK@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSj97AJbXnJvvyqK@xsang-OptiPlex-9020>


* Oliver Sang <oliver.sang@intel.com> wrote:

> hi,
> 
> On Thu, Nov 27, 2025 at 10:07:28AM +0100, Ingo Molnar wrote:
> > 
> > * Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > > On Thu, Nov 27, 2025 at 04:35:37PM +0800, kernel test robot wrote:
> > > > 
> > > > 
> > > > Hello,
> > > > 
> > > > kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> > > > 
> > > > commit: eb2db043ab3a28ae76800f2a57e144420800d56d ("sched/fair: Skip sched_balance_running cmpxchg when balance is not due")
> > > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git tmp.tmp
> > > 
> > > Not sure what this branch is, but tip/sched/core has the fixed commit.
> > 
> > Not sure how the test-bot picked up this temporary 
> > branch and reported it despite it being gone from the 
> > repo, but the branch hasn't been in -tip for days.
> > 
> > This report can be safely ignored.
> 
> sorry for the noise. yeah, our so-called 'gitmirror' mechnism fetched the
> tmp.tmp branch about 10 days ago, then it merged into our hourly kernel to
> be running tests. so it's kind of 'stored' in our repo.
>
> since the bad commit caused crash issue on various test machines, we made out
> the report, but missed the check of whether branch is still existing remotely.
>
> we will refine our code/process to avoid this kind of meaningless report.

Thank you, much appreciated!

	Ingo
