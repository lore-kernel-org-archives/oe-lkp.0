Content-Type: multipart/mixed; boundary="===============4942050313716264466=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [ext4] e2ae766c1b: BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/rwsem.c
Date: Mon, 12 Dec 2016 18:00:20 -0500
Message-ID: <20161212230020.pbl5wnbqqdgcewlg@thunk.org>
In-Reply-To: <20161212224851.GA691@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4942050313716264466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2016 at 03:48:51PM -0700, Ross Zwisler wrote:
> On Mon, Dec 12, 2016 at 05:37:36PM -0500, Theodore Ts'o wrote:
> > Is this problem likely to happen in other file systems?  Should I take
> > this path through the ext4 tree, or would it be better via some other
> > git tree?
> > =

> > 					- Ted
> =

> The problem is in the generic DAX code and affects ext4 and xfs equally (=
ext2
> doesn't support PMDs).

Any preferences about how to send this patch to Linus?  This issue is
the only thing that was causing me to hold off on sending a pull
request to Linus....

						- Ted

--===============4942050313716264466==--

