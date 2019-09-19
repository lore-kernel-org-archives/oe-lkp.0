Content-Type: multipart/mixed; boundary="===============8439456010016849247=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [xfs] 27d1053021: xfstests.xfs.173.fail
Date: Thu, 19 Sep 2019 23:56:25 +0200
Message-ID: <20190919215625.GA13358@lst.de>
In-Reply-To: <20190919174705.GA9622@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8439456010016849247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2019 at 07:47:05PM +0200, Christoph Hellwig wrote:
> On Thu, Sep 19, 2019 at 09:46:02AM +0800, kernel test robot wrote:
> > FYI, we noticed the following commit (built with gcc-7):
> > =

> > commit: 27d10530217ee6d6a0388014fd773820ee354ce5 ("xfs: remove the unus=
ed XFS_ALLOC_USERDATA flag")
> =

> Well, this does not make a whole lot of sense, given that the patch
> literally just removes an unused flag.  that being said that test has
> been father flakey for me for a long time.

But the weird part is that it actually reproduces here with 1k block
size file system despite make no sense at all..

--===============8439456010016849247==--

