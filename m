Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFF96109
	for <oe-lkp@lists.linux.dev>; Fri, 22 Sep 2023 09:09:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 740BA1F38A;
	Fri, 22 Sep 2023 09:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1695373775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=onGdSnf1TabhST/nVQOzguCOB3OwnFwkbl9U7FML82U=;
	b=QQWghVX07yAEd/c8giGyj2aEmDo+G/Nrdhdvi5pyuL7lXrmlUdxjDG2Lguao/8N4tv7zTv
	yT/FmpboyILjqAavxFaxW8CtXIK/u7q4ZdR7Tl62C+YLNK6ZYq4er0Sde/5aJIVtY6gE1w
	5tg8jI1RtR0CJBHZFeCx/zsQ47rjhWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1695373775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=onGdSnf1TabhST/nVQOzguCOB3OwnFwkbl9U7FML82U=;
	b=ohri14qvNI6wH0btb6pqb/u4FXiGUIfOjHLYfJdc9tzLbQZgtJnDLd3Hty0RfgP8qoO1Ja
	bDifj/b95uzQaqDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D23D13478;
	Fri, 22 Sep 2023 09:09:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tEqNFc9ZDWWgUgAAMHmgww
	(envelope-from <chrubis@suse.cz>); Fri, 22 Sep 2023 09:09:35 +0000
Date: Fri, 22 Sep 2023 11:10:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Reuben Hawkins <reubenhwk@gmail.com>
Cc: Amir Goldstein <amir73il@gmail.com>, mszeredi@redhat.com,
	brauner@kernel.org, lkp@intel.com, willy@infradead.org,
	linux-fsdevel@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>, viro@zeniv.linux.org.uk,
	oe-lkp@lists.linux.dev, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
Message-ID: <ZQ1Z_JHMPE3hrzv5@yuki>
References: <20230909043806.3539-1-reubenhwk@gmail.com>
 <202309191018.68ec87d7-oliver.sang@intel.com>
 <CAOQ4uxhc8q=GAuL9OPRVOr=mARDL3TExPY0Zipij1geVKknkkQ@mail.gmail.com>
 <CAD_8n+TpZF2GoE1HUeBLs0vmpSna0yR9b+hsd-VC1ZurTe41LQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD_8n+TpZF2GoE1HUeBLs0vmpSna0yR9b+hsd-VC1ZurTe41LQ@mail.gmail.com>

Hi!
> ack.  Will try to test.  My Ubuntu 22.04 system wasn't able to find
> packages called
> for by the test case, so it'll take me a little while to figure out how to
> get the
> test case working...

Huh? The test is a simple C binary you shouldn't need anything more
than:

$ git clone https://github.com/linux-test-project/ltp.git
$ cd ltp
$ make autotools
$ ./configure

$ cd testcases/kernel/syscalls/readahead
$ make
$ ./readahead01

And this is well described in the readme at:

https://github.com/linux-test-project/ltp/

And the packages required for the compilation are make, C compiler and
autotools nothing extraordinary.

-- 
Cyril Hrubis
chrubis@suse.cz
