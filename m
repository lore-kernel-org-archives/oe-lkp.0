Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0B9171CE
	for <oe-lkp@lists.linux.dev>; Fri, 27 Oct 2023 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="WhnsnkgU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ke4guPlc"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED2282189F;
	Fri, 27 Oct 2023 09:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1698400553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YD1o6sfRvS2RQUo/el5YTc3fUIklZeB7u3TV/v2B32U=;
	b=WhnsnkgUiSPGNj9yVikeYVC2OHDoRpPDBDXIJN1U8obNSQrsmwRCBfDFG6TRezTEiMr9C+
	4Wj3og1/lzAsexOaxFMgPOKtBiIurYHfhvtOeZt9JxYIzjKud4IjjOdvomEeDIXRFBvXm0
	UrTVyqP1GKapyvVYQxQLnuGYyAiu4Ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1698400553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YD1o6sfRvS2RQUo/el5YTc3fUIklZeB7u3TV/v2B32U=;
	b=ke4guPlc+Sq6VnmXl9etET2DE6fltwJnVVxcoCaoQ3CGDim4SGlX8FbNcc9YhBp4CtrHQW
	RCx6v/Sh/EbDpAAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3A9F13524;
	Fri, 27 Oct 2023 09:55:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xrM8MymJO2VWagAAMHmgww
	(envelope-from <jack@suse.cz>); Fri, 27 Oct 2023 09:55:53 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 63479A05BC; Fri, 27 Oct 2023 11:55:53 +0200 (CEST)
Date: Fri, 27 Oct 2023 11:55:53 +0200
From: Jan Kara <jack@suse.cz>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	kernel test robot <oliver.sang@intel.com>, Jan Kara <jack@suse.cz>,
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] lib/find: Make functions safe on changing bitmaps
Message-ID: <20231027095553.7zdfk36babswvw25@quack3>
References: <202310251458.48b4452d-oliver.sang@intel.com>
 <374465d3-dceb-43b1-930e-dd4e9b7322d2@rasmusvillemoes.dk>
 <ZTszoD6fhLvCewXn@yury-ThinkPad>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTszoD6fhLvCewXn@yury-ThinkPad>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.10
X-Spamd-Result: default: False [-5.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO

On Thu 26-10-23 20:51:22, Yury Norov wrote:
> On Wed, Oct 25, 2023 at 10:18:00AM +0200, Rasmus Villemoes wrote:
> > Yes, users will have to treat results from the find routines carefully
> > if their bitmap may be concurrently modified. They do. Nobody wins if
> > those users are forced to implement their own bitmap routines for their
> > lockless algorithms.
> 
> Again, I agree with this point, and I'm trying to address exactly this.
> 
> I'm working on a series that introduces lockless find_bit functions
> based on existing FIND_BIT() engine. It's not ready yet, but I hope
> I'll submit it in the next merge window.
> 
> https://github.com/norov/linux/commits/find_and_bit

I agree that the find_and_{set|clear}() bit functions are useful and we'll
be able to remove some boilerplate code with them. But also note that you
will need to duplicate practically all of the bitmap API to provide similar
"atomic" functionality - e.g. the sbitmap conversion you have in your
branch has a bug that it drops the 'lock' memory ordering from the bitmap
manipulation. So you need something like find_and_set_bit_lock() (which you
already have) and find_and_set_bit_wrap_lock() (which you don't have yet).
If you are to convert bitmap code in filesystems (some of which is lockless
as well), you will need to add little and big endian variants of volatile
bitmap functions. Finally there are users like lib/xarray.c which don't
want to set/clear found bit (we just want to quickly find a good guess for
a set bit in the bitmap and we then verify in another structure whether the
guess was right or not). So we'll need the volatile variant of plain
find_first_bit(), find_next_bit() as well. Also when we have variants of
bitmap functions that are safe wrt parallel changes and those that are not,
the function names should be probably indicating which are which.

So as much as I agree your solution is theorically the cleanest, I
personally don't think the cost in terms of code duplication and code churn
is really worth it.

> Now that we've got a test that presumably works faster if find_bit()
> functions are all switched to be volatile, it would be great if we get
> into details and understand:
>  - what find_bit function or functions gives that gain in performance;
>  - on what bitmap(s);
>  - is the reason in concurrent memory access (guess yes), and if so,
>  - can we refactor the code to use lockless find_and_bit() functions
>    mentioned above;
>  - if not, how else can we address this.

Frankly, I don't think there's any substantial reason why the volatile or
non-volatile code should be faster. The guys from compiler team looked at
the x86 disassembly and said both variants should be the same speed based on
instruction costs. What could be causing these small performance differences
is that the resulting code is layed out slightly differently (and the
volatile bitmap functions end up being somewhat larger) and that somehow
interferes with instruction caching or CPU-internal out-of-order execution.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
