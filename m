Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22961DF996;
	Wed, 29 Jan 2025 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169626; cv=none; b=ialzpxlMqv4jB+jXx680iSzq/Av7GYtxNCT/fAP92TP3NHd/XYtkqfN2Lr6RMyduXuPV5RaXb1ODgo1pFCH6tnzqFOEncUAWyv4K1OpO1QqVvqLvszxWg2Fp0agvvDng/wt3vpjlE5FQsF53tuidzN8zCJeKnHF2fYw39lsr3ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169626; c=relaxed/simple;
	bh=2kaqo0lUodHy9a3uSsqXWfDclGZS13FnTwgsOvsnMYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHbWuEg1TYZ+kh2R4+VqJcsU+XVoMC2rEyZrL4t1gTZpm+1b6RVTG7TIIp1EwnvGKTiKt4UnzM8Bq1eu3RBkgXdl1ZvHC5Eo1tFdIOFyYHOW94MhrpeWqfK+cDtn8XHkhyOqq8zQpNCfnyHubSQ11zpu+KXgLXklAO2wMB1Tvio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rV5v/CA7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rV5v/CA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9911C4CED1;
	Wed, 29 Jan 2025 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738169626;
	bh=2kaqo0lUodHy9a3uSsqXWfDclGZS13FnTwgsOvsnMYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rV5v/CA7NRwaQTzeOohZXoP03bGhBH+ks2zz0x/TeWVWLWlW6DXbrhwWmRC0whioA
	 HBU5hcpGwQU6r1oK7IB42+nmk5V3+s2cnLShKeigje2Pt9VnsYy14Hkl+VoXMRN0s2
	 RMWb9vpMoEgB7nevucyE+hz8VXJHzj5VFQNbBnpV6NDQAWQb5norxWzwqx9I1JaZ4z
	 1Y8kGMbkD/gmtic4LUNEZhkmIRrUPBbmbx5RuADgLwzwWMYmYskIItCfT5HsjMnqH2
	 5OaWXm2fhJB2TVxqsNvUKRNkRM88RnZiBUVni91v/EkKeK/LlK2BKM4EcoSwjpy3Tv
	 nbMHufUAruR8g==
Date: Wed, 29 Jan 2025 17:53:43 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Peter Zijlstra <peterz@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Rientjes <rientjes@google.com>,
	Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mel Gorman <mgorman@suse.de>, Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>,
	Zach O'Keefe <zokeefe@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
Message-ID: <Z5pdF1w9Lcwpdixp@localhost.localdomain>
References: <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
 <20250128132847.GB505@noisy.programming.kicks-ass.net>
 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
 <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
 <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
 <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
 <20250129105920.7a4bffa1@fangorn>
 <Z5pTZ0XLFzfM5dic@casper.infradead.org>
 <488401565cac6b5f9e3232d0ca481055876c919b.camel@surriel.com>
 <05da0ae9-073e-4578-b65c-f837c28eead8@paulmck-laptop>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05da0ae9-073e-4578-b65c-f837c28eead8@paulmck-laptop>

Le Wed, Jan 29, 2025 at 08:36:12AM -0800, Paul E. McKenney a écrit :
> On Wed, Jan 29, 2025 at 11:14:29AM -0500, Rik van Riel wrote:
> > On Wed, 2025-01-29 at 16:12 +0000, Matthew Wilcox wrote:
> > > On Wed, Jan 29, 2025 at 10:59:20AM -0500, Rik van Riel wrote:
> > > > Below is a tentative fix for the issue. It is kind of a big hammer,
> > > > and maybe the RCU people have a better idea on how to solve this
> > > > problem, but it may be worth giving this a try to see if it helps
> > > > with the regression you identified.
> > > 
> > > Perhaps better to do:
> > > 
> > > +++ b/mm/page_alloc.c
> > > @@ -97,8 +97,8 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
> > >   * On SMP, spin_trylock is sufficient protection.
> > >   * On PREEMPT_RT, spin_trylock is equivalent on both SMP and UP.
> > >   */
> > > -#define pcp_trylock_prepare(flags)     do { } while (0)
> > > -#define pcp_trylock_finish(flag)       do { } while (0)
> > > +#define pcp_trylock_prepare(flags)     rcu_read_lock()
> > > +#define pcp_trylock_finish(flag)       rcu_reada_unlock()
> > >  #else
> > > 
> > >  /* UP spin_trylock always succeeds so disable IRQs to prevent re-
> > > entrancy. */
> > > 
> > > with appropriate comment changes
> > > 
> > Agreed. Assuming this change even works :)
> > 
> > Paul, does this look like it could do the trick,
> > or do we need something else to make RCU freeing
> > happy again?
> 
> I don't claim to fully understand the issue, but this would prevent
> any RCU grace periods starting subsequently from completing.  It would
> not prevent RCU callbacks from being invoked for RCU grace periods that
> started earlier.
> 
> So it won't prevent RCU callbacks from being invoked.
> 
> It *will* ensure that only a finite number of RCU callbacks get invoked.
> For some perhaps rather large value of "finite".
> 
> Does that help, or is more required?

I don't fully understand the issue either but would spin_lock_bh() help?

Thanks.
