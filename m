Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BD51DA20
	for <oe-lkp@lists.linux.dev>; Wed, 26 Jul 2023 14:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FF9C433C7
	for <oe-lkp@lists.linux.dev>; Wed, 26 Jul 2023 14:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690383369;
	bh=KXa8WJTV1gJTZMumYsV3HOro3wIlFztRHmA1uRtiwTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ETDmU3giWqDWyqJcBdYsDRuHT6HMyjWlliaJgcQA0iybmzI/n1a+gWE+e6IEEIJaZ
	 8Wimu2+k5nxYzFcGgkKLGQT9ix2b7bEpaZGXXwFpy/5xyMTkrFuBCmm5Ly2yhIeovO
	 7lSJ8KfkAp2ypUQMe4uTsKSK8L0/rkacEw5te4RQ3hANfP6fcqCuDPhHQBkK0ycwXZ
	 46F55eDoWLwDEp5mvRY3Vpd0iSbn1Qi269CH0PZMeG29OcLI3iwfxx5yj04dyQaMG4
	 vt5amyswMpEdkqETpSDTCYgSxKVGGJjhLeuq3AHkfCL4NS3TBJePXkOOXyOsi5QGq5
	 Py+nCiwXTZSJg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b9bd59d465so4590841fa.3
        for <oe-lkp@lists.linux.dev>; Wed, 26 Jul 2023 07:56:09 -0700 (PDT)
X-Gm-Message-State: ABy/qLaCkvwoAiOctsQi4coIPZedZ3TVQmvyfW1CPS+3pE1q7tH96an8
	Pfzfuuov6To27VfTfZeyV9McL/xi+tZcW6/7c8g=
X-Google-Smtp-Source: APBJJlG3SZJ/Y3PsqG5kfC8WK6qDPrQG7Hzfci4HYvTbvZpRX1W0Qcr88iEoqyXpHmWi6ILoSVan4XtF7lXGayRkI0Q=
X-Received: by 2002:a2e:9d4e:0:b0:2b7:1b76:2c98 with SMTP id
 y14-20020a2e9d4e000000b002b71b762c98mr1404710ljj.10.1690383367741; Wed, 26
 Jul 2023 07:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZLvlkuJW+ooH1nCK@xsang-OptiPlex-9020> <CAMj1kXGTdkN0j9W6HvjXi86jnsJF011sTzUsknwfs7PWccmQRQ@mail.gmail.com>
 <CAMj1kXEVhRAeqDTwETW3KZ5TVwiRNbXSDAcED=XfvXjEs=DPuA@mail.gmail.com>
 <ZL9XopcTAkRLawDZ@xsang-OptiPlex-9020> <CAMj1kXEsavv36WzUnstXqyr1VUnqZbhPRZfgriSkf1x-Xdppow@mail.gmail.com>
 <ZMEzq+VJh/Onui4t@xsang-OptiPlex-9020>
In-Reply-To: <ZMEzq+VJh/Onui4t@xsang-OptiPlex-9020>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 26 Jul 2023 16:55:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHxWUrFrxA6PONcK7-G9uaNZyTs_Ams1OCyiqs9Banhig@mail.gmail.com>
Message-ID: <CAMj1kXHxWUrFrxA6PONcK7-G9uaNZyTs_Ams1OCyiqs9Banhig@mail.gmail.com>
Subject: Re: [ardb:x86-efistub-cleanup-v6] [x86/decompressor] 4cd5b5012c:
 cannot kexec to kernel with this commit
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Jul 2023 at 16:55, Oliver Sang <oliver.sang@intel.com> wrote:
>
> hi, Ard Biesheuvel,
>
> On Tue, Jul 25, 2023 at 05:46:37PM +0200, Ard Biesheuvel wrote:
> > On Tue, 25 Jul 2023 at 07:03, Oliver Sang <oliver.sang@intel.com> wrote:
> > >
> > > hi, Ard Biesheuvel,
> > >
> > > let me firstly answer your question last time.
> > >
> > > On Mon, Jul 24, 2023 at 03:04:00PM +0200, Ard Biesheuvel wrote:
> > > >
> > ...
> > > > I have prepared an alternative branch here
> > > >
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=x86-efistub-cleanup-v6a
> > > >
> > > > that has the exact same changes, but split into more patches, so it
> > > > should be easier to narrow down which change triggers the regression.
> > > >
> > > > Could you please run the same test using this branch? Thanks.
> > >
> > > ok, will test and bisect on this branch.
> >
> > Thanks
> >
> > In the meantime, I have found and fixed an issue in the patch, where
> > the stack pointer could end up being truncated to 32 bits by the
> > switch into compatibility mode.
> >
> > If this branch works
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=x86-efistub-cleanup-v7
>
> we tested this branch, confirmed the issue disappeared.
>
> >
> > there is no need to do the bisect against the -v6a branch.
>
> BTW, we happened finished bisection for -v6a branch, and found the fbc is:
> 69e723bb4fc6 x86/decompressor: Don't switch to the trampoline stack
>
> just FYI
>

Thanks a lot! This is very helpful
