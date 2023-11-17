Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1688D47776
	for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 21:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lVm2nByA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5mfV+DgfqPl4p5DpHJl48MYnAolYpikcrh23wrymsUY=; b=lVm2nByAwRxpcrMfhL/tTYrKlK
	/75ageUnCDWa6rSr4bDm5m6vML0X5fNieWRZnZrCll7CmoCb7flkRLnxM8jmNR0jPEVJs1w3ZMc/c
	ORO6zVn/AAcivrs+yzRIDnOqsyMAk2fAntdupDISTD/Hvg+oNJ9yfPKQfLn+dmnHMgNwSE1WBE/Ec
	OkFqkH4wrSQdKQDWad8grQbO1GJHXmlvxzqMpe5w/xf9taQufbnpTbKpmn1HcbjhJ80y1fwDxCHl3
	Bvk+ppkB6ZxchnrZ6LL1/QlMjstTZITmIa2+ydT2CmOUkrK8XW9CHc5/6pqnE2v2Jecd27jRVaZ/Y
	4rxrjYvA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r45xm-007HX9-0t;
	Fri, 17 Nov 2023 21:01:18 +0000
Date: Fri, 17 Nov 2023 13:01:18 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>,
	Daniel Gomez <da.gomez@samsung.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	"gost.dev@samsung.com" <gost.dev@samsung.com>,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH 1/2] test_xarray: add tests for advanced multi-index use
Message-ID: <ZVfUnhzv4UDigZKa@bombadil.infradead.org>
References: <20231104005747.1389762-2-da.gomez@samsung.com>
 <202311152254.610174ff-oliver.sang@intel.com>
 <ZVfS8fiudvHADtoR@bombadil.infradead.org>
 <ZVfT3bs9+F0jqIAw@casper.infradead.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVfT3bs9+F0jqIAw@casper.infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Fri, Nov 17, 2023 at 08:58:05PM +0000, Matthew Wilcox wrote:
> On Fri, Nov 17, 2023 at 12:54:09PM -0800, Luis Chamberlain wrote:
> > +/*
> > + * Can be used in contexts which busy loop on large number of entries but can
> > + * sleep and timing is if no importance to test correctness.
> > + */
> > +#define XA_BUG_ON_RELAX(xa, x) do {				\
> > +	if ((tests_run % 1000) == 0)				\
> > +		schedule();					\
> > +	XA_BUG_ON(xa, x);					\
> > +} while (0)
> 
> That is awful.  Please don't do that.  You're mixing two completely
> unrelated thing into the same macro, which makes no sense.  Not only
> that, it's a macro which refers to something in the containing
> environment that isn't a paramter to the macro.

I figured you'd puke. Would you prefer I just open code the check on the loop
though? I'm sure another alternative is we *not care* about these
overloaded systems running the test. What would you prefer?

  Luis
