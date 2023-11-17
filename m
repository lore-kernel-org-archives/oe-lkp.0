Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6EC4500A
	for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 20:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JpU+e3o9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rzRni3SyCzvfWCvZwkgGkrmcDNOymWMsu+dejMBz2eA=; b=JpU+e3o9oEBqqeK+qfnkW1baFa
	tqxEYyJjfTIgWLL+cs59Tg1X4fa+MjLZOwpLLEUU2jKGj9CneHjpc20Aa6k+KuKuZxfB9yUv0m1fT
	tKrVn/RY1H/qc5gjT9di9Nl7Jab5OOl3CqaVyrtMMhf8kfZ83iH+2yzay8abq8oZtMJidk4PK0JFR
	wR8CiySx7wx+VEELHiDRcC77Wzd0kpcZqTeUU1yxoEa8obQaMEpkw37VRi87cc2RhA8bGSm9zQVv4
	taMwfq8NyZqFDuCrnSaRiwNwIM6/NORQtGqEGJHoYZbdFCGpgjgxUgr9iKT7BdRkaXYcg4ru5rNCf
	HEyl+d7A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r45uf-00BZLy-Ea; Fri, 17 Nov 2023 20:58:05 +0000
Date: Fri, 17 Nov 2023 20:58:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>,
	Daniel Gomez <da.gomez@samsung.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	"gost.dev@samsung.com" <gost.dev@samsung.com>,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH 1/2] test_xarray: add tests for advanced multi-index use
Message-ID: <ZVfT3bs9+F0jqIAw@casper.infradead.org>
References: <20231104005747.1389762-2-da.gomez@samsung.com>
 <202311152254.610174ff-oliver.sang@intel.com>
 <ZVfS8fiudvHADtoR@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVfS8fiudvHADtoR@bombadil.infradead.org>

On Fri, Nov 17, 2023 at 12:54:09PM -0800, Luis Chamberlain wrote:
> +/*
> + * Can be used in contexts which busy loop on large number of entries but can
> + * sleep and timing is if no importance to test correctness.
> + */
> +#define XA_BUG_ON_RELAX(xa, x) do {				\
> +	if ((tests_run % 1000) == 0)				\
> +		schedule();					\
> +	XA_BUG_ON(xa, x);					\
> +} while (0)

That is awful.  Please don't do that.  You're mixing two completely
unrelated thing into the same macro, which makes no sense.  Not only
that, it's a macro which refers to something in the containing
environment that isn't a paramter to the macro.

