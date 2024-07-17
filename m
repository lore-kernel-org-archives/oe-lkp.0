Received: from lobo.ruivo.org (lobo.ruivo.org [173.14.175.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A4B24205
	for <oe-lkp@lists.linux.dev>; Wed, 17 Jul 2024 20:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.14.175.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721249124; cv=none; b=BdJG50CO989X+OVAE2Ak8bXU5JDcvtNLqRkdrH/+n+qb+FpMQ5bEQnnJWZDzW0K7qnzPQFqJthqbdjwBSHhHdK2gCJ9ROntcwN3M2ItKbvb95WR+qYs2LdAakEidvk00/ztCkC4i5xO6k/bhG5w9K1wIeUOtj0RW8aR7GTnxTL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721249124; c=relaxed/simple;
	bh=AVULbv4BdRyzS3gTMevczyEt1KA+CVUjFABPQkThIs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHdjP3q8bSptki2gVY1QeZNCB7LpzxaT/IXvjNPQTBCgFnpf13RcAdVS7gGIW/CxLEK5ZbnhUhEZKtP3bD0wCl60dsXxhOWBLPdPYnrSDfY5xnu0BZDpba/9vooRfOU7c7wQKcSZ2TkWHsMx8e+aOsn21TilZigKn8/C5PDKV6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ruivo.org; spf=pass smtp.mailfrom=ruivo.org; arc=none smtp.client-ip=173.14.175.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ruivo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ruivo.org
Received: by lobo.ruivo.org (Postfix, from userid 1011)
	id 87F20102554; Wed, 17 Jul 2024 16:45:10 -0400 (EDT)
X-Spam-Level: 
Received: from jake.ruivo.org (bob.qemu.ruivo [192.168.72.19])
	by lobo.ruivo.org (Postfix) with ESMTPSA id 782F310254C;
	Wed, 17 Jul 2024 16:45:07 -0400 (EDT)
Received: by jake.ruivo.org (Postfix, from userid 1000)
	id 6D0EA12022C; Wed, 17 Jul 2024 16:45:07 -0400 (EDT)
Date: Wed, 17 Jul 2024 16:45:07 -0400
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
Message-ID: <20240717204507.GJ844599@cathedrallabs.org>
References: <202407162105.5eab5c8f-oliver.sang@intel.com>
 <20240716154427.GI844599@cathedrallabs.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716154427.GI844599@cathedrallabs.org>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Tue, Jul 16, 2024 at 11:44:27AM -0400, Aristeu Rozanski wrote:
> Taking a look on this.

So it looks like to be a timing issue. While spreading some code to figure out
exactly which exact sequence is causing the issue, it makes the error go away
in the 'counters' test. More specifically one of the sequences:

        /* touched, shared mmap */
	map(SL_TEST, 1, MAP_SHARED);
	touch(SL_TEST, 1, MAP_SHARED);
	unmap(SL_TEST, 1, MAP_SHARED);

fails because it's expecting:

	HugePages_{Total,Free} = 1
	HugePages_Surp = 0

but gets:

	HugePages_{Total,Free} = 2
	HugePages_Surp = 1

which seems caused by a surplus page taking too long to be freed, thus
timing making difference here.

I'm not sure as why it'd take longer with my patch applied but will keep
digging.

-- 
Aristeu

