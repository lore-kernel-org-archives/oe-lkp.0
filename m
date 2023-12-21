Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDAC8BFA
	for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 04:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tAvNS7Xl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AyIlzqO6vOAJAUAj7PWWomjTty1LWsROBoYt60pOPrE=; b=tAvNS7Xl8O0fkUKjWs04UajCtT
	+9yRWgDOs6cZmvD56QrpTCFUemOLDhwcYcwrxKbqG57lv0GmEtJfnPZThZCHL6NaTiREXDAZTcs7N
	5aUqXYAav3lxfCpjeRs4btWXQF6hJMRpIB9K6W4BQ622FM9OsHx5r0oISVwI6WccbXZBqb5Yau3GG
	zCxRaLUeYaPqebiZ2vINSaHdPo7fwmh/Ab501E2hJLu6hE8fM27csAV7EHilZBbqOr4Py+Fhnwh3U
	KIngh3xLxTFNA8kYmLLVT5frWQpepDFF90wOFFB7/XIEI87GDCRA8zBLgFVoOIXOkderM0/sQ4NG0
	0Ou2JmtQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rGAzY-004faT-Q9; Thu, 21 Dec 2023 04:49:04 +0000
Date: Thu, 21 Dec 2023 04:49:04 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yin Fengwei <fengwei.yin@intel.com>
Cc: Yang Shi <shy828301@gmail.com>,
	kernel test robot <oliver.sang@intel.com>,
	Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christopher Lameter <cl@linux.com>, ying.huang@intel.com,
	feng.tang@intel.com
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
Message-ID: <ZYPDwCcAjX+r+g6s@casper.infradead.org>
References: <202312192310.56367035-oliver.sang@intel.com>
 <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
 <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
 <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>

On Thu, Dec 21, 2023 at 08:58:42AM +0800, Yin Fengwei wrote:
> Yes. MAP_STACK is also mentioned in manpage of mmap. I did test to
> filter out of the MAP_STACK mapping based on this patch. The regression
> in stress-ng.pthread was gone. I suppose this is kind of safe because
> the madvise call is only applied to glibc allocated stack.
> 
> 
> But what I am not sure was whether it's worthy to do such kind of change
> as the regression only is seen obviously in micro-benchmark. No evidence
> showed the other regressionsin this report is related with madvise. At
> least from the perf statstics. Need to check more on stream/ramspeed.

FWIW, we had a customer report a significant performance problem when
inadvertently using 2MB pages for stacks.  They were able to avoid it by
using 2044KiB sized stacks ...
