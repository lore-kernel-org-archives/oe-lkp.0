Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB30E2FB63C
	for <oe-lkp@lists.linux.dev>; Wed,  3 Sep 2025 11:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756899835; cv=none; b=LWQNhr4g4O//cf3GRcax9OM6RzZ1wYhKPbjtStxrkz+jOV5zV4Wovpmvz1g4t/ExrQj8ExDESBk2ujva4zwxJdsC4gB7tBfax3Lkffn8PDZae5EW2HbvvLCpaIgpteZ9XSfnMB5Mhk0r+vYouoE63NwD8uFcmchjl22iovRiXeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756899835; c=relaxed/simple;
	bh=IPkAog2oWJvWzeG9LukZlFOVnIZGe+W96DFAglKXOjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcA+F3MRLVi29ycMBH6HEsPoaT56Il7uuG8BChNWhHoSgV9BRG4aeSCoA/mveKNP+LIXRALE7mIxLlArVLJZlNI9/Um/Oqnah40oK0/oenebadntGnTFJwCL+5Ij84JJJcrXVzJZQFJ3zUiPO6EFPkhEN5WFQFKvCC4326EyEsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mkAG3P8w; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mkAG3P8w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rsjKaX4Li+Xn3oQpN6KfZawl3+5dIlBMryTZxgIt2s0=; b=mkAG3P8wZILOqMJ2EHQxN7j0ew
	5XRNv9lkG4jgt3CHjoL/VNE/BgpG6PFU9FUHBJUQaRb4Q7c2B2VRd2459gtE5YhCTqyHWMLlVqySl
	NJgHV1dqvCibAVVxMbYmoeYHyjX+BPqjP7DOCvBoA6z9QM8JNHxV1+XT+nA3rHRL+ePZMhov/+K6C
	6lIDWzEcTq9BEOyUiLZjVut1IcHbR/vkss6nfWWWfCNsX6LMyHuE/BtQJAe8x4HV+QcqirJOYKTjJ
	5ePyWG6++9E7v3fC275L3nkVyOHpc7/rEsTMrh9z0aYFpLylQWJ/+P3ZT6Sz8X5sxK9uCzC8Bqd2S
	h4KfA3AQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlu1-000000028lz-3hho;
	Wed, 03 Sep 2025 11:43:50 +0000
Date: Wed, 3 Sep 2025 12:43:49 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [willy-pagecache:slab-future] [slab]  d7a6fafee0: RIP:__ksize
Message-ID: <aLgp9QKJ8EMbBR3T@casper.infradead.org>
References: <202509022248.dbe9cc08-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509022248.dbe9cc08-lkp@intel.com>

On Tue, Sep 02, 2025 at 10:35:26PM +0800, kernel test robot wrote:
> Hello,
> 
> kernel test robot noticed "RIP:__ksize" on:
> 
> commit: d7a6fafee020f8dbe5863d2b6c2e8af5560df707 ("slab: Remove folio references from __ksize()")
> git://git.infradead.org/users/willy/pagecache slab-future
> 
> in testcase: boot
> 
> config: x86_64-rhel-9.4-rust
> compiler: clang-20
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)

Hi.  Do you have a log for this configuration without this patchset?
I believe it should hit this warning:

static void free_large_kmalloc(struct folio *folio, void *object)
{
        unsigned int order = folio_order(folio);

        if (WARN_ON_ONCE(!folio_test_large_kmalloc(folio))) {
                dump_page(&folio->page, "Not a kmalloc allocation");
                return;
        }

> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250902/202509022248.dbe9cc08-lkp@intel.com

I'll give this a try.
