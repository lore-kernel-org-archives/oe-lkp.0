Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D41D522
	for <oe-lkp@lists.linux.dev>; Thu,  5 Jan 2023 15:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gQUVnq/KRRYcYlYb/NUnN+HgkAGfxeQMSvNtoyFPIfA=; b=nVxl5SVxoL53J3crMeqVtxMmpU
	NePoexvwH/aFyYAe2DpV5UNcUTKzQe1KqL7XHfWZu09jGQ9sv/h/jeC7UgIquWWRzin7QNnuff3l/
	UxWaHhnXB5YYYOK1vq24S8u+DpanFGp2A5vHUz+D3S8LEESH2nXzH5mEH+Trpw6Dk9QflurylSbfK
	mpfl0wdSrT0dqKO2ANuixUeWxM4bPYIYTiy9F3r4NoWDTEgIGj5gXgHoScp0cKgSMS0r3HRd9doQ0
	+yfePNNkASURsf1Auhh/0G1fx0QeVHW8wvccBYK3cHXrDIgt2+Y8IFHQyIEvMO7nQ8pleWpiK+9uc
	4AUb13xg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDSHb-00GERU-DZ; Thu, 05 Jan 2023 15:35:55 +0000
Date: Thu, 5 Jan 2023 15:35:55 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Rientjes <rientjes@google.com>,
	kernel test robot <oliver.sang@intel.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Mike Rapoport <rppt@linux.ibm.com>,
	Christoph Lameter <cl@linux.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: A better dump_page()
Message-ID: <Y7buW4unbGBI9mx4@casper.infradead.org>
References: <202212312021.bc1efe86-oliver.sang@intel.com>
 <41276905-b8a5-76ae-8a17-a8ec6558e988@suse.cz>
 <Y7RKX45mvwkbiMbo@casper.infradead.org>
 <c022ddc3-1cbd-8291-68a3-f90ffb93af84@google.com>
 <Y7S6ZPUKi07h5uZO@casper.infradead.org>
 <a1d98577-6037-4712-7573-a8a3daa486e6@suse.cz>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1d98577-6037-4712-7573-a8a3daa486e6@suse.cz>

On Thu, Jan 05, 2023 at 04:19:06PM +0100, Vlastimil Babka wrote:
> On 1/4/23 00:29, Matthew Wilcox wrote:
> > On Tue, Jan 03, 2023 at 03:07:12PM -0800, David Rientjes wrote:
> >> On Tue, 3 Jan 2023, Matthew Wilcox wrote:
> >> 
> >> > On Tue, Jan 03, 2023 at 11:42:11AM +0100, Vlastimil Babka wrote:
> >> > > Separately we should also make the __dump_page() more resilient.
> >> > 
> >> > Right.  It's not ideal when one of our best debugging tools obfuscates
> >> > the problem we're trying to debug.  I've seen probems like this before,
> >> > and the problem is that somebody calls dump_page() on a page that they
> >> > don't own a refcount on.  That lets the page mutate under us in some
> >> > fairly awkward ways (as you've seen here, it seems to be part of several
> >> > different compound allocations at various points during the dump
> >> > process).
> >> > 
> >> > One possibility I thought about was taking our own refcount on the
> >> > page at the start of dump_page().  That would kill off the possibility
> >> > of ever passing in a const struct page, and it would confuse people.
> >> > Also, what if somebody passes in a pointer to something that's not a
> >> > struct page?  Then we've (tried to) modify memory that's not a refcount.
> >> > 
> >> > I think the best we can do is to snapshot the struct page and the folio
> >> > it appears to belong to at the start of dump_page().  It'll take a
> >> > little care (for example, folio_pfn() must be passed the original
> >> > folio, and not the snapshot), but I think it's doable.
> >> > 
> >> 
> >> By snapshot do you mean memcpy() of the metadata to the stack?  I assume 
> >> this still leaves the opportunity for the underlying mutation of the page 
> >> but makes the window more narrow.
> > 
> > Right.  We'd need to memcpy() both the page and the folio, so around 192
> > bytes.  It doesn't make it consistent since it could be mutated during
> > the memcpy(), but it will be consistent throughout the execution of the
> > function, so we won't get calls like folio_entire_mapcount() aborting
> > due to the folio having become a tail page halfway through.
> 
> I'm afraid this problem can still happen if the snapshot is inconsistent in
> the first place and you e.g. snapshot the tail page as tail page, and the
> supposed folio head page as not head page.

Oh, there would have to be an explicit check that the head page pointed
to is actually a head page, and further that it really is the head page
of this page.  But the advantage is that we can check that we have a
consistent snapshot _once_ rather than in every helper that we use in
this function.

The question is what to do if we have an inconsistent snapshot.
The answer we usually use (eg in filemap, gup, etc) is to try again until
we get a consistent answer.  But I think that's the wrong answer here; if
we get an inconsistent snapshot, we should give up.  Whatever information
might have been gleaned from the head page is now gone, because we don't
have the original head page any more.  So we should just dump the page
as a non-compound page.

> The local copying still makes a lot of sense though, as anything checked on
> the copy that determines its further evaluation can be trusted to remain
> consistent without complicated piecemeal READ_ONCE()'s etc. And as you
> mentioned it will allow us to proceed with constification, where the
> possibility of dump_page() through VM_BUG_ON_PAGE() is IIRC a big blocker
> for constifying the various flags checking helpers etc.

Yes, that's a nice side-benefit ;-)
