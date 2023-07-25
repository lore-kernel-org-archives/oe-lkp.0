Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245EE1F173
	for <oe-lkp@lists.linux.dev>; Tue, 25 Jul 2023 15:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86378C43395
	for <oe-lkp@lists.linux.dev>; Tue, 25 Jul 2023 15:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690300010;
	bh=+8a/n2BiWoXbl+B90MMZDz8rg2TxdtgOSrqUDFFLmng=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f8JJRFPDHkUztzkXQnjRF1l/kQd7DJr/Gup2aoQYbM5vboy1uDx1lmKASfSTFsb4V
	 xnK3X7DuaP5E055PS1Ff8lzvgFge5zZnRuTgPwKGTSX6sHFiTc8JCtBWgnqo64uzbc
	 OSfK0oqp5gaG++mttfgRwPeSbPB5K5/kiO5O8cnN1kFYWIDOgcSacR82turTwOkv7n
	 3nivH7jYZ1xWK3QuVIN7wvkMDp02WoGBRPe/ga/Gnkj7k1jQvtH1GvsyxCW+TftNLw
	 MzP1lgdVWTV1DlXz6IWQKAO3Rq2kfcAxPyZlZiC5s1w0ofV8K2V6HCMzCd0ePC3LsN
	 Y4NaKpAcXQdGA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso84116331fa.1
        for <oe-lkp@lists.linux.dev>; Tue, 25 Jul 2023 08:46:50 -0700 (PDT)
X-Gm-Message-State: ABy/qLYvklFfNV8mre1Wks7tpS89xvcFxWx4Zy52TaH3m2pz+VbHu/RM
	yP3+1kgN1Wr8h/0rlgdZNLZiU9fan7tubOQSntU=
X-Google-Smtp-Source: APBJJlGe3mYh9HO6iEmxSAouFLwIcEq9NFCECNzIN8B+1hf4lMNR3n0iJHloLkOfYRFR/gIcH7me0TYCPhmNf+hnqeQ=
X-Received: by 2002:a2e:b6d3:0:b0:2b6:fa3e:f2fa with SMTP id
 m19-20020a2eb6d3000000b002b6fa3ef2famr8152206ljo.32.1690300008560; Tue, 25
 Jul 2023 08:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZLvlkuJW+ooH1nCK@xsang-OptiPlex-9020> <CAMj1kXGTdkN0j9W6HvjXi86jnsJF011sTzUsknwfs7PWccmQRQ@mail.gmail.com>
 <CAMj1kXEVhRAeqDTwETW3KZ5TVwiRNbXSDAcED=XfvXjEs=DPuA@mail.gmail.com> <ZL9XopcTAkRLawDZ@xsang-OptiPlex-9020>
In-Reply-To: <ZL9XopcTAkRLawDZ@xsang-OptiPlex-9020>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 25 Jul 2023 17:46:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEsavv36WzUnstXqyr1VUnqZbhPRZfgriSkf1x-Xdppow@mail.gmail.com>
Message-ID: <CAMj1kXEsavv36WzUnstXqyr1VUnqZbhPRZfgriSkf1x-Xdppow@mail.gmail.com>
Subject: Re: [ardb:x86-efistub-cleanup-v6] [x86/decompressor] 4cd5b5012c:
 cannot kexec to kernel with this commit
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Jul 2023 at 07:03, Oliver Sang <oliver.sang@intel.com> wrote:
>
> hi, Ard Biesheuvel,
>
> let me firstly answer your question last time.
>
> On Mon, Jul 24, 2023 at 03:04:00PM +0200, Ard Biesheuvel wrote:
> >
...
> > I have prepared an alternative branch here
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=x86-efistub-cleanup-v6a
> >
> > that has the exact same changes, but split into more patches, so it
> > should be easier to narrow down which change triggers the regression.
> >
> > Could you please run the same test using this branch? Thanks.
>
> ok, will test and bisect on this branch.

Thanks

In the meantime, I have found and fixed an issue in the patch, where
the stack pointer could end up being truncated to 32 bits by the
switch into compatibility mode.

If this branch works

https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=x86-efistub-cleanup-v7

there is no need to do the bisect against the -v6a branch.

Thanks.
