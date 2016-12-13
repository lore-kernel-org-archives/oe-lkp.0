Content-Type: multipart/mixed; boundary="===============4300907784840681658=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ext4] e2ae766c1b: BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/rwsem.c
Date: Tue, 13 Dec 2016 09:47:48 +0100
Message-ID: <20161213084748.GA15362@quack2.suse.cz>
In-Reply-To: <20161212230020.pbl5wnbqqdgcewlg@thunk.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4300907784840681658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 12-12-16 18:00:20, Ted Tso wrote:
> On Mon, Dec 12, 2016 at 03:48:51PM -0700, Ross Zwisler wrote:
> > On Mon, Dec 12, 2016 at 05:37:36PM -0500, Theodore Ts'o wrote:
> > > Is this problem likely to happen in other file systems?  Should I take
> > > this path through the ext4 tree, or would it be better via some other
> > > git tree?
> > > =

> > > 					- Ted
> > =

> > The problem is in the generic DAX code and affects ext4 and xfs equally=
 (ext2
> > doesn't support PMDs).
> =

> Any preferences about how to send this patch to Linus?  This issue is
> the only thing that was causing me to hold off on sending a pull
> request to Linus....

Yeah, just take it unless Dave already did.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============4300907784840681658==--

