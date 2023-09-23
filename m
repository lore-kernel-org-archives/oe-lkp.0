Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C72DF44
	for <oe-lkp@lists.linux.dev>; Sat, 23 Sep 2023 15:48:17 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4526ae5b0b3so1622402137.2
        for <oe-lkp@lists.linux.dev>; Sat, 23 Sep 2023 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695484097; x=1696088897; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPBk6Sis4taxUhhwxWpjAuEIr4KdgqIKqoVHvpXBx/k=;
        b=fT2dpI9MDZZZ5rXxR59W1lNkDnTRmfPHjNIKwr8UP1cx/LaWxdlEDuuq1uNckkw6Mu
         dgOTT9+yohbvmw6CN3+gFXsVDQAt+su279UXqRPTO8ODb3RMuzVOHDWSLzdWTCRcBqJL
         dvd99AVawdCLy7xQN1cnqIDn3ZTjM/CFfSixF1uCYJLY2Rbw2yIBcRItJ+Ja4+9BaiR5
         1fwU3c4/RAaXm7PtXR19ots303dd0isOJKyS6JLprmYnUSiOtPjXZO+0cLIXTVnXC6Qq
         NjQBR2gWJXB6BNtYxPsyMe6CXEP4XuZLOQLH8ePwMh6sYvYgOd2CAFdPl4AtD+3IA9mT
         rLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695484097; x=1696088897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPBk6Sis4taxUhhwxWpjAuEIr4KdgqIKqoVHvpXBx/k=;
        b=VqLAUahB0q0PvkEvCib050MGOHolL3bU5d9y8QQdpoYvX5Sv3Cjngi8Zyva2PjRiRn
         tYPXaa7RmUak/bTl8NsuCu1lK3WOKBPICn/uHF9/zMv0HSwjHbNOPpRqd2xpp/TpL8sp
         qajaVPj/7Y0vk9IaBhcPPDBlZEeyFtLmpD3FSRCOqgd9xy8StEcVmyf6tqDHiz3ckNkl
         SDtG3bUYqQV1kgUQWnpQo4HBephg85dACClkq18uYzUityua26JWoqQQvPg+s01s3kcv
         +6Afn31LqdVPy+fD8vBo66Dx1BV3IAihVBQKgZxR8Iqqf3ak11i4ku25ZDRPmeXdsUxf
         uPvQ==
X-Gm-Message-State: AOJu0YxozFTCJXuDWlqWSPeMbuPbJecdogjXrXn3MGm8sbIALwuWIE6N
	Dmj4sIG7kvEcOBRFpHArhO4tUF7ow8x3vx/lnWk=
X-Google-Smtp-Source: AGHT+IEGP5VDrb+FQUow/x0fBVHOAzOLagR5lzNYnZapYUV+4VDn7OxyQSCA+S/54Vsz8iectYUUJTWdw0K53EAOg3g=
X-Received: by 2002:a67:fd09:0:b0:451:73bb:9fa0 with SMTP id
 f9-20020a67fd09000000b0045173bb9fa0mr1579093vsr.34.1695484096842; Sat, 23 Sep
 2023 08:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230909043806.3539-1-reubenhwk@gmail.com> <202309191018.68ec87d7-oliver.sang@intel.com>
 <CAOQ4uxhc8q=GAuL9OPRVOr=mARDL3TExPY0Zipij1geVKknkkQ@mail.gmail.com>
 <CAD_8n+TpZF2GoE1HUeBLs0vmpSna0yR9b+hsd-VC1ZurTe41LQ@mail.gmail.com>
 <ZQ1Z_JHMPE3hrzv5@yuki> <CAD_8n+ShV=HJuk5v-JeYU1f+MAq1nDz9GqVmbfK9NpNThRjzSg@mail.gmail.com>
 <CAOQ4uxjnCdAeWe3W4mp=DwgL49Vwp_FVx4S_V33A3-JLtzJb-g@mail.gmail.com> <ZQ75JynY8Y2DqaHD@casper.infradead.org>
In-Reply-To: <ZQ75JynY8Y2DqaHD@casper.infradead.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 23 Sep 2023 18:48:05 +0300
Message-ID: <CAOQ4uxjOGqWFdS4rU8u9TuLMLJafqMUsQUD3ToY3L9bOsfGibg@mail.gmail.com>
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
To: Matthew Wilcox <willy@infradead.org>, Reuben Hawkins <reubenhwk@gmail.com>
Cc: Cyril Hrubis <chrubis@suse.cz>, mszeredi@redhat.com, brauner@kernel.org, lkp@intel.com, 
	linux-fsdevel@vger.kernel.org, kernel test robot <oliver.sang@intel.com>, 
	viro@zeniv.linux.org.uk, oe-lkp@lists.linux.dev, ltp@lists.linux.it
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2023 at 5:41=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Sat, Sep 23, 2023 at 08:56:28AM +0300, Amir Goldstein wrote:
> > We decided to deliberately try the change of behavior
> > from EINVAL to ESPIPE, to align with fadvise behavior,
> > so eventually the LTP test should be changed to allow both.
> >
> > It was the test failure on the socket that alarmed me.
> > However, if we will have to special case socket in
> > readahead() after all, we may as well also special case
> > pipe with it and retain the EINVAL behavior - let's see
> > what your findings are and decide.
>
> If I read it correctly, LTP is reporting that readhaead() on a socket
> returned success instead of an error.  Sockets do have a_ops, right?
> It's set to empty_aops in inode_init_always, I think.
>

Yeh, you are right.
I guess the check !f.file->f_mapping->a_ops is completely futile
in that code. It's the only place I could find this sort of check
except for places like:
if (f->f_mapping->a_ops && f->f_mapping->a_ops->direct_IO)
which just looks like a coding habit.

> It would be nice if we documented somewhere which pointers should be
> checked for NULL for which cases ... it doesn't really make sense for
> a socket inode to have an i_mapping since it doesn't have pagecache.
> But maybe we rely on i_mapping always being set.
>

I can't imagine that a socket has f_mapping.
There must have been something off with this specific bug report,
because it was reported on a WIP patch.

> Irritatingly, POSIX specifies ESPIPE for pipes, but does not specify
> what to do with sockets.  It's kind of a meaningless syscall for
> any kind of non-seekable fd.  lseek() returns ESPIPE for sockets
> as well as pipes, so I'd see this as an oversight.
> https://pubs.opengroup.org/onlinepubs/9699919799/functions/posix_fadvise.=
html
> https://pubs.opengroup.org/onlinepubs/9699919799/functions/lseek.html
>

Indeed, we thought it wouldn't be too bad to align the
readahead errors with those of posix_fadvise.
That's why we asked to remove the S_ISFIFO check for v2.
But looking again, pipe will get EINVAL for !f_mapping, so the
UAPI wasn't changed at all and we were just talking BS all along.
Let's leave the UAPI as is.

> Of course readahead() is a Linux-specific syscall, so we can do whatever
> we want here, but I'm really tempted to just allow readahead() for
> regular files and block devices.  Hmm.  Can we check FMODE_LSEEK
> instead of (S_ISFILE || S_ISBLK)?

I think the f_mapping check should be good.
Reuben already said he could not reproduce the LTP failure with
v2 that is on Christian's vfs.misc branch.

The S_ISREG check I put in the Fixes commit was completely
unexplained in the commit message and completely unneeded.
Just removing it as was done in v2 is enough.

However, v2 has this wrong comment in the commit message:
"The change also means that readahead will return -ESPIPE
  on FIFO files instead of -EINVAL."

We need to remove this comment
and could also remove the unneeded !f.file->f_mapping->a_ops
check while at it.

Thanks,
Amir.
