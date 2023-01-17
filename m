Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E13A256A
	for <oe-lkp@lists.linux.dev>; Tue, 17 Jan 2023 13:01:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 94E156870E;
	Tue, 17 Jan 2023 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1673960483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=udBcKlXvucmjFnuJhU6TXrz8krZpR1pKC6Ai9PTIqFQ=;
	b=MAf38UTyLogwjlXReDpsZ60892NDqzlt/LxXURrhYe2n/+xLglD+b4oRma/x5FcqYdmsND
	ymX9LpQ8f+nRl+Y2ZchHMWpbo9qWoz7kUSR7b7cuETse2QU3NMwuByNNEc1fFV67D3G5Ox
	wfi/TwGyAPci0Y/pp19hBYGRFhgxMjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1673960483;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=udBcKlXvucmjFnuJhU6TXrz8krZpR1pKC6Ai9PTIqFQ=;
	b=sxWl5R5f4rYYTy/E9fL04iSPeCnTW7pFiYzR3ZF7RWhsuUC7a81b9uM9J0lHunKwAKZhIH
	vJS/BPZ5KvSPG8AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 849F51390C;
	Tue, 17 Jan 2023 13:01:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 3kNTICOcxmPYdQAAMHmgww
	(envelope-from <jack@suse.cz>); Tue, 17 Jan 2023 13:01:23 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id F1439A06B2; Tue, 17 Jan 2023 14:01:22 +0100 (CET)
Date: Tue, 17 Jan 2023 14:01:22 +0100
From: Jan Kara <jack@suse.cz>
To: kernel test robot <yujie.liu@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-fsdevel@vger.kernel.org
Subject: Re: [jack-fs:for_linus] [udf] b60f8eacb1:
 xfstests.generic.030/035.fail
Message-ID: <20230117130122.r6jjja6y4hdgdajp@quack3>
References: <Y8Qd6NPtlMDc4Y1l@yujie-X299>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8Qd6NPtlMDc4Y1l@yujie-X299>

Hello!

On Sun 15-01-23 23:38:16, kernel test robot wrote:
> FYI, we noticed xfstests.generic.030/035.fail due to commit (built with gcc-11):
> 
> commit: b60f8eacb1b76654cc025b22af78fa6014b40cdc ("udf: Convert udf_lookup() to use new directory iteration code")
> https://git.kernel.org/cgit/linux/kernel/git/jack/linux-fs.git for_linus
> 
> in testcase: xfstests
> version: xfstests-x86_64-fb6575e-1_20230102
> with following parameters:
> 
> 	disk: 4HDD
> 	fs: udf
> 	test: generic-group-01
> 
> test-description: xfstests is a regression test suite for xfs and other files ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git

Thanks for report! This seems to be intermittent failure in the directory
rewrite series. At least I cannot reproduce either of these issues with my
for_next branch (which admittedly has a few additional fixups compared to
for_linus so maybe that's what makes the difference). Anyway, I've reset
for_linus to current master because the content there was stale.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
