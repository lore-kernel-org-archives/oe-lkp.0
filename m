Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0631DB54C
	for <oe-lkp@lists.linux.dev>; Thu, 19 Jun 2025 22:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750373088; cv=none; b=H/jV2QLMLNWPTL+bsKAlrUxldvESEVezyh2nNtwHBXkaVuphvfljmpNiVkMUh+MDvDHKBaprSwGrqoOhwXGAg8LcKhcfI4eUxRsBvaaO+V+WJEOPBbBY0S2oJSdjvHL4czAPtOZ81HzNL7GjISAH4ypdsEwf+CD9Ig1eZpB2k0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750373088; c=relaxed/simple;
	bh=c+ojxUZWJsawltrhauKlfznbISqSs/1pV7qHDJiov9s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=o8xILOVpEvzqLz6dT+Nq6kDvaFzQvCCxrcnx4BxTq0dJnEzO5aJ3RQAyTSOgQARn9i1lda/UIcU52njsvS0tw7yfhc+cRa5jxyKh+wfDMEF2yS3HyP+vBeviQbdrMm9f6CKG3VDUIjh2KELh98TuKTrdNg9N+z91wJPavtLWirY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DHlu+s1O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DHlu+s1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA8DC4CEEA;
	Thu, 19 Jun 2025 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750373087;
	bh=c+ojxUZWJsawltrhauKlfznbISqSs/1pV7qHDJiov9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DHlu+s1ODq/wNri16mfHnNlBtOgZSIJI4PSTZ7+9sw59SCyrH2pBtDFbY5SApWM7t
	 HyKQJkTn0cKHvDq/eBcbbXeqkDDwOnNwQRCwbnjUrkxNj1tVpRQg7ZdS+0mO18O6Qi
	 DpHVddXsrogzoQ9/1tBmG/SGOWXfv3nV9h8zwlWE=
Date: Thu, 19 Jun 2025 15:44:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, <oe-lkp@lists.linux.dev>,
 <lkp@intel.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Matthew
 Wilcox <willy@infradead.org>, <maple-tree@lists.infradead.org>,
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master] [maple_tree]  540335e987:
 BUG:kernel_NULL_pointer_dereference,address
Message-Id: <20250619154446.e9543f52bbc47e4bbd2cec29@linux-foundation.org>
In-Reply-To: <202506191556.6bfc7b93-lkp@intel.com>
References: <202506191556.6bfc7b93-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Jun 2025 15:32:12 +0800 kernel test robot <oliver.sang@intel.com> wrote:

> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> 
> commit: 540335e9878005bf238ab4e1f91e8df0e3091a03 ("maple_tree: restart walk on correct status")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 6e5ab6fee68df8c40b338baeae6e269fa25a7e25]
> 
> ...
>
> [ 85.008687][ T5293] RIP: 0010:mtree_range_walk (lib/maple_tree.c:2773) 

Seems this is

		if (pivots[0] >= mas->index) {

It seems odd that mtree_range_walk() doesn't (and didn't) check for
ma_pivots() returning NULL.

Oh well, thanks, the report is solid - I'll drop the series.
