Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04012634F7
	for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 18:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="i3CznAUk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t5HBHPeGSvxeProudUv8xSljJIYtxHfERyQqCNBsYdA=; b=i3CznAUkC0tguY2eRhr9jKfe9e
	v8rQg+nm0gIKXwMk1UWFgfg6pY5nU7VAQZBqxP4U+wZyERar9MKtds4dCZexSth/ULVqwxmz3RN9O
	3AEWzkBQHkKLHQ25JEMuPlec6G8yC7cMha1hB8ypGMmfxjVLx0GX28rTmeNDSsLD/k23WmKr6UA7G
	Q84TX2rWUu09G81xbYFXa9aBN4zUBmYj/O6i2+tSvgewvoy/ZmIFp6OUnmVFUKxuYvmRcOL0SEYjX
	+gizZCxdNavjzfg9qw7tTlqHyO2D+vaHHPyEoncjMpoI6brE8DNTEWdbLbd2UdMLHln/Pgkb29VCX
	jaRrCm3w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rGNYg-005pk2-0f; Thu, 21 Dec 2023 18:14:10 +0000
Date: Thu, 21 Dec 2023 18:14:09 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yang Shi <shy828301@gmail.com>
Cc: Yin Fengwei <fengwei.yin@intel.com>,
	kernel test robot <oliver.sang@intel.com>,
	Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christopher Lameter <cl@linux.com>, ying.huang@intel.com,
	feng.tang@intel.com
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
Message-ID: <ZYSAcThKd/FbH/Bt@casper.infradead.org>
References: <202312192310.56367035-oliver.sang@intel.com>
 <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
 <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
 <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>
 <ZYPDwCcAjX+r+g6s@casper.infradead.org>
 <CAHbLzkpX29RGTrRwVpK+nh5uWyC9pJnyCjQcjjreEy2N=4QsqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHbLzkpX29RGTrRwVpK+nh5uWyC9pJnyCjQcjjreEy2N=4QsqA@mail.gmail.com>

On Thu, Dec 21, 2023 at 10:07:09AM -0800, Yang Shi wrote:
> On Wed, Dec 20, 2023 at 8:49 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Thu, Dec 21, 2023 at 08:58:42AM +0800, Yin Fengwei wrote:
> > > Yes. MAP_STACK is also mentioned in manpage of mmap. I did test to
> > > filter out of the MAP_STACK mapping based on this patch. The regression
> > > in stress-ng.pthread was gone. I suppose this is kind of safe because
> > > the madvise call is only applied to glibc allocated stack.
> > >
> > >
> > > But what I am not sure was whether it's worthy to do such kind of change
> > > as the regression only is seen obviously in micro-benchmark. No evidence
> > > showed the other regressionsin this report is related with madvise. At
> > > least from the perf statstics. Need to check more on stream/ramspeed.
> >
> > FWIW, we had a customer report a significant performance problem when
> > inadvertently using 2MB pages for stacks.  They were able to avoid it by
> > using 2044KiB sized stacks ...
> 
> Thanks for the report. This provided more justification regarding
> honoring MAP_STACK on Linux. Some applications, for example, pthread,
> just allocate a fixed size area for stack. This confuses kernel
> because kernel tell stack by VM_GROWSDOWN | VM_GROWSUP.
> 
> But I'm still a little confused by why THP for stack could result in
> significant performance problems. Unless the applications resize the
> stack quite often.

We didn't delve into what was causing the problem, only that it was
happening.  The application had many threads, so it could have been as
simple as consuming all the available THP and leaving fewer available
for other uses.  Or it could have been a memory consumption problem;
maybe the app would only have been using 16-32kB per thread but was
now using 2MB per thread and if there were, say, 100 threads, that's an
extra 199MB of memory in use.
