Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F571FDE0B
	for <oe-lkp@lists.linux.dev>; Mon, 24 Feb 2025 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740429823; cv=none; b=mgL1QyBVAJJM3DS2D6YAfWUq7w4dn0K0enDb1h3Xe4yTFgBR+TC2C+PynCvhqXJs2suBXEVRsELmVR5Stf/szidhyBYE7WQUnChsRPUViauGXHW9z88E+4/IUF9zWi2OPLx2BBUuLi1iIJkyEznmqawnqsCTmuP0uFcWBTdnM5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740429823; c=relaxed/simple;
	bh=xbeCjIzdZwoUQu81m3I+CszesRgDATdPcchkdvIJ3do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJijQ5Zom570fK8uN10zpyMMrDV9qAD5THEbMEY8f1uDXPolaaN1GzYkOJr3ZYkSe+40ReLaLTxo99JGjhsDdnD9Ts/7oJt9GElBxRZLzvBkzEV1ajkl0LLc05exSnFMSmNb8etXPcanssaoBz5o1GaYUORKUgR/1LxTTOw1qaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kymP/Q9G; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kymP/Q9G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tgk4JKj+YEgXbJK1wxxb7iVt+szSntfQ7j8rTOcSjdk=; b=kymP/Q9GsGocCop8CEpGaaKjTj
	if8hMkMRN0azcHb5GMczOw1BgDiyAV7AAE2050P22lP8GB14PfZsWZIEA1yn1KbqnoIWkjb4G3COk
	TUoVs9B2YRNC4o2dSHszk75Q9mapHkn2D2FeHPbT5xUUWbzffFUrOzWGPPG0s16ziEuz5SJ5p6ABO
	FICZwOtaOkK0cCwHEgEqVYV+swMYSLK3FOukl9MzBEiZZa0avzQx5NhPv/27BxQiuxX6VXSWNAI7J
	OHl90sID+eFPpnpwpWqPdhsuTfgxFnKr/H4y1GOf+tAKJkrRQXbh06DGboDtROR16yq2fRoPXoVi7
	gGT0XF+Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfIh-00000008ZPB-1Rqk;
	Mon, 24 Feb 2025 20:43:39 +0000
Date: Mon, 24 Feb 2025 20:43:39 +0000
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [willy-pagecache:folio-mk-pte] [x86]  1c336f2de2:
 WARNING:at_arch/x86/include/asm/pgtable.h:#pfn_pte
Message-ID: <Z7zZ-_0hIyK2SFU7@casper.infradead.org>
References: <202502241646.719f4651-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502241646.719f4651-lkp@intel.com>

On Mon, Feb 24, 2025 at 04:36:17PM +0800, kernel test robot wrote:
> [ 13.732954][ T6] WARNING: CPU: 0 PID: 6 at arch/x86/include/asm/pgtable.h:788 pfn_pte (arch/x86/include/asm/pgtable.h:788 (discriminator 1)) 

Oh, fun, this is the
        WARN_ON_ONCE((pgprot_val(pgprot) & (_PAGE_DIRTY | _PAGE_RW)) ==
                        _PAGE_DIRTY);
which I moved from mk_pte() to pfn_pte().  So it's warning us that we're
creating a shadow stack entry.

> [ 13.746937][ T6] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:574) 
> [ 13.747271][ T6] ? pfn_pte (arch/x86/include/asm/pgtable.h:788 (discriminator 1)) 
> [ 13.747532][ T6] __change_page_attr (arch/x86/mm/pat/set_memory.c:1673) 
> [ 13.747850][ T6] __change_page_attr_set_clr (include/linux/spinlock.h:391 arch/x86/mm/pat/set_memory.c:1808) 
> [ 13.748200][ T6] ? set_pages_rw (arch/x86/mm/pat/set_memory.c:2437) 
> [ 13.748482][ T6] __set_pages_np (arch/x86/mm/pat/set_memory.c:2433) 
> [ 13.748770][ T6] set_area_direct_map (mm/vmalloc.c:3255 (discriminator 2)) 
> [ 13.749085][ T6] vfree (mm/vmalloc.c:3293 mm/vmalloc.c:3372 mm/vmalloc.c:3347) 

... from vfree().  So somebody has marked the PTE dirty and then we
remove the RW permission to it.  Which ends up being the pattern of bits
which denote shadow stack.

This should fix it:

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index ef4514d64c05..59f0a2729060 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2420,7 +2420,7 @@ static int __set_pages_np(struct page *page, int numpages)
 				.pgd = NULL,
 				.numpages = numpages,
 				.mask_set = __pgprot(0),
-				.mask_clr = __pgprot(_PAGE_PRESENT | _PAGE_RW),
+				.mask_clr = __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY),
 				.flags = CPA_NO_CHECK_ALIAS };
 
 	/*
@@ -2550,7 +2550,7 @@ int __init kernel_unmap_pages_in_pgd(pgd_t *pgd, unsigned long address,
 		.pgd		= pgd,
 		.numpages	= numpages,
 		.mask_set	= __pgprot(0),
-		.mask_clr	= __pgprot(_PAGE_PRESENT | _PAGE_RW),
+		.mask_clr	= __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY),
 		.flags		= CPA_NO_CHECK_ALIAS,
 	};
 
