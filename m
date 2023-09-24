Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F69D2E6
	for <oe-lkp@lists.linux.dev>; Sun, 24 Sep 2023 15:32:42 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7ab7e87f866so1201431241.1
        for <oe-lkp@lists.linux.dev>; Sun, 24 Sep 2023 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695569561; x=1696174361; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSJZSZOUN6KSZ1Fr0SU6EUu5NSVFxvEmO17713Eu80I=;
        b=a4WK/EHALv0RlinW0lasvNkjZJ6cJZ5rbEfmP9F2Sx+eOz9t2vEIaH3mjcZlmS7ArM
         +0LU+eZf4t3QfLG0h4azUod6L/x8NaxowE2g5EsOgestdVCQsUXdj/aMk+k9dwMuVveo
         5VY5HvXRPMo30F+L2tv99FwVId822CKbv4c0w/887unRkXimpMNcnnT8PT6rnw34mepF
         zBtkDKxRszCSgKGwqtOFxNMQWTRvkq/xOXSYLbM/gVRQ8F3EYfYOU9o8P2YA7adEK31q
         LSxvB/lCmc7NW1EyfgEYz1lLAUOfF2kkLljtErgQA0uooaA+HUKt+HkYJAGWp1ihamsT
         H+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695569561; x=1696174361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSJZSZOUN6KSZ1Fr0SU6EUu5NSVFxvEmO17713Eu80I=;
        b=AEBQEzchLjFCtAS0xE38y14qWB+nsIH7CDq02E9bBne8rZPteXiQ50DrjgQ8Kp2wXu
         CKq3GqzPtat6JyuTMn6Pp/1KSTy1lhQW6nJRSBmiL9tWMs69P0anh1ETKAKR+RKvkLvS
         tHejyMLYKRrjOM8PeUmnJSLlrhi32AHEp8qYHPPSSC59GCHl8IKhl9cGvpLziuTwgazr
         azw1aHVLFrCcKHIV0TThamS0RkJKut6utxxzpcqeghZac/3q8w2YTtxvkbV07ATpqnSQ
         1vSX5+B/NuNWgiC5pLkueQN9yfuFhsS7iIv864EmK4jzmTA6qoHbn0s8H8lM+HgWie8K
         cqjQ==
X-Gm-Message-State: AOJu0YzuGiV8npWlqkEcejUqhZUs/cQibjOIsCDEUv++1ozt2yL0IpFe
	tmzkMzAILq4ja25788GK+njRjf1pS+aAVAO7Aog=
X-Google-Smtp-Source: AGHT+IGaW7Sz7LnHaiHMPxCDOprArU6bv7d1igX5IF19CZvB5oCjZWd8rNuEQr9WVblupNky/X8iMDYXlIT9ved+/kE=
X-Received: by 2002:a67:f947:0:b0:44d:3f96:6c61 with SMTP id
 u7-20020a67f947000000b0044d3f966c61mr2463076vsq.30.1695569561610; Sun, 24 Sep
 2023 08:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOQ4uxhc8q=GAuL9OPRVOr=mARDL3TExPY0Zipij1geVKknkkQ@mail.gmail.com>
 <CAD_8n+TpZF2GoE1HUeBLs0vmpSna0yR9b+hsd-VC1ZurTe41LQ@mail.gmail.com>
 <ZQ1Z_JHMPE3hrzv5@yuki> <CAD_8n+ShV=HJuk5v-JeYU1f+MAq1nDz9GqVmbfK9NpNThRjzSg@mail.gmail.com>
 <CAOQ4uxjnCdAeWe3W4mp=DwgL49Vwp_FVx4S_V33A3-JLtzJb-g@mail.gmail.com>
 <ZQ75JynY8Y2DqaHD@casper.infradead.org> <CAOQ4uxjOGqWFdS4rU8u9TuLMLJafqMUsQUD3ToY3L9bOsfGibg@mail.gmail.com>
 <CAD_8n+SNKww4VwLRsBdOg+aBc7pNzZhmW9TPcj9472_MjGhWyg@mail.gmail.com>
 <CAOQ4uxjM8YTA9DjT5nYW1RBZReLjtLV6ZS3LNOOrgCRQcR2F9A@mail.gmail.com>
 <CAOQ4uxjmyfKmOxP0MZQPfu8PL3KjLeC=HwgEACo21MJg-6rD7g@mail.gmail.com> <ZRBHSACF5NdZoQwx@casper.infradead.org>
In-Reply-To: <ZRBHSACF5NdZoQwx@casper.infradead.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 24 Sep 2023 18:32:30 +0300
Message-ID: <CAOQ4uxjmoY_Pu_JiY9U1TAa=Tz1Mta3aH=wwn192GOfRuvLJQw@mail.gmail.com>
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
To: Matthew Wilcox <willy@infradead.org>, kernel test robot <oliver.sang@intel.com>
Cc: Reuben Hawkins <reubenhwk@gmail.com>, brauner@kernel.org, Cyril Hrubis <chrubis@suse.cz>, 
	mszeredi@redhat.com, lkp@intel.com, linux-fsdevel@vger.kernel.org, 
	viro@zeniv.linux.org.uk, oe-lkp@lists.linux.dev, ltp@lists.linux.it, 
	Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2023 at 5:27=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Sun, Sep 24, 2023 at 02:47:42PM +0300, Amir Goldstein wrote:
> > Since you joined the discussion, you have the opportunity to agree or
> > disagree with our decision to change readahead() to ESPIPE.
> > Judging  by your citing of lseek and posix_fadvise standard,
> > I assume that you will be on board?
>
> I'm fine with returning ESPIPE (it's like ENOTTY in a sense).  but
> that's not what kbuild reported:

kbuild report is from v1 patch that was posted to the list
this is not the patch (v2) that is applied to vfs.misc
and has been in linux-next for a few days.

Oliver,

Can you say the failure (on socket) is reproduced on
https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc?

I would expect the pipe test to fail for getting ESPIPE
but according to Reuben the socket test does not fail.

>
> readahead01.c:62: TFAIL: readahead(fd[0], 0, getpagesize()) succeeded
>
> 61:     fd[0] =3D SAFE_SOCKET(AF_INET, SOCK_STREAM, 0);
> 62:     TST_EXP_FAIL(readahead(fd[0], 0, getpagesize()), EINVAL);
>
> I think LTP would report 'wrong error code' rather than 'succeeded'
> if it were returning ESPIPE.
>
> I'm not OK with readahead() succeeding on a socket.

Agree. Reuben reported that this does not happen on v2
although I cannot explain why it was reported on v1...

> I think that should
> also return ESPIPE.  I think posix_fadvise() should return ESPIPE on a
> socket too, but reporting bugs to the Austin Group seems quite painful.
> Perhaps somebody has been through this process and can do that for us?
>

This is Reuben's first kernel patch.
Let's agree that changing the standard of posix_fadvise() for socket is
beyond the scope of his contribution :)

Thanks,
Amir.
