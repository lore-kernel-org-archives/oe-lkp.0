Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC7AEC8
	for <oe-lkp@lists.linux.dev>; Tue,  3 Oct 2023 05:48:22 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4526f0bdf72so269976137.1
        for <oe-lkp@lists.linux.dev>; Mon, 02 Oct 2023 22:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696312102; x=1696916902; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9I6c5Iwr/ba0wcKssKanfPKS8G9JmXveu7lH25s+r4=;
        b=m//fuQdaS2PGP+QT15/mHULV2E7oKMbTac/koKdt84ATGyQKfU2Y6gIx/SdxoAlXVJ
         9JmMIL+ry+4/UZUh2VwvMBXNeY3Zgh5jJzO9KdX0kBDBFBQhQbzhN7QyYlGG735Cb2Lg
         MqB2QabcQy4r6QY4D5UpeutmQ6C/fgZh43tK97bEyrjNiuPngttKI+a2WQjCCd/KYme4
         nU/JCaA3GRyZwoFBcnaktVGEg1lw20jdg3OL/1lFNVEN+vfCniLozyB9J2JoeyFXbJns
         CeEzWLw1Cmp01AzxUgngk+0UmkUAJj9kwq2p9lwTQ9SB+spTbZqSe44W3xN5oMCuzJbr
         eOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696312102; x=1696916902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9I6c5Iwr/ba0wcKssKanfPKS8G9JmXveu7lH25s+r4=;
        b=GkCmY9/uXs93yhtXgKES6QvQ7alW6vzeF8w+aJzHKkbUo9dm6iT4/qik8Q8LlJfMwT
         YT1OG8SLBgCdNoiReaRkD3kNakODj+odvIsTq8UM30eUwVGFTOulvR6K6OyXIJxcoMOA
         wDaGptYJWDDW7tF7doqyq1OG45fhWdQATCbHI/33Cl8Qpsgrjw2LXtKfQUqg6J0d7r2b
         cK+PEX2dwOpwJ7vLd32NeaBla7+36jNjLwAxg/SYfiTTjWlhuOfalw9yHTSpajfyrR8t
         JarvcezjweDTd19rO2vMA8SF57V+AOuy2D8xaFEH2y7gp+M3XsQ39DUpj+/koXKSmnr/
         l+ow==
X-Gm-Message-State: AOJu0YzAkSi2UsXKupwQFl/88N03mWUyLRKi3QrmYmOMQufOSTOhJdZW
	q0HX9Neen9Ia2yOTkAkTD1+8VuwZIVS2aBjs0Us=
X-Google-Smtp-Source: AGHT+IE/TD/7gci8Ynz+vg+opW2HyHCnA+bveARviO4k4TBQ1IQj0346GBakn5zu3Yf6vdufRdiE1l1vlq4VW0iSlsI=
X-Received: by 2002:a05:6102:104:b0:452:88da:2e1f with SMTP id
 z4-20020a056102010400b0045288da2e1fmr11572759vsq.21.1696312101940; Mon, 02
 Oct 2023 22:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231003015704.2415-1-reubenhwk@gmail.com>
In-Reply-To: <20231003015704.2415-1-reubenhwk@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Oct 2023 08:48:10 +0300
Message-ID: <CAOQ4uxi04iyf-9tnQ3vREvBwMPK-MaDVWi0KcqTNufodsxDFZg@mail.gmail.com>
Subject: Re: [PATCH v4] vfs: fix readahead(2) on block devices
To: Reuben Hawkins <reubenhwk@gmail.com>
Cc: willy@infradead.org, chrubis@suse.cz, mszeredi@redhat.com, 
	brauner@kernel.org, lkp@intel.com, linux-fsdevel@vger.kernel.org, 
	oliver.sang@intel.com, viro@zeniv.linux.org.uk, oe-lkp@lists.linux.dev, 
	ltp@lists.linux.it
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 3, 2023 at 4:57=E2=80=AFAM Reuben Hawkins <reubenhwk@gmail.com>=
 wrote:
>
> Readahead was factored to call generic_fadvise.  That refactor added an
> S_ISREG restriction which broke readahead on block devices.
>
> In addition to S_ISREG, this change checks S_ISBLK to fix block device
> readahead.  There is no change in behavior with any file type besides blo=
ck
> devices in this change.
>
> Fixes: 3d8f7615319b ("vfs: implement readahead(2) using POSIX_FADV_WILLNE=
ED")
> Signed-off-by: Reuben Hawkins <reubenhwk@gmail.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Christian,

We've had a lot of back and forth on this patch.
I've asked Reuben to post this minimal and backportable patch
which should replace the one that is currently on the head of
vfs.misc in order to only fix the regression without other changes
of behavior.

If you happen to send any vfs fixes to 6.6, this one can also
be included but no need to rush.

It would be wrong to mix the regression fix with other changes of
behavior because the latter we may be  forced to revert in the future.

Either Reuben or I will follow up later with patches to change the
behavior of posix_fadvise and readahead(2) for pipes and sockets
as suggested by Matthew.

Thanks,
Amir.

> ---
>  mm/readahead.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/readahead.c b/mm/readahead.c
> index e815c114de21..6925e6959fd3 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -735,7 +735,8 @@ ssize_t ksys_readahead(int fd, loff_t offset, size_t =
count)
>          */
>         ret =3D -EINVAL;
>         if (!f.file->f_mapping || !f.file->f_mapping->a_ops ||
> -           !S_ISREG(file_inode(f.file)->i_mode))
> +           (!S_ISREG(file_inode(f.file)->i_mode) &&
> +           !S_ISBLK(file_inode(f.file)->i_mode)))
>                 goto out;
>
>         ret =3D vfs_fadvise(f.file, offset, count, POSIX_FADV_WILLNEED);
> --
> 2.34.1
>
