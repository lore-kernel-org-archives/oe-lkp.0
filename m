Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F771B4141;
	Wed, 29 Jan 2025 17:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171386; cv=none; b=Sx+8tyqDLtVPzIcTmmRUWIlbVLqtWLv1qRpPq+FtYwQixcZ+zILgkfpZ+l/kQCNV3exiSqOLFUpn4qzFaYv3JC0YtJOtUWL5pHV03q6iCFMxqO//RcS+LhFWZJCum4CXze5NfdSpOGi5nqRiORAjvCK1zsb9YezdFqEVqwpM17c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171386; c=relaxed/simple;
	bh=QRMRlmWuHkiuiuHn8/S2Jb02n32b/dPwH+0bUWYTtnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5csND+EO85dMeKTITs6JdD2kNl9x3IWuuyGX/L6bbZH7VHrtIaatxFgCYp2VjLWZy20KUsZlITSWXj+4JxE1h5sd8o13ELaqev2YGhlH/keWhIEbwb30K0OfzEcir5pTqSIhhJTmjQtEC5QRkzv7qtkD66dTRkpoBlTTbCvWBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTWhdD+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTWhdD+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0F3C4CED1;
	Wed, 29 Jan 2025 17:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738171386;
	bh=QRMRlmWuHkiuiuHn8/S2Jb02n32b/dPwH+0bUWYTtnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTWhdD+BFdDNzi6gA8nyXOUkR5LSBhim7B/bHauefeH3XJsayte/hDadbr7gm9ddQ
	 IzWDvQlcxKoC0dpjShFk/LaWom2kapbn2uGLEv9bR0dpGZfCbhFAJ5FhqGCeOspUmx
	 gIRAfPoeDph7qZZQh6dHbhQOVP/ZfWEGbq5B2yBORupfPL6j5EseBU8F3tRUWt/05E
	 0WiMVxRXHJm8POJ8m52iumoard12U8s8XuFbZLeEc9upqsZFJfOQBg7YTlS5bH7v2c
	 hyWutgSBTbs/1m3a0UQSVbyWFdxqkJWQLUDd8cbpznD7Htwckfm8IfzuSmEP9Ovf7Y
	 IncUvBVnwh6BQ==
Date: Wed, 29 Jan 2025 18:23:03 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
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
Message-ID: <Z5pj96aFQU-PTtGf@localhost.localdomain>
References: <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
 <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
 <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
 <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
 <20250129105920.7a4bffa1@fangorn>
 <Z5pTZ0XLFzfM5dic@casper.infradead.org>
 <488401565cac6b5f9e3232d0ca481055876c919b.camel@surriel.com>
 <05da0ae9-073e-4578-b65c-f837c28eead8@paulmck-laptop>
 <Z5pdF1w9Lcwpdixp@localhost.localdomain>
 <13f95d28b0110a87b492d46e9810af51b33a23c8.camel@surriel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13f95d28b0110a87b492d46e9810af51b33a23c8.camel@surriel.com>

Le Wed, Jan 29, 2025 at 11:57:19AM -0500, Rik van Riel a écrit :
> On Wed, 2025-01-29 at 17:53 +0100, Frederic Weisbecker wrote:
> > Le Wed, Jan 29, 2025 at 08:36:12AM -0800, Paul E. McKenney a écrit :
> > > 
> > > So it won't prevent RCU callbacks from being invoked.
> > > 
> > > It *will* ensure that only a finite number of RCU callbacks get
> > > invoked.
> > > For some perhaps rather large value of "finite".
> > > 
> > > Does that help, or is more required?
> > 
> > I don't fully understand the issue either but would spin_lock_bh()
> > help?
> 
> Was that a jinx, or an ack to that latest patch? ;)

Probably both :-)

> 
> -- 
> All Rights Reversed.
