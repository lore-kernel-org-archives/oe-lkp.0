Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFAA31DDA4;
	Thu, 27 Nov 2025 08:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232707; cv=none; b=bEtGvRF0VZBcdSJjDz0tCC/Y75a8pvPkFfWq43QmO7Hie4Q4lulUTwGAX5hM5LAEDg7Hy/ZcEEdJ8hkpMnW/Itcj2EsxPxsFQWtMAfTRpk171IRve4F1+hpC8EmS6jk7PLSdV4infIBx5EzYESBhSfDeaMzgxk+Ho6GS9qIPsXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232707; c=relaxed/simple;
	bh=dcUcxOFEzyb9BnOf+tR+HRtWmZtCZgk/Rfi9PUN1P5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1dmVUQNSc9MDzFeXEveSYoix8xAwlYVEng+AZ762Wmnnt2wzCqYSXKM3Sqh5Sl/255DfRG78Tz5vvHdLGAFZZMoIgQ42VjQ1XMqXl1Yhq0cXts94XS6KhSiw4wNH+ZWam3cc5DRFCeB9nStwDA55MlWrD6erLzQ++m4FaCrfrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=S4jPa+q7; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S4jPa+q7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vsPrttvPq54S6dwbftVa6WCZkjMAqLnpFC2FCMGJ8lk=; b=S4jPa+q7zPJBlhS+mPPbVRlTBs
	WCSu24NpO7Dr+lfTFGiavfoH81k4V1n3G8lGfunPELZOn2ymYMad2S1x/CLlIWWG3xi+RAgTf3xZV
	+d0xM70xpiCDKnnyKhpv2P+8TMckYfCSZmW9MpTGFmOa+VVdMJhpNr8U0NjSpu40gYp1IpgcEiH5K
	3+RL8LbkphEECVpQHgIHWI0FQGuD4akXXUE+AxG9ShuokcoxKelerCbQ8tuH54ywS0tjw+uAVLSDq
	o56A6zhNRd9P3BiQTpWhbhY3ny8sVQ2sgiYUGduC5M8NapigrIA+sLTZr0xXvrWQ8xelYmlQBVBP9
	jWnYrAdg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWeU-00000009hGk-39QF;
	Thu, 27 Nov 2025 07:42:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AB915300342; Thu, 27 Nov 2025 09:38:15 +0100 (CET)
Date: Thu, 27 Nov 2025 09:38:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>, Chen Yu <yu.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Mohini Narkhede <mohini.narkhede@intel.com>,
	aubrey.li@linux.intel.com
Subject: Re: [tip:tmp.tmp] [sched/fair]  eb2db043ab:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <20251127083815.GZ3245006@noisy.programming.kicks-ass.net>
References: <202511271605.bd46ddc3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511271605.bd46ddc3-lkp@intel.com>

On Thu, Nov 27, 2025 at 04:35:37PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> 
> commit: eb2db043ab3a28ae76800f2a57e144420800d56d ("sched/fair: Skip sched_balance_running cmpxchg when balance is not due")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git tmp.tmp

Not sure what this branch is, but tip/sched/core has the fixed commit.
