Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC472F27
	for <oe-lkp@lists.linux.dev>; Thu,  5 Jan 2023 15:19:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3ADFB174BD;
	Thu,  5 Jan 2023 15:19:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 157F5138DF;
	Thu,  5 Jan 2023 15:19:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MsyLBGvqtmO1JQAAMHmgww
	(envelope-from <vbabka@suse.cz>); Thu, 05 Jan 2023 15:19:07 +0000
Message-ID: <a1d98577-6037-4712-7573-a8a3daa486e6@suse.cz>
Date: Thu, 5 Jan 2023 16:19:06 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: A better dump_page()
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>
Cc: kernel test robot <oliver.sang@intel.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Lameter <cl@linux.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <202212312021.bc1efe86-oliver.sang@intel.com>
 <41276905-b8a5-76ae-8a17-a8ec6558e988@suse.cz>
 <Y7RKX45mvwkbiMbo@casper.infradead.org>
 <c022ddc3-1cbd-8291-68a3-f90ffb93af84@google.com>
 <Y7S6ZPUKi07h5uZO@casper.infradead.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <Y7S6ZPUKi07h5uZO@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: *
X-Spam-Score: 1.40
X-Spamd-Result: default: False [1.40 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FREEMAIL_CC(0.00)[intel.com,gmail.com,lists.linux.dev,linux.ibm.com,linux.com,vger.kernel.org,kvack.org];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO

On 1/4/23 00:29, Matthew Wilcox wrote:
> On Tue, Jan 03, 2023 at 03:07:12PM -0800, David Rientjes wrote:
>> On Tue, 3 Jan 2023, Matthew Wilcox wrote:
>> 
>> > On Tue, Jan 03, 2023 at 11:42:11AM +0100, Vlastimil Babka wrote:
>> > > Separately we should also make the __dump_page() more resilient.
>> > 
>> > Right.  It's not ideal when one of our best debugging tools obfuscates
>> > the problem we're trying to debug.  I've seen probems like this before,
>> > and the problem is that somebody calls dump_page() on a page that they
>> > don't own a refcount on.  That lets the page mutate under us in some
>> > fairly awkward ways (as you've seen here, it seems to be part of several
>> > different compound allocations at various points during the dump
>> > process).
>> > 
>> > One possibility I thought about was taking our own refcount on the
>> > page at the start of dump_page().  That would kill off the possibility
>> > of ever passing in a const struct page, and it would confuse people.
>> > Also, what if somebody passes in a pointer to something that's not a
>> > struct page?  Then we've (tried to) modify memory that's not a refcount.
>> > 
>> > I think the best we can do is to snapshot the struct page and the folio
>> > it appears to belong to at the start of dump_page().  It'll take a
>> > little care (for example, folio_pfn() must be passed the original
>> > folio, and not the snapshot), but I think it's doable.
>> > 
>> 
>> By snapshot do you mean memcpy() of the metadata to the stack?  I assume 
>> this still leaves the opportunity for the underlying mutation of the page 
>> but makes the window more narrow.
> 
> Right.  We'd need to memcpy() both the page and the folio, so around 192
> bytes.  It doesn't make it consistent since it could be mutated during
> the memcpy(), but it will be consistent throughout the execution of the
> function, so we won't get calls like folio_entire_mapcount() aborting
> due to the folio having become a tail page halfway through.

I'm afraid this problem can still happen if the snapshot is inconsistent in
the first place and you e.g. snapshot the tail page as tail page, and the
supposed folio head page as not head page. I'm afraid the only way to
prevent this is to make sure any helpers __dump_page() uses simply must not
contain any VM_BUG/WARN_ON sanity checks, and anything treated as a pointer
must be checked before dereferencing.

The local copying still makes a lot of sense though, as anything checked on
the copy that determines its further evaluation can be trusted to remain
consistent without complicated piecemeal READ_ONCE()'s etc. And as you
mentioned it will allow us to proceed with constification, where the
possibility of dump_page() through VM_BUG_ON_PAGE() is IIRC a big blocker
for constifying the various flags checking helpers etc.
