Content-Type: multipart/mixed; boundary="===============6407644537533545896=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [vfs mnt_set_mountpoint] invalid opcode: 0000 [#1] DEBUG_PAGEALLOC
Date: Tue, 19 Aug 2014 20:52:06 -0700
Message-ID: <878umju8bd.fsf@x220.int.ebiederm.org>
In-Reply-To: <20140819114738.GB18960@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============6407644537533545896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fengguang Wu <fengguang.wu@intel.com> writes:

> // Fix email address for Eric and add another oops message.
> // This commit seem to generate all kinds of oops.

My apologies about the email.  This patch has taken so long to get
somewhere that email address has bit-rotted.

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 89f7ca1af15bdfe7a6aed343032a84af2a69f736
> Author:     Eric W. Biederman <ebiederman@twitter.com>
> AuthorDate: Sun Sep 22 19:37:01 2013 -0700
> Commit:     Al Viro <viro@zeniv.linux.org.uk>
> CommitDate: Sun Aug 17 07:02:00 2014 -0400
>
>     vfs: Keep a list of mounts on a mount point
>     =

>     To spot any possible problems call BUG if a mountpoint
>     is put when it's list of mounts is not empty.
>     =

>     AV: use hlist instead of list_head

Hugh Dickins has a fix for an unitialized field he has sent to Stephen
Rothwell.

>     Reviewed-by: Miklos Szeredi <miklos@szeredi.hu>
>     Signed-off-by: Eric W. Biederman <ebiederman@twitter.com>
>     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

I expect Al will sort things out when he get home from kernel summit.

Eric

--===============6407644537533545896==--

