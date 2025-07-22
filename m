Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FDF1ADFE4
	for <oe-lkp@lists.linux.dev>; Tue, 22 Jul 2025 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753181527; cv=none; b=JoGcufP+CMNQb7uJYj+ShHEHvTmvp62Gu5nNufLVJbk5M2MOgqAHMgYOVTerqq5eXvXEZ6syTV+nQe+5E5XIJkbHUipgC51pYzAcH5j4o5JfnClMjdk42PvwHdqepobti2VTzMcHKxdvq3cjM5WlbPq4iAJHeyMg9phfsEomvEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753181527; c=relaxed/simple;
	bh=Tmp9LSLguTHotkShxcrdFycy04MTYj6+Wk7V3FQELyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpFNRmRH328neW1QT9JLvEJvlWsNWcEHsExcZ1Sp7bMhYoCC7PhU09MLN/3wsAQnreUN4ORloerxnjnRIpo9zjMNbIIHndENSjLi12MWDRpyCsDI2A2l7FUmLfDBKA6gYcHpiAAU68CwAkzKmNxpEpQeiC0T+Ehx1UOB3bUEPng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dNymhzp6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XeIuY95A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O6TVGhcx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wz3Y3KRF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dNymhzp6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XeIuY95A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O6TVGhcx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wz3Y3KRF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CD8F621AB2;
	Tue, 22 Jul 2025 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753181524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e62XESYifqL2is1sUYq5Um0kogZdD8p/qNEjpnfEW/A=;
	b=dNymhzp6vxPQFlnYvEr13rcdtwXOXArPXd31JmRXzNjEJH7ODtp2Iz2Qj1WmyDs821jnzF
	Hqht8N4RqycBeC7rdwpmZuQ76SDO2y/4EC24CbSIL6lrAgP/btR7I9H2FU6xpAvRWJ0gVb
	qjKBkMrKte1WUS5G3zHValyMB+a0Exs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753181524;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e62XESYifqL2is1sUYq5Um0kogZdD8p/qNEjpnfEW/A=;
	b=XeIuY95AUWjEHTnfiXFAklBsPowvzKh3LP+qW78SNa4BdQXxl/FzSTO2itNzxpfA/y5WFv
	f7kD5kvHMlR9RQCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753181523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e62XESYifqL2is1sUYq5Um0kogZdD8p/qNEjpnfEW/A=;
	b=O6TVGhcxC3C79i/66PeRXnV31RS3ft2Xi0kVb7UEOsUsXUYFjii4kMp4YaLNMs99bRu7co
	q2KWOlRc2AoALtFV8NKIgXpn8e2I25YItR9L9e17Q2FcKfYO0BVOGKix3mS4TOJ/HJx7op
	WYyIX1Q5wfwAXvPZKQBC1UPBR70q59U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753181523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e62XESYifqL2is1sUYq5Um0kogZdD8p/qNEjpnfEW/A=;
	b=wz3Y3KRFYkZ58dM80VQ8LP3H967n+pFJP3pjtxf583reZ0WbHHJVvdrEWNSSbc7KecCCww
	oJPYyrJjSNST1lAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 408DA132EA;
	Tue, 22 Jul 2025 10:52:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IYSPDFNtf2ieOgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 22 Jul 2025 10:52:03 +0000
Date: Tue, 22 Jul 2025 11:52:01 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, David Howells <dhowells@redhat.com>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm, slab]  5660ee54e7:
 BUG:KASAN:stack-out-of-bounds_in_copy_from_iter
Message-ID: <jehx7y7mwer77d2rrx323qixc456ffod3qrcssemkebjotstbh@fpklsa72lzky>
References: <202507220801.50a7210-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507220801.50a7210-lkp@intel.com>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.80

+cc dhowells

On Tue, Jul 22, 2025 at 03:07:44PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:KASAN:stack-out-of-bounds_in_copy_from_iter" on:
> 
> commit: 5660ee54e7982f9097ddc684e90f15bdcc7fef4b ("mm, slab: use frozen pages for large kmalloc")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master d086c886ceb9f59dea6c3a9dae7eb89e780a20c9]
> 
> in testcase: blktests
> version: blktests-x86_64-5d9ef47-1_20250709
> with following parameters:
> 
> 	disk: 1SSD
> 	test: nvme-group-00
> 	nvme_trtype: rdma
> 	use_siw: true
> 
> 
> 
> config: x86_64-rhel-9.4-func
> compiler: gcc-12
> test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 28G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202507220801.50a7210-lkp@intel.com
> 
> 
> [ 232.729908][ T3003] BUG: KASAN: stack-out-of-bounds in _copy_from_iter (include/linux/iov_iter.h:117 include/linux/iov_iter.h:304 include/linux/iov_iter.h:328 lib/iov_iter.c:249 lib/iov_iter.c:260) 
> [  232.737608][ T3003] Read of size 4 at addr ffffc90002527694 by task siw_tx/2/3003
> [  232.745045][ T3003]
> [  232.747222][ T3003] CPU: 2 UID: 0 PID: 3003 Comm: siw_tx/2 Not tainted 6.16.0-rc2-00002-g5660ee54e798 #1 PREEMPT(voluntary)
> [  232.747226][ T3003] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.2.8 01/26/2016
> [  232.747228][ T3003] Call Trace:
> [  232.747230][ T3003]  <TASK>
> [ 232.747231][ T3003] dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1)) 
> [ 232.747236][ T3003] print_address_description+0x2c/0x3b0 
> [ 232.747241][ T3003] ? _copy_from_iter (include/linux/iov_iter.h:117 include/linux/iov_iter.h:304 include/linux/iov_iter.h:328 lib/iov_iter.c:249 lib/iov_iter.c:260) 
> [ 232.747244][ T3003] print_report (mm/kasan/report.c:522) 
> [ 232.747247][ T3003] ? kasan_addr_to_slab (mm/kasan/common.c:37) 
> [ 232.747250][ T3003] ? _copy_from_iter (include/linux/iov_iter.h:117 include/linux/iov_iter.h:304 include/linux/iov_iter.h:328 lib/iov_iter.c:249 lib/iov_iter.c:260) 
> [ 232.747252][ T3003] kasan_report (mm/kasan/report.c:636) 
> [ 232.747255][ T3003] ? _copy_from_iter (include/linux/iov_iter.h:117 include/linux/iov_iter.h:304 include/linux/iov_iter.h:328 lib/iov_iter.c:249 lib/iov_iter.c:260) 
> [ 232.747259][ T3003] _copy_from_iter (include/linux/iov_iter.h:117 include/linux/iov_iter.h:304 include/linux/iov_iter.h:328 lib/iov_iter.c:249 lib/iov_iter.c:260) 
> [ 232.747263][ T3003] ? __pfx__copy_from_iter (lib/iov_iter.c:254) 
> [ 232.747266][ T3003] ? __pfx_tcp_current_mss (net/ipv4/tcp_output.c:1873) 
> [ 232.747270][ T3003] ? check_heap_object (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/page-flags.h:867 include/linux/page-flags.h:888 include/linux/mm.h:992 include/linux/mm.h:2050 mm/usercopy.c:199) 
> [  232.747274][ T3003]  ? 0xffffffff81000000
> [ 232.747276][ T3003] ? __check_object_size (mm/memremap.c:421) 
> [ 232.747280][ T3003] skb_do_copy_data_nocache (include/linux/uio.h:228 include/linux/uio.h:245 include/net/sock.h:2243) 
> [ 232.747284][ T3003] ? __pfx_skb_do_copy_data_nocache (include/net/sock.h:2234) 
> [ 232.747286][ T3003] ? __sk_mem_schedule (net/core/sock.c:3403) 
> [ 232.747291][ T3003] tcp_sendmsg_locked (include/net/sock.h:2271 net/ipv4/tcp.c:1254) 
> [ 232.747297][ T3003] ? sock_sendmsg (net/socket.c:712 net/socket.c:727 net/socket.c:750) 
> [ 232.747300][ T3003] ? __pfx_tcp_sendmsg_locked (net/ipv4/tcp.c:1061) 
> [ 232.747303][ T3003] ? __pfx_sock_sendmsg (net/socket.c:739) 
> [ 232.747306][ T3003] ? _raw_spin_lock_bh (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:127 kernel/locking/spinlock.c:178) 
> [ 232.747312][ T3003] siw_tcp_sendpages+0x1f1/0x4f0 siw 

It seems to me that the change introduced back in 6.4 by David was silently
borked (credit to Vlastimil for initially pointing it out to me). Namely:

https://lore.kernel.org/all/20230331160914.1608208-1-dhowells@redhat.com/
introduced three changes, where we're inlining tcp_sendpages:

c2ff29e99a76 ("siw: Inline do_tcp_sendpages()")
e117dcfd646e ("tls: Inline do_tcp_sendpages()")
7f8816ab4bae ("espintcp: Inline do_tcp_sendpages()")

(there's a separate ebf2e8860eea, but it looks okay)

Taking a closer look into siw (my comments):

static int siw_tcp_sendpages(struct socket *s, struct page **page, int offset,
			     size_t size)
[...]
	/* Calculate the number of bytes we need to push, for this page
	 * specifically */
	size_t bytes = min_t(size_t, PAGE_SIZE - offset, size);
	/* If we can't splice it, then copy it in, as normal */
	if (!sendpage_ok(page[i]))
		msg.msg_flags &= ~MSG_SPLICE_PAGES;
	/* Set the bvec pointing to the page, with len $bytes */
	bvec_set_page(&bvec, page[i], bytes, offset);
	/* Set the iter to $size, aka the size of the whole sendpages (!!!) */
	iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, &bvec, 1, size);
try_page_again:
	lock_sock(sk);
	/* Sendmsg with $size size (!!!) */
	rv = tcp_sendmsg_locked(sk, &msg, size);


Now, (probably) why we didn't see this before: ever since Vlastimil introduced
5660ee54e798("mm, slab: use frozen pages for large kmalloc") into -next, sendpage_ok
fails for large kmalloc pages. This makes it so we don't take the MSG_SPLICE_PAGES paths,
which have a subtle difference deep into iov_iter paths:

(MSG_SPLICE_PAGES)
skb_splice_from_iter
  iov_iter_extract_pages
    iov_iter_extract_bvec_pages
      uses i->nr_segs to correctly stop in its tracks before OoB'ing everywhere
  skb_splice_from_iter gets a "short" read

(!MSG_SPLICE_PAGES)
skb_copy_to_page_nocache copy=iov_iter_count
 [...]
   copy_from_iter
   	/* this doesn't help */
     	if (unlikely(iter->count < len))
		len = iter->count;
	  iterate_bvec
	    ... and we run off the bvecs

Anyway, long-winded analysis just to say:

--- a/drivers/infiniband/sw/siw/siw_qp_tx.c
+++ b/drivers/infiniband/sw/siw/siw_qp_tx.c
@@ -332,11 +332,11 @@ static int siw_tcp_sendpages(struct socket *s, struct page **page, int offset,
                if (!sendpage_ok(page[i]))
                        msg.msg_flags &= ~MSG_SPLICE_PAGES;
                bvec_set_page(&bvec, page[i], bytes, offset);
-               iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, &bvec, 1, size);
+               iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, &bvec, 1, bytes);

 try_page_again:
                lock_sock(sk);
-               rv = tcp_sendmsg_locked(sk, &msg, size);
+               rv = tcp_sendmsg_locked(sk, &msg, bytes);
                release_sock(sk);

                if (rv > 0) {

(I had a closer look at the tls, espintcp changes, and they seem correct)

-- 
Pedro
