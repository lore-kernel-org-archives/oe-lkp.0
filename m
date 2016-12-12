Content-Type: multipart/mixed; boundary="===============5634570833330837237=="
MIME-Version: 1.0
From: Ross Zwisler <ross.zwisler@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] e2ae766c1b: BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/rwsem.c
Date: Mon, 12 Dec 2016 15:48:51 -0700
Message-ID: <20161212224851.GA691@linux.intel.com>
In-Reply-To: <20161212223735.t56oui7vlqhquaks@thunk.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5634570833330837237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2016 at 05:37:36PM -0500, Theodore Ts'o wrote:
> Is this problem likely to happen in other file systems?  Should I take
> this path through the ext4 tree, or would it be better via some other
> git tree?
> =

> 					- Ted

The problem is in the generic DAX code and affects ext4 and xfs equally (ex=
t2
doesn't support PMDs).

--===============5634570833330837237==--

