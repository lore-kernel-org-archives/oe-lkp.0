Content-Type: multipart/mixed; boundary="===============6473183027864919716=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [nfs] mount.nfs: an incorrect mount option was specified
Date: Mon, 09 Feb 2015 15:33:20 +0100
Message-ID: <20150209143320.GA17820@lst.de>
In-Reply-To: <1423470942.5968.72.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6473183027864919716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 09, 2015 at 04:35:42PM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.infradead.org/users/hch/pnfs.git pnfs-testing
> commit 418f5019f1a8cd6fc50db11303e5a9297522d814 ("nfs: force version 4.1")
> =

> Our test script uses the following command line:
> =

> $ mount.nfs -o v3,nolock <nfs service> <directory>
> =

> And found something as follow in the stderr after the commit
> =

> mount.nfs: an incorrect mount option was specified

This is a testing branch not really intended for Linux, and this
is a side effect.  CAn you drop this branch (just the branch, and not the
repository) from the automated testing?

--===============6473183027864919716==--

