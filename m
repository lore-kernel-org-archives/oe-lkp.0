Content-Type: multipart/mixed; boundary="===============1416426280387933554=="
MIME-Version: 1.0
From: Jan Stancek <jstancek@redhat.com>
To: lkp@lists.01.org
Subject: Re: [LTP] [xfs] 73e5fff98b: kmsg.dev/zero:Can't_open_blockdev
Date: Wed, 13 Nov 2019 01:16:45 -0500
Message-ID: <975334005.11814790.1573625805426.JavaMail.zimbra@redhat.com>
In-Reply-To: <e38bc7a8505571bbb750fc0198ec85c892ac7b3a.camel@themaw.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1416426280387933554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



----- Original Message -----
> > > > # mount -t xfs /dev/zero /mnt/xfs
> > =

> > Assuming that is what is being done ...
> =

> Arrrh, of course, a difference between get_tree_bdev() and
> mount_bdev() is that get_tree_bdev() prints this message when
> blkdev_get_by_path() fails whereas mount_bdev() doesn't.
> =

> Both however do return an error in this case so the behaviour
> is the same.
> =

> So I'm calling this not a problem with the subject patch.
> =

> What needs to be done to resolve this in ltp I don't know?

I think that's question for kernel test robot, which has this extra
check built on top. ltp itself doesn't treat this extra message as FAIL.

Jan

--===============1416426280387933554==--

