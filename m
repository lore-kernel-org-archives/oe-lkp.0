Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C313702
	for <oe-lkp@lists.linux.dev>; Fri, 14 Jul 2023 11:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689335477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHYKpItuEcJuo5Jv3chYxiDW/iXWwzUQH5pKsFYaAmw=;
	b=L8wnRMNZifC1c53LgoWHxnbCJh1MMmoT0syjf1FsvnXsxjlyVtmlqIh/o2AmLISRskG2ig
	LvYiJg0dqg45ABDf6DLB5ardQJLKq2giywjEwmiZk/ktsxt+VNeb3GnunjUtKZUsf51YAG
	ihmaNLzejGUL8AhfUSYv0sIdN8Mk3rQ=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-BUt2Jv1PNDCF67MJiBaUfQ-1; Fri, 14 Jul 2023 07:51:16 -0400
X-MC-Unique: BUt2Jv1PNDCF67MJiBaUfQ-1
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-78f62807a12so197878241.3
        for <oe-lkp@lists.linux.dev>; Fri, 14 Jul 2023 04:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689335476; x=1691927476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHYKpItuEcJuo5Jv3chYxiDW/iXWwzUQH5pKsFYaAmw=;
        b=AIRwpBOPxBnAIg19qRHUCKq2v/RDevhsLh3zQDQA8VwpTFiJfeuj0vGC3YYfOyPQ5s
         sBvwHGdLO+NSvV101sT7mT4Q8To3Uhy4AcFbBQfJFQ74JSkzPO/1wwOI0mjTcBvXJbgc
         Urt0CE/aI8xrnD2tpgd/TY5ktfH4H2ZyNzZ6y1+P5uMSiYzFhUrcfbNxEpW7ytPkex/E
         vMs/2EFWinM0ol70kPYCZ4vkUeH0K9ViX5smO/k2/jMAs80rLDpAXkXowowuF+XJc5Yl
         n7bwS95BZQfdcNyQwZhrNP2PV514rOSiTbreaRNL+0VMjwjwq+BgRYqhhxv9QRyR/O9B
         QAZQ==
X-Gm-Message-State: ABy/qLZB/5Oei5kazTdQdEC20L4m92CR9VJeUIJ7z42IgpuIMBXcpy7j
	gZjUUhbhgxvvWyEvTtRYA1GLHFhyA1pD9SD78fR2OdKfd11BbBnmBuBcnBPj3uk4Dont1vwudo5
	JraCymM7+8nBrTRf68J5lYiOGQTtEKSS6
X-Received: by 2002:a05:6102:356d:b0:443:6a86:7cdb with SMTP id bh13-20020a056102356d00b004436a867cdbmr2336852vsb.26.1689335475702;
        Fri, 14 Jul 2023 04:51:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEjAug34qhiq9imIKX0hj5b4gr40mdR/NGOFzRruEDaaBApIulRCMsngeXKHA4c6mKq6RlNDiK1p89T/CJQsZ8=
X-Received: by 2002:a05:6102:356d:b0:443:6a86:7cdb with SMTP id
 bh13-20020a056102356d00b004436a867cdbmr2336824vsb.26.1689335475401; Fri, 14
 Jul 2023 04:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307132107.2ce4ea2f-oliver.sang@intel.com> <20230713150923.GA28246@lst.de>
 <ZLAZn_SBmoIFG5F5@yuki>
In-Reply-To: <ZLAZn_SBmoIFG5F5@yuki>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 14 Jul 2023 13:50:58 +0200
Message-ID: <CAASaF6xbgSf+X+SF8wLjFrsMA4=XxHti0SXDZQP1ZqdGYp4aUQ@mail.gmail.com>
Subject: Re: [LTP] [linus:master] [iomap] 219580eea1: ltp.writev07.fail
To: Cyril Hrubis <chrubis@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com, 
	Ilya Dryomov <idryomov@gmail.com>, Miklos Szeredi <mszeredi@redhat.com>, Chao Yu <chao@kernel.org>, 
	oe-lkp@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Xiubo Li <xiubli@redhat.com>, 
	Trond Myklebust <trond.myklebust@hammerspace.com>, ltp@lists.linux.it, lkp@intel.com, 
	Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, kernel test robot <oliver.sang@intel.com>, 
	Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Hannes Reinecke <hare@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 5:38=E2=80=AFPM Cyril Hrubis <chrubis@suse.cz> wrot=
e:
>
> Hi!
> > I can't reproduce this on current mainline.  Is this a robust failure
> > or flapping test?  Especiall as the FAIL conditions look rather
> > unrelated.

It's consistently reproducible for me on xfs with HEAD at:
eb26cbb1a754 ("Merge tag 'platform-drivers-x86-v6.5-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86")

>
> Actually the test is spot on, the difference is that previously the
> error was returned form the iomap_file_buffered_write() only if we
> failed with the first buffer from the iov, now we always return the
> error and we do not advance the offset.
>
> The change that broke it:
>
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 063133ec77f4..550525a525c4 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -864,16 +864,19 @@ iomap_file_buffered_write(struct kiocb *iocb, struc=
t iov_iter *i,
>                 .len            =3D iov_iter_count(i),
>                 .flags          =3D IOMAP_WRITE,
>         };
> -       int ret;
> +       ssize_t ret;
>
>         if (iocb->ki_flags & IOCB_NOWAIT)
>                 iter.flags |=3D IOMAP_NOWAIT;
>
>         while ((ret =3D iomap_iter(&iter, ops)) > 0)
>                 iter.processed =3D iomap_write_iter(&iter, i);
> -       if (iter.pos =3D=3D iocb->ki_pos)
> +
> +       if (unlikely(ret < 0))
>                 return ret;
> -       return iter.pos - iocb->ki_pos;
> +       ret =3D iter.pos - iocb->ki_pos;
> +       iocb->ki_pos +=3D ret;
> +       return ret;
>  }
>
> I suppose that we shoudl fix is with something as:
>
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index adb92cdb24b0..bfb39f7bc303 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -872,11 +872,12 @@ iomap_file_buffered_write(struct kiocb *iocb, struc=
t iov_iter *i,
>         while ((ret =3D iomap_iter(&iter, ops)) > 0)
>                 iter.processed =3D iomap_write_iter(&iter, i);
>
> +       iocb->ki_pos +=3D iter.pos - iocb->ki_pos;
> +
>         if (unlikely(ret < 0))
>                 return ret;
> -       ret =3D iter.pos - iocb->ki_pos;
> -       iocb->ki_pos +=3D ret;
> -       return ret;
> +
> +       return iter.pos - iocb->ki_pos;

Replacing "ret" with "iter.pos - iocb->ki_pos" here doesn't look
equivalent to original,
because you already updated "iocb->ki_pos" few lines above.

Wouldn't it be enough to bring the old condition back?

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index adb92cdb24b0..7cc9f7274883 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -872,7 +872,7 @@ iomap_file_buffered_write(struct kiocb *iocb,
struct iov_iter *i,
        while ((ret =3D iomap_iter(&iter, ops)) > 0)
                iter.processed =3D iomap_write_iter(&iter, i);

-       if (unlikely(ret < 0))
+       if (unlikely(iter.pos =3D=3D iocb->ki_pos))
                return ret;
        ret =3D iter.pos - iocb->ki_pos;
        iocb->ki_pos +=3D ret;

(with hunk above applied)
# ./writev07
tst_test.c:1526: TINFO: Timeout per run is 0h 00m 30s
writev07.c:50: TINFO: starting test with initial file offset: 0
writev07.c:94: TINFO: writev() has written 64 bytes
writev07.c:105: TPASS: file has expected content
writev07.c:116: TPASS: offset at 64 as expected
writev07.c:50: TINFO: starting test with initial file offset: 65
writev07.c:94: TINFO: writev() has written 64 bytes
writev07.c:105: TPASS: file has expected content
writev07.c:116: TPASS: offset at 129 as expected
writev07.c:50: TINFO: starting test with initial file offset: 4096
writev07.c:94: TINFO: writev() has written 64 bytes
writev07.c:105: TPASS: file has expected content
writev07.c:116: TPASS: offset at 4160 as expected
writev07.c:50: TINFO: starting test with initial file offset: 4097
writev07.c:94: TINFO: writev() has written 64 bytes
writev07.c:105: TPASS: file has expected content
writev07.c:116: TPASS: offset at 4161 as expected




>  }
>  EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
>
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>

