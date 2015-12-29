Content-Type: multipart/mixed; boundary="===============3603642216390923635=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [memdup_user_nul] kernel BUG at mm/slab.c:2735!
Date: Tue, 29 Dec 2015 14:57:09 +0000
Message-ID: <20151229145709.GB9938@ZenIV.linux.org.uk>
In-Reply-To: <20151229143946.GA9938@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3603642216390923635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2015 at 02:39:47PM +0000, Al Viro wrote:
> On Tue, Dec 29, 2015 at 08:38:43PM +0800, Fengguang Wu wrote:
> > Hi Al,
> > =

> > It looks this patch has various impacts. Here are some more bug message=
s.
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.misc
> > =

> > commit c7af9d5728bed29ef614324e67e066896d087c8f
> =

> The version in vfs.git has been ad8e00e50cbda2ce3831a4badc239ad014eec69 f=
or
> a couple of days already...

FWIW, the difference (and the source of those bugs) is that the earlier
variant had missed the fact that value of kbuf gets modified between the
allocation and freeing, so it ended up doing kfree() on the tail of kmalloc=
ed
buffer.

--===============3603642216390923635==--

