Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD03C1877
	for <oe-lkp@lists.linux.dev>; Tue, 26 Sep 2023 05:34:46 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4526ae5b0b3so3276033137.2
        for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 22:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695706485; x=1696311285; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSkbghx5rrzjOMhhAlkPeMs9G2sVzf6qQF2DH4QfBao=;
        b=HhPoJPzP0xnyYW2ZtVdTPVapCTiVh1nr1ge0q2RwJqpODLUxVGSRkrHUXePVBwSzIr
         rdDnUIrM8Y5EnydzmlzMnzNX6+xRR+/Ar28ulUDDp5lVRDXtruJpHKZ40EFh6/Msf5Iw
         K3N0DyHKBpez8v1/IXY9vFi2Z2PdLGumm0UQIzw4DA5epCsuKO8wBFR5Bi9kNntYseYt
         ce97ik5ZqFvGcfDpP4h4iW3/iQgLvbknvg8om6IPnCnlPE+9inoVBfKqf+e4MRWbo9V+
         MXScGz2TLc9+PG/CRtHW59DCub3EcJMLvhKssJMafdyCEpPOFJOgjtUrammIzpwcIoL6
         lMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695706485; x=1696311285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSkbghx5rrzjOMhhAlkPeMs9G2sVzf6qQF2DH4QfBao=;
        b=OS/usZ3Bmq54cG809ZthsK3+jhXuXbO6n7ENkMXKJ/3S+9YGiUeK8nmOIozmRbro43
         kPPU8FMp6BlH28SigG6z0uIVb2oHMmSrbcpXW11bgAO8F9m0/5PCJjf5+9fFAjY/va8F
         k+2Z7woIPuVAgkdYIshSa2uE6aWSIdkTtdcmzFxGeqSU3ue8RmPCelGBXjRI4qcvYmyO
         me4gves5f56dklGP+lQDaKgifhpHg9n1SZHuHGzCyn0Cp8+iJTHUSRSOywJF3dNn2WP0
         UUreIUYbFVHbh27e2Kph8NH/KjxyDRWmdnW0nL2W2yBNQXMxr8t25fkD/nubX/wQJRVc
         d5vA==
X-Gm-Message-State: AOJu0Yy8Km3BIHhCdHlUjb69p9mzRWBlfTrV/SniWmnSBACtFcGWUD9e
	qtP5teuOjL/28TW+pddWu3uOWMLD5VLQgHXR/k4=
X-Google-Smtp-Source: AGHT+IHTDW6g2Tc/NjDzsxfrnkbQgYGREbZGtPAwsFltUq/iWFHSo9kGF9e0kVp3kKTZXnUIgmPl3AIMzTNYCOHJpPo=
X-Received: by 2002:a67:fa10:0:b0:452:6366:b0ed with SMTP id
 i16-20020a67fa10000000b004526366b0edmr6080464vsq.13.1695706485364; Mon, 25
 Sep 2023 22:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZQ1Z_JHMPE3hrzv5@yuki> <CAD_8n+ShV=HJuk5v-JeYU1f+MAq1nDz9GqVmbfK9NpNThRjzSg@mail.gmail.com>
 <CAOQ4uxjnCdAeWe3W4mp=DwgL49Vwp_FVx4S_V33A3-JLtzJb-g@mail.gmail.com>
 <ZQ75JynY8Y2DqaHD@casper.infradead.org> <CAOQ4uxjOGqWFdS4rU8u9TuLMLJafqMUsQUD3ToY3L9bOsfGibg@mail.gmail.com>
 <CAD_8n+SNKww4VwLRsBdOg+aBc7pNzZhmW9TPcj9472_MjGhWyg@mail.gmail.com>
 <CAOQ4uxjM8YTA9DjT5nYW1RBZReLjtLV6ZS3LNOOrgCRQcR2F9A@mail.gmail.com>
 <CAOQ4uxjmyfKmOxP0MZQPfu8PL3KjLeC=HwgEACo21MJg-6rD7g@mail.gmail.com>
 <ZRBHSACF5NdZoQwx@casper.infradead.org> <CAOQ4uxjmoY_Pu_JiY9U1TAa=Tz1Mta3aH=wwn192GOfRuvLJQw@mail.gmail.com>
 <ZRI6MsKeEgDnsyTo@xsang-OptiPlex-9020>
In-Reply-To: <ZRI6MsKeEgDnsyTo@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 26 Sep 2023 08:34:34 +0300
Message-ID: <CAOQ4uxgjnMZQOwOzzi6XH4eFn+UoHQ3cq5CYGjqbHOE0BZRG8g@mail.gmail.com>
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
To: Oliver Sang <oliver.sang@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>, Reuben Hawkins <reubenhwk@gmail.com>, brauner@kernel.org, 
	Cyril Hrubis <chrubis@suse.cz>, mszeredi@redhat.com, lkp@intel.com, 
	linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, 
	oe-lkp@lists.linux.dev, ltp@lists.linux.it, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 4:56=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi Amir,
>
> On Sun, Sep 24, 2023 at 06:32:30PM +0300, Amir Goldstein wrote:
> > On Sun, Sep 24, 2023 at 5:27=E2=80=AFPM Matthew Wilcox <willy@infradead=
.org> wrote:
> > >
> > > On Sun, Sep 24, 2023 at 02:47:42PM +0300, Amir Goldstein wrote:
> > > > Since you joined the discussion, you have the opportunity to agree =
or
> > > > disagree with our decision to change readahead() to ESPIPE.
> > > > Judging  by your citing of lseek and posix_fadvise standard,
> > > > I assume that you will be on board?
> > >
> > > I'm fine with returning ESPIPE (it's like ENOTTY in a sense).  but
> > > that's not what kbuild reported:
> >
> > kbuild report is from v1 patch that was posted to the list
> > this is not the patch (v2) that is applied to vfs.misc
> > and has been in linux-next for a few days.
> >
> > Oliver,
> >
> > Can you say the failure (on socket) is reproduced on
> > https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc?
> >
> > I would expect the pipe test to fail for getting ESPIPE
> > but according to Reuben the socket test does not fail.
>
> I tested on this commit:
> 15d4000b93539 (brauner-vfs/vfs.misc) vfs: fix readahead(2) on block devic=
es
>
> below is the test output:
>
> <<<test_output>>>
> tst_test.c:1558: TINFO: Timeout per run is 0h 02m 30s
> readahead01.c:36: TINFO: test_bad_fd -1
> readahead01.c:37: TPASS: readahead(-1, 0, getpagesize()) : EBADF (9)
> readahead01.c:39: TINFO: test_bad_fd O_WRONLY
> readahead01.c:45: TPASS: readahead(fd, 0, getpagesize()) : EBADF (9)
> readahead01.c:54: TINFO: test_invalid_fd pipe
> readahead01.c:56: TFAIL: readahead(fd[0], 0, getpagesize()) expected EINV=
AL: ESPIPE (29)
> readahead01.c:60: TINFO: test_invalid_fd socket
> readahead01.c:62: TFAIL: readahead(fd[0], 0, getpagesize()) succeeded
>
> Summary:
> passed   2
> failed   2
> broken   0
> skipped  0
> warnings 0
>
>

Thank you!
We had some confusion about patch of reported bug vs. current patch,
but these results are matching the other reports wrt current patch.


> BTW, I noticed the branch updated, now:
> e9168b6800ecd (brauner-vfs/vfs.misc) vfs: fix readahead(2) on block devic=
es
>
> though the patch-id are same. do you want us to test it again?
>

It's the same patch. no need to re-test.

Thanks,
Amir.
