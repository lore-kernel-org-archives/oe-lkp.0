Content-Type: multipart/mixed; boundary="===============6555507027402826307=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [parallel lookups machinery, part 2] 96352435af: kernel BUG at mm/slab.c:2599!
Date: Mon, 18 Apr 2016 12:07:31 +0100
Message-ID: <20160418110731.GB25498@ZenIV.linux.org.uk>
In-Reply-To: <878u0bqtjk.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6555507027402826307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 03:12:47PM +0800, Huang, Ying wrote:

> That is, there is same issue for T1, but no such issue for T2.
> =

> > How reproducible it is and how certain you are that it's not there on
> > the parent commit?
> =

> The result is quite stable for tens tests for parents and the first bad
> commit.

Nuts...  Try vfs.git#T3, please - the only way this could cause memory
corruption, AFAICS, is some really weird caller of d_add() or d_splice_alia=
s(),
passing it a dentry with bogus ->d_parent...

--===============6555507027402826307==--

