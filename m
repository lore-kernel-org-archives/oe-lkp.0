Received: from lobo.ruivo.org (lobo.ruivo.org [173.14.175.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C658D1DDCE
	for <oe-lkp@lists.linux.dev>; Tue, 16 Jul 2024 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.14.175.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721145072; cv=none; b=cWFuM5H3x0fL5wG5+iJwkfDgjvmXNdfohCOYStpt3td+OZaqJBcWgIfKuw+dB1NDBbT9ZisDWJ0eHRqrbcL5ZKLFIDHVDo9V9SW9cOTKPlFL0m6UnTtOKjN5mbj+H/y5h82napnwRuES++ZqM4v9Ov1ZRWoywIq05gqwUZZBqgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721145072; c=relaxed/simple;
	bh=6vooZs8JDGVvFBhUVlXJezG61siwwbvbwOx78jNrCE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYFp34X83ycH+zRh0d3ypLkA/DDK/VIviH9wX3DhtLrgfBSfc5UVqUULX5Y5njE8mNQRiinVxGmAeFN21pXJ9GmlxS+DgRa9FIAATP5gKG6mZ976aVDSaZ/MWkBJ7+O2VSPYA3fc5t77a29oOjbsrHPrt6zV9GCA48fvuJgUjSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ruivo.org; spf=pass smtp.mailfrom=ruivo.org; arc=none smtp.client-ip=173.14.175.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ruivo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ruivo.org
Received: by lobo.ruivo.org (Postfix, from userid 1011)
	id 68A65102555; Tue, 16 Jul 2024 11:44:30 -0400 (EDT)
X-Spam-Level: 
Received: from jake.ruivo.org (bob.qemu.ruivo [192.168.72.19])
	by lobo.ruivo.org (Postfix) with ESMTPSA id 1BCB4102549;
	Tue, 16 Jul 2024 11:44:27 -0400 (EDT)
Received: by jake.ruivo.org (Postfix, from userid 1000)
	id 09B97120D91; Tue, 16 Jul 2024 11:44:27 -0400 (EDT)
Date: Tue, 16 Jul 2024 11:44:27 -0400
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
Message-ID: <20240716154427.GI844599@cathedrallabs.org>
References: <202407162105.5eab5c8f-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407162105.5eab5c8f-oliver.sang@intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)

Taking a look on this.

-- 
Aristeu

