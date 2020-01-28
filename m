Content-Type: multipart/mixed; boundary="===============2633206004250217521=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: e56b43b971 ("reimplement path_mountpoint() with less magic"): kernel BUG at fs/namei.c:676!
Date: Tue, 28 Jan 2020 12:45:46 +0000
Message-ID: <20200128124546.GR23230@ZenIV.linux.org.uk>
In-Reply-To: <5e2fed51.lXNhkot2j7mH7hZM%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2633206004250217521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 04:14:09PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git fixes
> =

> commit e56b43b971a7c08762fceab330a52b7245041dbc
> Author:     Al Viro <viro@zeniv.linux.org.uk>
> AuthorDate: Fri Jan 10 17:17:19 2020 -0500
> Commit:     Al Viro <viro@zeniv.linux.org.uk>
> CommitDate: Fri Jan 10 17:43:05 2020 -0500
> =

>     reimplement path_mountpoint() with less magic

*blink*

Which tree are you looking at?  The one you've mentioned has a version
of that commit with fix folded in, and had it there for nearly two weeks -
replacement is
commit c64cd6e34ea340adbb2a0a2f99cc884b96dcdca5
Author:     Al Viro <viro@zeniv.linux.org.uk>
AuthorDate: Fri Jan 10 17:17:19 2020 -0500
Commit:     Al Viro <viro@zeniv.linux.org.uk>
CommitDate: Wed Jan 15 01:36:06 2020 -0500

    reimplement path_mountpoint() with less magic

Moreover, that fixed commit has been pulled into mainline since then, so
whatever tree this has come from would be impossible to merge without
a mainline conflict...

Please, explain.
--===============2633206004250217521==--

