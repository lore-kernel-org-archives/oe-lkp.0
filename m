Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141213FF0
	for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 09:43:54 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7a7857e5290so2192879241.1
        for <oe-lkp@lists.linux.dev>; Mon, 25 Sep 2023 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695635034; x=1696239834; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNQh3gPWZLNGBWs6Syw4BOUBLWuSAVzqnOqg+zAodOI=;
        b=IumNSLFKw3Ipp/5O/1VOAQK/Y/2yVnZWgmk/peWwYcxjx+xq2BURQg6IKOn/9p4Tm1
         mUoZDaaGJg4c4B4izcwQi43zadcgOa0KhIORBsNxv4yyb6Yu2AmG2iXizcwvEBITJDpe
         adepXbCnJPspsG0ndg/r52HsmXAYQgBGIOdWG+076tdBgwliNQ1h8NMn2SKftAv/YoJX
         /Duze0xNCHEbzLlurFNQy6i8onyEdgAH3JeIGc77hQ83jLntLl69tBFTZt91hI6kZgQ8
         FDfhR+C9Q17iso4oFJZb1Dzl0WzK4LMaGYVVaNHqs4E4slo6curRBCI9lwa8bho27o6O
         PVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695635034; x=1696239834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNQh3gPWZLNGBWs6Syw4BOUBLWuSAVzqnOqg+zAodOI=;
        b=nfLG10bPIsCwmeoKp2pF6XUefEpWvKB3DDADi18dMezXEFzCbQg4gaLrcWGMZ2Co+1
         Bn7+wT5Lw2vRDoHW9uWVSiyWUAq6TgasjYZQNDSK4OHq7FDb2Fdqa5jqYJPoGYa7raI0
         Q1efkepnXluhhuFnDKO7SVRtyXw2Xji/e9Twdp7LXBxnCsQLmSTuJujGRp0gDBwaLixM
         Z47SGZM1T9Ro0SoifjJG8dsvHBy1pnplVYf49ttcSTaYppVJXT0dsza9LI9gFPUKBbXY
         uPMOPm1YblLPheAIQY5qqCI+6+H+fxuDc5MHyc7LQkiL7kpO0z1CmCo5UiwjZMiFnhna
         FSyA==
X-Gm-Message-State: AOJu0YzCS5nPcVVlqKsmWvlEDM+7lAIGDVRF2HSkTTvalVNcq4hJCol8
	JG1hRDqJY195YxrO6t68UnscER39l1AtvHwwIfU=
X-Google-Smtp-Source: AGHT+IH0jb03GIUmHtK1EkjiqCNYXZEkwUjbBbZYOnt4nVO3r6Y1rHWqSBAU6t3SQmyfZy6Q9UnpfVPqiMGbFW8zN7k=
X-Received: by 2002:a67:f108:0:b0:44f:c528:6255 with SMTP id
 n8-20020a67f108000000b0044fc5286255mr3609591vsk.16.1695635033900; Mon, 25 Sep
 2023 02:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOQ4uxjnCdAeWe3W4mp=DwgL49Vwp_FVx4S_V33A3-JLtzJb-g@mail.gmail.com>
 <ZQ75JynY8Y2DqaHD@casper.infradead.org> <CAOQ4uxjOGqWFdS4rU8u9TuLMLJafqMUsQUD3ToY3L9bOsfGibg@mail.gmail.com>
 <CAD_8n+SNKww4VwLRsBdOg+aBc7pNzZhmW9TPcj9472_MjGhWyg@mail.gmail.com>
 <CAOQ4uxjM8YTA9DjT5nYW1RBZReLjtLV6ZS3LNOOrgCRQcR2F9A@mail.gmail.com>
 <CAOQ4uxjmyfKmOxP0MZQPfu8PL3KjLeC=HwgEACo21MJg-6rD7g@mail.gmail.com>
 <ZRBHSACF5NdZoQwx@casper.infradead.org> <CAOQ4uxjmoY_Pu_JiY9U1TAa=Tz1Mta3aH=wwn192GOfRuvLJQw@mail.gmail.com>
 <ZRCwjGSF//WUPohL@casper.infradead.org> <CAD_8n+SBo4EaU4-u+DaEFq3Bgii+vX0JobsqJV-4m+JjY9wq8w@mail.gmail.com>
 <ZREr3M32aIPfdem7@casper.infradead.org>
In-Reply-To: <ZREr3M32aIPfdem7@casper.infradead.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 25 Sep 2023 12:43:42 +0300
Message-ID: <CAOQ4uxgUC2KxO2fD-rSgVo3RyrrWbP-UHH+crG57uwXVn_sf2Q@mail.gmail.com>
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
To: Matthew Wilcox <willy@infradead.org>
Cc: Reuben Hawkins <reubenhwk@gmail.com>, kernel test robot <oliver.sang@intel.com>, brauner@kernel.org, 
	Cyril Hrubis <chrubis@suse.cz>, mszeredi@redhat.com, lkp@intel.com, 
	linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, 
	oe-lkp@lists.linux.dev, ltp@lists.linux.it, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 9:42=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Sun, Sep 24, 2023 at 11:35:48PM -0500, Reuben Hawkins wrote:
> > The v2 patch does NOT return ESPIPE on a socket.  It succeeds.
> >
> > readahead01.c:54: TINFO: test_invalid_fd pipe
> > readahead01.c:56: TFAIL: readahead(fd[0], 0, getpagesize()) expected
> > EINVAL: ESPIPE (29)
> > readahead01.c:60: TINFO: test_invalid_fd socket
> > readahead01.c:62: TFAIL: readahead(fd[0], 0, getpagesize()) succeeded
> > <-------here
>
> Thanks!  I am of the view that this is wrong (although probably
> harmless).  I suspect what happens is that we take the
> 'bdi =3D=3D &noop_backing_dev_info' condition in generic_fadvise()
> (since I don't see anywhere in net/ setting f_op->fadvise) and so
> return 0 without doing any work.
>
> The correct solution is probably your v2, combined with:
>
>         inode =3D file_inode(file);
> -       if (S_ISFIFO(inode->i_mode))
> +       if (S_ISFIFO(inode->i_mode) || S_ISSOCK(inode->i_mode))
>                 return -ESPIPE;
>
> in generic_fadvise(), but that then changes the return value from
> posix_fadvise(), as I outlined in my previous email.  And I'm OK with
> that, because I think it's what POSIX intended.  Amir may well disagree
> ;-)

I really have no problem with that change to posix_fadvise().
I only meant to say that we are not going to ask Reuben to talk to
the standard committee, but that's obvious ;-)
A patch to man-pages, that I would recommend as a follow up.

FWIW, I checked and there is currently no test for
posix_fadvise() on socket in LTP AFAIK.
Maybe Cyril will follow your suggestion and this will add test
coverage for socket in posix_fadvise().

Reuben,

The actionable item, if all agree with Matthew's proposal, is
not to change the v2 patch to readahead(), but to send a new
patch for generic_fadvise().

When you send the patch to Christian, you should specify
the dependency - it needs to be applied before the readahead
patch.

If the readahead patch was not already in the vfs tree, you
would have needed to send a patch series with a cover letter,
where you would leave the Reviewed-by on the unchanged
[2/2] readahead patch.

Sending a patch series is a good thing to practice, but it is
not strictly needed in this case, so I'll leave it up to you to decide.

Thanks,
Amir.
