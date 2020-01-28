Content-Type: multipart/mixed; boundary="===============3656199730031559530=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: e56b43b971 ("reimplement path_mountpoint() with less magic"): kernel BUG at fs/namei.c:676!
Date: Tue, 28 Jan 2020 13:09:01 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E662495237317A@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <20200128124546.GR23230@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3656199730031559530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: Re: e56b43b971 ("reimplement path_mountpoint() with less magic"):
> kernel BUG at fs/namei.c:676!
> =

> On Tue, Jan 28, 2020 at 04:14:09PM +0800, kernel test robot wrote:
> > Greetings,
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git fixes
> >
> > commit e56b43b971a7c08762fceab330a52b7245041dbc
> > Author:     Al Viro <viro@zeniv.linux.org.uk>
> > AuthorDate: Fri Jan 10 17:17:19 2020 -0500
> > Commit:     Al Viro <viro@zeniv.linux.org.uk>
> > CommitDate: Fri Jan 10 17:43:05 2020 -0500
> >
> >     reimplement path_mountpoint() with less magic
> =

> *blink*
> =

> Which tree are you looking at?  The one you've mentioned has a version
the testing was conducted on "fixed" branch, which has below commits

commit d0cb50185ae942b03c4327be322055d622dc79f6
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Sun Jan 26 09:29:34 2020 -0500

    do_last(): fetch directory ->i_mode and ->i_uid before it's too late

commit 508c8772760d4ef9c1a044519b564710c3684fc5
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Tue Jan 14 22:09:57 2020 -0500

    fix autofs regression caused by follow_managed() changes

commit c64cd6e34ea340adbb2a0a2f99cc884b96dcdca5
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Fri Jan 10 17:17:19 2020 -0500

    reimplement path_mountpoint() with less magic

> of that commit with fix folded in, and had it there for nearly two weeks -
> replacement is
thanks, this is a problem we will look into, why it reports out old commit. =


> commit c64cd6e34ea340adbb2a0a2f99cc884b96dcdca5
> Author:     Al Viro <viro@zeniv.linux.org.uk>
> AuthorDate: Fri Jan 10 17:17:19 2020 -0500
> Commit:     Al Viro <viro@zeniv.linux.org.uk>
> CommitDate: Wed Jan 15 01:36:06 2020 -0500
> =

>     reimplement path_mountpoint() with less magic
> =

> Moreover, that fixed commit has been pulled into mainline since then, so
Typically if the head of mainline works without the same issue, we should n=
ot report it.
Kindly ignore this report. We will also check the bisection detail to under=
stand
what can possibly be wrong here.

> whatever tree this has come from would be impossible to merge without
> a mainline conflict...
> =

> Please, explain.
--===============3656199730031559530==--

