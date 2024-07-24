Received: from lobo.ruivo.org (lobo.ruivo.org [173.14.175.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A9415F318
	for <oe-lkp@lists.linux.dev>; Wed, 24 Jul 2024 19:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.14.175.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721850535; cv=none; b=QZ0yEiZYW6LrXR0sTiYRIdUUrH3ftewNyW/RAlv7Tf3r0UIi257XBfeYOVnrCHw0AYGS0l9Fz5arlx3CzSlHjx8s5qcj6pxB1RT5fMA1LBjIoM2j5O82+fo/MWDtHa8AFtO7YHCvo9V+NUHtq5TIp1TPiPrFgHmOswSMxaHxOgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721850535; c=relaxed/simple;
	bh=BxOiQmBbD/8tHbQFmWSZNNA6eO3f+nRkJPHxF5ULa9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/oV2N2nQA2fB/gW/kEVJfCHGje3AamXUFUXPquzg76eYqfYlkKe369qoQZNjwcw3+HVClDKmRKQl5Io4MGX/aBfa3pqTw6uBOuH9JkyVBWOM2UwbLELN9H7fQuxBtFUk3/WJ6Nfyye20rYYcNeVAxPN3w7x9PEE8XMjVP04hNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ruivo.org; spf=pass smtp.mailfrom=ruivo.org; arc=none smtp.client-ip=173.14.175.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ruivo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ruivo.org
Received: by lobo.ruivo.org (Postfix, from userid 1011)
	id AB958102559; Wed, 24 Jul 2024 15:48:37 -0400 (EDT)
X-Spam-Level: 
Received: from jake.ruivo.org (bob.qemu.ruivo [192.168.72.19])
	by lobo.ruivo.org (Postfix) with ESMTPSA id 6D8DB5325A;
	Wed, 24 Jul 2024 15:48:34 -0400 (EDT)
Received: by jake.ruivo.org (Postfix, from userid 1000)
	id 5CD4E120BB1; Wed, 24 Jul 2024 15:48:34 -0400 (EDT)
Date: Wed, 24 Jul 2024 15:48:34 -0400
From: Aristeu Rozanski <aris@ruivo.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Vishal Moola <vishal.moola@gmail.com>
Subject: Re: [linux-next:master] [hugetlb]  003af997c8:
 libhugetlbfs-test.32/64bit.counters_sh.fail
Message-ID: <20240724194834.GM844599@cathedrallabs.org>
References: <202407162105.5eab5c8f-oliver.sang@intel.com>
 <20240716154427.GI844599@cathedrallabs.org>
 <20240717204507.GJ844599@cathedrallabs.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717204507.GJ844599@cathedrallabs.org>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Wed, Jul 17, 2024 at 04:45:07PM -0400, Aristeu Rozanski wrote:
> On Tue, Jul 16, 2024 at 11:44:27AM -0400, Aristeu Rozanski wrote:
> > Taking a look on this.
> 
> So it looks like to be a timing issue. While spreading some code to figure out
> exactly which exact sequence is causing the issue, it makes the error go away
> in the 'counters' test. More specifically one of the sequences:
> 
>         /* touched, shared mmap */
> 	map(SL_TEST, 1, MAP_SHARED);
> 	touch(SL_TEST, 1, MAP_SHARED);
> 	unmap(SL_TEST, 1, MAP_SHARED);
> 
> fails because it's expecting:
> 
> 	HugePages_{Total,Free} = 1
> 	HugePages_Surp = 0
> 
> but gets:
> 
> 	HugePages_{Total,Free} = 2
> 	HugePages_Surp = 1
> 
> which seems caused by a surplus page taking too long to be freed, thus
> timing making difference here.
> 
> I'm not sure as why it'd take longer with my patch applied but will keep
> digging.

It really seems to be a matter of small timing difference. Even poking with
perf is enough to not be able to reproduce the problem anymore. Will get in
contact with the libhugetlbfs folks, might need to implement on the counters
test intelligence to when there're surplus pages around wait for a little bit
to give a chance for it to be freed. I believe we're good to go.

Comments?

-- 
Aristeu

