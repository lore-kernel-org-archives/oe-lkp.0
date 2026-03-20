Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92265274B23
	for <oe-lkp@lists.linux.dev>; Fri, 20 Mar 2026 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013570; cv=none; b=HBFY6SBFUw694Ezr1gb/xsSm/JrWedGVYnsPzHki+iBiWTJztAJZ9cICaGqC8p5jwYXhvVVUxZnKaoNztCDwd+2LB9pa985qyJCXYdns9hXZ3UzpkGyiw91N0VRamzx/Tp/kjDuOAHJxoEHFcdZlHK1qqYpKAUO06M1RNVH43Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013570; c=relaxed/simple;
	bh=NMcGnBX6PMab1M5uHj+fEylTJX89q79gkwG06/46z6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eV5HK3gI4rd9O6yTwQvPa1mWzXLG8OIl271oAlU/Hiih1x9ioyhzuDvf/CiUOfL4bt0JkeWOjBNaq3US27JhReRuHUjNrpicVzocc7ktHWqUCM6s9crygf7C83obU+TeA1mCKSEVI7LRtnGBdJ0zKAZX4cQr357KGQpD+wCV+2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NezrFnYx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NezrFnYx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20979C2BCAF;
	Fri, 20 Mar 2026 13:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013570;
	bh=NMcGnBX6PMab1M5uHj+fEylTJX89q79gkwG06/46z6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NezrFnYxafKbyfXrwldYie7DO33yuXwnZd/LVn0JEUfwdgqmpeEWyl+CZQxjl/+hG
	 Sy37iypJExpEF/VXIaT/LOtkm28Ng6UJWWH54B1c70C1GX2FirQ6yuU3vbLcbnXE67
	 v90/c5YgW+KiAKqpaGv6qHW5EewCgJo/qzIJdEbIFTSMmVT5+ruLcK/+ObFz4F4j88
	 AhA+qGEFulfODOfVt/ssA+iTSXG5xoDqjURdUUN/wDVomS2HZQQDPGFS7lASZSYHFg
	 z4fezloVfp1JvJ/8Yu4SiC/hIYLUxR2UO7WNVLM37vLQbzDVil5PR5JPTKG3FcejmP
	 VZkMi1qDGw1hg==
Date: Fri, 20 Mar 2026 15:32:45 +0200
From: Mike Rapoport <rppt@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [rppt:free-late/v0.3] [memblock, treewide]  bbe3478393:
 KASAN:use-after-free_in_memblock_isolate_range
Message-ID: <ab1MfZARoEV4scVe@kernel.org>
References: <202603200841.b2d24d21-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603200841.b2d24d21-lkp@intel.com>

Hello,

On Fri, Mar 20, 2026 at 03:53:54PM +0800, kernel test robot wrote:
> 
> Hello,
> 
> kernel test robot noticed "KASAN:use-after-free_in_memblock_isolate_range" on:
> 
> commit: bbe3478393e135e2fc98f32fa8ab182de6742136 ("memblock, treewide: make memblock_free() handle late freeing")
> https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git free-late/v0.3
> 
> in testcase: ltp
> version: 
> with following parameters:
> 
> 	test: uevent
> 
> 
> config: x86_64-rhel-9.4-ltp
> compiler: gcc-14
> test machine: 22 threads 1 sockets Intel(R) Core(TM) Ultra 9 185H @ 4.5GHz (Meteor Lake) with 32G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202603200841.b2d24d21-lkp@intel.com

Thanks for the report!

The patch below fixes the issue for me, I'd appreciate if you can verify it
on your setup as well:


diff --git a/mm/memblock.c b/mm/memblock.c
index 780e70d4971a..3e21d6135789 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -985,15 +985,18 @@ void __init_memblock memblock_free(void *ptr, size_t size)
 int __init_memblock memblock_phys_free(phys_addr_t base, phys_addr_t size)
 {
 	phys_addr_t end = base + size - 1;
+	int ret;
 
 	memblock_dbg("%s: [%pa-%pa] %pS\n", __func__,
 		     &base, &end, (void *)_RET_IP_);
 
 	kmemleak_free_part_phys(base, size);
+	ret = memblock_remove_range(&memblock.reserved, base, size);
+
 	if (slab_is_available())
 		__free_reserved_area(base, base + size, -1);
 
-	return memblock_remove_range(&memblock.reserved, base, size);
+	return ret;
 }
 
 int __init_memblock __memblock_reserve(phys_addr_t base, phys_addr_t size,

-- 
Sincerely yours,
Mike.
