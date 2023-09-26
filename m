Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4F018E1B
	for <oe-lkp@lists.linux.dev>; Tue, 26 Sep 2023 10:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881B3C433C7;
	Tue, 26 Sep 2023 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695722928;
	bh=zykksIGqZoBdbMss/bnZGnUX9BMIwBK5x+gpg5W14as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRaakjMgpEzIU6gDUxwG76Bi5f2HsTL0XZeNI102ywyROvfzBjtpc4k2HZWBFyT4L
	 FzXDLZYEEGXnlz7m/uWijbHp6+LPAFHvSm6eeX2MJjA1yRZzuwJpK/gR0VFO8JT47j
	 pRo+iE9U/2JJzL9vu0fAA59mObN5WNU24L8Azja1XQxW2MNLp40MEwUpxvCC35QDlt
	 p2oGqCnXMAe72rOqTEVqPLotw2zHcJOwLHZnVKKlet02oo9P+0CglrUmZZM7TUJeRd
	 tYmjjvFbUR4JLamFpMyZ5dLyPZtN2X9JyeuxVDJ9rVfJf0qQJXhcsFvj5nJjx0+UCK
	 ykkDFeoibXl0w==
Date: Tue, 26 Sep 2023 12:08:43 +0200
From: Christian Brauner <brauner@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Reuben Hawkins <reubenhwk@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	kernel test robot <oliver.sang@intel.com>,
	Cyril Hrubis <chrubis@suse.cz>, mszeredi@redhat.com, lkp@intel.com,
	linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk,
	oe-lkp@lists.linux.dev, ltp@lists.linux.it, Jan Kara <jack@suse.cz>
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
Message-ID: <20230926-leinen-kaltlassen-b5cef5a1e877@brauner>
References: <CAOQ4uxjM8YTA9DjT5nYW1RBZReLjtLV6ZS3LNOOrgCRQcR2F9A@mail.gmail.com>
 <CAOQ4uxjmyfKmOxP0MZQPfu8PL3KjLeC=HwgEACo21MJg-6rD7g@mail.gmail.com>
 <ZRBHSACF5NdZoQwx@casper.infradead.org>
 <CAOQ4uxjmoY_Pu_JiY9U1TAa=Tz1Mta3aH=wwn192GOfRuvLJQw@mail.gmail.com>
 <ZRCwjGSF//WUPohL@casper.infradead.org>
 <CAD_8n+SBo4EaU4-u+DaEFq3Bgii+vX0JobsqJV-4m+JjY9wq8w@mail.gmail.com>
 <ZREr3M32aIPfdem7@casper.infradead.org>
 <CAOQ4uxgUC2KxO2fD-rSgVo3RyrrWbP-UHH+crG57uwXVn_sf2Q@mail.gmail.com>
 <CAD_8n+QeGwf+CGNW_WnyRNQMu9G2_HJ4RSwJGq-b4CERpaA4uQ@mail.gmail.com>
 <CAOQ4uxh7+avP=m8DW_u14Ea4Hrk1xhyuT--t2XX868CBquOCaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOQ4uxh7+avP=m8DW_u14Ea4Hrk1xhyuT--t2XX868CBquOCaA@mail.gmail.com>

> What you are saying makes sense.
> And if we are being honest, I think that the right thing to do from the
> beginning was to separate the bug fix commit from the UAPI change.
> 
> The minimal bug fix is S_ISREG || S_ISBLK, which
> mentions the Fixes commit and will be picked for stable kernels.
> 
> Following up with another one or two patches that change
> the behavior of posix_fadvise on socket and readahead on
> socket and pipe.
> 
> The UAPI change is not something that has to go to stable
> and it should be easily revertable independently of the bug fix.
> Doing it otherwise would make our lives much harder if regressions
> turn up from the UAPI change.
> 
> Christian, Matthew,
> 
> Do you agree?

Fine by me.
