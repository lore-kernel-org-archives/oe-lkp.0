Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FB365B
	for <oe-lkp@lists.linux.dev>; Sun, 24 Sep 2023 06:46:15 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-417d6e83ce2so29873671cf.0
        for <oe-lkp@lists.linux.dev>; Sat, 23 Sep 2023 23:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695537975; x=1696142775; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sw83IUfQOP3EPzhuJykvexUS/eQ7Pw6APXqp0soyYmc=;
        b=RXRtGppPCRaFjQ9GibMCRGqH1kCV7UvmgdF072Qgy1ieOH56NfSzYxlFfffYMQhGC5
         erslsnqtuv32wPeWxC8obR0fNkJrbEOB0o7enhvxEt9C7BK/blPWPUwESRYLMKQyrPFi
         CYdsYCmcy+UwoRELq/rGOB6v39wmvimeZd6p6kx0X17iufl9W9MREGMZA0Wa3eVyuk1l
         Rj1ZZKUr2GRnFrY/hp4/wvyChWcmQZe+MS9wTbCNKwzJrMRo2j4j9a/DZXp6oLM9uzXE
         6tLI3dobzSEOWj7/TmAREGQ1CI25GpWtbEpDnmZz66hJqo+JzSqW0axbNVTFfg2ezlPg
         SbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695537975; x=1696142775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sw83IUfQOP3EPzhuJykvexUS/eQ7Pw6APXqp0soyYmc=;
        b=Q0Rfk+W9COtODh5TFRwUEPB/GOfC87cizTS3u3Vj7EVHBf8fPdmGV9Njs1KO7OOQtq
         SMeQhX41isD5Bvu7IEL6RXvK8WwLL0u5PPvn8uq0g8ZFOMmY3P2UO7SqJyPbHIq1OqDr
         0qSpu50GprunFNB1lYXwOoPF7ktFD1R/R6V8KT6s4DVL/NVk2FGiKugDqJ2FoKj6zcMH
         J4g7MsEZ2ezkdtGDm7o26Dic9mdqDPSM6Gtx0jV/0IDUMVZhQZ1nu3I3XMfVodpUpJ2o
         SD/R9YWZiHAckLWSZrxxfGGc9hLXO2T9nJmcm53qdtgM6UQY5v6LtDZ8nkIF166d7PWv
         1kbA==
X-Gm-Message-State: AOJu0Yz6shVipxzPmHW3gA7HAkTqzQLmaIwvBQyPH+Y5Ymgm0L74Ilep
	Ad+zaW2+LRvQd9BFY8Wb8if6feEr4fBkPxExPNY=
X-Google-Smtp-Source: AGHT+IHfPeicL1opYbA37mRkfqAkFJLmBHj9gEA7b/4KXA1o0GERRH7w24kfchkbmVnzPNkQ+7WtAl5KhdO8aWuibfk=
X-Received: by 2002:a05:620a:22b:b0:774:131c:854d with SMTP id
 u11-20020a05620a022b00b00774131c854dmr4099448qkm.72.1695537974912; Sat, 23
 Sep 2023 23:46:14 -0700 (PDT)
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
 <CAOQ4uxjnCdAeWe3W4mp=DwgL49Vwp_FVx4S_V33A3-JLtzJb-g@mail.gmail.com>
 <ZQ75JynY8Y2DqaHD@casper.infradead.org> <CAOQ4uxjOGqWFdS4rU8u9TuLMLJafqMUsQUD3ToY3L9bOsfGibg@mail.gmail.com>
 <CAD_8n+SNKww4VwLRsBdOg+aBc7pNzZhmW9TPcj9472_MjGhWyg@mail.gmail.com>
In-Reply-To: <CAD_8n+SNKww4VwLRsBdOg+aBc7pNzZhmW9TPcj9472_MjGhWyg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 24 Sep 2023 09:46:03 +0300
Message-ID: <CAOQ4uxjM8YTA9DjT5nYW1RBZReLjtLV6ZS3LNOOrgCRQcR2F9A@mail.gmail.com>
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
To: Reuben Hawkins <reubenhwk@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, mszeredi@redhat.com, 
	brauner@kernel.org, lkp@intel.com, linux-fsdevel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, viro@zeniv.linux.org.uk, oe-lkp@lists.linux.dev, 
	ltp@lists.linux.it, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2023 at 6:48=E2=80=AFAM Reuben Hawkins <reubenhwk@gmail.com=
> wrote:
>
>
>
> On Sat, Sep 23, 2023 at 10:48=E2=80=AFAM Amir Goldstein <amir73il@gmail.c=
om> wrote:
>>
>> On Sat, Sep 23, 2023 at 5:41=E2=80=AFPM Matthew Wilcox <willy@infradead.=
org> wrote:
>> >
>> > On Sat, Sep 23, 2023 at 08:56:28AM +0300, Amir Goldstein wrote:
>> > > We decided to deliberately try the change of behavior
>> > > from EINVAL to ESPIPE, to align with fadvise behavior,
>> > > so eventually the LTP test should be changed to allow both.
>> > >
>> > > It was the test failure on the socket that alarmed me.
>> > > However, if we will have to special case socket in
>> > > readahead() after all, we may as well also special case
>> > > pipe with it and retain the EINVAL behavior - let's see
>> > > what your findings are and decide.
>> >
>> > If I read it correctly, LTP is reporting that readhaead() on a socket
>> > returned success instead of an error.  Sockets do have a_ops, right?
>> > It's set to empty_aops in inode_init_always, I think.
>> >
>>
>> Yeh, you are right.
>> I guess the check !f.file->f_mapping->a_ops is completely futile
>> in that code. It's the only place I could find this sort of check
>> except for places like:
>> if (f->f_mapping->a_ops && f->f_mapping->a_ops->direct_IO)
>> which just looks like a coding habit.
>>
>> > It would be nice if we documented somewhere which pointers should be
>> > checked for NULL for which cases ... it doesn't really make sense for
>> > a socket inode to have an i_mapping since it doesn't have pagecache.
>> > But maybe we rely on i_mapping always being set.
>> >
>>
>> I can't imagine that a socket has f_mapping.
>> There must have been something off with this specific bug report,
>> because it was reported on a WIP patch.
>>
>> > Irritatingly, POSIX specifies ESPIPE for pipes, but does not specify
>> > what to do with sockets.  It's kind of a meaningless syscall for
>> > any kind of non-seekable fd.  lseek() returns ESPIPE for sockets
>> > as well as pipes, so I'd see this as an oversight.
>> > https://pubs.opengroup.org/onlinepubs/9699919799/functions/posix_fadvi=
se.html
>> > https://pubs.opengroup.org/onlinepubs/9699919799/functions/lseek.html
>> >
>>
>> Indeed, we thought it wouldn't be too bad to align the
>> readahead errors with those of posix_fadvise.
>> That's why we asked to remove the S_ISFIFO check for v2.
>> But looking again, pipe will get EINVAL for !f_mapping, so the
>> UAPI wasn't changed at all and we were just talking BS all along.
>> Let's leave the UAPI as is.
>>
>> > Of course readahead() is a Linux-specific syscall, so we can do whatev=
er
>> > we want here, but I'm really tempted to just allow readahead() for
>> > regular files and block devices.  Hmm.  Can we check FMODE_LSEEK
>> > instead of (S_ISFILE || S_ISBLK)?
>>
>> I think the f_mapping check should be good.
>> Reuben already said he could not reproduce the LTP failure with
>> v2 that is on Christian's vfs.misc branch.
>>
>> The S_ISREG check I put in the Fixes commit was completely
>> unexplained in the commit message and completely unneeded.
>> Just removing it as was done in v2 is enough.
>>
>> However, v2 has this wrong comment in the commit message:
>> "The change also means that readahead will return -ESPIPE
>>   on FIFO files instead of -EINVAL."
>>
>> We need to remove this comment
>> and could also remove the unneeded !f.file->f_mapping->a_ops
>> check while at it.
>>
>> Thanks,
>> Amir.
>
>
> It looks to me like the following will fix the problem without breaking t=
he tests...
>
> - if (!f.file->f_mapping || !f.file->f_mapping->a_ops ||
> -    !S_ISREG(file_inode(f.file)->i_mode))
> + if (!(f.file->f_mode & FMODE_LSEEK))
>
> ...I'll put this in a v3 patch soon unless somebody can spot any reasons =
why
> this is no good.

I am confused.
I thought you wrote that v2 did not break the test.
Why then is this change to use FMODE_LSEEK needed?
Why is it not enough to leave just
   if (!f.file->f_mapping)

Perhaps my comment to remove the unneeded
 !f.file->f_mapping->a_ops was misunderstood?

Also, in patch v3, you added RVB of Jan, but this is not the
version that Jan has reviewed.

Thanks,
Amir.
