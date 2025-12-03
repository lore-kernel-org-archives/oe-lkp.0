Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C65322A0A;
	Wed,  3 Dec 2025 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764782181; cv=none; b=o5oVIAcobXeJ+CBTmq7AykuZiaUr5hTncmV7ixdxTP4SZaYmY20HHyYV7tkBrzv8P7W81NhSuosiYOB7XEDmQuihdUWmNevhCtJazMnW841ndYz8VpsoYx0Jo7MMiBMDlGCbugPc96spMKUl/1EAhpK7/DmE9YQ84Of3ovtoEhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764782181; c=relaxed/simple;
	bh=ZDhl8eY/1xn/6xcrEAlM2dedGLPIBg6Rgcbj4tELf0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ku0MyPYiraEJ8GOLxpD8NoP0Rihx1u/6F9/76Bz74UyI36dpGMcfFMm7UXzS7k1Chr2eQeDsxw5KZW2p0WlLfUJer+pEgHjbr+mF9K/I3g0aGbA8MWhQzdg+z0GTGWP+3pDLobvGadtfQ4W5kJGBl2+il2VfBKdoVSMkYtPWHTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/ZmF08h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/ZmF08h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37215C4CEF5;
	Wed,  3 Dec 2025 17:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764782181;
	bh=ZDhl8eY/1xn/6xcrEAlM2dedGLPIBg6Rgcbj4tELf0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/ZmF08hyjcbG8+hY4PPKF6v2P4p5ccwluRuWm8WVqlPGKAIo2gMwkfTz+DQoZWuv
	 BiX1xytpbFVBo9EzW1wEKlPnu/AGPY4sPB9qV+GhTJVnEzaqZvF52fPfXngWS/IlXI
	 XDfFp+aYJUQzNCMGqR/v09hjy/gNJ6Nax30SEwztVRh/WtsamXfK+MtXQNMdGG+LHW
	 hgnfVxU1UVjm9/XXmfYJ8j349QLHgnrQ/F52TOXxBoytPpl4qdxnPq4LZi0X5k1bc9
	 LYpRcHPwoPBr83cO66BywX0ntJPXCZ9rqN8yvp6zYZwODwpq7xEA7kZtFGDI9mw61n
	 WQ7DIFdlsFREg==
Date: Wed, 3 Dec 2025 18:16:15 +0100
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
Message-ID: <aTBwXwE-hdphxCtN@gmail.com>
References: <202511271605.bd46ddc3-lkp@intel.com>
 <20251127083815.GZ3245006@noisy.programming.kicks-ass.net>
 <aSgU0IDhF4uam0JA@gmail.com>
 <aSj97AJbXnJvvyqK@xsang-OptiPlex-9020>
 <20251128093430.GE3245006@noisy.programming.kicks-ass.net>
 <aS51CHrrzE3_7vM9@gmail.com>
 <aS/enCbsTTlXiAEL@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS/enCbsTTlXiAEL@xsang-OptiPlex-9020>


* Oliver Sang <oliver.sang@intel.com> wrote:

> we do have some default pattern for branches to ignore:
> default_branch_denylist: (.*experimental.*|.*dont-build|origin/.*|remotes/.*|.*/orphan-.*)
> (https://github.com/intel/lkp-tests/blob/master/repo/linux/DEFAULTS#L5)
> 
> but we also support repo specific configurations. such like for tip:
> branch_denylist: auto-.*|tmp.*|base-.*|test.*|.*-for-linus|tip
> (https://github.com/intel/lkp-tests/blob/master/repo/linux/tip#L19)

That's useful to know, thanks!

> the "tmp.*" is just updated from previous "tmp-.*" to cover tmp.tmp
> (https://github.com/intel/lkp-tests/commit/acd36193a0dd2bbc1c6d4ef59dd2b33a2eece3e0)

Thank you for the change, and LOL, I *swear* I didn't name it
tmp.tmp just to break the pattern. ;-)

Thanks,

	Ingo
